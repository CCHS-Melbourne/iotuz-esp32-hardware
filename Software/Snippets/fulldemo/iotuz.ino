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

