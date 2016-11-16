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
Text HLabel 1700 2250 0    60   Input ~ 0
~Backlight_CTR
Text HLabel 3300 2000 0    60   Input ~ 0
LCD_CS
Text HLabel 3300 2100 0    60   Input ~ 0
LCD_RST
Text HLabel 3300 2200 0    60   Input ~ 0
LCD_D/C
$Comp
L CONN_01X14 P6
U 1 1 5823DD70
P 650 2450
F 0 "P6" H 650 3200 50  0000 C CNN
F 1 "CONN_01X14" V 750 2450 50  0000 C CNN
F 2 "" H 650 2450 50  0000 C CNN
F 3 "" H 650 2450 50  0000 C CNN
F 4 "929974E-01-14-ND" H 650 2450 60  0001 C CNN "Digikey PN"
F 5 "http://www.digikey.com.au/product-detail/en/3m/929974-01-14-RK/929974E-01-14-ND/1094267" H 650 2450 60  0001 C CNN "Link"
F 6 "929974-01-14-RK" H 650 2450 60  0001 C CNN "Manufacturer PN"
F 7 "1.45" H 650 2450 60  0001 C CNN "Unit Cost"
	1    650  2450
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
F 4 "3M9515-ND" H 6250 2450 60  0001 C CNN "Digikey PN"
F 5 "http://www.digikey.com.au/product-detail/en/3m/960104-6202-AR/3M9515-ND/2071556" H 6250 2450 60  0001 C CNN "Link"
F 6 "960104-6202-AR" H 6250 2450 60  0001 C CNN "Manufacturer PN"
F 7 "0.81" H 6250 2450 60  0001 C CNN "Unit Cost"
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
Text Notes 800  1400 0    60   ~ 0
Connectors are for BOM headers. \nNo footprint placement necessary
NoConn ~ 850  1800
NoConn ~ 850  1900
NoConn ~ 850  2000
NoConn ~ 850  2100
NoConn ~ 850  2200
NoConn ~ 850  2300
NoConn ~ 850  2400
NoConn ~ 850  2500
NoConn ~ 850  2600
NoConn ~ 850  2700
NoConn ~ 850  2800
NoConn ~ 850  2900
NoConn ~ 850  3000
NoConn ~ 850  3100
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
	2300 2500 3650 2500
Wire Wire Line
	3300 2200 3650 2200
Wire Wire Line
	3650 2100 3300 2100
Wire Wire Line
	3300 2000 3650 2000
$Comp
L +3.3V #PWR064
U 1 1 58242261
P 3550 1250
F 0 "#PWR064" H 3550 1100 50  0001 C CNN
F 1 "+3.3V" H 3550 1390 50  0000 C CNN
F 2 "" H 3550 1250 50  0000 C CNN
F 3 "" H 3550 1250 50  0000 C CNN
	1    3550 1250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR065
U 1 1 58242289
P 2700 1950
F 0 "#PWR065" H 2700 1700 50  0001 C CNN
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
$Comp
L +3.3V #PWR066
U 1 1 582B4A02
P 2300 1700
F 0 "#PWR066" H 2300 1550 50  0001 C CNN
F 1 "+3.3V" H 2300 1840 50  0000 C CNN
F 2 "" H 2300 1700 50  0000 C CNN
F 3 "" H 2300 1700 50  0000 C CNN
	1    2300 1700
	1    0    0    -1  
$EndComp
$Comp
L MOSFET_P Q3
U 1 1 582B4A0C
P 2200 2250
F 0 "Q3" V 2150 2100 60  0000 R CNN
F 1 "FDN340P" V 2400 2100 60  0000 R CNN
F 2 "freetronics_footprints:SOT23_FET" V 1900 1950 24  0000 C CNN
F 3 "" H 2200 2250 60  0000 C CNN
F 4 "FDN340PCT-ND" V 2200 2250 60  0001 C CNN "Digikey PN"
F 5 "http://www.digikey.com.au/product-detail/en/fairchild-semiconductor/FDN340P/FDN340PCT-ND/965604" V 2200 2250 60  0001 C CNN "Link"
F 6 "FDN340P" V 2200 2250 60  0001 C CNN "Manufacturer PN"
F 7 "0.39" V 2200 2250 60  0001 C CNN "Unit Cost"
	1    2200 2250
	1    0    0    1   
$EndComp
Wire Wire Line
	1700 2250 2000 2250
Wire Wire Line
	2300 1700 2300 2050
$Comp
L R R22
U 1 1 582B4A19
P 1850 2050
F 0 "R22" V 1930 2050 50  0000 C CNN
F 1 "10K" V 1750 2050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1780 2050 50  0001 C CNN
F 3 "" H 1850 2050 50  0000 C CNN
F 4 "311-10KGRCT-ND" V 1850 2050 60  0001 C CNN "Digikey PN"
F 5 "http://www.digikey.com.au/product-detail/en/yageo/RC0603JR-0710KL/311-10KGRCT-ND/729647" V 1850 2050 60  0001 C CNN "Link"
F 6 "RC0603JR-0710KL" V 1850 2050 60  0001 C CNN "Manufacturer PN"
F 7 "0.10" V 1850 2050 60  0001 C CNN "Unit Cost"
	1    1850 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 1800 1850 1800
Wire Wire Line
	1850 1800 1850 1900
Connection ~ 2300 1800
Wire Wire Line
	1850 2200 1850 2250
Connection ~ 1850 2250
Wire Wire Line
	2300 2450 2300 2500
$EndSCHEMATC
