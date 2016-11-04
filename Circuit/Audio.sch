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
LIBS:spu0410hr5h
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
$Comp
L SPEAKER SP?
U 1 1 581967C2
P 7500 2900
F 0 "SP?" H 7400 3150 50  0000 C CNN
F 1 "SPEAKER" H 7400 2650 50  0000 C CNN
F 2 "" H 7500 2900 50  0000 C CNN
F 3 "" H 7500 2900 50  0000 C CNN
F 4 "http://www.digikey.com.au/product-detail/en/cui-inc/CDM-12008/102-2494-ND/2791824" H 7500 2900 60  0001 C CNN "Link"
F 5 "2.44000" H 7500 2900 60  0001 C CNN "Unit Cost"
F 6 "102-2494-ND" H 7500 2900 60  0001 C CNN "Digikey PN"
F 7 "CDM-12008" H 7500 2900 60  0001 C CNN "Manufacturer PN"
	1    7500 2900
	1    0    0    -1  
$EndComp
Text Notes 4800 1050 0    60   ~ 0
"When the MIC- is used as a single ended input, \nMIC+ should be conned to VREF by setting PMICPGA[0] \naddress (0x2C) bit to LOW."
$Comp
L SPU0410HR5H MK?
U 1 1 581BC275
P 1400 1900
F 0 "MK?" H 1200 2200 60  0000 C CNN
F 1 "SPU0410HR5H" H 900 1550 60  0000 C CNN
F 2 "" H 1400 1900 60  0001 C CNN
F 3 "" H 1400 1900 60  0001 C CNN
	1    1400 1900
	1    0    0    -1  
$EndComp
NoConn ~ 5350 2900
$Comp
L C_Small C?
U 1 1 581BC31F
P 2000 1900
F 0 "C?" H 2010 1970 50  0000 L CNN
F 1 "2.2uF" H 2010 1820 50  0000 L CNN
F 2 "" H 2000 1900 50  0000 C CNN
F 3 "" H 2000 1900 50  0000 C CNN
	1    2000 1900
	0    1    1    0   
$EndComp
Text Label 4400 3500 0    60   ~ 0
MICBias
Wire Wire Line
	4750 3500 4400 3500
Text Label 1400 1150 0    60   ~ 0
MICBias
$Comp
L R R?
U 1 1 581BC437
P 1400 1300
F 0 "R?" V 1480 1300 50  0000 C CNN
F 1 "R" V 1400 1300 50  0000 C CNN
F 2 "" V 1330 1300 50  0000 C CNN
F 3 "" H 1400 1300 50  0000 C CNN
	1    1400 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2700 5450 2900
Text Label 4400 3350 0    60   ~ 0
AGND
Wire Wire Line
	4400 3350 4750 3350
Text Label 4400 3700 0    60   ~ 0
AGND
Wire Wire Line
	4400 3700 4750 3700
Text Label 1050 2550 0    60   ~ 0
AGND
Wire Wire Line
	1050 2550 1400 2550
Wire Wire Line
	1300 2400 1300 2450
Wire Wire Line
	1300 2450 1500 2450
Wire Wire Line
	1400 2550 1400 2450
Wire Wire Line
	1500 2450 1500 2400
Connection ~ 1400 2450
$Comp
L +3.3V #PWR?
U 1 1 581BE27A
P 5750 2750
F 0 "#PWR?" H 5750 2600 50  0001 C CNN
F 1 "+3.3V" H 5750 2890 50  0000 C CNN
F 2 "" H 5750 2750 50  0000 C CNN
F 3 "" H 5750 2750 50  0000 C CNN
	1    5750 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 2750 5750 2900
Text Label 5450 2700 1    60   ~ 0
MIC-
Text Label 2250 1900 0    60   ~ 0
MIC-
Text Notes 1550 1300 0    60   ~ 0
R needed?
Text Label 6600 3500 0    60   ~ 0
AGND
Wire Wire Line
	6450 3500 6600 3500
$Comp
L C C?
U 1 1 581BE775
P 5550 2300
F 0 "C?" H 5575 2400 50  0000 L CNN
F 1 "4.7uF" H 5575 2200 50  0000 L CNN
F 2 "" H 5588 2150 50  0000 C CNN
F 3 "" H 5550 2300 50  0000 C CNN
	1    5550 2300
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 581BE7BE
P 3600 4150
F 0 "C?" H 3625 4250 50  0000 L CNN
F 1 "4.7uF" H 3625 4050 50  0000 L CNN
F 2 "" H 3638 4000 50  0000 C CNN
F 3 "" H 3600 4150 50  0000 C CNN
	1    3600 4150
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 581BE7EF
P 3850 4150
F 0 "C?" H 3875 4250 50  0000 L CNN
F 1 "4.7uF" H 3875 4050 50  0000 L CNN
F 2 "" H 3888 4000 50  0000 C CNN
F 3 "" H 3850 4150 50  0000 C CNN
	1    3850 4150
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 581BE825
P 4100 4150
F 0 "C?" H 4125 4250 50  0000 L CNN
F 1 "4.7uF" H 4125 4050 50  0000 L CNN
F 2 "" H 4138 4000 50  0000 C CNN
F 3 "" H 4100 4150 50  0000 C CNN
	1    4100 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 1900 1900 1900
Wire Wire Line
	2100 1900 2250 1900
$Comp
L GND #PWR?
U 1 1 581BEFAA
P 5750 2200
F 0 "#PWR?" H 5750 1950 50  0001 C CNN
F 1 "GND" H 5750 2050 50  0000 C CNN
F 2 "" H 5750 2200 50  0000 C CNN
F 3 "" H 5750 2200 50  0000 C CNN
	1    5750 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 2150 5550 2000
Wire Wire Line
	5550 2000 5750 2000
