EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Device:Ferrite_Bead_Small FB?
U 1 1 5F545030
P 9250 950
F 0 "FB?" V 9500 850 50  0000 L CNN
F 1 "100/100MHz" V 9400 900 50  0000 C CNN
F 2 "" V 9180 950 50  0001 C CNN
F 3 "~" H 9250 950 50  0001 C CNN
	1    9250 950 
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F54E76E
P 9500 1100
F 0 "C?" H 9592 1146 50  0000 L CNN
F 1 "1u" H 9592 1055 50  0000 L CNN
F 2 "" H 9500 1100 50  0001 C CNN
F 3 "~" H 9500 1100 50  0001 C CNN
	1    9500 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F55022E
P 10350 1100
F 0 "C?" H 10442 1146 50  0000 L CNN
F 1 "1u" H 10442 1055 50  0000 L CNN
F 2 "" H 10350 1100 50  0001 C CNN
F 3 "~" H 10350 1100 50  0001 C CNN
	1    10350 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 1250 9950 1300
Wire Wire Line
	9500 1300 9950 1300
Connection ~ 9950 1300
Wire Wire Line
	9950 1300 9950 1500
Wire Wire Line
	10350 1300 9950 1300
$Comp
L power:GND #PWR?
U 1 1 5F554444
P 9950 1500
F 0 "#PWR?" H 9950 1250 50  0001 C CNN
F 1 "GND" H 9955 1327 50  0000 C CNN
F 2 "" H 9950 1500 50  0001 C CNN
F 3 "" H 9950 1500 50  0001 C CNN
	1    9950 1500
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5F554E1C
P 10600 950
F 0 "#PWR?" H 10600 800 50  0001 C CNN
F 1 "+3.3V" V 10615 1078 50  0000 L CNN
F 2 "" H 10600 950 50  0001 C CNN
F 3 "" H 10600 950 50  0001 C CNN
	1    10600 950 
	0    1    1    0   
$EndComp
Wire Wire Line
	10250 950  10350 950 
Wire Wire Line
	9500 1300 9500 1200
Wire Wire Line
	9350 950  9500 950 
Wire Wire Line
	9500 950  9500 1000
Connection ~ 9500 950 
Wire Wire Line
	9500 950  9650 950 
Wire Wire Line
	10350 1000 10350 950 
Connection ~ 10350 950 
Wire Wire Line
	10350 950  10600 950 
Wire Wire Line
	10350 1200 10350 1300
Text Notes 8600 600  0    50   ~ 0
VCC Voltage Regulator
Wire Notes Line
	11050 600  11050 1800
Wire Notes Line
	8600 1800 8600 600 
$Comp
L Regulator_Linear:XC6206PxxxMR U?
U 1 1 5F556901
P 9950 950
F 0 "U?" H 9950 1192 50  0000 C CNN
F 1 "XC6206P332MR" H 9950 1101 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9950 1175 50  0001 C CIN
F 3 "https://www.torexsemi.com/file/xc6206/XC6206.pdf" H 9950 950 50  0001 C CNN
	1    9950 950 
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5F610957
P 8950 950
F 0 "#PWR?" H 8950 800 50  0001 C CNN
F 1 "VCC" V 8965 1077 50  0000 L CNN
F 2 "" H 8950 950 50  0001 C CNN
F 3 "" H 8950 950 50  0001 C CNN
	1    8950 950 
	0    -1   -1   0   
$EndComp
Wire Notes Line
	11050 600  8600 600 
Wire Notes Line
	8600 1800 11050 1800
Wire Wire Line
	9150 950  8950 950 
$Comp
L pollex-logo:LOGO #G?
U 1 1 5F8C4574
P 1500 7200
F 0 "#G?" H 1500 7080 60  0001 C CNN
F 1 "LOGO" H 1500 7320 60  0001 C CNN
F 2 "" H 1500 7200 50  0001 C CNN
F 3 "" H 1500 7200 50  0001 C CNN
	1    1500 7200
	1    0    0    -1  
$EndComp
Connection ~ 1550 1050
Wire Wire Line
	1550 1050 1250 1050
Wire Notes Line
	600  650  3850 650 
Wire Notes Line
	600  2100 600  650 
Wire Notes Line
	600  2100 3850 2100
$Comp
L power:GND #PWR?
U 1 1 5F5F0B32
P 1550 1300
F 0 "#PWR?" H 1550 1050 50  0001 C CNN
F 1 "GND" H 1555 1127 50  0000 C CNN
F 2 "" H 1550 1300 50  0001 C CNN
F 3 "" H 1550 1300 50  0001 C CNN
	1    1550 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1050 1550 1100
Wire Wire Line
	1650 1050 1550 1050
Wire Notes Line
	3850 650  3850 2100
Text GLabel 2600 1300 0    50   Input ~ 0
D-
Text GLabel 3400 1300 2    50   Input ~ 0
D+
$Comp
L power:VBUS #PWR?
U 1 1 5F5AFF69
P 3000 1000
F 0 "#PWR?" H 3000 850 50  0001 C CNN
F 1 "VBUS" H 3000 1150 50  0000 C CNN
F 2 "" H 3000 1000 50  0001 C CNN
F 3 "" H 3000 1000 50  0001 C CNN
	1    3000 1000
	1    0    0    -1  
$EndComp
Text GLabel 1250 1350 2    50   Input ~ 0
D-
Text GLabel 1250 1250 2    50   Input ~ 0
D+
$Comp
L Connector:USB_B_Mini J?
U 1 1 5F55AD22
P 950 1250
F 0 "J?" H 1007 1717 50  0000 C CNN
F 1 "USB_B_Mini" H 1007 1626 50  0000 C CNN
F 2 "" H 1100 1200 50  0001 C CNN
F 3 "~" H 1100 1200 50  0001 C CNN
	1    950  1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1800 3000 1850
$Comp
L power:GND #PWR?
U 1 1 5F60B01A
P 3000 1850
F 0 "#PWR?" H 3000 1600 50  0001 C CNN
F 1 "GND" H 3005 1677 50  0000 C CNN
F 2 "" H 3000 1850 50  0001 C CNN
F 3 "" H 3000 1850 50  0001 C CNN
	1    3000 1850
	1    0    0    -1  
$EndComp
$Comp
L Power_Protection:USBLC6-2P6 U?
U 1 1 5F5F2E2F
P 3000 1400
F 0 "U?" H 2650 1850 50  0000 C CNN
F 1 "USBLC6-2P6" H 2650 1750 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-666" H 3000 900 50  0001 C CNN
F 3 "https://www.st.com/resource/en/datasheet/usblc6-2.pdf" H 3200 1750 50  0001 C CNN
	1    3000 1400
	1    0    0    -1  
