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
Sheet 7 20
Title ""
Date "9 jun 2016"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 7225 3000 1    45   ~ 0
BW_RAW_OUT
Text Label 1325 6350 0    45   ~ 0
CSYNC_VREF
Text Label 8200 3175 0    45   ~ 0
ISYNC_Q_COL
Text Label 8050 2550 1    45   ~ 0
OSD_BW_OUT
Text Label 5450 2325 3    45   ~ 0
3V3_OSD_FILT
Text Label 6875 2325 0    45   ~ 0
3V3_OSD
Text Label 5000 2000 0    45   ~ 0
VIDEO_IN_OSD
Text Label 3800 2000 1    45   ~ 0
VIDEO_IN_BUF
Text Label 2400 2000 1    45   ~ 0
VIDEO_IN_CLAMP
Text Notes 8300 3800 0    45   ~ 0
EB res 4K7\nB  res 4K7
$Comp
L INDUCTOR L2
U 1 1 5750A90B
P 5025 2325
F 0 "L2" V 4975 2325 40  0000 C CNN
F 1 "BLM18SG331TN1" V 5125 2325 40  0000 C CNN
F 2 "SMD_0603:SMD_0603" H 5025 2325 60  0001 C CNN
F 3 "" H 5025 2325 60  0001 C CNN
	1    5025 2325
	0    1    1    0   
$EndComp
Connection ~ 4375 3950
Wire Wire Line
	4375 3300 4375 3950
Connection ~ 5850 3950
Wire Wire Line
	5850 3950 5850 2525
Connection ~ 6400 2325
Wire Wire Line
	6400 1875 6400 2325
Connection ~ 7600 6250
Wire Wire Line
	7150 6025 7150 6250
Wire Wire Line
	7150 6250 9000 6250
Wire Wire Line
	9250 3525 9250 3950
Wire Wire Line
	9250 3525 8725 3525
Wire Wire Line
	3700 2700 3700 4900
Connection ~ 6700 2325
Wire Wire Line
	5325 2325 5600 2325
Wire Wire Line
	4250 2325 4725 2325
Wire Wire Line
	6100 2325 7875 2325
Wire Wire Line
	6250 4150 6250 3000
Wire Wire Line
	6000 6400 5600 6400
Wire Wire Line
	9950 3650 9600 3650
Wire Wire Line
	1200 4900 1200 4750
Wire Wire Line
	7875 3350 7925 3350
Wire Wire Line
	7925 3350 7925 3400
Wire Wire Line
	8200 3325 8200 3050
Connection ~ 8200 3950
Wire Wire Line
	8200 3950 8200 3825
Wire Wire Line
	1600 3150 1600 3700
Wire Wire Line
	9600 3650 9600 2500
Wire Wire Line
	9600 2500 9450 2500
Connection ~ 3700 2000
Wire Wire Line
	3700 2200 3700 2000
Wire Wire Line
	8000 4900 1700 4900
Connection ~ 3650 7000
Wire Wire Line
	3750 7000 1200 7000
Connection ~ 1200 5550
Wire Wire Line
	4750 5550 1200 5550
Connection ~ 1200 6350
Wire Wire Line
	1850 6350 1200 6350
Wire Wire Line
	8900 1250 8900 1600
Wire Wire Line
	2800 1300 2950 1300
Wire Wire Line
	8350 2350 8050 2350
Wire Wire Line
	8050 2350 8050 2950
Connection ~ 7875 2950
Wire Wire Line
	8050 2950 7875 2950
Wire Wire Line
	2450 2000 2300 2000
Wire Wire Line
	7875 3000 7750 3000
Connection ~ 1600 3700
Wire Wire Line
	7875 3950 7875 3600
Connection ~ 7875 3000
Wire Wire Line
	3600 2000 4075 2000
Wire Wire Line
	7600 5625 7600 5450
Wire Wire Line
	7600 5450 7050 5450
Wire Wire Line
	10500 1600 10500 1700
Wire Wire Line
	10500 1700 10400 1700
