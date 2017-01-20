/***************************************************
  This is our GFX example for the Adafruit ILI9341 Breakout and Shield
  ----> http://www.adafruit.com/products/1651

  Check out the links above for our tutorials and wiring diagrams
  These displays use SPI to communicate, 4 or 5 pins are required to
  interface (RST is optional)
  Adafruit invests time and resources providing this open source code,
  please support Adafruit and open-source hardware by purchasing
  products from Adafruit!

  Written by Limor Fried/Ladyada for Adafruit Industries.
  MIT license, all text above must be included in any redistribution
 ****************************************************/

/*
I2C addresses:
Audio: 0x19
IO_EXP: 0x20 (read?)
IO_EXP: 0x40 (write?)
ADXL: 0x53
BME230: 0x77
*/

// https://github.com/CCHS-Melbourne/iotuz-esp32-hardware/wiki has hardware mapping details

// LCD brightness control and touchscreen CS are behind the port
// expander, as well as both push buttons
#define I2C_EXPANDER 0x20 //0100000 (7bit) address of the IO expander on i2c bus

/* Port expander PCF8574, access via I2C on */
#define I2CEXP_ACCEL_INT    0x01 // (In)
#define I2CEXP_A_BUT	    0x02 // (In)
#define I2CEXP_B_BUT	    0x04 // (In)
#define I2CEXP_ENC_BUT	    0x08 // (In)
#define I2CEXP_SD_CS	    0x10 // (Out)
#define I2CEXP_TOUCH_INT    0x20 // (In)
#define I2CEXP_TOUCH_CS	    0x40 // (Out)
#define I2CEXP_LCD_BL_CTR   0x80 // (Out)

// Keep track of which output bits are on/off
uint8_t i2cexp = 0;

#include "SPI.h"
#include "Adafruit_GFX.h"
// Support for LCD screen
// The latest version of that library may not be up to date and miss a patch for ESP32
// which will cause a compilation error:
// Adafruit_ILI9341.cpp:113:3: error: 'mosiport' was not declared in this scope
// If so, get the latest version from github, or just patch this single line
// https://github.com/adafruit/Adafruit_ILI9341/blob/master/Adafruit_ILI9341.cpp#L98
#include "Adafruit_ILI9341.h"
#include <Wire.h>

// Support for APA106 RGB LEDs
// Except this library does not work with APA106 (yet). FIXME
#include "Adafruit_NeoPixel.h"

// TFT + Touch Screen Setup Start
// These are the minimal changes from v0.1 to get the LCD working
#define TFT_DC 4
#define TFT_CS 19
#define TFT_RST 32
// SPI Pins are shared by TFT, touch screen, SD Card
#define MISO 12
#define MOSI 13
#define SPI_CLK 14

Adafruit_ILI9341 tft = Adafruit_ILI9341(TFT_CS, TFT_DC, TFT_RST);
// TFT Setup End

// Touch screen
#include "XPT2046_Touchscreen.h"
// Touch screen select is on port expander line 6, not directly connected, so the library
// cannot toggle it directly. It however requires a CS pin, so I'm giving it 33, a spare IO
// pin so that it doesn't break anything else.
#define TS_CS_PIN  33
// similarly, the interrupt pin is connected to the port expander, so the library can't use it
// I'm told it is possible to pass an interrupt through the IO expander, but I'm not doing this yet.
//#define TS_IRQ_PIN  0

XPT2046_Touchscreen ts(TS_CS_PIN);  // Param 2 - NULL - No interrupts
//XPT2046_Touchscreen ts(TS_CS_PIN, TS_IRQ_PIN);  // Param 2 - Touch IRQ Pin - interrupt enabled polling



// APA106 is somewhat compatible with WS2811 or WS2812 (but not quite, timing is different?)
// https://learn.adafruit.com/adafruit-neopixel-uberguide/
// This should work, but currently does not due to lack of support for ESP32 in the adafruit lib
#define RGB_LED_PIN 23
#define NUMPIXELS 2
Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NUMPIXELS, RGB_LED_PIN, NEO_GRB + NEO_KHZ800);

