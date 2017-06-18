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
Sheet 9 20
Title ""
Date "9 jun 2016"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	8300 3350 8300 3450
Wire Wire Line
	8850 2375 8950 2375
Wire Wire Line
	6450 6150 7350 6150
Wire Wire Line
	3325 6200 3775 6200
Wire Wire Line
	3325 5900 4275 5900
Connection ~ 7350 4675
Wire Wire Line
	7350 6150 7350 4675
Connection ~ 6825 3800
Wire Wire Line
	6825 3800 6825 5850
Connection ~ 5650 4675
Wire Wire Line
	5650 4675 5650 6175
Wire Wire Line
	5650 6175 5025 6175
Connection ~ 5450 3800
Wire Wire Line
	5450 3800 5450 5875
Wire Wire Line
	5450 5875 5025 5875
Connection ~ 3525 2250
Wire Wire Line
	4000 2250 4000 6050
Connection ~ 4275 3800
Wire Wire Line
	4275 5900 4275 3800
Connection ~ 3225 2250
Wire Wire Line
	3225 2250 3225 2450
Connection ~ 3225 3100
Wire Wire Line
	3225 2950 3225 3100
Wire Wire Line
	2750 3100 8050 3100
Wire Wire Line
	1775 3100 2250 3100
Wire Wire Line
	8300 4050 8300 4200
Wire Wire Line
	8300 4200 8225 4200
Wire Wire Line
	8950 1325 8950 1450
Wire Wire Line
	9600 3200 9350 3200
Wire Wire Line
	9350 3200 9350 2050
Wire Wire Line
	9350 2050 9200 2050
Wire Wire Line
	8700 2050 8600 2050
Wire Wire Line
	8550 3100 9600 3100
Wire Wire Line
	9600 3000 9525 3000
Wire Wire Line
	9600 3300 9100 3300
Wire Wire Line
	9100 3300 9100 3800
Wire Wire Line
	9100 3800 8550 3800
Connection ~ 3525 3800
Wire Wire Line
	3525 3800 3525 3675
Wire Wire Line
	9600 3400 9350 3400
Wire Wire Line
	2300 3800 1775 3800
Wire Wire Line
	8050 3800 2800 3800
Wire Wire Line
	3525 2250 3525 3175
Wire Wire Line
	8700 1125 8525 1125
Wire Wire Line
	8950 2375 8950 2250
Wire Wire Line
	2100 4675 9350 4675
Wire Wire Line
	4125 3100 4125 5750
Connection ~ 4125 3100
Wire Wire Line
	3775 6200 3775 4675
Connection ~ 3775 4675
Wire Wire Line
	5025 5725 5350 5725
Wire Wire Line
	5350 5725 5350 3100
Connection ~ 5350 3100
Wire Wire Line
	5550 2250 5550 6025
Wire Wire Line
	5550 6025 5025 6025
Connection ~ 4000 2250
Wire Wire Line
	6450 5700 6725 5700
Wire Wire Line
	6725 5700 6725 3100
Connection ~ 6725 3100
Wire Wire Line
	6450 6000 7050 6000
Wire Wire Line
	7050 6000 7050 2250
Wire Wire Line
	7050 2250 2600 2250
Connection ~ 5550 2250
Wire Wire Line
	4125 5750 3325 5750
Wire Wire Line
	4000 6050 3325 6050
Wire Wire Line
	6825 5850 6450 5850
Wire Wire Line
	9525 3000 9525 1125
Wire Wire Line
	9525 1125 9200 1125
Wire Wire Line
	9350 4675 9350 3400
Wire Wire Line
	8300 3450 8225 3450
Wire Wire Line
	8950 1450 8775 1450
Text Label 8650 3800 0    45   ~ 0
I2C_SDA_EXT
Text Label 8650 3100 0    45   ~ 0
I2C_SCL_EXT
$Sheet
S 2775 5600 550  750 
U 574DA0C0
F0 "bmp280_baro" 60
F1 "bmp280_baro.sch" 60
F2 "GND" I R 3325 6200 60 
F3 "I2C_SCL" I R 3325 5750 60 
F4 "I2C_SDA" B R 3325 5900 60 
F5 "+3.3V" B R 3325 6050 60 
$EndSheet
$Comp
L RC3T RC4
U 1 1 5749CDF0
P 8300 3100
F 0 "RC4" H 8450 2850 60  0000 C CNN
F 1 "NFR21GD1014702" H 8100 3400 60  0000 C CNN
F 2 "NFR21G_RC_FILT:NFR21G_RC_FILT" H 8300 3100 60  0001 C CNN
F 3 "" H 8300 3100 60  0001 C CNN
	1    8300 3100
	1    0    0    -1  
$EndComp
$Comp
L RC3T RC5
U 1 1 5749CDB3
P 8300 3800
F 0 "RC5" H 8450 3550 60  0000 C CNN
F 1 "NFR21GD1014702" H 8775 3400 60  0000 C CNN
F 2 "NFR21G_RC_FILT:NFR21G_RC_FILT" H 8300 3800 60  0001 C CNN
F 3 "" H 8300 3800 60  0001 C CNN
	1    8300 3800
	1    0    0    -1  
