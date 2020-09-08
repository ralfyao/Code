/*
 Navicat Premium Data Transfer

 Source Server         : 35.229.183.207
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : 35.229.183.207:3306
 Source Schema         : eval2

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 08/09/2020 10:30:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for AccountBase
-- ----------------------------
DROP TABLE IF EXISTS `AccountBase`;
CREATE TABLE `AccountBase`  (
  `AccountNo` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帳號',
  `AcntPwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帳號密碼',
  `AcoountName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帳號名稱',
  `AccountType` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帳號類別',
  `AcntTypeNo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '帳號對應代碼',
  `CloseDate` datetime(0) NULL DEFAULT NULL COMMENT '失效日',
  `CreateDate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'CreateDate',
  `CreateUser` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'CreateUser',
  PRIMARY KEY (`AccountNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '帳號資料' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of AccountBase
-- ----------------------------
INSERT INTO `AccountBase` VALUES ('001', 'seat', '測試帳號', '2', '102', NULL, '2020-09-08 02:02:59', NULL);
INSERT INTO `AccountBase` VALUES ('002', 'seat', '測試帳號', '1', '001', NULL, '2020-09-08 02:11:33', NULL);
INSERT INTO `AccountBase` VALUES ('0422018698', '1869', '凌家如', '1', '014', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0422111154', '1154', '吳虹諭', '1', '001', NULL, '2020-09-07 06:35:52', NULL);
INSERT INTO `AccountBase` VALUES ('0422113361', '1133', '宋安琪', '1', '003', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0422126765', '7621', '柯欣慧', '1', '041', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0422207818', '8122', '吳湘凌', '1', '051', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0422220329', '2032', '巫秀珍', '1', '016', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0422222411', '1142', '廖惠玲', '1', '027', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0422294411', '2456', '徐瑪玲', '1', '058', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0422356000', '2235', '張鈞淳', '1', '013', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0422370006', '2760', '吳德偉', '1', '063', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0422378557', '7516', '胡淑芬', '1', '062', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0422380563', '4359', '唐瑋澤', '1', '061', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0422432683', '2683', '洪曼珊', '1', '019', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0422475923', '3367', '葉秀美', '1', '067', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0422476877', '1043', '張靜宜', '1', '077', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0422630062', '3601', '王莉雅', '1', '081', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0422655948', '4690', '蔡子敏', '1', '080', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0422658079', '6580', '黃聖富', '1', '018', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0422795617', '2279', '田宜欣', '1', '004', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0422855011', '8671', '吳許暉', '1', '059', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0422974225', '9534', '陳淑芬', '1', '060', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0423360996', '5137', '謝汶宜', '1', '056', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0423378067', '8913', '許皓', '1', '057', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0423387328', '4233', '黃馨平', '1', '005', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0423391000', '5193', '陳琮勛', '1', '070', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0423505555', '4985', '全揚恩', '1', '068', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0423592525', '5295', '鄧喬鳳', '1', '036', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0423802117', '3802', '王仁傑', '1', '021', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0423890243', '3420', '郭姿秀', '1', '028', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0424368221', '4238', '呂郁芳', '1', '020', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0424374149', '7726', '呂佳雯', '1', '076', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0424739090', '7439', '廖珮琳', '1', '069', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0424792569', '9256', '劉映彤', '1', '022', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0424819900', '6329', '陳佩容', '1', '075', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0424870030', '4870', '李家豪', '1', '017', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0424915128', '9158', '吳淑榕', '1', '053', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0425156292', '6515', '劉美珠', '1', '034', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0425254607', '3342', '林燕玲', '1', '064', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0425263858', '2685', '林孟妃', '1', '055', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0425293499', '9349', '許菊芬', '1', '011', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0425295729', '9252', '吳婉琪', '1', '044', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0425583360', '5833', '吳彥岑', '1', '008', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0425610166', '4459', '黃世睿', '1', '065', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0425681919', '9186', '李育真', '1', '045', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0425682195', '6821', '高雅慧', '1', '046', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0425772525', '5252', '張劭華', '1', '085', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0425773481', '1362', '黃毓茹', '1', '072', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0425822133', '8524', '利欣頤', '1', '033', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0425826213', '3427', '羅翊慈', '1', '073', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0425881988', '5881', '廖珮琳', '1', '024', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0425912019', '6641', '黃珮婷', '1', '086', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0425941881', '8491', '顏啟華', '1', '082', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0426227689', '7689', '蔡文慧', '1', '009', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0426270812', '2180', '江瑞敏', '1', '026', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0426283125', '6283', '呂怡靜', '1', '032', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0426317289', '3172', '呂怡靜', '1', '006', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0426365000', '4263', '紀珮君', '1', '049', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0426367200', '4263', '紀珮君', '1', '012', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0426579955', '7995', '蔡進哲', '1', '007', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0426581919', '5891', '林玟秀', '1', '050', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0426623196', '0953', '陳家聖', '1', '078', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0426715618', '7156', '任苡瑄', '1', '048', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0426765859', '5856', '李麗琴', '1', '043', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0426803511', '8819', '吳曉菁', '1', '025', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0426862288', '8226', '曾世懷', '1', '037', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0426863000', '4268', '李征寰', '1', '047', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0426990005', '9962', '趙冠晴', '1', '029', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0426990552', '5509', '趙文瑛', '1', '030', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0427003618', '2736', '鄭宇晴', '1', '052', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0435077388', '5340', '陳如珊', '1', '042', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0435090317', '0534', '陳品蓉', '1', '039', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0436060666', '0643', '林翊嘉', '1', '054', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0436091518', '5413', '王偉蘋', '1', '074', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0436091549', '4519', '張明毅', '1', '035', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0487627901', '6279', '傅思維', '1', '023', NULL, '2020-09-07 08:15:04', NULL);
INSERT INTO `AccountBase` VALUES ('0606663012', '6066', '李玉茹', '1', '015', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0606664153', '6413', '林怡嘉', '1', '010', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0900177920', '7710', '李岳欣', '1', '040', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('0968555635', '5563', '蔡文傑', '1', '002', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('1422474455', '8819', '林峻宏', '1', '066', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('2422474455', '9476', '陳海藍', '1', '083', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('4256101661', '6101', '蕭懿含', '1', '031', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('4265706001', '6075', '郭怡君', '1', '038', NULL, '2020-09-07 06:47:56', NULL);
INSERT INTO `AccountBase` VALUES ('4265706002', '8080', '郭怡君', '1', '079', NULL, '2020-09-07 06:48:21', NULL);
INSERT INTO `AccountBase` VALUES ('admin', 'seat', 'admin', '3', 'admin', NULL, '2020-09-08 02:04:06', NULL);
INSERT INTO `AccountBase` VALUES ('‎0423309358', '6425', '楊珮', '1', '071', NULL, '2020-09-07 06:47:56', NULL);

-- ----------------------------
-- Table structure for AreaBase
-- ----------------------------
DROP TABLE IF EXISTS `AreaBase`;
CREATE TABLE `AreaBase`  (
  `AreaCode` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '縣市區域碼',
  `AreaName` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '縣市區域名稱',
  `AreaEName` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '縣市區域英文',
  `AreaFName` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '縣市區域全名',
  `AreaFEName` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '縣市區域英文全名',
  `CityCode` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '縣市代碼',
  PRIMARY KEY (`AreaCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '縣市區域碼' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of AreaBase
-- ----------------------------
INSERT INTO `AreaBase` VALUES ('08400', '中 區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08401', '東 區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08402', '南 區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08403', '西 區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08404', '北 區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08406', '北屯區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08407', '西屯區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08408', '南屯區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08411', '太平區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08412', '大里區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08413', '霧峰區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08414', '烏日區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08420', '豐原區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08421', '后里區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08422', '石岡區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08423', '東勢區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08424', '和平區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08426', '新社區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08427', '潭子區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08428', '大雅區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08429', '神岡區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08432', '大肚區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08433', '沙鹿區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08434', '龍井區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08435', '梧棲區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08436', '清水區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08437', '大甲區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08438', '外埔區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('08439', '大安區', NULL, NULL, NULL, '08');
INSERT INTO `AreaBase` VALUES ('09001', '彰化市', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09002', '員林市', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09003', '鹿港鎮', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09004', '和美鎮', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09005', '北斗鎮', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09006', '溪湖鎮', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09007', '田中鎮', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09008', '二林鎮', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09009', '線西鄉', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09010', '伸港鄉', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09011', '福興鄉', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09012', '秀水鄉', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09013', '花壇鄉', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09014', '芬園鄉', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09015', '大村鄉', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09016', '埔鹽鄉', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09017', '埔心鄉', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09018', '永靖鄉', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09019', '社頭鄉', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09020', '二水鄉', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09021', '田尾鄉', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09022', '埤頭鄉', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09023', '芳苑鄉', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09024', '大城鄉', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09025', '竹塘鄉', NULL, NULL, NULL, '09');
INSERT INTO `AreaBase` VALUES ('09026', '溪州鄉', NULL, NULL, NULL, '09');

-- ----------------------------
-- Table structure for AttrBase
-- ----------------------------
DROP TABLE IF EXISTS `AttrBase`;
CREATE TABLE `AttrBase`  (
  `AttrCode` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '屬性代碼',
  `AttrName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '屬性名稱',
  `AttrType` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '1-醫事機構;2-長照機構;3-其他',
  `AttrRem` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '備註',
  PRIMARY KEY (`AttrCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '組織屬性資料檔' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of AttrBase
-- ----------------------------
INSERT INTO `AttrBase` VALUES ('11', '衛生所', '1', NULL);
INSERT INTO `AttrBase` VALUES ('12', '醫院', '1', NULL);
INSERT INTO `AttrBase` VALUES ('13', '護理之家', '1', NULL);
INSERT INTO `AttrBase` VALUES ('14', '居家護理所', '1', NULL);
INSERT INTO `AttrBase` VALUES ('15', '物治所', '1', NULL);
INSERT INTO `AttrBase` VALUES ('16', '職治所', '1', NULL);
INSERT INTO `AttrBase` VALUES ('17', '診所', '1', NULL);
INSERT INTO `AttrBase` VALUES ('18', '藥局', '1', NULL);
INSERT INTO `AttrBase` VALUES ('21', '居家式長照機構', '2', NULL);
INSERT INTO `AttrBase` VALUES ('22', '社區式長照機構', '2', NULL);
INSERT INTO `AttrBase` VALUES ('23', '住宿式長照機構', '2', NULL);
INSERT INTO `AttrBase` VALUES ('24', '綜合式長照機構', '2', NULL);
INSERT INTO `AttrBase` VALUES ('31', '老人福利機構', '3', NULL);
INSERT INTO `AttrBase` VALUES ('32', '身心障礙福利機構', '3', NULL);
INSERT INTO `AttrBase` VALUES ('33', '社團法人', '3', NULL);
INSERT INTO `AttrBase` VALUES ('34', '財團法人', '3', NULL);
INSERT INTO `AttrBase` VALUES ('35', '社會福利團體', '3', NULL);
INSERT INTO `AttrBase` VALUES ('36', '勞動合作社', '3', NULL);
INSERT INTO `AttrBase` VALUES ('37', '其他，請說明', '3', NULL);

-- ----------------------------
-- Table structure for Calendar
-- ----------------------------
DROP TABLE IF EXISTS `Calendar`;
CREATE TABLE `Calendar`  (
  `CALSerialNo` int(11) NOT NULL AUTO_INCREMENT COMMENT '行事曆流水號',
  `CALYear` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '年度',
  `CALDate` date NULL DEFAULT NULL COMMENT '日期',
  `CALType` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '0-一般;H-假日',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT 'CreateDate',
  PRIMARY KEY (`CALSerialNo`) USING BTREE,
  INDEX `AK_Key_2`(`CALDate`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 182 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '行事曆' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Calendar
-- ----------------------------
INSERT INTO `Calendar` VALUES (1, '108', '2019-01-01', 'H', NULL);
INSERT INTO `Calendar` VALUES (2, '108', '2019-01-05', 'H', NULL);
INSERT INTO `Calendar` VALUES (3, '108', '2019-01-06', 'H', NULL);
INSERT INTO `Calendar` VALUES (4, '108', '2019-01-12', 'H', NULL);
INSERT INTO `Calendar` VALUES (5, '108', '2019-01-13', 'H', NULL);
INSERT INTO `Calendar` VALUES (6, '108', '2019-01-20', 'H', NULL);
INSERT INTO `Calendar` VALUES (7, '108', '2019-01-26', 'H', NULL);
INSERT INTO `Calendar` VALUES (8, '108', '2019-01-27', 'H', NULL);
INSERT INTO `Calendar` VALUES (9, '108', '2019-02-02', 'H', NULL);
INSERT INTO `Calendar` VALUES (10, '108', '2019-02-03', 'H', NULL);
INSERT INTO `Calendar` VALUES (11, '108', '2019-02-04', 'H', NULL);
INSERT INTO `Calendar` VALUES (12, '108', '2019-02-05', 'H', NULL);
INSERT INTO `Calendar` VALUES (13, '108', '2019-02-06', 'H', NULL);
INSERT INTO `Calendar` VALUES (14, '108', '2019-02-07', 'H', NULL);
INSERT INTO `Calendar` VALUES (15, '108', '2019-02-08', 'H', NULL);
INSERT INTO `Calendar` VALUES (16, '108', '2019-02-09', 'H', NULL);
INSERT INTO `Calendar` VALUES (17, '108', '2019-02-10', 'H', NULL);
INSERT INTO `Calendar` VALUES (18, '108', '2019-02-16', 'H', NULL);
INSERT INTO `Calendar` VALUES (19, '108', '2019-02-17', 'H', NULL);
INSERT INTO `Calendar` VALUES (20, '108', '2019-02-24', 'H', NULL);
INSERT INTO `Calendar` VALUES (21, '108', '2019-02-28', 'H', NULL);
INSERT INTO `Calendar` VALUES (22, '108', '2019-03-01', 'H', NULL);
INSERT INTO `Calendar` VALUES (23, '108', '2019-03-02', 'H', NULL);
INSERT INTO `Calendar` VALUES (24, '108', '2019-03-03', 'H', NULL);
INSERT INTO `Calendar` VALUES (25, '108', '2019-03-09', 'H', NULL);
INSERT INTO `Calendar` VALUES (26, '108', '2019-03-10', 'H', NULL);
INSERT INTO `Calendar` VALUES (27, '108', '2019-03-16', 'H', NULL);
INSERT INTO `Calendar` VALUES (28, '108', '2019-03-17', 'H', NULL);
INSERT INTO `Calendar` VALUES (29, '108', '2019-03-23', 'H', NULL);
INSERT INTO `Calendar` VALUES (30, '108', '2019-03-24', 'H', NULL);
INSERT INTO `Calendar` VALUES (31, '108', '2019-03-30', 'H', NULL);
INSERT INTO `Calendar` VALUES (32, '108', '2019-03-31', 'H', NULL);
INSERT INTO `Calendar` VALUES (33, '108', '2019-04-04', 'H', NULL);
INSERT INTO `Calendar` VALUES (34, '108', '2019-04-05', 'H', NULL);
INSERT INTO `Calendar` VALUES (35, '108', '2019-04-06', 'H', NULL);
INSERT INTO `Calendar` VALUES (36, '108', '2019-04-07', 'H', NULL);
INSERT INTO `Calendar` VALUES (37, '108', '2019-04-13', 'H', NULL);
INSERT INTO `Calendar` VALUES (38, '108', '2019-04-14', 'H', NULL);
INSERT INTO `Calendar` VALUES (39, '108', '2019-04-20', 'H', NULL);
INSERT INTO `Calendar` VALUES (40, '108', '2019-04-21', 'H', NULL);
INSERT INTO `Calendar` VALUES (41, '108', '2019-04-27', 'H', NULL);
INSERT INTO `Calendar` VALUES (42, '108', '2019-04-28', 'H', NULL);
INSERT INTO `Calendar` VALUES (43, '108', '2019-05-04', 'H', NULL);
INSERT INTO `Calendar` VALUES (44, '108', '2019-05-05', 'H', NULL);
INSERT INTO `Calendar` VALUES (45, '108', '2019-05-11', 'H', NULL);
INSERT INTO `Calendar` VALUES (46, '108', '2019-05-12', 'H', NULL);
INSERT INTO `Calendar` VALUES (47, '108', '2019-05-18', 'H', NULL);
INSERT INTO `Calendar` VALUES (48, '108', '2019-05-19', 'H', NULL);
INSERT INTO `Calendar` VALUES (49, '108', '2019-05-25', 'H', NULL);
INSERT INTO `Calendar` VALUES (50, '108', '2019-05-26', 'H', NULL);
INSERT INTO `Calendar` VALUES (51, '108', '2019-06-01', 'H', NULL);
INSERT INTO `Calendar` VALUES (52, '108', '2019-06-02', 'H', NULL);
INSERT INTO `Calendar` VALUES (53, '108', '2019-06-07', 'H', NULL);
INSERT INTO `Calendar` VALUES (54, '108', '2019-06-08', 'H', NULL);
INSERT INTO `Calendar` VALUES (55, '108', '2019-06-09', 'H', NULL);
INSERT INTO `Calendar` VALUES (56, '108', '2019-06-15', 'H', NULL);
INSERT INTO `Calendar` VALUES (57, '108', '2019-06-16', 'H', NULL);
INSERT INTO `Calendar` VALUES (58, '108', '2019-06-22', 'H', NULL);
INSERT INTO `Calendar` VALUES (59, '108', '2019-06-23', 'H', NULL);
INSERT INTO `Calendar` VALUES (60, '108', '2019-06-29', 'H', NULL);
INSERT INTO `Calendar` VALUES (61, '108', '2019-06-30', 'H', NULL);
INSERT INTO `Calendar` VALUES (62, '108', '2019-07-06', 'H', NULL);
INSERT INTO `Calendar` VALUES (63, '108', '2019-07-07', 'H', NULL);
INSERT INTO `Calendar` VALUES (64, '108', '2019-07-13', 'H', NULL);
INSERT INTO `Calendar` VALUES (65, '108', '2019-07-14', 'H', NULL);
INSERT INTO `Calendar` VALUES (66, '108', '2019-07-20', 'H', NULL);
INSERT INTO `Calendar` VALUES (67, '108', '2019-07-21', 'H', NULL);
INSERT INTO `Calendar` VALUES (68, '108', '2019-07-27', 'H', NULL);
INSERT INTO `Calendar` VALUES (69, '108', '2019-07-28', 'H', NULL);
INSERT INTO `Calendar` VALUES (70, '108', '2019-08-03', 'H', NULL);
INSERT INTO `Calendar` VALUES (71, '108', '2019-08-04', 'H', NULL);
INSERT INTO `Calendar` VALUES (72, '108', '2019-08-10', 'H', NULL);
INSERT INTO `Calendar` VALUES (73, '108', '2019-08-11', 'H', NULL);
INSERT INTO `Calendar` VALUES (74, '108', '2019-08-17', 'H', NULL);
INSERT INTO `Calendar` VALUES (75, '108', '2019-08-18', 'H', NULL);
INSERT INTO `Calendar` VALUES (76, '108', '2019-08-24', 'H', NULL);
INSERT INTO `Calendar` VALUES (77, '108', '2019-08-25', 'H', NULL);
INSERT INTO `Calendar` VALUES (78, '108', '2019-08-31', 'H', NULL);
INSERT INTO `Calendar` VALUES (79, '108', '2019-09-01', 'H', NULL);
INSERT INTO `Calendar` VALUES (80, '108', '2019-09-07', 'H', NULL);
INSERT INTO `Calendar` VALUES (81, '108', '2019-09-08', 'H', NULL);
INSERT INTO `Calendar` VALUES (82, '108', '2019-09-13', 'H', NULL);
INSERT INTO `Calendar` VALUES (83, '108', '2019-09-14', 'H', NULL);
INSERT INTO `Calendar` VALUES (84, '108', '2019-09-15', 'H', NULL);
INSERT INTO `Calendar` VALUES (85, '108', '2019-09-21', 'H', NULL);
INSERT INTO `Calendar` VALUES (86, '108', '2019-09-22', 'H', NULL);
INSERT INTO `Calendar` VALUES (87, '108', '2019-09-28', 'H', NULL);
INSERT INTO `Calendar` VALUES (88, '108', '2019-09-29', 'H', NULL);
INSERT INTO `Calendar` VALUES (89, '108', '2019-10-06', 'H', NULL);
INSERT INTO `Calendar` VALUES (90, '108', '2019-10-10', 'H', NULL);
INSERT INTO `Calendar` VALUES (91, '108', '2019-10-11', 'H', NULL);
INSERT INTO `Calendar` VALUES (92, '108', '2019-10-12', 'H', NULL);
INSERT INTO `Calendar` VALUES (93, '108', '2019-10-13', 'H', NULL);
INSERT INTO `Calendar` VALUES (94, '108', '2019-10-19', 'H', NULL);
INSERT INTO `Calendar` VALUES (95, '108', '2019-10-20', 'H', NULL);
INSERT INTO `Calendar` VALUES (96, '108', '2019-10-26', 'H', NULL);
INSERT INTO `Calendar` VALUES (97, '108', '2019-10-27', 'H', NULL);
INSERT INTO `Calendar` VALUES (98, '108', '2019-11-02', 'H', NULL);
INSERT INTO `Calendar` VALUES (99, '108', '2019-11-03', 'H', NULL);
INSERT INTO `Calendar` VALUES (100, '108', '2019-11-09', 'H', NULL);
INSERT INTO `Calendar` VALUES (101, '108', '2019-11-10', 'H', NULL);
INSERT INTO `Calendar` VALUES (102, '108', '2019-11-16', 'H', NULL);
INSERT INTO `Calendar` VALUES (103, '108', '2019-11-17', 'H', NULL);
INSERT INTO `Calendar` VALUES (104, '108', '2019-11-23', 'H', NULL);
INSERT INTO `Calendar` VALUES (105, '108', '2019-11-24', 'H', NULL);
INSERT INTO `Calendar` VALUES (106, '108', '2019-11-30', 'H', NULL);
INSERT INTO `Calendar` VALUES (107, '108', '2019-12-01', 'H', NULL);
INSERT INTO `Calendar` VALUES (108, '108', '2019-12-07', 'H', NULL);
INSERT INTO `Calendar` VALUES (109, '108', '2019-12-08', 'H', NULL);
INSERT INTO `Calendar` VALUES (110, '108', '2019-12-14', 'H', NULL);
INSERT INTO `Calendar` VALUES (111, '108', '2019-12-15', 'H', NULL);
INSERT INTO `Calendar` VALUES (112, '108', '2019-12-21', 'H', NULL);
INSERT INTO `Calendar` VALUES (113, '108', '2019-12-22', 'H', NULL);
INSERT INTO `Calendar` VALUES (114, '108', '2019-12-28', 'H', NULL);
INSERT INTO `Calendar` VALUES (115, '108', '2019-12-29', 'H', NULL);
INSERT INTO `Calendar` VALUES (116, '109', '2020-01-01', 'H', NULL);
INSERT INTO `Calendar` VALUES (117, '109', '2020-01-04', 'H', NULL);
INSERT INTO `Calendar` VALUES (118, '109', '2020-01-05', 'H', NULL);
INSERT INTO `Calendar` VALUES (119, '109', '2020-01-11', 'H', NULL);
INSERT INTO `Calendar` VALUES (120, '109', '2020-01-12', 'H', NULL);
INSERT INTO `Calendar` VALUES (121, '109', '2020-01-18', 'H', NULL);
INSERT INTO `Calendar` VALUES (122, '109', '2020-01-19', 'H', NULL);
INSERT INTO `Calendar` VALUES (123, '109', '2020-01-23', 'H', NULL);
INSERT INTO `Calendar` VALUES (124, '109', '2020-01-24', 'H', NULL);
INSERT INTO `Calendar` VALUES (125, '109', '2020-01-25', 'H', NULL);
INSERT INTO `Calendar` VALUES (126, '109', '2020-01-26', 'H', NULL);
INSERT INTO `Calendar` VALUES (127, '109', '2020-01-27', 'H', NULL);
INSERT INTO `Calendar` VALUES (128, '109', '2020-01-28', 'H', NULL);
INSERT INTO `Calendar` VALUES (129, '109', '2020-01-29', 'H', NULL);
INSERT INTO `Calendar` VALUES (130, '109', '2020-02-01', 'H', NULL);
INSERT INTO `Calendar` VALUES (131, '109', '2020-02-02', 'H', NULL);
INSERT INTO `Calendar` VALUES (132, '109', '2020-02-08', 'H', NULL);
INSERT INTO `Calendar` VALUES (133, '109', '2020-02-09', 'H', NULL);
INSERT INTO `Calendar` VALUES (134, '109', '2020-02-16', 'H', NULL);
INSERT INTO `Calendar` VALUES (135, '109', '2020-02-22', 'H', NULL);
INSERT INTO `Calendar` VALUES (136, '109', '2020-02-23', 'H', NULL);
INSERT INTO `Calendar` VALUES (137, '109', '2020-02-28', 'H', NULL);
INSERT INTO `Calendar` VALUES (138, '109', '2020-02-29', 'H', NULL);
INSERT INTO `Calendar` VALUES (139, '109', '2020-03-01', 'H', NULL);
INSERT INTO `Calendar` VALUES (140, '109', '2020-03-07', 'H', NULL);
INSERT INTO `Calendar` VALUES (141, '109', '2020-03-08', 'H', NULL);
INSERT INTO `Calendar` VALUES (142, '109', '2020-03-14', 'H', NULL);
INSERT INTO `Calendar` VALUES (143, '109', '2020-03-15', 'H', NULL);
INSERT INTO `Calendar` VALUES (144, '109', '2020-03-21', 'H', NULL);
INSERT INTO `Calendar` VALUES (145, '109', '2020-03-22', 'H', NULL);
INSERT INTO `Calendar` VALUES (146, '109', '2020-03-28', 'H', NULL);
INSERT INTO `Calendar` VALUES (147, '109', '2020-03-29', 'H', NULL);
INSERT INTO `Calendar` VALUES (148, '109', '2020-04-02', 'H', NULL);
INSERT INTO `Calendar` VALUES (149, '109', '2020-04-03', 'H', NULL);
INSERT INTO `Calendar` VALUES (150, '109', '2020-04-04', 'H', NULL);
INSERT INTO `Calendar` VALUES (151, '109', '2020-04-05', 'H', NULL);
INSERT INTO `Calendar` VALUES (152, '109', '2020-04-11', 'H', NULL);
INSERT INTO `Calendar` VALUES (153, '109', '2020-04-12', 'H', NULL);
INSERT INTO `Calendar` VALUES (154, '109', '2020-04-18', 'H', NULL);
INSERT INTO `Calendar` VALUES (155, '109', '2020-04-19', 'H', NULL);
INSERT INTO `Calendar` VALUES (156, '109', '2020-04-25', 'H', NULL);
INSERT INTO `Calendar` VALUES (157, '109', '2020-04-26', 'H', NULL);
INSERT INTO `Calendar` VALUES (158, '109', '2020-05-01', 'H', NULL);
INSERT INTO `Calendar` VALUES (159, '109', '2020-05-02', 'H', NULL);
INSERT INTO `Calendar` VALUES (160, '109', '2020-05-03', 'H', NULL);
INSERT INTO `Calendar` VALUES (161, '109', '2020-05-09', 'H', NULL);
INSERT INTO `Calendar` VALUES (162, '109', '2020-05-10', 'H', NULL);
INSERT INTO `Calendar` VALUES (163, '109', '2020-05-16', 'H', NULL);
INSERT INTO `Calendar` VALUES (164, '109', '2020-05-17', 'H', NULL);
INSERT INTO `Calendar` VALUES (165, '109', '2020-05-23', 'H', NULL);
INSERT INTO `Calendar` VALUES (166, '109', '2020-05-24', 'H', NULL);
INSERT INTO `Calendar` VALUES (167, '109', '2020-05-30', 'H', NULL);
INSERT INTO `Calendar` VALUES (168, '109', '2020-05-31', 'H', NULL);
INSERT INTO `Calendar` VALUES (169, '109', '2020-06-06', 'H', NULL);
INSERT INTO `Calendar` VALUES (170, '109', '2020-06-07', 'H', NULL);
INSERT INTO `Calendar` VALUES (171, '109', '2020-06-13', 'H', NULL);
INSERT INTO `Calendar` VALUES (172, '109', '2020-06-13', 'H', NULL);
INSERT INTO `Calendar` VALUES (174, '109', '2020-06-14', 'H', NULL);
INSERT INTO `Calendar` VALUES (175, '109', '2020-06-21', 'H', NULL);
INSERT INTO `Calendar` VALUES (176, '109', '2020-06-25', 'H', NULL);
INSERT INTO `Calendar` VALUES (180, '109', '2020-06-26', 'H', NULL);
INSERT INTO `Calendar` VALUES (181, '109', '2020-06-27', 'H', NULL);

-- ----------------------------
-- Table structure for CaseSvr
-- ----------------------------
DROP TABLE IF EXISTS `CaseSvr`;
CREATE TABLE `CaseSvr`  (
  `Year` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '年度',
  `INSTNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '機構代碼',
  `YM` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '年月',
  `OldCaseNum` smallint(6) NULL DEFAULT NULL COMMENT '舊案量(AA01)',
  `TraceCaseTotal` smallint(6) NULL DEFAULT NULL COMMENT '持續追蹤量(AA02)',
  `MultSvrCaseNum` smallint(6) NULL DEFAULT NULL COMMENT '多元服務個案數',
  `SelfReferral` smallint(6) NULL DEFAULT NULL COMMENT '自行轉介個案數',
  `FullPeoNum` smallint(6) NULL DEFAULT NULL COMMENT '個管人員數量(專)',
  `PartPeoNum` smallint(6) NULL DEFAULT NULL COMMENT '個管人員數量(兼)',
  `CreateDate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'CreateDate',
  `Svr01CaseReNum` smallint(6) NULL DEFAULT NULL COMMENT '新案複評量',
  `Svr02CaseReNum` smallint(6) NULL DEFAULT NULL COMMENT '訪案計畫變更案量',
  `Svr03CaseReNum` smallint(6) NULL DEFAULT NULL COMMENT '第一次達B單位舊案量',
  `CMDCCntMonth` decimal(4, 1) NULL DEFAULT NULL COMMENT '平均每位個管員每月服務量',
  PRIMARY KEY (`Year`, `INSTNO`, `YM`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '個案服務統計' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of CaseSvr
-- ----------------------------
INSERT INTO `CaseSvr` VALUES ('109', '041', '10810', 3, 5, 10, 10, 20, 5, '2020-09-08 00:00:00', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for CaseSvrEff
-- ----------------------------
DROP TABLE IF EXISTS `CaseSvrEff`;
CREATE TABLE `CaseSvrEff`  (
  `Year` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '年度',
  `INSTNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '機構代碼',
  `YM` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '年月',
  `SvrType` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '01:新案;02-訪案及擬定天數;03-ToB第一次服務天數',
  `CaseNum` smallint(6) NULL DEFAULT NULL COMMENT '案量',
  `CaseDays` smallint(6) NULL DEFAULT NULL COMMENT '總天數',
  `CaseUpNum` smallint(6) NULL DEFAULT NULL COMMENT '達標案量',
  `CaseUpDays` smallint(6) NULL DEFAULT NULL COMMENT '達標總天數',
  `UpAvgDays` decimal(8, 4) NULL DEFAULT NULL COMMENT '達標平均天數',
  `UpCasePer` decimal(8, 4) NULL DEFAULT NULL COMMENT '達標完成率',
  `CreateDate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'CreateDate',
  PRIMARY KEY (`Year`, `INSTNO`, `YM`, `SvrType`) USING BTREE,
  CONSTRAINT `FK_CASESVRE_REFERENCE_UNITAYEA` FOREIGN KEY (`Year`, `INSTNO`) REFERENCES `UnitAYear` (`Year`, `INSTNO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '個案管理時效' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for CaseSvrRec
-- ----------------------------
DROP TABLE IF EXISTS `CaseSvrRec`;
CREATE TABLE `CaseSvrRec`  (
  `Year` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '年度',
  `INSTNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '機構代碼',
  `CaseSerNo` smallint(6) NOT NULL COMMENT '個案序號',
  `CaseNo` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '個案代號',
  `StartDate` date NULL DEFAULT NULL COMMENT '新案評估日',
  `SignDate` date NULL DEFAULT NULL COMMENT '照專員簽審日期',
  `CFDate` date NULL DEFAULT NULL COMMENT '督導簽審完成日',
  `AToBDate` date NULL DEFAULT NULL COMMENT '新案照會B單位',
  `FirstSvrDate` date NULL DEFAULT NULL COMMENT '第一次服務日',
  `CreateDate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'CreateDate',
  PRIMARY KEY (`Year`, `INSTNO`, `CaseSerNo`) USING BTREE,
  CONSTRAINT `FK_CASESVRR_REFERENCE_UNITAYEA` FOREIGN KEY (`Year`, `INSTNO`) REFERENCES `UnitAYear` (`Year`, `INSTNO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '個案服務資料' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of CaseSvrRec
-- ----------------------------
INSERT INTO `CaseSvrRec` VALUES ('109', '041', 1, '108S10001', '2019-01-01', '2019-01-03', '2019-01-05', '2019-01-06', '2019-01-08', '2020-09-08 00:00:00');

-- ----------------------------
-- Table structure for CityBase
-- ----------------------------
DROP TABLE IF EXISTS `CityBase`;
CREATE TABLE `CityBase`  (
  `CityCode` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '縣市代碼',
  `CityName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '縣市名稱',
  `CityEName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '縣市英文名',
  PRIMARY KEY (`CityCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '縣市代碼檔' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of CityBase
-- ----------------------------
INSERT INTO `CityBase` VALUES ('01', '基隆市', NULL);
INSERT INTO `CityBase` VALUES ('02', '臺北市', NULL);
INSERT INTO `CityBase` VALUES ('03', '新北市', NULL);
INSERT INTO `CityBase` VALUES ('04', '桃園縣', NULL);
INSERT INTO `CityBase` VALUES ('05', '新竹市', NULL);
INSERT INTO `CityBase` VALUES ('06', '新竹縣', NULL);
INSERT INTO `CityBase` VALUES ('07', '苗栗縣', NULL);
INSERT INTO `CityBase` VALUES ('08', '臺中市', NULL);
INSERT INTO `CityBase` VALUES ('09', '彰化縣', NULL);
INSERT INTO `CityBase` VALUES ('10', '南投縣', NULL);
INSERT INTO `CityBase` VALUES ('11', '雲林縣', NULL);
INSERT INTO `CityBase` VALUES ('12', '嘉義市', NULL);
INSERT INTO `CityBase` VALUES ('13', '嘉義縣', NULL);
INSERT INTO `CityBase` VALUES ('14', '臺南市', NULL);
INSERT INTO `CityBase` VALUES ('15', '高雄市', NULL);
INSERT INTO `CityBase` VALUES ('16', '屏東縣', NULL);
INSERT INTO `CityBase` VALUES ('17', '臺東縣', NULL);
INSERT INTO `CityBase` VALUES ('18', '花蓮縣', NULL);
INSERT INTO `CityBase` VALUES ('19', '宜蘭縣', NULL);
INSERT INTO `CityBase` VALUES ('20', '澎湖縣', NULL);
INSERT INTO `CityBase` VALUES ('21', '金門縣', NULL);
INSERT INTO `CityBase` VALUES ('22', '連江縣', NULL);

-- ----------------------------
-- Table structure for CodeBase
-- ----------------------------
DROP TABLE IF EXISTS `CodeBase`;
CREATE TABLE `CodeBase`  (
  `CodeTable` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '資料表名稱',
  `CodeField` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '欄位名稱',
  `CodeValue` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '欄位值',
  `CodeText` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '欄位說明',
  PRIMARY KEY (`CodeTable`, `CodeField`, `CodeValue`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代碼資料檔' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of CodeBase
-- ----------------------------
INSERT INTO `CodeBase` VALUES ('AccountBase', 'AccountType', '1', '評鑑單位');
INSERT INTO `CodeBase` VALUES ('AccountBase', 'AccountType', '2', '委員');
INSERT INTO `CodeBase` VALUES ('AccountBase', 'AccountType', '9', '管理者');
INSERT INTO `CodeBase` VALUES ('CaseSvrEFF', 'SvrType', '01', '照管中心評估後轉A平均天數');
INSERT INTO `CodeBase` VALUES ('CaseSvrEFF', 'SvrType', '02', '訪案及(評估)計畫擬定四天內完成率(%)');
INSERT INTO `CodeBase` VALUES ('CaseSvrEFF', 'SvrType', '03', '照會服務單位後第一次服務在五天內服務輸送到達的完成率');
INSERT INTO `CodeBase` VALUES ('HRAlloc', 'JobType', '1', '個管人員');
INSERT INTO `CodeBase` VALUES ('HRAlloc', 'JobType', '2', '行政人員');
INSERT INTO `CodeBase` VALUES ('HRAlloc', 'ProfBack', '1', '醫師');
INSERT INTO `CodeBase` VALUES ('HRAlloc', 'ProfBack', '2', '護理師');
INSERT INTO `CodeBase` VALUES ('HRAlloc', 'ProfBack', '3', '職能治療師');
INSERT INTO `CodeBase` VALUES ('HRAlloc', 'ProfBack', '4', '物理治療師');
INSERT INTO `CodeBase` VALUES ('HRAlloc', 'ProfBack', '5', '營養師');
INSERT INTO `CodeBase` VALUES ('HRAlloc', 'ProfBack', '6', '其他醫事人員');
INSERT INTO `CodeBase` VALUES ('HRAlloc', 'ProfBack', '7', '社會工作師/員');
INSERT INTO `CodeBase` VALUES ('HRAlloc', 'ProfBack', '8', '照顧服務員');
INSERT INTO `CodeBase` VALUES ('HRAlloc', 'ProfBack', '9', '其他');
INSERT INTO `CodeBase` VALUES ('UnitAMeeting', 'MType', '1', '社區資源網絡會議');
INSERT INTO `CodeBase` VALUES ('UnitAMeeting', 'MType', '2', '區域跨專業個案討論會');
INSERT INTO `CodeBase` VALUES ('UnitAtoBSum', 'LCareType', '001', '居家服務');
INSERT INTO `CodeBase` VALUES ('UnitAtoBSum', 'LCareType', '002', '日間照顧');
INSERT INTO `CodeBase` VALUES ('UnitAtoBSum', 'LCareType', '003', '家庭托顧');
INSERT INTO `CodeBase` VALUES ('UnitAtoBSum', 'LCareType', '004', '小規模多機能');
INSERT INTO `CodeBase` VALUES ('UnitAtoBSum', 'LCareType', '005', '輔具或無障礙環境');
INSERT INTO `CodeBase` VALUES ('UnitAtoBSum', 'LCareType', '006', '交通接送');
INSERT INTO `CodeBase` VALUES ('UnitAtoBSum', 'LCareType', '007', '餐飲服務');
INSERT INTO `CodeBase` VALUES ('UnitAtoBSum', 'LCareType', '008', '專業服務(C碼)');
INSERT INTO `CodeBase` VALUES ('UnitAtoBSum', 'LCareType', '009', '居家喘息');
INSERT INTO `CodeBase` VALUES ('UnitAtoBSum', 'LCareType', '010', '社區喘息');
INSERT INTO `CodeBase` VALUES ('UnitAtoBSum', 'LCareType', '011', '機構喘息');
INSERT INTO `CodeBase` VALUES ('UnitAtoBSum', 'LCareType', '012', '在宅沐浴車');
INSERT INTO `CodeBase` VALUES ('UnitAtoBSum', 'LCareType', '013', '失智共照中心');
INSERT INTO `CodeBase` VALUES ('UnitAtoBSum', 'LCareType', '014', '失智據點');
INSERT INTO `CodeBase` VALUES ('UnitAtoBSum', 'LCareType', '015', '家庭照顧據點');
INSERT INTO `CodeBase` VALUES ('UnitAtoBSum', 'LCareType', '016', '在宅醫療');
INSERT INTO `CodeBase` VALUES ('UnitAtoBSum', 'LCareType', '017', '巷弄長照站');
INSERT INTO `CodeBase` VALUES ('UnitAtoBSum', 'LCareType', '018', '團體家屋');
INSERT INTO `CodeBase` VALUES ('UnitAtoBSum', 'LCareType', '019', '居家護理');
INSERT INTO `CodeBase` VALUES ('UnitAtoBSum', 'LCareType', '020', '住宿型機構');
INSERT INTO `CodeBase` VALUES ('UnitAtoBSum', 'LCareType', '999', '其他');

-- ----------------------------
-- Table structure for CommINSTYear
-- ----------------------------
DROP TABLE IF EXISTS `CommINSTYear`;
CREATE TABLE `CommINSTYear`  (
  `Year` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '年度',
  `INSTNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '機構代碼',
  `ACommNo` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '專業委員',
  `BCommNo` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '行政委員',
  `EvalDate` date NULL DEFAULT NULL COMMENT '評鑑日期',
  `EvalPeriod` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'AM-上午;PM-下午',
  `COMMTel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '委員電話',
  PRIMARY KEY (`Year`, `INSTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '年度委員評鑑機構' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for CommitteeBase
-- ----------------------------
DROP TABLE IF EXISTS `CommitteeBase`;
CREATE TABLE `CommitteeBase`  (
  `COMMNO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '委員代號',
  `COMMName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '委員姓名',
  `COMMType` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '委員類別',
  `CityCode` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '委員地址縣市碼',
  `AreaCode` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '委員地址區域碼',
  `COMMAddress` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '委員地址',
  `COMMTel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '委員電話',
  PRIMARY KEY (`COMMNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '委員基本資料' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of CommitteeBase
-- ----------------------------
INSERT INTO `CommitteeBase` VALUES ('102', '測試委員', '測試', '08', '08407', '測試地址', '04-2315-2511');

-- ----------------------------
-- Table structure for HRAlloc
-- ----------------------------
DROP TABLE IF EXISTS `HRAlloc`;
CREATE TABLE `HRAlloc`  (
  `Year` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '年度',
  `INSTNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '機構代碼',
  `HRAllocSerNo` smallint(6) NOT NULL COMMENT '人力配置流水號',
  `JobType` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '人員類別',
  `PROBG` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '專業背景',
  `FullTimeNum` int(11) NULL DEFAULT NULL COMMENT '專任人數',
  `PartTimeNum` int(11) NULL DEFAULT NULL COMMENT '兼任人數',
  `FullAtth` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '專任附檔',
  `PartAtth` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '兼任附件',
  `CreateDate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'CreateDate',
  `Modifydate` datetime(0) NULL DEFAULT NULL COMMENT 'Modifydate',
  PRIMARY KEY (`Year`, `INSTNO`, `HRAllocSerNo`) USING BTREE,
  CONSTRAINT `FK_HRALLOC_REFERENCE_UNITAYEA` FOREIGN KEY (`Year`, `INSTNO`) REFERENCES `UnitAYear` (`Year`, `INSTNO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '人力配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for INSTBase
-- ----------------------------
DROP TABLE IF EXISTS `INSTBase`;
CREATE TABLE `INSTBase`  (
  `INSTNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '機構代碼',
  `INSTName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '機構名稱',
  `CityCode` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '縣市碼',
  `AreaCode` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '縣市區域碼',
  `INSTAddress` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `INSTTel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '電話',
  `IncDate` date NULL DEFAULT NULL COMMENT '成立日期',
  `AttrMed` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '醫事機構屬性',
  `AttrLC` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '長照機構屬性',
  `AttrOther` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其他屬性',
  PRIMARY KEY (`INSTNO`) USING BTREE,
  INDEX `FK_INSTBASE_REFERENCE_AREABASE`(`AreaCode`) USING BTREE,
  CONSTRAINT `FK_INSTBASE_REFERENCE_AREABASE` FOREIGN KEY (`AreaCode`) REFERENCES `AreaBase` (`AreaCode`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '機構基本資料' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of INSTBase
-- ----------------------------
INSERT INTO `INSTBase` VALUES ('001', '臺中市私立樂銀居家長照機構', '08', '08401', '臺中市東 區富台里富台東街46號4樓之1 ', '04-22111154', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('002', '社團法人臺中市秀老郎公益服務協會', '08', '08401', '臺中市東 區振興里4鄰大公街57號', '0968-555635', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('003', '有限責任臺中市橋僾照顧服務勞動合作社私立橋僾居家長照機構', '08', '08401', '臺中市東 區十甲路35巷4弄8號', '04-22113361', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('004', '美安居家護理所', '08', '08411', '臺中市太平區勤益里中山路1段158號1樓', '04-22795617', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('005', '福碩護理之家', '08', '08414', '臺中市烏日區烏日里公園路242-1號', '04-23386608\n04-23387328', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('006', '財團法人中華民國佛教慈濟慈善事業基金會(沙鹿區)', '08', '08433', '臺中市沙鹿區美仁里鎮南路二段472號', '04-26317289', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('007', '仁美護理之家', '08', '08435', '臺中市梧棲區仁美街33巷48號', '0982-732605', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('008', '財團法人臺中市私立康家社會福利慈善基金會附設臺中市私立康美居家是服務類長期照顧服務機構', '08', '08421', '臺中市后里區墩西里富春路53巷10號2樓', '04-26883559/04-25583360', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('009', '仁惠護理之家', '08', '08436', '臺中市清水區橋頭里鎮新二街105號', '04-26227689', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('010', '佛教慈濟醫療財團法人台中慈濟醫院', '08', '08427', '臺中市潭子區豐興路一段88號', '04-36060666#4153', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('011', '臺中市私立愛老郎老人長期照顧中心(養護型)', '08', '08420', '臺中市豐原區東湳里三豐路二段396巷69號', '04-25293499', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('012', '光田醫療社團法人光田綜合醫院(龍井區)', '08', '08434', '臺中市龍井區山腳里22鄰沙田路六段211號2樓', '04-26367200', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('013', '臺中市私立杏恩居家長照機構', '08', '08404', '臺中市北 區邱厝里大義街9號1樓', '04-22356000', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('014', '鈺善園護理之家', '08', '08404', '臺中市北 區華中街30號', '04-22018698', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('015', '佛教慈濟醫療財團法人附設台中慈濟護理之家(西屯區)', '08', '08407', '臺中市西屯區安和路103號', '04-36060666#3012', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('016', '社團法人台中市物理治療師公會', '08', '08403', '臺中市西 區民生里22鄰法院前街15號4樓之1', '04-22220329', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('017', '財團法人伊甸社會福利基金會附設臺中市私立臺中居家式服務類長期照顧服務機構', '08', '08412', '臺中市大里區大元里10鄰中興路二段48號2樓', '04-24870030', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('018', '祥和長照服務有限公司私立祥和居家長照機構', '08', '08402', '臺中市南區大慶街2段11-63巷3弄20號1樓', '04-22658099\n04-22658079', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('019', '社團法人台灣健康整合服務協會', '08', '08406', '臺中市北屯區松安里松竹路二段227號', '04-22432683', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('020', '專業居家護理所', '08', '08406', '臺中市北屯區軍功里軍和街39號1樓', '04-24368221', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('021', '社團法人臺中市大恆樂齡協會', '08', '08408', '臺中市南屯區文昌街226巷46號', '04-23802117', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('022', '財團法人臺中市私立豐盛社會福利慈善事業基金會', '08', '08408', '臺中市南屯區楓樹里楓和路701號', '04-24792569', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('023', '維恩耳鼻喉科診所', '08', '08423', '臺中市東勢區延平里豐勢路374號', '0978-762790', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('024', '財團法人中華民國佛教慈濟慈善事業基金會(東勢區)', '08', '08423', '臺中市東勢區北興里三民街199號', '04-25881988', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('025', '財團法人臺灣省私立永信社會福利基金會', '08', '08437', '臺中市大甲區水源路167號2樓', '04-26803511', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('026', '財團法人臺灣省私立永信社會福利基金會', '08', '08436', '臺中市清水區鎮政路99巷10號', '04-26270812', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('027', '社團法人臺中市紅十字會附設居家長照機構', '08', '08400', '臺中市中 區綠川里綠川西街145號7樓', '04-22222411', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('028', '財團法人全成社會福利基金會', '08', '08408', '臺中市南屯區忠勇路23-12號2樓', '04-23890243', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('029', '真善美復能物理治療所', '08', '08432', '臺中市大肚區大東里自由路218號', '04-26990005', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('030', '臺中市好伴照顧協會', '08', '08432', '臺中市大肚區大肚里13鄰紙廠路53號', '04-26990552', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('031', '社團法人臺中市大大人長期照顧關懷協會私立居家長照機構(清水區)', '08', '08436', '臺中市清水區中華路327號', '04-25610166', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('032', '財團法人中華民國佛教慈濟慈善事業基金會(清水區)', '08', '08436', '臺中市清水區秀水里13鄰五權路267號', '04-26283125', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('033', '財團法人老五老基金會', '08', '08422', '臺中市石岡區梅子里8鄰豐勢路503之1號', '04-25822133', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('034', '臺中市私立有春居家式服務類長期照顧服務機構', '08', '08420', '臺中市豐原區中山路220-5號', '04-25156292', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('035', '倚飛科技有限公司附設臺中市私立天心居家長照機構', '08', '08407', '臺中市西屯區何德里大信街60號6樓之3', '04-36091549', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('036', '臺中榮民總醫院', '08', '08407', '臺中市西屯區台灣大道四段1650號', '04-23592525#6011.8199.8198', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('037', '李綜合醫療社團法人大甲李綜合醫院', '08', '08437', '臺中市大甲區平安里11鄰八德街2號', '04-26862288', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('038', '社團法人台灣福氣社區關懷協會', '08', '08436', '臺中市清水區清水里10鄰中山路66號', '04-26570600', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('039', '翔新診所', '08', '08411', '臺中市太平區立德街10巷17號', '04-35090317\n04-22153133', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('040', '瞳馨居家護理所', '08', '08411', '臺中市太平區光明里9鄰大興11街125巷29號1樓', '0900-177920', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('041', '社團法人台中市社會關懷服務協會私立活力勇居家長照機構', '08', '08401', '臺中市東 區雙十路一段4-33號9樓之3', '04-22126765', '3891-12-15', '11', NULL, NULL);
INSERT INTO `INSTBase` VALUES ('042', '美家人力資源股份有限公司附設私立樂齡居家長照機構', '08', '08401', '臺中市東 區三賢街166號', '04-35077388#302', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('043', '私立長照好幫手居家長照機構', '08', '08438', '臺中市外埔區甲后路五段128巷66號3樓之1', '04-26765859', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('044', '臺中市私立妙純居家式服務類長期照顧服務機構', '08', '08429', '臺中市神岡區大社里大漢街31巷16弄23號', '04-25295729', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('045', '維弘復健科診所', '08', '08428', '臺中市大雅區大雅里民興街63號', '04-25681919', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('046', '財團法人台中市私立龍眼社會福利慈善事業基金會附設私立龍眼林居家長照機構', '08', '08428', '臺中市大雅區民權街147號', '04-25682195', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('047', '仁馨護理之家', '08', '08437', '臺中市大甲區奉化里011鄰經國路789號', '04-26863000#6121、6122', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('048', '高銘診所', '08', '08439', '臺中市大安區中山南路249號', '04-26715618', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('049', '光田醫療社團法人光田綜合醫院(沙鹿區)  ', '08', '08433', '臺中市沙鹿區大同街5-2號', '04-26365000轉2151或2152', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('050', '童綜合醫療社團法人童綜合醫院', '08', '08435', '臺中市梧棲區文華街28巷131號', '04-26581919#4410', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('051', '財團法人台中市私立甘霖社會福利慈善事業基金會', '08', '08400', '臺中市中 區柳川里柳川東路三段5號2樓之1', '04-22207818', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('052', '社團法人台灣福氣社區關懷協會(西屯區)', '08', '08407', '臺中市西屯區逢甲路253巷47號', '04-27003618', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('053', '真善美居家護理所', '08', '08412', '臺中市大里區金城里35鄰成功路51巷16弄1號1樓', '04-24915128', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('054', '佛教慈濟醫療財團法人附設台中慈濟護理之家(潭子區)', '08', '08427', '臺中市潭子區豐興路一段66號', '04-36060666#8080', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('055', '芳林樂活事業有限公司附設私立芳林居家長照機構', '08', '08420', '臺中市豐原區社皮里豐原大道一段291號一樓', '04-25263858\n04-25263958', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('056', '財團法人臺中市私立童庭社會福利慈善事業基金會', '08', '08414', '臺中市烏日區九德里20鄰長春街373巷52號', '04-23360996', '2020-09-07', '11', NULL, NULL);
INSERT INTO `INSTBase` VALUES ('057', '社團法人中華仁仁關懷協會', '08', '08414', '臺中市烏日區烏日里5鄰公園路168號', '04-23378067', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('058', '衛生福利部臺中醫院', '08', '08403', '臺中市西 區三民路一段199號', '0422294411#6220.6221', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('059', '龍井新庄藥局', '08', '08403', '臺中市西 區模範街34巷10號', '04-22855011', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('060', '財團法人天主教曉明社會福利基金會', '08', '08404', '臺中市北 區漢口路四段21號', '04-22974225', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('061', '財團法人台中市私立真愛社會福利慈善事業基金會', '08', '08404', '臺中市北 區永興街338號', '04-22380563', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('062', '春暉居家護理所', '08', '08406', '臺中市北屯區太原路3段161號3樓之6', '04-22378557', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('063', '財團法人老五老基金會', '08', '08406', '臺中市北屯區天津路四段27號', '04-22370006', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('064', '臺中市私立林燕玲居家式服務類長期照顧服務機構', '08', '08420', '臺中市豐原區田心里育仁路186號', '04-25254607', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('065', '社團法人臺中市大大人長期照護關懷協會', '08', '08429', '臺中市神岡區庄前里三民南路6號', '04-25610166', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('066', '好樂齡銀髮事業有限公司附設臺中市私立顧老照居家式服務類長期照顧服務機構', '08', '08406', '臺中市北屯區平田里文心路四段955號4樓之4', '04-22474455', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('067', '臺中市私立天德居家式服務類長期照顧服務機構', '08', '08406', '臺中市北屯區平福里安順東七街55號', '04-22475923', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('068', '財團法人弘道老人福利基金會附設臺中市私立弘道第一區居家式服務類長期照顧服務機構', '08', '08407', '臺中市西屯區中工三路199號2樓', '04-23505555', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('069', '財團法人中華民國佛教慈濟慈善事業基金會(南屯區)', '08', '08408', '臺中市南屯區文心南路113號', '04-24739090', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('070', '本堂澄清醫院附設護理之家', '08', '08413', '臺中市霧峰區本堂里22鄰育成路28號', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('071', '健民健康有限公司附設私立阿罩霧A埕居家長照機構', '08', '08413', '臺中市霧峰區萬豐里17鄰中正路146之8號', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('072', '小太陽藥局', '08', '08423', '臺中市東勢區豐勢路412之1、416號1樓', '04-25773481', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('073', '洪幸雪居家護理所', '08', '08426', '臺中市新社區興社街二段17-6號3樓', '04-25826213', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('074', '財團法人弘道老人福利基金會附設臺中市私立弘道第二區居家式服務類長期照顧服務機構', '08', '08412', '臺中市大里區瑞城里成功路520號2樓', '04-36091518#27', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('075', '仁愛醫療財團法人大里仁愛醫院', '08', '08412', '臺中市大里區東榮路483號', '04-24819900#55306.55307', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('076', '健康居家護理所', '08', '08406', '臺中市北屯區三和里1鄰東山路一段50巷97號1樓', '04-24374149', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('077', '明康居家護理所', '08', '08406', '臺中市北屯區平合里綏遠路二段209號', '04-22476877', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('078', '財團法人臺中市私立家寶社會福利慈善事業基金會附設私立居家長照機構', '08', '08433', '臺中市沙鹿區鹿寮里成功西街33號2F', '04-26623196', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('079', '社團法人台灣福氣社區關懷協會', '08', '08435', '臺中市梧棲區大仁路二段349號', '04-26570600', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('080', '大慶居家護理所', '08', '08402', '臺中市南區五權南路326號1-2樓', '04-22655948\n04-22658453', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('081', '臺中市私立香柏木居家式服務類長期照顧服務機構', '08', '08414', '臺中市烏日區湖日里榮泰街163巷2號1樓', '0900-790166', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('082', '中山醫學大學附設醫院', '08', '08424', '臺中市和平區南勢里10鄰東關路三段161之2號', '04-25941881', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('083', '臺中市私立康復醫學居家長照機構', '08', '08424', '臺中市和平區南勢里崑崙巷4號', '0989-434736', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('085', '財團法人中華基督教福音信義傳道會', '08', '08423', '臺中市東勢區中興街43號', '04-25772525', NULL, NULL, NULL, NULL);
INSERT INTO `INSTBase` VALUES ('086', '有限責任臺灣伯拉罕共生照顧勞動合作社私立伯拉罕居家長照機構', '08', '08424', '臺中市和平區達觀里東崎路一段育英巷17-5號1樓', '04-25912019', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for INSTCARD
-- ----------------------------
DROP TABLE IF EXISTS `INSTCARD`;
CREATE TABLE `INSTCARD`  (
  `評鑑序號` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `服務單位區` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `服務單位名稱` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `單位帳號` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `單位密碼` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `服務單位服務電話` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `系統管理人` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `聯絡電話` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `電子信箱` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `評鑑日期` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `評鑑時段` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `星期幾` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `行政委員` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `服務委員` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of INSTCARD
-- ----------------------------
INSERT INTO `INSTCARD` VALUES ('001', '東 區', '臺中市私立樂銀居家長照機構', '0422111154', '1154', '04-22111154', '吳虹諭', '0932-530838', 'lovein292305@gmail.com', '9月21日', '上午9時', '一', '洪錦墩', '吳秀鳳');
INSERT INTO `INSTCARD` VALUES ('002', '東 區', '社團法人臺中市秀老郎公益服務協會', '0968555635', '5563', '0968-555635', '蔡文傑', '0925-536535', 'showold999@gmail.com', '9月21日', '下午2時', '一', '洪錦墩', '吳秀鳳');
INSERT INTO `INSTCARD` VALUES ('003', '東 區', '有限責任臺中市橋僾照顧服務勞動合作社私立橋僾居家長照機構', '0422113361', '1133', '04-22113361', '宋安琪', '0928-795913', 'angel0923angel@gmail.com', '9月23日', '上午9時', '三', '吳曉君', '簡慧雯');
INSERT INTO `INSTCARD` VALUES ('004', '太平區', '美安居家護理所', '0422795617', '2279', '04-22795617', '田宜欣', '04-22795617\n0906-812448', 'ethan66tien@gmail.com', '9月25日', '上午9時', '五', '孫彰良', '簡慧雯');
INSERT INTO `INSTCARD` VALUES ('005', '烏日區', '福碩護理之家', '0423387328', '4233', '04-23386608\n04-23387328', '黃馨平', '04-23387328', 'v620234@gmail.com', '9月25日', '下午2時', '五', '孫彰良', '簡慧雯');
INSERT INTO `INSTCARD` VALUES ('006', '沙鹿區', '財團法人中華民國佛教慈濟慈善事業基金會(沙鹿區)', '0426317289', '3172', '04-26317289', '呂怡靜', '04-26317289/0980447458', 'ltc000231@tzuchi.org.tw', '9月28日', '上午9時', '一', '洪錦墩', '胡月娟');
INSERT INTO `INSTCARD` VALUES ('007', '梧棲區', '仁美護理之家', '0426579955', '7995', '0982-732605', '蔡進哲', '04-26918054', 'jmei9955@gmail.com', '9月28日', '下午2時', '一', '洪錦墩', '胡月娟');
INSERT INTO `INSTCARD` VALUES ('008', '后里區', '財團法人臺中市私立康家社會福利慈善基金會附設臺中市私立康美居家是服務類長期照顧服務機構', '0425583360', '5833', '04-26883559/04-25583360', '吳彥岑', '04-25583360/0966-650879', 'Kangmei2018@gmail.com', '9月28日', '上午9時', '一', '孫彰良', '曾月霞');
INSERT INTO `INSTCARD` VALUES ('009', '清水區', '仁惠護理之家', '0426227689', '7689', '04-26227689', '蔡文慧', '04-26227689', 'rhhome2005@gmail.com', '9月28日', '下午2時', '一', '孫彰良', '曾月霞');
INSERT INTO `INSTCARD` VALUES ('010', '潭子區', '佛教慈濟醫療財團法人台中慈濟醫院', '0606664153', '6413', '04-36060666#4153', '林怡嘉', '04-36060666#4153', 'yichia@tzuchi.com.tw', '9月28日', '上午9時', '一', '賴添福', '郭雅雯');
INSERT INTO `INSTCARD` VALUES ('011', '豐原區', '臺中市私立愛老郎老人長期照顧中心(養護型)', '0425293499', '9349', '04-25293499', '許菊芬', '04-25293499', 'love25293499@hotmail.com.tw', '9月28日', '下午2時', '一', '賴添福', '郭雅雯');
INSERT INTO `INSTCARD` VALUES ('012', '龍井區', '光田醫療社團法人光田綜合醫院(龍井區)', '0426367200', '4263', '04-26367200', '紀珮君', '04-26367200', 'peggy660217@yahoo.com.tw', '9月30日', '上午9時', '三', '紀彣宙', '簡慧雯');
INSERT INTO `INSTCARD` VALUES ('013', '北 區', '臺中市私立杏恩居家長照機構', '0422356000', '2235', '04-22356000', '張鈞淳', '04-22356000\n0975493482', 'simann10803@gmail.com', '10月5日', '上午9時', '一', '徐明仿', '胡月娟');
INSERT INTO `INSTCARD` VALUES ('014', '北 區', '鈺善園護理之家', '0422018698', '1869', '04-22018698', '凌家如', '0920-038547', 'lingchiaju@gmail.com', '10月5日', '下午2時', '一', '徐明仿', '胡月娟');
INSERT INTO `INSTCARD` VALUES ('015', '西屯區', '佛教慈濟醫療財團法人附設台中慈濟護理之家(西屯區)', '0606663012', '6066', '04-36060666#3012', '李玉茹', '04-36060666#3539\n0970352378', 'tc209270@tzuchi.com.tw', '10月5日', '上午9時', '一', '陳世堅', '曾月霞');
INSERT INTO `INSTCARD` VALUES ('016', '西 區', '社團法人台中市物理治療師公會', '0422220329', '2032', '04-22220329', '巫秀珍', '0926-312320', 'taichungpt.longcare@gmail.com', '10月5日', '下午2時', '一', '陳世堅', '曾月霞');
INSERT INTO `INSTCARD` VALUES ('017', '大里區', '財團法人伊甸社會福利基金會附設臺中市私立臺中居家式服務類長期照顧服務機構', '0424870030', '4870', '04-24870030', '李家豪', '04-24870030#214', 'eden6138@eden.org.tw', '10月5日', '上午9時', '一', '賴添福', '郭雅雯');
INSERT INTO `INSTCARD` VALUES ('018', '南 區', '祥和長照服務有限公司私立祥和居家長照機構', '0422658079', '6580', '04-22658099\n04-22658079', '黃聖富', '0930-31805', 'singabcms14@gmail.com', '10月5日', '下午2時', '一', '賴添福', '郭雅雯');
INSERT INTO `INSTCARD` VALUES ('019', '北屯區', '社團法人台灣健康整合服務協會', '0422432683', '2683', '04-22432683', '洪曼珊', '0937-122794', 'cherryhung0717@gmail.com', '10月6日', '上午9時', '二', '陳亮汝', '陳麗娟');
INSERT INTO `INSTCARD` VALUES ('020', '北屯區', '專業居家護理所', '0424368221', '4238', '04-24368221', '呂郁芳', '0988-015335', 'yvlu5483@yahoo.com.tw', '10月6日', '下午2時', '二', '陳亮汝', '陳麗娟');
INSERT INTO `INSTCARD` VALUES ('021', '南屯區', '社團法人臺中市大恆樂齡協會', '0423802117', '3802', '04-23802117', '王仁傑', '0958-567559', 'Dahn9696@gmail.com', '10月6日', '上午9時', '二', '洪瑞英', '吳秀鳳');
INSERT INTO `INSTCARD` VALUES ('022', '南屯區', '財團法人臺中市私立豐盛社會福利慈善事業基金會', '0424792569', '9256', '04-24792569', '劉映彤', '04-24792569', 'hueiching07@yahoo.com.tw', '10月6日', '下午2時', '二', '洪瑞英', '吳秀鳳');
INSERT INTO `INSTCARD` VALUES ('023', '東勢區', '維恩耳鼻喉科診所', '0487627901', '6279', '0978-762790', '傅思維', '0978-762790', 'szuwei6812@gmail.com', '10月7日', '上午9時', '三', '吳曉君', '簡慧雯');
INSERT INTO `INSTCARD` VALUES ('024', '東勢區', '財團法人中華民國佛教慈濟慈善事業基金會(東勢區)', '0425881988', '5881', '04-25881988', '廖珮琳', '04-25881988', 'ltc000280@tzuchi.org.tw', '10月7日', '下午2時', '三', '吳曉君', '簡慧雯');
INSERT INTO `INSTCARD` VALUES ('025', '大甲區', '財團法人臺灣省私立永信社會福利基金會', '0426803511', '8819', '04-26803511', '吳曉菁', '0918-619190', 'u90237@yungshingroup.com', '10月7日', '上午9時', '三', '陳亮汝', '黃惠玲');
INSERT INTO `INSTCARD` VALUES ('026', '清水區', '財團法人臺灣省私立永信社會福利基金會', '0426270812', '2180', '04-26270812', '江瑞敏', '04-26270812#320、0937-278719', 'u90206@yungshingroup.com', '10月7日', '下午2時', '三', '陳亮汝', '黃惠玲');
INSERT INTO `INSTCARD` VALUES ('027', '中 區', '社團法人臺中市紅十字會附設居家長照機構', '0422222411', '1142', '04-22222411', '廖惠玲', '04-22222411#321', 'homecare@redcross.tw', '2020-10-08', '上午9時', '四', '陳世堅', '朱凡欣');
INSERT INTO `INSTCARD` VALUES ('028', '南屯區', '財團法人全成社會福利基金會', '0423890243', '3420', '04-23890243', '郭姿秀', '04-23890243', 'qc21408721@gmail.com', '2020-10-08', '下午2時', '四', '陳世堅', '朱凡欣');
INSERT INTO `INSTCARD` VALUES ('029', '大肚區', '真善美復能物理治療所', '0426990005', '9962', '04-26990005', '趙冠晴', '04-26990005', 'tgbptclinic@gmail.com', '2020-10-08', '上午9時', '四', '洪錦墩', '黃惠娟');
INSERT INTO `INSTCARD` VALUES ('030', '大肚區', '臺中市好伴照顧協會', '0426990552', '5509', '04-26990552', '趙文瑛', '0955-803669', 'gchome2699@gmail.com', '2020-10-08', '下午2時', '四', '洪錦墩', '黃惠娟');
INSERT INTO `INSTCARD` VALUES ('031', '清水區', '社團法人臺中市大大人長期照顧關懷協會私立居家長照機構(清水區)', '4256101661', '6101', '04-25610166', '蕭懿含', '04-25610166', 'hc004@dadazen', '10月12日', '上午9時', '一', '洪錦墩', '胡月娟');
INSERT INTO `INSTCARD` VALUES ('032', '清水區', '財團法人中華民國佛教慈濟慈善事業基金會(清水區)', '0426283125', '6283', '04-26283125', '呂怡靜', '04-26283125/0980-447458', 'ltc000231@tzuchi.org.tw', '10月12日', '下午2時', '一', '洪錦墩', '胡月娟');
INSERT INTO `INSTCARD` VALUES ('033', '石岡區', '財團法人老五老基金會', '0425822133', '8524', '04-25822133', '利欣頤', '04-25822133', 'ts@ofo.org.tw\nsinyi@ofo.org.tw', '10月12日', '上午9時', '一', '侯建州', '曾月霞');
INSERT INTO `INSTCARD` VALUES ('034', '豐原區', '臺中市私立有春居家式服務類長期照顧服務機構', '0425156292', '6515', '04-25156292', '劉美珠', '0911-148968', 'st01234562018@gmail.com', '10月12日', '下午2時', '一', '侯建州', '曾月霞');
INSERT INTO `INSTCARD` VALUES ('035', '西屯區', '倚飛科技有限公司附設臺中市私立天心居家長照機構', '0436091549', '4519', '04-36091549', '張明毅', '0958-256037', 'belinda850304@gmail.com', '10月12日', '上午9時', '一', '徐明仿', '陳麗娟');
INSERT INTO `INSTCARD` VALUES ('036', '西屯區', '臺中榮民總醫院', '0423592525', '5295', '04-23592525#6011.8199.8198', '鄧喬鳳', '04-23592525#6019', 'dcf@vghtc.gov.tw', '10月12日', '下午2時', '一', '徐明仿', '陳麗娟');
INSERT INTO `INSTCARD` VALUES ('037', '大甲區', '李綜合醫療社團法人大甲李綜合醫院', '0426862288', '8226', '04-26862288', '曾世懷', '0978-728695、04-26862288轉2183', 'c03018@leehospital.com.tw', '10月13日', '上午9時', '二', '陳亮汝', '黃惠娟');
INSERT INTO `INSTCARD` VALUES ('038', '清水區', '社團法人台灣福氣社區關懷協會', '4265706001', '6075', '04-26570600', '郭怡君', '04-2657-0600', 'sow0414@gmail.com', '10月13日', '下午2時', '二', '陳亮汝', '黃惠娟');
INSERT INTO `INSTCARD` VALUES ('039', '太平區', '翔新診所', '0435090317', '0534', '04-35090317\n04-22153133', '陳品蓉', '04-35090317、04-22153133', 'care.elderly768@gmail.com', '10月13日', '上午9時', '二', '洪瑞英', '黃惠玲');
INSERT INTO `INSTCARD` VALUES ('040', '太平區', '瞳馨居家護理所', '0900177920', '7710', '0900-177920', '李岳欣', '0986-960218', 'tunghsing1071219@gmail.com', '10月13日', '下午2時', '二', '洪瑞英', '黃惠玲');
INSERT INTO `INSTCARD` VALUES ('041', '東 區', '社團法人台中市社會關懷服務協會私立活力勇居家長照機構', '0422126765', '7621', '04-22126765', '柯欣慧', '04-22126765', 'east40146@gmail.com', '10月13日', '上午9時', '二', '孫彰良', '郭雅雯');
INSERT INTO `INSTCARD` VALUES ('042', '東 區', '美家人力資源股份有限公司附設私立樂齡居家長照機構', '0435077388', '5340', '04-35077388#302', '陳如珊', '0976-536761', 'lovelinghouse@gmail.com', '10月13日', '下午2時', '二', '孫彰良', '郭雅雯');
INSERT INTO `INSTCARD` VALUES ('043', '外埔區', '私立長照好幫手居家長照機構', '0426765859', '5856', '04-26765859', '李麗琴', '0900-783315', 'Aqd3652@gmail.com', '10月14日', '上午9時', '三', '賴怡帆', '黃小玲');
INSERT INTO `INSTCARD` VALUES ('044', '神岡區', '臺中市私立妙純居家式服務類長期照顧服務機構', '0425295729', '9252', '04-25295729', '吳婉琪', '04-25295729', 'amy062388@yahoo.com.tw', '10月14日', '下午2時', '三', '賴怡帆', '黃小玲');
INSERT INTO `INSTCARD` VALUES ('045', '大雅區', '維弘復健科診所', '0425681919', '9186', '04-25681919', '李育真', '0986-616281', 'Piggy2229@gmail.com', '10月14日', '上午9時', '三', '賴添福', '黃惠玲');
INSERT INTO `INSTCARD` VALUES ('046', '大雅區', '財團法人台中市私立龍眼社會福利慈善事業基金會附設私立龍眼林居家長照機構', '0425682195', '6821', '04-25682195', '高雅慧', '04-25682195', 'lon.ho@msa.hinet.net', '10月14日', '下午2時', '三', '賴添福', '黃惠玲');
INSERT INTO `INSTCARD` VALUES ('047', '大甲區', '仁馨護理之家', '0426863000', '4268', '04-26863000#6121、6122', '李征寰', '04-26863000#6121', 'Care.manager@renshin.com.tw', '10月16日', '上午9時', '五', '洪錦墩', '曾月霞');
INSERT INTO `INSTCARD` VALUES ('048', '大安區', '高銘診所', '0426715618', '7156', '04-26715618', '任苡瑄', '0983-936995', 'home26715618@gmail.com', '10月16日', '下午2時', '五', '洪錦墩', '曾月霞');
INSERT INTO `INSTCARD` VALUES ('049', '沙鹿區', '光田醫療社團法人光田綜合醫院(沙鹿區)  ', '0426365000', '4263', '04-26365000轉2151或2152', '紀珮君', '04-26367200', 'peggy660217@yahoo.com.tw', '10月16日', '上午9時', '五', '洪瑞英', '黃惠玲');
INSERT INTO `INSTCARD` VALUES ('050', '梧棲區', '童綜合醫療社團法人童綜合醫院', '0426581919', '5891', '04-26581919#4410', '林玟秀', '04-26581919#54410', 't3240@ms.sltung.com.tw', '10月16日', '下午2時', '五', '洪瑞英', '黃惠玲');
INSERT INTO `INSTCARD` VALUES ('051', '中 區', '財團法人台中市私立甘霖社會福利慈善事業基金會', '0422207818', '8122', '04-22207818', '吳湘凌', '04-22207818', 'glsfdaycare@gmail.com', '10月16日', '上午9時', '五', '徐明仿', '朱凡欣');
INSERT INTO `INSTCARD` VALUES ('052', '西屯區', '社團法人台灣福氣社區關懷協會(西屯區)', '0427003618', '2736', '04-27003618', '鄭宇晴', '0921-483925', 'olwchingcheng@gmail.com', '10月16日', '下午2時', '五', '徐明仿', '朱凡欣');
INSERT INTO `INSTCARD` VALUES ('053', '大里區', '真善美居家護理所', '0424915128', '9158', '04-24915128', '吳淑榕', '0923-609581', 'Tgb24074168@gmail.com', '10月16日', '下午2時', '五', '孫彰良', '陳麗娟');
INSERT INTO `INSTCARD` VALUES ('054', '潭子區', '佛教慈濟醫療財團法人附設台中慈濟護理之家(潭子區)', '0436060666', '0643', '04-36060666#8080', '林翊嘉', '04-36060666#3854、0972-724598', 'tc2033103@tzuchi.com.tw', '10月19日', '上午9時', '一', '洪錦墩', '胡月娟');
INSERT INTO `INSTCARD` VALUES ('055', '豐原區', '芳林樂活事業有限公司附設私立芳林居家長照機構', '0425263858', '2685', '04-25263858\n04-25263958', '林孟妃', '04/25263858', 'judy.yang5511@gmail.com', '10月19日', '下午2時', '一', '洪錦墩', '胡月娟');
INSERT INTO `INSTCARD` VALUES ('056', '烏日區', '財團法人臺中市私立童庭社會福利慈善事業基金會', '0423360996', '5137', '04-23360996', '謝汶宜', '04-23360996', 'ttcharity@gmail.com', '10月19日', '上午9時', '一', '賴添福', '郭雅雯');
INSERT INTO `INSTCARD` VALUES ('057', '烏日區', '社團法人中華仁仁關懷協會', '0423378067', '8913', '04-23378067', '許皓', '04-23378067', 'qsmaster23378067@qingsong.com.tw', '10月19日', '下午2時', '一', '賴添福', '郭雅雯');
INSERT INTO `INSTCARD` VALUES ('058', '西 區', '衛生福利部臺中醫院', '0422294411', '2456', '0422294411#6220.6221', '徐瑪玲', '04-22294411#5406/0910', 'b2372506@taic.mohw.gov.tw', '10月19日', '上午9時', '一', '陳世堅', '陳麗娟');
INSERT INTO `INSTCARD` VALUES ('059', '西 區', '龍井新庄藥局', '0422855011', '8671', '04-22855011', '吳許暉', '04-22855011/0911-780654', 'Winnin.wu@gmail.com', '10月19日', '下午2時', '一', '陳世堅', '陳麗娟');
INSERT INTO `INSTCARD` VALUES ('060', '北 區', '財團法人天主教曉明社會福利基金會', '0422974225', '9534', '04-22974225', '陳淑芬', '04-22974225#243', 'protection546@gmail.com', '10月19日', '上午9時', '一', '徐明仿', '曾月霞');
INSERT INTO `INSTCARD` VALUES ('061', '北 區', '財團法人台中市私立真愛社會福利慈善事業基金會', '0422380563', '4359', '04-22380563', '唐瑋澤', '04-22380563', '201702ho@gmail.com', '10月19日', '下午2時', '一', '徐明仿', '曾月霞');
INSERT INTO `INSTCARD` VALUES ('062', '北屯區', '春暉居家護理所', '0422378557', '7516', '04-22378557', '胡淑芬', '04-22378557、0935-354268', 'springhu087@gmail.com', '10月20日', '上午9時', '二', '洪瑞英', '吳秀鳳');
INSERT INTO `INSTCARD` VALUES ('063', '北屯區', '財團法人老五老基金會', '0422370006', '2760', '04-22370006', '吳德偉', '04-22370006', 'woodway@ofo.org.tw', '10月20日', '下午2時', '二', '洪瑞英', '吳秀鳳');
INSERT INTO `INSTCARD` VALUES ('064', '豐原區', '臺中市私立林燕玲居家式服務類長期照顧服務機構', '0425254607', '3342', '04-25254607', '林燕玲', '04-25254607', 'inch79326@gmail.com', '10月21日', '上午9時', '三', '吳曉君', '簡慧雯');
INSERT INTO `INSTCARD` VALUES ('065', '神岡區', '社團法人臺中市大大人長期照護關懷協會', '0425610166', '4459', '04-25610166', '黃世睿', '04-25610166', 'dadazenltc@gmail.com', '10月21日', '下午2時', '三', '吳曉君', '林夷真');
INSERT INTO `INSTCARD` VALUES ('066', '北屯區', '好樂齡銀髮事業有限公司附設臺中市私立顧老照居家式服務類長期照顧服務機構', '1422474455', '8819', '04-22474455', '林峻宏', '0910-453079', 'chlin628@gmail.com', '10月23日', '上午9時', '五', '孫彰良', '曾月霞');
INSERT INTO `INSTCARD` VALUES ('067', '北屯區', '臺中市私立天德居家式服務類長期照顧服務機構', '0422475923', '3367', '04-22475923', '葉秀美', '04-22475923\n0958-221698', 'tdhomecare2@gmail.com', '10月23日', '下午2時', '五', '孫彰良', '曾月霞');
INSERT INTO `INSTCARD` VALUES ('068', '西屯區', '財團法人弘道老人福利基金會附設臺中市私立弘道第一區居家式服務類長期照顧服務機構', '0423505555', '4985', '04-23505555', '全揚恩', '04-23505555#19', 'hondao.middle@hondao.org.tw', '10月23日', '上午9時', '五', '徐明仿', '林夷真');
INSERT INTO `INSTCARD` VALUES ('069', '南屯區', '財團法人中華民國佛教慈濟慈善事業基金會(南屯區)', '0424739090', '7439', '04-24739090', '廖珮琳', '04-24739090', 'ltc000280@tzuchi.org.tw', '10月23日', '下午2時', '五', '徐明仿', '林夷真');
INSERT INTO `INSTCARD` VALUES ('070', '霧峰區', '本堂澄清醫院附設護理之家', '0423391000', '5193', NULL, '陳琮勛', '04-23391000', 'btnh110@gmail.com\nbtnh4557@gmail.com', '10月23日', '上午9時', '五', '侯建州', '黃惠娟');
INSERT INTO `INSTCARD` VALUES ('071', '霧峰區', '健民健康有限公司附設私立阿罩霧A埕居家長照機構', '‎0423309358', '6425', NULL, '楊珮', '0983-823792', 'jianmin74@yahoo.com.tw', '10月23日', '下午2時', '五', '侯建州', '黃惠娟');
INSERT INTO `INSTCARD` VALUES ('072', '東勢區', '小太陽藥局', '0425773481', '1362', '04-25773481', '黃毓茹', '0966-300330', 'depletedark@gmail.com', '10月23日', '下午2時', '五', '洪瑞英', '陳麗娟');
INSERT INTO `INSTCARD` VALUES ('073', '新社區', '洪幸雪居家護理所', '0425826213', '3427', '04-25826213', '羅翊慈', '04-25826213', 'singsnow2005@gmail.com', '10月23日', '下午2時', '五', '洪錦墩', '簡慧雯');
INSERT INTO `INSTCARD` VALUES ('074', '大里區', '財團法人弘道老人福利基金會附設臺中市私立弘道第二區居家式服務類長期照顧服務機構', '0436091518', '5413', '04-36091518#27', '王偉蘋', '04-36091518#27', 'office412@hondao.org.tw', '10月27日', '上午9時', '二', '洪瑞英', '陳麗娟');
INSERT INTO `INSTCARD` VALUES ('075', '大里區', '仁愛醫療財團法人大里仁愛醫院', '0424819900', '6329', '04-24819900#55306.55307', '陳佩容', '04-24819900#55306', 'jah6079@mail.jah.org.tw', '10月27日', '下午2時', '二', '洪瑞英', '陳麗娟');
INSERT INTO `INSTCARD` VALUES ('076', '北屯區', '健康居家護理所', '0424374149', '7726', '04-24374149', '呂佳雯', '0928-183381', 'Healthcare201314@gmail.com', '10月28日', '上午9時', '三', '吳曉君', '黃小玲');
INSERT INTO `INSTCARD` VALUES ('077', '北屯區', '明康居家護理所', '0422476877', '1043', '04-22476877', '張靜宜', '04-22431105、0963-433555', 'ccijenny@hotmail.com.tw', '10月28日', '下午2時', '三', '吳曉君', '黃小玲');
INSERT INTO `INSTCARD` VALUES ('078', '沙鹿區', '財團法人臺中市私立家寶社會福利慈善事業基金會附設私立居家長照機構', '0426623196', '0953', '04-26623196', '陳家聖', '04-26623196#60', 't7841@ms.sltung.com.tw', '10月28日', '上午9時', '三', '賴添福', '黃惠玲');
INSERT INTO `INSTCARD` VALUES ('079', '梧棲區', '社團法人台灣福氣社區關懷協會', '426570600', '8080', '04-26570600', '郭怡君', '04-26570600', 'sow0414@gmail.com', '10月28日', '下午2時', '三', '賴添福', '黃惠玲');
INSERT INTO `INSTCARD` VALUES ('080', '南 區', '大慶居家護理所', '0422655948', '4690', '04-22655948\n04-22658453', '蔡子敏', '04-22655948、0933-139961', 'm45779779@gmail.com', '10月28日', '上午9時', '三', '陳亮汝', '簡慧雯');
INSERT INTO `INSTCARD` VALUES ('081', '烏日區', '臺中市私立香柏木居家式服務類長期照顧服務機構', '0422630062', '3601', '0900-790166', '王莉雅', '04-22630062', 'cachservice@gmail.com', '10月28日', '下午2時', '三', '陳亮汝', NULL);
INSERT INTO `INSTCARD` VALUES ('082', '和平區', '中山醫學大學附設醫院', '0425941881', '8491', '04-25941881', '顏啟華', '04-24739595*34955', 'cshy352@csh.org.tw', '2020-10-30', '上午9時', '五', '侯建州', '林夷真');
INSERT INTO `INSTCARD` VALUES ('083', '和平區', '臺中市私立康復醫學居家長照機構', '2422474455', '9476', '0989-434736', '陳海藍', '0989-434736', 'ok0708@gmail.com', '2020-10-30', '下午2時', '五', '侯建州', '林夷真');
INSERT INTO `INSTCARD` VALUES ('085', '東勢區', '財團法人中華基督教福音信義傳道會', '0425772525', '5252', '04-25772525', '張劭華', '04-25772525', 'syabc106@gmail.com', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `INSTCARD` VALUES ('086', '和平區', '有限責任臺灣伯拉罕共生照顧勞動合作社私立伯拉罕居家長照機構', '0425912019', '6641', '04-25912019', '黃珮婷', '0952-881477', 'pthuang327@gmail.com', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for InstScoreTable
-- ----------------------------
DROP TABLE IF EXISTS `InstScoreTable`;
CREATE TABLE `InstScoreTable`  (
  `EvalYear` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '評鑑年度',
  `INSTNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '機構代碼',
  `ItemNo` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '評分項目',
  `SelfScore` decimal(6, 2) NULL DEFAULT NULL COMMENT '機構自評',
  `EvalScore` decimal(6, 2) NULL DEFAULT NULL COMMENT '委員評分',
  `EvalDesc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '委員說明',
  `EvalDate` datetime(0) NULL DEFAULT NULL COMMENT '委員評分時間',
  `SelfDate` datetime(0) NULL DEFAULT NULL COMMENT '機構自評時間',
  PRIMARY KEY (`EvalYear`, `INSTNO`, `ItemNo`) USING BTREE,
  CONSTRAINT `FK_INSTSCOR_REFERENCE_UNITAYEA` FOREIGN KEY (`EvalYear`, `INSTNO`) REFERENCES `UnitAYear` (`Year`, `INSTNO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '機構評分表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of InstScoreTable
-- ----------------------------
INSERT INTO `InstScoreTable` VALUES ('109', '041', '1-1-1-1', 1.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '1-1-1-2', 1.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '1-1-1-3', 0.50, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '1-1-1-4', 1.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '1-1-1-5', 0.50, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '1-1-2-2', 0.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '1-1-3-1', 1.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '1-1-3-2', 2.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '1-1-3-3', 1.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '1-1-4-1', 0.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '1-1-4-2', 1.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '1-1-4-3', 1.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '1-2-1-1', 2.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '1-2-1-2', 1.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '1-2-1-3', 0.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '1-2-1-4', 1.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '1-2-2-1', 1.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '1-2-2-2', 1.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '2-1-1-1', 1.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '2-1-1-2', 0.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '2-1-1-3', 0.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '2-1-2-1', 1.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '2-1-2-2', 2.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '2-2-1-1', 1.50, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '2-2-1-2', 0.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '2-2-2-1', 0.50, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '2-2-2-2', 1.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '2-2-2-3', 0.50, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '2-2-3-1', 0.50, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '2-3-1-1', 1.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '2-3-1-2', 0.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '2-3-1-3', 0.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '2-4-1-1', 1.50, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '2-4-1-2', 2.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '3-1-1-1', 2.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '3-1-1-2', 0.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '3-1-1-3', 1.50, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '3-1-2-1', 2.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '3-1-2-2', 1.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '3-1-3-1', 0.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '3-1-3-2', 2.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '3-1-4-1', 4.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '3-1-5-1', 2.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '3-1-5-2', 0.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '4-1-1-1', 1.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '4-1-1-2', 2.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '4-2-1-1', 2.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '4-2-1-2', 1.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '4-2-1-3', 1.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '5-1-1-1', 0.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '5-2-1-1', 0.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '5-3-1-1', 1.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '5-4-1-1', 2.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `InstScoreTable` VALUES ('109', '041', '5-5-1-1', 1.00, 0.00, '', '1900-01-01 00:00:00', '2020-09-08 00:00:00');

-- ----------------------------
-- Table structure for MessageRec
-- ----------------------------
DROP TABLE IF EXISTS `MessageRec`;
CREATE TABLE `MessageRec`  (
  `MsgSerialNo` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `MsgSub` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '訊息主題',
  `MsgData` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '訊息內容',
  `MsgPushDate` datetime(0) NULL DEFAULT NULL COMMENT '發佈日期',
  `Attachs` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件內容',
  `CloseDate` datetime(0) NULL DEFAULT NULL COMMENT '關閉日期',
  `CreateDate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'CreateDate',
  `CreateUser` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'CreateUser',
  `Modifydate` datetime(0) NULL DEFAULT NULL COMMENT 'Modifydate',
  `ModifyUser` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ModifyUser',
  PRIMARY KEY (`MsgSerialNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '最新消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MessageRec
-- ----------------------------
INSERT INTO `MessageRec` VALUES (1, '測試標題', '測試內容', '2020-08-27 09:11:16', '0', NULL, '2020-08-27 09:11:34', 'admin', '2020-08-27 09:11:29', 'admin');
INSERT INTO `MessageRec` VALUES (2, '測試標題2', '測試內容2', '2020-08-27 09:12:05', '0', NULL, '2020-08-27 09:12:21', 'admin', '2020-08-27 09:12:18', 'admin');

-- ----------------------------
-- Table structure for ScoreDesc
-- ----------------------------
DROP TABLE IF EXISTS `ScoreDesc`;
CREATE TABLE `ScoreDesc`  (
  `EvalYear` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '評鑑年度',
  `EvalType` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '評鑑類別',
  `ItemNo` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '評分項目',
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '評分內容',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT 'CreateDate',
  PRIMARY KEY (`EvalYear`, `EvalType`, `ItemNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '評分標準資料' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ScoreDesc
-- ----------------------------
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '1-1-1', '▉文件檢閱\r\n▉系統服務計畫檢視\r\n▉個案紀錄抽查(至少服務半年以上)\r\n▉現場訪談\r\n1.抽查個案(2~5案)，由委員評分。\r\n2.服務計畫適切性：檢閱照管系統或A個管服務計畫是否依長照專員核定額度或照顧問題清單，及照顧組合表擬定服務計畫。\r\n3.服務計畫項目：包含社會性服務項目包括長照2.0項目及相關服務資源(如經濟補助等)，檢視評鑑作業之基本資料表(十一)合作服務提供單位實際轉介個案數是否侷限特定類別。\r\n4.定期評估：服務依實際服務需求改變進行系統照顧計畫異動，至少每六個月家訪一次。\r\n備註:\r\n1.服務紀錄以參閱資訊系統紀錄為原則。\r\n2.依據單位提供上傳新個案之清冊進行抽查。', NULL);
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '1-1-2', '▉文件檢閱\r\n▉個案紀錄抽查(至少服務半年以上)\r\n▉現場訪談\r\n1.抽查個案(2~5案)，由委員評分。\r\n2.檢閱新案家訪時提供服務使用者/家屬的相關服務說明或介紹及確認文件(確實說明服務項目及內容，填寫確認單及簽名)。\r\n3.針對不同類型服務使用者是否準備有不同的溝通文件或工具。\r\n備註:相關文件檢閱(如確認單)以新案為主。\r\n', NULL);
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '1-1-3', '▉文件檢閱\r\n▉個案紀錄抽查(至少服務半年以上)\r\n▉服務計畫檢視\r\n▉現場訪談\r\n1.抽查個案(2~5案)，由委員評分。\r\n2.檢視評鑑作業之基本資料表(九)個管服務量之多元服務個案數(媒合2種服務以上)及(十)個案管理時效。\r\n3.系統服務計畫檢視：檢閱照管系統或A個管服務計畫連結服務項目、多元性、資源連結。\r\n4.可提供家暴/自殺/高風險家庭照顧者...等服務使用者/特殊需求相關轉介紀錄(若無案例，請單位提供相關轉介流程、轉介單)。\r\n備註:多元性長照服務指兩種以上服務。\r\n', NULL);
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '1-1-4', '▉文件檢閱\r\n▉個案紀錄抽查(至少服務半年以上)\r\n▉服務計畫檢視\r\n▉現場訪談\r\n1.抽查個案(2~5案)，由委員評分。\r\n2.單位訂有轉介流程或辦法。\r\n3.檢閱照管系統(A)服務紀錄每月是否有電訪/家訪/面訪等相關服務紀錄。\r\n4.檢閱轉介個案服務紀錄(亦請檢閱轉介後續回覆單)。\r\n5.針對不能獲得適切服務之服務使用者，請單位說明如何提供協助及後續如何追蹤。\r\n', NULL);
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '1-2-1', '▉文件檢閱\r\n▉現場訪談\r\n1.由委員依單位文件及說明辦理情形評分。\r\n2.由本府衛生局提供服務範圍內特約B單位家數清冊，檢閱單位資源名冊及連結服務單位。\r\n3.由評鑑系統轉出A個管實際轉介各項資源之個案數。\r\n4.檢閱服務區域範圍內長照服務資源清冊，及評鑑作業之基本資料表合作服務提供單位。\r\n備註：\r\n1.項次2以檢閱單位產生實質連結資源運用的紀錄文件為主。\r\n2.衛生局跟訪人員將協助確認A、B單位背景是否為同一公司。\r\n5.檢視單位派案及改派原則，檢視評鑑作業之基本資料表(十一)合作服務提供單位實際轉介個案數。\r\n6.如有下列情況，請單位說明：\r\n(1)針對基本資料表合作服務提供單位相關分析，針對資源不足開發或因應策略或經常使用資源服務量能評估。\r\n(2)說明基本資料表合作服務提供單位實際轉介個案數為0的原因，並檢視派案機制是否訂定相關改派原則，若長期無法配合提供服務者，是否有通報臺中市政府照管中心後續處理(衛生局提供受評單位109年1至5月派案B單位情形)。\r\n', NULL);
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '1-2-2', '▉文件檢閱\r\n▉現場訪談\r\n1.由委員依單位文件及說明辦理情形評分。\r\n2.檢閱評鑑作業之基本資料表社區暨跨專業整合現況。\r\n3.社區資源網絡會議及其相關會議紀錄。\r\n備註：如有受評單位曾函文邀請照管中心參與會議，亦將由衛生局提供會議日期供委員參閱。\r\n', NULL);
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '2-1-1', '▉文件檢閱\r\n▉現場訪談\r\n1.由委員依單位文件及說明辦理情形評分。\r\n2.檢視社區整合型服務中心(A)之工作手冊。\r\n3.組織架構至少需呈現A個管人員及其主管所在的位置。\r\n4.檢視紙本或電腦相關會議資料及紀錄，包含組織架構內相關行政或專業會議，討論社區整合型服務中心(A)之相關議題，至少需要A個管人員及其主管共同参與。\r\n備註:\r\n1.定期開會的定義為：至少每季。\r\n2.主管的定義為個管員往上一級如督導、主任…等。\r\n', NULL);
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '2-1-2', '▉文件檢閱\r\n▉現場訪談\r\n1.由委員依單位文件及說明辦理情形評分。\r\n2.檢視相關單位服務內容及收費情形之手冊或宣傳單張，及相關公告管道(檢視單位官方網站有無明定服務內容與收費標準)。\r\n', NULL);
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '2-2-1', '▉文件檢閱\r\n▉現場訪談\r\n1.由委員依單位文件及說明辦理情形評分。\r\n2.個案管理人員須符合A個管人員資格。\r\n3.A個管人員是否領有本市核發之證明文件。\r\n4.檢視評鑑作業之基本資料表人力配置。\r\n5.如有下列情況，請單位說明：\r\n(1) 針對評鑑作業之基本資料表人力配置，專職人數未達2名者請說明原因。\r\n(2) 領有108年A單位計畫補助人員是否由居家服務督導、日照中心、出院準備、失智共照中心、家庭照顧者據點...等工作人員兼任。\r\n備註:\r\n1.	A個管人員須完成初階訓練並完成長照人員認證及登錄作業。\r\n2.	衛生局提供受評單位之108年底及109年(1-5月各月)A個管人員清冊\r\n', NULL);
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '2-2-2', '▉文件檢閱\r\n▉現場訪談\r\n1.由委員依單位文件及說明辦理情形評分。\r\n2.新進人員依規定完成個案管理人員初階訓練。\r\n3.檢視新進人員訓練辦法。\r\n4.個案管理人員於任職一年內完成服務安排能力培育課程。         \r\n5.單位是否針對人員不同需求個管人員擬定在職教育訓練規劃。\r\n備註:\r\n新進人員定義：任職6個月內。\r\n', NULL);
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '2-2-3', '▉文件檢閱\r\n▉現場訪談\r\n1.由委員依單位文件及說明辦理情形評分。\r\n2.現場訪談單位主管說明人員異動的原因及因應。\r\n', NULL);
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '2-3-1', '▉文件檢閱\r\n▉現場訪談\r\n1.由委員依單位文件及說明辦理情形評分。\r\n2.檢視個人資料管理辦法。\r\n3.檢視資訊資料系統是否設有權限管理。\r\n4.檢視電訪或家訪之建檔記錄。\r\n', NULL);
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '2-4-1', '▉文件檢閱\r\n▉現場訪談\r\n1.由委員依單位文件及說明辦理情形評分。\r\n2.抽查照管系統AA01、AA02系統資料登打是否完整\r\n補充：\r\n由衛生局事前抽查系統登打落實度，抽查比例原則如下：\r\n總案量	300(含)以下	301(含)以上\r\n抽案數	10	15\r\n照落實度比例評分\r\n(1)符合：100%抽案數全數每月落實。\r\n(2)部分符合：50%以抽案數落實，但未達100%。\r\n(3)完全不符合：50%抽案數未落實。\r\n3.單位派員出席臺中市政府照管中心相關會議紀錄及後續配合執行之資料呈現，或相關長照業務宣導之資料呈現。(衛生局提供參考資料)\r\n', NULL);
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '3-1-1', '▉文件檢閱\r\n▉現場訪談\r\n1.由委員依單位文件及說明辦理情形評分。\r\n2.由單位提供之個案清冊上傳至評鑑系統轉出個案服務時效。(可於指標1-1抽案時之內容檢視單位填報正確性)\r\n3.檢視評鑑作業之基本資料表(十)個案管理時效。\r\n4.現場訪談工作人員說明未達合約規定時效之相關因應策略。\r\n', NULL);
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '3-1-2', '▉文件檢閱\r\n▉現場訪談\r\n1.由委員依單位文件及說明辦理情形評分。(衛生局提供單位服務異常狀況供委員參考)\r\n2.檢視單位自訂的品質監測結構或過程指標(如多元服務、資源媒合、案家訪問是否準時到達等)及落實情形。\r\n', NULL);
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '3-1-3', '▉文件檢閱\r\n▉現場訪談\r\n1.由委員依單位文件及說明辦理情形評分。\r\n2.檢閱評鑑作業之基本資料表(十二)社區暨跨專業整合現況。\r\n3.區域跨專業個案討論會及相關會議紀錄。\r\n', NULL);
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '3-1-4', '▉文件檢閱\r\n▉現場訪談\r\n1.由委員依單位文件及說明辦理情形評分。\r\n2.檢閱評鑑作業之基本資料表(八)人力配置及(九)個管服務量。\r\n補充：108年1月至109年5月共17個月中\r\n(1)符合：全數月份皆不超過(100%)\r\n(2)部分符合：9至16個月不超過(50%)\r\n(3)完全不符合：為0個月至8個月不超過(50%以下)\r\n備註:\r\n專職個管員的個管量。\r\n', NULL);
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '3-1-5', '▉電訪抽查2-5家合作服務單位、2-5名服務使用者(新案)/家屬。\r\n1. 詢問服務使用者/家屬需求，個管人員介紹或連結哪些服務資源。\r\n2. 詢問服務使用者/家屬需求，連結服務資源多久開始提供服務，目前服務使用情形。\r\n3. 詢問服務使用者/家屬服務需求是否已經獲得協助。\r\n4. 詢問合作的服務單位對A單位服務提供現況與滿意度。\r\n備註:\r\n1.本府衛生局公告評鑑間，通知新個案將進行電話品質訪查。\r\n2.由本府照管中心照顧管理專員從名單抽2-5名(服務使用者、服務提供者)進行電話品質訪查，調查結果供委員評分參考。\r\n問卷\r\n分數	4.5分(含)以上	3.5分-4.4分	3.4分\r\n(含)以下\r\n委員評分	符合	部分符合	完全\r\n不符合\r\n', NULL);
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '4-1-1', '▉文件檢閱\r\n▉現場訪談\r\n1.由委員依單位文件及說明辦理情形評分。(衛生局提供陳情/申訴案件供委員參考)\r\n2.檢閱單位訂定陳情(申訴)機制相關規定及其公告的方式。\r\n3.檢閱申訴案件相關處理紀錄並簽名(倘無案件仍需有相關紀錄)。\r\n4.如發現未落實追蹤個案，1案扣1分。\r\n', NULL);
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '4-2-1', '▉文件檢閱\r\n▉現場訪談\r\n1.由委員依單位文件及說明辦理情形評分。\r\n2.檢視服務使用者/家屬的回饋機制。\r\n3.檢視服務使用者/家屬滿意度。\r\n4.現場訪談工作人員滿意度調查意見後續處理情形。\r\n', NULL);
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '5-1-1', '▉文件檢閱\r\n▉現場訪談\r\n1.由委員依單位文件及說明辦理情形評分。\r\n2.檢視評鑑作業之基本資料表(九)個管服務量之自行轉介照管中心個案數及轉介單佐證資料。\r\n3.主動拜訪鄰里長或醫院等之佐證資料。\r\n4.是否主動開發高關懷個案。\r\n備註:\r\n主動開發新個案指的是透由A個管主動轉介特約區域內社區個案給照專評估的個案。\r\n', NULL);
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '5-2-1', '▉文件檢閱\r\n▉現場訪談\r\n單位主動提供相關佐證文件。\r\n備註:\r\n開發新服務單位不受限外部其他單位，亦包括同一單位新服務提供。\r\n', NULL);
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '5-3-1', '▉文件檢閱\r\n▉現場訪談\r\n由委員評分，檢閱單位因應社區需求發展符合在地特色與文化之服務模式(如聘任原住民、新住民擔任工作者協助服務輸送，或編譯特殊語言或圖示之服務宣導品)等\r\n', NULL);
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '5-4-1', '▉文件檢閱\r\n▉現場訪談\r\n由委員評分，檢視單位督導機制及相關會議紀錄。\r\n', NULL);
INSERT INTO `ScoreDesc` VALUES ('109', 'A', '5-5-1', '▉文件檢閱\r\n▉現場訪談\r\n由委員評分，檢視單位佐證資料，由現場委員討論議決。\r\n', NULL);

-- ----------------------------
-- Table structure for ScoreItem
-- ----------------------------
DROP TABLE IF EXISTS `ScoreItem`;
CREATE TABLE `ScoreItem`  (
  `EvalYear` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '評鑑年度',
  `EvalType` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '評鑑類別',
  `ItemNo` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '評分項目',
  `ItemParentNo` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '評分父項目',
  `ItemScore` decimal(6, 2) NULL DEFAULT NULL COMMENT '配分',
  `ItemDesc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '評分內容',
  `ItemGrade` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '評分基準',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT 'CreateDate',
  `IsFocus` bit(1) NULL DEFAULT b'0' COMMENT '是否為重點指標',
  PRIMARY KEY (`EvalYear`, `EvalType`, `ItemNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '評分項目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ScoreItem
-- ----------------------------
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1', '-1', 30.00, '服務安排', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-1', '1', 20.00, '專業能力', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-1-1', '1-1', 5.00, '服務對象評估及服務計畫安排管理', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-1-1-1', '1-1-1', 1.00, '依長照服務使用者/家屬之個人額度、照顧問題清單及照顧組合表擬定服務計畫', NULL, NULL, b'1');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-1-1-2', '1-1-1', 1.00, '與服務使用者或其家庭照顧者討論，擬定合適可行的照顧組合與服務安排', NULL, NULL, b'1');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-1-1-3', '1-1-1', 1.00, '服務計畫，包含醫療(如復能)、社會性服務項目', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-1-1-4', '1-1-1', 1.00, '依實際服務需求改變', NULL, NULL, b'1');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-1-1-5', '1-1-1', 1.00, '定期評估適時修正服務計畫安排', NULL, NULL, b'1');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-1-2', '1-1', 4.00, '服務使用者/ 家屬資訊充分溝通', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-1-2-1', '1-1-2', 2.00, '應提供服務使用者/家屬足夠資訊，與其討論服務計畫內容，尊重其意願，確認足夠的服務選擇權', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-1-2-2', '1-1-2', 2.00, '應依服務使用者/家屬特殊身心狀況，合理調整溝通方式，如易讀、溝通輔助、視覺提示…等支持，進行有效溝通', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-1-3', '1-1', 6.00, '服務資源安排與連結', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-1-3-1', '1-1-3', 2.00, '依服務計畫連結服務', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-1-3-2', '1-1-3', 2.00, '依服務使用者/家屬需求媒合多元性長照服務', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-1-3-3', '1-1-3', 2.00, '依服務使用者/家屬特殊需求進行責任通報與轉介(如家暴/自殺/高風險家庭照顧者…)', NULL, NULL, b'1');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-1-4', '1-1', 5.00, '服務追蹤與監測', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-1-4-1', '1-1-4', 2.00, '至少每月追蹤各項照顧服務安排情形，後續追蹤服務單位和轉介單位聯繫，瞭解和確認服務使用者是否得到適宜的服務', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-1-4-2', '1-1-4', 2.00, '對於服務使用者不能獲得適切的服務時，能提供其他選擇及必要的協助', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-1-4-3', '1-1-4', 1.00, '轉介及追蹤須依據轉介流程或辦法，並有相關處理紀錄', NULL, NULL, b'1');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-2', '1', 10.00, '資源盤點及服務媒合', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-2-1', '1-2', 8.00, '社區資源盤點與運用', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-2-1-1', '1-2-1', 2.00, '依服務區域進行相關長照之正式資源及非正式資源盤點，並建立長照服務相關資源名冊，定期更新', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-2-1-2', '1-2-1', 2.00, '轄區內合作之資源的類別是否完整，並說明各服務資源間合作運用情形', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-2-1-3', '1-2-1', 2.00, '訂定連結長照服務單位或其他相關單位派案及改派原則', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-2-1-4', '1-2-1', 2.00, '依據其派案原則落實之，並定期分析服務提供狀況', NULL, NULL, b'1');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-2-2', '1-2', 2.00, '社區資源網絡會議', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-2-2-1', '1-2-2', 1.00, '每年至少召開兩次邀集社區與長照服務相關之提供單位辦理個案研討會或社區服務合作協商會議', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '1-2-2-2', '1-2-2', 1.00, '透過社區相關資源網絡會議，共同解決服務使用者/家屬的需求', NULL, NULL, b'1');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2', '-1', 30.00, '行政管理頁面', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-1', '2', 10.00, '行政組織與管理', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-1-1', '2-1', 6.00, '組織架構與管理制度', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-1-1-1', '2-1-1', 2.00, '訂有單位組織架構及人員職責管理機制', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-1-1-2', '2-1-1', 2.00, '訂定單位工作手冊，並視需求修訂之', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-1-1-3', '2-1-1', 2.00, '單位應定期召開會議並由主管主持', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-1-2', '2-1', 4.00, '資訊公開', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-1-2-1', '2-1-2', 2.00, '明確提供相關合作單位服務內容與收費情形等手冊或單張資源', NULL, NULL, b'1');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-1-2-2', '2-1-2', 2.00, '明確公告單位連結各項服務收費內容及方式。並依其公告內容落實實施', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-2', '2', 10.00, '人員專業', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-2-1', '2-2', 6.00, '人力資源', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-2-1-1', '2-2-1', 3.00, '人員資格符合相關規定', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-2-1-2', '2-2-1', 3.00, '人員專職於業務工作範圍', NULL, NULL, b'1');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-2-2', '2-2', 3.00, '人員教育訓練', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-2-2-1', '2-2-2', 1.00, '新進人員依規定完成相關訓練', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-2-2-2', '2-2-2', 1.00, '訂有新進人員訓練辦法，落實實施並留有紀錄', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-2-2-3', '2-2-2', 1.00, '依人員不同需求訂有個管人員在職教育訓練辦法，落實實施並留有紀錄', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-2-3', '2-2', 1.00, '人員穩定度', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-2-3-1', '2-2-3', 1.00, '人員異動分析及因應措施', NULL, NULL, b'1');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-3', '2', 5.00, '個人資料管理與保密', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-3-1', '2-3', 5.00, '個人資料管理與保密機制', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-3-1-1', '2-3-1', 2.00, '訂有個人資料管理辦法，確實執行服務使用者資料保密', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-3-1-2', '2-3-1', 2.00, '資訊資料系統管理應設有權限', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-3-1-3', '2-3-1', 1.00, '配合政府相關資料提供與建檔', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-4', '2', 5.00, '與市政府合作情形及機制', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-4-1', '2-4', 5.00, '與市政府合作情形及機制', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-4-1-1', '2-4-1', 3.00, '按月(次月10日前)依服務實際情形於系統登打服務紀錄', NULL, NULL, b'1');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '2-4-1-2', '2-4-1', 2.00, '配合照管中心相關長照業務(聯繫會議及宣導)推展', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '3', '-1', 30.00, '服務品質', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '3-1', '3', 8.00, '服務品質', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '3-1-1', '3-1', 8.00, '個案管理時效', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '3-1-1-1', '3-1-1', 2.00, '訂有個案管理服務時效管控督導機制', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '3-1-1-2', '3-1-1', 3.00, 'A訪案及計畫依合約規定時效內完成', NULL, NULL, b'1');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '3-1-1-3', '3-1-1', 3.00, 'A 照會服務單位後，第一項服務依合約規定時效進入案家', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '3-1-2', '3-1', 4.00, '建立自主品質管理機制', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '3-1-2-1', '3-1-2', 2.00, '每年定期分析個案管理服務現況，資源連結現況', NULL, NULL, b'1');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '3-1-2-2', '3-1-2', 2.00, '自訂個案管理及服務提供單位提供服務品質監測指標與執行(指標至少兩項)', NULL, NULL, b'1');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '3-1-3', '3-1', 7.00, '跨專業團隊合作機制', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '3-1-3-1', '3-1-3', 3.00, '透過跨專業會議解決服務使用者/家庭的問題需求', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '3-1-3-2', '3-1-3', 4.00, '每季針對多重需求之服務使用者，邀請相關服務資源(至少三個跨專業領域)召開服務使用者個案討論會', NULL, NULL, b'1');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '3-1-4', '3-1', 4.00, '服務案量合理性', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '3-1-4-1', '3-1-4', 4.00, '每位個管服務量以不超過150人原則', NULL, NULL, b'1');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '3-1-5', '3-1', 7.00, '服務品質評值', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '3-1-5-1', '3-1-5', 4.00, '服務使用者/家屬對A服務提供現況與滿意度', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '3-1-5-2', '3-1-5', 3.00, '合作的服務單位對A服務提供現況與滿意度', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '4', '-1', 10.00, '使用者端意見與管理', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '4-1', '4', 4.00, '陳情處理機制', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '4-1-1', '4-1', 4.00, '陳情\r\n(申訴)流程設立處理', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '4-1-1-1', '4-1-1', 2.00, '建立陳情(申訴)機制並公告服務對象、家屬、員工週知', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '4-1-1-2', '4-1-1', 2.00, '依申訴處理機制處理並追蹤後續處理情形，視情況得通報市政府，請市政府介入協調', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '4-2', '4', 6.00, '使用者回饋處理機制', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '4-2-1', '4-2', 6.00, '運用\r\n回饋改善服務系統機制', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '4-2-1-1', '4-2-1', 2.00, '建立與使用者端(服務使用者/家屬)意見回饋交流機制並及時回應需求', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '4-2-1-2', '4-2-1', 2.00, '定期追蹤服務使用者(或家屬)的滿意度(包含服務使用者/家屬及合作夥伴)並追蹤處理', NULL, NULL, b'1');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '4-2-1-3', '4-2-1', 2.00, '運用回饋改善服務系統機制', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '5', '-1', 10.00, '其他加分', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '5-1', '5', 3.00, '主動開發新個案', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '5-1-1', '5-1', 3.00, '主動開發新個案', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '5-1-1-1', '5-1-1', 3.00, '主動拜訪連結社區，發掘開發長照需求服務使用者', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '5-2', '5', 2.00, '開發在地長照相關服務資源', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '5-2-1', '5-2', 2.00, '開發長照在地服務資源', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '5-2-1-1', '5-2-1', 2.00, '新開發在地長照相關服務資源，不限外部資源(不限長照支付制度之單位)，擴充區域服務量能', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '5-3', '5', 2.00, '融入多元文化元素之服務', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '5-3-1', '5-3', 2.00, '發展符合在地特色與文化之服務模式', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '5-3-1-1', '5-3-1', 2.00, '發展符合在地服務特色與文化特色之服務模式', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '5-4', '5', 2.00, '專業督導機制', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '5-4-1', '5-4', 2.00, '專業督導機制建立與執行', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '5-4-1-1', '5-4-1', 2.00, '單位設有專業督導機制以輔導工作人員專業執行', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '5-5', '5', 1.00, '其他', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '5-5-1', '5-5', 2.00, '其他有利於解決照顧安排與提供的各項措施', NULL, NULL, b'0');
INSERT INTO `ScoreItem` VALUES ('109', 'A', '5-5-1-1', '5-5-1', 1.00, '單位自行訂定並提供相關佐證資料', NULL, NULL, b'0');

-- ----------------------------
-- Table structure for UnitAMeeting
-- ----------------------------
DROP TABLE IF EXISTS `UnitAMeeting`;
CREATE TABLE `UnitAMeeting`  (
  `MSerialNo` int(11) NOT NULL AUTO_INCREMENT COMMENT '會議序號',
  `Year` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '年度',
  `INSTNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '機構代碼',
  `MType` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '1-社區資源網絡會議;;2-區域跨專業個案討論會',
  `MDate` date NULL DEFAULT NULL COMMENT '會議日期',
  `Topic` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '會議議題',
  `AttendNum` smallint(6) NULL DEFAULT NULL COMMENT '與會單位/人員數',
  `ProfCnt` smallint(6) NULL DEFAULT NULL COMMENT '專業人員種類數量',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT 'CreateDate',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT 'ModifyDate',
  PRIMARY KEY (`MSerialNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'A單位會議' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of UnitAMeeting
-- ----------------------------
INSERT INTO `UnitAMeeting` VALUES (1, '109', '001', '1', '2020-09-06', '444', 3, 0, '2020-09-04 00:00:00', '2020-09-04 00:00:00');
INSERT INTO `UnitAMeeting` VALUES (2, '109', '001', '2', '2020-06-01', 'test1', 12, 0, '2020-09-04 00:00:00', '2020-09-04 00:00:00');
INSERT INTO `UnitAMeeting` VALUES (5, '108', '001', '2', '2019-10-12', '123', 12, 3, '2020-09-04 00:00:00', '2020-09-04 00:00:00');
INSERT INTO `UnitAMeeting` VALUES (6, '109', '001', '2', '2020-06-02', 'tertert', 14, 3, '2020-09-04 00:00:00', '2020-09-04 00:00:00');
INSERT INTO `UnitAMeeting` VALUES (7, '109', '041', '1', '1996-10-22', '想開就開', 10, 0, '2020-09-08 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `UnitAMeeting` VALUES (8, '109', '041', '1', '2019-12-25', '很不想開', 10, 0, '2020-09-08 00:00:00', '2020-09-08 00:00:00');
INSERT INTO `UnitAMeeting` VALUES (9, '123', '041', '2', '1996-10-22', '123', 1, 2, '2020-09-08 00:00:00', '2020-09-08 00:00:00');

-- ----------------------------
-- Table structure for UnitAToBSum
-- ----------------------------
DROP TABLE IF EXISTS `UnitAToBSum`;
CREATE TABLE `UnitAToBSum`  (
  `Year` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '年度',
  `INSTNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '機構代碼',
  `TrSeialNo` smallint(6) NOT NULL COMMENT '流水序號',
  `LCareType` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '長照服務類別',
  `UnitBNo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'B單位機構代碼',
  `UnitBName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'B單位機構名稱',
  `TrCaseNum` int(11) NULL DEFAULT NULL COMMENT '轉介個案數',
  `CreateDate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'CreateDate',
  PRIMARY KEY (`Year`, `INSTNO`, `TrSeialNo`) USING BTREE,
  CONSTRAINT `FK_UNITATOB_REFERENCE_UNITAYEA` FOREIGN KEY (`Year`, `INSTNO`) REFERENCES `UnitAYear` (`Year`, `INSTNO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'A單位轉介B單位服務數量' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of UnitAToBSum
-- ----------------------------
INSERT INTO `UnitAToBSum` VALUES ('109', '041', 1, '004', '002as', '測試一', 5, '2020-09-08 00:00:00');
INSERT INTO `UnitAToBSum` VALUES ('109', '041', 2, '018', 'AH32882', '只是測試', 32, '2020-09-08 00:00:00');

-- ----------------------------
-- Table structure for UnitAYear
-- ----------------------------
DROP TABLE IF EXISTS `UnitAYear`;
CREATE TABLE `UnitAYear`  (
  `Year` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '年度',
  `INSTNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '機構代碼',
  `AreaCode` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '縣市區域代碼',
  `INSTName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '機構名稱',
  `INSTAddress` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `INSTTel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '電話',
  `MainAreas` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主服務地區',
  `SecAreas` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '次服務地區',
  `Contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '聯絡人',
  `ContactTel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '聯絡人電話',
  `EMail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '電子信箱',
  `EvalDate` date NULL DEFAULT NULL COMMENT '受評日期',
  `CreateDate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'CreateDate',
  `CreateUser` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'CreateUser',
  `Modifydate` datetime(0) NULL DEFAULT NULL COMMENT 'Modifydate',
  `ModifyUser` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ModifyUser',
  `IncDate` date NULL DEFAULT NULL COMMENT '成立日期',
  `AttrMed` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '醫事機構屬性',
  `AttrLC` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '長照機構屬性',
  `AttrOther` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其他屬性',
  `CityCode` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '縣市代碼',
  `ResignNum` int(11) NULL DEFAULT NULL COMMENT '年離職人數',
  `CMDBegYearNum` int(11) NULL DEFAULT NULL COMMENT '年初個管人數',
  `CMDPeriodAddNum` int(11) NULL DEFAULT NULL COMMENT '評鑑期間增加個管人數',
  PRIMARY KEY (`Year`, `INSTNO`) USING BTREE,
  INDEX `FK_UNITAYEA_REFERENCE_INSTBASE`(`INSTNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '年度A單位機構評鑑' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of UnitAYear
-- ----------------------------
INSERT INTO `UnitAYear` VALUES ('109', '001', NULL, '臺中市私立樂銀居家長照機構', '臺中市東 區富台里富台東街46號4樓之1 ', '04-22111154', NULL, NULL, '吳虹諭', '0932-530838', 'lovein292305@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '002', NULL, '社團法人臺中市秀老郎公益服務協會', '臺中市東 區振興里4鄰大公街57號', '0968-555635', NULL, NULL, '蔡文傑', '0925-536535', 'showold999@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '003', NULL, '有限責任臺中市橋僾照顧服務勞動合作社私立橋僾居家長照機構', '臺中市東 區十甲路35巷4弄8號', '04-22113361', NULL, NULL, '宋安琪', '0928-795913', 'angel0923angel@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '004', NULL, '美安居家護理所', '臺中市太平區勤益里中山路1段158號1樓', '04-22795617', NULL, NULL, '田宜欣', '04-22795617\n0906-812448', 'ethan66tien@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '005', NULL, '福碩護理之家', '臺中市烏日區烏日里公園路242-1號', '04-23386608\n04-23387328', NULL, NULL, '黃馨平', '04-23387328', 'v620234@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '006', NULL, '財團法人中華民國佛教慈濟慈善事業基金會(沙鹿區)', '臺中市沙鹿區美仁里鎮南路二段472號', '04-26317289', NULL, NULL, '呂怡靜', '04-26317289/0980447458', 'ltc000231@tzuchi.org.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '007', NULL, '仁美護理之家', '臺中市梧棲區仁美街33巷48號', '0982-732605', NULL, NULL, '蔡進哲', '04-26918054', 'jmei9955@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '008', NULL, '財團法人臺中市私立康家社會福利慈善基金會附設臺中市私立康美居家是服務類長期照顧服務機構', '臺中市后里區墩西里富春路53巷10號2樓', '04-26883559/04-25583360', NULL, NULL, '吳彥岑', '04-25583360/0966-650879', 'Kangmei2018@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '009', NULL, '仁惠護理之家', '臺中市清水區橋頭里鎮新二街105號', '04-26227689', NULL, NULL, '蔡文慧', '04-26227689', 'rhhome2005@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '010', NULL, '佛教慈濟醫療財團法人台中慈濟醫院', '臺中市潭子區豐興路一段88號', '04-36060666#4153', NULL, NULL, '林怡嘉', '04-36060666#4153', 'yichia@tzuchi.com.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '011', NULL, '臺中市私立愛老郎老人長期照顧中心(養護型)', '臺中市豐原區東湳里三豐路二段396巷69號', '04-25293499', NULL, NULL, '許菊芬', '04-25293499', 'love25293499@hotmail.com.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '012', NULL, '光田醫療社團法人光田綜合醫院(龍井區)', '臺中市龍井區山腳里22鄰沙田路六段211號2樓', '04-26367200', NULL, NULL, '紀珮君', '04-26367200', 'peggy660217@yahoo.com.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '013', NULL, '臺中市私立杏恩居家長照機構', '臺中市北 區邱厝里大義街9號1樓', '04-22356000', NULL, NULL, '張鈞淳', '04-22356000\n0975493482', 'simann10803@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '014', NULL, '鈺善園護理之家', '臺中市北 區華中街30號', '04-22018698', NULL, NULL, '凌家如', '0920-038547', 'lingchiaju@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '015', NULL, '佛教慈濟醫療財團法人附設台中慈濟護理之家(西屯區)', '臺中市西屯區安和路103號', '04-36060666#3012', NULL, NULL, '李玉茹', '04-36060666#3539\n0970352378', 'tc209270@tzuchi.com.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '016', NULL, '社團法人台中市物理治療師公會', '臺中市西 區民生里22鄰法院前街15號4樓之1', '04-22220329', NULL, NULL, '巫秀珍', '0926-312320', 'taichungpt.longcare@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '017', NULL, '財團法人伊甸社會福利基金會附設臺中市私立臺中居家式服務類長期照顧服務機構', '臺中市大里區大元里10鄰中興路二段48號2樓', '04-24870030', NULL, NULL, '李家豪', '04-24870030#214', 'eden6138@eden.org.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '018', NULL, '祥和長照服務有限公司私立祥和居家長照機構', '臺中市南區大慶街2段11-63巷3弄20號1樓', '04-22658099\n04-22658079', NULL, NULL, '黃聖富', '0930-31805', 'singabcms14@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '019', NULL, '社團法人台灣健康整合服務協會', '臺中市北屯區松安里松竹路二段227號', '04-22432683', NULL, NULL, '洪曼珊', '0937-122794', 'cherryhung0717@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '020', NULL, '專業居家護理所', '臺中市北屯區軍功里軍和街39號1樓', '04-24368221', NULL, NULL, '呂郁芳', '0988-015335', 'yvlu5483@yahoo.com.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '021', NULL, '社團法人臺中市大恆樂齡協會', '臺中市南屯區文昌街226巷46號', '04-23802117', NULL, NULL, '王仁傑', '0958-567559', 'Dahn9696@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '022', NULL, '財團法人臺中市私立豐盛社會福利慈善事業基金會', '臺中市南屯區楓樹里楓和路701號', '04-24792569', NULL, NULL, '劉映彤', '04-24792569', 'hueiching07@yahoo.com.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '023', NULL, '維恩耳鼻喉科診所', '臺中市東勢區延平里豐勢路374號', '0978-762790', NULL, NULL, '傅思維', '0978-762790', 'szuwei6812@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '024', NULL, '財團法人中華民國佛教慈濟慈善事業基金會(東勢區)', '臺中市東勢區北興里三民街199號', '04-25881988', NULL, NULL, '廖珮琳', '04-25881988', 'ltc000280@tzuchi.org.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '025', NULL, '財團法人臺灣省私立永信社會福利基金會', '臺中市大甲區水源路167號2樓', '04-26803511', NULL, NULL, '吳曉菁', '0918-619190', 'u90237@yungshingroup.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '026', NULL, '財團法人臺灣省私立永信社會福利基金會', '臺中市清水區鎮政路99巷10號', '04-26270812', NULL, NULL, '江瑞敏', '04-26270812#320、0937-278719', 'u90206@yungshingroup.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '027', NULL, '社團法人臺中市紅十字會附設居家長照機構', '臺中市中 區綠川里綠川西街145號7樓', '04-22222411', NULL, NULL, '廖惠玲', '04-22222411#321', 'homecare@redcross.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '028', NULL, '財團法人全成社會福利基金會', '臺中市南屯區忠勇路23-12號2樓', '04-23890243', NULL, NULL, '郭姿秀', '04-23890243', 'qc21408721@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '029', NULL, '真善美復能物理治療所', '臺中市大肚區大東里自由路218號', '04-26990005', NULL, NULL, '趙冠晴', '04-26990005', 'tgbptclinic@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '030', NULL, '臺中市好伴照顧協會', '臺中市大肚區大肚里13鄰紙廠路53號', '04-26990552', NULL, NULL, '趙文瑛', '0955-803669', 'gchome2699@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '031', NULL, '社團法人臺中市大大人長期照顧關懷協會私立居家長照機構(清水區)', '臺中市清水區中華路327號', '04-25610166', NULL, NULL, '蕭懿含', '04-25610166', 'hc004@dadazen', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '032', NULL, '財團法人中華民國佛教慈濟慈善事業基金會(清水區)', '臺中市清水區秀水里13鄰五權路267號', '04-26283125', NULL, NULL, '呂怡靜', '04-26283125/0980-447458', 'ltc000231@tzuchi.org.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '033', NULL, '財團法人老五老基金會', '臺中市石岡區梅子里8鄰豐勢路503之1號', '04-25822133', NULL, NULL, '利欣頤', '04-25822133', 'ts@ofo.org.tw\nsinyi@ofo.org.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '034', NULL, '臺中市私立有春居家式服務類長期照顧服務機構', '臺中市豐原區中山路220-5號', '04-25156292', NULL, NULL, '劉美珠', '0911-148968', 'st01234562018@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '035', NULL, '倚飛科技有限公司附設臺中市私立天心居家長照機構', '臺中市西屯區何德里大信街60號6樓之3', '04-36091549', NULL, NULL, '張明毅', '0958-256037', 'belinda850304@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '036', NULL, '臺中榮民總醫院', '臺中市西屯區台灣大道四段1650號', '04-23592525#6011.8199.8198', NULL, NULL, '鄧喬鳳', '04-23592525#6019', 'dcf@vghtc.gov.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '037', NULL, '李綜合醫療社團法人大甲李綜合醫院', '臺中市大甲區平安里11鄰八德街2號', '04-26862288', NULL, NULL, '曾世懷', '0978-728695、04-26862288轉2183', 'c03018@leehospital.com.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '038', NULL, '社團法人台灣福氣社區關懷協會', '臺中市清水區清水里10鄰中山路66號', '04-26570600', NULL, NULL, '郭怡君', '04-2657-0600', 'sow0414@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '039', NULL, '翔新診所', '臺中市太平區立德街10巷17號', '04-35090317\n04-22153133', NULL, NULL, '陳品蓉', '04-35090317、04-22153133', 'care.elderly768@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '040', NULL, '瞳馨居家護理所', '臺中市太平區光明里9鄰大興11街125巷29號1樓', '0900-177920', NULL, NULL, '李岳欣', '0986-960218', 'tunghsing1071219@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '041', '08401', '社團法人台中市社會關懷服務協會私立活力勇居家長照機構', '臺中市東 區雙十路一段4-33號9樓之3', '04-22126765', NULL, NULL, '柯欣慧', '04-22126765', 'east40146@gmail.com', NULL, '2020-09-08 01:21:00', '0422126765', '2020-09-08 00:00:00', NULL, NULL, NULL, NULL, NULL, '08', NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '042', NULL, '美家人力資源股份有限公司附設私立樂齡居家長照機構', '臺中市東 區三賢街166號', '04-35077388#302', NULL, NULL, '陳如珊', '0976-536761', 'lovelinghouse@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '043', '08438', '私立長照好幫手居家長照機構', '臺中市外埔區甲后路五段128巷66號3樓之1', '04-26765859', NULL, NULL, '李麗琴', '0900-783315', 'Aqd3652@gmail.com', NULL, '2020-09-07 07:47:43', '0426765859', '2020-09-07 00:00:00', NULL, NULL, NULL, NULL, NULL, '08', NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '044', NULL, '臺中市私立妙純居家式服務類長期照顧服務機構', '臺中市神岡區大社里大漢街31巷16弄23號', '04-25295729', NULL, NULL, '吳婉琪', '04-25295729', 'amy062388@yahoo.com.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '045', NULL, '維弘復健科診所', '臺中市大雅區大雅里民興街63號', '04-25681919', NULL, NULL, '李育真', '0986-616281', 'Piggy2229@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '046', NULL, '財團法人台中市私立龍眼社會福利慈善事業基金會附設私立龍眼林居家長照機構', '臺中市大雅區民權街147號', '04-25682195', NULL, NULL, '高雅慧', '04-25682195', 'lon.ho@msa.hinet.net', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '047', NULL, '仁馨護理之家', '臺中市大甲區奉化里011鄰經國路789號', '04-26863000#6121、6122', NULL, NULL, '李征寰', '04-26863000#6121', 'Care.manager@renshin.com.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '048', NULL, '高銘診所', '臺中市大安區中山南路249號', '04-26715618', NULL, NULL, '任苡瑄', '0983-936995', 'home26715618@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '049', NULL, '光田醫療社團法人光田綜合醫院(沙鹿區)  ', '臺中市沙鹿區大同街5-2號', '04-26365000轉2151或2152', NULL, NULL, '紀珮君', '04-26367200', 'peggy660217@yahoo.com.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '050', NULL, '童綜合醫療社團法人童綜合醫院', '臺中市梧棲區文華街28巷131號', '04-26581919#4410', NULL, NULL, '林玟秀', '04-26581919#54410', 't3240@ms.sltung.com.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '051', NULL, '財團法人台中市私立甘霖社會福利慈善事業基金會', '臺中市中 區柳川里柳川東路三段5號2樓之1', '04-22207818', NULL, NULL, '吳湘凌', '04-22207818', 'glsfdaycare@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '052', NULL, '社團法人台灣福氣社區關懷協會(西屯區)', '臺中市西屯區逢甲路253巷47號', '04-27003618', NULL, NULL, '鄭宇晴', '0921-483925', 'olwchingcheng@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '053', NULL, '真善美居家護理所', '臺中市大里區金城里35鄰成功路51巷16弄1號1樓', '04-24915128', NULL, NULL, '吳淑榕', '0923-609581', 'Tgb24074168@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '054', NULL, '佛教慈濟醫療財團法人附設台中慈濟護理之家(潭子區)', '臺中市潭子區豐興路一段66號', '04-36060666#8080', NULL, NULL, '林翊嘉', '04-36060666#3854、0972-724598', 'tc2033103@tzuchi.com.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '055', NULL, '芳林樂活事業有限公司附設私立芳林居家長照機構', '臺中市豐原區社皮里豐原大道一段291號一樓', '04-25263858\n04-25263958', NULL, NULL, '林孟妃', '04/25263858', 'judy.yang5511@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '056', '08414', '財團法人臺中市私立童庭社會福利慈善事業基金會', '臺中市烏日區九德里20鄰長春街373巷52號', '04-23360996', '', NULL, '謝汶宜', '04-23360996', 'ttcharity@gmail.com', NULL, '2020-09-08 01:24:56', '0423360996', '2020-09-08 00:00:00', NULL, NULL, NULL, NULL, NULL, '08', NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '057', NULL, '社團法人中華仁仁關懷協會', '臺中市烏日區烏日里5鄰公園路168號', '04-23378067', NULL, NULL, '許皓', '04-23378067', 'qsmaster23378067@qingsong.com.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '058', NULL, '衛生福利部臺中醫院', '臺中市西 區三民路一段199號', '0422294411#6220.6221', NULL, NULL, '徐瑪玲', '04-22294411#5406/0910', 'b2372506@taic.mohw.gov.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '059', '08403', '龍井新庄藥局', '臺中市西 區模範街34巷10號', '04-22855011', NULL, NULL, '吳許暉', '04-22855011/0911-780654', 'Winnin.wu@gmail.com', NULL, '2020-09-08 01:13:06', '0422855011', '2020-09-08 00:00:00', NULL, NULL, NULL, NULL, NULL, '08', NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '060', '08404', '財團法人天主教曉明社會福利基金會', '臺中市北 區漢口路四段21號', '04-22974225', NULL, NULL, '陳淑芬', '04-22974225#243', 'protection546@gmail.com', NULL, '2020-09-08 01:13:06', '0422974225', '2020-09-08 00:00:00', NULL, NULL, NULL, NULL, NULL, '08', NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '061', NULL, '財團法人台中市私立真愛社會福利慈善事業基金會', '臺中市北 區永興街338號', '04-22380563', NULL, NULL, '唐瑋澤', '04-22380563', '201702ho@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '062', '08406', '春暉居家護理所', '臺中市北屯區太原路3段161號3樓之6', '04-22378557', NULL, NULL, '胡淑芬', '04-22378557、0935-354268', 'springhu087@gmail.com', NULL, '2020-09-08 01:13:06', '', '2020-09-07 00:00:00', NULL, NULL, NULL, NULL, NULL, '08', NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '063', NULL, '財團法人老五老基金會', '臺中市北屯區天津路四段27號', '04-22370006', NULL, NULL, '吳德偉', '04-22370006', 'woodway@ofo.org.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '064', NULL, '臺中市私立林燕玲居家式服務類長期照顧服務機構', '臺中市豐原區田心里育仁路186號', '04-25254607', NULL, NULL, '林燕玲', '04-25254607', 'inch79326@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '065', NULL, '社團法人臺中市大大人長期照護關懷協會', '臺中市神岡區庄前里三民南路6號', '04-25610166', NULL, NULL, '黃世睿', '04-25610166', 'dadazenltc@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '066', NULL, '好樂齡銀髮事業有限公司附設臺中市私立顧老照居家式服務類長期照顧服務機構', '臺中市北屯區平田里文心路四段955號4樓之4', '04-22474455', NULL, NULL, '林峻宏', '0910-453079', 'chlin628@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '067', NULL, '臺中市私立天德居家式服務類長期照顧服務機構', '臺中市北屯區平福里安順東七街55號', '04-22475923', NULL, NULL, '葉秀美', '04-22475923\n0958-221698', 'tdhomecare2@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '068', NULL, '財團法人弘道老人福利基金會附設臺中市私立弘道第一區居家式服務類長期照顧服務機構', '臺中市西屯區中工三路199號2樓', '04-23505555', NULL, NULL, '全揚恩', '04-23505555#19', 'hondao.middle@hondao.org.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '069', NULL, '財團法人中華民國佛教慈濟慈善事業基金會(南屯區)', '臺中市南屯區文心南路113號', '04-24739090', NULL, NULL, '廖珮琳', '04-24739090', 'ltc000280@tzuchi.org.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '070', NULL, '本堂澄清醫院附設護理之家', '臺中市霧峰區本堂里22鄰育成路28號', NULL, NULL, NULL, '陳琮勛', '04-23391000', 'btnh110@gmail.com\nbtnh4557@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '071', NULL, '健民健康有限公司附設私立阿罩霧A埕居家長照機構', '臺中市霧峰區萬豐里17鄰中正路146之8號', NULL, NULL, NULL, '楊珮', '0983-823792', 'jianmin74@yahoo.com.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '072', NULL, '小太陽藥局', '臺中市東勢區豐勢路412之1、416號1樓', '04-25773481', NULL, NULL, '黃毓茹', '0966-300330', 'depletedark@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '073', NULL, '洪幸雪居家護理所', '臺中市新社區興社街二段17-6號3樓', '04-25826213', NULL, NULL, '羅翊慈', '04-25826213', 'singsnow2005@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '074', NULL, '財團法人弘道老人福利基金會附設臺中市私立弘道第二區居家式服務類長期照顧服務機構', '臺中市大里區瑞城里成功路520號2樓', '04-36091518#27', NULL, NULL, '王偉蘋', '04-36091518#27', 'office412@hondao.org.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '075', NULL, '仁愛醫療財團法人大里仁愛醫院', '臺中市大里區東榮路483號', '04-24819900#55306.55307', NULL, NULL, '陳佩容', '04-24819900#55306', 'jah6079@mail.jah.org.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '076', NULL, '健康居家護理所', '臺中市北屯區三和里1鄰東山路一段50巷97號1樓', '04-24374149', NULL, NULL, '呂佳雯', '0928-183381', 'Healthcare201314@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '077', NULL, '明康居家護理所', '臺中市北屯區平合里綏遠路二段209號', '04-22476877', NULL, NULL, '張靜宜', '04-22431105、0963-433555', 'ccijenny@hotmail.com.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '078', NULL, '財團法人臺中市私立家寶社會福利慈善事業基金會附設私立居家長照機構', '臺中市沙鹿區鹿寮里成功西街33號2F', '04-26623196', NULL, NULL, '陳家聖', '04-26623196#60', 't7841@ms.sltung.com.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '079', NULL, '社團法人台灣福氣社區關懷協會', '臺中市梧棲區大仁路二段349號', '04-26570600', NULL, NULL, '郭怡君', '04-26570600', 'sow0414@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '080', NULL, '大慶居家護理所', '臺中市南區五權南路326號1-2樓', '04-22655948\n04-22658453', NULL, NULL, '蔡子敏', '04-22655948、0933-139961', 'm45779779@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '081', NULL, '臺中市私立香柏木居家式服務類長期照顧服務機構', '臺中市烏日區湖日里榮泰街163巷2號1樓', '0900-790166', NULL, NULL, '王莉雅', '04-22630062', 'cachservice@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '082', NULL, '中山醫學大學附設醫院', '臺中市和平區南勢里10鄰東關路三段161之2號', '04-25941881', NULL, NULL, '顏啟華', '04-24739595*34955', 'cshy352@csh.org.tw', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '083', NULL, '臺中市私立康復醫學居家長照機構', '臺中市和平區南勢里崑崙巷4號', '0989-434736', NULL, NULL, '陳海藍', '0989-434736', 'ok0708@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '085', NULL, '財團法人中華基督教福音信義傳道會', '臺中市東勢區中興街43號', '04-25772525', NULL, NULL, '張劭華', '04-25772525', 'syabc106@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `UnitAYear` VALUES ('109', '086', NULL, '有限責任臺灣伯拉罕共生照顧勞動合作社私立伯拉罕居家長照機構', '臺中市和平區達觀里東崎路一段育英巷17-5號1樓', '04-25912019', NULL, NULL, '黃珮婷', '0952-881477', 'pthuang327@gmail.com', NULL, '2020-09-07 07:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sequence
-- ----------------------------
DROP TABLE IF EXISTS `sequence`;
CREATE TABLE `sequence`  (
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `current_value` int(11) NOT NULL,
  `increment` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sequence
-- ----------------------------
INSERT INTO `sequence` VALUES ('HRSeq', 0, 1);

-- ----------------------------
-- Function structure for CalDiffDateNoH
-- ----------------------------
DROP FUNCTION IF EXISTS `CalDiffDateNoH`;
delimiter ;;
CREATE DEFINER=`root`@`%` FUNCTION `CalDiffDateNoH`(date1 DATE, date2 DATE) RETURNS int(11)
    DETERMINISTIC
BEGIN
  /*RETURN DATEDIFF(date1,date2) - (SELECT COUNT(0) FROM Calendar WHERE CALDate >= DATE_ADD(date2,INTERVAL 1 DAY) AND CALDate <= date1 AND CALType='H'); */
	RETURN case when date1<>date2 then DATEDIFF(date1,date2) - (SELECT COUNT(0) FROM Calendar WHERE CALDate >= DATE_ADD(date2,INTERVAL 1 DAY) AND CALDate <= date1 AND CALType='H')
						  when date1=date2 and (SELECT COUNT(0) FROM Calendar where CALDate=date1 and CALType='H') = 1 then 0 
							when date1=date2 and (SELECT COUNT(0) FROM Calendar where CALDate=date1 and CALType='H') = 0 then 1 end; 