// Joystick Setup
#define JOYSTICK_X_PIN 39
#define JOYSTICK_Y_PIN 34
#define JOYSTICK_BUT_PIN 0



typedef enum {
    TEXT = 0,
    FILL = 1,
    LINES = 2,
    HORIZVERT = 3,
    RECT = 4,
    RECTFILL = 5,
    CIRCLE = 6,
    CIRCFILL = 7,
    TRIANGLE = 8,
    TRIFILL = 9,
    ROUNDREC = 10,
    ROUNDRECFILL = 11,
} LCDtest;


unsigned long testFillScreen() {
  unsigned long start = micros();
  tft.fillScreen(ILI9341_BLACK);
  yield();
  tft.fillScreen(ILI9341_RED);
  yield();
  tft.fillScreen(ILI9341_GREEN);
  yield();
  tft.fillScreen(ILI9341_BLUE);
  yield();
  tft.fillScreen(ILI9341_BLACK);
  yield();
  return micros() - start;
}

unsigned long testText() {
  tft.fillScreen(ILI9341_BLACK);
  unsigned long start = micros();
  tft.setCursor(0, 0);
  tft.setTextColor(ILI9341_WHITE);  tft.setTextSize(1);
  tft.println("Hello World!");
  tft.setTextColor(ILI9341_YELLOW); tft.setTextSize(2);
  tft.println(1234.56);
  tft.setTextColor(ILI9341_RED);    tft.setTextSize(3);
  tft.println(0xDEADBEEF, HEX);
  tft.println();
  tft.setTextColor(ILI9341_GREEN);
  tft.setTextSize(5);
  tft.println("Groop");
  tft.setTextSize(2);
  tft.println("I implore thee,");
  tft.setTextSize(1);
  tft.println("my foonting turlingdromes.");
  tft.println("And hooptiously drangle me");
  tft.println("with crinkly bindlewurdles,");
  tft.println("Or I will rend thee");
  tft.println("in the gobberwarts");
  tft.println("with my blurglecruncheon,");
  tft.println("see if I don't!");
  return micros() - start;
}

unsigned long testLines(uint16_t color) {
  unsigned long start, t;
  int           x1, y1, x2, y2,
                w = tft.width(),
                h = tft.height();

  tft.fillScreen(ILI9341_BLACK);
  yield();
  
  x1 = y1 = 0;
  y2    = h - 1;
  start = micros();
  for(x2=0; x2<w; x2+=6) tft.drawLine(x1, y1, x2, y2, color);
  x2    = w - 1;
  for(y2=0; y2<h; y2+=6) tft.drawLine(x1, y1, x2, y2, color);
  t     = micros() - start; // fillScreen doesn't count against timing

  yield();
  tft.fillScreen(ILI9341_BLACK);
  yield();

  x1    = w - 1;
  y1    = 0;
  y2    = h - 1;
  start = micros();
  for(x2=0; x2<w; x2+=6) tft.drawLine(x1, y1, x2, y2, color);
  x2    = 0;
  for(y2=0; y2<h; y2+=6) tft.drawLine(x1, y1, x2, y2, color);
  t    += micros() - start;

  yield();
  tft.fillScreen(ILI9341_BLACK);
  yield();

  x1    = 0;
  y1    = h - 1;
  y2    = 0;
  start = micros();
  for(x2=0; x2<w; x2+=6) tft.drawLine(x1, y1, x2, y2, color);
  x2    = w - 1;
  for(y2=0; y2<h; y2+=6) tft.drawLine(x1, y1, x2, y2, color);
  t    += micros() - start;

  yield();
  tft.fillScreen(ILI9341_BLACK);
  yield();

  x1    = w - 1;
  y1    = h - 1;
  y2    = 0;
  start = micros();
  for(x2=0; x2<w; x2+=6) tft.drawLine(x1, y1, x2, y2, color);
  x2    = 0;
  for(y2=0; y2<h; y2+=6) tft.drawLine(x1, y1, x2, y2, color);

  yield();
  return micros() - start;
}

