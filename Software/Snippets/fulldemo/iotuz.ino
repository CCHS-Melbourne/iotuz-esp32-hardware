#include <Wire.h>
#include "iotuz.h"

// Dealing with the I/O expander is a bit counter intuitive. There is no difference between a
// write meant to toggle an output port, and a write designed to turn off pull down resistors and trigger
// a read request.
// The write just before the read should have bits high on the bits you'd like to read back, but you
// may get high bits back on other bits you didn't turn off the pull down resistor on. This is normal.
// Just filter out the bits you're trying to get from the value read back and keep in mind that when
// you write, you should still send the right bit values for the output pins.
// This is all stored in i2cexp which we initialize to the bits used as input:
#define I2CEXP_IMASK ( I2CEXP_ACCEL_INT + I2CEXP_A_BUT + I2CEXP_B_BUT + I2CEXP_ENC_BUT + I2CEXP_TOUCH_INT )
// Any write to I2CEXP should contain those mask bits so allow reads to work later
uint8_t i2cexp = I2CEXP_IMASK;

// I2C/TWI success (transaction was successful).
#define ku8TWISuccess    0
// I2C/TWI device not present (address sent, NACK received).
#define ku8TWIDeviceNACK 2
// I2C/TWI data not received (data sent, NACK received).
#define ku8TWIDataNACK   3
// I2C/TWI other error.
#define ku8TWIError      4

void pcf8574_write(uint8_t dt)
{
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

// To clear bit #7, send 128
void i2cexp_clear_bits(uint8_t bitfield)
{
    // set bits to clear to 0, all other to 1, binary and to clear the bits
    i2cexp &= (~bitfield);
    pcf8574_write(i2cexp);
}

// To set bit #7, send 128
void i2cexp_set_bits(uint8_t bitfield)
{
    i2cexp |= bitfield;
    pcf8574_write(i2cexp);
}

uint8_t i2cexp_read()
{
    // For read to work, we must have sent 1 bits on the ports that get used as input
    // This is done by i2cexp_clear_bits called in setup.
    Wire.requestFrom(I2C_EXPANDER, 1);	// FIXME: deal with returned error here?
    while (Wire.available() < 1) ;
    uint8_t read = ~Wire.read();	// Apparently one has to invert the bits read
    // When no buttons are pushed, this returns 0x91, which includes some ports
    // we use as output, so we do need to filter out the ports used as read.
    // Serial.println(read, HEX);
    return read;
}

// grey code
// http://hades.mech.northwestern.edu/index.php/Rotary_Encoder
// also read up on 'Understanding Quadrature Encoded Signals'
// https://www.pjrc.com/teensy/td_libs_Encoder.html
int8_t enc_states[] = {0,-1,1,0,1,0,0,-1,-1,0,0,1,0,1,-1,0};
volatile int16_t encoder0Pos = 0;
int16_t old_encoder0Pos = 0;
uint8_t old_AB = 0;

/* returns change in encoder state (-1,0,1) */
void read_encoder_ISR() 
{
    old_AB <<= 2;
    old_AB |= ((digitalRead(ENCODERB_PIN))?(1<<1):0) | ((digitalRead(ENCODERA_PIN))?(1<<0):0);
    encoder0Pos += ( enc_states[( old_AB & 0x0f )]);
}

int16_t read_encoder() 
{
    return encoder0Pos;
}

bool encoder_changed() {
    if (encoder0Pos != old_encoder0Pos)
    {
	old_encoder0Pos = encoder0Pos;
	return true;
    }
    return false;
}

ButtState read_encoder_button() 
{
    static bool butEnc = false;
    uint8_t butt_state = i2cexp_read() & I2CEXP_ENC_BUT;

    if (butt_state && !butEnc)
    {
	butEnc = true;
	//Serial.println("Encoder Button Pushed");
	return ENC_PUSHED;
    }
    if (!butt_state && butEnc)
    {
	butEnc = false;
	//Serial.println("Encoder Button Released");
	return ENC_RELEASED;
    }
    return (butt_state?ENC_DOWN:ENC_UP);
}

void iotuz_setup()
{
    pinMode (ENCODERA_PIN, INPUT_PULLUP);
    pinMode (ENCODERB_PIN, INPUT_PULLUP);

    pinMode(SPI_MOSI, OUTPUT);
    pinMode(SPI_MISO, INPUT);
    pinMode(SPI_CLK, OUTPUT);

    // Joystick Setup
    pinMode(JOYSTICK_BUT_PIN, INPUT_PULLUP);

    // TFT Setup
    pinMode(TFT_CS, OUTPUT);
    pinMode(TFT_DC, OUTPUT);
    pinMode(TFT_RST, OUTPUT);

    // required for i2exp to work
    Wire.begin();
    // turn off the LCD by default and init other bits (the ones that are read)
    i2cexp_set_bits(I2CEXP_LCD_BL_CTR);

    // Initialize rotary encoder reading and decoding
    attachInterrupt(ENCODERA_PIN, read_encoder_ISR, CHANGE);
    attachInterrupt(ENCODERB_PIN, read_encoder_ISR, CHANGE);
}

// vim:sts=4:sw=4
