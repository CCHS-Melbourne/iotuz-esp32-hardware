EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:freetronics_schematic
LIBS:ESP32-footprints-Shem-Lib
LIBS:cn3063
LIBS:cp2102
LIBS:ltc3426
LIBS:adxl345
LIBS:bme280
LIBS:lxdc2xq
LIBS:qdtech-3.2-tft
LIBS:nau8814
LIBS:IoTuz-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L NAU8814 U?
U 1 1 58192F60
P 5600 3750
F 0 "U?" H 5000 4450 60  0000 C CNN
F 1 "NAU8814" H 6150 3050 60  0000 C CNN
F 2 "" H 5600 3750 60  0001 C CNN
F 3 "" H 5600 3750 60  0001 C CNN
	1    5600 3750
	1    0    0    -1  
$EndComp
Text Notes 6300 4300 0    60   ~ 0
Unused Analogue - Float\nUnused Digital - GND
Text Notes 4350 2850 0    60   ~ 0
Mic Input - TRS jack?
$Comp
L SPEAKER SP?
U 1 1 581967C2
P 7500 3050
F 0 "SP?" H 7400 3300 50  0000 C CNN
F 1 "SPEAKER" H 7400 2800 50  0000 C CNN
F 2 "" H 7500 3050 50  0000 C CNN
F 3 "" H 7500 3050 50  0000 C CNN
F 4 "http://www.digikey.com.au/product-detail/en/cui-inc/CDM-12008/102-2494-ND/2791824" H 7500 3050 60  0001 C CNN "Link"
F 5 "2.44000" H 7500 3050 60  0001 C CNN "Unit Cost"
F 6 "102-2494-ND" H 7500 3050 60  0001 C CNN "Digikey PN"
F 7 "CDM-12008" H 7500 3050 60  0001 C CNN "Manufacturer PN"
	1    7500 3050
	1    0    0    -1  
$EndComp
$EndSCHEMATC