END
;;
delimiter ;

-- ----------------------------
-- Function structure for currval
-- ----------------------------
DROP FUNCTION IF EXISTS `currval`;
delimiter ;;
CREATE DEFINER=`root`@`%` FUNCTION `currval`(seq_name VARCHAR(50)) RETURNS int(11)
    DETERMINISTIC
BEGIN
	 DECLARE value INTEGER; 
	SET value = 0; 
	SELECT current_value INTO value 
	FROM sequence
	WHERE name = seq_name; 
	RETURN value; 
END
;;
delimiter ;

-- ----------------------------
-- Function structure for nextval
-- ----------------------------
DROP FUNCTION IF EXISTS `nextval`;
delimiter ;;
CREATE DEFINER=`root`@`%` FUNCTION `nextval`(seq_name VARCHAR(50)) RETURNS int(11)
    DETERMINISTIC
BEGIN
	 UPDATE sequence
	SET current_value = current_value + increment 
	WHERE name = seq_name; 
	RETURN currval(seq_name); 

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for OpenUpCaseSvr
-- ----------------------------
DROP PROCEDURE IF EXISTS `OpenUpCaseSvr`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OpenUpCaseSvr`(EvalYear varchar(3))
BEGIN
 DECLARE i int DEFAULT 1;
        
				DECLARE dtBeg date	DEFAULT '2019-01-01';       

        drop table TempYear;
        CREATE TEMPORARY TABLE TempYear
        ( ChiYM CHAR(6) );

         WHILE (i<=17) DO
              INSERT INTO TempYear VALUES(DATE_FORMAT(dtBeg, '%Y%m')-191100);

                SET dtBeg=DATE_ADD(dtBeg,interval 1 MONTH);
								set i=i+1;

        END WHILE;
 
        -- insert into casesvr (Year,INSTNO,YM)        
				-- select A.`Year`,A.INSTNO,B.ChiYM   from unitayear A ,TempYear B  where A.Year=EvalYear  order by A.Year,A.INSTNO,B.ChiYM  ;
        insert into casesvreff (Year,INSTNO,YM,SvrType)        
				 select A.`Year`,A.INSTNO,B.ChiYM,'01'   from unitayear A ,TempYear B  where A.Year=EvalYear order by A.Year,A.INSTNO,B.ChiYM  ;
        insert into casesvreff (Year,INSTNO,YM,SvrType)        
				 select A.`Year`,A.INSTNO,B.ChiYM,'02'   from unitayear A ,TempYear B where A.Year=EvalYear order by A.Year,A.INSTNO,B.ChiYM  ;
        insert into casesvreff (Year,INSTNO,YM,SvrType)        
				 select A.`Year`,A.INSTNO,B.ChiYM,'03'   from unitayear A ,TempYear B where A.Year=EvalYear order by A.Year,A.INSTNO,B.ChiYM  ;    

        drop table TempYear;
				

END
;;
delimiter ;

-- ----------------------------
-- Function structure for setval
-- ----------------------------
DROP FUNCTION IF EXISTS `setval`;
delimiter ;;
CREATE DEFINER=`root`@`%` FUNCTION `setval`(seq_name VARCHAR(50), value INTEGER) RETURNS int(11)
    DETERMINISTIC
BEGIN
UPDATE sequence
SET current_value = value 
WHERE name = seq_name; 
RETURN currval(seq_name); 

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for UpdateNewCaseSvr
-- ----------------------------
DROP PROCEDURE IF EXISTS `UpdateNewCaseSvr`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `UpdateNewCaseSvr`( EvalYear varchar(3),UnitAInstNo varchar(20) )
BEGIN 
update CaseSvrEff A inner join
 ( 
  select  Year,
					InstNo,
					DATE_FORMAT(StartDate, '%Y%m')-191100 YM,
					'01' SvrType,
					Sum(CalDiffDateNoH(SignDate,StartDate)) Days,
					Sum(CalDiffDateNoH(SignDate,StartDate)) UpDays,
					count(*) UpCnt ,  
					count(*) TCnt  
		 from CaseSvrRec 
		where Year=EvalYear 
		  and InstNo= UnitAInstNo 
    group by Year,InstNo,DATE_FORMAT(StartDate, '%Y%m') 	
	  union all	
  select  Year,
					InstNo,
					DATE_FORMAT(SignDate, '%Y%m')-191100 YM,
					'02' SvrType,
					Sum(CalDiffDateNoH(CFDate,SignDate)) Days, 
					sum( case when CalDiffDateNoH(CFDate,SignDate)<=4 and CalDiffDateNoH(CFDate,SignDate) > 0 then CalDiffDateNoH(CFDate,SignDate) else 0 end ) UpDays,
					sum(case when CalDiffDateNoH(CFDate,SignDate)<=4 and CalDiffDateNoH(CFDate,SignDate) > 0 then 1 else 0 end ) UpCnt,	
					count(*) TCnt  
		 from CaseSvrRec 
		where `Year`=EvalYear 
		  and InstNo= UnitAInstNo 
    group by Year,InstNo,DATE_FORMAT(SignDate, '%Y%m') 	
	  union all 
	select  Year,
				  InstNo,
					DATE_FORMAT(AToBDate, '%Y%m')-191100 YM ,
					'03' SvrType,
					Sum(CalDiffDateNoH(FirstSvrDate,AToBDate)) Days ,
					sum( case when CalDiffDateNoH(FirstSvrDate,AToBDate)<=5 and CalDiffDateNoH(FirstSvrDate,AToBDate) > 0 then CalDiffDateNoH(FirstSvrDate,AToBDate) else 0 end ) UpDays,
					sum(case when CalDiffDateNoH(FirstSvrDate,AToBDate)<=5 and CalDiffDateNoH(FirstSvrDate,AToBDate) > 0 then 1 else 0 end ) UpCnt,
					count(*) Cnt 	
     from CaseSvrRec  where `Year`=EvalYear and InstNo= UnitAInstNo 
    group by Year,InstNo,DATE_FORMAT(AToBDate, '%Y%m')
	) B on A.Year=B.Year 
	   and A.InstNo=B.InstNo 
		 and A.YM=B.YM 
		 and A.SvrType=B.SvrType
	  set  A.CaseNum=B.TCnt, 
				 A.CaseUpNum=B.UpCnt ,  
				 A.CaseUpDays=B.UpDays, 
				 A.CaseDays=B.Days ,
	       A.UpAvgDays=Round(CAST(B.UpDays as DECIMAL(8,4))/(case when B.TCnt =0 then null else B.TCnt end ),4),
		  	 A.UpCasePer=Round(Cast(B.UpCnt as DECIMAL(8,4))/(case when B.TCnt =0 then null else B.TCnt end ),4);
  update CaseSvr A inner join 
 (select Year,
				 YM,
				 INSTNO,
				 ifnull(CaseNum,0) NewCnt 
	  from CaseSvrEff 
	 where Year=EvalYear 
	   and SvrType='01' 
		 and INSTNO=UnitAInstNo   )  B 
      on A.`Year`=B.`Year` 
		 and A.INSTNO=B.INSTNO 
		 and A.YM=B.YM 
     set A.CMDCCntMonth= Round((B.NewCnt+ifnull(A.OldCaseNum,0)+ifnull(A.TraceCaseTotal,0)-ifnull(A.PartPeoNum,0)*75)/A.FullPeoNum,1);
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
