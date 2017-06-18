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
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:contrib
LIBS:osd-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 20 20
Title "psu"
Date "2016-07-16"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 2900 2350 0    45   ~ 0
SWITCHER_BST
Text Label 4450 2350 0    45   ~ 0
SWITCHER_SW
Text Label 2150 2850 0    45   ~ 0
VIN+SW
Text Notes 10100 5600 0    45   ~ 0
5V OUT
NoConn ~ 9525 5600
Wire Wire Line
	9525 5500 9300 5500
Wire Wire Line
	9300 5500 9300 5375
Wire Wire Line
	9300 5375 9125 5375
Wire Wire Line
	8625 5375 8450 5375
Wire Wire Line
	8450 5375 8450 4975
Connection ~ 7500 5700
Wire Wire Line
	7325 5700 9525 5700
Connection ~ 2825 2850
Wire Wire Line
	2825 2850 2825 2950
Wire Wire Line
	2825 2950 2975 2950
Connection ~ 4575 2625
Wire Wire Line
	4575 2350 4575 2750
Wire Wire Line
	4575 2350 3925 2350
Connection ~ 4400 4000
Wire Wire Line
	4400 4000 4400 2850
Wire Wire Line
	4400 2850 4275 2850
Wire Wire Line
	4575 2750 4275 2750
Connection ~ 6400 4000
Wire Wire Line
	6400 4000 6400 3600
Wire Wire Line
	7925 2600 7925 3200
Connection ~ 7925 2600
Connection ~ 1675 4000
Wire Wire Line
	1675 4000 1675 3050
Wire Wire Line
	7500 5525 7500 5700
Wire Wire Line
	7000 4975 6725 4975
Wire Wire Line
	4700 5150 5450 5150
Connection ~ 3200 5150
Wire Wire Line
	3200 5300 3200 5150
Wire Wire Line
	2750 5150 3500 5150
Connection ~ 2625 2850
Wire Wire Line
	2625 2750 2625 2850
Connection ~ 2775 4000
Wire Wire Line
	2775 4000 2775 3750
Connection ~ 7450 4000
Wire Wire Line
	7450 4000 7450 2800
Connection ~ 8675 4000
Wire Wire Line
	9375 4000 9375 3800
Wire Wire Line
	9075 3200 10025 3200
Wire Wire Line
	7925 3200 8275 3200
Wire Wire Line
	8675 4000 8675 3500
Connection ~ 3825 4000
Wire Wire Line
	3825 4000 3825 3350
Wire Wire Line
	4850 4000 4850 3800
Connection ~ 4850 4000
Connection ~ 5650 2600
Wire Wire Line
	5650 2600 5650 2700
Wire Wire Line
	5650 3200 5650 3400
Wire Wire Line
	5650 4000 5650 3900
Connection ~ 5650 4000
Wire Wire Line
	4850 3500 4850 2600
Connection ~ 4850 2600
Wire Wire Line
	5650 3300 4575 3300
Connection ~ 5650 3300
Wire Wire Line
	4575 3300 4575 3050
Wire Wire Line
	4575 2625 4575 2600
Wire Wire Line
	4575 2600 4950 2600
Wire Wire Line
	5550 2600 7200 2600
Wire Wire Line
	7700 2600 8125 2600
Wire Wire Line
	7975 2450 7975 2600
Connection ~ 7975 2600
Wire Wire Line
	6900 3200 6900 3350
Connection ~ 9375 3200
Wire Wire Line
	9775 4000 9775 3800
Connection ~ 9375 4000
Wire Wire Line
	9775 3200 9775 3400
Wire Wire Line
	9375 3400 9375 3200
Connection ~ 9775 3200
Wire Wire Line
	2775 2850 2775 3350
Connection ~ 2775 2850
Wire Wire Line
	1425 2850 1275 2850
Wire Wire Line
	1300 4000 9775 4000
Wire Wire Line
	4100 5900 4100 5750
Wire Wire Line
	2750 5900 5150 5900
Wire Wire Line
	5150 5900 5150 5700
Connection ~ 4100 5900
Wire Wire Line
	3200 5900 3200 5700
Connection ~ 3200 5900
Wire Wire Line
	5150 5300 5150 5150
Connection ~ 5150 5150
Wire Wire Line
	7300 4975 9350 4975
