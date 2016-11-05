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
Sheet 7 7
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
L CONN_01X03 P?
U 1 1 581D5ECE
P 4600 2700
F 0 "P?" H 4600 2900 50  0000 C CNN
F 1 "IRReceiver" V 4700 2700 50  0000 C CNN
F 2 "" H 4600 2700 50  0000 C CNN
F 3 "" H 4600 2700 50  0000 C CNN
F 4 "TSOP38238" H 4600 2700 60  0001 C CNN "Manufacturer PN"
F 5 "751-1227-ND" H 4600 2700 60  0001 C CNN "Digikey PN"
F 6 "http://www.digikey.com.au/product-detail/en/vishay-semiconductor-opto-division/TSOP38238/751-1227-ND/1681362" H 4600 2700 60  0001 C CNN "Link"
F 7 "1.12" H 4600 2700 60  0001 C CNN "Unit Cost"
	1    4600 2700
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 581D5F60
P 4050 2750
F 0 "#PWR?" H 4050 2600 50  0001 C CNN
F 1 "+3.3V" H 4050 2890 50  0000 C CNN
F 2 "" H 4050 2750 50  0000 C CNN
F 3 "" H 4050 2750 50  0000 C CNN
	1    4050 2750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 581D5F76
P 4250 2750
F 0 "#PWR?" H 4250 2500 50  0001 C CNN
F 1 "GND" H 4250 2600 50  0000 C CNN
F 2 "" H 4250 2750 50  0000 C CNN
F 3 "" H 4250 2750 50  0000 C CNN
	1    4250 2750
	1    0    0    -1  
$EndComp
Text Notes 3850 2350 0    60   ~ 0
38kHz sensitivity. \nSpectrum Cf around 940-950nm.
Text HLabel 4050 2500 0    60   Output ~ 0
IRRx
Wire Wire Line
	4400 2700 4250 2700
Wire Wire Line
	4250 2700 4250 2750
Wire Wire Line
	4400 2800 4400 2950
Wire Wire Line
	4400 2950 4050 2950
Wire Wire Line
	4400 2600 4400 2500
Wire Wire Line
	4400 2500 4050 2500
$Comp
L LED D?
U 1 1 581D68B3
P 4500 4600
F 0 "D?" H 4500 4700 50  0000 C CNN
F 1 "IRLED" H 4500 4500 50  0000 C CNN
F 2 "LEDs:LED-5MM" H 4500 4600 50  0001 C CNN
F 3 "" H 4500 4600 50  0000 C CNN
F 4 "TSAL6200" H 4500 4600 60  0001 C CNN "Manufacturer PN"
F 5 "751-1204-ND" H 4500 4600 60  0001 C CNN "Digikey PN"
F 6 "http://www.digikey.com.au/product-detail/en/vishay-semiconductor-opto-division/TSAL6200/751-1204-ND/1681339" H 4500 4600 60  0001 C CNN "Link"
F 7 "0.57" H 4500 4600 60  0001 C CNN "Unit Cost"
	1    4500 4600
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 581D690A
P 4500 4150
F 0 "R?" V 4580 4150 50  0000 C CNN
F 1 "22R" V 4500 4150 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4430 4150 50  0001 C CNN
F 3 "" H 4500 4150 50  0000 C CNN
	1    4500 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 4300 4500 4400
Wire Wire Line
	4500 3850 4500 4000
$Comp
L GND #PWR?
U 1 1 581D6BBC
P 4500 4950
F 0 "#PWR?" H 4500 4700 50  0001 C CNN
F 1 "GND" H 4500 4800 50  0000 C CNN
F 2 "" H 4500 4950 50  0000 C CNN
F 3 "" H 4500 4950 50  0000 C CNN
	1    4500 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 4800 4500 4950
Wire Wire Line
	4050 2950 4050 2750
$Comp
L +3.3V #PWR?
U 1 1 581D6BFC
P 4500 3300
F 0 "#PWR?" H 4500 3150 50  0001 C CNN
F 1 "+3.3V" H 4500 3440 50  0000 C CNN
F 2 "" H 4500 3300 50  0000 C CNN
F 3 "" H 4500 3300 50  0000 C CNN
	1    4500 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3300 4500 3450
Text HLabel 4050 3650 0    60   Input ~ 0
IRTx
Wire Wire Line
	4050 3650 4200 3650
Text Notes 4700 4600 0    60   ~ 0
I_f roughly 90mA @ 1.3V
Text Notes 4750 3600 0    60   ~ 0
Lazy, but we don't have any N-MOS on the design\nand will work just fine.
$Comp
L S8050 Q?
U 1 1 581E1075
P 4400 3650
F 0 "Q?" H 4600 3725 50  0000 L CNN
F 1 "S8050" H 4600 3650 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 4600 3575 50  0000 L CIN
F 3 "" H 4400 3650 50  0000 L CNN
	1    4400 3650
	1    0    0    -1  
$EndComp
$EndSCHEMATC
