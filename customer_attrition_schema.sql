-- 1. Creating DataBase

Create Database Final_Project_2

--Servername and DB name

SELECT @@SERVERNAME AS 'MyServerName', DB_NAME() AS 'CurrentDatabase';

-- 2. CREATE TABLES
-- ==========================================

-- Lookup table for Card Tiers
CREATE TABLE Card_tiers (
    Card_Type VARCHAR(20) PRIMARY KEY
);

-- Main Customer demographic table
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Age INT,
    Gender VARCHAR(5),
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    Income_Range VARCHAR(50)
);

-- Main Activity table with foreign keys
CREATE TABLE Bank_Activity (
    Customer_ID INT,
    Card_Type VARCHAR(20),
    Credit_Limit DECIMAL(18, 2),
    Total_Transaction_Amount INT,
    Total_Transaction_Count INT,
    Churn_Status VARCHAR(25),
    Tenure_Months INT,
    Num_Bank_Products INT,
    Inactive_Months_Last_Year INT,
    Customer_Service_Calls INT,
    Revolving_Balance INT,
    Available_Credit DECIMAL(18, 2),
    CONSTRAINT FK_Activity_Customer FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    CONSTRAINT FK_Activity_CardTier FOREIGN KEY (Card_Type) REFERENCES Card_tiers(Card_Type)
);

-- ==========================================
-- 3. INSERT DATA
-- ==========================================

-- Populate Card_tiers lookup
INSERT INTO Card_tiers (Card_Type) VALUES ('Blue'), ('Silver'), ('Gold'), ('Platinum');