Wire Wire Line
	7350 6700 7850 6700
Connection ~ 8700 5450
Wire Wire Line
	8700 5625 8700 5450
Connection ~ 8700 6250
Wire Wire Line
	8700 6025 8700 6250
Wire Wire Line
	3550 6200 3900 6200
Connection ~ 3650 6200
Wire Wire Line
	3650 6300 3650 6200
Wire Wire Line
	3050 6200 2850 6200
Wire Wire Line
	3900 6200 3900 6550
Wire Wire Line
	3900 6550 4600 6550
Wire Wire Line
	3650 6700 3650 7000
Wire Wire Line
	1700 4900 1700 6050
Wire Wire Line
	1700 6050 1850 6050
Wire Wire Line
	5250 5550 5700 5550
Wire Wire Line
	5700 5550 5700 6400
Connection ~ 5700 6400
Wire Wire Line
	8400 6250 8400 6025
Connection ~ 8400 6250
Wire Wire Line
	9000 6250 9000 6025
Wire Wire Line
	8400 5450 8400 5625
Connection ~ 8400 5450
Wire Wire Line
	9000 5625 9000 5450
Wire Wire Line
	7850 6700 7850 6250
Connection ~ 7850 6250
Wire Wire Line
	2950 1300 2950 1550
Wire Wire Line
	1100 3700 2950 3700
Wire Wire Line
	2950 3700 2950 2450
Wire Wire Line
	10500 800  10500 700 
Wire Wire Line
	10500 700  10100 700 
Wire Wire Line
	7600 6250 7600 6025
Wire Wire Line
	7875 2900 7875 3100
Wire Wire Line
	7875 2325 7875 2400
Wire Wire Line
	1600 2650 1600 2000
Wire Wire Line
	1900 2000 1300 2000
Connection ~ 1600 2000
Wire Wire Line
	4575 2000 8350 2000
Wire Wire Line
	4275 3950 8900 3950
Wire Wire Line
	8900 3950 8900 2900
Connection ~ 7875 3950
Wire Wire Line
	1200 6400 1200 6250
Wire Wire Line
	1200 5750 1200 5400
Wire Wire Line
	1200 7000 1200 6900
Wire Wire Line
	4600 6250 4200 6250
Wire Wire Line
	4200 6250 4200 5550
Connection ~ 4200 5550
Wire Wire Line
	7250 3000 7200 3000
Wire Wire Line
	9450 2150 9950 2150
Connection ~ 8200 2000
Wire Wire Line
	9250 3950 9950 3950
Wire Wire Line
	8200 2550 8200 2000
Connection ~ 3700 4900
Wire Wire Line
	6250 4150 9950 4150
Wire Wire Line
	6700 2800 6700 2325
Wire Wire Line
	6700 3950 6700 3200
Connection ~ 6700 3950
Wire Wire Line
	7150 5625 7150 5450
Connection ~ 7150 5450
Wire Wire Line
	9000 5450 8250 5450
Wire Wire Line
	6250 3000 6300 3000
Wire Wire Line
	4375 2900 4375 2325
Connection ~ 4375 2325
$Comp
L 74AHC1G04 U5
U 1 1 57506C6B
P 6750 3000
F 0 "U5" H 6945 3115 60  0000 C CNN
F 1 "SN74LVC1G04" H 7050 2850 60  0000 C CNN
F 2 "SC70-5:SC70-5" H 6750 3000 60  0001 C CNN
F 3 "" H 6750 3000 60  0001 C CNN
	1    6750 3000
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-osd C72
U 1 1 57506A26
P 4375 3100
F 0 "C72" H 4425 3200 50  0000 L CNN
F 1 "1uF" H 4425 3000 50  0000 L CNN
F 2 "SMD_0603:SMD_0603" H 4375 3100 60  0001 C CNN
F 3 "" H 4375 3100 60  0001 C CNN
F 4 "10V" H 4375 3100 60  0001 C CNN "Description"
	1    4375 3100
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG06
U 1 1 574DB8B5
P 6400 1875
F 0 "#FLG06" H 6400 2145 30  0001 C CNN
F 1 "PWR_FLAG" H 6400 2105 30  0000 C CNN
F 2 "" H 6400 1875 60  0001 C CNN
F 3 "" H 6400 1875 60  0001 C CNN
	1    6400 1875
	1    0    0    -1  
