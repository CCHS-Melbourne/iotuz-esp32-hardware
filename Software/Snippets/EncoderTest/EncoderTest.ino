/* License: Apache-2  */

#define encoder0PinA 15
#define encoder0PinB 36

// the setup routine runs once when you press reset:
void setup() {
    // initialize serial communication at 9600 bits per second:
    Serial.begin(115200);
    // make the pushbutton's pin an input:
    pinMode (encoder0PinA, INPUT_PULLUP);
    pinMode (encoder0PinB, INPUT_PULLUP);

    // Taken from http://playground.arduino.cc/Main/RotaryEncoders
    Serial.println ("This is a basic demo to read a rotary encoder, it does not debounce or work perfectly");
}

// the loop routine runs over and over again forever:
void loop() {
    static uint8_t val; 
    static int16_t encoder0Pos = 0;
    static uint8_t encoder0PinALast = LOW;
    static uint8_t n = LOW;

    n = digitalRead(encoder0PinA);
    if ((encoder0PinALast == LOW) && (n == HIGH)) {
	if (digitalRead(encoder0PinB) == LOW) {
	    encoder0Pos--;
	} else {
	    encoder0Pos++;
	}
	Serial.print ("Encoder val: ");
	Serial.println (encoder0Pos);
    } 
    encoder0PinALast = n;
    // There is no debouncing, but delaying between state changes will stop most bounces
    // from happening.
    delay(1);
}

// vim:sts=4:sw=4
