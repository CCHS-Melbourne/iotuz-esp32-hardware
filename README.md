IoTuz - The Internet of Tuz
=============

Welcome to the linux.conf.au 2017 Open Hardware Project.  You can see information about this and other MiniConfs at http://www.openhardwareconf.org/wiki/Main_Page

This year we're bringing a project with the hottest new micro for people to have a play with. The ESP32 is the successor to the hugely popular ESP8266 chip we used for 2016 Open Hardware Project, the (ESPlant, https://github.com/CCHS-Melbourne/ESPlant).

The ESP32 is definitely the big brother of the ESP8266.  Included in it's features: 2.4 GHz Wi-Fi, Bluetooth, Dual Core CPUs

As usual we've got a custom board and some custom software to get you started on your journey!  Check out the subdirectories in this repo for more information.

IoTuz firmware can be found at https://github.com/CCHS-Melbourne/iotuz-esp32-firmware

![IoTuz Render](https://github.com/CCHS-Melbourne/IoTuz/blob/master/Circuit/Resources/IoTuz-Render.png)

Hardware assembly instructions
------------------------------
[Workshop assembly instructions](https://github.com/CCHS-Melbourne/IoTuz/wiki/Assembly-Instructions)
for people attending the LCA2017 Open Hardware Mini-Conference.

Software instructions
---------------------

[Software setup instructions](https://github.com/CCHS-Melbourne/IoTuz/wiki/Software-Instructions)

Features
--------

* Coming Soon

Getting IoTuz
---------------

You need to clone the IoTuz repo from github, using the `--recursive` option to pick up submodules. If you download a zip file then the submodule parts will be missing, so we recommend using git to get it.

The command is:
```
git clone --recursive https://github.com/CCHS-Melbourne/IoTuz
```


Where to Now?
-------------

Check out (and contribute to) [the wiki](https://github.com/CCHS-Melbourne/IoTuz/wiki). There is a pinout summary, sensor summary, power information, etc.

CREDITS
------------

Made at hackmelbourne.org !

This project was designed by the 2017 linux.conf.au Open Hardware Team!
 - [Bob Powers](https://github.com/rdpowers)
 - [John Spencer](https://github.com/mage0r)
 - [Angus Gratton](https://github.com/projectgus)
 - [Andy Gelme](https://github.com/geekscape)
 - [Jon Oxer](https://github.com/jonoxer)
 - [Mark Wolfe](https://github.com/wolfeidau)
 - [Ian Firns](https://github.com/firnsy)

Art work: Tasmanian Devil ["Tuz" reference](http://www.redbubble.com/people/taniawalker/works/22375875-round-tasmania-vignettes) (C) 2016 by [Tania Walker](http://www.taniawalker.com).  License [CC-BY-NC-SA](https://creativecommons.org/licenses/by-nc-sa/2.0).  This art work is only going to be used on the PCB production run for the [LCA2017 Open Hardware Mini-Conference](http://www.openhardwareconf.org/wiki/OHC2017).

SPECIAL THANKS
------------

[EspressIF](https://espressif.com/) - The company behind the hugely popular ESP8266 chips we used in 2016 and the brand new ESP32 chips we're using this year.  EspressIF has kindly donated the ESP32 chips we'll be using on the boards.

To the [HackMelbourne](http://hackmelbourne.org) community of Melbourne, Australia.

The Desk Solder protectors feature graphics from [Adafruit Reference Cards](https://github.com/adafruit/Reference-Cards).

To all other open-source developers whose countless hours supported every other aspect of this design.

DISTRIBUTION
------------
The specific terms of distribution of this project are governed by the
license referenced below. Please contact the copyright owner if you wish to modify the board for distribution. Please utilize this design for personal or research projects. Please acknowledge all contributors.

LICENSE
-------
Licensed under the TAPR Open Hardware License (www.tapr.org/OHL).
The "LICENSE" file is a copy of this license in plain text format.

Copyright John Spencer, Bob Powers, Angus Gratton, Andy Gelme, Jon Oxer, Mark Wolfe 2016