-- Populate Customer table (First 100 Rows)
INSERT INTO Customer (Customer_ID, Age, Gender, Education_Level, Marital_Status, Income_Range)
VALUES
(768805383, 45, 'M', 'High School', 'Married', '$60K - $80K'),
(818770008, 49, 'F', 'Graduate', 'Single', 'Less than $40K'),
(713982108, 46, 'M', 'Graduate', 'Married', '$80K - $120K'),
(769911858, 40, 'F', 'High School', 'Married', 'Less than $40K'),
(709106358, 40, 'M', 'Uneducated', 'Married', '$60K - $80K'),
(713061558, 44, 'M', 'Graduate', 'Married', '$40K - $60K'),
(810347208, 51, 'M', 'Graduate', 'Married', '$120K +'),
(818906208, 32, 'M', 'High School', 'Single', '$60K - $80K'),
(710930508, 37, 'M', 'Uneducated', 'Single', 'Less than $40K'),
(719661558, 48, 'M', 'Graduate', 'Single', '$80K - $120K'),
(708790833, 42, 'M', 'Uneducated', 'Married', '$120K +'),
(710821833, 65, 'M', 'Graduate', 'Married', '$40K - $60K'),
(710599683, 56, 'M', 'College', 'Single', '$80K - $120K'),
(816082233, 35, 'M', 'Graduate', 'Married', '$60K - $80K'),
(712396908, 57, 'F', 'Graduate', 'Married', 'Less than $40K'),
(714885258, 44, 'M', 'Graduate', 'Married', '$80K - $120K'),
(709967358, 48, 'M', 'Post-Graduate', 'Single', '$80K - $120K'),
(753327333, 41, 'M', 'Graduate', 'Married', '$80K - $120K'),
(806160108, 61, 'M', 'High School', 'Married', '$40K - $60K'),
(709327383, 45, 'F', 'Graduate', 'Married', 'Less than $40K'),
(806165208, 47, 'M', 'Doctorate', 'Divorced', '$60K - $80K'),
(708508758, 62, 'F', 'Graduate', 'Married', 'Less than $40K'),
(784725333, 41, 'M', 'High School', 'Married', '$40K - $60K'),
(811604133, 47, 'F', 'Graduate', 'Single', 'Less than $40K'),
(789124683, 54, 'M', 'Graduate', 'Married', '$80K - $120K'),
(771071958, 41, 'F', 'Graduate', 'Single', 'Less than $40K'),
(720466383, 59, 'M', 'High School', 'Married', '$40K - $60K'),
(804424383, 63, 'M', 'Graduate', 'Married', '$60K - $80K'),
(718813833, 44, 'F', 'Uneducated', 'Single', 'Less than $40K'),
(806624208, 47, 'M', 'High School', 'Married', '$40K - $60K'),
(778348233, 53, 'M', 'Graduate', 'Married', '$80K - $120K'),
(712991808, 53, 'M', 'Uneducated', 'Married', '$60K - $80K'),
(709029408, 41, 'M', 'Graduate', 'Married', '$60K - $80K'),
(788658483, 53, 'F', 'College', 'Married', 'Less than $40K'),
(787937058, 58, 'M', 'Graduate', 'Married', '$80K - $120K'),
(715318008, 55, 'F', 'College', 'Single', 'Less than $40K'),
(713962233, 55, 'F', 'Graduate', 'Married', 'Less than $40K'),
(785432733, 42, 'F', 'High School', 'Married', 'Less than $40K'),
(715190283, 57, 'F', 'Graduate', 'Married', '$40K - $60K'),
(708300483, 66, 'F', 'Doctorate', 'Married', 'Less than $40K'),
(827111283, 45, 'M', 'Graduate', 'Single', '$80K - $120K'),
(758551608, 51, 'M', 'Graduate', 'Married', '$40K - $60K'),
(773146383, 50, 'F', 'College', 'Single', '$40K - $60K'),
(778493808, 49, 'M', 'High School', 'Married', '$60K - $80K'),
(720572508, 38, 'F', 'Graduate', 'Single', 'Less than $40K'),
(712661433, 49, 'M', 'Uneducated', 'Single', '$80K - $120K'),
(789172683, 56, 'M', 'Doctorate', 'Married', '$60K - $80K'),
(738406533, 59, 'M', 'Doctorate', 'Married', '$40K - $60K'),
(799723908, 46, 'M', 'High School', 'Married', '$80K - $120K'),
(771490833, 52, 'M', 'College', 'Single', '$80K - $120K'),
(720756708, 52, 'F', 'Graduate', 'Married', 'Less than $40K'),
(779471883, 54, 'F', 'Graduate', 'Married', 'Less than $40K'),
(711525033, 66, 'F', 'High School', 'Married', 'Less than $40K'),
(712813458, 49, 'M', 'Graduate', 'Married', '$120K +'),
(714374133, 56, 'M', 'Graduate', 'Married', '$120K +'),
(717891558, 49, 'F', 'Graduate', 'Married', 'Less than $40K'),
(716632758, 49, 'F', 'Graduate', 'Single', 'Less than $40K'),
(768563658, 56, 'M', 'Uneducated', 'Married', '$40K - $60K'),
(711427458, 44, 'F', 'Graduate', 'Married', 'Less than $40K'),
(714091983, 42, 'M', 'High School', 'Single', '$60K - $80K'),
(787584108, 55, 'M', 'Graduate', 'Married', '$80K - $120K'),
(712030833, 48, 'M', 'Graduate', 'Married', '$60K - $80K'),
(711481533, 39, 'M', 'High School', 'Divorced', '$60K - $80K'),
(710082708, 44, 'M', 'Post-Graduate', 'Single', '$120K +'),
(708155733, 53, 'M', 'High School', 'Single', '$120K +'),
(788979258, 51, 'M', 'Uneducated', 'Single', '$80K - $120K'),
(807986133, 57, 'M', 'College', 'Married', '$60K - $80K'),
(788730933, 44, 'F', 'Uneducated', 'Single', 'Less than $40K'),
(711314058, 49, 'M', 'Graduate', 'Married', '$60K - $80K'),
(717975333, 50, 'M', 'Doctorate', 'Married', '$80K - $120K'),
(715971108, 51, 'M', 'Graduate', 'Single', '$120K +'),
(720096558, 55, 'F', 'Graduate', 'Married', 'Less than $40K'),
(719580033, 54, 'M', 'Graduate', 'Married', '$60K - $80K'),
(820582308, 42, 'M', 'Uneducated', 'Married', '$80K - $120K'),
(789973308, 44, 'M', 'College', 'Single', '$60K - $80K'),
(712876233, 53, 'M', 'Graduate', 'Single', '$80K - $120K'),
(804595158, 44, 'F', 'Graduate', 'Single', 'Less than $40K'),
(714826758, 37, 'F', 'Uneducated', 'Single', 'Less than $40K'),
(779058108, 49, 'M', 'Graduate', 'Divorced', '$60K - $80K'),
(710790258, 47, 'M', 'Graduate', 'Married', '$80K - $120K'),
(715623483, 47, 'M', 'Graduate', 'Married', '$60K - $80K'),
(715156383, 44, 'M', 'Graduate', 'Married', '$120K +'),
(711013983, 55, 'F', 'Graduate', 'Married', '$40K - $60K'),
(755420433, 59, 'F', 'Graduate', 'Married', 'Less than $40K'),
(794543958, 53, 'M', 'Graduate', 'Divorced', '$80K - $120K'),
(716396358, 52, 'M', 'Graduate', 'Married', '$60K - $80K'),
(715398033, 53, 'M', 'High School', 'Single', '$120K +'),
(711743883, 43, 'F', 'Uneducated', 'Single', 'Less than $40K'),
(719720058, 44, 'M', 'High School', 'Single', '$60K - $80K'),
(778992108, 57, 'M', 'Graduate', 'Married', '$120K +'),
(717539808, 51, 'F', 'High School', 'Single', 'Less than $40K'),
(714070758, 49, 'M', 'High School', 'Single', '$80K - $120K'),
(714107958, 45, 'M', 'Graduate', 'Single', '$40K - $60K'),
(789140283, 53, 'M', 'Graduate', 'Single', '$80K - $120K'),
(715550508, 45, 'F', 'Graduate', 'Married', 'Less than $40K'),
(719712633, 64, 'M', 'Graduate', 'Married', 'Less than $40K'),
(772629333, 45, 'M', 'Graduate', 'Married', '$40K - $60K'),
(720336708, 53, 'M', 'Doctorate', 'Married', '$40K - $60K'),
(802013583, 56, 'M', 'College', 'Married', '$120K +'),
(711887583, 47, 'M', 'Graduate', 'Married', '$80K - $120K');

