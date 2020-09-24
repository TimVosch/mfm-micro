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
P 8900 1000
F 0 "FB1" V 8650 950 50  0000 L CNN
F 1 "100/100MHz" V 8750 1100 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric" V 8830 1000 50  0001 C CNN
F 3 "~" H 8900 1000 50  0001 C CNN
	1    8900 1000
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5F54E76E
P 9150 1150
F 0 "C2" H 9242 1196 50  0000 L CNN
F 1 "1u" H 9242 1105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 9150 1150 50  0001 C CNN
F 3 "~" H 9150 1150 50  0001 C CNN
	1    9150 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5F55022E
P 10000 1150
F 0 "C3" H 10092 1196 50  0000 L CNN
F 1 "1u" H 10092 1105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 10000 1150 50  0001 C CNN
F 3 "~" H 10000 1150 50  0001 C CNN
	1    10000 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 1300 9600 1350
Wire Wire Line
	9150 1350 9600 1350
Connection ~ 9600 1350
Wire Wire Line
	9600 1350 9600 1550
Wire Wire Line
	10000 1350 9600 1350
$Comp
L power:GND #PWR09
U 1 1 5F554444
P 9600 1550
F 0 "#PWR09" H 9600 1300 50  0001 C CNN
F 1 "GND" H 9605 1377 50  0000 C CNN
F 2 "" H 9600 1550 50  0001 C CNN
F 3 "" H 9600 1550 50  0001 C CNN
	1    9600 1550
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR05
U 1 1 5F554E1C
P 10250 1000
F 0 "#PWR05" H 10250 850 50  0001 C CNN
F 1 "+3.3V" V 10265 1128 50  0000 L CNN
F 2 "" H 10250 1000 50  0001 C CNN
F 3 "" H 10250 1000 50  0001 C CNN
	1    10250 1000
	0    1    1    0   
$EndComp
Wire Wire Line
	9900 1000 10000 1000
Wire Wire Line
	9150 1350 9150 1250
Wire Wire Line
	9000 1000 9150 1000
Wire Wire Line
	9150 1000 9150 1050
Wire Wire Line
	10000 1050 10000 1000
Connection ~ 10000 1000
Wire Wire Line
	10000 1000 10250 1000
Wire Wire Line
	10000 1250 10000 1350
Text Notes 8250 650  0    50   ~ 0
VCC Voltage Regulator
Wire Notes Line
	10700 650  10700 1850
Wire Notes Line
	8250 1850 8250 650 
$Comp
L Regulator_Linear:XC6206PxxxMR U1
U 1 1 5F556901
P 9600 1000
F 0 "U1" H 9750 1250 50  0000 C CNN
F 1 "XC6206P332MR" H 10000 1150 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9600 1225 50  0001 C CIN
F 3 "https://www.torexsemi.com/file/xc6206/XC6206.pdf" H 9600 1000 50  0001 C CNN
	1    9600 1000
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR04
U 1 1 5F610957
P 8450 1000
F 0 "#PWR04" H 8450 850 50  0001 C CNN
F 1 "VCC" V 8550 1000 50  0000 L CNN
F 2 "" H 8450 1000 50  0001 C CNN
F 3 "" H 8450 1000 50  0001 C CNN
	1    8450 1000
	0    -1   -1   0   
$EndComp
Wire Notes Line
	10700 650  8250 650 
Wire Notes Line
	8250 1850 10700 1850
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
Wire Notes Line
	600  650  3850 650 
Wire Notes Line
	600  2100 600  650 
Wire Notes Line
	600  2100 3850 2100
$Comp
L power:GND #PWR06
U 1 1 5F5F0B32
P 1900 1100
F 0 "#PWR06" H 1900 850 50  0001 C CNN
F 1 "GND" H 1905 927 50  0000 C CNN
F 2 "" H 1900 1100 50  0001 C CNN
F 3 "" H 1900 1100 50  0001 C CNN
	1    1900 1100
	1    0    0    -1  
$EndComp
Wire Notes Line
	3850 650  3850 2100
