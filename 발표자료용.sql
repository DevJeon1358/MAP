-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.3.9-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.4.0.5125
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- 테이블 데이터 map.file:~13 rows (대략적) 내보내기
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` (`id`, `uploaderId`, `projectId`, `originalFilename`, `savedFilename`, `timestamp`, `memo`) VALUES
	(2, '1', 2, 'test1.png', 'test(2).png', '2018-10-27 11:44:00', 'TEST 파일 2'),
	(3, '1', 7, 'Dta9OaCU4AA46wv.jpg', 'Dta9OaCU4AA46wv.jpg', '2018-12-14 11:55:09', '수정 1'),
	(5, '1', 7, '인터럽트-금지.hwp', '인터럽트-금지.hwp', '2018-12-18 13:34:12', ''),
	(6, 'jeongmin', 8, 'DLinkedListSortMain.c', 'DLinkedListSortMain.c', '2018-12-18 17:02:58', '메인'),
	(7, 'zxcvbn', 8, 'DLinkedList.c', 'DLinkedList.c', '2018-12-18 17:14:20', '수정 1'),
	(8, 'rhkrguswns', 8, 'InsertionSort.c', 'InsertionSort.c', '2018-12-18 17:16:10', '삽입정렬'),
	(9, 'zxcvbn', 9, 'DjMX_ntU0AEoU3h.jpg', 'DjMX_ntU0AEoU3h12.jpg', '2018-12-18 17:22:33', '수정 파일'),
	(10, 'rhkrguswns', 9, '다이어그램(최종).PNG', '다이어그램(최종).PNG', '2018-12-18 17:23:31', '최종수정파일'),
	(11, 'jeongmin', 10, '인터럽트-금지.hwp', '인터럽트-금지1.hwp', '2018-12-18 17:25:41', '인터럽트 정의'),
	(12, 'jeongmin', 12, 'new.jsp', 'new.jsp', '2018-12-18 17:34:23', 'new.jsp Update'),
	(13, 'asdfgh', 12, 'HomeServlet.java', 'HomeServlet.java', '2018-12-18 17:34:33', 'home'),
	(16, 'zxcvbn', 12, 'data.sql', 'data.sql', '2018-12-18 17:38:30', 'DB'),
	(17, 'rhkrguswns', 12, 'README.md', 'README.md', '2018-12-18 17:39:10', 'DB');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;

-- 테이블 map.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `id` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 map.member:~9 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`id`, `password`, `name`, `email`) VALUES
	('', '', '', ''),
	('1', 'test', 'test', 'test@test.com'),
	('2', '2', '2', '2'),
	('asdfgh', '1234', '이주영', 'asdfgh@dgsw.hs.kr'),
	('jeongmin', 'test', '최정민', 'vnfsl1@dgsw.hs.kr'),
	('qwerty', '1234', '이소은', 'qwerty@dgsw.hs.kr'),
	('rhkrguswns', '1234', '곽현준', 'rhkrguswns@dgsw.hs.kr'),
	('wjdalsdl', '1234', '신민수', 'wjdalsdl@dgsw.hs.kr'),
	('zxcvbn', '1234', '전광용', 'zxcvbn@dgsw.hs.kr');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- 테이블 데이터 map.project:~16 rows (대략적) 내보내기
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` (`id`, `name`, `subject`, `due`, `creator`) VALUES
	(1, 'TEST', '국어', '2018-11-27 14:42:39', '1'),
	(2, 'TEST2', '국어', '2018-10-27 14:42:57', '1'),
	(3, '3', '3', '2018-11-24 17:00:00', '1'),
	(4, 'test3', '영어', '2019-01-01 12:05:00', '1'),
	(5, '조별과제1', '소프트웨어공학', '2019-01-02 18:00:00', '1'),
	(6, '팀 과제 04 - 1조', '자료구조', '2019-01-16 15:51:00', '1'),
	(7, '성적관리 프로그램을 수정하시오', '자료구조', '2019-02-02 15:53:00', '1'),
	(8, '조별과제1', '자료구조', '2018-12-24 21:00:00', 'jeongmin'),
	(9, '클래스 다이어그램 그리기', '소프트웨어공학', '2018-12-28 18:00:00', 'zxcvbn'),
	(10, '과제 1번 입터럽트', '운영체제', '2018-12-29 19:00:00', 'jeongmin'),
	(11, '자바 수행평가(조별)', '자바', '2018-12-25 21:00:00', 'asdfgh'),
	(12, 'DGSW 2학기 나르샤 - 얼굴', '자바', '2018-12-21 17:00:00', 'jeongmin'),
	(13, '클래스 다이어그램 그리기', '운영체제', '2018-12-28 18:00:00', 'jeongmin'),
	(14, '성적관리 프로그램을 수정하시오', '자료구조', '2018-12-29 23:00:00', 'jeongmin'),
	(15, '유니티 방과후', '유니티', '2018-12-31 20:00:00', 'jeongmin'),
	(16, 'Tree', '수학', '2018-12-30 18:00:00', 'jeongmin');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;

