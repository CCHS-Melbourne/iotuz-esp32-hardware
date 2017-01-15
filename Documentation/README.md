IoTuz - Hand-soldering through-hole components workshop instructions
=====

Errata for Tuesday 2017-01-17
-----------------------------

* The speaker (SP1) has not yet arrived from overseas, but we antipicate
  receiving it in the next couple of days, during LCA2017.

* The microphone (MK91) will require an engineering modification before
  it can be attached to the IoTuz PCB.

* A few IoTuz PCBs do not have the charge controller CN3063 (U201) installed
  and we will let you know when this can be rectified.  This means that the
  IoTuz PCB won't charge the LiPo battery, but works in every other way.

Introduction
------------

These instructions suggest an order to building your IoTuz that are not
absolute, there is no one right way to do this.  Experienced attendees
are likely to have their own preferences.  Our main suggestion is to
start with the lowest profile (shortest) components first to avoid
pieces falling out of the PCBs if you placed a larger component first.
Also large components, like the joystick or LCD touch-screen become hard
to work around when they are in the way.

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
  supply.  These can be measured on the pins along the bottom of the PCB

* Remove excessive flux with flux remover

* Visually inspect the board for any solder bridges or mistakes.
  For example, carefully check the headers pins along the bottom
  of the PCB and the two large RGB LEDs pins for solder bridges

* If you are new to hardware assembly, ask another more experienced
  person to double-check your assembly effort

Please treat the LiPo battery with great care.  There can be a lot of
stored energy potential in these devices and they are not resilient to
mistreatment.  Please take care not to puncture the LiPo battery when
inserting or removing it from the battery holder, which is a tight fit.
Never use a sharp object to assist in removing the LiPo battery. When
travelling, especially on airplanes, place the LiPo battery in the
supplied orange box.

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

![IoTuz image 4](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Documentation/Images/IMG_8476.jpg)

A pointed soldering iron tip will be fine for the through-hole components,
but if you'd like to see a chisel tip in action attaching the ESP32 module
to your PCB then
[watch this video](https://www.youtube.com/watch?v=haz02WWTRY4) !
