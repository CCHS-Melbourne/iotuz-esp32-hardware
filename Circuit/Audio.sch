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
Text Notes 600  900  0    60   ~ 0
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
P 5450 2600
F 0 "C?" H 5460 2670 50  0000 L CNN
F 1 "2.2uF" H 5460 2520 50  0000 L CNN
F 2 "" H 5450 2600 50  0000 C CNN
F 3 "" H 5450 2600 50  0000 C CNN
	1    5450 2600
	1    0    0    -1  
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
	5450 2200 5450 2500
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
Text Label 5450 2200 0    60   ~ 0
MICOut
Text Label 1800 1900 0    60   ~ 0
MICOut
Text Notes 1550 1300 0    60   ~ 0
R needed?
Text Label 6600 3500 0    60   ~ 0
AGND
Wire Wire Line
	6450 3500 6600 3500
$Comp
L C C?
U 1 1 581BE775
P 7850 3950
F 0 "C?" H 7875 4050 50  0000 L CNN
F 1 "4.7uF" H 7875 3850 50  0000 L CNN
F 2 "" H 7888 3800 50  0000 C CNN
F 3 "" H 7850 3950 50  0000 C CNN
	1    7850 3950
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 581BE7BE
P 8100 3950
F 0 "C?" H 8125 4050 50  0000 L CNN
F 1 "4.7uF" H 8125 3850 50  0000 L CNN
F 2 "" H 8138 3800 50  0000 C CNN
F 3 "" H 8100 3950 50  0000 C CNN
	1    8100 3950
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 581BE7EF
P 8350 3950
F 0 "C?" H 8375 4050 50  0000 L CNN
F 1 "4.7uF" H 8375 3850 50  0000 L CNN
F 2 "" H 8388 3800 50  0000 C CNN
F 3 "" H 8350 3950 50  0000 C CNN
	1    8350 3950
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 581BE825
P 8600 3950
F 0 "C?" H 8625 4050 50  0000 L CNN
F 1 "4.7uF" H 8625 3850 50  0000 L CNN
F 2 "" H 8638 3800 50  0000 C CNN
F 3 "" H 8600 3950 50  0000 C CNN
	1    8600 3950
	1    0    0    -1  
$EndComp
$EndSCHEMATC