$EndComp
Text Notes 600  650  0    50   ~ 0
USB Connection + ESD
Wire Wire Line
	850  1650 850  1800
Wire Wire Line
	950  1800 1300 1800
Connection ~ 950  1800
Wire Wire Line
	950  1650 950  1800
Connection ~ 1300 1800
Wire Wire Line
	1300 1850 1300 1800
Wire Wire Line
	850  1800 950  1800
Wire Wire Line
	1300 1750 1300 1800
Wire Wire Line
	1300 1450 1300 1550
Wire Wire Line
	1300 1450 1250 1450
$Comp
L Device:R_Small R?
U 1 1 5F7725CB
P 1300 1650
F 0 "R?" V 1350 1750 50  0000 C TNN
F 1 "10k" V 1350 1600 50  0000 C TNN
F 2 "" H 1300 1650 50  0001 C CNN
F 3 "~" H 1300 1650 50  0001 C CNN
	1    1300 1650
	1    0    0    -1  
$EndComp
Text GLabel 3400 1500 2    50   Input ~ 0
USB_DP
Text GLabel 2600 1500 0    50   Input ~ 0
USB_DM
$Comp
L power:VBUS #PWR?
U 1 1 5F7514D9
P 1650 1050
F 0 "#PWR?" H 1650 900 50  0001 C CNN
F 1 "VBUS" V 1550 1100 50  0000 C CNN
F 2 "" H 1650 1050 50  0001 C CNN
F 3 "" H 1650 1050 50  0001 C CNN
	1    1650 1050
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F6735C8
P 1550 1200
F 0 "C?" H 1642 1246 50  0000 L CNN
F 1 "4.7u" H 1642 1155 50  0000 L CNN
F 2 "" H 1550 1200 50  0001 C CNN
F 3 "~" H 1550 1200 50  0001 C CNN
	1    1550 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F57727A
P 1300 1850
F 0 "#PWR?" H 1300 1600 50  0001 C CNN
F 1 "GND" H 1305 1677 50  0000 C CNN
F 2 "" H 1300 1850 50  0001 C CNN
F 3 "" H 1300 1850 50  0001 C CNN
	1    1300 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 2050 6500 2050
Connection ~ 6050 2050
Wire Wire Line
	6050 1950 6050 2050
$Comp
L Device:R_Small R?
U 1 1 5FBC0D04
P 6050 1850
F 0 "R?" H 6150 1850 50  0000 C CNN
F 1 "22k" H 6150 1750 50  0000 C CNN
F 2 "" H 6050 1850 50  0001 C CNN
F 3 "~" H 6050 1850 50  0001 C CNN
	1    6050 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 2050 6050 2050
Text GLabel 6100 1550 2    50   Input ~ 0
BATT_T
Wire Wire Line
	6050 1550 6100 1550
Wire Wire Line
	6500 2050 6700 2050
Connection ~ 6500 2050
Wire Wire Line
	6500 1450 6500 2050
Wire Wire Line
	6500 1200 6800 1200
Connection ~ 6500 1200
Wire Wire Line
	6500 1200 6500 1250
Wire Wire Line
	6050 1200 6500 1200
Wire Wire Line
	6700 1050 6700 2050
Wire Wire Line
	6700 750  7000 750 
Connection ~ 6700 750 
Wire Wire Line
	6700 750  6700 850 
Wire Wire Line
	4900 750  6700 750 
$Comp
L Device:R_Small R?
U 1 1 5FB6C63F
P 6050 1650
F 0 "R?" H 6150 1650 50  0000 C CNN
F 1 "56k" H 6150 1550 50  0000 C CNN
F 2 "" H 6050 1650 50  0001 C CNN
F 3 "~" H 6050 1650 50  0001 C CNN
	1    6050 1650
	1    0    0    -1  
$EndComp
Connection ~ 6050 1550
Wire Wire Line
	6050 1550 5750 1550
Wire Wire Line
	6050 1450 6050 1550
Wire Wire Line
	6050 1200 6050 1250
Connection ~ 6050 1200
Wire Wire Line
	6050 1150 6050 1200
Wire Wire Line
	5750 1200 6050 1200
$Comp
L Device:R_Small R?
U 1 1 5FB1A551
P 6050 1350
F 0 "R?" H 6150 1400 50  0000 C CNN
F 1 "5.1k" H 6200 1300 50  0000 C CNN
F 2 "" H 6050 1350 50  0001 C CNN
F 3 "~" H 6050 1350 50  0001 C CNN
	1    6050 1350
	1    0    0    -1  
$EndComp
Wire Notes Line
	6950 1500 6950 2300
Wire Notes Line
	8150 1500 6950 1500
Wire Notes Line
	3950 2300 8150 2300
Wire Notes Line
	3950 650  8150 650 
Connection ~ 7000 750 
Wire Wire Line
	7000 750  7600 750 
Wire Wire Line
	7000 900  7000 750 
Wire Wire Line
	7400 1900 7450 1900
Text GLabel 7400 1900 0    50   Input ~ 0
BATT_T
$Comp
L power:+BATT #PWR?
U 1 1 5FA457C1
P 6050 1150
F 0 "#PWR?" H 6050 1000 50  0001 C CNN
F 1 "+BATT" H 6050 1300 50  0000 C CNN
F 2 "" H 6050 1150 50  0001 C CNN
F 3 "" H 6050 1150 50  0001 C CNN
	1    6050 1150
	1    0    0    -1  
$EndComp
Text Notes 7600 1700 0    50   ~ 0
Battery\nconnector
Wire Wire Line
	7350 1800 7350 1750
Wire Wire Line
	7450 1800 7350 1800
Wire Wire Line
	7350 2000 7150 2000
Connection ~ 7350 2000
Wire Wire Line
	7350 2000 7350 2050
Wire Wire Line
	7150 2000 7150 2050
Wire Wire Line
	7450 2000 7350 2000