$Comp
L power:VBUS #PWR03
U 1 1 5F5AFF69
P 2800 1000
F 0 "#PWR03" H 2800 850 50  0001 C CNN
F 1 "VBUS" H 2800 1150 50  0000 C CNN
F 2 "" H 2800 1000 50  0001 C CNN
F 3 "" H 2800 1000 50  0001 C CNN
	1    2800 1000
	1    0    0    -1  
$EndComp
Text GLabel 1200 1300 2    50   Input ~ 0
USB_CONN_D-
Text GLabel 1200 1200 2    50   Input ~ 0
USB_CONN_D+
$Comp
L Connector:USB_B_Mini J1
U 1 1 5F55AD22
P 900 1200
F 0 "J1" H 957 1667 50  0000 C CNN
F 1 "USB_B_Mini" H 957 1576 50  0000 C CNN
F 2 "Connector_USB:USB_Mini-B_Tensility_54-00023_Vertical_CircularHoles" H 1050 1150 50  0001 C CNN
F 3 "~" H 1050 1150 50  0001 C CNN
	1    900  1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5F60B01A
P 2800 1800
F 0 "#PWR012" H 2800 1550 50  0001 C CNN
F 1 "GND" H 2805 1627 50  0000 C CNN
F 2 "" H 2800 1800 50  0001 C CNN
F 3 "" H 2800 1800 50  0001 C CNN
	1    2800 1800
	1    0    0    -1  
$EndComp
$Comp
L Power_Protection:USBLC6-2P6 U3
U 1 1 5F5F2E2F
P 2800 1400
F 0 "U3" H 3150 1850 50  0000 C CNN
F 1 "USBLC6-2P6" H 3200 1750 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 2800 900 50  0001 C CNN
F 3 "https://www.st.com/resource/en/datasheet/usblc6-2.pdf" H 3000 1750 50  0001 C CNN
	1    2800 1400
	1    0    0    -1  
$EndComp
Text Notes 600  650  0    50   ~ 0
USB Connection + ESD
Wire Wire Line
	800  1600 800  1750
Wire Wire Line
	900  1750 1250 1750
Connection ~ 900  1750
Wire Wire Line
	900  1600 900  1750
Connection ~ 1250 1750
Wire Wire Line
	1250 1800 1250 1750
Wire Wire Line
	800  1750 900  1750
Wire Wire Line
	1250 1700 1250 1750
Wire Wire Line
	1250 1400 1250 1500
Wire Wire Line
	1250 1400 1200 1400
$Comp
L Device:R_Small R4
U 1 1 5F7725CB
P 1250 1600
F 0 "R4" V 1300 1700 50  0000 C TNN
F 1 "10k" V 1300 1550 50  0000 C TNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 1250 1600 50  0001 C CNN
F 3 "~" H 1250 1600 50  0001 C CNN
	1    1250 1600
	1    0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR02
U 1 1 5F7514D9
P 1900 900
F 0 "#PWR02" H 1900 750 50  0001 C CNN
F 1 "VBUS" H 1900 1050 50  0000 C CNN
F 2 "" H 1900 900 50  0001 C CNN
F 3 "" H 1900 900 50  0001 C CNN
	1    1900 900 
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5F6735C8
P 1900 1000
F 0 "C1" H 1992 1046 50  0000 L CNN
F 1 "4.7u" H 1992 955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1900 1000 50  0001 C CNN
F 3 "~" H 1900 1000 50  0001 C CNN
	1    1900 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5F57727A
P 1250 1800
F 0 "#PWR011" H 1250 1550 50  0001 C CNN
F 1 "GND" H 1255 1627 50  0000 C CNN
F 2 "" H 1250 1800 50  0001 C CNN
F 3 "" H 1250 1800 50  0001 C CNN
	1    1250 1800
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
L power:+BATT #PWR07
U 1 1 5FA457C1
P 6250 1150
F 0 "#PWR07" H 6250 1000 50  0001 C CNN
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
L power:VBUS #PWR01
U 1 1 5F751DBF
P 4400 750
F 0 "#PWR01" H 4400 600 50  0001 C CNN
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
L power:GND #PWR014
U 1 1 5F62F76E
P 7350 2050
F 0 "#PWR014" H 7350 1800 50  0001 C CNN
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
L power:VCC #PWR08
U 1 1 5F612BB5
P 7800 1200
F 0 "#PWR08" H 7800 1050 50  0001 C CNN
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
L power:GND #PWR013
U 1 1 5F5E60AF
P 5800 2050
F 0 "#PWR013" H 5800 1800 50  0001 C CNN
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
L power:+BATT #PWR010
U 1 1 5F574D38
P 7350 1750
F 0 "#PWR010" H 7350 1600 50  0001 C CNN
F 1 "+BATT" H 7350 1900 50  0000 C CNN
F 2 "" H 7350 1750 50  0001 C CNN
F 3 "" H 7350 1750 50  0001 C CNN
	1    7350 1750
	1    0    0    -1  
