-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.12-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5196
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
  `account_id` bigint(20) NOT NULL,
  `account_name` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `gcc_based` varchar(50) DEFAULT NULL,
  `tower_id` bigint(20) NOT NULL,
  `itsm_tools` bigint(20) NOT NULL,
  `business_unit` varchar(50) DEFAULT NULL,
  `orchestrator_user_role_id` bigint(20) NOT NULL,
  `techmanager_user_role_id` bigint(20) NOT NULL,
  `acc_automation_owner_user_role_id` bigint(20) NOT NULL,
  `adh_emailid` tinytext DEFAULT NULL,
  `primaryowner_user_role_id` bigint(20) NOT NULL,
  `secondaryowner_user_role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 MAX_ROWS=4294967295;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.approvalflow
CREATE TABLE IF NOT EXISTS `approvalflow` (
  `approval_id` bigint(20) NOT NULL,
  `request_id` bigint(20) NOT NULL,
  `solution_id` bigint(20) NOT NULL,
  `approval_type` char(50) NOT NULL,
  `approver_user_role_id` bigint(20) NOT NULL,
  `approver_comments` text NOT NULL,
  `approval_status` char(50) NOT NULL,
  `modified_dt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.approvalflowhistory
CREATE TABLE IF NOT EXISTS `approvalflowhistory` (
  `approval_history_id` bigint(20) NOT NULL,
  `modified_user_role_id` bigint(20) NOT NULL,
  `approval_id` bigint(20) NOT NULL,
  `modified_dt` date NOT NULL,
  `modify_comments` text NOT NULL,
  `from_status` tinytext NOT NULL,
  `to_status` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.attachments
CREATE TABLE IF NOT EXISTS `attachments` (
  `attach_id` bigint(20) NOT NULL,
  `usecase_id` bigint(20) NOT NULL,
  `solution_id` bigint(20) NOT NULL,
  `attachment_desc` text NOT NULL,
  `attachment` blob NOT NULL,
  `type` char(50) NOT NULL,
  `modified_dt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.botspackage
CREATE TABLE IF NOT EXISTS `botspackage` (
  `solution_id` bigint(20) NOT NULL,
  `solution_name` text NOT NULL,
  `version` tinyint(4) NOT NULL,
  `solution_owner_user_role_id` bigint(20) NOT NULL,
  `rollout_owners_user_role_id` bigint(20) NOT NULL,
  `status` tinytext NOT NULL,
  `short_desc` text NOT NULL,
  `description` text NOT NULL,
  `developed_dt` date NOT NULL,
  `modified_dt` date NOT NULL,
  `doc_download_cnt` bigint(20) NOT NULL,
  `downloaded cnt` bigint(20) NOT NULL,
  `reviewed_cnt` bigint(20) NOT NULL,
  `defects` bigint(20) NOT NULL,
  `enhancements` text NOT NULL,
  `rollouts_acc_id` varchar(50) NOT NULL,
  `approvals_id` bigint(20) NOT NULL,
  `request_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.engteammembers
CREATE TABLE IF NOT EXISTS `engteammembers` (
  `eng_team_members_id` bigint(20) NOT NULL,
  `tower_spoc_id` bigint(20) NOT NULL,
  `user_role_id` bigint(20) NOT NULL,
  `eng_member_role` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.forum
CREATE TABLE IF NOT EXISTS `forum` (
  `forum_id` bigint(20) NOT NULL,
  `request_id` bigint(20) NOT NULL,
  `usecase_id` bigint(20) NOT NULL,
  `solution_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `modified_dt` date NOT NULL,
  `posted_dt` date NOT NULL,
  `comments` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.newrequestidea
CREATE TABLE IF NOT EXISTS `newrequestidea` (
  `request_id` bigint(20) NOT NULL,
  `request_idea_name` varchar(50) NOT NULL,
  `type` char(50) NOT NULL,
  `short_desc` tinytext NOT NULL,
  `description` text NOT NULL,
  `status` tinytext NOT NULL,
  `posted_user_role_id` bigint(20) NOT NULL,
  `posted_dt` date NOT NULL,
  `modified_dt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.references
CREATE TABLE IF NOT EXISTS `references` (
  `reference_id` bigint(20) NOT NULL,
  `request_id` bigint(20) NOT NULL,
  `usecase_id` bigint(20) NOT NULL,
  `solution_id` bigint(20) NOT NULL,
  `reference_notes` text NOT NULL,
  `posted_dt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.role
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` bigint(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.tower
CREATE TABLE IF NOT EXISTS `tower` (
  `tower_id` bigint(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `spoc_user_role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.usecase
CREATE TABLE IF NOT EXISTS `usecase` (
  `usecase_id` bigint(20) NOT NULL,
  `usecase_name` tinytext NOT NULL,
  `tower_spoc_uid` bigint(20) NOT NULL,
  `status` tinytext NOT NULL,
  `short_desc` text NOT NULL,
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
  `solution_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.user
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` bigint(20) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` tinytext DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `account_id` bigint(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table solutionmanagement.userrole
CREATE TABLE IF NOT EXISTS `userrole` (
  `user_role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