$Comp
L power:-BATT #PWR?
U 1 1 5FA061AC
P 7350 2050
F 0 "#PWR?" H 7350 1900 50  0001 C CNN
F 1 "-BATT" H 7350 2200 50  0000 C CNN
F 2 "" H 7350 2050 50  0001 C CNN
F 3 "" H 7350 2050 50  0001 C CNN
	1    7350 2050
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J?
U 1 1 5F9FB40F
P 7650 1900
F 0 "J?" H 7730 1942 50  0000 L CNN
F 1 "JST PH 3" H 7730 1851 50  0000 L CNN
F 2 "" H 7650 1900 50  0001 C CNN
F 3 "~" H 7650 1900 50  0001 C CNN
	1    7650 1900
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:AO3401A Q?
U 1 1 5F8C709D
P 7000 1100
F 0 "Q?" V 7249 1100 50  0000 C CNN
F 1 "AO3401A" V 7340 1100 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7200 1025 50  0001 L CIN
F 3 "http://www.aosmd.com/pdfs/datasheet/AO3401A.pdf" H 7000 1100 50  0001 L CNN
	1    7000 1100
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5F5AC53B
P 5800 1900
F 0 "R?" H 5741 1854 50  0000 R CNN
F 1 "1.5k" H 5741 1945 50  0000 R CNN
F 2 "" H 5800 1900 50  0001 C CNN
F 3 "~" H 5800 1900 50  0001 C CNN
	1    5800 1900
	-1   0    0    1   
$EndComp
Connection ~ 4500 750 
Wire Wire Line
	4500 750  4400 750 
$Comp
L Device:R_Small R?
U 1 1 5F5FD7DC
P 6700 950
F 0 "R?" H 6800 950 50  0000 C CNN
F 1 "10k" H 6800 850 50  0000 C CNN
F 2 "" H 6700 950 50  0001 C CNN
F 3 "~" H 6700 950 50  0001 C CNN
	1    6700 950 
	1    0    0    -1  
$EndComp
Connection ~ 7600 1200
Wire Wire Line
	7600 1200 7800 1200
Wire Wire Line
	7450 1200 7600 1200
Wire Wire Line
	7600 1000 7600 1200
Wire Wire Line
	7600 800  7600 750 
Wire Wire Line
	7250 1200 7200 1200
$Comp
L Device:D_Schottky_Small D?
U 1 1 5F5A15C4
P 7600 900
F 0 "D?" H 7550 1100 50  0000 C CNN
F 1 "B5819W" H 7550 1000 50  0000 C CNN
F 2 "" V 7600 900 50  0001 C CNN
F 3 "~" V 7600 900 50  0001 C CNN
	1    7600 900 
	0    1    -1   0   
$EndComp
$Comp
L Device:D_Schottky_Small D?
U 1 1 5F545D14
P 7350 1200
F 0 "D?" H 7300 1400 50  0000 C CNN
F 1 "B5819W" H 7300 1300 50  0000 C CNN
F 2 "" V 7350 1200 50  0001 C CNN
F 3 "~" V 7350 1200 50  0001 C CNN
	1    7350 1200
	-1   0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR?
U 1 1 5F751DBF
P 4400 750
F 0 "#PWR?" H 4400 600 50  0001 C CNN
F 1 "VBUS" V 4415 877 50  0000 L CNN
F 2 "" H 4400 750 50  0001 C CNN
F 3 "" H 4400 750 50  0001 C CNN
	1    4400 750 
	0    -1   -1   0   
$EndComp
Text Notes 3950 650  0    50   ~ 0
USB/Battery Input & Charger
Wire Notes Line
	8150 2300 8150 650 
Wire Notes Line
	3950 650  3950 2300
Connection ~ 4900 750 
$Comp
L power:GND #PWR?
U 1 1 5F62F76E
P 7150 2050
F 0 "#PWR?" H 7150 1800 50  0001 C CNN
F 1 "GND" H 7155 1877 50  0000 C CNN
F 2 "" H 7150 2050 50  0001 C CNN
F 3 "" H 7150 2050 50  0001 C CNN
	1    7150 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 750  4650 750 
Wire Wire Line
	4500 1050 4500 750 
Wire Wire Line
	4500 1650 4800 1650
Wire Wire Line
	4500 1250 4500 1650
$Comp
L Device:LED_Small D?
U 1 1 5F5BA671
P 4500 1150
F 0 "D?" H 4550 1300 50  0000 L TNN
F 1 "Green" H 4550 1200 50  0000 L CNN
F 2 "" V 4500 1150 50  0001 C CNN
F 3 "~" V 4500 1150 50  0001 C CNN
	1    4500 1150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4650 1550 4800 1550
Wire Wire Line
	4650 1250 4650 1550
$Comp
L power:VCC #PWR?
U 1 1 5F612BB5
P 7800 1200
F 0 "#PWR?" H 7800 1050 50  0001 C CNN
F 1 "VCC" V 7815 1328 50  0000 L CNN
F 2 "" H 7800 1200 50  0001 C CNN
F 3 "" H 7800 1200 50  0001 C CNN
	1    7800 1200
	0    1    1    0   
$EndComp
Wire Wire Line
	4900 750  4900 1200
Wire Wire Line
	4650 750  4900 750 
Connection ~ 4650 750 
Wire Wire Line
	4650 750  4650 1050
Connection ~ 5800 2050
$Comp
L power:GND #PWR?
U 1 1 5F5E60AF
P 5800 2050
F 0 "#PWR?" H 5800 1800 50  0001 C CNN
F 1 "GND" H 5805 1877 50  0000 C CNN
F 2 "" H 5800 2050 50  0001 C CNN
F 3 "" H 5800 2050 50  0001 C CNN
	1    5800 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 2050 5800 2050
$Comp
L Device:R_Small R?
U 1 1 5F5D00A0
P 4900 1650
F 0 "R?" V 4850 1750 50  0000 C BNN
F 1 "?" V 4850 1600 50  0000 C BNN
F 2 "" H 4900 1650 50  0001 C CNN
F 3 "~" H 4900 1650 50  0001 C CNN
	1    4900 1650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5F5CFAB2
P 4900 1550
F 0 "R?" V 4950 1650 50  0000 C TNN
F 1 "?" V 4950 1500 50  0000 C TNN
F 2 "" H 4900 1550 50  0001 C CNN
F 3 "~" H 4900 1550 50  0001 C CNN
	1    4900 1550
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_Small D?
U 1 1 5F5B9B92
P 4650 1150
F 0 "D?" H 4700 1100 50  0000 L CNN
F 1 "Red" H 4700 1000 50  0000 L BNN
F 2 "" V 4650 1150 50  0001 C CNN
F 3 "~" V 4650 1150 50  0001 C CNN
	1    4650 1150
	0    -1   -1   0   
$EndComp
Connection ~ 4900 1200
Wire Wire Line
	5800 2000 5800 2050
$Comp
L Device:C_Small C?
U 1 1 5F5A935C
P 6500 1350
F 0 "C?" H 6350 1400 50  0000 L CNN
F 1 "10u" H 6300 1300 50  0000 L CNN
F 2 "" H 6500 1350 50  0001 C CNN
F 3 "~" H 6500 1350 50  0001 C CNN
	1    6500 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 1300 4900 1200
