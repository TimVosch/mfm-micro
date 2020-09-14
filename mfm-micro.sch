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
L Device:Ferrite_Bead_Small FB1
U 1 1 5F545030
P 9250 950
F 0 "FB1" V 9000 900 50  0000 L CNN
F 1 "100/100MHz" V 9100 1050 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric" V 9180 950 50  0001 C CNN
F 3 "~" H 9250 950 50  0001 C CNN
	1    9250 950 
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5F54E76E
P 9500 1100
F 0 "C1" H 9592 1146 50  0000 L CNN
F 1 "1u" H 9592 1055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 9500 1100 50  0001 C CNN
F 3 "~" H 9500 1100 50  0001 C CNN
	1    9500 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5F55022E
P 10350 1100
F 0 "C2" H 10442 1146 50  0000 L CNN
F 1 "1u" H 10442 1055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 10350 1100 50  0001 C CNN
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
L power:GND #PWR0101
U 1 1 5F554444
P 9950 1500
F 0 "#PWR0101" H 9950 1250 50  0001 C CNN
F 1 "GND" H 9955 1327 50  0000 C CNN
F 2 "" H 9950 1500 50  0001 C CNN
F 3 "" H 9950 1500 50  0001 C CNN
	1    9950 1500
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0102
U 1 1 5F554E1C
P 10600 950
F 0 "#PWR0102" H 10600 800 50  0001 C CNN
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
L Regulator_Linear:XC6206PxxxMR U3
U 1 1 5F556901
P 9950 950
F 0 "U3" H 10100 1200 50  0000 C CNN
F 1 "XC6206P332MR" H 10350 1100 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9950 1175 50  0001 C CIN
F 3 "https://www.torexsemi.com/file/xc6206/XC6206.pdf" H 9950 950 50  0001 C CNN
	1    9950 950 
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0103
U 1 1 5F610957
P 8800 950
F 0 "#PWR0103" H 8800 800 50  0001 C CNN
F 1 "VCC" V 8900 950 50  0000 L CNN
F 2 "" H 8800 950 50  0001 C CNN
F 3 "" H 8800 950 50  0001 C CNN
	1    8800 950 
	0    -1   -1   0   
$EndComp
Wire Notes Line
	11050 600  8600 600 
Wire Notes Line
	8600 1800 11050 1800
$Comp
L pollex-logo:LOGO #G1
U 1 1 5F8C4574
P 1350 7500
F 0 "#G1" H 1350 7380 60  0001 C CNN
F 1 "LOGO" H 1350 7620 60  0001 C CNN
F 2 "" H 1350 7500 50  0001 C CNN
F 3 "" H 1350 7500 50  0001 C CNN
	1    1350 7500
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
L power:GND #PWR0104
U 1 1 5F5F0B32
P 1550 1300
F 0 "#PWR0104" H 1550 1050 50  0001 C CNN
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
L power:VBUS #PWR0105
U 1 1 5F5AFF69
P 3000 1000
F 0 "#PWR0105" H 3000 850 50  0001 C CNN
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
L Connector:USB_B_Mini J1
U 1 1 5F55AD22
P 950 1250
F 0 "J1" H 1007 1717 50  0000 C CNN
F 1 "USB_B_Mini" H 1007 1626 50  0000 C CNN
F 2 "Connector_USB:USB_Mini-B_Tensility_54-00023_Vertical_CircularHoles" H 1100 1200 50  0001 C CNN
F 3 "~" H 1100 1200 50  0001 C CNN
	1    950  1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1800 3000 1850
$Comp
L power:GND #PWR0106
U 1 1 5F60B01A
P 3000 1850
F 0 "#PWR0106" H 3000 1600 50  0001 C CNN
F 1 "GND" H 3005 1677 50  0000 C CNN
F 2 "" H 3000 1850 50  0001 C CNN
F 3 "" H 3000 1850 50  0001 C CNN
	1    3000 1850
	1    0    0    -1  
$EndComp
$Comp
L Power_Protection:USBLC6-2P6 U1
U 1 1 5F5F2E2F
P 3000 1400
F 0 "U1" H 2650 1850 50  0000 C CNN
F 1 "USBLC6-2P6" H 2650 1750 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 3000 900 50  0001 C CNN
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
L Device:R_Small R4
U 1 1 5F7725CB
P 1300 1650
F 0 "R4" V 1350 1750 50  0000 C TNN
F 1 "10k" V 1350 1600 50  0000 C TNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 1300 1650 50  0001 C CNN
F 3 "~" H 1300 1650 50  0001 C CNN
	1    1300 1650
	1    0    0    -1  
$EndComp
Text GLabel 3400 1500 2    50   Input ~ 0
USB_DP
Text GLabel 2600 1500 0    50   Input ~ 0
USB_DM
$Comp
L power:VBUS #PWR0107
U 1 1 5F7514D9
P 1650 1050
F 0 "#PWR0107" H 1650 900 50  0001 C CNN
F 1 "VBUS" V 1550 1100 50  0000 C CNN
F 2 "" H 1650 1050 50  0001 C CNN
F 3 "" H 1650 1050 50  0001 C CNN
	1    1650 1050
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5F6735C8
P 1550 1200
F 0 "C3" H 1642 1246 50  0000 L CNN
F 1 "4.7u" H 1642 1155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1550 1200 50  0001 C CNN
F 3 "~" H 1550 1200 50  0001 C CNN
	1    1550 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5F57727A
P 1300 1850
F 0 "#PWR0108" H 1300 1600 50  0001 C CNN
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
L Device:R_Small R7
U 1 1 5FBC0D04
P 6050 1850
F 0 "R7" H 6150 1850 50  0000 C CNN
F 1 "22k" H 6150 1750 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 6050 1850 50  0001 C CNN
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
	6700 1050 6700 2050
Wire Wire Line
	6700 750  7000 750 
Connection ~ 6700 750 
Wire Wire Line
	6700 750  6700 850 
$Comp
L Device:R_Small R6
U 1 1 5FB6C63F
P 6050 1650
F 0 "R6" H 6150 1650 50  0000 C CNN
F 1 "56k" H 6150 1550 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 6050 1650 50  0001 C CNN
F 3 "~" H 6050 1650 50  0001 C CNN
	1    6050 1650
	1    0    0    -1  
$EndComp
Connection ~ 6050 1550
Wire Wire Line
	6050 1550 5750 1550