Wire Wire Line
	7500 5125 7500 4975
Connection ~ 7500 4975
Wire Wire Line
	3425 4000 3425 3800
Connection ~ 3425 4000
Wire Wire Line
	6400 2600 6400 3200
Connection ~ 6400 2600
Wire Wire Line
	6900 4000 6900 3850
Connection ~ 6900 4000
Wire Wire Line
	4575 3050 4275 3050
Wire Wire Line
	2975 2750 2850 2750
Wire Wire Line
	2850 2750 2850 2350
Wire Wire Line
	2850 2350 3525 2350
Wire Wire Line
	1925 2850 2975 2850
Wire Wire Line
	6900 2900 6900 2600
Connection ~ 6900 2600
Connection ~ 8450 4975
Wire Wire Line
	8875 5700 8875 5575
Connection ~ 8875 5700
$Comp
L CAP3T C69
U 1 1 57517E18
P 8875 5375
F 0 "C69" H 9025 5125 60  0000 C CNN
F 1 "NFM18PS105D0J3" H 9075 5625 60  0000 C CNN
F 2 "SMD_0603-3T_FILT:SMD_0603-3T_C_FILT_RND" H 8875 5375 60  0001 C CNN
F 3 "" H 8875 5375 60  0001 C CNN
	1    8875 5375
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 P19
U 1 1 57517D7D
P 9875 5600
F 0 "P19" V 9825 5600 40  0000 C CNN
F 1 "5V_OUT" V 9925 5600 40  0000 C CNN
F 2 "JST_GH3_vert:JST_GH3_vert" H 9875 5600 60  0001 C CNN
F 3 "" H 9875 5600 60  0001 C CNN
	1    9875 5600
	1    0    0    -1  
$EndComp
NoConn ~ 2975 3050
$Comp
L ADP2302 U25
U 1 1 575178B7
P 3625 2900
F 0 "U25" H 3625 2850 60  0000 C CNN
F 1 "ADP2302" H 3625 3000 60  0000 C CNN
F 2 "SOIC8-TPAD:SOIC8-TPAD" H 3625 2900 60  0001 C CNN
F 3 "" H 3625 2900 60  0001 C CNN
	1    3625 2900
	1    0    0    -1  
$EndComp
$Comp
L CAP3T C60
U 1 1 5748263C
P 1675 2850
F 0 "C60" H 1825 2600 60  0000 C CNN
F 1 "NFM21PC104R1E3" H 1875 3100 60  0000 C CNN
F 2 "footprints:NFM21CC" H 1675 2850 60  0001 C CNN
F 3 "" H 1675 2850 60  0001 C CNN
	1    1675 2850
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG017
U 1 1 574467B3
P 3425 3800
F 0 "#FLG017" H 3425 4070 30  0001 C CNN
F 1 "PWR_FLAG" H 3425 4030 30  0000 C CNN
F 2 "" H 3425 3800 60  0001 C CNN
F 3 "" H 3425 3800 60  0001 C CNN
	1    3425 3800
	1    0    0    -1  
$EndComp
Text Label 2750 5150 2    60   ~ 0
+5.5V
Text Label 6725 4975 2    60   ~ 0
+5.5V
Text Label 8125 2600 0    60   ~ 0
+5.5V
Text HLabel 7325 5700 0    60   BiDi ~ 0
GND
$Comp
L C-RESCUE-osd C67
U 1 1 57436A1F
P 7500 5325
F 0 "C67" H 7550 5425 50  0000 L CNN
F 1 "1uF" H 7550 5225 50  0000 L CNN
F 2 "SMD_0603:SMD_0603" H 7500 5325 60  0001 C CNN
F 3 "" H 7500 5325 60  0001 C CNN
F 4 "15V" H 7500 5325 60  0001 C CNN "Description"
	1    7500 5325
	1    0    0    -1  
$EndComp
$Comp
L DIODESCH_IPC7531_2005 D5
U 1 1 574369E6
P 7150 4975
F 0 "D5" H 7150 5075 40  0000 C CNN
F 1 "SSA33L" H 7150 4875 40  0000 C CNN
F 2 "DO-214AC:DO-214AC" H 7150 4975 60  0001 C CNN
F 3 "" H 7150 4975 60  0001 C CNN
	1    7150 4975
	-1   0    0    1   