Wire Wire Line
	5000 1300 4900 1300
Wire Wire Line
	4900 1200 5000 1200
Wire Wire Line
	5800 1650 5800 1800
Wire Wire Line
	5400 2000 5400 2050
Wire Wire Line
	5750 1650 5800 1650
$Comp
L tp4056:TP4056 U??
U 1 1 5F584A16
P 5400 1300
F 0 "U??" H 5375 1665 50  0000 C CNN
F 1 "TP4056" H 5375 1574 50  0000 C CNN
F 2 "" H 5400 1300 50  0001 C CNN
F 3 "" H 5400 1300 50  0001 C CNN
	1    5400 1300
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR?
U 1 1 5F574D38
P 7350 1750
F 0 "#PWR?" H 7350 1600 50  0001 C CNN
F 1 "+BATT" H 7350 1900 50  0000 C CNN
F 2 "" H 7350 1750 50  0001 C CNN
F 3 "" H 7350 1750 50  0001 C CNN
	1    7350 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 4500 5000 4500
Connection ~ 4950 4500
Wire Wire Line
	4950 4600 5000 4600
Connection ~ 4950 4600
Wire Wire Line
	4950 4600 4950 4500
Wire Wire Line
	4900 4600 4950 4600
Wire Wire Line
	4900 4500 4950 4500
Wire Wire Line
	4650 4500 4700 4500
Wire Wire Line
	4650 4350 4650 4500
$Comp
L Device:R_Small R?
U 1 1 5F9C8E72
P 4800 4500
F 0 "R?" V 4850 4600 50  0000 C TNN
F 1 "10k" V 4850 4450 50  0000 C TNN
F 2 "" H 4800 4500 50  0001 C CNN
F 3 "~" H 4800 4500 50  0001 C CNN
	1    4800 4500
	0    -1   -1   0   
$EndComp
Text GLabel 4900 4600 0    50   Input ~ 0
SPI_SS3
$Comp
L power:+3.3V #PWR?
U 1 1 5F9C8E67
P 4650 4350
F 0 "#PWR?" H 4650 4200 50  0001 C CNN
F 1 "+3.3V" H 4800 4450 50  0000 C CNN
F 2 "" H 4650 4350 50  0001 C CNN
F 3 "" H 4650 4350 50  0001 C CNN
	1    4650 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 3950 5000 3950
Connection ~ 4950 3950
Wire Wire Line
	4950 4050 5000 4050
Connection ~ 4950 4050
Wire Wire Line
	4950 4050 4950 3950
Wire Wire Line
	4900 4050 4950 4050
Wire Wire Line
	4900 3950 4950 3950
Wire Wire Line
	4650 3950 4700 3950
Wire Wire Line
	4650 3800 4650 3950
$Comp
L Device:R_Small R?
U 1 1 5F9B8199
P 4800 3950
F 0 "R?" V 4850 4050 50  0000 C TNN
F 1 "10k" V 4850 3900 50  0000 C TNN
F 2 "" H 4800 3950 50  0001 C CNN
F 3 "~" H 4800 3950 50  0001 C CNN
	1    4800 3950
	0    -1   -1   0   
$EndComp
Text GLabel 4900 4050 0    50   Input ~ 0
SPI_SS2
$Comp
L power:+3.3V #PWR?
U 1 1 5F9B818E
P 4650 3800
F 0 "#PWR?" H 4650 3650 50  0001 C CNN
F 1 "+3.3V" H 4800 3900 50  0000 C CNN
F 2 "" H 4650 3800 50  0001 C CNN
F 3 "" H 4650 3800 50  0001 C CNN
	1    4650 3800
	1    0    0    -1  
$EndComp
Wire Notes Line
	4450 4800 6000 4800
Wire Notes Line
	4450 3100 6000 3100
Wire Wire Line
	4950 3400 5000 3400
Connection ~ 4950 3400
Wire Wire Line
	4950 3500 5000 3500
Connection ~ 4950 3500
Wire Wire Line
	4950 3500 4950 3400
Wire Wire Line
	4900 3500 4950 3500
Wire Wire Line
	4900 3400 4950 3400
Wire Wire Line
	4650 3400 4700 3400
Wire Wire Line
	4650 3250 4650 3400
$Comp
L Device:R_Small R?
U 1 1 5F965990
P 4800 3400
F 0 "R?" V 4850 3500 50  0000 C TNN
F 1 "10k" V 4850 3350 50  0000 C TNN
F 2 "" H 4800 3400 50  0001 C CNN
F 3 "~" H 4800 3400 50  0001 C CNN
	1    4800 3400
	0    -1   -1   0   
$EndComp
Text Notes 4450 3100 0    50   ~ 0
SPI Connectors
Wire Notes Line
	6000 3100 6000 4800
Wire Notes Line
	4450 3100 4450 4800
$Comp
L power:GND #PWR?
U 1 1 5F904A28
P 5000 4700
F 0 "#PWR?" H 5000 4450 50  0001 C CNN
F 1 "GND" V 5000 4500 50  0000 C CNN
F 2 "" H 5000 4700 50  0001 C CNN
F 3 "" H 5000 4700 50  0001 C CNN
	1    5000 4700
	0    1    1    0   
$EndComp
Text GLabel 5500 4700 2    50   Input ~ 0
SPI1_MOSI
Text GLabel 5500 4600 2    50   Input ~ 0
SPI1_MISO
Text GLabel 5500 4500 2    50   Input ~ 0
SPI1_SCK
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J?
U 1 1 5F904A11
P 5200 4600
F 0 "J?" H 5250 4917 50  0000 C CNN
F 1 "SPI3_connector" H 5250 4826 50  0000 C CNN
F 2 "" H 5200 4600 50  0001 C CNN
F 3 "~" H 5200 4600 50  0001 C CNN
	1    5200 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F8FC165
P 5000 4150
F 0 "#PWR?" H 5000 3900 50  0001 C CNN
F 1 "GND" V 5000 3950 50  0000 C CNN
F 2 "" H 5000 4150 50  0001 C CNN
F 3 "" H 5000 4150 50  0001 C CNN
	1    5000 4150
	0    1    1    0   
$EndComp
Text GLabel 5500 4150 2    50   Input ~ 0
SPI1_MOSI
Text GLabel 5500 4050 2    50   Input ~ 0
SPI1_MISO
Text GLabel 5500 3950 2    50   Input ~ 0
SPI1_SCK
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J?
U 1 1 5F8FC14E
P 5200 4050
F 0 "J?" H 5250 4367 50  0000 C CNN
F 1 "SPI2_connector" H 5250 4276 50  0000 C CNN
F 2 "" H 5200 4050 50  0001 C CNN
F 3 "~" H 5200 4050 50  0001 C CNN
	1    5200 4050
	1    0    0    -1  