$EndComp
Text GLabel 5650 5450 2    50   Input ~ 0
SPI_SS2
Wire Notes Line
	4650 4150 6200 4150
Text Notes 4650 4150 0    50   ~ 0
SPI Connectors
Text GLabel 5650 4750 2    50   Input ~ 0
SPI_SS1
$Comp
L power:GND #PWR031
U 1 1 5F8DCAB1
P 5150 4550
F 0 "#PWR031" H 5150 4300 50  0001 C CNN
F 1 "GND" V 5150 4350 50  0000 C CNN
F 2 "" H 5150 4550 50  0001 C CNN
F 3 "" H 5150 4550 50  0001 C CNN
	1    5150 4550
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
L Switch:SW_SPST SW4
U 1 1 5F7FD135
P 4000 5750
F 0 "SW4" H 4100 5500 50  0000 C CNN
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
L power:GND #PWR034
U 1 1 5F7E07DB
P 3150 5200
F 0 "#PWR034" H 3150 4950 50  0001 C CNN
F 1 "GND" H 3155 5027 50  0000 C CNN
F 2 "" H 3150 5200 50  0001 C CNN
F 3 "" H 3150 5200 50  0001 C CNN
	1    3150 5200
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R14
U 1 1 5F7D3759
P 3350 5200
F 0 "R14" V 3300 5300 50  0000 C BNN
F 1 "130" V 3300 5100 50  0000 C BNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3350 5200 50  0001 C CNN
F 3 "~" H 3350 5200 50  0001 C CNN
	1    3350 5200
	0    -1   -1   0   
$EndComp
Text Notes 2800 4150 0    50   ~ 0
BOOT mode switch
Wire Wire Line
	3450 4500 3500 4500
Wire Wire Line
	3250 4500 3200 4500
Wire Notes Line
	2800 4150 2800 4700
Wire Notes Line
	3900 4150 3900 4700
$Comp
L power:GND #PWR028
U 1 1 5F6D4FF4
P 3500 4500
F 0 "#PWR028" H 3500 4250 50  0001 C CNN
F 1 "GND" V 3500 4350 50  0000 R CNN
F 2 "" H 3500 4500 50  0001 C CNN
F 3 "" H 3500 4500 50  0001 C CNN
	1    3500 4500
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R11
U 1 1 5F6BDCF4
P 3350 4500
F 0 "R11" V 3400 4600 50  0000 C TNN
F 1 "10k" V 3400 4450 50  0000 C TNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3350 4500 50  0001 C CNN
F 3 "~" H 3350 4500 50  0001 C CNN
	1    3350 4500
	0    -1   -1   0   
$EndComp
Text GLabel 3200 4500 0    50   Input ~ 0
BOOT0
Wire Wire Line
	1700 4800 1800 4800
Connection ~ 1700 4800
Wire Wire Line
	1550 4350 1700 4350
Wire Wire Line
	1700 4350 1700 4800
Wire Wire Line
	1550 4800 1700 4800
Wire Wire Line
	1550 4550 1550 4800
Text Notes 800  4150 0    50   ~ 0
Oscillator crystals
Wire Wire Line
	1800 4450 1800 4550
Wire Wire Line
	1300 4450 1300 4550
Connection ~ 1550 4800
Wire Wire Line
	1300 4800 1550 4800
Wire Wire Line
	1300 4450 1450 4450
Connection ~ 1300 4450
Wire Wire Line
	1250 4450 1300 4450
Connection ~ 1800 4450
Wire Wire Line
	1650 4450 1800 4450
