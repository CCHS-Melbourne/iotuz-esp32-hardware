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
LIBS:alligator.x39
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
L CONN_01X03 P8
U 1 1 581D5ECE
P 4600 2700
F 0 "P8" H 4600 2900 50  0000 C CNN
F 1 "IRReceiver" V 4700 2700 50  0000 C CNN
F 2 "libs:TSOP38238.IRReceiver" H 4600 2700 50  0000 C CNN
F 3 "" H 4600 2700 50  0000 C CNN
F 4 "751-1227-ND" H 4600 2700 60  0001 C CNN "Digikey PN"
F 5 "http://www.digikey.com.au/product-detail/en/vishay-semiconductor-opto-division/TSOP38238/751-1227-ND/1681362" H 4600 2700 60  0001 C CNN "Link"
F 6 "TSOP38238" H 4600 2700 60  0001 C CNN "Manufacturer PN"
F 7 "1.12" H 4600 2700 60  0001 C CNN "Unit Cost"
	1    4600 2700
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR069
U 1 1 581D5F60
P 4050 2750
F 0 "#PWR069" H 4050 2600 50  0001 C CNN
F 1 "+3.3V" H 4050 2890 50  0000 C CNN
F 2 "" H 4050 2750 50  0000 C CNN
F 3 "" H 4050 2750 50  0000 C CNN
	1    4050 2750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR070
U 1 1 581D5F76
P 4250 2750
F 0 "#PWR070" H 4250 2500 50  0001 C CNN
F 1 "GND" H 4250 2600 50  0000 C CNN
F 2 "" H 4250 2750 50  0000 C CNN
F 3 "" H 4250 2750 50  0000 C CNN
	1    4250 2750
	1    0    0    -1  
$EndComp
Text Notes 3850 2350 0    60   ~ 0
38kHz sensitivity. \nSpectrum Cf around 940-950nm.
Text HLabel 3900 2500 0    60   Output ~ 0
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
	4400 2500 3900 2500
$Comp
L LED D3
U 1 1 581D68B3
P 4500 4800
F 0 "D3" H 4500 4900 50  0000 C CNN
F 1 "IRLED" H 4500 4700 50  0000 C CNN
F 2 "LEDs:LED-5MM" H 4500 4800 50  0001 C CNN
F 3 "" H 4500 4800 50  0000 C CNN
F 4 "751-1204-ND" H 4500 4800 60  0001 C CNN "Digikey PN"
F 5 "http://www.digikey.com.au/product-detail/en/vishay-semiconductor-opto-division/TSAL6200/751-1204-ND/1681339" H 4500 4800 60  0001 C CNN "Link"
F 6 "TSAL6200" H 4500 4800 60  0001 C CNN "Manufacturer PN"
F 7 "0.57" H 4500 4800 60  0001 C CNN "Unit Cost"
	1    4500 4800
	0    -1   -1   0   
$EndComp
$Comp
L R R16
U 1 1 581D690A
P 4500 4400
F 0 "R16" V 4580 4400 50  0000 C CNN
F 1 "22R 1/4W" V 4400 4400 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4430 4400 50  0001 C CNN
F 3 "" H 4500 4400 50  0000 C CNN
F 4 "P22.00BZCT-ND" V 4500 4400 60  0001 C CNN "Digikey PN"
F 5 "http://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-PA3J220V/P22.00BZCT-ND/5036282" V 4500 4400 60  0001 C CNN "Link"
F 6 "ERJ-PA3J220V" V 4500 4400 60  0001 C CNN "Manufacturer PN"
F 7 "0.11" V 4500 4400 60  0001 C CNN "Unit Cost"
	1    4500 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 4550 4500 4600
Wire Wire Line
	4500 4150 4500 4250
$Comp
L GND #PWR071
U 1 1 581D6BBC
P 4500 5100
F 0 "#PWR071" H 4500 4850 50  0001 C CNN
F 1 "GND" H 4500 4950 50  0000 C CNN
F 2 "" H 4500 5100 50  0000 C CNN
F 3 "" H 4500 5100 50  0000 C CNN
	1    4500 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 5000 4500 5100
Wire Wire Line
	4050 2950 4050 2750
$Comp
L +3.3V #PWR072
U 1 1 581D6BFC
P 4500 3400
F 0 "#PWR072" H 4500 3250 50  0001 C CNN
F 1 "+3.3V" H 4500 3540 50  0000 C CNN
F 2 "" H 4500 3400 50  0000 C CNN
F 3 "" H 4500 3400 50  0000 C CNN
	1    4500 3400
	1    0    0    -1  
$EndComp
Text HLabel 3900 3950 0    60   Input ~ 0
~IRTx
Text Notes 4700 5000 0    60   ~ 0
I_f roughly 90mA @ 1.3V
$Comp
L MOSFET_P Q4
U 1 1 582AD6C8
P 4400 3950
F 0 "Q4" V 4200 3800 60  0000 R CNN
F 1 "FDN340P" V 4300 3800 60  0000 R CNN
F 2 "freetronics_footprints:SOT23_FET" V 4100 3650 24  0000 C CNN
F 3 "" H 4400 3950 60  0000 C CNN
F 4 "FDN340PCT-ND" V 4400 3950 60  0001 C CNN "Digikey PN"
F 5 "http://www.digikey.com.au/product-detail/en/fairchild-semiconductor/FDN340P/FDN340PCT-ND/965604" V 4400 3950 60  0001 C CNN "Link"
F 6 "FDN340P" V 4400 3950 60  0001 C CNN "Manufacturer PN"
F 7 "0.39" V 4400 3950 60  0001 C CNN "Unit Cost"
	1    4400 3950
	1    0    0    1   
$EndComp
Wire Wire Line
	3900 3950 4200 3950
Wire Wire Line
	4500 3400 4500 3750
$Comp
L R R15
U 1 1 582B0DCC
P 4050 3750
F 0 "R15" V 4130 3750 50  0000 C CNN
F 1 "10K" V 3950 3750 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3980 3750 50  0001 C CNN
F 3 "" H 4050 3750 50  0000 C CNN
F 4 "311-10KGRCT-ND" V 4050 3750 60  0001 C CNN "Digikey PN"
F 5 "http://www.digikey.com.au/product-detail/en/yageo/RC0603JR-0710KL/311-10KGRCT-ND/729647" V 4050 3750 60  0001 C CNN "Link"
F 6 "RC0603JR-0710KL" V 4050 3750 60  0001 C CNN "Manufacturer PN"
F 7 "0.10" V 4050 3750 60  0001 C CNN "Unit Cost"
	1    4050 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3500 4050 3500
Wire Wire Line
	4050 3500 4050 3600
Connection ~ 4500 3500
Wire Wire Line
	4050 3900 4050 3950
Connection ~ 4050 3950
$EndSCHEMATC