$EndComp
Text HLabel 8775 1450 0    60   BiDi ~ 0
GND
Text HLabel 8850 2375 0    60   BiDi ~ 0
GND
Text HLabel 8225 3450 0    60   BiDi ~ 0
GND
Text HLabel 8225 4200 0    60   BiDi ~ 0
GND
$Comp
L R-RESCUE-osd R25
U 1 1 57441084
P 2550 3800
F 0 "R25" V 2630 3800 50  0000 C CNN
F 1 "47R" V 2550 3800 50  0000 C CNN
F 2 "SMD_0603:SMD_0603" H 2550 3800 60  0001 C CNN
F 3 "" H 2550 3800 60  0001 C CNN
F 4 "1%" V 2550 3800 60  0001 C CNN "Description"
	1    2550 3800
	0    1    1    0   
$EndComp
$Comp
L R-RESCUE-osd R24
U 1 1 57441072
P 2500 3100
F 0 "R24" V 2580 3100 50  0000 C CNN
F 1 "47R" V 2500 3100 50  0000 C CNN
F 2 "SMD_0603:SMD_0603" H 2500 3100 60  0001 C CNN
F 3 "" H 2500 3100 60  0001 C CNN
F 4 "1%" V 2500 3100 60  0001 C CNN "Description"
	1    2500 3100
	0    1    1    0   
$EndComp
$Sheet
S 5950 5550 500  800 
U 5740DAD9
F0 "eeprom" 60
F1 "eeprom.sch" 60
F2 "I2C_SDA" B R 6450 5850 60 
F3 "GND" B R 6450 6150 60 
F4 "I2C_SCL" O R 6450 5700 60 
F5 "3V3" I R 6450 6000 60 
$EndSheet
$Sheet
S 4500 5575 525  775 
U 573F3C1C
F0 "compass" 60
F1 "compass.sch" 60
F2 "GND" I R 5025 6175 60 
F3 "3V3" I R 5025 6025 60 
F4 "I2C_SDA" I R 5025 5875 60 
F5 "I2C_SCL" I R 5025 5725 60 
$EndSheet
Text HLabel 2100 4675 0    60   BiDi ~ 0
GND
$Comp
L CAP3T C24
U 1 1 573ED736
P 8950 2050
F 0 "C24" H 9100 1800 60  0000 C CNN
F 1 "NFM18PS105R0J3" H 8900 2300 60  0000 C CNN
F 2 "SMD_0603-3T_FILT:SMD_0603-3T_C_FILT_RND" H 8950 2050 60  0001 C CNN
F 3 "" H 8950 2050 60  0001 C CNN
	1    8950 2050
	1    0    0    -1  
$EndComp
$Comp
L CAP3T C23
U 1 1 573ED732
P 8950 1125
F 0 "C23" H 9100 875 60  0000 C CNN
F 1 "NFM18PS105R0J3" H 9150 1375 60  0000 C CNN
F 2 "SMD_0603-3T_FILT:SMD_0603-3T_C_FILT_RND" H 8950 1125 60  0001 C CNN
F 3 "" H 8950 1125 60  0001 C CNN
	1    8950 1125
	1    0    0    -1  
$EndComp
Text HLabel 1775 3800 0    60   Input ~ 0
I2C_SDA_MCU
Text HLabel 1775 3100 0    60   Input ~ 0
I2C_SCL_MCU
$Comp
L CONN_5 P6
U 1 1 573ED5D5
P 10000 3200
F 0 "P6" V 9950 3200 50  0000 C CNN
F 1 "I2C_IO" V 10050 3200 50  0000 C CNN
F 2 "JST_GH5_vert:JST_GH5_vert" H 10000 3200 60  0001 C CNN
F 3 "" H 10000 3200 60  0001 C CNN
	1    10000 3200
	1    0    0    -1  
$EndComp
Text HLabel 2600 2250 0    60   Input ~ 0
+3V3
$Comp
L R-RESCUE-osd R27
U 1 1 573ED114
P 3525 3425
F 0 "R27" V 3605 3425 50  0000 C CNN
F 1 "4K7" V 3525 3425 50  0000 C CNN
F 2 "SMD_0603:SMD_0603" H 3525 3425 60  0001 C CNN
F 3 "" H 3525 3425 60  0001 C CNN
F 4 "1%" V 3525 3425 60  0001 C CNN "Description"
	1    3525 3425
	1    0    0    -1  
$EndComp
$Comp
L R-RESCUE-osd R26
U 1 1 573ED10D
P 3225 2700
F 0 "R26" V 3305 2700 50  0000 C CNN
F 1 "4K7" V 3225 2700 50  0000 C CNN
F 2 "SMD_0603:SMD_0603" H 3225 2700 60  0001 C CNN
F 3 "" H 3225 2700 60  0001 C CNN
F 4 "1%" V 3225 2700 60  0001 C CNN "Description"
	1    3225 2700
	1    0    0    -1  
$EndComp
Text HLabel 8525 1125 0    60   Input ~ 0
+5V_RAW
Text HLabel 8600 2050 0    60   Input ~ 0
+3V3
$EndSCHEMATC
