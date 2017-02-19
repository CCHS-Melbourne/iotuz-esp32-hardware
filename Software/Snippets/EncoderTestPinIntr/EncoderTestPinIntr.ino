/* License: Apache-2  */

// Inspired from fbonan
// https://www.circuitsathome.com/mcu/reading-rotary-encoder-on-arduino/

// This is better than EncoderTestIntr because it only interrupts on
// pin change instead of some time interval.

#define encoder0PinA 15
#define encoder0PinB 36


volatile int16_t encoder0Pos = 0;
uint8_t old_AB = 0;

// grey code
// http://hades.mech.northwestern.edu/index.php/Rotary_Encoder
// also read up on 'Understanding Quadrature Encoded Signals'
// https://www.pjrc.com/teensy/td_libs_Encoder.html
int8_t enc_states[] = {0,-1,1,0,1,0,0,-1,-1,0,0,1,0,1,-1,0};


int16_t lastencoder = 0;

/* returns change in encoder state (-1,0,1) */
void read_encoder() {
    old_AB <<= 2;
    old_AB |= ((digitalRead(encoder0PinB))?(1<<1):0) | ((digitalRead(encoder0PinA))?(1<<0):0);
    encoder0Pos += ( enc_states[( old_AB & 0x0f )]);
}

// the setup routine runs once when you press reset:
void setup() {
    // initialize serial communication at 9600 bits per second:
    Serial.begin(115200);
    // make the pushbutton's pin an input:
    pinMode (encoder0PinA, INPUT_PULLUP);
    pinMode (encoder0PinB, INPUT_PULLUP);

    attachInterrupt(encoder0PinA, read_encoder, CHANGE);
    attachInterrupt(encoder0PinB, read_encoder, CHANGE);

    Serial.println("This driver works reliably on IoTuz, but generates 4 rotation clicks");
    Serial.println("per click you can feel in the knob. This is due the the hardware and not a bug");
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
}

// vim:sts=4:sw=4