$EndComp
Text HLabel 9350 4975 2    60   Output ~ 0
+5V_RAW
Text HLabel 5450 5150 2    60   Output ~ 0
+5V_ANA
$Comp
L C-RESCUE-osd C62
U 1 1 5743668A
P 3200 5500
F 0 "C62" H 3250 5600 50  0000 L CNN
F 1 "0.1uF" H 3250 5400 50  0000 L CNN
F 2 "SMD_0603:SMD_0603" H 3200 5500 60  0001 C CNN
F 3 "" H 3200 5500 60  0001 C CNN
F 4 "15V" H 3200 5500 60  0001 C CNN "Description"
	1    3200 5500
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-osd C64
U 1 1 57436687
P 5150 5500
F 0 "C64" H 5200 5600 50  0000 L CNN
F 1 "1uF" H 5200 5400 50  0000 L CNN
F 2 "SMD_0603:SMD_0603" H 5150 5500 60  0001 C CNN
F 3 "" H 5150 5500 60  0001 C CNN
F 4 "15V" H 5150 5500 60  0001 C CNN "Description"
	1    5150 5500
	1    0    0    -1  
$EndComp
Text HLabel 2750 5900 0    60   BiDi ~ 0
GND
$Comp
L MCP1700 U26
U 1 1 5743664A
P 4100 5250
F 0 "U26" H 4475 4850 60  0000 C CNN
F 1 "MCP1700" H 4125 5225 60  0000 C CNN
F 2 "SOT23-3:SOT23-3" H 4100 5250 60  0001 C CNN
F 3 "" H 4100 5250 60  0001 C CNN
	1    4100 5250
	1    0    0    -1  
$EndComp
$Comp
L 7805 U27
U 1 1 574364B0
P 8675 3250
F 0 "U27" H 8825 3054 60  0000 C CNN
F 1 "uA78M33" H 8675 3450 60  0000 C CNN
F 2 "SOT223_2p:SOT223_2p" H 8675 3250 60  0001 C CNN
F 3 "" H 8675 3250 60  0001 C CNN
	1    8675 3250
	1    0    0    -1  
$EndComp
Text Notes 8575 3000 0    60   ~ 0
0.6 W
Text Notes 9475 2950 0    60   ~ 0
250 mA
$Comp
L PWR_FLAG #FLG018
U 1 1 5740334C
P 2625 2750
F 0 "#FLG018" H 2625 3020 30  0001 C CNN
F 1 "PWR_FLAG" H 2625 2980 30  0000 C CNN
F 2 "" H 2625 2750 60  0001 C CNN
F 3 "" H 2625 2750 60  0001 C CNN
	1    2625 2750
	1    0    0    -1  
$EndComp
Text HLabel 1300 4000 0    60   BiDi ~ 0
GND
Text HLabel 1275 2850 0    45   Input ~ 0
VIN+
$Comp
L CAP3T C66
U 1 1 573C4D8A
P 7450 2600
F 0 "C66" H 7600 2350 60  0000 C CNN
F 1 "NFM18PS105D0J3" H 7250 2875 60  0000 C CNN
F 2 "SMD_0603-3T_FILT:SMD_0603-3T_C_FILT_RND" H 7450 2600 60  0001 C CNN
F 3 "" H 7450 2600 60  0001 C CNN
	1    7450 2600
	1    0    0    -1  
$EndComp
$Comp
L LED_IPC-7351_2005 D6
U 1 1 558BAE9C
P 6900 3050
F 0 "D6" H 6900 2900 50  0000 C CNN
F 1 "Blue_Led" H 6900 3200 50  0000 C CNN
F 2 "LED_0603_IPC-7351_2005:LED_0603_IPC-7351_2005" H 6900 3050 60  0001 C CNN
F 3 "D" H 6900 3050 60  0001 C CNN
F 4 "M" H 6900 3050 60  0001 C CNN "MFG Name"
F 5 "P" H 6900 3050 60  0001 C CNN "MFG Part Num"
F 6 "Led/Blue/0603" H 6900 3050 60  0001 C CNN "Description"
	1    6900 3050
	0    -1   -1   0   
