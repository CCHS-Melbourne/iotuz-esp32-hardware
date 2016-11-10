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
LIBS:IoTuz-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 7
Title "ESPlant"
Date "2016-02-20"
Rev "V1.5"
Comp ""
Comment1 "TAPR Open Hardware License"
Comment2 "Copyright (C) 2015 John Spencer & Angus Gratton"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L BME280 U301
U 1 1 564CD8ED
P 3150 3300
F 0 "U301" H 3400 3000 60  0000 C CNN
F 1 "BME280" H 3150 3300 60  0000 C CNN
F 2 "libs:BME280" H 3150 3200 24  0000 C CNN
F 3 "" H 3150 3300 60  0000 C CNN
F 4 "828-1063-1-ND" H 3150 3300 60  0001 C CNN "Digikey PN"
F 5 "http://www.digikey.com.au/product-detail/en/bosch-sensortec/BME280/828-1063-1-ND/6136314" H 3150 3300 60  0001 C CNN "Link"
F 6 "BME280" H 3150 3300 60  0001 C CNN "Manufacturer PN"
F 7 "11.00" H 3150 3300 60  0001 C CNN "Unit Cost"
	1    3150 3300
	1    0    0    -1  
$EndComp
Text HLabel 1850 3450 0    60   Input ~ 0
I2C_SDA
Wire Wire Line
	1850 3450 2550 3450
Wire Wire Line
	1850 3550 2550 3550
Text HLabel 1850 3550 0    60   Input ~ 0
I2C_SCL
Wire Wire Line
	2400 3150 2550 3150
Wire Wire Line
	3250 2350 3250 2750
Wire Wire Line
	2050 2700 3800 2700
Wire Wire Line
	3100 2750 3100 2700
Connection ~ 3100 2700
Wire Wire Line
	2550 3050 2500 3050
Wire Wire Line
	2500 3050 2500 2700
Connection ~ 2500 2700
$Comp
L R R301
U 1 1 564CDBA3
P 2050 2950
F 0 "R301" V 2130 2950 50  0000 C CNN
F 1 "4.7K" V 2050 2950 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2150 2750 24  0000 C CNN
F 3 "" H 2050 2950 60  0000 C CNN
F 4 "311-4.7KGRCT-ND" V 2050 2950 60  0001 C CNN "Digikey PN"
F 5 "http://www.digikey.com.au/product-detail/en/yageo/RC0603JR-074K7L/311-4.7KGRCT-ND/729732" V 2050 2950 60  0001 C CNN "Link"
F 6 "RC0603JR-074K7L" V 2050 2950 60  0001 C CNN "Manufacturer PN"
F 7 "0.10" V 2050 2950 60  0001 C CNN "Unit Cost"
	1    2050 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 2900 2250 2700
Wire Wire Line
	2050 2800 2050 2700
Connection ~ 2250 2700
Wire Wire Line
	2250 3200 2250 3550
Connection ~ 2250 3550
Wire Wire Line
	2050 3100 2050 3450
Connection ~ 2050 3450
Connection ~ 3250 2700
$Comp
L +3.3V #PWR35
U 1 1 564CDC53
P 3250 2350
F 0 "#PWR35" H 3250 2200 50  0001 C CNN
F 1 "+3.3V" H 3250 2490 50  0000 C CNN
F 2 "" H 3250 2350 60  0000 C CNN
F 3 "" H 3250 2350 60  0000 C CNN
	1    3250 2350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR36
U 1 1 564CDC6D
P 3250 4000
F 0 "#PWR36" H 3250 3750 50  0001 C CNN
F 1 "GND" H 3250 3850 50  0000 C CNN
F 2 "" H 3250 4000 60  0000 C CNN
F 3 "" H 3250 4000 60  0000 C CNN
	1    3250 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 3850 3250 4000
Wire Wire Line
	3250 3950 3100 3950
Wire Wire Line
	3100 3950 3100 3850
Connection ~ 3250 3950
Text Notes 1950 3900 0    60   ~ 0
I2C Address 0x77\n
Text Notes 1800 1750 0    79   ~ 0
BME280 Temp/Humidity/Pressure\n
$Comp
L ADXL345 U302
U 1 1 564CE29B
P 6150 3100
F 0 "U302" H 5600 2550 60  0000 C CNN
F 1 "ADXL345" H 6150 2850 60  0000 C CNN
F 2 "libs:ADXL345" H 6100 2800 24  0000 C CNN
F 3 "" H 6100 2800 60  0000 C CNN
F 4 "ADXL345BCCZ-RLCT-ND" H 6150 3100 60  0001 C CNN "Digikey PN"
F 5 "http://www.digikey.com.au/product-detail/en/analog-devices-inc/ADXL345BCCZ-RL/ADXL345BCCZ-RLCT-ND/2237841" H 6150 3100 60  0001 C CNN "Link"
F 6 "ADXL345BCCZ-RL" H 6150 3100 60  0001 C CNN "Manufacturer PN"
F 7 "7.36" H 6150 3100 60  0001 C CNN "Unit Cost"
	1    6150 3100
	1    0    0    -1  
$EndComp
Text HLabel 4900 3250 0    60   Input ~ 0
I2C_SDA
Text HLabel 4900 3350 0    60   Input ~ 0
I2C_SCL
Wire Wire Line
	4900 3250 5300 3250
Wire Wire Line
	4900 3350 5300 3350
Wire Wire Line
	5300 2950 5100 2950
Wire Wire Line
	5100 2950 5100 2300
Wire Wire Line
	4750 2300 6150 2300
Wire Wire Line
	5950 2300 5950 2450