$EndComp
$Comp
L CAP3T C14
U 1 1 574DB4ED
P 5850 2325
F 0 "C14" H 6000 2075 60  0000 C CNN
F 1 "NFM18PC104R1C3" H 6200 2525 60  0000 C CNN
F 2 "SMD_0603-3T_FILT:SMD_0603-3T_C_FILT_RND" H 5850 2325 60  0001 C CNN
F 3 "" H 5850 2325 60  0001 C CNN
	1    5850 2325
	1    0    0    -1  
$EndComp
Text Notes 1450 6650 0    60   ~ 0
0.6V
$Comp
L R-RESCUE-osd R13
U 1 1 57439064
P 3700 2450
F 0 "R13" V 3780 2450 50  0000 C CNN
F 1 "100R" V 3700 2450 50  0000 C CNN
F 2 "SMD_0603:SMD_0603" H 3700 2450 60  0001 C CNN
F 3 "" H 3700 2450 60  0001 C CNN
F 4 "10%" V 3700 2450 60  0001 C CNN "Description"
	1    3700 2450
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-osd C15
U 1 1 57438C55
P 7150 5825
F 0 "C15" H 7200 5925 50  0000 L CNN
F 1 "0.1uF" H 7200 5725 50  0000 L CNN
F 2 "SMD_0603:SMD_0603" H 7150 5825 60  0001 C CNN
F 3 "D" H 7150 5825 60  0001 C CNN
F 4 "Capacitor/0.1uF/10V/+-10%/X7R/0603" H 7150 5825 60  0001 C CNN "Description"
F 5 "M" H 7150 5825 60  0001 C CNN "MFG Name"
F 6 "P" H 7150 5825 60  0001 C CNN "MFG Part Num"
	1    7150 5825
	1    0    0    -1  
$EndComp
Text HLabel 4275 3950 0    60   Input ~ 0
GND
Text HLabel 4250 2325 0    45   Input ~ 0
+3.3V
Text HLabel 10100 700  0    45   Input ~ 0
+3.3V
Text HLabel 1200 4750 0    45   Input ~ 0
+3.3V
Text HLabel 8900 1250 0    45   Input ~ 0
+3.3V
Text HLabel 9950 2150 2    60   Output ~ 0
OSD_VIDEO_OUT
Text HLabel 1300 2000 0    60   Input ~ 0
VIDEO_IN
$Comp
L R-RESCUE-osd R19
U 1 1 573C2AD5
P 8200 2800
F 0 "R19" V 8280 2800 50  0000 C CNN
F 1 "68R" V 8200 2800 50  0000 C CNN
F 2 "SMD_0603:SMD_0603" H 8200 2800 60  0001 C CNN
F 3 "" H 8200 2800 60  0001 C CNN
F 4 "1%" V 8200 2800 60  0001 C CNN "Description"
	1    8200 2800
	1    0    0    -1  
$EndComp
$Comp
L NPN_DT Q1
U 1 1 573C2743
P 8300 3525
F 0 "Q1" H 8300 3375 50  0000 R CNN
F 1 "MMUN2211LT1-D" H 8350 3750 50  0000 R CNN
F 2 "SOT23-3:SOT23-3" H 8300 3525 60  0001 C CNN
F 3 "" H 8300 3525 60  0001 C CNN
	1    8300 3525
	-1   0    0    -1  