Wire Wire Line
	1300 4800 1300 4750
Wire Wire Line
	1800 4800 1800 4750
$Comp
L Device:C_Small C13
U 1 1 5F62995F
P 1800 4650
F 0 "C13" H 1892 4696 50  0000 L CNN
F 1 "12p" H 1892 4605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1800 4650 50  0001 C CNN
F 3 "~" H 1800 4650 50  0001 C CNN
	1    1800 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C12
U 1 1 5F629959
P 1300 4650
F 0 "C12" H 1392 4696 50  0000 L CNN
F 1 "12p" H 1392 4605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1300 4650 50  0001 C CNN
F 3 "~" H 1300 4650 50  0001 C CNN
	1    1300 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR032
U 1 1 5F629953
P 1550 4800
F 0 "#PWR032" H 1550 4550 50  0001 C CNN
F 1 "GND" H 1555 4627 50  0000 C CNN
F 2 "" H 1550 4800 50  0001 C CNN
F 3 "" H 1550 4800 50  0001 C CNN
	1    1550 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal_GND24_Small XOSC1
U 1 1 5F60E10F
P 1550 4450
F 0 "XOSC1" H 1350 4650 50  0000 C CNN
F 1 "16MHz" H 1750 4650 50  0000 C CNN
F 2 "Crystal:Crystal_SMD_3225-4Pin_3.2x2.5mm" H 1550 4450 50  0001 C CNN
F 3 "~" H 1550 4450 50  0001 C CNN
	1    1550 4450
	1    0    0    -1  
$EndComp
Text GLabel 1250 4450 0    50   Input ~ 0
XOSC_IN
Text GLabel 2150 4450 2    50   Input ~ 0
XOSC_OUT
Text Notes 800  3150 0    50   ~ 0
STM VDD(A) Filters
Wire Notes Line
	800  4050 800  3150
Connection ~ 950  3800
$Comp
L power:GND #PWR025
U 1 1 5F5D6CDD
P 950 3800
F 0 "#PWR025" H 950 3550 50  0001 C CNN
F 1 "GND" H 955 3627 50  0000 C CNN
F 2 "" H 950 3800 50  0001 C CNN
F 3 "" H 950 3800 50  0001 C CNN
	1    950  3800
	1    0    0    -1  
$EndComp
Connection ~ 950  3400
$Comp
L power:+3.3V #PWR019
U 1 1 5F5D630C
P 950 3400
F 0 "#PWR019" H 950 3250 50  0001 C CNN
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
L power:GND #PWR026
U 1 1 5F5A770A
P 3250 3800
F 0 "#PWR026" H 3250 3550 50  0001 C CNN
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
L power:+3.3VA #PWR021
U 1 1 5F57F069
P 3600 3400
F 0 "#PWR021" H 3600 3250 50  0001 C CNN
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
L power:+3.3V #PWR020
U 1 1 5F55A20D
P 2750 3400
F 0 "#PWR020" H 2750 3250 50  0001 C CNN
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
L power:+3.3V #PWR015
U 1 1 5F85E1A1
P 8300 2650
F 0 "#PWR015" H 8300 2500 50  0001 C CNN
F 1 "+3.3V" H 8315 2823 50  0000 C CNN
F 2 "" H 8300 2650 50  0001 C CNN
F 3 "" H 8300 2650 50  0001 C CNN
	1    8300 2650
	1    0    0    -1  
$EndComp
Text GLabel 8400 4350 0    50   Input ~ 0
LED0
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
L power:GND #PWR039
U 1 1 5F563978
P 9200 5850
F 0 "#PWR039" H 9200 5600 50  0001 C CNN
F 1 "GND" H 9205 5677 50  0000 C CNN
F 2 "" H 9200 5850 50  0001 C CNN
F 3 "" H 9200 5850 50  0001 C CNN
	1    9200 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR038
U 1 1 5F56300D
P 8900 5850
F 0 "#PWR038" H 8900 5600 50  0001 C CNN
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
L power:+3.3V #PWR016
U 1 1 5F684A11
P 8900 2650
F 0 "#PWR016" H 8900 2500 50  0001 C CNN
F 1 "+3.3V" H 8915 2823 50  0000 C CNN
F 2 "" H 8900 2650 50  0001 C CNN
F 3 "" H 8900 2650 50  0001 C CNN
	1    8900 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR029