$EndComp
Text Label 5000 3300 0    45   ~ 0
SWITCHER_FB
Text Label 5750 2600 0    45   ~ 0
SWITCHER_+5V
$Comp
L PWR_FLAG #FLG019
U 1 1 54F72D02
P 7975 2450
F 0 "#FLG019" H 7975 2720 30  0001 C CNN
F 1 "PWR_FLAG" H 7975 2680 30  0000 C CNN
F 2 "" H 7975 2450 60  0001 C CNN
F 3 "" H 7975 2450 60  0001 C CNN
	1    7975 2450
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-osd C61
U 1 1 54846DC1
P 2775 3550
F 0 "C61" H 2825 3650 50  0000 L CNN
F 1 "4.7uF" H 2825 3450 50  0000 L CNN
F 2 "SMD_0805:SMD_0805" H 2775 3550 60  0001 C CNN
F 3 "D" H 2775 3550 60  0001 C CNN
F 4 "Capacitor/4.7uF/50V/+-20%/X5R/1206" H 2775 3550 60  0001 C CNN "Description"
F 5 "M" H 2775 3550 60  0001 C CNN "MFG Name"
F 6 "P" H 2775 3550 60  0001 C CNN "MFG Part Num"
	1    2775 3550
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-osd C71
U 1 1 54749249
P 9775 3600
F 0 "C71" H 9825 3700 50  0000 L CNN
F 1 "0.1uF" H 9825 3500 50  0000 L CNN
F 2 "SMD_0603:SMD_0603" H 9775 3600 60  0001 C CNN
F 3 "D" H 9775 3600 60  0001 C CNN
F 4 "Capacitor/0.1uF/10V/+-20%/X7R/0603" H 9775 3600 60  0001 C CNN "Description"
F 5 "M" H 9775 3600 60  0001 C CNN "MFG Name"
F 6 "P" H 9775 3600 60  0001 C CNN "MFG Part Num"
	1    9775 3600
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-osd C70
U 1 1 547491F8
P 9375 3600
F 0 "C70" H 9425 3700 50  0000 L CNN
F 1 "22uF" H 9425 3500 50  0000 L CNN
F 2 "SMD_0805:SMD_0805" H 9375 3600 60  0001 C CNN
F 3 "D" H 9375 3600 60  0001 C CNN
F 4 "Capacitor/10uF/10V/-20%+80%/Y5V/0805" H 9375 3600 60  0001 C CNN "Description"
F 5 "M" H 9375 3600 60  0001 C CNN "MFG Name"
F 6 "P" H 9375 3600 60  0001 C CNN "MFG Part Num"
	1    9375 3600
	1    0    0    -1  
$EndComp
Text HLabel 10025 3200 2    45   Output ~ 0
+3.3V
$Comp
L R-RESCUE-osd R55
U 1 1 547467E3
P 6900 3600
F 0 "R55" V 6980 3600 50  0000 C CNN
F 1 "470R" V 6900 3600 50  0000 C CNN
F 2 "SMD_0603:SMD_0603" H 6900 3600 60  0001 C CNN
F 3 "D" H 6900 3600 60  0001 C CNN
F 4 "Resistor/470R/+-10%/0603" H 6900 3600 60  0001 C CNN "Description"
F 5 "M" H 6900 3600 60  0001 C CNN "MFG Name"
F 6 "P" H 6900 3600 60  0001 C CNN "MFG Part Num"
	1    6900 3600
	1    0    0    -1  
$EndComp
Text Notes 7525 2150 0    45   ~ 0
500 mA  @ 5V
$Comp
L C-RESCUE-osd C68
U 1 1 54711603
P 6400 3400
F 0 "C68" H 6450 3500 50  0000 L CNN
F 1 "22uF" H 6450 3300 50  0000 L CNN
F 2 "Capacitors_SMD:C_1210" H 6400 3400 60  0001 C CNN
F 3 "D" H 6400 3400 60  0001 C CNN
F 4 "Capacitor/10uF/10V/+-10%/X5R/0603" H 6400 3400 60  0001 C CNN "Description"
F 5 "M" H 6400 3400 60  0001 C CNN "MFG Name"
F 6 "P" H 6400 3400 60  0001 C CNN "MFG Part Num"
	1    6400 3400
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR L1
U 1 1 5433B3CB
P 5250 2600
F 0 "L1" V 5200 2600 40  0000 C CNN
F 1 "10uH" V 5400 2600 40  0000 C CNN
F 2 "CLF7045T:CLF7045T" H 5250 2600 60  0001 C CNN
F 3 "" H 5250 2600 60  0001 C CNN
F 4 "Inductor/10uH" H 5250 2600 60  0001 C CNN "Description"
F 5 "~" H 5250 2600 60  0001 C CNN "MFG Name"
F 6 "CLF7045T-100M-D" H 5250 2600 60  0001 C CNN "MFG Part Num"
	1    5250 2600
	0    1    1    0   