$Comp
L Device:R_Small R2
U 1 1 5FB1A551
P 6050 1400
F 0 "R2" H 6150 1450 50  0000 C CNN
F 1 "5.1k" H 6200 1350 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 6050 1400 50  0001 C CNN
F 3 "~" H 6050 1400 50  0001 C CNN
	1    6050 1400
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
L power:+BATT #PWR0109
U 1 1 5FA457C1
P 6250 1150
F 0 "#PWR0109" H 6250 1000 50  0001 C CNN
F 1 "+BATT" H 6250 1300 50  0000 C CNN
F 2 "" H 6250 1150 50  0001 C CNN
F 3 "" H 6250 1150 50  0001 C CNN
	1    6250 1150
	1    0    0    -1  
$EndComp
Text Notes 7600 1700 0    50   ~ 0
Battery\nconnector
Wire Wire Line
	7350 1800 7350 1750
Wire Wire Line
	7450 1800 7350 1800
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 5F9FB40F
P 7650 1900
F 0 "J2" H 7730 1942 50  0000 L CNN
F 1 "JST PH 3" H 7730 1851 50  0000 L CNN
F 2 "Connector_JST:JST_PH_B3B-PH-K_1x03_P2.00mm_Vertical" H 7650 1900 50  0001 C CNN
F 3 "~" H 7650 1900 50  0001 C CNN
	1    7650 1900
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:AO3401A Q1
U 1 1 5F8C709D
P 7000 1100
F 0 "Q1" V 7249 1100 50  0000 C CNN
F 1 "AO3401A" V 7340 1100 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7200 1025 50  0001 L CIN
F 3 "http://www.aosmd.com/pdfs/datasheet/AO3401A.pdf" H 7000 1100 50  0001 L CNN
	1    7000 1100
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R8
U 1 1 5F5AC53B
P 5800 1900
F 0 "R8" H 5741 1854 50  0000 R CNN
F 1 "1.5k" H 5741 1945 50  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 5800 1900 50  0001 C CNN
F 3 "~" H 5800 1900 50  0001 C CNN
	1    5800 1900
	-1   0    0    1   
$EndComp
Connection ~ 4500 750 
Wire Wire Line
	4500 750  4400 750 
$Comp
L Device:R_Small R1
U 1 1 5F5FD7DC
P 6700 950
F 0 "R1" H 6800 950 50  0000 C CNN
F 1 "10k" H 6800 850 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" H 6700 950 50  0001 C CNN
F 3 "~" H 6700 950 50  0001 C CNN
	1    6700 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 1200 7600 1200
Wire Wire Line
	7600 1000 7600 1200
Wire Wire Line
	7600 800  7600 750 
Wire Wire Line
	7250 1200 7200 1200
$Comp
L Device:D_Schottky_Small D1
U 1 1 5F5A15C4
P 7600 900
F 0 "D1" V 7550 1100 50  0000 C CNN
F 1 "B5819W" V 7650 1100 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" V 7600 900 50  0001 C CNN
F 3 "~" V 7600 900 50  0001 C CNN
	1    7600 900 
	0    1    -1   0   
$EndComp
$Comp
L Device:D_Schottky_Small D4
U 1 1 5F545D14
P 7350 1200
F 0 "D4" H 7300 1400 50  0000 C CNN
F 1 "B5819W" H 7300 1300 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" V 7350 1200 50  0001 C CNN
F 3 "~" V 7350 1200 50  0001 C CNN
	1    7350 1200
	-1   0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR0111
U 1 1 5F751DBF
P 4400 750
F 0 "#PWR0111" H 4400 600 50  0001 C CNN
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
L power:GND #PWR0112
U 1 1 5F62F76E
P 7350 2050
F 0 "#PWR0112" H 7350 1800 50  0001 C CNN
F 1 "GND" H 7355 1877 50  0000 C CNN
F 2 "" H 7350 2050 50  0001 C CNN
F 3 "" H 7350 2050 50  0001 C CNN
	1    7350 2050
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
L Device:LED_Small D2
U 1 1 5F5BA671
P 4500 1150
F 0 "D2" H 4550 1300 50  0000 L TNN
F 1 "Green" H 4550 1200 50  0000 L CNN
F 2 "LED_SMD:LED_0603_1608Metric" V 4500 1150 50  0001 C CNN
F 3 "~" V 4500 1150 50  0001 C CNN
	1    4500 1150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4650 1550 4800 1550
Wire Wire Line
	4650 1250 4650 1550
$Comp
L power:VCC #PWR0113
U 1 1 5F612BB5
P 7800 1200
F 0 "#PWR0113" H 7800 1050 50  0001 C CNN
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
L power:GND #PWR0114
U 1 1 5F5E60AF
P 5800 2050
F 0 "#PWR0114" H 5800 1800 50  0001 C CNN
F 1 "GND" H 5805 1877 50  0000 C CNN
F 2 "" H 5800 2050 50  0001 C CNN
F 3 "" H 5800 2050 50  0001 C CNN
	1    5800 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 2050 5800 2050
$Comp
L Device:R_Small R3
U 1 1 5F5CFAB2
P 4900 1550
F 0 "R3" V 4950 1650 50  0000 C TNN
F 1 "100" V 4950 1500 50  0000 C TNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 4900 1550 50  0001 C CNN
F 3 "~" H 4900 1550 50  0001 C CNN
	1    4900 1550
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_Small D3
U 1 1 5F5B9B92
P 4650 1150
F 0 "D3" H 4700 1100 50  0000 L CNN
F 1 "Red" H 4700 1000 50  0000 L BNN
F 2 "LED_SMD:LED_0603_1608Metric" V 4650 1150 50  0001 C CNN
F 3 "~" V 4650 1150 50  0001 C CNN
	1    4650 1150
	0    -1   -1   0   
$EndComp
Connection ~ 4900 1200
Wire Wire Line
	5800 2000 5800 2050
$Comp
L Device:C_Small C4
U 1 1 5F5A935C
P 6500 1350
F 0 "C4" H 6350 1400 50  0000 L CNN
F 1 "10u" H 6300 1300 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6500 1350 50  0001 C CNN
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
L tp4056:TP4056 U2
U 1 1 5F584A16
P 5400 1300
F 0 "U2" H 5375 1665 50  0000 C CNN
F 1 "TP4056" H 5375 1574 50  0000 C CNN
F 2 "Package_SO:SOP-8_3.9x4.9mm_P1.27mm" H 5400 1300 50  0001 C CNN
F 3 "" H 5400 1300 50  0001 C CNN
	1    5400 1300
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR0115
U 1 1 5F574D38
P 7350 1750
F 0 "#PWR0115" H 7350 1600 50  0001 C CNN
F 1 "+BATT" H 7350 1900 50  0000 C CNN
F 2 "" H 7350 1750 50  0001 C CNN
F 3 "" H 7350 1750 50  0001 C CNN
	1    7350 1750
	1    0    0    -1  
$EndComp
Text GLabel 5150 5250 0    50   Input ~ 0
SPI_SS2
Wire Notes Line
	4650 4150 6200 4150