Wire Wire Line
	5750 2000 5750 2200
Wire Wire Line
	5550 2450 5550 2900
$Comp
L C C?
U 1 1 581BF169
P 800 1900
F 0 "C?" H 825 2000 50  0000 L CNN
F 1 "4.7uF" H 825 1800 50  0000 L CNN
F 2 "" H 838 1750 50  0000 C CNN
F 3 "" H 800 1900 50  0000 C CNN
	1    800  1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 1150 800  1150
Wire Wire Line
	800  1150 800  1750
Wire Wire Line
	1400 2450 800  2450
Wire Wire Line
	800  2450 800  2050
$Comp
L GND #PWR?
U 1 1 581BF41C
P 6750 3800
F 0 "#PWR?" H 6750 3550 50  0001 C CNN
F 1 "GND" H 6750 3650 50  0000 C CNN
F 2 "" H 6750 3800 50  0000 C CNN
F 3 "" H 6750 3800 50  0000 C CNN
	1    6750 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 3800 6750 3800
Text Notes 9600 3850 0    60   ~ 0
I2C Mode - Address 0x34
NoConn ~ 5650 2900
Wire Wire Line
	7200 2800 5850 2800
Wire Wire Line
	5850 2800 5850 2900
Wire Wire Line
	7200 3000 7150 3000
Wire Wire Line
	7150 3000 7150 3600
Wire Wire Line
	7150 3600 6450 3600
Wire Notes Line
	9550 3800 6800 3800
Wire Notes Line
	6800 3700 9550 3700
Text Notes 9600 3700 0    60   ~ 0
Mono Out - NC or come out to header?
$Comp
L GND #PWR?
U 1 1 581BFD59
P 4600 4450
F 0 "#PWR?" H 4600 4200 50  0001 C CNN
F 1 "GND" H 4600 4300 50  0000 C CNN
F 2 "" H 4600 4450 50  0000 C CNN
F 3 "" H 4600 4450 50  0000 C CNN
	1    4600 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 4000 4750 4000
Wire Wire Line
	4600 4000 4600 4450
Wire Notes Line
	5350 2800 5350 1100
Text Label 4400 4000 0    60   ~ 0
AGND
Connection ~ 4600 4000
Wire Notes Line
	4400 4000 4400 5800
Text Notes 4150 6000 0    60   ~ 0
Net tie AGND & GND. \nDo not separate but do make sensible layout to isolate.\nSimilarly, VSSSPK should be isolated in layout.
Wire Wire Line
	3850 3900 4750 3900
Wire Wire Line
	4100 3900 4100 4000
Wire Wire Line
	3600 3800 4750 3800
Wire Wire Line
	3850 3800 3850 4000
Wire Wire Line
	4750 3600 3600 3600
Wire Wire Line
	3600 3600 3600 4000
Connection ~ 3850 3900
Connection ~ 4100 3900
Connection ~ 3600 3800
Connection ~ 3850 3800
$Comp
L +3.3V #PWR?
U 1 1 581C0164
P 3600 3600
F 0 "#PWR?" H 3600 3450 50  0001 C CNN
F 1 "+3.3V" H 3600 3740 50  0000 C CNN
F 2 "" H 3600 3600 50  0000 C CNN
F 3 "" H 3600 3600 50  0000 C CNN
	1    3600 3600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 581C01A1
P 3850 4450
F 0 "#PWR?" H 3850 4200 50  0001 C CNN
F 1 "GND" H 3850 4300 50  0000 C CNN
F 2 "" H 3850 4450 50  0000 C CNN
F 3 "" H 3850 4450 50  0000 C CNN
	1    3850 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 4450 3850 4300
Wire Wire Line
	3600 4400 4100 4400
Wire Wire Line
	4100 4400 4100 4300
Connection ~ 3850 4400
Wire Wire Line
	3600 4300 3600 4400
Wire Notes Line
	9550 2500 5650 2500
Wire Notes Line
	5650 2500 5650 2800
Text Notes 9600 2500 0    60   ~ 0
AUX input could go to DAC on ESP32..\nfor.. reasons?
$Comp
L GND #PWR?
U 1 1 581C0598
P 5850 4700
F 0 "#PWR?" H 5850 4450 50  0001 C CNN
F 1 "GND" H 5850 4550 50  0000 C CNN
F 2 "" H 5850 4700 50  0000 C CNN
F 3 "" H 5850 4700 50  0000 C CNN
	1    5850 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 4700 5850 4600
Wire Notes Line
	5900 4650 9550 4650
Text Notes 9600 4650 0    60   ~ 0
"When the pin is configured as output, it can be used\nfor signaling analog mute, temperature alert, \nPLL frequency output, and PLL frequency lock. The CSb/GPIO pin\ncan also output the master clock through a PLL or directly"
NoConn ~ 6450 3700
Wire Notes Line
	6550 4000 9550 4000
Text Notes 9550 4000 0    60   ~ 0
 2-Wire Serial Clock & Data
Wire Notes Line
	6550 4000 6550 3900
Wire Notes Line
	5350 4750 5650 4750
Wire Notes Line
	5500 4750 5500 5150
Text Notes 5250 5300 0    60   ~ 0
I2S Interface
Text HLabel 1400 3200 0    60   Input ~ 0
MCLK
Text HLabel 1400 3350 0    60   Input ~ 0
SCLK
Text HLabel 1400 3450 0    60   BiDi ~ 0
SDIO
Text HLabel 1400 3600 0    60   Input ~ 0
FS
Text HLabel 1400 3700 0    60   Input ~ 0
BCLK
Text HLabel 1400 3800 0    60   Input ~ 0
DACIN
Text HLabel 1400 3900 0    60   Output ~ 0
ADCOUT
$EndSCHEMATC