unsigned long testFastLines(uint16_t color1, uint16_t color2) {
  unsigned long start;
  int           x, y, w = tft.width(), h = tft.height();

  tft.fillScreen(ILI9341_BLACK);
  start = micros();
  for(y=0; y<h; y+=5) tft.drawFastHLine(0, y, w, color1);
  for(x=0; x<w; x+=5) tft.drawFastVLine(x, 0, h, color2);

  return micros() - start;
}

unsigned long testRects(uint16_t color) {
  unsigned long start;
  int           n, i, i2,
                cx = tft.width()  / 2,
                cy = tft.height() / 2;

  tft.fillScreen(ILI9341_BLACK);
  n     = min(tft.width(), tft.height());
  start = micros();
  for(i=2; i<n; i+=6) {
    i2 = i / 2;
    tft.drawRect(cx-i2, cy-i2, i, i, color);
  }

  return micros() - start;
}

unsigned long testFilledRects(uint16_t color1, uint16_t color2) {
  unsigned long start, t = 0;
  int           n, i, i2,
                cx = tft.width()  / 2 - 1,
                cy = tft.height() / 2 - 1;

  tft.fillScreen(ILI9341_BLACK);
  n = min(tft.width(), tft.height());
  for(i=n; i>0; i-=6) {
    i2    = i / 2;
    start = micros();
    tft.fillRect(cx-i2, cy-i2, i, i, color1);
    t    += micros() - start;
    // Outlines are not included in timing results
    tft.drawRect(cx-i2, cy-i2, i, i, color2);
    yield();
  }

  return t;
}

unsigned long testFilledCircles(uint8_t radius, uint16_t color) {
  unsigned long start;
  int x, y, w = tft.width(), h = tft.height(), r2 = radius * 2;

  tft.fillScreen(ILI9341_BLACK);
  start = micros();
  for(x=radius; x<w; x+=r2) {
    for(y=radius; y<h; y+=r2) {
      tft.fillCircle(x, y, radius, color);
    }
  }

  return micros() - start;
}

unsigned long testCircles(uint8_t radius, uint16_t color) {
  unsigned long start;
  int           x, y, r2 = radius * 2,
                w = tft.width()  + radius,
                h = tft.height() + radius;

  // Screen is not cleared for this one -- this is
  // intentional and does not affect the reported time.
  start = micros();
  for(x=0; x<w; x+=r2) {
    for(y=0; y<h; y+=r2) {
      tft.drawCircle(x, y, radius, color);
    }
  }

  return micros() - start;
}

unsigned long testTriangles() {
  unsigned long start;
  int           n, i, cx = tft.width()  / 2 - 1,
                      cy = tft.height() / 2 - 1;

  tft.fillScreen(ILI9341_BLACK);
  n     = min(cx, cy);
  start = micros();
  for(i=0; i<n; i+=5) {
    tft.drawTriangle(
      cx    , cy - i, // peak
      cx - i, cy + i, // bottom left
      cx + i, cy + i, // bottom right
      tft.color565(i, i, i));
  }

  return micros() - start;
}

unsigned long testFilledTriangles() {
  unsigned long start, t = 0;
  int           i, cx = tft.width()  / 2 - 1,
                   cy = tft.height() / 2 - 1;

  tft.fillScreen(ILI9341_BLACK);
  start = micros();
  for(i=min(cx,cy); i>10; i-=5) {
    start = micros();
    tft.fillTriangle(cx, cy - i, cx - i, cy + i, cx + i, cy + i,
      tft.color565(0, i*10, i*10));
    t += micros() - start;
    tft.drawTriangle(cx, cy - i, cx - i, cy + i, cx + i, cy + i,
      tft.color565(i*10, i*10, 0));
    yield();
  }

  return t;
}

unsigned long testRoundRects() {
  unsigned long start;
  int           w, i, i2,
                cx = tft.width()  / 2 - 1,
                cy = tft.height() / 2 - 1;

  tft.fillScreen(ILI9341_BLACK);
  w     = min(tft.width(), tft.height());
  start = micros();
  for(i=0; i<w; i+=6) {
    i2 = i / 2;
    tft.drawRoundRect(cx-i2, cy-i2, i, i, i/8, tft.color565(i, 0, 0));
  }

  return micros() - start;
}