$EndComp
Text HLabel 9950 4150 2    60   Input ~ 0
LEVEL
Text HLabel 9950 3950 2    60   Input ~ 0
ISYNC
Text HLabel 9950 3650 2    60   Input ~ 0
MASK
$Comp
L R-RESCUE-osd R8
U 1 1 56799206
P 1200 6650
F 0 "R8" V 1280 6650 50  0000 C CNN
F 1 "560R" V 1200 6650 50  0000 C CNN
F 2 "SMD_0603:SMD_0603" H 1200 6650 60  0001 C CNN
F 3 "" H 1200 6650 60  0001 C CNN
F 4 "1%" V 1200 6650 60  0001 C CNN "Description"
	1    1200 6650
	1    0    0    -1  
$EndComp
$Comp
L TS5A3157 U6
U 1 1 56799120
P 8900 2250
F 0 "U6" H 8800 2150 60  0000 C CNN
F 1 "74LVC1G3157" H 8550 1650 60  0000 C CNN
F 2 "SC70-6:SC70-6" H 8900 2250 60  0001 C CNN
F 3 "" H 8900 2250 60  0001 C CNN
	1    8900 2250
	-1   0    0    -1  
$EndComp
$Comp
L C-RESCUE-osd C12
U 1 1 56798F36
P 2100 2000
F 0 "C12" H 2150 2100 50  0000 L CNN
F 1 "0.1uF" V 1850 1950 50  0000 L CNN
F 2 "SMD_0603:SMD_0603" H 2100 2000 60  0001 C CNN
F 3 "" H 2100 2000 60  0001 C CNN
F 4 "10V" H 2100 2000 60  0001 C CNN "Description"
	1    2100 2000
	0    1    1    0   
$EndComp
$Comp
L R-RESCUE-osd R9
U 1 1 56798EE3
P 1600 2900
F 0 "R9" V 1680 2900 50  0000 C CNN
F 1 "150R" V 1600 2900 50  0000 C CNN
F 2 "SMD_0603:SMD_0603" H 1600 2900 60  0001 C CNN
F 3 "" H 1600 2900 60  0001 C CNN
F 4 "1%" V 1600 2900 60  0001 C CNN "Description"
	1    1600 2900
	1    0    0    -1  
$EndComp
$Comp
L FMS6141 U4
U 1 1 544A2987
P 2850 2000
F 0 "U4" H 3200 1650 60  0000 L CNN
F 1 "FMS6141" H 3050 2250 60  0000 L CNN
F 2 "SC70-5:SC70-5" H 2850 2000 60  0001 C CNN
F 3 "www.mouser.com/ds/2/149/FMS6141-107597.pdf" H 2850 2000 60  0001 C CNN
F 4 "Fairchild Semiconductor" H 2850 2000 60  0001 C CNN "MFG Name"
F 5 "FMS6141S5X" H 2850 2000 60  0001 C CNN "MFG Part Num"
F 6 "Video Amp/SyncClamp/4th Order Filter/G=2" H 2850 2000 60  0001 C CNN "Description"
	1    2850 2000
	1    0    0    -1  
$EndComp
Text HLabel 1100 3700 0    60   Input ~ 0
GND
$Comp
L R-RESCUE-osd R16
U 1 1 56798AD0
P 7500 3000
F 0 "R16" V 7580 3000 50  0000 C CNN
F 1 "150R" V 7500 3000 50  0000 C CNN
F 2 "SMD_0603:SMD_0603" H 7500 3000 60  0001 C CNN
F 3 "" H 7500 3000 60  0001 C CNN
F 4 "1%" V 7500 3000 60  0001 C CNN "Description"
	1    7500 3000
	0    1    1    0   
$EndComp
$Comp
L R-RESCUE-osd R18
U 1 1 56798ACC
P 7875 3350
F 0 "R18" V 7955 3350 50  0000 C CNN
F 1 "200R" V 7875 3350 50  0000 C CNN
F 2 "SMD_0603:SMD_0603" H 7875 3350 60  0001 C CNN
F 3 "" H 7875 3350 60  0001 C CNN
F 4 "1%" V 7875 3350 60  0001 C CNN "Description"
	1    7875 3350
	1    0    0    -1  
