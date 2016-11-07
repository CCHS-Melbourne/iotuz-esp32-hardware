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
Sheet 6 7
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
L QDTech-3.2in-TFT U6
U 1 1 5817975D
P 4200 3000
F 0 "U6" H 3850 3900 60  0000 C CNN
F 1 "QDTech-3.2in-TFT" H 4200 2100 60  0000 C CNN
F 2 "libs:QDTech-3.2in-TFT" H 4150 2950 60  0001 C CNN
F 3 "" H 4150 2950 60  0001 C CNN
	1    4200 3000
	1    0    0    -1  
$EndComp
Text HLabel 1700 2450 0    60   Output ~ 0
SPI_MISO
Text HLabel 1700 2550 0    60   Input ~ 0
SPI_CLK
Text HLabel 1700 2650 0    60   Input ~ 0
SPI_MOSI
Text HLabel 1700 2850 0    60   Input ~ 0
SD_CS
Text HLabel 1700 3050 0    60   Input ~ 0
Touch_CS
Text HLabel 1700 3150 0    60   Output ~ 0
Touch_Pen
Text HLabel 1700 3350 0    60   Input ~ 0
Backlight_CTR
Text HLabel 1700 3500 0    60   Input ~ 0
LCD_CS
Text HLabel 1700 3600 0    60   Input ~ 0
LCD_WR
Text HLabel 1700 3700 0    60   Input ~ 0
LCD_RST
Text HLabel 1700 3800 0    60   Input ~ 0
LCD_RS
$Comp
L GND #PWR066
U 1 1 581ECEAF
P 5000 3250
F 0 "#PWR066" H 5000 3000 50  0001 C CNN
F 1 "GND" H 5000 3100 50  0000 C CNN
F 2 "" H 5000 3250 50  0000 C CNN
F 3 "" H 5000 3250 50  0000 C CNN
	1    5000 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 3250 5000 3200
Wire Wire Line
	5000 3200 4750 3200
Wire Wire Line
	4750 3100 4850 3100
Wire Wire Line
	4850 2400 4850 3200
Connection ~ 4850 3200
Wire Wire Line
	4750 2400 4850 2400
Connection ~ 4850 3100
Wire Wire Line
	4750 2500 4850 2500
Connection ~ 4850 2500
Connection ~ 4850 2600
Connection ~ 4850 2700
Connection ~ 4850 2800
Connection ~ 4850 2900
Connection ~ 4850 3000
Wire Wire Line
	4750 2600 4850 2600
Wire Wire Line
	4750 2700 4850 2700
Wire Wire Line
	4750 2800 4850 2800
Wire Wire Line
	4750 2900 4850 2900
Wire Wire Line
	4750 3000 4850 3000
$Comp
L GND #PWR067
U 1 1 581ECF12
P 3350 3250
F 0 "#PWR067" H 3350 3000 50  0001 C CNN
F 1 "GND" H 3350 3100 50  0000 C CNN
F 2 "" H 3350 3250 50  0000 C CNN
F 3 "" H 3350 3250 50  0000 C CNN
	1    3350 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 3200 3350 3200
Connection ~ 3350 3200
Wire Wire Line
	3600 2500 3350 2500
Connection ~ 3350 2500
Connection ~ 3350 2600
Connection ~ 3350 2700
Connection ~ 3350 2800
Connection ~ 3350 2900
Connection ~ 3350 3000
Connection ~ 3350 3100
Wire Wire Line
	3600 2600 3350 2600
Wire Wire Line
	3600 2700 3350 2700
Wire Wire Line
	3600 2800 3350 2800
Wire Wire Line
	3600 2900 3350 2900
Wire Wire Line
	3600 3000 3350 3000
Wire Wire Line
	3600 3100 3350 3100
Wire Wire Line
	3350 2500 3350 3250
$EndSCHEMATC