unsigned long testFilledRoundRects() {
  unsigned long start;
  int           i, i2,
                cx = tft.width()  / 2 - 1,
                cy = tft.height() / 2 - 1;

  tft.fillScreen(ILI9341_BLACK);
  start = micros();
  for(i=min(tft.width(), tft.height()); i>20; i-=6) {
    i2 = i / 2;
    tft.fillRoundRect(cx-i2, cy-i2, i, i, i/8, tft.color565(0, i, 0));
    yield();
  }

  return micros() - start;
}

// To clear bit #7, send 128
void i2cexp_clear_bits(uint8_t bitfield) {
    // set bits to clear to 0, all other to 1, binary and to clear the bits
    i2cexp &= (~bitfield);
    pcf8574_write(i2cexp);
}

// To set bit #7, send 128
void i2cexp_set_bits(uint8_t bitfield) {
    i2cexp |= bitfield;
    pcf8574_write(i2cexp);
}

// I2C/TWI success (transaction was successful).
#define ku8TWISuccess    0
// I2C/TWI device not present (address sent, NACK received).
#define ku8TWIDeviceNACK 2
// I2C/TWI data not received (data sent, NACK received).
#define ku8TWIDataNACK   3
// I2C/TWI other error.
#define ku8TWIError      4

void pcf8574_write(uint8_t dt){
    uint8_t error;

    Wire.beginTransmission(I2C_EXPANDER);
    // Serial.print("Writing to I2CEXP: ");
    // Serial.println(dt);
    Wire.write(dt);
    error = Wire.endTransmission();
    if (error != ku8TWISuccess) {
	// FIXME: do something here if you like
    }
}

void lcd_test(LCDtest choice) {
    switch (choice) {

    case TEXT:
	Serial.print(F("Text                     "));
	Serial.println(testText());
        break;
	 
    case FILL:
	Serial.print(F("Screen fill              "));
	Serial.println(testFillScreen());
        break;

    case LINES:
	Serial.print(F("Lines                    "));
	Serial.println(testLines(ILI9341_CYAN));
	break;

    case HORIZVERT:
	Serial.print(F("Horiz/Vert Lines         "));
	Serial.println(testFastLines(ILI9341_RED, ILI9341_BLUE));
        break;

    case RECT:
	Serial.print(F("Rectangles (outline)     "));
	Serial.println(testRects(ILI9341_GREEN));
	break;

    case RECTFILL:
	Serial.print(F("Rectangles (filled)      "));
	Serial.println(testFilledRects(ILI9341_YELLOW, ILI9341_MAGENTA));
	break;

    case CIRCLE:
	Serial.print(F("Circles (outline)        "));
	Serial.println(testCircles(10, ILI9341_WHITE));
	break;

    case CIRCFILL:
	Serial.print(F("Circles (filled)         "));
	Serial.println(testFilledCircles(10, ILI9341_MAGENTA));
	break;

    case TRIANGLE:
	Serial.print(F("Triangles (outline)      "));
	Serial.println(testTriangles());
	break;

    case TRIFILL:
	Serial.print(F("Triangles (filled)       "));
	Serial.println(testFilledTriangles());
	break;

    case ROUNDREC:
	Serial.print(F("Rounded rects (outline)  "));
	Serial.println(testRoundRects());
	break;

    case ROUNDRECFILL:
	Serial.print(F("Rounded rects (filled)   "));
	Serial.println(testFilledRoundRects());
	break;
    }
}