$EndComp
$Comp
L R-RESCUE-osd R17
U 1 1 56798AC8
P 7875 2650
F 0 "R17" V 7955 2650 50  0000 C CNN
F 1 "240R" V 7875 2650 50  0000 C CNN
F 2 "SMD_0603:SMD_0603" H 7875 2650 60  0001 C CNN
F 3 "" H 7875 2650 60  0001 C CNN
F 4 "1%" V 7875 2650 60  0001 C CNN "Description"
	1    7875 2650
	1    0    0    -1  
$EndComp
$Comp
L R-RESCUE-osd R14
U 1 1 56798A1D
P 4325 2000
F 0 "R14" V 4405 2000 50  0000 C CNN
F 1 "68R" V 4325 2000 50  0000 C CNN
F 2 "SMD_0603:SMD_0603" H 4325 2000 60  0001 C CNN
F 3 "" H 4325 2000 60  0001 C CNN
F 4 "1%" V 4325 2000 60  0001 C CNN "Description"
	1    4325 2000
	0    1    1    0   
$EndComp
$Comp
L C-RESCUE-osd C16
U 1 1 550014A9
P 7600 5825
F 0 "C16" H 7650 5925 50  0000 L CNN
F 1 "4.7uF" H 7650 5725 50  0000 L CNN
F 2 "SMD_0603:SMD_0603" H 7600 5825 60  0001 C CNN
F 3 "D" H 7600 5825 60  0001 C CNN
F 4 "Capacitor/4.70.uF/10V/+-10%/X5R/0603" H 7600 5825 60  0001 C CNN "Description"
F 5 "M" H 7600 5825 60  0001 C CNN "MFG Name"
F 6 "P" H 7600 5825 60  0001 C CNN "MFG Part Num"
	1    7600 5825
	1    0    0    -1  
$EndComp
Text Label 5400 5550 0    45   ~ 0
CSYNC_CMP_OUT
Text Label 4200 5900 0    45   ~ 0
CSYNC_FLT_POS_REF
Text Label 3950 6550 0    45   ~ 0
CSYNC_FLT_VIN
Text Label 2950 6200 1    45   ~ 0
RAW_CSYNC_OUT
Text HLabel 8250 5450 0    45   Input ~ 0
+3.3V
Text Notes 4300 6450 0    45   ~ 0
hyst +-0.33 V
Text Notes 2850 6650 0    45   ~ 0
LP filter to remove\n4.43361875 MHz\ncolor subcarrier
Text Notes 2300 5700 0    45   ~ 0
Csync circuit
$Comp
L MCP6562 U3
U 3 1 54707205
P 10700 1200
F 0 "U3" H 10750 1400 60  0000 L CNN
F 1 "MCP6562" H 10650 1000 60  0000 L CNN
F 2 "MSOP-8:MSOP-8" H 10700 1200 60  0001 C CNN
F 3 "www.farnell.com/datasheets/630456.pdf" H 10700 1200 60  0001 C CNN
F 4 "Microchip" H 10700 1200 60  0001 C CNN "MFG Name"
F 5 "MCP6562-E/MS" H 10700 1200 60  0001 C CNN "MFG Part Num"
F 6 "Comparator/Dual/MSOP-8" H 10700 1200 60  0001 C CNN "Description"
	3    10700 1200
	1    0    0    -1  
$EndComp
$Comp
L MCP6562 U3
U 2 1 54706BB6
P 5200 6400
F 0 "U3" H 5250 6600 60  0000 L CNN
F 1 "MCP6562" H 5150 6200 60  0000 L CNN
F 2 "MSOP-8:MSOP-8" H 5200 6400 60  0001 C CNN
F 3 "www.farnell.com/datasheets/630456.pdf" H 5200 6400 60  0001 C CNN
F 4 "Microchip" H 5200 6400 60  0001 C CNN "MFG Name"
F 5 "MPC6562-E/MS" H 5200 6400 60  0001 C CNN "MFG Part Num"
F 6 "Comparator/Dual/MSOP-8" H 5200 6400 60  0001 C CNN "Description"
	2    5200 6400
	1    0    0    -1  
