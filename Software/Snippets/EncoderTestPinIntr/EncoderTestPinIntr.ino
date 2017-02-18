/* License: Apache-2  */

// Inspired from rafbuff
// http://playground.arduino.cc/Main/RotaryEncoders

// This is better than EncoderTestIntr because it only interrupts on
// pin change instead of some time interval.

// FIXME: This is an example, but it does not work well in my experience, I still
// get bounces and skips and jumps of multiple increases on one rotation -- merlin

#define encoder0PinA 15
#define encoder0PinB 36

volatile int16_t encoder0Pos = 0;

static boolean rotating=false;      // debounce management

// interrupt service routine vars
boolean A_set = false;              
boolean B_set = false;

int16_t lastencoder = 0;

void doEncoderA(){
    // debounce
    if ( rotating ) delay (1);  // wait a little until the bouncing is done

    // Test transition, did things really change? 
    if( digitalRead(encoder0PinA) != A_set ) {  // debounce once more
	A_set = !A_set;
	// adjust counter + if A leads B
	if ( A_set && !B_set ) encoder0Pos -= 1;
	rotating = false;  // no more debouncing until loop() hits again
    }
}

// Interrupt on B changing state, same as A above
void doEncoderB(){
    if ( rotating ) delay (1); // delay in ISR? Ugh...
    if( digitalRead(encoder0PinB) != B_set ) {
	B_set = !B_set;
	//  adjust counter - 1 if B leads A
	if( B_set && !A_set ) encoder0Pos += 1;
	rotating = false;
    }
}

// the setup routine runs once when you press reset:
void setup() {
    // initialize serial communication at 9600 bits per second:
    Serial.begin(115200);
    // make the pushbutton's pin an input:
    pinMode (encoder0PinA, INPUT_PULLUP);
    pinMode (encoder0PinB, INPUT_PULLUP);

    attachInterrupt(encoder0PinA, doEncoderA, CHANGE);
    attachInterrupt(encoder0PinB, doEncoderB, CHANGE);
}

// the loop routine runs over and over again forever:
void loop() {
    static int16_t lastencoder;

    if (lastencoder != encoder0Pos) {
	Serial.print ("Encoder val: ");
	Serial.println (encoder0Pos);
	lastencoder = encoder0Pos;
    }

    //Serial.println("Do other stuff in loop()");

    // There is no debouncing, but delaying between state changes will stop most bounces
    // from happening.
    delay(1);
}

// vim:sts=4:sw=4