U 1 1 5F622B70
P 5150 4450
F 0 "#PWR029" H 5150 4300 50  0001 C CNN
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
L power:+3.3V #PWR040
U 1 1 5F6906EB
P 5700 5900
F 0 "#PWR040" H 5700 5750 50  0001 C CNN
F 1 "+3.3V" H 5750 5950 50  0000 L CNN
F 2 "" H 5700 5900 50  0001 C CNN
F 3 "" H 5700 5900 50  0001 C CNN
	1    5700 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 5950 5700 5900
Wire Wire Line
	5500 5950 5700 5950
Wire Wire Line
	5300 5950 5250 5950
$Comp
L Device:R_Small R21
U 1 1 5F6C0A40
P 5400 6100
F 0 "R21" V 5300 6200 50  0000 C TNN
F 1 "10k" V 5300 6050 50  0000 C TNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 5400 6100 50  0001 C CNN
F 3 "~" H 5400 6100 50  0001 C CNN
	1    5400 6100
	0    1    1    0   
$EndComp
Wire Wire Line
	5250 6100 5300 6100
Wire Wire Line
	5500 6100 5700 6100
Wire Wire Line
	5700 6100 5700 5950
Connection ~ 5700 5950
$Comp
L Device:R_Small R20
U 1 1 5F6E2A7F
P 5400 5950
F 0 "R20" V 5300 6050 50  0000 C TNN
F 1 "10k" V 5300 5900 50  0000 C TNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 5400 5950 50  0001 C CNN
F 3 "~" H 5400 5950 50  0001 C CNN
	1    5400 5950
	0    1    1    0   
$EndComp
Wire Notes Line
	4650 6300 6200 6300
Text Notes 4700 5750 0    50   ~ 0
SS Pull up
Wire Notes Line
	6200 5650 4650 5650
Text GLabel 5250 5950 0    50   Input ~ 0
SPI_SS1
Text GLabel 5250 6100 0    50   Input ~ 0
SPI_SS2
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
$Comp
L power:+3.3V #PWR037
U 1 1 5F8324EA
P 4250 5750
F 0 "#PWR037" H 4250 5600 50  0001 C CNN
F 1 "+3.3V" V 4150 5700 50  0000 L TNN
F 2 "" H 4250 5750 50  0001 C CNN
F 3 "" H 4250 5750 50  0001 C CNN
	1    4250 5750
	0    1    1    0   
$EndComp
Wire Wire Line
	9300 1000 9250 1000
Connection ~ 9150 1000
Connection ~ 7600 1200
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5F845734
P 7600 1200
F 0 "#FLG02" H 7600 1275 50  0001 C CNN
F 1 "PWR_FLAG" H 7600 1373 50  0000 C CNN
F 2 "" H 7600 1200 50  0001 C CNN
F 3 "~" H 7600 1200 50  0001 C CNN
	1    7600 1200
	-1   0    0    1   
$EndComp
Wire Wire Line
	7600 1200 7800 1200
$Comp
L power:PWR_FLAG #FLG03
U 1 1 5F84683A
P 3600 3550
F 0 "#FLG03" H 3600 3625 50  0001 C CNN
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
L power:PWR_FLAG #FLG01
U 1 1 5F8A2101
P 9250 1000
F 0 "#FLG01" H 9250 1075 50  0001 C CNN
F 1 "PWR_FLAG" H 9300 1150 50  0000 C CNN
F 2 "" H 9250 1000 50  0001 C CNN
F 3 "~" H 9250 1000 50  0001 C CNN
	1    9250 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse_Small F1
U 1 1 5F8D6EBB
P 8650 1000
F 0 "F1" H 8550 1200 50  0000 C CNN
F 1 "Fuse_Small" H 8700 1100 50  0000 C CNN
F 2 "Fuse:Fuse_0805_2012Metric" H 8650 1000 50  0001 C CNN
F 3 "~" H 8650 1000 50  0001 C CNN
	1    8650 1000
	1    0    0    -1  