$EndComp
Text GLabel 4900 3500 0    50   Input ~ 0
SPI_SS1
$Comp
L power:GND #PWR?
U 1 1 5F8DCAB1
P 5000 3600
F 0 "#PWR?" H 5000 3350 50  0001 C CNN
F 1 "GND" V 5000 3400 50  0000 C CNN
F 2 "" H 5000 3600 50  0001 C CNN
F 3 "" H 5000 3600 50  0001 C CNN
	1    5000 3600
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5F8DB601
P 4650 3250
F 0 "#PWR?" H 4650 3100 50  0001 C CNN
F 1 "+3.3V" H 4800 3350 50  0000 C CNN
F 2 "" H 4650 3250 50  0001 C CNN
F 3 "" H 4650 3250 50  0001 C CNN
	1    4650 3250
	1    0    0    -1  
$EndComp
Text GLabel 5500 3600 2    50   Input ~ 0
SPI1_MOSI
Text GLabel 5500 3500 2    50   Input ~ 0
SPI1_MISO
Text GLabel 5500 3400 2    50   Input ~ 0
SPI1_SCK
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J?
U 1 1 5F8D1C73
P 5200 3500
F 0 "J?" H 5250 3817 50  0000 C CNN
F 1 "SPI1_connector" H 5250 3726 50  0000 C CNN
F 2 "" H 5200 3500 50  0001 C CNN
F 3 "~" H 5200 3500 50  0001 C CNN
	1    5200 3500
	1    0    0    -1  
$EndComp
Wire Notes Line
	3600 3850 3600 3100
Wire Notes Line
	4350 3850 3600 3850
Wire Notes Line
	4350 3100 4350 3850
Wire Notes Line
	3600 3100 4350 3100
Text Notes 3600 3100 0    50   ~ 0
SWD Connector
Text GLabel 3950 3750 0    50   Input ~ 0
NRST
$Comp
L power:GND #PWR?
U 1 1 5F811893
P 3950 3550
F 0 "#PWR?" H 3950 3300 50  0001 C CNN
F 1 "GND" V 3950 3450 50  0000 R CNN
F 2 "" H 3950 3550 50  0001 C CNN
F 3 "" H 3950 3550 50  0001 C CNN
	1    3950 3550
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5F810F04
P 3950 3350
F 0 "#PWR?" H 3950 3200 50  0001 C CNN
F 1 "+3.3V" V 3950 3450 50  0000 L CNN
F 2 "" H 3950 3350 50  0001 C CNN
F 3 "" H 3950 3350 50  0001 C CNN
	1    3950 3350
	0    -1   -1   0   
$EndComp
Text GLabel 3950 3450 0    50   Input ~ 0
SWCLK
Text GLabel 3950 3650 0    50   Input ~ 0
SWDIO
$Comp
L Connector_Generic:Conn_01x05 J?
U 1 1 5F80F4FB
P 4150 3550
F 0 "J?" H 3900 3900 50  0000 L CNN
F 1 "01x05" H 4050 3900 50  0000 L CNN
F 2 "" H 4150 3550 50  0001 C CNN
F 3 "~" H 4150 3550 50  0001 C CNN
	1    4150 3550
	1    0    0    -1  
$EndComp
Wire Notes Line
	600  3100 3500 3100
Wire Notes Line
	3500 4000 600  4000
Wire Notes Line
	3500 3100 3500 4000
Wire Notes Line
	2300 4100 2300 5950
Wire Notes Line
	600  5950 2300 5950
Wire Notes Line
	600  4100 600  5950
Wire Notes Line
	2500 4950 4000 4950
Wire Notes Line
	4000 4950 4000 5950
Wire Notes Line
	2500 4950 2500 5950
$Comp
L power:+3.3VA #PWR?
U 1 1 5F81F09F
P 3750 5800
F 0 "#PWR?" H 3750 5650 50  0001 C CNN
F 1 "+3.3VA" V 3650 5850 50  0000 C CNN
F 2 "" H 3750 5800 50  0001 C CNN
F 3 "" H 3750 5800 50  0001 C CNN
	1    3750 5800
	0    1    1    0   
$EndComp
Wire Notes Line
	4000 5950 2500 5950
$Comp
L Device:LED_Small D?
U 1 1 5F7FD158
P 3150 5800
F 0 "D?" H 3150 6035 50  0000 C CNN
F 1 "Red" H 3150 5944 50  0000 C CNN
F 2 "" V 3150 5800 50  0001 C CNN
F 3 "~" V 3150 5800 50  0001 C CNN
	1    3150 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 5800 3700 5800
Wire Wire Line
	2750 5800 2800 5800
$Comp
L power:GND #PWR?
U 1 1 5F7FD14B
P 2750 5800
F 0 "#PWR?" H 2750 5550 50  0001 C CNN
F 1 "GND" H 2755 5627 50  0000 C CNN
F 2 "" H 2750 5800 50  0001 C CNN
F 3 "" H 2750 5800 50  0001 C CNN
	1    2750 5800
	0    1    1    0   
$EndComp
Wire Wire Line
	3050 5800 3000 5800
Wire Wire Line
	3300 5800 3250 5800
$Comp
L Device:R_Small R?
U 1 1 5F7FD13F
P 2900 5800
F 0 "R?" V 2850 5900 50  0000 C BNN
F 1 "1k" V 2850 5750 50  0000 C BNN
F 2 "" H 2900 5800 50  0001 C CNN
F 3 "~" H 2900 5800 50  0001 C CNN
	1    2900 5800
	0    -1   -1   0   
$EndComp
$Comp
L Switch:SW_SPST SW?
U 1 1 5F7FD135
P 3500 5800
F 0 "SW?" H 3500 5575 50  0000 C CNN
F 1 "?" H 3500 5666 50  0000 C CNN
F 2 "" H 3500 5800 50  0001 C CNN
F 3 "~" H 3500 5800 50  0001 C CNN
	1    3500 5800
	-1   0    0    1   
$EndComp
Text Notes 2500 4950 0    50   ~ 0
Status LEDs
$Comp
L Device:LED_Small D?
U 1 1 5F7CE97D
P 3150 5250
F 0 "D?" H 3150 5485 50  0000 C CNN
F 1 "Green" H 3150 5394 50  0000 C CNN
F 2 "" V 3150 5250 50  0001 C CNN
F 3 "~" V 3150 5250 50  0001 C CNN
	1    3150 5250
	1    0    0    -1  