Text Notes 4650 4150 0    50   ~ 0
SPI Connectors
Text GLabel 5150 4550 0    50   Input ~ 0
SPI_SS1
$Comp
L power:GND #PWR0118
U 1 1 5F8DCAB1
P 5150 4650
F 0 "#PWR0118" H 5150 4400 50  0001 C CNN
F 1 "GND" V 5150 4450 50  0000 C CNN
F 2 "" H 5150 4650 50  0001 C CNN
F 3 "" H 5150 4650 50  0001 C CNN
	1    5150 4650
	0    1    1    0   
$EndComp
Text GLabel 5650 4650 2    50   Input ~ 0
SPI_MOSI
Text GLabel 5650 4550 2    50   Input ~ 0
SPI_MISO
Text GLabel 5650 4450 2    50   Input ~ 0
SPI_SCK
Wire Notes Line
	4200 3900 4200 3150
Wire Notes Line
	4100 3150 4100 4050
Wire Notes Line
	2650 4150 2650 6000
Wire Notes Line
	800  4150 800  6000
$Comp
L Device:LED_Small D6
U 1 1 5F7FD158
P 3650 5750
F 0 "D6" H 3650 5985 50  0000 C CNN
F 1 "Red" H 3650 5894 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" V 3650 5750 50  0001 C CNN
F 3 "~" V 3650 5750 50  0001 C CNN
	1    3650 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 5750 4200 5750
Wire Wire Line
	3800 5750 3750 5750
$Comp
L Switch:SW_SPST SW2
U 1 1 5F7FD135
P 4000 5750
F 0 "SW2" H 4100 5500 50  0000 C CNN
F 1 "PWR_LED_Switch" H 3900 5600 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4000 5750 50  0001 C CNN
F 3 "~" H 4000 5750 50  0001 C CNN
	1    4000 5750
	-1   0    0    1   
$EndComp
Text Notes 2850 4850 0    50   ~ 0
Status LEDs
$Comp
L Device:LED_Small D5
U 1 1 5F7CE97D
P 3650 5200
F 0 "D5" H 3650 5435 50  0000 C CNN
F 1 "Green" H 3650 5344 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" V 3650 5200 50  0001 C CNN
F 3 "~" V 3650 5200 50  0001 C CNN
	1    3650 5200
	1    0    0    -1  
$EndComp
Text GLabel 4250 5200 2    50   Input ~ 0
LED0
$Comp
L power:GND #PWR0123
U 1 1 5F7E07DB
P 3150 5200
F 0 "#PWR0123" H 3150 4950 50  0001 C CNN
F 1 "GND" H 3155 5027 50  0000 C CNN
F 2 "" H 3150 5200 50  0001 C CNN
F 3 "" H 3150 5200 50  0001 C CNN
	1    3150 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	3800 5200 3750 5200
$Comp
L Device:R_Small R13
U 1 1 5F7D3759
P 3350 5200
F 0 "R13" V 3300 5300 50  0000 C BNN
F 1 "130" V 3300 5100 50  0000 C BNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3350 5200 50  0001 C CNN
F 3 "~" H 3350 5200 50  0001 C CNN
	1    3350 5200
	0    -1   -1   0   
$EndComp
Text Notes 2800 4150 0    50   ~ 0
BOOT mode switch
Wire Notes Line
	2800 4700 4550 4700
Wire Notes Line
	2800 4150 4550 4150
Wire Wire Line
	3450 4500 3500 4500
Wire Wire Line
	3250 4500 3200 4500
Wire Wire Line
	3900 4400 3950 4400
Wire Wire Line
	3950 4600 3900 4600
Wire Notes Line
	2800 4150 2800 4700
Wire Notes Line
	4550 4150 4550 4700
$Comp
L power:GND #PWR0125
U 1 1 5F6D4FF4
P 3950 4400
F 0 "#PWR0125" H 3950 4150 50  0001 C CNN
F 1 "GND" V 3950 4250 50  0000 R CNN
F 2 "" H 3950 4400 50  0001 C CNN
F 3 "" H 3950 4400 50  0001 C CNN
	1    3950 4400
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R10
U 1 1 5F6BDCF4
P 3350 4500
F 0 "R10" V 3400 4600 50  0000 C TNN
F 1 "10k" V 3400 4450 50  0000 C TNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3350 4500 50  0001 C CNN
F 3 "~" H 3350 4500 50  0001 C CNN
	1    3350 4500
	0    -1   -1   0   
$EndComp
Text GLabel 3200 4500 0    50   Input ~ 0
BOOT0
$Comp
L Switch:SW_DPDT_x2 SW1
U 1 1 5F6B6B83
P 3700 4500
F 0 "SW1" H 3700 4785 50  0000 C CNN
F 1 "SW_DPDT_x2" H 3700 4694 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3700 4500 50  0001 C CNN
F 3 "~" H 3700 4500 50  0001 C CNN
	1    3700 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 5650 1800 5650
Connection ~ 1700 5650
Wire Wire Line
	1550 5200 1700 5200
Wire Wire Line
	1700 5200 1700 5650
Wire Wire Line
	1550 5650 1700 5650
Wire Wire Line
	1550 5400 1550 5650
Text Notes 800  4150 0    50   ~ 0
Oscillator crystals
Wire Wire Line
	1800 5300 1800 5400
Wire Wire Line
	1300 5300 1300 5400
Connection ~ 1550 5650
Wire Wire Line
	1300 5650 1550 5650
Wire Wire Line
	1300 5300 1450 5300
Connection ~ 1300 5300
Wire Wire Line
	1250 5300 1300 5300
Connection ~ 1800 5300
Wire Wire Line
	1650 5300 1800 5300
Wire Wire Line
	1300 5650 1300 5600
Wire Wire Line
	1800 5650 1800 5600
$Comp
L Device:C_Small C15
U 1 1 5F62995F
P 1800 5500
F 0 "C15" H 1892 5546 50  0000 L CNN
F 1 "12p" H 1892 5455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1800 5500 50  0001 C CNN
F 3 "~" H 1800 5500 50  0001 C CNN
	1    1800 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C14
U 1 1 5F629959
P 1300 5500
F 0 "C14" H 1392 5546 50  0000 L CNN
F 1 "12p" H 1392 5455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1300 5500 50  0001 C CNN
F 3 "~" H 1300 5500 50  0001 C CNN
	1    1300 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 5F629953
P 1550 5650
F 0 "#PWR0126" H 1550 5400 50  0001 C CNN
F 1 "GND" H 1555 5477 50  0000 C CNN
F 2 "" H 1550 5650 50  0001 C CNN
F 3 "" H 1550 5650 50  0001 C CNN
	1    1550 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 4700 1850 4700