-- Populate Bank_Activity table (First 100 Rows)
INSERT INTO Bank_Activity (Customer_ID, Card_Type, Credit_Limit, Total_Transaction_Amount, Total_Transaction_Count, Churn_Status, Tenure_Months, Num_Bank_Products, Inactive_Months_Last_Year, Customer_Service_Calls, Revolving_Balance, Available_Credit)
VALUES
(768805383, 'Blue', 12691.0, 1144, 42, 'Existing Customer', 39, 5, 1, 3, 777, 11914.0),
(818770008, 'Blue', 8256.0, 1291, 33, 'Existing Customer', 44, 6, 1, 2, 864, 7392.0),
(713982108, 'Blue', 3418.0, 1887, 20, 'Existing Customer', 36, 4, 1, 0, 0, 3418.0),
(769911858, 'Blue', 3313.0, 1171, 20, 'Existing Customer', 34, 3, 4, 1, 2517, 796.0),
(709106358, 'Blue', 4716.0, 816, 28, 'Existing Customer', 21, 5, 1, 2, 0, 4716.0),
(713061558, 'Blue', 4010.0, 1088, 24, 'Existing Customer', 36, 3, 1, 2, 1247, 2763.0),
(810347208, 'Gold', 34516.0, 1330, 31, 'Existing Customer', 46, 6, 3, 3, 2264, 32252.0),
(818906208, 'Silver', 29081.0, 1538, 36, 'Existing Customer', 27, 2, 2, 2, 1396, 27685.0),
(710930508, 'Blue', 22352.0, 1350, 24, 'Existing Customer', 36, 5, 2, 0, 2517, 19835.0),
(719661558, 'Blue', 999999.0, 1441, 32, 'Existing Customer', 36, 6, 3, 3, 1677, 9979.0),
(708790833, 'Blue', 6748.0, 1201, 42, 'Existing Customer', 31, 5, 3, 2, 1467, 5281.0),
(710821833, 'Blue', 9095.0, 1314, 26, 'Existing Customer', 54, 6, 2, 3, 1587, 7508.0),
(710599683, 'Blue', 11751.0, 1539, 17, 'Existing Customer', 36, 3, 6, 0, 0, 11751.0),
(816082233, 'Blue', 8547.0, 1311, 33, 'Existing Customer', 30, 5, 1, 3, 1666, 6881.0),
(712396908, 'Blue', 2436.0, 1570, 29, 'Existing Customer', 48, 5, 2, 2, 680, 1756.0),
(714885258, 'Blue', 4234.0, 1348, 27, 'Existing Customer', 37, 5, 1, 2, 972, 3262.0),
(709967358, 'Blue', 30367.0, 1671, 27, 'Existing Customer', 36, 6, 2, 3, 2362, 28005.0),
(753327333, 'Blue', 13535.0, 1028, 21, 'Existing Customer', 34, 4, 4, 1, 1291, 12244.0),
(806160108, 'Blue', 3193.0, 1336, 30, 'Existing Customer', 56, 2, 2, 3, 2517, 676.0),
(709327383, 'Blue', 14470.0, 1207, 21, 'Existing Customer', 37, 6, 1, 2, 1157, 13313.0),
(806165208, 'Blue', 20979.0, 1178, 27, 'Existing Customer', 42, 5, 2, 0, 1800, 19179.0),
(708508758, 'Blue', 1438.3, 692, 16, 'Attrited Customer', 49, 2, 3, 3, 0, 1438.3),
(784725333, 'Blue', 4470.0, 931, 18, 'Existing Customer', 33, 4, 2, 1, 680, 3790.0),
(811604133, 'Blue', 2492.0, 1126, 23, 'Existing Customer', 36, 3, 3, 2, 1560, 932.0),
(789124683, 'Blue', 12217.0, 1110, 21, 'Existing Customer', 42, 4, 2, 3, 0, 12217.0),
(771071958, 'Blue', 7768.0, 1051, 22, 'Existing Customer', 28, 6, 1, 2, 1669, 6099.0),
(720466383, 'Blue', 14784.0, 1197, 23, 'Existing Customer', 46, 4, 1, 2, 1374, 13410.0),
(804424383, 'Blue', 10215.0, 1904, 40, 'Existing Customer', 56, 3, 3, 2, 1010, 9205.0),
(718813833, 'Blue', 10100.0, 1052, 18, 'Existing Customer', 34, 5, 2, 2, 0, 10100.0),
(806624208, 'Blue', 4785.0, 1045, 38, 'Existing Customer', 42, 6, 0, 0, 1362, 3423.0),
(778348233, 'Blue', 2753.0, 1038, 25, 'Existing Customer', 33, 3, 2, 3, 1811, 942.0),
(712991808, 'Blue', 2451.0, 1596, 26, 'Existing Customer', 48, 2, 5, 1, 1690, 761.0),
(709029408, 'Blue', 8923.0, 1589, 24, 'Existing Customer', 36, 4, 1, 2, 2517, 6406.0),
(788658483, 'Blue', 2650.0, 1411, 28, 'Existing Customer', 38, 5, 2, 3, 1490, 1160.0),
(787937058, 'Blue', 12555.0, 1291, 24, 'Existing Customer', 49, 6, 2, 2, 1696, 10859.0),
(715318008, 'Blue', 3520.0, 1407, 43, 'Existing Customer', 36, 4, 2, 1, 1914, 1606.0),
(713962233, 'Blue', 3035.0, 1877, 37, 'Existing Customer', 36, 6, 2, 3, 2298, 737.0),
(785432733, 'Gold', 15433.0, 966, 22, 'Existing Customer', 36, 2, 3, 3, 0, 15433.0),
(715190283, 'Blue', 3672.0, 1464, 28, 'Existing Customer', 49, 3, 3, 2, 886, 2786.0),
(708300483, 'Blue', 7882.0, 704, 16, 'Attrited Customer', 56, 5, 4, 3, 605, 7277.0),
(827111283, 'Blue', 32426.0, 1109, 28, 'Existing Customer', 41, 2, 2, 2, 578, 31848.0),
(758551608, 'Blue', 6205.0, 1347, 28, 'Existing Customer', 44, 4, 1, 0, 2204, 4001.0),
(773146383, 'Silver', 17304.0, 1756, 33, 'Existing Customer', 43, 3, 2, 3, 2517, 14787.0),
(778493808, 'Blue', 3906.0, 1756, 32, 'Existing Customer', 37, 5, 2, 1, 0, 3906.0),
(720572508, 'Blue', 9830.0, 1042, 23, 'Existing Customer', 28, 2, 3, 3, 2055, 7775.0),
(712661433, 'Blue', 34516.0, 1444, 28, 'Existing Customer', 30, 3, 2, 3, 0, 34516.0),
(789172683, 'Blue', 2283.0, 1741, 27, 'Existing Customer', 45, 6, 2, 0, 1430, 853.0),
(738406533, 'Blue', 2548.0, 1719, 27, 'Existing Customer', 52, 3, 2, 2, 2020, 528.0),
(799723908, 'Blue', 19458.0, 1217, 27, 'Existing Customer', 40, 4, 3, 3, 1435, 18023.0),
(771490833, 'Blue', 4745.0, 1140, 40, 'Existing Customer', 40, 5, 1, 1, 1227, 3518.0),
(720756708, 'Blue', 2622.0, 1878, 30, 'Existing Customer', 41, 6, 3, 2, 1549, 1073.0),
(779471883, 'Blue', 1438.3, 705, 19, 'Attrited Customer', 40, 2, 3, 1, 808, 630.3),
(711525033, 'Blue', 3171.0, 1946, 38, 'Existing Customer', 54, 3, 4, 2, 2179, 992.0),
(712813458, 'Blue', 19763.0, 1414, 35, 'Existing Customer', 36, 4, 2, 0, 2517, 17246.0),
(714374133, 'Blue', 15769.0, 602, 15, 'Attrited Customer', 36, 1, 3, 3, 0, 15769.0),
(717891558, 'Blue', 3298.0, 1052, 32, 'Existing Customer', 36, 6, 4, 2, 2200, 1098.0),
(716632758, 'Blue', 2802.0, 1295, 40, 'Existing Customer', 36, 2, 2, 0, 2363, 439.0),
(768563658, 'Blue', 4458.0, 1424, 29, 'Existing Customer', 50, 4, 2, 3, 1880, 2578.0),
(711427458, 'Blue', 6273.0, 1359, 25, 'Existing Customer', 35, 4, 1, 2, 978, 5295.0),
(714091983, 'Blue', 3336.0, 1168, 27, 'Existing Customer', 34, 4, 4, 3, 1753, 1583.0),
(787584108, 'Blue', 3436.0, 1097, 33, 'Existing Customer', 47, 4, 2, 3, 2016, 1420.0),
(712030833, 'Silver', 34516.0, 691, 15, 'Attrited Customer', 35, 2, 4, 4, 0, 34516.0),
(711481533, 'Blue', 5926.0, 1316, 28, 'Existing Customer', 33, 5, 3, 3, 1251, 4675.0),
(710082708, 'Blue', 23957.0, 1276, 26, 'Existing Customer', 32, 2, 4, 2, 2102, 21855.0),
(708155733, 'Blue', 14734.0, 1289, 23, 'Existing Customer', 44, 4, 2, 2, 1634, 13100.0),
(788979258, 'Silver', 34516.0, 1293, 32, 'Existing Customer', 38, 4, 1, 4, 1515, 33001.0),
(807986133, 'Blue', 6584.0, 1353, 35, 'Existing Customer', 52, 5, 3, 3, 1817, 4767.0),
(788730933, 'Blue', 2084.0, 1132, 28, 'Existing Customer', 20, 6, 3, 3, 1468, 616.0),
(711314058, 'Blue', 1687.0, 1670, 17, 'Existing Customer', 32, 2, 2, 2, 1107, 580.0),
(717975333, 'Blue', 25300.0, 837, 15, 'Existing Customer', 38, 6, 2, 2, 1330, 23970.0),
(715971108, 'Blue', 34516.0, 1550, 41, 'Existing Customer', 42, 3, 2, 3, 1763, 32753.0),
(720096558, 'Blue', 2216.0, 1540, 36, 'Existing Customer', 42, 5, 3, 3, 1034, 1182.0),
(719580033, 'Blue', 2910.0, 1256, 21, 'Existing Customer', 43, 4, 2, 3, 2030, 880.0),
(820582308, 'Blue', 22913.0, 1394, 35, 'Existing Customer', 37, 6, 2, 2, 1528, 21385.0),
(789973308, 'Blue', 24312.0, 1341, 24, 'Existing Customer', 35, 3, 3, 3, 1932, 22380.0),
(712876233, 'Blue', 5272.0, 1289, 33, 'Existing Customer', 36, 5, 3, 2, 1515, 3757.0),
(804595158, 'Blue', 7000.0, 1112, 23, 'Existing Customer', 36, 6, 4, 2, 2517, 4483.0),
(714826758, 'Blue', 7038.0, 2339, 57, 'Existing Customer', 29, 4, 4, 2, 1801, 5237.0),
(779058108, 'Blue', 2536.0, 1468, 23, 'Existing Customer', 30, 6, 1, 2, 1823, 713.0),
(710790258, 'Blue', 28904.0, 1334, 35, 'Existing Customer', 38, 6, 3, 2, 1899, 27005.0),
(715623483, 'Blue', 8567.0, 1457, 41, 'Existing Customer', 37, 4, 4, 0, 1695, 6872.0),
(715156383, 'Blue', 34516.0, 1603, 29, 'Existing Customer', 36, 6, 2, 2, 1533, 32983.0),
(711013983, 'Blue', 2158.0, 615, 12, 'Attrited Customer', 45, 2, 4, 3, 0, 2158.0),
(755420433, 'Blue', 10133.0, 1068, 20, 'Existing Customer', 52, 2, 3, 3, 1417, 8716.0),
(794543958, 'Blue', 34516.0, 1590, 27, 'Existing Customer', 35, 5, 4, 2, 1219, 33297.0),
(716396358, 'Blue', 3085.0, 1531, 35, 'Existing Customer', 47, 5, 3, 0, 1910, 1175.0),
(715398033, 'Blue', 19040.0, 1212, 31, 'Existing Customer', 35, 4, 2, 1, 2056, 16984.0),
(711743883, 'Blue', 4026.0, 1237, 32, 'Existing Customer', 35, 5, 2, 3, 0, 4026.0),
(719720058, 'Blue', 12756.0, 1413, 14, 'Existing Customer', 31, 4, 3, 1, 837, 11919.0),
(778992108, 'Blue', 5266.0, 1516, 29, 'Existing Customer', 45, 5, 3, 3, 0, 5266.0),
(717539808, 'Blue', 9930.0, 1276, 21, 'Existing Customer', 36, 3, 2, 2, 0, 9930.0),
(714070758, 'Blue', 31302.0, 1564, 35, 'Existing Customer', 38, 4, 3, 0, 1953, 29349.0),
(714107958, 'Blue', 6576.0, 1465, 34, 'Existing Customer', 36, 4, 4, 3, 0, 6576.0),
(789140283, 'Blue', 2664.0, 1286, 29, 'Existing Customer', 42, 5, 4, 1, 2037, 627.0),
(715550508, 'Blue', 2535.0, 1312, 20, 'Existing Customer', 28, 5, 1, 2, 2440, 95.0),
(719712633, 'Blue', 1709.0, 1673, 32, 'Existing Customer', 52, 6, 4, 3, 895, 814.0),
(772629333, 'Blue', 3454.0, 1313, 30, 'Existing Customer', 35, 5, 4, 2, 1200, 2254.0),
(720336708, 'Blue', 3789.0, 1609, 42, 'Existing Customer', 35, 5, 3, 2, 1706, 2083.0),
(802013583, 'Blue', 9689.0, 1158, 19, 'Existing Customer', 50, 3, 2, 0, 2250, 7439.0),
(711887583, 'Blue', 5449.0, 836, 18, 'Attrited Customer', 37, 2, 3, 3, 1628, 3821.0);

