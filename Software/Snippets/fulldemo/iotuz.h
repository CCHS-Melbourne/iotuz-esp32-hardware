// TFT + Touch Screen Setup Start
// These are the minimal changes from v0.1 to get the LCD working
#define TFT_DC 4
#define TFT_CS 19
#define TFT_RST 32
// SPI Pins are shared by TFT, touch screen, SD Card
#define SPI_MISO 12
#define SPI_MOSI 13
#define SPI_CLK 14

// LCD brightness control and touchscreen CS are behind the port
// expander, as well as both push buttons
#define I2C_EXPANDER 0x20	//0100000 (7bit) address of the IO expander on i2c bus

/* Port expander PCF8574, access via I2C on */
#define I2CEXP_ACCEL_INT    0x01	// (In)
#define I2CEXP_A_BUT	    0x02	// (In)
#define I2CEXP_B_BUT	    0x04	// (In)
#define I2CEXP_ENC_BUT	    0x08	// (In)
#define I2CEXP_SD_CS	    0x10	// (Out)
#define I2CEXP_TOUCH_INT    0x20	// (In)
#define I2CEXP_TOUCH_CS	    0x40	// (Out)
#define I2CEXP_LCD_BL_CTR   0x80	// (Out)

void i2cexp_clear_bits(uint8_t bitfield);
void i2cexp_set_bits(uint8_t bitfield);

// This is calibration data for the raw touch data to the screen coordinates
#define TS_MINX 320
#define TS_MINY 220
#define TS_MAXX 3920
#define TS_MAXY 3820
#define MINPRESSURE 400
#define MAXPRESSURE 3000

// Joystick Setup
#define JOYSTICK_X_PIN 39
#define JOYSTICK_Y_PIN 34
#define JOYSTICK_BUT_PIN 0

// Center on my IoTuz board (not used anymore)
#define JOYSTICK_CENTERX  1785
#define JOYSTICK_CENTERY  1854