Connection ~ 1600 4700
Wire Wire Line
	1350 4700 1600 4700
$Comp
L Device:Crystal_GND24_Small XOSC1
U 1 1 5F60E10F
P 1550 5300
F 0 "XOSC1" H 1350 5500 50  0000 C CNN
F 1 "16MHz" H 1750 5500 50  0000 C CNN
F 2 "Crystal:Crystal_SMD_3225-4Pin_3.2x2.5mm" H 1550 5300 50  0001 C CNN
F 3 "~" H 1550 5300 50  0001 C CNN
	1    1550 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 4400 1500 4400
Connection ~ 1350 4400
Wire Wire Line
	1300 4400 1350 4400
Connection ~ 1850 4400
Wire Wire Line
	1700 4400 1850 4400
Wire Wire Line
	1900 4400 1850 4400
Wire Wire Line
	1850 4400 1850 4450
Wire Wire Line
	1350 4400 1350 4450
Wire Wire Line
	1350 4700 1350 4650
Wire Wire Line
	1850 4700 1850 4650
$Comp
L Device:C_Small C13
U 1 1 5F5DD7D4
P 1850 4550
F 0 "C13" H 1942 4596 50  0000 L CNN
F 1 "20p" H 1942 4505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1850 4550 50  0001 C CNN
F 3 "~" H 1850 4550 50  0001 C CNN
	1    1850 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C12
U 1 1 5F5DC066
P 1350 4550
F 0 "C12" H 1442 4596 50  0000 L CNN
F 1 "20p" H 1442 4505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1350 4550 50  0001 C CNN
F 3 "~" H 1350 4550 50  0001 C CNN
	1    1350 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0127
U 1 1 5F5DB86D
P 1600 4700
F 0 "#PWR0127" H 1600 4450 50  0001 C CNN
F 1 "GND" H 1605 4527 50  0000 C CNN
F 2 "" H 1600 4700 50  0001 C CNN
F 3 "" H 1600 4700 50  0001 C CNN
	1    1600 4700
	1    0    0    -1  
$EndComp
Text GLabel 1900 4400 2    50   Input ~ 0
XOSC32_OUT
Text GLabel 1300 4400 0    50   Input ~ 0
XOSC32_IN
$Comp
L Device:Crystal_Small XOSC32
U 1 1 5F5C0C6B
P 1600 4400
F 0 "XOSC32" H 1300 4550 50  0000 C CNN
F 1 "32.768KHz" H 1950 4550 50  0000 C CNN
F 2 "Crystal:Crystal_SMD_3215-2Pin_3.2x1.5mm" H 1600 4400 50  0001 C CNN
F 3 "~" H 1600 4400 50  0001 C CNN
	1    1600 4400
	1    0    0    -1  
$EndComp
Text GLabel 1250 5300 0    50   Input ~ 0
XOSC_IN
Text GLabel 2150 5300 2    50   Input ~ 0
XOSC_OUT
Text Notes 800  3150 0    50   ~ 0
STM VDD(A) Filters
Wire Notes Line
	800  4050 800  3150
Connection ~ 950  3800
$Comp
L power:GND #PWR0128
U 1 1 5F5D6CDD
P 950 3800
F 0 "#PWR0128" H 950 3550 50  0001 C CNN
F 1 "GND" H 955 3627 50  0000 C CNN
F 2 "" H 950 3800 50  0001 C CNN
F 3 "" H 950 3800 50  0001 C CNN
	1    950  3800
	1    0    0    -1  
$EndComp
Connection ~ 950  3400
$Comp
L power:+3.3V #PWR0129
U 1 1 5F5D630C
P 950 3400
F 0 "#PWR0129" H 950 3250 50  0001 C CNN
F 1 "+3.3V" H 965 3573 50  0000 C CNN
F 2 "" H 950 3400 50  0001 C CNN
F 3 "" H 950 3400 50  0001 C CNN
	1    950  3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 3800 1600 3800
Connection ~ 1900 3800
Wire Wire Line
	1900 3700 1900 3800
Wire Wire Line
	1600 3800 1250 3800
Connection ~ 1600 3800
Wire Wire Line
	1600 3700 1600 3800
Wire Wire Line
	1250 3800 950  3800
Connection ~ 1250 3800
Wire Wire Line
	1250 3700 1250 3800
Wire Wire Line
	950  3800 950  3700
Wire Wire Line
	2200 3800 1900 3800
Wire Wire Line
	2200 3700 2200 3800
Wire Wire Line
	1900 3400 2200 3400
Connection ~ 1900 3400
Wire Wire Line
	1900 3400 1900 3500
Wire Wire Line
	1600 3400 1900 3400
Connection ~ 1600 3400
Wire Wire Line
	1600 3500 1600 3400
Wire Wire Line
	1250 3400 1600 3400
Connection ~ 1250 3400
Wire Wire Line
	1250 3500 1250 3400
Wire Wire Line
	2200 3400 2200 3500
Wire Wire Line
	950  3400 1250 3400
Wire Wire Line
	950  3500 950  3400
$Comp
L Device:C_Small C9
U 1 1 5F5B8606
P 2200 3600
F 0 "C9" H 2292 3646 50  0000 L CNN
F 1 "100n" H 2292 3555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2200 3600 50  0001 C CNN
F 3 "~" H 2200 3600 50  0001 C CNN
	1    2200 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C8
U 1 1 5F5B83C4
P 1900 3600
F 0 "C8" H 1992 3646 50  0000 L CNN
F 1 "100n" H 1992 3555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1900 3600 50  0001 C CNN
F 3 "~" H 1900 3600 50  0001 C CNN
	1    1900 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C7
U 1 1 5F5B80FD
P 1600 3600
F 0 "C7" H 1692 3646 50  0000 L CNN
F 1 "100n" H 1692 3555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1600 3600 50  0001 C CNN
F 3 "~" H 1600 3600 50  0001 C CNN
	1    1600 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 5F5B7EA2
P 1250 3600
F 0 "C6" H 1342 3646 50  0000 L CNN
F 1 "100n" H 1342 3555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1250 3600 50  0001 C CNN
F 3 "~" H 1250 3600 50  0001 C CNN
	1    1250 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 5F5B7309
P 950 3600
F 0 "C5" H 1042 3646 50  0000 L CNN
F 1 "10u" H 1042 3555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 950 3600 50  0001 C CNN
F 3 "~" H 950 3600 50  0001 C CNN
	1    950  3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0131
U 1 1 5F5A770A
P 3250 3800
F 0 "#PWR0131" H 3250 3550 50  0001 C CNN
F 1 "GND" H 3255 3627 50  0000 C CNN
F 2 "" H 3250 3800 50  0001 C CNN
F 3 "" H 3250 3800 50  0001 C CNN
	1    3250 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 3550 2950 3550
