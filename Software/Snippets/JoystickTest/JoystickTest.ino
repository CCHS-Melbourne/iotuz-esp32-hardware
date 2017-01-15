/*
  Analog input, analog output, serial output

 Reads an analog input pin, maps the result to a range from 0 to 255
 and uses the result to set the pulsewidth modulation (PWM) of an output pin.
 Also prints the results to the serial monitor.

 The circuit:
 * potentiometer connected to analog pin 0.
   Center pin of the potentiometer goes to the analog pin.
   side pins of the potentiometer go to +5V and ground
 * LED connected from digital pin 9 to ground

 created 29 Dec. 2008
 modified 9 Apr 2012
 by Tom Igoe

 This example code is in the public domain.

 Modified for IoTuz inputs.

 */

const int analogInPinX = 39;  // Analog input pin that the potentiometer is attached to
const int analogInPinY = 34;  // Analog input pin that the potentiometer is attached to
const int joyBtn = 0;  // Digital input pin that the button is attached to

int sensorValueX = 0;        // value read from the pot
int sensorValueY = 0;        // value read from the pot
int joyBtnValue = 0;        // value read from the pot

//int outputValue = 0;        // value output to the PWM (analog out)

void setup() {
  // initialize serial communications at 9600 bps:
  Serial.begin(115200);
  pinMode(joyBtn, INPUT_PULLUP);
}

void loop() {
  // read the analog in value:
  sensorValueX = analogRead(analogInPinX);
  sensorValueY = analogRead(analogInPinY);
  joyBtnValue = digitalRead(joyBtn);

  // print the results to the serial monitor:
  Serial.print("X Axis = ");
  Serial.print(sensorValueX);
  Serial.print("\t Y Axis = ");
  Serial.print(sensorValueY);
  Serial.print("\t Joy Button = ");
  Serial.println(joyBtnValue);


  // wait 25 milliseconds before the next loop
  // for the analog-to-digital converter to settle
  // after the last reading:
  delay(50);
}
