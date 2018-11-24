-- --------------------------------------------------------
-- 호스트:                          10.80.162.67
-- 서버 버전:                        10.3.9-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- map 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `map` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `map`;

-- 테이블 map.file 구조 내보내기
CREATE TABLE IF NOT EXISTS `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uploaderId` varchar(45) NOT NULL,
  `projectId` int(11) NOT NULL,
  `originalFilename` varchar(300) NOT NULL,
  `savedFilename` varchar(300) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `memo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_File_uploaderId_Member_id` (`uploaderId`),
  KEY `FK_File_projectId_Project_id` (`projectId`),
  CONSTRAINT `FK_File_projectId_Project_id` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_File_uploaderId_Member_id` FOREIGN KEY (`uploaderId`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 테이블 데이터 map.file:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT IGNORE INTO `file` (`id`, `uploaderId`, `projectId`, `originalFilename`, `savedFilename`, `timestamp`, `memo`) VALUES
	(1, '1', 1, 'test1.png', 'test(1).png', '2018-10-27 11:43:31', 'TEST 파일'),
	(2, '1', 2, 'test1.png', 'test(2).png', '2018-10-27 11:44:00', 'TEST 파일 2');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;

-- 테이블 map.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `id` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 map.member:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT IGNORE INTO `member` (`id`, `password`, `name`, `email`) VALUES
	('1', 'test', 'test', 'test@test.com');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

-- 테이블 map.project 구조 내보내기
CREATE TABLE IF NOT EXISTS `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `subject` varchar(45) NOT NULL,
  `due` datetime NOT NULL,
  `creator` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_project_member` (`creator`),
  CONSTRAINT `FK_project_member` FOREIGN KEY (`creator`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 테이블 데이터 map.project:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT IGNORE INTO `project` (`id`, `name`, `subject`, `due`, `creator`) VALUES
	(1, 'TEST', '수학', '2018-11-24 14:42:39', '1'),
	(2, 'TEST2', '국어', '2018-10-27 14:42:57', '1'),
  (3, 'TEST3', '과학', '2018-10-25 14:42:57', '1');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;

-- 테이블 map.projectmember 구조 내보내기
CREATE TABLE IF NOT EXISTS `projectmember` (
  `projectId` int(11) NOT NULL AUTO_INCREMENT,
  `memberId` varchar(45) NOT NULL,
  PRIMARY KEY (`projectId`,`memberId`),
  KEY `FK_ProjectMember_memberId_Member_id` (`memberId`),
  CONSTRAINT `FK_ProjectMember_memberId_Member_id` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`),
  CONSTRAINT `FK_ProjectMember_projectId_Project_id` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 테이블 데이터 map.projectmember:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `projectmember` DISABLE KEYS */;
INSERT IGNORE INTO `projectmember` (`projectId`, `memberId`) VALUES
	(1, '1'),
	(2, '1'),
  (3, '1');
/*!40000 ALTER TABLE `projectmember` ENABLE KEYS */;

-- 테이블 map.timeline 구조 내보내기
CREATE TABLE IF NOT EXISTS `timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NOT NULL,
  `memberId` varchar(45) NOT NULL,
  `comment` varchar(45) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_TimeLine_projectId_Project_id` (`projectId`),
  KEY `FK_TimeLine_memberId_Member_id` (`memberId`),
  CONSTRAINT `FK_TimeLine_memberId_Member_id` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`),
  CONSTRAINT `FK_TimeLine_projectId_Project_id` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 테이블 데이터 map.timeline:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `timeline` DISABLE KEYS */;
INSERT IGNORE INTO `timeline` (`id`, `projectId`, `memberId`, `comment`, `timestamp`) VALUES
	(1, 1, '1', 'TEST', '2018-10-11 16:54:36');
/*!40000 ALTER TABLE `timeline` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