Wire Wire Line
	6150 2200 6150 2450
Connection ~ 5950 2300
$Comp
L +3.3V #PWR39
U 1 1 564CE661
P 6150 2200
F 0 "#PWR39" H 6150 2050 50  0001 C CNN
F 1 "+3.3V" H 6150 2340 50  0000 C CNN
F 2 "" H 6150 2200 60  0000 C CNN
F 3 "" H 6150 2200 60  0000 C CNN
	1    6150 2200
	1    0    0    -1  
$EndComp
Connection ~ 6150 2300
$Comp
L GND #PWR40
U 1 1 564CE6B9
P 6150 4100
F 0 "#PWR40" H 6150 3850 50  0001 C CNN
F 1 "GND" H 6150 3950 50  0000 C CNN
F 2 "" H 6150 4100 60  0000 C CNN
F 3 "" H 6150 4100 60  0000 C CNN
	1    6150 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 4000 6300 3900
Wire Wire Line
	6000 4000 6300 4000
Wire Wire Line
	6000 4000 6000 3900
Wire Wire Line
	6150 3900 6150 4100
Connection ~ 6150 4000
Wire Wire Line
	6900 2950 7100 2950
NoConn ~ 7100 2950
Wire Wire Line
	4750 2800 4750 2950
$Comp
L GND #PWR38
U 1 1 564CEC16
P 4750 2950
F 0 "#PWR38" H 4750 2700 50  0001 C CNN
F 1 "GND" H 4750 2800 50  0000 C CNN
F 2 "" H 4750 2950 60  0000 C CNN
F 3 "" H 4750 2950 60  0000 C CNN
	1    4750 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 2500 4750 2300
Connection ~ 5100 2300
$Comp
L C C301
U 1 1 564CEC68
P 3800 2900
F 0 "C301" H 3825 3000 50  0000 L CNN
F 1 "1uF" H 3825 2800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 3900 2750 24  0000 C CNN
F 3 "" H 3800 2900 60  0000 C CNN
F 4 "311-1372-1-ND" H 3800 2900 60  0001 C CNN "Digikey PN"
F 5 "http://www.digikey.com.au/product-detail/en/yageo/CC0603ZRY5V7BB105/311-1372-1-ND/2103156" H 3800 2900 60  0001 C CNN "Link"
F 6 "CC0603ZRY5V7BB105" H 3800 2900 60  0001 C CNN "Manufacturer PN"
F 7 "0.10" H 3800 2900 60  0001 C CNN "Unit Cost"
	1    3800 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 2700 3800 2750
Wire Wire Line
	3800 3050 3800 3150
$Comp
L GND #PWR37
U 1 1 564CED66
P 3800 3150
F 0 "#PWR37" H 3800 2900 50  0001 C CNN
F 1 "GND" H 3800 3000 50  0000 C CNN
F 2 "" H 3800 3150 60  0000 C CNN
F 3 "" H 3800 3150 60  0000 C CNN
	1    3800 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 3150 5000 3150
Text Notes 4700 3900 0    60   ~ 0
I2C Address 0x53\n
Text Notes 4650 1750 0    79   ~ 0
ADXL345 Fall Over Sensor / Accelerometer
Wire Wire Line
	6900 2850 7100 2850
Text HLabel 7100 2850 2    60   Input ~ 0
ADXL_INT
Wire Wire Line
	2400 3150 2400 2700
Connection ~ 2400 2700
Wire Wire Line
	5000 3150 5000 2900
Wire Wire Line
	5000 2900 4750 2900
Connection ~ 4750 2900
Wire Notes Line
	1150 1400 4300 1400
Wire Notes Line
	4300 1400 4300 4450
Wire Notes Line
	4300 4450 1150 4450
Wire Notes Line
	1150 4450 1150 1400
Text Notes 1200 1350 0    60   ~ 0
Recommend different or removal. -BP
$Comp
L R R302
U 1 1 58223067
P 2250 3050
F 0 "R302" V 2330 3050 50  0000 C CNN
F 1 "4.7K" V 2250 3050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2350 2850 24  0000 C CNN
F 3 "" H 2250 3050 60  0000 C CNN
F 4 "311-4.7KGRCT-ND" V 2250 3050 60  0001 C CNN "Digikey PN"
F 5 "http://www.digikey.com.au/product-detail/en/yageo/RC0603JR-074K7L/311-4.7KGRCT-ND/729732" V 2250 3050 60  0001 C CNN "Link"
F 6 "RC0603JR-074K7L" V 2250 3050 60  0001 C CNN "Manufacturer PN"
F 7 "0.10" V 2250 3050 60  0001 C CNN "Unit Cost"
	1    2250 3050
	1    0    0    -1  
$EndComp
$Comp
L C C302
U 1 1 58232438
P 4750 2650
F 0 "C302" H 4775 2750 50  0000 L CNN
F 1 "1uF" H 4775 2550 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 4850 2500 24  0000 C CNN
F 3 "" H 4750 2650 60  0000 C CNN
F 4 "311-1372-1-ND" H 4750 2650 60  0001 C CNN "Digikey PN"
F 5 "http://www.digikey.com.au/product-detail/en/yageo/CC0603ZRY5V7BB105/311-1372-1-ND/2103156" H 4750 2650 60  0001 C CNN "Link"
F 6 "CC0603ZRY5V7BB105" H 4750 2650 60  0001 C CNN "Manufacturer PN"
F 7 "0.10" H 4750 2650 60  0001 C CNN "Unit Cost"
	1    4750 2650
	1    0    0    -1  
$EndComp
$EndSCHEMATC