$EndComp
Text GLabel 3300 5250 2    50   Input ~ 0
LED0
Wire Wire Line
	2750 5250 2800 5250
$Comp
L power:GND #PWR?
U 1 1 5F7E07DB
P 2750 5250
F 0 "#PWR?" H 2750 5000 50  0001 C CNN
F 1 "GND" H 2755 5077 50  0000 C CNN
F 2 "" H 2750 5250 50  0001 C CNN
F 3 "" H 2750 5250 50  0001 C CNN
	1    2750 5250
	0    1    1    0   
$EndComp
Wire Wire Line
	3050 5250 3000 5250
Wire Wire Line
	3300 5250 3250 5250
$Comp
L Device:R_Small R?
U 1 1 5F7D3759
P 2900 5250
F 0 "R?" V 2850 5350 50  0000 C BNN
F 1 "1k" V 2850 5200 50  0000 C BNN
F 2 "" H 2900 5250 50  0001 C CNN
F 3 "~" H 2900 5250 50  0001 C CNN
	1    2900 5250
	0    -1   -1   0   
$EndComp
Text Notes 2500 4200 0    50   ~ 0
BOOT mode switch
Wire Notes Line
	2500 4750 4250 4750
Wire Notes Line
	2500 4200 4250 4200
Wire Wire Line
	3150 4550 3200 4550
Wire Wire Line
	2950 4550 2900 4550
Wire Wire Line
	3600 4450 3650 4450
Wire Wire Line
	3650 4650 3600 4650
Wire Notes Line
	2500 4200 2500 4750
Wire Notes Line
	4250 4200 4250 4750
$Comp
L power:+3.3VA #PWR?
U 1 1 5F6D5329
P 3650 4650
F 0 "#PWR?" H 3650 4500 50  0001 C CNN
F 1 "+3.3VA" V 3650 4800 50  0000 L CNN
F 2 "" H 3650 4650 50  0001 C CNN
F 3 "" H 3650 4650 50  0001 C CNN
	1    3650 4650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F6D4FF4
P 3650 4450
F 0 "#PWR?" H 3650 4200 50  0001 C CNN
F 1 "GND" V 3650 4300 50  0000 R CNN
F 2 "" H 3650 4450 50  0001 C CNN
F 3 "" H 3650 4450 50  0001 C CNN
	1    3650 4450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5F6BDCF4
P 3050 4550
F 0 "R?" V 3100 4650 50  0000 C TNN
F 1 "10k" V 3100 4500 50  0000 C TNN
F 2 "" H 3050 4550 50  0001 C CNN
F 3 "~" H 3050 4550 50  0001 C CNN
	1    3050 4550
	0    -1   -1   0   
$EndComp
Text GLabel 2900 4550 0    50   Input ~ 0
BOOT0
$Comp
L Switch:SW_DPDT_x2 SW?
U 1 1 5F6B6B83
P 3400 4550
F 0 "SW?" H 3400 4835 50  0000 C CNN
F 1 "SW_DPDT_x2" H 3400 4744 50  0000 C CNN
F 2 "" H 3400 4550 50  0001 C CNN
F 3 "~" H 3400 4550 50  0001 C CNN
	1    3400 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 5600 1650 5600
Connection ~ 1550 5600
Wire Wire Line
	1400 5150 1550 5150
Wire Wire Line
	1550 5150 1550 5600
Wire Wire Line
	1400 5600 1550 5600
Wire Wire Line
	1400 5350 1400 5600
Text Notes 600  4100 0    50   ~ 0
Oscillator crystals
Wire Notes Line
	600  4100 2300 4100
Wire Wire Line
	1650 5250 1650 5350
Wire Wire Line
	1150 5250 1150 5350
Connection ~ 1400 5600
Wire Wire Line
	1150 5600 1400 5600
Wire Wire Line
	1150 5250 1300 5250
Connection ~ 1150 5250
Wire Wire Line
	1100 5250 1150 5250
Connection ~ 1650 5250
Wire Wire Line
	1500 5250 1650 5250
Wire Wire Line
	1700 5250 1650 5250
Wire Wire Line
	1150 5600 1150 5550
Wire Wire Line
	1650 5600 1650 5550
$Comp
L Device:C_Small C?
U 1 1 5F62995F
P 1650 5450
F 0 "C?" H 1742 5496 50  0000 L CNN
F 1 "12p" H 1742 5405 50  0000 L CNN
F 2 "" H 1650 5450 50  0001 C CNN
F 3 "~" H 1650 5450 50  0001 C CNN
	1    1650 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F629959
P 1150 5450
F 0 "C?" H 1242 5496 50  0000 L CNN
F 1 "12p" H 1242 5405 50  0000 L CNN
F 2 "" H 1150 5450 50  0001 C CNN
F 3 "~" H 1150 5450 50  0001 C CNN
	1    1150 5450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F629953
P 1400 5600
F 0 "#PWR?" H 1400 5350 50  0001 C CNN
F 1 "GND" H 1405 5427 50  0000 C CNN
F 2 "" H 1400 5600 50  0001 C CNN
F 3 "" H 1400 5600 50  0001 C CNN
	1    1400 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 4650 1650 4650
Connection ~ 1400 4650
Wire Wire Line
	1150 4650 1400 4650
$Comp
L Device:Crystal_GND24_Small XOSC?
U 1 1 5F60E10F
P 1400 5250
F 0 "XOSC?" H 1200 5450 50  0000 C CNN
F 1 "16MHz" H 1600 5450 50  0000 C CNN
F 2 "" H 1400 5250 50  0001 C CNN
F 3 "~" H 1400 5250 50  0001 C CNN
	1    1400 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 4350 1300 4350
Connection ~ 1150 4350
Wire Wire Line
	1100 4350 1150 4350
Connection ~ 1650 4350
Wire Wire Line
	1500 4350 1650 4350
Wire Wire Line
	1700 4350 1650 4350
Wire Wire Line
	1650 4350 1650 4400
Wire Wire Line
	1150 4350 1150 4400
Wire Wire Line
	1150 4650 1150 4600
Wire Wire Line
	1650 4650 1650 4600
$Comp
L Device:C_Small C?
U 1 1 5F5DD7D4
P 1650 4500
F 0 "C?" H 1742 4546 50  0000 L CNN
F 1 "21p" H 1742 4455 50  0000 L CNN
F 2 "" H 1650 4500 50  0001 C CNN
F 3 "~" H 1650 4500 50  0001 C CNN
	1    1650 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F5DC066
P 1150 4500
F 0 "C?" H 1242 4546 50  0000 L CNN
F 1 "21p" H 1242 4455 50  0000 L CNN
F 2 "" H 1150 4500 50  0001 C CNN
F 3 "~" H 1150 4500 50  0001 C CNN
	1    1150 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F5DB86D
