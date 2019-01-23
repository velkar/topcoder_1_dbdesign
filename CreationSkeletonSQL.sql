-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.12-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for solutionmanagement
CREATE DATABASE IF NOT EXISTS `solutionmanagement` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `solutionmanagement`;

-- Dumping structure for table solutionmanagement.account
CREATE TABLE IF NOT EXISTS `account` (
  `account_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `gcc_based` varchar(50) DEFAULT NULL,
  `tower_id` bigint(20) NOT NULL,
  `itsm_tools` text NOT NULL,
  `business_unit` varchar(50) DEFAULT NULL,
  `orchestrator_user_role_id` bigint(20) NOT NULL,
  `techmanager_user_role_id` bigint(20) NOT NULL,
  `acc_automation_owner_user_role_id` bigint(20) NOT NULL,
  `adh_emailid` tinytext DEFAULT NULL,
  `primaryowner_user_role_id` bigint(20) NOT NULL,
  `secondaryowner_user_role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`account_id`),
  KEY `FK_account_tower` (`tower_id`),
  KEY `FK_account_userrole` (`orchestrator_user_role_id`),
  KEY `FK_account_userrole_2` (`techmanager_user_role_id`),
  KEY `FK_account_userrole_3` (`acc_automation_owner_user_role_id`),
  KEY `FK_account_userrole_4` (`primaryowner_user_role_id`),
  KEY `FK_account_userrole_5` (`secondaryowner_user_role_id`),
  CONSTRAINT `FK_account_tower` FOREIGN KEY (`tower_id`) REFERENCES `tower` (`tower_id`),
  CONSTRAINT `FK_account_userrole` FOREIGN KEY (`orchestrator_user_role_id`) REFERENCES `userrole` (`user_role_id`),
  CONSTRAINT `FK_account_userrole_2` FOREIGN KEY (`techmanager_user_role_id`) REFERENCES `userrole` (`user_role_id`),
  CONSTRAINT `FK_account_userrole_3` FOREIGN KEY (`acc_automation_owner_user_role_id`) REFERENCES `userrole` (`user_role_id`),
  CONSTRAINT `FK_account_userrole_4` FOREIGN KEY (`primaryowner_user_role_id`) REFERENCES `userrole` (`user_role_id`),
  CONSTRAINT `FK_account_userrole_5` FOREIGN KEY (`secondaryowner_user_role_id`) REFERENCES `userrole` (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 MAX_ROWS=4294967295;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.approvalflow
CREATE TABLE IF NOT EXISTS `approvalflow` (
  `approval_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) NOT NULL,
  `solution_id` bigint(20) NOT NULL,
  `approval_type` char(50) NOT NULL,
  `approver_user_role_id` bigint(20) NOT NULL,
  `approver_comments` text NOT NULL,
  `approval_status` char(50) NOT NULL,
  `modified_dt` date NOT NULL,
  PRIMARY KEY (`approval_id`),
  KEY `FK_approvalflow_botspackage` (`solution_id`),
  KEY `FK_approvalflow_newrequestidea` (`request_id`),
  KEY `FK_approvalflow_userrole` (`approver_user_role_id`),
  CONSTRAINT `FK_approvalflow_botspackage` FOREIGN KEY (`solution_id`) REFERENCES `botspackage` (`solution_id`),
  CONSTRAINT `FK_approvalflow_newrequestidea` FOREIGN KEY (`request_id`) REFERENCES `newrequestidea` (`request_id`),
  CONSTRAINT `FK_approvalflow_userrole` FOREIGN KEY (`approver_user_role_id`) REFERENCES `userrole` (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.approvalflowhistory
CREATE TABLE IF NOT EXISTS `approvalflowhistory` (
  `approval_history_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `modified_user_role_id` bigint(20) NOT NULL,
  `approval_id` bigint(20) NOT NULL,
  `modified_dt` date NOT NULL,
  `modify_comments` text NOT NULL,
  `from_status` tinytext NOT NULL,
  `to_status` tinytext NOT NULL,
  PRIMARY KEY (`approval_history_id`),
  KEY `FK_approvalflowhistory_userrole` (`modified_user_role_id`),
  CONSTRAINT `FK_approvalflowhistory_userrole` FOREIGN KEY (`modified_user_role_id`) REFERENCES `userrole` (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.attachments
CREATE TABLE IF NOT EXISTS `attachments` (
  `attach_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usecase_id` bigint(20) NOT NULL,
  `solution_id` bigint(20) NOT NULL,
  `attachment_desc` text NOT NULL,
  `attachment` blob NOT NULL,
  `type` char(50) NOT NULL,
  `modified_dt` date NOT NULL,
  PRIMARY KEY (`attach_id`),
  KEY `FK_attachments_botspackage` (`solution_id`),
  KEY `FK_attachments_usecase` (`usecase_id`),
  CONSTRAINT `FK_attachments_botspackage` FOREIGN KEY (`solution_id`) REFERENCES `botspackage` (`solution_id`),
  CONSTRAINT `FK_attachments_usecase` FOREIGN KEY (`usecase_id`) REFERENCES `usecase` (`usecase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.botspackage
CREATE TABLE IF NOT EXISTS `botspackage` (
  `solution_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `solution_name` text NOT NULL,
  `version` tinyint(4) NOT NULL,
  `solution_owner_user_role_id` bigint(20) NOT NULL,
  `rollout_owners_user_role_id` bigint(20) NOT NULL,
  `status` tinytext NOT NULL,
  `short_desc` tinytext NOT NULL,
  `description` text NOT NULL,
  `developed_dt` date NOT NULL,
  `modified_dt` date NOT NULL,
  `doc_download_cnt` bigint(20) NOT NULL,
  `downloaded cnt` bigint(20) NOT NULL,
  `reviewed_cnt` bigint(20) NOT NULL,
  `defects` bigint(20) NOT NULL,
  `enhancements` text NOT NULL,
  `rollouts_acc_id` bigint(20) NOT NULL,
  `approvals_id` bigint(20) NOT NULL,
  `request_id` bigint(20) NOT NULL,
  PRIMARY KEY (`solution_id`),
  KEY `FK_botspackage_account` (`rollouts_acc_id`),
  KEY `FK_botspackage_approvalflow` (`approvals_id`),
  KEY `FK_botspackage_newrequestidea` (`request_id`),
  KEY `FK_botspackage_userrole` (`solution_owner_user_role_id`),
  KEY `FK_botspackage_userrole_2` (`rollout_owners_user_role_id`),
  CONSTRAINT `FK_botspackage_account` FOREIGN KEY (`rollouts_acc_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `FK_botspackage_approvalflow` FOREIGN KEY (`approvals_id`) REFERENCES `approvalflow` (`approval_id`),
  CONSTRAINT `FK_botspackage_newrequestidea` FOREIGN KEY (`request_id`) REFERENCES `newrequestidea` (`request_id`),
  CONSTRAINT `FK_botspackage_userrole` FOREIGN KEY (`solution_owner_user_role_id`) REFERENCES `userrole` (`user_role_id`),
  CONSTRAINT `FK_botspackage_userrole_2` FOREIGN KEY (`rollout_owners_user_role_id`) REFERENCES `userrole` (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.engteammembers
CREATE TABLE IF NOT EXISTS `engteammembers` (
  `eng_team_members_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tower_spoc_id` bigint(20) NOT NULL,
  `user_role_id` bigint(20) NOT NULL,
  `eng_member_role` tinytext NOT NULL,
  PRIMARY KEY (`eng_team_members_id`),
  KEY `FK_engteammembers_userrole` (`tower_spoc_id`),
  KEY `FK_engteammembers_userrole_2` (`user_role_id`),
  CONSTRAINT `FK_engteammembers_userrole` FOREIGN KEY (`tower_spoc_id`) REFERENCES `userrole` (`user_role_id`),
  CONSTRAINT `FK_engteammembers_userrole_2` FOREIGN KEY (`user_role_id`) REFERENCES `userrole` (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.forum
CREATE TABLE IF NOT EXISTS `forum` (
  `forum_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) NOT NULL,
  `usecase_id` bigint(20) NOT NULL,
  `solution_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `modified_dt` date NOT NULL,
  `posted_dt` date NOT NULL,
  `comments` longtext DEFAULT NULL,
  PRIMARY KEY (`forum_id`),
  KEY `FK_forum_botspackage` (`solution_id`),
  KEY `FK_forum_newrequestidea` (`request_id`),
  KEY `FK_forum_usecase` (`usecase_id`),
  KEY `FK_forum_user` (`user_id`),
  CONSTRAINT `FK_forum_botspackage` FOREIGN KEY (`solution_id`) REFERENCES `botspackage` (`solution_id`),
  CONSTRAINT `FK_forum_newrequestidea` FOREIGN KEY (`request_id`) REFERENCES `newrequestidea` (`request_id`),
  CONSTRAINT `FK_forum_usecase` FOREIGN KEY (`usecase_id`) REFERENCES `usecase` (`usecase_id`),
  CONSTRAINT `FK_forum_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.newrequestidea
CREATE TABLE IF NOT EXISTS `newrequestidea` (
  `request_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_idea_name` varchar(50) NOT NULL,
  `type` char(50) NOT NULL,
  `short_desc` tinytext NOT NULL,
  `description` text NOT NULL,
  `status` tinytext NOT NULL,
  `posted_user_role_id` bigint(20) NOT NULL,
  `posted_dt` date NOT NULL,
  `modified_dt` date NOT NULL,
  PRIMARY KEY (`request_id`),
  KEY `FK_newrequestidea_userrole` (`posted_user_role_id`),
  CONSTRAINT `FK_newrequestidea_userrole` FOREIGN KEY (`posted_user_role_id`) REFERENCES `userrole` (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.references
CREATE TABLE IF NOT EXISTS `references` (
  `reference_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) NOT NULL,
  `usecase_id` bigint(20) NOT NULL,
  `solution_id` bigint(20) NOT NULL,
  `reference_notes` text NOT NULL,
  `posted_dt` date NOT NULL,
  PRIMARY KEY (`reference_id`),
  KEY `FK_references_botspackage` (`solution_id`),
  KEY `FK_references_newrequestidea` (`request_id`),
  KEY `FK_references_usecase` (`usecase_id`),
  CONSTRAINT `FK_references_botspackage` FOREIGN KEY (`solution_id`) REFERENCES `botspackage` (`solution_id`),
  CONSTRAINT `FK_references_newrequestidea` FOREIGN KEY (`request_id`) REFERENCES `newrequestidea` (`request_id`),
  CONSTRAINT `FK_references_usecase` FOREIGN KEY (`usecase_id`) REFERENCES `usecase` (`usecase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.role
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` tinytext DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.tower
CREATE TABLE IF NOT EXISTS `tower` (
  `tower_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `spoc_user_role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`tower_id`),
  KEY `FK_tower_userrole` (`spoc_user_role_id`),
  CONSTRAINT `FK_tower_userrole` FOREIGN KEY (`spoc_user_role_id`) REFERENCES `userrole` (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.usecase
CREATE TABLE IF NOT EXISTS `usecase` (
  `usecase_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usecase_name` tinytext NOT NULL,
  `tower_spoc_uid` bigint(20) NOT NULL,
  `status` tinytext NOT NULL,
  `short_desc` tinytext NOT NULL,
  `desc` text NOT NULL,
  `attachment_id` bigint(20) NOT NULL,
  `developed_dt` date NOT NULL,
  `doc_download_cnt` int(11) NOT NULL,
  `downloaded_cnt` int(11) NOT NULL,
  `reviewed_cnt` int(11) NOT NULL,
  `defects` int(11) NOT NULL,
  `enhancements` longtext NOT NULL,
  `modified_dt` date NOT NULL,
  `rollouts_accountid` bigint(20) NOT NULL,
  `approval_id` bigint(20) NOT NULL,
  `solution_id` bigint(20) NOT NULL,
  PRIMARY KEY (`usecase_id`),
  KEY `FK_usecase_approvalflow` (`approval_id`),
  KEY `FK_usecase_attachments` (`attachment_id`),
  KEY `FK_usecase_botspackage` (`solution_id`),
  KEY `FK_usecase_userrole` (`tower_spoc_uid`),
  CONSTRAINT `FK_usecase_approvalflow` FOREIGN KEY (`approval_id`) REFERENCES `approvalflow` (`approval_id`),
  CONSTRAINT `FK_usecase_attachments` FOREIGN KEY (`attachment_id`) REFERENCES `attachments` (`attach_id`),
  CONSTRAINT `FK_usecase_botspackage` FOREIGN KEY (`solution_id`) REFERENCES `botspackage` (`solution_id`),
  CONSTRAINT `FK_usecase_userrole` FOREIGN KEY (`tower_spoc_uid`) REFERENCES `userrole` (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.user
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` tinytext DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `password` tinytext NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `Index 2` (`username`),
  KEY `FK_user_account` (`account_id`),
  CONSTRAINT `FK_user_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.userrole
CREATE TABLE IF NOT EXISTS `userrole` (
  `user_role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_role_id`),
  KEY `FK_userrole_role` (`role_id`),
  KEY `FK_userrole_user` (`user_id`),
  CONSTRAINT `FK_userrole_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `FK_userrole_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
