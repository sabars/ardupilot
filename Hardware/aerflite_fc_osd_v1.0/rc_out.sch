EESchema Schematic File Version 2
LIBS:osd-rescue
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
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:contrib
LIBS:osd-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 15 20
Title ""
Date "9 jun 2016"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Connection ~ 7700 4925
Wire Wire Line
	7700 4750 7700 4925
Connection ~ 7100 4925
Wire Wire Line
	7100 4650 7100 4925
Wire Wire Line
	8650 3350 7275 3350
Wire Wire Line
	7275 3350 7275 3850
Wire Wire Line
	7275 3850 6250 3850
Wire Wire Line
	8650 3150 7075 3150
Wire Wire Line
	7075 3150 7075 3250
Wire Wire Line
	7075 3250 6250 3250
Wire Wire Line
	8650 2950 7075 2950
Wire Wire Line
	7075 2950 7075 2650
Wire Wire Line
	7075 2650 6250 2650
Connection ~ 8200 2050
Wire Wire Line
	8200 2050 8600 2050
Connection ~ 8200 2250
Wire Wire Line
	8200 2250 8600 2250
Wire Wire Line
	5700 1850 8600 1850
Wire Wire Line
	5050 4925 5050 4750
Connection ~ 6600 1850
Wire Wire Line
	6600 1675 6600 1850
Connection ~ 3400 4925
Wire Wire Line
	3400 4750 3400 4925
Wire Wire Line
	5100 2050 5100 1050
Wire Wire Line
	5100 1050 4825 1050
Wire Wire Line
	4450 3850 4550 3850
Wire Wire Line
	4425 3250 4550 3250
Connection ~ 6325 4925
Wire Wire Line
	6325 4825 6325 4925
Wire Wire Line
	5800 4925 7850 4925
Wire Wire Line
	5800 4925 5800 4750
Wire Wire Line
	4425 2950 4550 2950
Wire Wire Line
	5700 1850 5700 2050
Wire Wire Line
	6325 4425 6325 4350
Wire Wire Line
	6325 4350 6450 4350
Wire Wire Line
	4400 2650 4550 2650
Wire Wire Line
	4425 3550 4550 3550
Wire Wire Line
	4425 4150 4550 4150
Wire Wire Line
	3075 4925 5050 4925
Wire Wire Line
	3350 4200 3400 4200
Wire Wire Line
	3400 4200 3400 4350
Wire Wire Line
	8200 1850 8200 2350
Wire Wire Line
	8200 2350 8600 2350
Connection ~ 8200 1850
Wire Wire Line
	8600 2150 8200 2150
Connection ~ 8200 2150
Wire Wire Line
	8600 1950 8200 1950
Connection ~ 8200 1950
Wire Wire Line
	6250 2950 6975 2950
Wire Wire Line
	6975 2950 6975 3050
Wire Wire Line
	6975 3050 8650 3050
Wire Wire Line
	6250 3550 7150 3550
Wire Wire Line
	7150 3550 7150 3250
Wire Wire Line
	7150 3250 8650 3250
Wire Wire Line
	6250 4150 7575 4150
Wire Wire Line
	7575 4150 7575 3450
Wire Wire Line
	7575 3450 8650 3450
Wire Wire Line
	7550 4750 7550 4925
Connection ~ 7550 4925
$Comp
L CONN_1 P17
U 1 1 574F1CE3
P 7550 4600
F 0 "P17" H 7630 4600 40  0000 L CNN
F 1 "CONN_1" H 7550 4655 30  0001 C CNN
F 2 "CONN_1:TP" H 7550 4600 60  0001 C CNN
F 3 "" H 7550 4600 60  0001 C CNN
	1    7550 4600
	0    -1   -1   0   
$EndComp
$Comp
L CONN_1 P18
U 1 1 574F1CDE
P 7700 4600
F 0 "P18" H 7780 4600 40  0000 L CNN
F 1 "CONN_1" H 7700 4655 30  0001 C CNN
F 2 "CONN_1:TP" H 7700 4600 60  0001 C CNN
F 3 "" H 7700 4600 60  0001 C CNN
	1    7700 4600
	0    -1   -1   0   