-- Verifying And Checking

-- 1.The Row Count Check ( IF import was successful and = 100 Rows).

SELECT 
    (SELECT COUNT(*) FROM Customer) AS Total_Customers,
    (SELECT COUNT(*) FROM Card_Tiers) AS Total_Card_Types,
    (SELECT COUNT(*) FROM Bank_Activity) AS Total_Activity_Records;

-- 2.The Relationship Check (IF PK-FK relationship is correctly established).

SELECT TOP 10 
    C.Customer_ID, 
    C.Age, 
    C.Marital_Status, 
    B.Card_Type, 
    B.Credit_Limit, 
    B.Churn_Status
FROM Bank_Activity B
JOIN Customer C ON B.Customer_ID = C.Customer_ID;

-- 3.Data Integrity Check (No Nulls = 0) (if any critical columns are empty).

SELECT COUNT(*) AS Missing_Data_Count
FROM Bank_Activity
WHERE Credit_Limit IS NULL 
   OR Customer_ID IS NULL 
   OR Card_Type IS NULL;

--4.Unknown Check for myselffffffffffffffffff.

SELECT 'Education' as Column_Checked, COUNT(*) as Unknown_Count 
FROM Customer WHERE Education_Level = 'Unknown'
Union
SELECT 'Marital', COUNT(*) 
FROM Customer WHERE Marital_Status = 'Unknown';