$EndComp
$Comp
L MCP6562 U3
U 1 1 54706B91
P 2450 6200
F 0 "U3" H 2500 6400 60  0000 L CNN
F 1 "MCP6562" H 2400 6000 60  0000 L CNN
F 2 "MSOP-8:MSOP-8" H 2450 6200 60  0001 C CNN
F 3 "www.farnell.com/datasheets/630456.pdf" H 2450 6200 60  0001 C CNN
F 4 "Microchip" H 2450 6200 60  0001 C CNN "MFG Name"
F 5 "MPC6562-E/MS" H 2450 6200 60  0001 C CNN "MFG Part Num"
F 6 "Comparator/Dual/MSOP-8" H 2450 6200 60  0001 C CNN "Description"
	1    2450 6200
	1    0    0    -1  
$EndComp
Text HLabel 6000 6400 2    60   Output ~ 0
CSYNC
$Comp
L C-RESCUE-osd C18
U 1 1 546DB404
P 8700 5825
F 0 "C18" H 8750 5925 50  0000 L CNN
F 1 "0.1uF" H 8750 5725 50  0000 L CNN
F 2 "SMD_0603:SMD_0603" H 8700 5825 60  0001 C CNN
F 3 "D" H 8700 5825 60  0001 C CNN
F 4 "Capacitor/0.1uF/10V/+-10%/X7R/0603" H 8700 5825 60  0001 C CNN "Description"
F 5 "M" H 8700 5825 60  0001 C CNN "MFG Name"
F 6 "P" H 8700 5825 60  0001 C CNN "MFG Part Num"
	1    8700 5825
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-osd C17
U 1 1 546DB339
P 8400 5825
F 0 "C17" H 8450 5925 50  0000 L CNN
F 1 "4.7uF" H 8450 5725 50  0000 L CNN
F 2 "SMD_0603:SMD_0603" H 8400 5825 60  0001 C CNN
F 3 "D" H 8400 5825 60  0001 C CNN
F 4 "Capacitor/4.70.uF/10V/+-10%/X5R/0603" H 8400 5825 60  0001 C CNN "Description"
F 5 "M" H 8400 5825 60  0001 C CNN "MFG Name"
F 6 "P" H 8400 5825 60  0001 C CNN "MFG Part Num"
	1    8400 5825
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-osd C19
U 1 1 546DB332
P 9000 5825
F 0 "C19" H 9050 5925 50  0000 L CNN
F 1 "0.1uF" H 9050 5725 50  0000 L CNN
F 2 "SMD_0603:SMD_0603" H 9000 5825 60  0001 C CNN
F 3 "D" H 9000 5825 60  0001 C CNN
F 4 "Capacitor/0.1uF/10V/+-10%/X7R/0603" H 9000 5825 60  0001 C CNN "Description"
F 5 "M" H 9000 5825 60  0001 C CNN "MFG Name"
F 6 "P" H 9000 5825 60  0001 C CNN "MFG Part Num"
	1    9000 5825
	1    0    0    -1  
$EndComp
Text HLabel 7050 5450 0    45   BiDi ~ 0
+5V_RAW
Text HLabel 7350 6700 0    60   BiDi ~ 0
GND
Text HLabel 10400 1700 0    60   BiDi ~ 0
GND
Text HLabel 3750 7000 2    60   BiDi ~ 0
GND
Text HLabel 2800 1300 0    45   Input ~ 0
+5V_RAW
Text HLabel 8000 4900 2    60   Output ~ 0
VIDEO_SAMPLE
$Comp
L R-RESCUE-osd R15
U 1 1 5448D75F
P 5000 5550
F 0 "R15" V 5080 5550 50  0000 C CNN
F 1 "3K3" V 5000 5550 50  0000 C CNN
F 2 "SMD_0603:SMD_0603" H 5000 5550 60  0001 C CNN
F 3 "D" H 5000 5550 60  0001 C CNN
F 4 "Resistor/3K3/+-1%/0603" H 5000 5550 60  0001 C CNN "Description"
F 5 "M" H 5000 5550 60  0001 C CNN "MFG Name"
F 6 "P" H 5000 5550 60  0001 C CNN "MFG Part Num"
	1    5000 5550
	0    1    1    0   