$EndComp
$Comp
L DIODESCH_IPC7531_2005 D4
U 1 1 5433B3CA
P 4850 3650
F 0 "D4" H 4850 3750 40  0000 C CNN
F 1 "SSA33L" V 4725 3825 40  0000 C CNN
F 2 "DO-214AC:DO-214AC" H 4850 3650 60  0001 C CNN
F 3 "D" H 4850 3650 60  0001 C CNN
F 4 "On Semiconductor" H 4850 3650 60  0001 C CNN "MFG Name"
F 5 "MBR0530T1G" H 4850 3650 60  0001 C CNN "MFG Part Num"
F 6 "Diode/Schottky/30V/500mA/SOD-123" H 4850 3650 60  0001 C CNN "Description"
	1    4850 3650
	0    1    1    0   
$EndComp
$Comp
L R-RESCUE-osd R53
U 1 1 5433B3C9
P 5650 2950
F 0 "R53" V 5730 2950 50  0000 C CNN
F 1 "53K6" V 5650 2950 50  0000 C CNN
F 2 "SMD_0603:SMD_0603" H 5650 2950 60  0001 C CNN
F 3 "D" H 5650 2950 60  0001 C CNN
F 4 "Resistor/47K/+-1%/0603" H 5650 2950 60  0001 C CNN "Description"
F 5 "M" H 5650 2950 60  0001 C CNN "MFG Name"
F 6 "P" H 5650 2950 60  0001 C CNN "MFG Part Num"
	1    5650 2950
	1    0    0    -1  
$EndComp
$Comp
L R-RESCUE-osd R54
U 1 1 5433B3C8
P 5650 3650
F 0 "R54" V 5730 3650 50  0000 C CNN
F 1 "9K1" V 5650 3650 50  0000 C CNN
F 2 "SMD_0603:SMD_0603" H 5650 3650 60  0001 C CNN
F 3 "D" H 5650 3650 60  0001 C CNN
F 4 "Resistor/8K/+-1%/0603" H 5650 3650 60  0001 C CNN "Description"
F 5 "M" H 5650 3650 60  0001 C CNN "MFG Name"
F 6 "P" H 5650 3650 60  0001 C CNN "MFG Part Num"
	1    5650 3650
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-osd C63
U 1 1 5433B3C6
P 3725 2350
F 0 "C63" H 3775 2450 50  0000 L CNN
F 1 "15nF" H 3775 2250 50  0000 L CNN
F 2 "SMD_0603:SMD_0603" H 3725 2350 60  0001 C CNN
F 3 "D" H 3725 2350 60  0001 C CNN
F 4 "Capacitor/15nF/50V/+-10%/X7R/0603" H 3725 2350 60  0001 C CNN "Description"
F 5 "M" H 3725 2350 60  0001 C CNN "MFG Name"
F 6 "P" H 3725 2350 60  0001 C CNN "MFG Part Num"
	1    3725 2350
	0    -1   -1   0   
$EndComp
$Comp
L C C47
U 1 1 5778F248
P 8125 5325
F 0 "C47" H 8150 5425 50  0000 L CNN
F 1 "22uF" H 8150 5225 50  0000 L CNN
F 2 "SMD_0805:SMD_0805" H 8163 5175 50  0001 C CNN
F 3 "" H 8125 5325 50  0000 C CNN
F 4 "10V" H 8125 5325 60  0001 C CNN "Description"
	1    8125 5325
	1    0    0    -1  
$EndComp
Wire Wire Line
	8125 4975 8125 5175
Connection ~ 8125 4975
Wire Wire Line
	8125 5475 8125 5700
Connection ~ 8125 5700
$EndSCHEMATC