$EndComp
$Comp
L PWR_FLAG #FLG012
U 1 1 574DB3A0
P 7100 4650
F 0 "#FLG012" H 7100 4920 30  0001 C CNN
F 1 "PWR_FLAG" H 7100 4880 30  0000 C CNN
F 2 "" H 7100 4650 60  0001 C CNN
F 3 "" H 7100 4650 60  0001 C CNN
	1    7100 4650
	1    0    0    -1  
$EndComp
$Comp
L CONN_6 P13
U 1 1 574D8029
P 9000 3200
F 0 "P13" V 8950 3200 60  0000 C CNN
F 1 "RCOUT_SIG" V 9050 3200 60  0000 C CNN
F 2 "EDGE_HDR_01_6:EDGE_HDR_01_6" H 9000 3200 60  0001 C CNN
F 3 "" H 9000 3200 60  0001 C CNN
	1    9000 3200
	1    0    0    1   
$EndComp
$Comp
L CONN_6 P12
U 1 1 574D8022
P 8950 2100
F 0 "P12" V 8900 2100 60  0000 C CNN
F 1 "RCOUT_5V" V 9000 2100 60  0000 C CNN
F 2 "EDGE_HDR_01_6:EDGE_HDR_01_6" H 8950 2100 60  0001 C CNN
F 3 "" H 8950 2100 60  0001 C CNN
	1    8950 2100
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG013
U 1 1 57445614
P 6600 1675
F 0 "#FLG013" H 6600 1945 30  0001 C CNN
F 1 "PWR_FLAG" H 6600 1905 30  0000 C CNN
F 2 "" H 6600 1675 60  0001 C CNN
F 3 "" H 6600 1675 60  0001 C CNN
	1    6600 1675
	1    0    0    -1  
$EndComp
Text HLabel 3350 4200 0    60   Input ~ 0
+3.3V
$Comp
L C-RESCUE-osd C42
U 1 1 57430947
P 3400 4550
F 0 "C42" H 3450 4650 50  0000 L CNN
F 1 "0.1uF" H 3450 4450 50  0000 L CNN
F 2 "SMD_0603:SMD_0603" H 3400 4550 60  0001 C CNN
F 3 "" H 3400 4550 60  0001 C CNN
F 4 "10V" H 3400 4550 60  0001 C CNN "Description"
	1    3400 4550
	1    0    0    -1  
$EndComp
Text HLabel 3075 4925 0    60   Input ~ 0
GND
Text Label 6450 4350 0    60   ~ 0
5V_EXT
$Comp
L C-RESCUE-osd C43
U 1 1 5743086E
P 6325 4625
F 0 "C43" H 6375 4725 50  0000 L CNN
F 1 "0.1uF" H 6375 4525 50  0000 L CNN
F 2 "SMD_0603:SMD_0603" H 6325 4625 60  0001 C CNN
F 3 "" H 6325 4625 60  0001 C CNN
F 4 "10V" H 6325 4625 60  0001 C CNN "Description"
	1    6325 4625
	1    0    0    -1  
$EndComp
Text Label 7850 4925 0    60   ~ 0
GND_EXT
$Comp
L SI8065 U19
U 1 1 574307A9
P 5400 3100
F 0 "U19" H 6050 1400 60  0000 C CNN
F 1 "SI8065" H 5450 1100 60  0000 C CNN
F 2 "QSSOP16:QSSOP16" H 5400 3100 60  0001 C CNN
F 3 "" H 5400 3100 60  0001 C CNN
	1    5400 3100
	1    0    0    -1  
$EndComp
Text HLabel 4425 3250 0    60   Input ~ 0
RCOUT_4
Text HLabel 4825 1050 0    60   Input ~ 0
+3.3V
Text Label 7350 1850 2    60   ~ 0
5V_EXT
Text HLabel 4400 2650 0    60   Input ~ 0
RCOUT_6
Text HLabel 4425 2950 0    60   Input ~ 0
RCOUT_5
Text HLabel 4425 3550 0    60   Input ~ 0
RCOUT_3
Text HLabel 4450 3850 0    60   Input ~ 0
RCOUT_2
Text HLabel 4425 4150 0    60   Input ~ 0
RCOUT_1
$EndSCHEMATC