void finger_draw() {
    uint16_t pixel_x, pixel_y;
    uint16_t color_pressure, color;
    static uint8_t update_coordinates = 0;

    // Clear (i.e. set) CS for TS before talking to it
    i2cexp_clear_bits(I2CEXP_TOUCH_CS);
    // Calling getpoint calls SPI.beginTransaction with a speed of only 2MHz, so we need to
    // reset the speed to something faster before talking to the screen again.
    TS_Point p = ts.getPoint();
    // Then disable it again so that talking SPI to LCD doesn't reach TS
    i2cexp_set_bits(I2CEXP_TOUCH_CS);

    if (p.z) {
	// Pressure goes from 1000 to 2200 with a stylus but is unreliable,
	// 3000 if you mash a finger in, let's say 2048 range
	// Colors are 16 bits, so multiply pressure by 32 to get a color range from pressure
	// X goes from 320 to 3900 (let's say 3600), Y goes from 200 to 3800 (let's say 3600 too)
	// each X pixel is 11.25 dots of resolution on digitizer, and 15 dots for Y.
	pixel_x = (p.x-320)/11.25;
	pixel_y = (p.y-200)/15;
	
	// Colors are 16 bits, 5 bit: red, 6 bits: green, 5 bits: blue
	// to map a pressure number to colors and avoid random black looking colors,
	// let's seed the color with 2 lowest bits per color: 0001100001100011
	// this gives us 10 bits we need to fill in for which color we'll use,
	color_pressure = p.z-1000;
	if (p.z < 1000) color_pressure = 0;
	color_pressure = constrain(color_pressure, 0, 2047)/2;
	// 3 highest bits (9-7), get shifted 6 times to 15-13
	// 4 middle  bits (6-3), get shifted 5 times to 11-08
	// 3 lowest  bits (2-1), get shifted 2 times to 04-02
	color = B00011000*256 + B01100011 + ((color_pressure & 0x380) << 6) +
                                            ((color_pressure & B01111000) << 5) +
                                            ((color_pressure & B00000111) << 2);
	Serial.print("Color: ");
	Serial.print(p.z);
	Serial.print(" -> ");
	Serial.print(color_pressure);
	Serial.print(" -> ");
	Serial.println(color, HEX);
	tft.fillCircle(pixel_x, pixel_y, 2, color);
	update_coordinates = 1;
    // Writing coordinates every time is too slow, write less often
    } else if (update_coordinates) {
	update_coordinates = 0;
	// Cursor offsets are in pixels, not characters
	tft.fillRect(20, 0, 32, 16, ILI9341_BLACK);
	tft.setCursor(20, 0);
	tft.println(p.x);
	tft.setCursor(20, 8);
	tft.println(p.y);
    }
}

void setup() {
    Serial.begin(115200);
    Serial.println("Serial Begin"); 

    // Currently, we are using software SPI, but this init should also be done by the
    // adafruit library
    pinMode(MOSI, OUTPUT);
    pinMode(MISO, INPUT);
    pinMode(SPI_CLK, OUTPUT);

    // Joystick Setup
    pinMode(JOYSTICK_BUT_PIN, INPUT_PULLUP);

    // TFT Setup
    pinMode(TFT_CS, OUTPUT);
    pinMode(TFT_DC, OUTPUT);
    pinMode(TFT_RST, OUTPUT);
    // Hardware SPI on ESP32 is actually slower than software SPI. Giving 80Mhz
    // here does not make things any faster. There seems to be a fair amount of
    // overhead in the fancier hw SPI on ESP32 which is designed to send more than
    // one byte at the time, and only ends up sending one byte when called from an
    // arduino library.
    // Sadly, using software SPI in the adafruit library would prevent SPI from working
    // in the touch screen code which only supports hardware SPI
    // The TFT code runs at 24Mhz as per below, but testing shows that any speed over 2Mhz
    // seems ignored and taken down to 2Mhz
    //SPI.beginTransaction(SPISettings(24000000, MSBFIRST, SPI_MODE0));

    // Talking to the touch screen can only work at 2Mhz, and both drivers change the SPI
    // speed before sending data, so this works transparently.

    // ESP32 requires an extended begin with pin mappings (which is not supported by the
    // adafruit library, so we do an explicit begin here and then the other SPI libraries work
    // with hardware SPI as setup here):
    SPI.begin(SPI_CLK, MISO, MOSI);

    Wire.begin();
    // LCD backlight is inverted logic, turn it on
    // This turns the backlight off
    // i2cexp_set_bits(I2CEXP_LCD_BL_CTR);
    // And this turns it on
    i2cexp_clear_bits(I2CEXP_LCD_BL_CTR);

    Serial.println("ILI9341 Test!"); 

    tft.begin();
    // read diagnostics (optional but can help debug problems)
    uint8_t x = tft.readcommand8(ILI9341_RDMODE);
    Serial.print("Display Power Mode: 0x"); Serial.println(x, HEX);
    x = tft.readcommand8(ILI9341_RDMADCTL);
    Serial.print("MADCTL Mode: 0x"); Serial.println(x, HEX);
    x = tft.readcommand8(ILI9341_RDPIXFMT);
    Serial.print("Pixel Format: 0x"); Serial.println(x, HEX);
    x = tft.readcommand8(ILI9341_RDIMGFMT);
    Serial.print("Image Format: 0x"); Serial.println(x, HEX);
    x = tft.readcommand8(ILI9341_RDSELFDIAG);
    Serial.print("Self Diagnostic: 0x"); Serial.println(x, HEX); 
    Serial.print("Resolution: "); Serial.print(tft.height()); 
    Serial.print(" x "); Serial.println(tft.width());
    Serial.println(F("Done!"));
    tft.setRotation(3);
    tft.fillScreen(ILI9341_BLACK);
    tft.setTextColor(ILI9341_WHITE);
    tft.setTextSize(1);
    tft.setCursor(0, 0);
    tft.println("x = ");
    tft.print("y = ");

    // Tri-color APA106 LEDs Setup (not working right now)
    pixels.begin();
    pixels.setPixelColor(0, 255, 0, 0);
    pixels.setPixelColor(1, 0, 255, 0);
    pixels.show();
}

