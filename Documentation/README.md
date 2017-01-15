Hand-soldering through-hole component instructions
==================================================

Errata for Tuesday 2017-01-17
-----------------------------

* The speaker (SP1) has not yet arrived from overseas, but we anticipate
  receiving the speakers in the next couple of days, during LCA2017

* The microphone (MK91) will require an engineering modification before
  it can be attached to the IoTuz PCB

* A small number of IoTuz PCBs do not have the
  [CN3063 charge controller](https://wheresup.com/image/event/800-800-0-0-_b554647c5dd9d6bb4435d47213fbd79eb40214f0c56.jpg) (U201)
  installed and we will let you know when this can be rectified.
  This means that your IoTuz PCB may not charge the LiPo battery,
  but works in every other way

* IoTuz PCBs with the CN3063 charge controller fitted will have a modified
  MCP6002 (U202) with two small (red) wires altering one of the op-amps.

Introduction
------------

These instructions suggest an order to building your IoTuz that are not
absolute, there is no one right way to do this.  Experienced attendees
are likely to have their own preferences.  Our main suggestion is to
start with the lowest profile (shortest) components first to avoid
pieces falling out of the PCBs, which might happen if you placed a
larger component first.  Also large components, like the joystick
or LCD touch-screen become hard to work around when they are in the way.

If something doesn't make sense or you are having difficulty, please ask
for assistance, because it can be much more time consuming repairing a 
mistake.  It is best to "check twice" and "solder once" :)

Before powering up your IoTuz PCB for the first time, it is strongly
recommended that you ...

* Do NOT insert the LiPo battery until after you have checked correct
  IoTuz operation by powered up using a USB cable.  Don't forget to
  remove power when inserting or removing the LiPo battery

* Use a multimeter to test that there isn't a short-circuit between
  ground (GND) and the +5V power supply and also the 3.3V (+3V3) power
  supply.  These voltages can be measured on the pins along the bottom
  of the PCB

* Remove excessive flux with flux remover ... and keep your IoTuz
  [shiny](https://www.youtube.com/watch?v=93lrosBEW-Q) !

* Visually inspect the board for any solder bridges or mistakes.
  For example, carefully check the headers pins along the bottom
  of the PCB and the two large RGB LEDs pins for solder bridges

* If you are new to hardware assembly, ask another more experienced
  person to double-check your assembly effort.  If you are more
  experienced, then you are probably still hurting from your
  most recent mistake :)

Please treat the LiPo battery with great care.  There can be a lot of
stored energy potential in these devices and they are not resilient to
mistreatment.  Please take care not to puncture the LiPo battery when
inserting or removing it from the battery holder, which is a tight fit.
Never use a sharp object to assist in removing the LiPo battery. When
travelling, especially on airplanes, place the LiPo battery in the
supplied orange box.  And yes, we saw the exact same type of LiPo
battery in another project release the
[magic smoke](https://www.youtube.com/watch?v=l1jmYe7AIXM)
a few days ago, when a
[package was opened with a pocket knife !](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8536.jpg)

Check before starting
---------------------

Have you got everything ?

![IoTuz image 1](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8473.jpg)

Can you identify each part ?

![IoTuz image 2](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8474.jpg)

... okay, that was too easy :)

![IoTuz image 3](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8475.jpg)

... can you name the fearsome creature and her history ?