$EndComp
Connection ~ 9250 1000
Wire Wire Line
	9250 1000 9150 1000
Wire Wire Line
	8750 1000 8800 1000
Wire Wire Line
	8550 1000 8450 1000
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
L power:+3.3VA #PWR017
U 1 1 5F57F409
P 9200 2650
F 0 "#PWR017" H 9200 2500 50  0001 C CNN
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
$Comp
L Device:R_Small R10
U 1 1 5FA31ED3
P 2000 4450
F 0 "R10" V 2200 4450 50  0000 C BNN
F 1 "680" V 2100 4450 50  0000 C BNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 2000 4450 50  0001 C CNN
F 3 "~" H 2000 4450 50  0001 C CNN
	1    2000 4450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2100 4450 2150 4450
Wire Wire Line
	1800 4450 1900 4450
Text GLabel 8400 5350 0    50   Input ~ 0
P_EXTI
Text GLabel 5150 4650 0    50   Input ~ 0
P_EXTI
$Comp
L power:GND #PWR035
U 1 1 5FAB24CE
P 5150 5250
F 0 "#PWR035" H 5150 5000 50  0001 C CNN
F 1 "GND" V 5150 5050 50  0000 C CNN
F 2 "" H 5150 5250 50  0001 C CNN
F 3 "" H 5150 5250 50  0001 C CNN
	1    5150 5250
	0    1    1    0   
$EndComp
Text GLabel 5650 5350 2    50   Input ~ 0
SPI_MOSI
Text GLabel 5650 5250 2    50   Input ~ 0
SPI_MISO
Text GLabel 5650 5150 2    50   Input ~ 0
SPI_SCK
$Comp
L power:+3.3V #PWR033
U 1 1 5FAB24DB
P 5150 5150
F 0 "#PWR033" H 5150 5000 50  0001 C CNN
F 1 "+3.3V" V 5150 5250 50  0000 L CNN
F 2 "" H 5150 5150 50  0001 C CNN
F 3 "" H 5150 5150 50  0001 C CNN
	1    5150 5150
	0    -1   -1   0   
$EndComp
Text GLabel 5150 5350 0    50   Input ~ 0
P_EXTI
$Comp
L Device:R_Small R13
U 1 1 5FAF4A2A
P 3350 5100
F 0 "R13" V 3300 5200 50  0000 C BNN
F 1 "130" V 3300 5000 50  0000 C BNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3350 5100 50  0001 C CNN
F 3 "~" H 3350 5100 50  0001 C CNN
	1    3350 5100
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R12
U 1 1 5FAF4D75
P 3350 5000
F 0 "R12" V 3300 5100 50  0000 C BNN
F 1 "130" V 3300 4900 50  0000 C BNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3350 5000 50  0001 C CNN
F 3 "~" H 3350 5000 50  0001 C CNN
	1    3350 5000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R15
U 1 1 5FAF50CD
P 3350 5300
F 0 "R15" V 3300 5400 50  0000 C BNN
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
L power:GND #PWR036
U 1 1 5FB51D35
P 3150 5750
F 0 "#PWR036" H 3150 5500 50  0001 C CNN
F 1 "GND" H 3155 5577 50  0000 C CNN
F 2 "" H 3150 5750 50  0001 C CNN
F 3 "" H 3150 5750 50  0001 C CNN
	1    3150 5750
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R18
U 1 1 5FB51D3F
P 3350 5750
F 0 "R18" V 3300 5850 50  0000 C BNN
F 1 "130" V 3300 5650 50  0000 C BNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3350 5750 50  0001 C CNN
F 3 "~" H 3350 5750 50  0001 C CNN
	1    3350 5750
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R17
U 1 1 5FB51D49
P 3350 5650
F 0 "R17" V 3300 5750 50  0000 C BNN
F 1 "130" V 3300 5550 50  0000 C BNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3350 5650 50  0001 C CNN
F 3 "~" H 3350 5650 50  0001 C CNN
	1    3350 5650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R16