-- 테이블 map.projectmember 구조 내보내기
CREATE TABLE IF NOT EXISTS `projectmember` (
  `projectId` int(11) NOT NULL AUTO_INCREMENT,
  `memberId` varchar(45) NOT NULL,
  PRIMARY KEY (`projectId`,`memberId`),
  KEY `FK_ProjectMember_memberId_Member_id` (`memberId`),
  CONSTRAINT `FK_ProjectMember_memberId_Member_id` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`),
  CONSTRAINT `FK_ProjectMember_projectId_Project_id` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- 테이블 데이터 map.projectmember:~63 rows (대략적) 내보내기
/*!40000 ALTER TABLE `projectmember` DISABLE KEYS */;
INSERT INTO `projectmember` (`projectId`, `memberId`) VALUES
	(1, '1'),
	(2, '1'),
	(3, '1'),
	(3, '2'),
	(4, '1'),
	(4, '2'),
	(5, '1'),
	(6, '1'),
	(6, '2'),
	(7, '1'),
	(7, '2'),
	(8, 'asdfgh'),
	(8, 'jeongmin'),
	(8, 'qwerty'),
	(8, 'rhkrguswns'),
	(8, 'wjdalsdl'),
	(8, 'zxcvbn'),
	(9, 'asdfgh'),
	(9, 'qwerty'),
	(9, 'rhkrguswns'),
	(9, 'wjdalsdl'),
	(9, 'zxcvbn'),
	(10, 'asdfgh'),
	(10, 'jeongmin'),
	(10, 'qwerty'),
	(10, 'rhkrguswns'),
	(10, 'wjdalsdl'),
	(10, 'zxcvbn'),
	(11, 'asdfgh'),
	(11, 'jeongmin'),
	(11, 'qwerty'),
	(11, 'rhkrguswns'),
	(11, 'wjdalsdl'),
	(11, 'zxcvbn'),
	(12, 'asdfgh'),
	(12, 'jeongmin'),
	(12, 'qwerty'),
	(12, 'rhkrguswns'),
	(12, 'wjdalsdl'),
	(12, 'zxcvbn'),
	(13, 'asdfgh'),
	(13, 'jeongmin'),
	(13, 'rhkrguswns'),
	(13, 'wjdalsdl'),
	(13, 'zxcvbn'),
	(14, 'asdfgh'),
	(14, 'jeongmin'),
	(14, 'qwerty'),
	(14, 'rhkrguswns'),
	(14, 'wjdalsdl'),
	(14, 'zxcvbn'),
	(15, 'asdfgh'),
	(15, 'jeongmin'),
	(15, 'qwerty'),
	(15, 'rhkrguswns'),
	(15, 'wjdalsdl'),
	(15, 'zxcvbn'),
	(16, 'asdfgh'),
	(16, 'jeongmin'),
	(16, 'qwerty'),
	(16, 'rhkrguswns'),
	(16, 'wjdalsdl'),
	(16, 'zxcvbn');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- 테이블 데이터 map.timeline:~29 rows (대략적) 내보내기
/*!40000 ALTER TABLE `timeline` DISABLE KEYS */;
INSERT INTO `timeline` (`id`, `projectId`, `memberId`, `comment`, `timestamp`) VALUES
	(1, 1, '1', 'TEST', '2018-10-11 16:54:36'),
	(2, 3, '1', 'dksdgf', '2018-11-24 12:27:43'),
	(3, 3, '1', 'dfjdgewe', '2018-11-24 14:17:14'),
	(4, 1, '1', 'test2', '2018-12-11 11:03:49'),
	(5, 7, '1', '성적관리 프로그램 수정 1', '2018-12-14 11:54:06'),
	(6, 7, '1', '수정 2', '2018-12-14 11:54:14'),
	(7, 7, '1', '최종 완성본', '2018-12-14 11:54:19'),
	(8, 7, '1', '(진짜) 최종', '2018-12-14 11:54:25'),
	(9, 8, 'jeongmin', '허블 정렬 :  소은, 주영', '2018-12-18 17:01:19'),
	(10, 8, 'jeongmin', '삽입정렬 :  현준, 민수', '2018-12-18 17:01:36'),
	(11, 8, 'jeongmin', '선택 정렬 :  정민, 광용', '2018-12-18 17:02:10'),
	(12, 8, 'asdfgh', '허블정렬 파일 올렸음', '2018-12-18 17:05:10'),
	(13, 8, 'qwerty', '우리 발표는 누가함 ', '2018-12-18 17:08:36'),
	(14, 8, 'zxcvbn', '내가 함게', '2018-12-18 17:12:39'),
	(15, 8, 'zxcvbn', '내가 함', '2018-12-18 17:12:45'),
	(16, 8, 'asdfgh', 'ㅇㅇ', '2018-12-18 17:12:59'),
	(17, 8, 'zxcvbn', '파일 올렸음 확인하기', '2018-12-18 17:14:32'),
	(18, 8, 'rhkrguswns', 'ㅇㅇ확인함', '2018-12-18 17:15:06'),
	(19, 10, 'jeongmin', '인터럽트 정의 올렸음', '2018-12-18 17:26:01'),
	(20, 10, 'wjdalsdl', 'ㅇㅋㅇㅋ 확인함', '2018-12-18 17:26:18'),
	(21, 12, 'rhkrguswns', 'JSP : 이소은, 최정민', '2018-12-18 17:31:42'),
	(22, 12, 'rhkrguswns', 'DB : 곽현준, 전광용', '2018-12-18 17:32:00'),
	(23, 12, 'rhkrguswns', 'SERVLET : 이주영, 신민수', '2018-12-18 17:32:13'),
	(24, 12, 'asdfgh', '서블릿 login,new,home까지 했음', '2018-12-18 17:33:31'),
	(25, 12, 'jeongmin', 'new.jsp 랑 file.jsp 업데이트', '2018-12-18 17:33:32'),
	(26, 12, 'zxcvbn', 'DB api 다 짲음', '2018-12-18 17:37:47'),
	(27, 12, 'zxcvbn', 'DB api 확인점~', '2018-12-18 17:38:03'),
	(28, 12, 'jeongmin', 'jsp 파일 업뎃했으니까 확인좀', '2018-12-18 20:33:25'),
	(29, 12, 'asdfgh', 'servlet new.jsp랑 search.jsp랑 연결했음 안돼면 알려주셈 ', '2018-12-18 20:34:13');
/*!40000 ALTER TABLE `timeline` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
