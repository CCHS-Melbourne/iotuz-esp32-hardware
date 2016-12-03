//This just blinks the backlight of the LCD. It shows how to write to the i2c IO expander output
//Adapted from code found here:http://www.instructables.com/id/Using-The-PCF8575-i2c-io-Expander-To-Read-Inputs-/?ALLSTEPS

#include <Wire.h> 

int address = 0x20; //0100000 (7bit) address of the IO expander on i2c bus
uint8_t dataReceive; //16bit data received
uint8_t dataSend;  //16bit data sent

// the setup function runs once when you press reset or power the board
void setup() {
  Wire.begin(); 
  Serial.begin(115200);
  //turn pins to input in setup
  //if bit = 0, pin functions as input or an output that is off
  //if bit = 1, pin functions as an output that is on
  dataSend = B01111111; //turn every pin to input except P7
  pcf8574_write(dataSend); //set up pins
}

// the loop function runs over and over again forever
void loop() {
  dataSend = B01111111;              
  pcf8574_write(dataSend);           //Turn on the LCD backlight (active low).
  Serial.print("Wrote: "); 
  Serial.println(dataSend,BIN);      //Might drop leading zeros?
  Serial.println("----------------------");
  delay(3000);                       // wait for 3 seconds
  dataSend = B11111111;
  pcf8574_write(dataSend);
  Serial.print("Wrote: ");
  Serial.println(dataSend,BIN);
  Serial.println("----------------------");
  delay(1000);                       // wait for a second
  
}

//I2C/TWI success (transaction was successful).
static const uint8_t ku8TWISuccess                   = 0;
//I2C/TWI device not present (address sent, NACK received).
static const uint8_t ku8TWIDeviceNACK                = 2;
//I2C/TWI data not received (data sent, NACK received).
static const uint8_t ku8TWIDataNACK                  = 3;
//I2C/TWI other error.
static const uint8_t ku8TWIError                     = 4;

uint8_t error;
void pcf8574_write(uint8_t dt){
  Wire.beginTransmission(address);
  Wire.write(dt);
  
  error = Wire.endTransmission();
  if(error == ku8TWISuccess){ //okay!
  
  }
  else{ //we have an error
    //do something here if you like
  }
}