U 1 1 5FB51D53
P 3350 5550
F 0 "R16" V 3300 5650 50  0000 C BNN
F 1 "130" V 3300 5450 50  0000 C BNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3350 5550 50  0001 C CNN
F 3 "~" H 3350 5550 50  0001 C CNN
	1    3350 5550
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R19
U 1 1 5FB51D5D
P 3350 5850
F 0 "R19" V 3300 5950 50  0000 C BNN
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
Text GLabel 8050 2850 1    50   Input ~ 0
NRST
$Comp
L Switch:SW_SPST SW1
U 1 1 5FC4CF1C
P 7850 2950
F 0 "SW1" H 7700 3150 50  0000 C CNN
F 1 "SW_RST" H 7750 3050 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 7850 2950 50  0001 C CNN
F 3 "~" H 7850 2950 50  0001 C CNN
	1    7850 2950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5FC6D6F3
P 7600 3000
F 0 "#PWR018" H 7600 2750 50  0001 C CNN
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
L power:GND #PWR023
U 1 1 5F986EE5
P 5150 3550
F 0 "#PWR023" H 5150 3300 50  0001 C CNN
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
L Connector_Generic:Conn_01x05 J3
U 1 1 5F80F4FB
P 4750 3600
F 0 "J3" H 4700 4000 50  0000 L CNN
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
L power:+3.3V #PWR022
U 1 1 5F810F04
P 4550 3400
F 0 "#PWR022" H 4550 3250 50  0001 C CNN
F 1 "+3.3V" V 4550 3500 50  0000 L CNN
F 2 "" H 4550 3400 50  0001 C CNN
F 3 "" H 4550 3400 50  0001 C CNN
	1    4550 3400
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR024
U 1 1 5F811893
P 4550 3600
F 0 "#PWR024" H 4550 3350 50  0001 C CNN
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
L power:GND #PWR027
U 1 1 5FE17392
P 3600 3800
F 0 "#PWR027" H 3600 3550 50  0001 C CNN
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
Wire Notes Line
	2650 4150 2650 5050
Wire Notes Line
	2650 5050 800  5050
Wire Notes Line
	800  5050 800  4150
Text Notes 1400 5200 0    50   ~ 0
UART_Connector
Text GLabel 1900 5600 0    50   Input ~ 0
UART1_TX
Text GLabel 1900 5500 0    50   Input ~ 0
UART1_RX
Text GLabel 9700 5150 2    50   Input ~ 0
USB_D-
Text GLabel 9700 5250 2    50   Input ~ 0
USB_D+
NoConn ~ 8400 3750
NoConn ~ 8400 3850
Text GLabel 3200 1500 2    50   Input ~ 0
USB_CONN_D+
Text GLabel 2400 1500 0    50   Input ~ 0
USB_CONN_D-
Wire Wire Line
	1200 1000 1750 1000
Wire Wire Line
	1750 1000 1750 900 
Wire Wire Line
	1750 900  1900 900 
Connection ~ 1900 900 
Wire Wire Line
	3750 5200 4250 5200
Wire Notes Line
	3900 4700 2800 4700
Wire Notes Line
	2800 4150 3900 4150
$Comp
L power:GND #PWR041
U 1 1 5FBFC526
P 1900 5700
F 0 "#PWR041" H 1900 5450 50  0001 C CNN
F 1 "GND" V 1905 5572 50  0000 R CNN
F 2 "" H 1900 5700 50  0001 C CNN
F 3 "" H 1900 5700 50  0001 C CNN
	1    1900 5700
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J4
U 1 1 5F67D69A
P 2100 5600
F 0 "J4" H 2050 5900 50  0000 L CNN
F 1 "Conn_01x03" H 1800 5800 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 2100 5600 50  0001 C CNN
F 3 "~" H 2100 5600 50  0001 C CNN
	1    2100 5600
	1    0    0    -1  
$EndComp
Wire Notes Line
	1400 5200 2300 5200
Wire Notes Line
	2300 5200 2300 5800
Wire Notes Line
	2300 5800 1400 5800
Wire Notes Line
	1400 5800 1400 5200
Text GLabel 2400 1300 0    50   Input ~ 0
USB_D-
Text GLabel 3200 1300 2    50   Input ~ 0
USB_D+
NoConn ~ 8400 4250
NoConn ~ 5150 4750
NoConn ~ 5150 5450
$EndSCHEMATC