$EndComp
$Comp
L R-RESCUE-osd R7
U 1 1 5448BA29
P 1200 6000
F 0 "R7" V 1280 6000 50  0000 C CNN
F 1 "1K" V 1200 6000 50  0000 C CNN
F 2 "SMD_0603:SMD_0603" H 1200 6000 60  0001 C CNN
F 3 "D" H 1200 6000 60  0001 C CNN
F 4 "Resistor/1K/+-1%/0603" H 1200 6000 60  0001 C CNN "Description"
F 5 "M" H 1200 6000 60  0001 C CNN "MFG Name"
F 6 "P" H 1200 6000 60  0001 C CNN "MFG Part Num"
	1    1200 6000
	1    0    0    -1  
$EndComp
$Comp
L R-RESCUE-osd R6
U 1 1 5448BA26
P 1200 5150
F 0 "R6" V 1280 5150 50  0000 C CNN
F 1 "1K5" V 1200 5150 50  0000 C CNN
F 2 "SMD_0603:SMD_0603" H 1200 5150 60  0001 C CNN
F 3 "D" H 1200 5150 60  0001 C CNN
F 4 "Resistor/1K5/+-1%/0603" H 1200 5150 60  0001 C CNN "Description"
F 5 "M" H 1200 5150 60  0001 C CNN "MFG Name"
F 6 "P" H 1200 5150 60  0001 C CNN "MFG Part Num"
	1    1200 5150
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-osd C13
U 1 1 5448B99E
P 3650 6500
F 0 "C13" H 3700 6350 50  0000 L CNN
F 1 "240pF" H 3400 6600 50  0000 L CNN
F 2 "SMD_0603:SMD_0603" H 3650 6500 60  0001 C CNN
F 3 "D" H 3650 6500 60  0001 C CNN
F 4 "Capacitor/240pF/10V/+-5%/NPO/0603" H 3650 6500 60  0001 C CNN "Description"
F 5 "M" H 3650 6500 60  0001 C CNN "MFG Name"
F 6 "P" H 3650 6500 60  0001 C CNN "MFG Part Num"
	1    3650 6500
	1    0    0    -1  
$EndComp
$Comp
L R-RESCUE-osd R12
U 1 1 5448B6A1
P 3300 6200
F 0 "R12" V 3380 6200 50  0000 C CNN
F 1 "1.2K" V 3300 6200 50  0000 C CNN
F 2 "SMD_0603:SMD_0603" H 3300 6200 60  0001 C CNN
F 3 "D" H 3300 6200 60  0001 C CNN
F 4 "Resistor/1.2K/+-1%/0603" H 3300 6200 60  0001 C CNN "Description"
F 5 "M" H 3300 6200 60  0001 C CNN "MFG Name"
F 6 "P" H 3300 6200 60  0001 C CNN "MFG Part Num"
	1    3300 6200
	0    1    1    0   
$EndComp
$Comp
L C C76
U 1 1 57ACADC2
P 6075 3150
F 0 "C76" H 6100 3250 50  0000 L CNN
F 1 "0.1uF" H 6100 3050 50  0000 L CNN
F 2 "SMD_0603:SMD_0603" H 6113 3000 50  0001 C CNN
F 3 "" H 6075 3150 50  0000 C CNN
	1    6075 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6075 3300 6075 3950
Connection ~ 6075 3950
Wire Wire Line
	6075 3000 6075 2800
Wire Wire Line
	6075 2800 6250 2800
Wire Wire Line
	6250 2800 6250 2325
Connection ~ 6250 2325
Text Notes 8250 2125 0    60   ~ 0
A0=1
Text Notes 8250 2475 0    60   ~ 0
A0=0
$EndSCHEMATC