Connection ~ 3250 3550
Wire Wire Line
	3150 3550 3250 3550
Wire Wire Line
	3600 3550 3600 3600
Connection ~ 3600 3550
Wire Wire Line
	3250 3550 3600 3550
Wire Wire Line
	3600 3400 3600 3550
Wire Wire Line
	3250 3600 3250 3550
$Comp
L power:+3.3VA #PWR0132
U 1 1 5F57F069
P 3600 3400
F 0 "#PWR0132" H 3600 3250 50  0001 C CNN
F 1 "+3.3VA" H 3615 3573 50  0000 C CNN
F 2 "" H 3600 3400 50  0001 C CNN
F 3 "" H 3600 3400 50  0001 C CNN
	1    3600 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 3400 2750 3550
$Comp
L Device:C_Small C10
U 1 1 5F574D09
P 3250 3700
F 0 "C10" H 3342 3746 50  0000 L CNN
F 1 "100n" H 3342 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3250 3700 50  0001 C CNN
F 3 "~" H 3250 3700 50  0001 C CNN
	1    3250 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C11
U 1 1 5F574363
P 3600 3700
F 0 "C11" H 3692 3746 50  0000 L CNN
F 1 "1u" H 3692 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3600 3700 50  0001 C CNN
F 3 "~" H 3600 3700 50  0001 C CNN
	1    3600 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:Ferrite_Bead_Small FB2
U 1 1 5F573678
P 3050 3550
F 0 "FB2" V 3250 3450 50  0000 L CNN
F 1 "100 @ 100MHz" V 3150 3150 50  0000 L CNN
F 2 "Inductor_SMD:L_0805_2012Metric" V 2980 3550 50  0001 C CNN
F 3 "~" H 3050 3550 50  0001 C CNN
	1    3050 3550
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR0133
U 1 1 5F55A20D
P 2750 3400
F 0 "#PWR0133" H 2750 3250 50  0001 C CNN
F 1 "+3.3V" H 2765 3573 50  0000 C CNN
F 2 "" H 2750 3400 50  0001 C CNN
F 3 "" H 2750 3400 50  0001 C CNN
	1    2750 3400
	1    0    0    -1  
$EndComp
Text GLabel 9700 4750 2    50   Input ~ 0
SPI_MOSI
Text GLabel 9700 4650 2    50   Input ~ 0
SPI_MISO
Text GLabel 9700 4550 2    50   Input ~ 0
SPI_SCK
Connection ~ 8300 2950
Wire Wire Line
	8400 2950 8300 2950
Wire Wire Line
	8300 2850 8300 2950
$Comp
L Device:R_Small R9
U 1 1 5F85EFF1
P 8300 2750
F 0 "R9" H 8200 2800 50  0000 C CNN
F 1 "10k" H 8200 2700 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 8300 2750 50  0001 C CNN
F 3 "~" H 8300 2750 50  0001 C CNN
	1    8300 2750
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0134
U 1 1 5F85E1A1
P 8300 2650
F 0 "#PWR0134" H 8300 2500 50  0001 C CNN
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
Connection ~ 8900 2700
Wire Wire Line
	8900 2650 8900 2700
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
L power:GND #PWR0136
U 1 1 5F563978
P 9200 5850
F 0 "#PWR0136" H 9200 5600 50  0001 C CNN
F 1 "GND" H 9205 5677 50  0000 C CNN
F 2 "" H 9200 5850 50  0001 C CNN
F 3 "" H 9200 5850 50  0001 C CNN
	1    9200 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0137
U 1 1 5F56300D
P 8900 5850
F 0 "#PWR0137" H 8900 5600 50  0001 C CNN
F 1 "GND" H 8905 5677 50  0000 C CNN
F 2 "" H 8900 5850 50  0001 C CNN
F 3 "" H 8900 5850 50  0001 C CNN
	1    8900 5850
	1    0    0    -1  
$EndComp
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
L power:+3.3V #PWR0138
U 1 1 5F684A11
P 8900 2650
F 0 "#PWR0138" H 8900 2500 50  0001 C CNN
F 1 "+3.3V" H 8915 2823 50  0000 C CNN
F 2 "" H 8900 2650 50  0001 C CNN
F 3 "" H 8900 2650 50  0001 C CNN
	1    8900 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0139
U 1 1 5F622B70
P 5150 4450
F 0 "#PWR0139" H 5150 4300 50  0001 C CNN
F 1 "+3.3V" V 5150 4550 50  0000 L CNN
F 2 "" H 5150 4450 50  0001 C CNN
F 3 "" H 5150 4450 50  0001 C CNN
	1    5150 4450
	0    -1   -1   0   
$EndComp
Text GLabel 8400 4050 0    50   Input ~ 0
SPI_SS1
Text GLabel 8400 4150 0    50   Input ~ 0
SPI_SS2
$Comp
L power:+3.3V #PWR0142
U 1 1 5F6906EB
P 5700 5800
F 0 "#PWR0142" H 5700 5650 50  0001 C CNN
F 1 "+3.3V" H 5750 5850 50  0000 L CNN
F 2 "" H 5700 5800 50  0001 C CNN
F 3 "" H 5700 5800 50  0001 C CNN
	1    5700 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 5850 5700 5800
Wire Wire Line
	5500 5850 5700 5850
Wire Wire Line
	5300 5850 5250 5850
$Comp
L Device:R_Small R12
U 1 1 5F6C0A40
P 5400 6000
F 0 "R12" V 5300 6100 50  0000 C TNN
F 1 "10k" V 5300 5950 50  0000 C TNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 5400 6000 50  0001 C CNN
F 3 "~" H 5400 6000 50  0001 C CNN
	1    5400 6000
	0    1    1    0   
$EndComp
Wire Wire Line
	5250 6000 5300 6000
Wire Wire Line
	5250 6150 5300 6150
Wire Wire Line
	5500 6000 5700 6000
Wire Wire Line
	5700 6000 5700 5850
Connection ~ 5700 5850
Wire Wire Line
	5500 6150 5700 6150
Wire Wire Line
	5700 6150 5700 6000
Connection ~ 5700 6000
$Comp
L Device:R_Small R11
U 1 1 5F6E2A7F
P 5400 5850
F 0 "R11" V 5300 5950 50  0000 C TNN
F 1 "10k" V 5300 5800 50  0000 C TNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 5400 5850 50  0001 C CNN
F 3 "~" H 5400 5850 50  0001 C CNN
	1    5400 5850
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R14
U 1 1 5F6E2C8A
P 5400 6150
F 0 "R14" V 5300 6250 50  0000 C TNN
F 1 "10k" V 5300 6100 50  0000 C TNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 5400 6150 50  0001 C CNN
F 3 "~" H 5400 6150 50  0001 C CNN
	1    5400 6150
	0    1    1    0   