P 1400 4650
F 0 "#PWR?" H 1400 4400 50  0001 C CNN
F 1 "GND" H 1405 4477 50  0000 C CNN
F 2 "" H 1400 4650 50  0001 C CNN
F 3 "" H 1400 4650 50  0001 C CNN
	1    1400 4650
	1    0    0    -1  
$EndComp
Text GLabel 1700 4350 2    50   Input ~ 0
XOSC32_OUT
Text GLabel 1100 4350 0    50   Input ~ 0
XOSC32_IN
$Comp
L Device:Crystal_Small XOSC32
U 1 1 5F5C0C6B
P 1400 4350
F 0 "XOSC32" H 1100 4500 50  0000 C CNN
F 1 "32.768KHz" H 1750 4500 50  0000 C CNN
F 2 "" H 1400 4350 50  0001 C CNN
F 3 "~" H 1400 4350 50  0001 C CNN
	1    1400 4350
	1    0    0    -1  
$EndComp
Text GLabel 1100 5250 0    50   Input ~ 0
XOSC_IN
Text GLabel 1700 5250 2    50   Input ~ 0
XOSC_OUT
Text Notes 600  3100 0    50   ~ 0
STM VDD(A) Filters
Wire Notes Line
	600  4000 600  3100
Connection ~ 750  3750
$Comp
L power:GND #PWR?
U 1 1 5F5D6CDD
P 750 3750
F 0 "#PWR?" H 750 3500 50  0001 C CNN
F 1 "GND" H 755 3577 50  0000 C CNN
F 2 "" H 750 3750 50  0001 C CNN
F 3 "" H 750 3750 50  0001 C CNN
	1    750  3750
	1    0    0    -1  
$EndComp
Connection ~ 750  3350
$Comp
L power:+3.3V #PWR?
U 1 1 5F5D630C
P 750 3350
F 0 "#PWR?" H 750 3200 50  0001 C CNN
F 1 "+3.3V" H 765 3523 50  0000 C CNN
F 2 "" H 750 3350 50  0001 C CNN
F 3 "" H 750 3350 50  0001 C CNN
	1    750  3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 3750 1400 3750
Connection ~ 1700 3750
Wire Wire Line
	1700 3650 1700 3750
Wire Wire Line
	1400 3750 1050 3750
Connection ~ 1400 3750
Wire Wire Line
	1400 3650 1400 3750
Wire Wire Line
	1050 3750 750  3750
Connection ~ 1050 3750
Wire Wire Line
	1050 3650 1050 3750
Wire Wire Line
	750  3750 750  3650
Wire Wire Line
	2000 3750 1700 3750
Wire Wire Line
	2000 3650 2000 3750
Wire Wire Line
	1700 3350 2000 3350
Connection ~ 1700 3350
Wire Wire Line
	1700 3350 1700 3450
Wire Wire Line
	1400 3350 1700 3350
Connection ~ 1400 3350
Wire Wire Line
	1400 3450 1400 3350
Wire Wire Line
	1050 3350 1400 3350
Connection ~ 1050 3350
Wire Wire Line
	1050 3450 1050 3350
Wire Wire Line
	2000 3350 2000 3450
Wire Wire Line
	750  3350 1050 3350
Wire Wire Line
	750  3450 750  3350
$Comp
L Device:C_Small C?
U 1 1 5F5B8606
P 2000 3550
F 0 "C?" H 2092 3596 50  0000 L CNN
F 1 "100n" H 2092 3505 50  0000 L CNN
F 2 "" H 2000 3550 50  0001 C CNN
F 3 "~" H 2000 3550 50  0001 C CNN
	1    2000 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F5B83C4
P 1700 3550
F 0 "C?" H 1792 3596 50  0000 L CNN
F 1 "100n" H 1792 3505 50  0000 L CNN
F 2 "" H 1700 3550 50  0001 C CNN
F 3 "~" H 1700 3550 50  0001 C CNN
	1    1700 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F5B80FD
P 1400 3550
F 0 "C?" H 1492 3596 50  0000 L CNN
F 1 "100n" H 1492 3505 50  0000 L CNN
F 2 "" H 1400 3550 50  0001 C CNN
F 3 "~" H 1400 3550 50  0001 C CNN
	1    1400 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F5B7EA2
P 1050 3550
F 0 "C?" H 1142 3596 50  0000 L CNN
F 1 "100n" H 1142 3505 50  0000 L CNN
F 2 "" H 1050 3550 50  0001 C CNN
F 3 "~" H 1050 3550 50  0001 C CNN
	1    1050 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F5B7309
P 750 3550
F 0 "C?" H 842 3596 50  0000 L CNN
F 1 "4.7u" H 842 3505 50  0000 L CNN
F 2 "" H 750 3550 50  0001 C CNN
F 3 "~" H 750 3550 50  0001 C CNN
	1    750  3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F5A8133
P 3300 3750
F 0 "#PWR?" H 3300 3500 50  0001 C CNN
F 1 "GND" H 3305 3577 50  0000 C CNN
F 2 "" H 3300 3750 50  0001 C CNN
F 3 "" H 3300 3750 50  0001 C CNN
	1    3300 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F5A770A
P 2950 3750
F 0 "#PWR?" H 2950 3500 50  0001 C CNN
F 1 "GND" H 2955 3577 50  0000 C CNN
F 2 "" H 2950 3750 50  0001 C CNN
F 3 "" H 2950 3750 50  0001 C CNN
	1    2950 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 3500 2650 3500
Connection ~ 2950 3500
Wire Wire Line
	2850 3500 2950 3500
Wire Wire Line
	3300 3500 3300 3550
Connection ~ 3300 3500
Wire Wire Line
	2950 3500 3300 3500
Wire Wire Line
	3300 3350 3300 3500
Wire Wire Line
	2950 3550 2950 3500
$Comp
L power:+3.3VA #PWR?
U 1 1 5F57F069
P 3300 3350
F 0 "#PWR?" H 3300 3200 50  0001 C CNN
F 1 "+3.3VA" H 3315 3523 50  0000 C CNN
F 2 "" H 3300 3350 50  0001 C CNN
F 3 "" H 3300 3350 50  0001 C CNN
	1    3300 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 3350 2450 3500
$Comp
L Device:C_Small C?
U 1 1 5F574D09
P 2950 3650
F 0 "C?" H 3042 3696 50  0000 L CNN
F 1 "10n" H 3042 3605 50  0000 L CNN
F 2 "" H 2950 3650 50  0001 C CNN
F 3 "~" H 2950 3650 50  0001 C CNN
	1    2950 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F574363
