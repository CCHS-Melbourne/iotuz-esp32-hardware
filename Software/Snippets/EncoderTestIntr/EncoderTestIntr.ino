/* License: Apache-2  */

// For a basic example of how this is done on a normal arduino:
// https://github.com/frodofski/Encoder_Polling/blob/master/libraries/Encoder_Polling/Encoder_Polling.cpp

hw_timer_t *timer;

#define encoder0PinA 15
#define encoder0PinB 36

volatile int16_t encoder0Pos = 0;
volatile uint8_t encoder0PinALast = LOW;

void onTimer(){
    uint8_t n = digitalRead(encoder0PinA);
    if ((encoder0PinALast == LOW) && (n == HIGH)) {
	if (digitalRead(encoder0PinB) == LOW) {
	    encoder0Pos--;
	} else {
	    encoder0Pos++;
	}
    } 
    encoder0PinALast = n;
}

// the setup routine runs once when you press reset:
void setup() {
    // initialize serial communication at 9600 bits per second:
    Serial.begin(115200);
    // make the pushbutton's pin an input:
    pinMode (encoder0PinA, INPUT_PULLUP);
    pinMode (encoder0PinB, INPUT_PULLUP);

    // Taken from http://playground.arduino.cc/Main/RotaryEncoders
    Serial.println ("This is a basic demo to read a rotary encoder, it does not debounce or work perfectly");

    // 3 timers, choose #3, 80 divider nanosecond precision, 1 to count up
    timer = timerBegin(3, 80, 1);
    timerAttachInterrupt(timer, &onTimer, 1);
    // every 1,000ns = 1ms, autoreload = true
    timerAlarmWrite(timer, 1000, true);
    timerAlarmEnable(timer);
}

// the loop routine runs over and over again forever:
void loop() {
    static int16_t lastencoder;

    if (lastencoder != encoder0Pos) {
	Serial.print ("Encoder val: ");
	Serial.println (encoder0Pos);
	lastencoder = encoder0Pos;
    }

    Serial.println("Do other stuff in loop()");

    // There is no debouncing, but delaying between state changes will stop most bounces
    // from happening.
    delay(100);
}

// vim:sts=4:sw=4
