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
LIBS:ili9341.touchlcd.red
LIBS:NCP5501
LIBS:Jack.3.5mm-CUI-MJ3523
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
Text HLabel 3300 2600 0    60   Output ~ 0
SPI1_MISO
Text HLabel 3300 2400 0    60   Input ~ 0
SPI1_CLK
Text HLabel 3300 2300 0    60   Input ~ 0
SPI1_MOSI
Text HLabel 5150 2300 2    60   Input ~ 0
SD_CS
Text HLabel 3300 2800 0    60   Input ~ 0
Touch_CS
Text HLabel 3300 3100 0    60   Output ~ 0
Touch_IRQ
Text HLabel 3300 2500 0    60   Input ~ 0
Backlight_CTR
Text HLabel 3300 2000 0    60   Input ~ 0
LCD_CS
Text HLabel 3300 2100 0    60   Input ~ 0
LCD_RST
Text HLabel 3300 2200 0    60   Input ~ 0
LCD_D/C
$Comp
L CONN_01X14 P6
U 1 1 5823DD70
P 2300 2450
F 0 "P6" H 2300 3200 50  0000 C CNN
F 1 "CONN_01X14" V 2400 2450 50  0000 C CNN
F 2 "" H 2300 2450 50  0000 C CNN
F 3 "" H 2300 2450 50  0000 C CNN
	1    2300 2450
	-1   0    0    -1  
$EndComp
$Comp
L CONN_01X04 P7
U 1 1 5823DDB5
P 6250 2450
F 0 "P7" H 6250 2700 50  0000 C CNN
F 1 "CONN_01X04" V 6350 2450 50  0000 C CNN
F 2 "" H 6250 2450 50  0000 C CNN
F 3 "" H 6250 2450 50  0000 C CNN
	1    6250 2450
	1    0    0    -1  
$EndComp
$Comp
L ili9341.TouchLCD.Red.NoName U6
U 1 1 5823E5D0
P 4300 2450
F 0 "U6" H 3900 3200 60  0000 C CNN
F 1 "ili9341.TouchLCD.Red.NoName" H 5000 1700 60  0000 C CNN
F 2 "libs:lcdtouchscreen.2.8inch-red.no-name.ili9341-xpt2046" H 4300 2450 60  0001 C CNN
F 3 "" H 4300 2450 60  0001 C CNN
	1    4300 2450
	1    0    0    -1  
$EndComp
Text Notes 1300 1650 0    60   ~ 0
Connectors are for BOM headers. \nNo footprint placement necessary
NoConn ~ 2500 1800
NoConn ~ 2500 1900
NoConn ~ 2500 2000
NoConn ~ 2500 2100
NoConn ~ 2500 2200
NoConn ~ 2500 2300
NoConn ~ 2500 2400
NoConn ~ 2500 2500
NoConn ~ 2500 2600
NoConn ~ 2500 2700
NoConn ~ 2500 2800
NoConn ~ 2500 2900
NoConn ~ 2500 3000
NoConn ~ 2500 3100
NoConn ~ 6050 2300
NoConn ~ 6050 2400
NoConn ~ 6050 2500
NoConn ~ 6050 2600
Wire Wire Line
	3300 2400 3650 2400
Wire Wire Line
	3550 2400 3550 3300
Wire Wire Line
	3550 2700 3650 2700
Connection ~ 3550 2400
Wire Wire Line
	3300 2300 3650 2300
Wire Wire Line
	3450 2300 3450 3500
Wire Wire Line
	3450 2900 3650 2900
Connection ~ 3450 2300
Wire Wire Line
	3300 2600 3650 2600
Wire Wire Line
	3350 2600 3350 3400
Wire Wire Line
	3350 3000 3650 3000
Connection ~ 3350 2600
Wire Wire Line
	3650 2800 3300 2800
Wire Wire Line
	3650 3100 3300 3100
Wire Wire Line
	3650 2500 3300 2500
Wire Wire Line
	3300 2200 3650 2200
Wire Wire Line
	3650 2100 3300 2100
Wire Wire Line
	3300 2000 3650 2000
$Comp
L +3.3V #PWR60
U 1 1 58242261
P 3550 1250
F 0 "#PWR60" H 3550 1100 50  0001 C CNN
F 1 "+3.3V" H 3550 1390 50  0000 C CNN
F 2 "" H 3550 1250 50  0000 C CNN
F 3 "" H 3550 1250 50  0000 C CNN
	1    3550 1250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR59
U 1 1 58242289
P 2700 1950
F 0 "#PWR59" H 2700 1700 50  0001 C CNN
F 1 "GND" H 2700 1800 50  0000 C CNN
F 2 "" H 2700 1950 50  0000 C CNN
F 3 "" H 2700 1950 50  0000 C CNN
	1    2700 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 1900 2700 1900
Wire Wire Line
	2700 1900 2700 1950
Wire Wire Line
	4950 2300 5150 2300
$Comp
L R R9
U 1 1 58247129
P 3400 1650
F 0 "R9" V 3480 1650 50  0000 C CNN
F 1 "10K" V 3300 1650 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3330 1650 50  0001 C CNN
F 3 "" H 3400 1650 50  0000 C CNN
F 4 "311-10KGRCT-ND" V 3400 1650 60  0001 C CNN "Digikey PN"
F 5 "http://www.digikey.com.au/product-detail/en/yageo/RC0603JR-0710KL/311-10KGRCT-ND/729647" V 3400 1650 60  0001 C CNN "Link"
F 6 "RC0603JR-0710KL" V 3400 1650 60  0001 C CNN "Manufacturer PN"
F 7 "0.10" V 3400 1650 60  0001 C CNN "Unit Cost"
	1    3400 1650
	-1   0    0    1   
$EndComp
Wire Wire Line
	3550 1250 3550 1800
Wire Wire Line
	3550 1800 3650 1800
Wire Wire Line
	3400 1800 3400 2100
Connection ~ 3400 2100
Wire Wire Line
	3400 1500 3400 1300
Wire Wire Line
	3400 1300 3550 1300
Connection ~ 3550 1300
Text Notes 5950 2050 0    60   ~ 0
Connectors are for BOM headers. \nNo footprint placement necessary
Wire Wire Line
	3550 3300 5050 3300
Wire Wire Line
	5050 3300 5050 2600
Wire Wire Line
	5050 2600 4950 2600
Connection ~ 3550 2700
Wire Wire Line
	4950 2500 5150 2500
Wire Wire Line
	5150 2500 5150 3400
Wire Wire Line
	5150 3400 3350 3400
Connection ~ 3350 3000
Wire Wire Line
	3450 3500 5250 3500
Wire Wire Line
	5250 3500 5250 2400
Wire Wire Line
	5250 2400 4950 2400
Connection ~ 3450 2900
$EndSCHEMATC