$EndComp
Wire Notes Line
	4650 6300 6200 6300
Text Notes 4700 5750 0    50   ~ 0
SS Pull up
Wire Notes Line
	6200 5650 4650 5650
Text GLabel 5250 5850 0    50   Input ~ 0
SPI_SS1
Text GLabel 5250 6000 0    50   Input ~ 0
SPI_SS2
Text GLabel 5250 6150 0    50   Input ~ 0
SPI_SS3
Text Notes 7350 7500 0    50   ~ 0
Multiflexmeter Micro Design
Text Notes 8100 7650 0    50   ~ 0
2020/09/14
Text Notes 9700 7750 0    50   ~ 0
Tim van Osch
NoConn ~ 9700 4050
NoConn ~ 9700 4150
NoConn ~ 9700 4250
NoConn ~ 9700 4350
NoConn ~ 9700 4450
NoConn ~ 9700 4850
NoConn ~ 9700 5550
NoConn ~ 8400 5550
NoConn ~ 8400 5450
NoConn ~ 8400 5250
NoConn ~ 8400 5150
NoConn ~ 8400 5050
NoConn ~ 8400 4950
NoConn ~ 8400 4850
NoConn ~ 8400 4750
NoConn ~ 8400 4650
NoConn ~ 8400 4550
NoConn ~ 8400 4450
NoConn ~ 8400 3650
Text GLabel 3350 6500 0    50   Input ~ 0
UART1_RX
Text GLabel 3350 6600 0    50   Input ~ 0
UART1_TX
Text Notes 2850 6100 0    50   ~ 0
UART_Connector
$Comp
L power:+3.3V #PWR0121
U 1 1 5F8324EA
P 4250 5750
F 0 "#PWR0121" H 4250 5600 50  0001 C CNN
F 1 "+3.3V" V 4150 5700 50  0000 L TNN
F 2 "" H 4250 5750 50  0001 C CNN
F 3 "" H 4250 5750 50  0001 C CNN
	1    4250 5750
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0124
U 1 1 5F832F6A
P 3950 4600
F 0 "#PWR0124" H 3950 4450 50  0001 C CNN
F 1 "+3.3V" V 3850 4550 50  0000 L TNN
F 2 "" H 3950 4600 50  0001 C CNN
F 3 "" H 3950 4600 50  0001 C CNN
	1    3950 4600
	0    1    1    0   
$EndComp
Wire Wire Line
	9650 950  9600 950 
Connection ~ 9500 950 
Connection ~ 7600 1200
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5F845734
P 7600 1200
F 0 "#FLG0101" H 7600 1275 50  0001 C CNN
F 1 "PWR_FLAG" H 7600 1373 50  0000 C CNN
F 2 "" H 7600 1200 50  0001 C CNN
F 3 "~" H 7600 1200 50  0001 C CNN
	1    7600 1200
	-1   0    0    1   
$EndComp
Wire Wire Line
	7600 1200 7800 1200
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5F84683A
P 3600 3550
F 0 "#FLG0102" H 3600 3625 50  0001 C CNN
F 1 "PWR_FLAG" V 3500 3600 50  0000 L CNN
F 2 "" H 3600 3550 50  0001 C CNN
F 3 "~" H 3600 3550 50  0001 C CNN
	1    3600 3550
	0    1    1    0   
$EndComp
Wire Notes Line
	800  3150 4100 3150
Wire Notes Line
	800  4050 4100 4050
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 5F8A2101
P 9600 950
F 0 "#FLG0103" H 9600 1025 50  0001 C CNN
F 1 "PWR_FLAG" H 9650 1100 50  0000 C CNN
F 2 "" H 9600 950 50  0001 C CNN
F 3 "~" H 9600 950 50  0001 C CNN
	1    9600 950 
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse_Small F1
U 1 1 5F8D6EBB
P 9000 950
F 0 "F1" H 8900 1150 50  0000 C CNN
F 1 "Fuse_Small" H 9050 1050 50  0000 C CNN
F 2 "Fuse:Fuse_0805_2012Metric" H 9000 950 50  0001 C CNN
F 3 "~" H 9000 950 50  0001 C CNN
	1    9000 950 
	1    0    0    -1  
$EndComp
Connection ~ 9600 950 
Wire Wire Line
	9600 950  9500 950 
Wire Wire Line
	9100 950  9150 950 
Wire Wire Line
	8900 950  8800 950 
Wire Wire Line
	6050 1500 6050 1550
Wire Wire Line
	5750 1200 6250 1200
Wire Wire Line
	4900 750  6050 750 
Wire Wire Line
	6050 750  6050 1300
Connection ~ 6050 750 
Wire Wire Line
	6050 750  6700 750 
Wire Wire Line
	6250 1150 6250 1200
Connection ~ 6250 1200
Wire Wire Line
	6250 1200 6500 1200
$Comp
L MCU_ST_STM32L0:STM32L072CBTx U4
U 1 1 5F9A9C0F
P 9100 4250
F 0 "U4" H 9600 5850 50  0000 C CNN
F 1 "STM32L072CBTx" H 9700 5750 50  0000 C CNN
F 2 "Package_QFP:LQFP-48_7x7mm_P0.5mm" H 8500 2850 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00141133.pdf" H 9100 4250 50  0001 C CNN
	1    9100 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 2750 9200 2650
$Comp
L power:+3.3VA #PWR0135
U 1 1 5F57F409
P 9200 2650
F 0 "#PWR0135" H 9200 2500 50  0001 C CNN
F 1 "+3.3VA" H 9215 2823 50  0000 C CNN
F 2 "" H 9200 2650 50  0001 C CNN
F 3 "" H 9200 2650 50  0001 C CNN
	1    9200 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 2750 9300 2700
Connection ~ 9100 2700
Wire Wire Line
	9300 2700 9100 2700
Wire Notes Line
	800  4150 2650 4150
Wire Notes Line
	800  6000 2650 6000
$Comp
L Device:R_Small R16
U 1 1 5FA31ED3
P 2000 5300
F 0 "R16" V 2200 5300 50  0000 C BNN
F 1 "680" V 2100 5300 50  0000 C BNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 2000 5300 50  0001 C CNN
F 3 "~" H 2000 5300 50  0001 C CNN
	1    2000 5300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2100 5300 2150 5300
Wire Wire Line
	1800 5300 1900 5300