Which version of the [Linux kernel](http://www.h-online.com/news/item/Kernel-Log-Tasmanian-devil-to-be-Linux-s-temporary-mascot-new-Radeon-drivers-740667.html) was named after this creature ?

LCA2009 was also in Hobart and was the genesis for the first Arduino
Mini-Conference at LCA2010 in Wellington N.Z (and here you are now in
Wellington Room 2), which became the Open Hardware Conference in 2016.
It was also the year that
[Linus shaved BDale's beard !](https://www.youtube.com/watch?v=lYt4i4OU_yc)

![IoTuz image 4](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8476.jpg)

A pointed soldering iron tip will work fine for the through-hole components,
but if you'd like to see a chisel tip in action attaching the ESP32 module
to your IoTuz PCB then
[watch this video](https://www.youtube.com/watch?v=haz02WWTRY4) !

Assembly
--------

Let's start with InfraRed transmitter and receiver.

The IR transmitter LED must be inserted in the correct orientation.
Like all LEDs, this IR transmitter has a slight flat edge on the otherwise
circular plastic diffuser.  The LED also has one shorter leg, which is the
negative (cathode) pin.  Place the LED with the shorter leg into the hole
marked "K".  The solder mask has an image of the LED profile indicating the
orientation of the flat edge.

![IoTuz image 5](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8477.jpg)

When placing the IR transmitter, leave enough component leg length to be able
to bend it at a 90 degree angle.  This makes sense if you want to have two
IoTuz boards interact via IR when facing each other.

![IoTuz image 6](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8479.jpg)

The on/off switch is easy.  Unfortunately, the switch does cover the solder
mask that shows the on/off switch position.  Fortunately, LED1 will show
whether the IoTuz is powered or not.  Unfortunately, you might want to
remove LED1 to conserve energy in low-powered applications.
Design is all about the details :)

![IoTuz image 7](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8480.jpg)

Okay, the reset switch is easy.  Except they come in so many different
colours !

Red was chosen to make it easy to see.

![IoTuz image 8](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8481.jpg)

The pads along the bottom of your IoTuz are intended for easy access to the
ESP32 I/O peripheral pins, e.g digital GPIOs, analog I/O, I2C, SPI, etc.
You can choose not to place any header pins ... it is up-to-you.
Controversially, I choose to use 90 degree header pins underneath IoTuz.
However, the OHMC team concensus would be to use straight male header pins
on top of the PCB.  Either way, take care not to leave any solder bridges.

![IoTuz image 9](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8483.jpg)

Solder a 4-pin male header onto the RGB LCD touch-screen.  These provide both
mechanical stability and SPI bus for the built-in SD card connector.

![IoTuz image 12](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8484.jpg)

For the RGB LCD touch-screen, you can choose the recommended approach of just
using the standard female header pins as shown.

However, if you'd like the RGB LCD touch-screen to sit higher off the IoTuz
PCB, then a set of machined female header pins have been provided, which can
be soldered into the PCB instead.  This allows the standard female header pins
to be inserted (more snugly) into the machined female header pins.

If this doesn't make sense, don't worry ... just put the machined female
header pins back in the bag and run with the standard female header pins.
That'll work just fine.

![IoTuz image 10](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8487.jpg)

When placing the RGB LCD touch-screen female header pins, you might like to
insert the touch-screen before soldering to ensure that the header alignment
is correct.

![IoTuz image 11](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8485.jpg)

Test the RGB LCD touch-screen alignment ... and then remove the touch-screen
before proceeding with the remaining component assembly.

![IoTuz image 13](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8486.jpg)

You can solder the RGB LEDs into the PCB and have them sit a millimeter above
the IoTuz PCB ... or you can very carefully cut the RGB LED legs just below
the notch (as shown) and have them sit flush to the IoTuz PCB.  It is worth
the effort to have them sit flush, just be careful, because we don't have
any spare RGB LEDs !

If you are new to hardware / soldering and would like your RGB LEDs to be
flush with the IoTuz PCB, please ask for some assistance from an experienced
person, just to ensure that you don't clip the legs too short.

Double and triple check that you have the RGB LEDs correctly orientated
by aligning the flat edge of the LED with the solder mask image on the PCB.
It'll be quite tricky desoldering an incorrectly placed LED and any
rework always has a small risk of damaging the IoTuz PCB pads.

![IoTuz image 16](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8488.jpg)

Looking good !

![IoTuz image 16](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8490.jpg)

We are on the home stretch now !

![IoTuz image 14](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8489.jpg)

The joystick has a lot of pins, some of which may have been slightly bent
during transportation.  Carefully check that all pins are straight and watch
for alignment when inserting into the PCB ... don't force it.

Before soldering, check that every pin has come through the PCB and is
properly protruding so that a good solder joint has been made.  If any
pin isn't clearly visible, then best to remove the joystick and check
the pin alignment again.  You do not want to have soldered on the joystick,
just to find one pin hasn't poked through.

Wait until the IoTuz is completely assembled before putting on the joystick
knob.
[Patience young padawan :)](https://cdn.meme.am/cache/instances/folder524/500x/30938524.jpg)

![IoTuz image 17](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8491.jpg)

Same pin alignments advice again for the rotary encoder.

Wait until the IoTuz is completely assembled before putting on the rotary
encoder knob.

Note: That knob was chosen because it just looks cool !

![IoTuz image 18](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8492.jpg)

We've supplied very long A and B buttons, so that if you
[laser-cut a case](https://github.com/CCHS-Melbourne/IoTuz/tree/master/Case)
for your IoTuz (at your local HackerSpace), then they will be just the right
length.

However, you might want to ask for some shorter buttons.

![IoTuz image 20](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8494.jpg)

Too easy ...

![IoTuz image 19](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8493.jpg)

And you are nearly done ...

![IoTuz image 21](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8495.jpg)

Congratulations !

Complete, except for the speaker and microphone mentioned early.

Before applying power, don't forget to check for solder bridges and
use a multimeter to ensure that there are no short-circuits between
power and ground pins.

![IoTuz image 22](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8496.jpg)

Time to flash some firmware and enjoy your
[shiny new toy](https://www.youtube.com/watch?v=93lrosBEW-Q) !

![IoTuz image 23](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8498.jpg)

If you have improvements or suggestions, please make the change / pull request
or lodge an [issue](https://github.com/CCHS-Melbourne/IoTuz/issues) ...
thanks !