P 3300 3650
F 0 "C?" H 3392 3696 50  0000 L CNN
F 1 "1u" H 3392 3605 50  0000 L CNN
F 2 "" H 3300 3650 50  0001 C CNN
F 3 "~" H 3300 3650 50  0001 C CNN
	1    3300 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:Ferrite_Bead_Small FB?
U 1 1 5F573678
P 2750 3500
F 0 "FB?" V 2950 3400 50  0000 L CNN
F 1 "100 @ 100MHz" V 2850 3100 50  0000 L CNN
F 2 "" V 2680 3500 50  0001 C CNN
F 3 "~" H 2750 3500 50  0001 C CNN
	1    2750 3500
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5F55A20D
P 2450 3350
F 0 "#PWR?" H 2450 3200 50  0001 C CNN
F 1 "+3.3V" H 2465 3523 50  0000 C CNN
F 2 "" H 2450 3350 50  0001 C CNN
F 3 "" H 2450 3350 50  0001 C CNN
	1    2450 3350
	1    0    0    -1  
$EndComp
$Comp
L MCU_ST_STM32F0:STM32F070CBTx U?
U 1 1 5F5295DC
P 9100 4250
F 0 "U?" H 9700 5650 50  0000 C CNN
F 1 "STM32F070CBTx" H 9950 5550 50  0000 C CNN
F 2 "Package_QFP:LQFP-48_7x7mm_P0.5mm" H 8500 2850 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00141386.pdf" H 9100 4250 50  0001 C CNN
	1    9100 4250
	1    0    0    -1  
$EndComp
Text GLabel 8400 4250 0    50   Input ~ 0
SPI_SS3
Text GLabel 8400 4150 0    50   Input ~ 0
SPI_SS2
Text GLabel 8400 4050 0    50   Input ~ 0
SPI_SS1
Text GLabel 9700 4750 2    50   Input ~ 0
SPI_MOSI
Text GLabel 9700 4650 2    50   Input ~ 0
SPI_MISO
Text GLabel 9700 4550 2    50   Input ~ 0
SPI_SCK
Connection ~ 8300 2950
Wire Wire Line
	8200 2950 8300 2950
Wire Wire Line
	8400 2950 8300 2950
Wire Wire Line
	8300 2850 8300 2950
$Comp
L Device:R_Small R?
U 1 1 5F85EFF1
P 8300 2750
F 0 "R?" H 8200 2800 50  0000 C CNN
F 1 "10k" H 8200 2700 50  0000 C CNN
F 2 "" H 8300 2750 50  0001 C CNN
F 3 "~" H 8300 2750 50  0001 C CNN
	1    8300 2750
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5F85E1A1
P 8300 2650
F 0 "#PWR?" H 8300 2500 50  0001 C CNN
F 1 "+3.3V" H 8315 2823 50  0000 C CNN
F 2 "" H 8300 2650 50  0001 C CNN
F 3 "" H 8300 2650 50  0001 C CNN
	1    8300 2650
	1    0    0    -1  
$EndComp
Text GLabel 8400 5350 0    50   Input ~ 0
LED0
Text GLabel 9700 5250 2    50   Input ~ 0
USB_DP
Text GLabel 9700 5150 2    50   Input ~ 0
USB_DM
Text GLabel 9700 5050 2    50   Input ~ 0
UART1_RX
Text GLabel 9700 4950 2    50   Input ~ 0
UART1_TX
Text GLabel 8400 3150 0    50   Input ~ 0
BOOT0
Text GLabel 9700 5450 2    50   Input ~ 0
SWCLK
Text GLabel 9700 5350 2    50   Input ~ 0
SWDIO
Text GLabel 8400 3850 0    50   Input ~ 0
XOSC32_OUT
Text GLabel 8400 3750 0    50   Input ~ 0
XOSC32_IN
Text GLabel 8400 3450 0    50   Input ~ 0
XOSC_OUT
Text GLabel 8400 3350 0    50   Input ~ 0
XOSC_IN
Text GLabel 8200 2950 0    50   Input ~ 0
NRST
Connection ~ 8900 2700
Wire Wire Line
	8900 2650 8900 2700
$Comp
L power:+3.3VA #PWR?
U 1 1 5F57F409
P 9300 2650
F 0 "#PWR?" H 9300 2500 50  0001 C CNN
F 1 "+3.3VA" H 9315 2823 50  0000 C CNN
F 2 "" H 9300 2650 50  0001 C CNN
F 3 "" H 9300 2650 50  0001 C CNN
	1    9300 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 2650 9300 2750
Connection ~ 9000 5800
Wire Wire Line
	9100 5800 9100 5750
Wire Wire Line
	9000 5800 9100 5800
Wire Wire Line
	8900 5800 8900 5850
Connection ~ 8900 5800
Wire Wire Line
	9000 5800 9000 5750
Wire Wire Line
	8900 5800 9000 5800
Wire Wire Line
	8900 5750 8900 5800
Wire Wire Line
	9200 5750 9200 5850
$Comp
L power:GND #PWR?
U 1 1 5F563978
P 9200 5850
F 0 "#PWR?" H 9200 5600 50  0001 C CNN
F 1 "GND" H 9205 5677 50  0000 C CNN
F 2 "" H 9200 5850 50  0001 C CNN
F 3 "" H 9200 5850 50  0001 C CNN
	1    9200 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F56300D
P 8900 5850
F 0 "#PWR?" H 8900 5600 50  0001 C CNN
F 1 "GND" H 8905 5677 50  0000 C CNN
F 2 "" H 8900 5850 50  0001 C CNN
F 3 "" H 8900 5850 50  0001 C CNN
	1    8900 5850
	1    0    0    -1  
$EndComp
Connection ~ 9100 2700
Wire Wire Line
	9200 2700 9200 2750
Wire Wire Line
	9100 2700 9200 2700
Connection ~ 9000 2700
Wire Wire Line
	9100 2700 9100 2750
Wire Wire Line
	9000 2700 9100 2700
Wire Wire Line
	8900 2700 8900 2750
Wire Wire Line
	9000 2700 9000 2750
Wire Wire Line
	8900 2700 9000 2700
$Comp
L power:+3.3V #PWR?
U 1 1 5F684A11
P 8900 2650
F 0 "#PWR?" H 8900 2500 50  0001 C CNN
F 1 "+3.3V" H 8915 2823 50  0000 C CNN
F 2 "" H 8900 2650 50  0001 C CNN
F 3 "" H 8900 2650 50  0001 C CNN
	1    8900 2650
	1    0    0    -1  
$EndComp
$EndSCHEMATC