Text GLabel 8400 4350 0    50   Input ~ 0
P_EXTI
Text GLabel 5150 4750 0    50   Input ~ 0
P_EXTI
NoConn ~ 5650 4750
$Comp
L power:GND #PWR0116
U 1 1 5FAB24CE
P 5150 5350
F 0 "#PWR0116" H 5150 5100 50  0001 C CNN
F 1 "GND" V 5150 5150 50  0000 C CNN
F 2 "" H 5150 5350 50  0001 C CNN
F 3 "" H 5150 5350 50  0001 C CNN
	1    5150 5350
	0    1    1    0   
$EndComp
Text GLabel 5650 5350 2    50   Input ~ 0
SPI_MOSI
Text GLabel 5650 5250 2    50   Input ~ 0
SPI_MISO
Text GLabel 5650 5150 2    50   Input ~ 0
SPI_SCK
$Comp
L power:+3.3V #PWR0117
U 1 1 5FAB24DB
P 5150 5150
F 0 "#PWR0117" H 5150 5000 50  0001 C CNN
F 1 "+3.3V" V 5150 5250 50  0000 L CNN
F 2 "" H 5150 5150 50  0001 C CNN
F 3 "" H 5150 5150 50  0001 C CNN
	1    5150 5150
	0    -1   -1   0   
$EndComp
Text GLabel 5150 5450 0    50   Input ~ 0
P_EXTI
NoConn ~ 5650 5450
$Comp
L Switch:SW_SPST SW3
U 1 1 5FAE9502
P 4000 5200
F 0 "SW3" H 4100 4950 50  0000 C CNN
F 1 "STAT_LED_Switch" H 3900 5050 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4000 5200 50  0001 C CNN
F 3 "~" H 4000 5200 50  0001 C CNN
	1    4000 5200
	-1   0    0    1   
$EndComp
Wire Wire Line
	4200 5200 4250 5200
$Comp
L Device:R_Small R18
U 1 1 5FAF4A2A
P 3350 5100
F 0 "R18" V 3300 5200 50  0000 C BNN
F 1 "130" V 3300 5000 50  0000 C BNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3350 5100 50  0001 C CNN
F 3 "~" H 3350 5100 50  0001 C CNN
	1    3350 5100
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R17
U 1 1 5FAF4D75
P 3350 5000
F 0 "R17" V 3300 5100 50  0000 C BNN
F 1 "130" V 3300 4900 50  0000 C BNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3350 5000 50  0001 C CNN
F 3 "~" H 3350 5000 50  0001 C CNN
	1    3350 5000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R19
U 1 1 5FAF50CD
P 3350 5300
F 0 "R19" V 3300 5400 50  0000 C BNN
F 1 "130" V 3300 5200 50  0000 C BNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3350 5300 50  0001 C CNN
F 3 "~" H 3350 5300 50  0001 C CNN
	1    3350 5300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3450 5000 3450 5100
Wire Wire Line
	3450 5100 3450 5200
Connection ~ 3450 5100
Wire Wire Line
	3450 5200 3450 5300
Connection ~ 3450 5200
Wire Wire Line
	3450 5200 3550 5200
Wire Wire Line
	3250 5000 3250 5100
Wire Wire Line
	3250 5100 3250 5200
Connection ~ 3250 5100
Wire Wire Line
	3250 5200 3250 5300
Connection ~ 3250 5200
Wire Wire Line
	3250 5200 3150 5200
$Comp
L power:GND #PWR0122
U 1 1 5FB51D35
P 3150 5750
F 0 "#PWR0122" H 3150 5500 50  0001 C CNN
F 1 "GND" H 3155 5577 50  0000 C CNN
F 2 "" H 3150 5750 50  0001 C CNN
F 3 "" H 3150 5750 50  0001 C CNN
	1    3150 5750
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R21
U 1 1 5FB51D3F
P 3350 5750
F 0 "R21" V 3300 5850 50  0000 C BNN
F 1 "130" V 3300 5650 50  0000 C BNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3350 5750 50  0001 C CNN
F 3 "~" H 3350 5750 50  0001 C CNN
	1    3350 5750
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R20
U 1 1 5FB51D49
P 3350 5650
F 0 "R20" V 3300 5750 50  0000 C BNN
F 1 "130" V 3300 5550 50  0000 C BNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3350 5650 50  0001 C CNN
F 3 "~" H 3350 5650 50  0001 C CNN
	1    3350 5650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R15
U 1 1 5FB51D53
P 3350 5550
F 0 "R15" V 3300 5650 50  0000 C BNN
F 1 "130" V 3300 5450 50  0000 C BNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3350 5550 50  0001 C CNN
F 3 "~" H 3350 5550 50  0001 C CNN
	1    3350 5550
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R22
U 1 1 5FB51D5D
P 3350 5850
F 0 "R22" V 3300 5950 50  0000 C BNN
F 1 "130" V 3300 5750 50  0000 C BNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3350 5850 50  0001 C CNN
F 3 "~" H 3350 5850 50  0001 C CNN
	1    3350 5850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3450 5550 3450 5650
Wire Wire Line
	3450 5650 3450 5750
Connection ~ 3450 5650
Wire Wire Line
	3450 5750 3450 5850
Connection ~ 3450 5750
Wire Wire Line
	3250 5550 3250 5650
Wire Wire Line
	3250 5650 3250 5750
Connection ~ 3250 5650
Wire Wire Line
	3250 5750 3250 5850
Connection ~ 3250 5750
Wire Wire Line
	3250 5750 3150 5750
Wire Wire Line
	3450 5750 3550 5750
Wire Notes Line
	4500 4850 4500 6000
Wire Notes Line
	2850 6000 4500 6000
Wire Notes Line
	2850 4850 4500 4850
Wire Notes Line
	2850 4850 2850 6000
$Comp
L Connector_Generic:Conn_01x06 J8
U 1 1 5FBEBA6B
P 3550 6600
F 0 "J8" H 3450 7000 50  0000 L CNN
F 1 "UART_Connector" H 3450 6900 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 3550 6600 50  0001 C CNN
F 3 "~" H 3550 6600 50  0001 C CNN
	1    3550 6600
	1    0    0    -1  
$EndComp
$Comp
L Graphic:Logo_Open_Hardware_Small #LOGO1
U 1 1 5FBEF498
P 2200 7500
F 0 "#LOGO1" H 2200 7775 50  0001 C CNN
F 1 "Logo_Open_Hardware_Small" H 2200 7275 50  0001 C CNN
F 2 "" H 2200 7500 50  0001 C CNN
F 3 "~" H 2200 7500 50  0001 C CNN
	1    2200 7500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0144
U 1 1 5FBFC526
P 3350 6900
F 0 "#PWR0144" H 3350 6650 50  0001 C CNN
F 1 "GND" V 3355 6772 50  0000 R CNN
F 2 "" H 3350 6900 50  0001 C CNN
F 3 "" H 3350 6900 50  0001 C CNN
	1    3350 6900
	0    1    1    0   