void loop(void) {
    static int8_t lcd_demo = -1;
    int joyValueX = 0;
    int joyValueY = 0;
    int joyBtnValue = digitalRead(JOYSTICK_BUT_PIN);

    if (joyBtnValue == 0) lcd_demo++;
    if (lcd_demo == -1)
    {
	finger_draw();
	delay(1);
	return;
    }

    Serial.print("Running LCD Demo #");
    Serial.print(lcd_demo);
    lcd_test((LCDtest) lcd_demo);

    while ((joyBtnValue = digitalRead(JOYSTICK_BUT_PIN)) == 1)
    {
	// read the analog in value:
	joyValueX = analogRead(JOYSTICK_X_PIN);
	joyValueY = analogRead(JOYSTICK_Y_PIN);
	joyBtnValue = digitalRead(JOYSTICK_BUT_PIN);

	// print the results to the serial monitor:
	Serial.print("X Axis = ");
	Serial.print(joyValueX);
	Serial.print("\t Y Axis = ");
	Serial.print(joyValueY);
	Serial.print("\t Joy Button = ");
	Serial.println(joyBtnValue);
	// wait 50 milliseconds before the next loop
	// for the analog-to-digital converter to settle
	// after the last reading:
	// this also calls yield() for us
	delay(50);

	// left
	if (joyValueX > 3500)
	{
	    tft.setRotation(0);
	    lcd_test((LCDtest) lcd_demo);
	}

	// right
	if (joyValueX < 500)
	{
	    tft.setRotation(2);
	    lcd_test((LCDtest) lcd_demo);
	}

	// up
	if (joyValueY < 500)
	{
	    tft.setRotation(1);
	    lcd_test((LCDtest) lcd_demo);
	}

	// down
	if (joyValueY > 3500)
	{
	    tft.setRotation(3);
	    lcd_test((LCDtest) lcd_demo);
	}
    }
    lcd_demo++;
    // tilting joystick back (not too far) while clicking goes back one demo
    if (joyValueX > 2000) lcd_demo-=2;
    if (lcd_demo == 12) lcd_demo = 0;
    if (lcd_demo == -1) lcd_demo = 11;

    // Try to light up LEDs (not working yet)
    pixels.setPixelColor(0, lcd_demo*20, 0, 0);
    pixels.setPixelColor(1, 0, lcd_demo*20, 0);
    pixels.show();
}


// vim:sts=4:sw=4