$EndComp
NoConn ~ 3350 6700
NoConn ~ 3350 6800
$Comp
L Device:C_Small C17
U 1 1 5FC1DDB4
P 3250 6400
F 0 "C17" V 3021 6400 50  0000 C CNN
F 1 "100n" V 3112 6400 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3250 6400 50  0001 C CNN
F 3 "~" H 3250 6400 50  0001 C CNN
	1    3250 6400
	0    1    1    0   
$EndComp
Text GLabel 3150 6400 0    50   Input ~ 0
NRST
Wire Notes Line
	4100 6100 4100 7150
Wire Notes Line
	2850 6100 2850 7150
Text GLabel 8050 2850 1    50   Input ~ 0
NRST
$Comp
L Switch:SW_SPST SW4
U 1 1 5FC4CF1C
P 7850 2950
F 0 "SW4" H 7700 3150 50  0000 C CNN
F 1 "SW_RST" H 7750 3050 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 7850 2950 50  0001 C CNN
F 3 "~" H 7850 2950 50  0001 C CNN
	1    7850 2950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5FC6D6F3
P 7600 3000
F 0 "#PWR01" H 7600 2750 50  0001 C CNN
F 1 "GND" H 7605 2827 50  0000 C CNN
F 2 "" H 7600 3000 50  0001 C CNN
F 3 "" H 7600 3000 50  0001 C CNN
	1    7600 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 2850 8050 2950
Wire Wire Line
	8050 2950 8300 2950
Connection ~ 8050 2950
Wire Wire Line
	7650 2950 7600 2950
Wire Wire Line
	7600 2950 7600 3000
Wire Notes Line
	6200 3150 6200 3800
Wire Notes Line
	4100 7150 2850 7150
Wire Notes Line
	2850 6100 4100 6100
Text Notes 5050 3150 0    50   ~ 0
Mounting holes
Wire Notes Line
	5050 3800 5050 3150
Wire Notes Line
	6200 3800 5050 3800
Wire Notes Line
	5050 3150 6200 3150
Connection ~ 5150 3500
Wire Wire Line
	5150 3300 5200 3300
Wire Wire Line
	5150 3500 5150 3300
Wire Wire Line
	5150 3500 5200 3500
Wire Wire Line
	5150 3550 5150 3500
$Comp
L power:GND #PWR0143
U 1 1 5F986EE5
P 5150 3550
F 0 "#PWR0143" H 5150 3300 50  0001 C CNN
F 1 "GND" H 5155 3377 50  0000 C CNN
F 2 "" H 5150 3550 50  0001 C CNN
F 3 "" H 5150 3550 50  0001 C CNN
	1    5150 3550
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 5F985CC1
P 5300 3500
F 0 "H2" V 5254 3650 50  0000 L CNN
F 1 "MountingHole_Pad" V 5345 3650 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 5300 3500 50  0001 C CNN
F 3 "~" H 5300 3500 50  0001 C CNN
	1    5300 3500
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 5F9853C4
P 5300 3300
F 0 "H1" V 5254 3450 50  0000 L CNN
F 1 "MountingHole_Pad" V 5345 3450 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 5300 3300 50  0001 C CNN
F 3 "~" H 5300 3300 50  0001 C CNN
	1    5300 3300
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x05 J4
U 1 1 5F80F4FB
P 4750 3600
F 0 "J4" H 4700 4000 50  0000 L CNN
F 1 "SWD_connector" H 4350 3950 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 4750 3600 50  0001 C CNN
F 3 "~" H 4750 3600 50  0001 C CNN
	1    4750 3600
	1    0    0    -1  
$EndComp
Text GLabel 4550 3700 0    50   Input ~ 0
SWDIO
Text GLabel 4550 3500 0    50   Input ~ 0
SWCLK
$Comp
L power:+3.3V #PWR0120
U 1 1 5F810F04
P 4550 3400
F 0 "#PWR0120" H 4550 3250 50  0001 C CNN
F 1 "+3.3V" V 4550 3500 50  0000 L CNN
F 2 "" H 4550 3400 50  0001 C CNN
F 3 "" H 4550 3400 50  0001 C CNN
	1    4550 3400
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 5F811893
P 4550 3600
F 0 "#PWR0119" H 4550 3350 50  0001 C CNN
F 1 "GND" V 4550 3500 50  0000 R CNN
F 2 "" H 4550 3600 50  0001 C CNN
F 3 "" H 4550 3600 50  0001 C CNN
	1    4550 3600
	0    1    1    0   
$EndComp
Text GLabel 4550 3800 0    50   Input ~ 0
NRST
Text Notes 4200 3150 0    50   ~ 0
SWD Connector
Wire Notes Line
	4200 3150 4950 3150
Wire Notes Line
	4950 3150 4950 3900
Wire Notes Line
	4950 3900 4200 3900
Wire Wire Line
	7450 2000 7350 2000
Wire Wire Line
	7350 2000 7350 2050
$Comp
L power:GND #PWR0110
U 1 1 5FE17392
P 3600 3800
F 0 "#PWR0110" H 3600 3550 50  0001 C CNN
F 1 "GND" H 3605 3627 50  0000 C CNN
F 2 "" H 3600 3800 50  0001 C CNN
F 3 "" H 3600 3800 50  0001 C CNN
	1    3600 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R5
U 1 1 5F5D00A0
P 4900 1650
F 0 "R5" V 4850 1750 50  0000 C BNN
F 1 "100" V 4850 1600 50  0000 C BNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 4900 1650 50  0001 C CNN
F 3 "~" H 4900 1650 50  0001 C CNN
	1    4900 1650
	0    -1   -1   0   
$EndComp
Wire Notes Line
	6200 4150 6200 6300
Wire Notes Line
	4650 6300 4650 4150
$Comp
L Connector_Generic:Conn_02x04_Odd_Even P1
U 1 1 5FA6DBA0
P 5350 4550
F 0 "P1" H 5400 4867 50  0000 C CNN
F 1 "Peripheral1_connector" H 5400 4776 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Vertical" H 5350 4550 50  0001 C CNN
F 3 "~" H 5350 4550 50  0001 C CNN
	1    5350 4550
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x04_Odd_Even P2
U 1 1 5FAB24E5
P 5350 5250
F 0 "P2" H 5400 5567 50  0000 C CNN
F 1 "Peripheral2_connector" H 5400 5476 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Vertical" H 5350 5250 50  0001 C CNN
F 3 "~" H 5350 5250 50  0001 C CNN
	1    5350 5250
	1    0    0    -1  
$EndComp
$EndSCHEMATC
