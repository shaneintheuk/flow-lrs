SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT;
SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS;
SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION;
SET NAMES utf8mb4;
SET @OLD_TIME_ZONE=@@TIME_ZONE;
SET TIME_ZONE='+00:00';
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0;
DROP TABLE IF EXISTS `access_control`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `access_control` (
  `AccessControlId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `AccessQualifier` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Access` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ObjectType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ObjectId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`AccessControlId`),
  KEY `FKA6A51D8226F496` (`Role`),
  KEY `FKA6A51D82868EE47E` (`EntityId`),
  CONSTRAINT `FKA6A51D8226F496` FOREIGN KEY (`Role`) REFERENCES `role` (`name`),
  CONSTRAINT `FKA6A51D82868EE47E` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `address`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `address` (
  `AddressId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Organisation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AddressLine1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AddressLine2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AddressLine3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Locality` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `State` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PostCode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Country` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Longitude` decimal(10,6) DEFAULT NULL,
  `Latitude` decimal(10,6) DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`AddressId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `address_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `address_type` (
  `addressTypeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`addressTypeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `announcement`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `announcement` (
  `AnnouncementId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Priority` int DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `KnowledgeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`AnnouncementId`),
  KEY `FK9584D472D12F219` (`KnowledgeId`),
  CONSTRAINT `FK9584D472D12F219` FOREIGN KEY (`KnowledgeId`) REFERENCES `knowledge` (`KnowledgeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `announcement_filter`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `announcement_filter` (
  `AnnouncementListId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `FilterValue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AnnouncementId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`AnnouncementListId`),
  KEY `FK23134D7096349E15` (`TypeId`),
  KEY `FK23134D70D8C0ECE2` (`AnnouncementId`),
  CONSTRAINT `FK23134D7096349E15` FOREIGN KEY (`TypeId`) REFERENCES `announcement_filter_type` (`TypeId`),
  CONSTRAINT `FK23134D70D8C0ECE2` FOREIGN KEY (`AnnouncementId`) REFERENCES `announcement` (`AnnouncementId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `announcement_filter_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `announcement_filter_type` (
  `TypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `application_settings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `application_settings` (
  `ApplicationSettingsId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ApplicationName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ResourceURL` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ResourceURLSSL` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SkinResourceDir` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PostcoderOn` tinyint(1) DEFAULT NULL,
  `PostcoderKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowHelpWidget` tinyint(1) DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `HostName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ApplicationSettingsId`),
  UNIQUE KEY `app_nameix1` (`ApplicationName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `assessment_award`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `assessment_award` (
  `AwardId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `AwardGroupId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AwardImageUrl` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`AwardId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `assessment_award_achieved`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `assessment_award_achieved` (
  `AchievedAwardId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `AwardId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AwardToChallengeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ChallengeAchievedId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DateAchieved` datetime DEFAULT NULL,
  `AwardPresented` int DEFAULT NULL,
  `AuthorisedByEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AwardPresentedDate` datetime DEFAULT NULL,
  `AcceptedOnline` tinyint(1) NOT NULL,
  `SystemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AcceptedOnlineDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`AchievedAwardId`),
  KEY `fk_award_achieved` (`AwardId`),
  KEY `fk_award_entity` (`EntityId`),
  KEY `fk_award_authorised` (`AuthorisedByEntityId`),
  KEY `cns_achieved_award_system` (`SystemId`),
  KEY `cns_achieved_award_challenge` (`AwardToChallengeId`),
  KEY `cns_achieved_award_challenge_achieved` (`ChallengeAchievedId`),
  CONSTRAINT `cns_achieved_award_challenge` FOREIGN KEY (`AwardToChallengeId`) REFERENCES `assessment_award_challenge` (`AwardToChallengeId`),
  CONSTRAINT `cns_achieved_award_challenge_achieved` FOREIGN KEY (`ChallengeAchievedId`) REFERENCES `assessment_challenge_achieved` (`ChallengeAchievedId`),
  CONSTRAINT `cns_achieved_award_module` FOREIGN KEY (`AwardId`) REFERENCES `assessment_award_module` (`AwardToModuleId`),
  CONSTRAINT `cns_achieved_award_system` FOREIGN KEY (`SystemId`) REFERENCES `sports_system` (`SystemId`),
  CONSTRAINT `cns_award_authorised` FOREIGN KEY (`AuthorisedByEntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `cns_award_entity` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `assessment_award_challenge`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `assessment_award_challenge` (
  `AwardToChallengeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AwardId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ChallengeToLevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Sequence` int NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `IncludeInProgressBook` int NOT NULL DEFAULT '1',
  `BubbleDisplayNumber` int DEFAULT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`AwardToChallengeId`) USING BTREE,
  KEY `fk_award_challenge_award` (`AwardId`) USING BTREE,
  KEY `fk_award_challenge_moduletolevel` (`ChallengeToLevelId`) USING BTREE,
  CONSTRAINT `cns_award_challenge_award` FOREIGN KEY (`AwardId`) REFERENCES `assessment_award` (`AwardId`),
  CONSTRAINT `cns_award_challenge_challengetolevel` FOREIGN KEY (`ChallengeToLevelId`) REFERENCES `assessment_challenge_program` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `assessment_award_group`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `assessment_award_group` (
  `AwardGroupId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`AwardGroupId`),
  KEY `cns_award_group_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `cns_award_group_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `assessment_award_module`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `assessment_award_module` (
  `AwardToModuleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AwardId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ModuleToLevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Sequence` int NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `IncludeInProgressBook` int NOT NULL DEFAULT '1',
  `BubbleDisplayNumber` int DEFAULT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`AwardToModuleId`),
  KEY `fk_award_module_award` (`AwardId`),
  KEY `fk_award_module_moduletolevel` (`ModuleToLevelId`),
  CONSTRAINT `cns_award_module_award` FOREIGN KEY (`AwardId`) REFERENCES `assessment_award` (`AwardId`),
  CONSTRAINT `cns_award_module_moduletolevel` FOREIGN KEY (`ModuleToLevelId`) REFERENCES `assessment_module_level` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `assessment_challenge`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `assessment_challenge` (
  `ChallengeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProgramLevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `ChallengeGroupId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChallengeId`),
  KEY `fk_challenge_level` (`ProgramLevelId`),
  CONSTRAINT `cns_challenge_level` FOREIGN KEY (`ProgramLevelId`) REFERENCES `sports_program_level` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `assessment_challenge_achieved`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `assessment_challenge_achieved` (
  `ChallengeAchievedId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ChallengeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `AchievementTime` int DEFAULT NULL,
  `AuthorisedByEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AchievedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ProgramLevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SystemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `AcceptedOnline` tinyint(1) NOT NULL DEFAULT '0',
  `AcceptedOnlineDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ChallengeAchievedId`),
  KEY `fk_achieved_challenge` (`ChallengeId`),
  KEY `AchievedDate` (`AchievedDate`),
  KEY `fk_program_level` (`ProgramLevelId`),
  KEY `cns_achieved_challenge_system` (`SystemId`),
  KEY `cns_achieved_challenge_authorised_entity` (`AuthorisedByEntityId`),
  KEY `cns_achieved_challenged_entity` (`EntityId`),
  CONSTRAINT `cns_achieved_challenge` FOREIGN KEY (`ChallengeId`) REFERENCES `assessment_challenge` (`ChallengeId`),
  CONSTRAINT `cns_achieved_challenge_authorised_entity` FOREIGN KEY (`AuthorisedByEntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `cns_achieved_challenge_system` FOREIGN KEY (`SystemId`) REFERENCES `sports_system` (`SystemId`),
  CONSTRAINT `fk_program_level` FOREIGN KEY (`ProgramLevelId`) REFERENCES `sports_program_level` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `assessment_challenge_group`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `assessment_challenge_group` (
  `ChallengeGroupId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChallengeGroupId`),
  KEY `cns_challenge_group_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `cns_challenge_group_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `assessment_challenge_program`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `assessment_challenge_program` (
  `Id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ChallengeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProgramLevelEAId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sequence` int DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `assessment_challenge_properties`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `assessment_challenge_properties` (
  `ChallengePropertiesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ChallengeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChallengePropertiesId`),
  KEY `fk_challenge_properties` (`ChallengeId`),
  CONSTRAINT `cns_challenge_properties` FOREIGN KEY (`ChallengeId`) REFERENCES `assessment_challenge` (`ChallengeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `assessment_join_modulelevel_award`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `assessment_join_modulelevel_award` (
  `ModuleToLevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AwardId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ModuleToLevelId`,`AwardId`),
  KEY `fk_modulelevel_award` (`ModuleToLevelId`),
  KEY `fk_award_modulelevel` (`AwardId`),
  CONSTRAINT `cns_award_modulelevel` FOREIGN KEY (`AwardId`) REFERENCES `assessment_award` (`AwardId`),
  CONSTRAINT `cns_modulelevel_award` FOREIGN KEY (`ModuleToLevelId`) REFERENCES `assessment_module_level` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `assessment_module`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `assessment_module` (
  `ModuleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProgramLevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `ModuleGroupId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StudentDescriptionLookupKey` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ModuleId`),
  KEY `fk_module_level` (`ProgramLevelId`),
  KEY `fk_assess_module_student_text` (`StudentDescriptionLookupKey`),
  CONSTRAINT `cns_assess_module_student_text` FOREIGN KEY (`StudentDescriptionLookupKey`) REFERENCES `resource_key` (`KeyName`),
  CONSTRAINT `cns_module_level` FOREIGN KEY (`ProgramLevelId`) REFERENCES `sports_program_level` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `assessment_module_achieved`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `assessment_module_achieved` (
  `AchievedModuleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ModuleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StartAwardId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CompleteAwardId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DateAchieved` datetime DEFAULT NULL,
  `AuthorisedByEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AcceptedOnline` tinyint(1) NOT NULL,
  `SystemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AcceptedOnlineDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`AchievedModuleId`),
  KEY `fk_module_achieved` (`ModuleId`),
  KEY `fk_module_entity` (`EntityId`),
  KEY `fk_module_level_award_start` (`StartAwardId`),
  KEY `fk_module_level_award_comp` (`CompleteAwardId`),
  KEY `fk_challenge_entity` (`EntityId`),
  KEY `fk_module_authorised` (`AuthorisedByEntityId`),
  KEY `cns_achieved_module_system` (`SystemId`),
  CONSTRAINT `cns_achieved_module_level` FOREIGN KEY (`ModuleId`) REFERENCES `assessment_module_level` (`Id`),
  CONSTRAINT `cns_achieved_module_system` FOREIGN KEY (`SystemId`) REFERENCES `sports_system` (`SystemId`),
  CONSTRAINT `cns_challenge_entity` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `cns_module_authorised` FOREIGN KEY (`AuthorisedByEntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `cns_module_entity` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `cns_module_level_award_comp` FOREIGN KEY (`CompleteAwardId`) REFERENCES `assessment_award` (`AwardId`),
  CONSTRAINT `cns_module_level_award_start` FOREIGN KEY (`StartAwardId`) REFERENCES `assessment_award` (`AwardId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `assessment_module_group`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `assessment_module_group` (
  `ModuleGroupId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ModuleGroupId`),
  KEY `cns_module_group_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `cns_module_group_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `assessment_module_level`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `assessment_module_level` (
  `Id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ModuleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProgramLevelEAId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sequence` int DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `IncludeInProgressBook` int NOT NULL DEFAULT '1',
  `BubbleDisplayNumber` int DEFAULT NULL,
  `KeyStageModule` tinyint(1) DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `assessment_resource_material`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `assessment_resource_material` (
  `ResourceMaterialId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ResourceMaterialId`),
  KEY `assessment_resource_material_ml` (`MasterLicenseeId`),
  CONSTRAINT `assessment_resource_material_ml` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `assessment_resource_material_program_level`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `assessment_resource_material_program_level` (
  `ResourceMaterialId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProgramLevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ResourceMaterialId`,`ProgramLevelId`),
  KEY `assessment_resource_material_program_level_pl` (`ProgramLevelId`),
  CONSTRAINT `assessment_resource_material_module_level_r` FOREIGN KEY (`ResourceMaterialId`) REFERENCES `assessment_resource_material` (`ResourceMaterialId`),
  CONSTRAINT `assessment_resource_material_program_level_pl` FOREIGN KEY (`ProgramLevelId`) REFERENCES `sports_program_level` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `assessment_student_level_history`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `assessment_student_level_history` (
  `StudentLevelHistoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `StudentEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `ProgramLevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DateStart` datetime DEFAULT NULL,
  `DateComplete` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `AcceptedOnline` tinyint(1) NOT NULL DEFAULT '0',
  `AcceptedOnlineDate` datetime DEFAULT NULL,
  PRIMARY KEY (`StudentLevelHistoryId`),
  KEY `fk_student_entity_history` (`StudentEntityId`),
  KEY `fk_student_programlevel` (`ProgramLevelId`),
  CONSTRAINT `cns_student_entity_history` FOREIGN KEY (`StudentEntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `cns_student_programlevel` FOREIGN KEY (`ProgramLevelId`) REFERENCES `sports_program_level` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `assessment_student_resource_material`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `assessment_student_resource_material` (
  `StudentResourceMaterialId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsStudentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DispatchedBySportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DispatchedDate` datetime DEFAULT NULL,
  `SystemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ResourceMaterialId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BookingId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`StudentResourceMaterialId`),
  KEY `assessment_student_resource_material_rm` (`ResourceMaterialId`),
  KEY `assessment_student_resource_material_ss` (`SportsStudentId`),
  KEY `assessment_student_resource_material_sys` (`SystemId`),
  KEY `assessment_student_resource_material_sp` (`DispatchedBySportsPersonId`),
  KEY `assessment_student_resource_material_b` (`BookingId`),
  CONSTRAINT `assessment_student_resource_material_b` FOREIGN KEY (`BookingId`) REFERENCES `sports_booking` (`BookingId`),
  CONSTRAINT `assessment_student_resource_material_rm` FOREIGN KEY (`ResourceMaterialId`) REFERENCES `assessment_resource_material` (`ResourceMaterialId`),
  CONSTRAINT `assessment_student_resource_material_sp` FOREIGN KEY (`DispatchedBySportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`),
  CONSTRAINT `assessment_student_resource_material_ss` FOREIGN KEY (`SportsStudentId`) REFERENCES `sports_student` (`EntityAttributesId`),
  CONSTRAINT `assessment_student_resource_material_sys` FOREIGN KEY (`SystemId`) REFERENCES `sports_system` (`SystemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `campaign`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `campaign` (
  `campaignId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CountryCode` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Weight` mediumint DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`campaignId`),
  KEY `FKF7A90110868EE47E` (`EntityId`),
  KEY `FKF7A90110B5F6683` (`CountryCode`),
  CONSTRAINT `FKF7A90110868EE47E` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `FKF7A90110B5F6683` FOREIGN KEY (`CountryCode`) REFERENCES `country` (`countryCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `country`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `country` (
  `countryCode` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CurrencyCode` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`countryCode`),
  KEY `FK3917579645AEF5BE` (`CurrencyCode`),
  CONSTRAINT `FK3917579645AEF5BE` FOREIGN KEY (`CurrencyCode`) REFERENCES `finance_currency` (`currencyCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `credential`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `credential` (
  `CredentialId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProviderId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ValidFromDate` datetime DEFAULT NULL,
  `ValidToDate` datetime DEFAULT NULL,
  `ReferenceNo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CredentialId`),
  KEY `FKD743E857868EE47E` (`EntityId`),
  KEY `FKD743E857830C330C` (`ProviderId`),
  CONSTRAINT `FKD743E857830C330C` FOREIGN KEY (`ProviderId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `FKD743E857868EE47E` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `credential_document`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `credential_document` (
  `CredentialId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `UrlId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`CredentialId`,`UrlId`),
  KEY `FK70588C034E33ECA` (`UrlId`),
  KEY `FK70588C031FB68BF2` (`CredentialId`),
  CONSTRAINT `FK70588C031FB68BF2` FOREIGN KEY (`CredentialId`) REFERENCES `credential` (`CredentialId`),
  CONSTRAINT `FK70588C034E33ECA` FOREIGN KEY (`UrlId`) REFERENCES `url` (`UrlId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `entity`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `entity` (
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `AddressReferenceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OneTimePassword` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SetupOneTimePassword` tinyint(1) DEFAULT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ActivationCode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ActivationStatus` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TimeZoneId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShortBio` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Bio` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Gender` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TelephoneHome` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TelephoneWork` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TelephoneMobile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TelephoneMobileMMS` tinyint(1) DEFAULT NULL,
  `FaxNumber` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailContentType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LanguagePrimary` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LanguageSecondary` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `Title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GivenName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FamilyName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NationalityId` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Alias` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SkinResourceDirectory` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SkinTileDirectory` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Hobbies` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DocumentFolderMaxSize` bigint DEFAULT NULL,
  `OptInMarketingEmails` tinyint(1) DEFAULT NULL,
  `OptInMarketingPartners` tinyint(1) DEFAULT NULL,
  `OptInMarketingPhone` tinyint(1) DEFAULT NULL,
  `OptInMarketingSMS` tinyint(1) DEFAULT NULL,
  `OptInOperationsInfoPhone` tinyint(1) DEFAULT NULL,
  `OptInOperationsInfoEmail` tinyint(1) DEFAULT NULL,
  `OptInOperationsInfoSMS` tinyint(1) DEFAULT NULL,
  `ChangePasswordNextLogin` bit(1) DEFAULT NULL,
  `SecurityQuestion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SecurityQuestionAnswer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ActivationCodeExpiry` datetime DEFAULT NULL,
  `AuthenticationVersion` int DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EntityId`),
  UNIQUE KEY `idxEntity_Username` (`Username`) USING BTREE,
  KEY `idxEntity_Name` (`Name`),
  KEY `FKB29DE3E365B3E32` (`photo`),
  KEY `FKB29DE3E3F5EF77D7` (`NationalityId`),
  KEY `FKB29DE3E3A4B12952` (`AddressReferenceId`),
  KEY `inx_entity_givenname` (`GivenName`),
  KEY `inx_entity_familyname` (`FamilyName`),
  KEY `ActivationStatus` (`ActivationStatus`),
  KEY `inx_entity_email1` (`Email1`),
  KEY `inx_entity_telephone_home` (`TelephoneHome`),
  KEY `inx_entity_telephone_work` (`TelephoneWork`),
  KEY `inx_entity_telephone_mobile` (`TelephoneMobile`),
  KEY `inx_entity_activation_code` (`ActivationCode`),
  CONSTRAINT `FKB29DE3E365B3E32` FOREIGN KEY (`photo`) REFERENCES `url` (`UrlId`),
  CONSTRAINT `FKB29DE3E3A4B12952` FOREIGN KEY (`AddressReferenceId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `FKB29DE3E3F5EF77D7` FOREIGN KEY (`NationalityId`) REFERENCES `country` (`countryCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `entity_address`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `entity_address` (
  `EntityAddressId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AddressId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AddressTypeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EntityAddressId`),
  KEY `FK34E09398AB92980F` (`AddressId`),
  KEY `FK34E09398951C083B` (`AddressTypeCode`),
  KEY `FK34E09398868EE47E` (`EntityId`),
  CONSTRAINT `FK34E09398868EE47E` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `FK34E09398951C083B` FOREIGN KEY (`AddressTypeCode`) REFERENCES `address_type` (`addressTypeCode`),
  CONSTRAINT `FK34E09398AB92980F` FOREIGN KEY (`AddressId`) REFERENCES `address` (`AddressId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `entity_attributes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `entity_attributes` (
  `EntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EntityAttributesId`),
  KEY `FK2A77DF33868EE47E` (`EntityId`),
  CONSTRAINT `FK2A77DF33868EE47E` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `entity_entity_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `entity_entity_type` (
  `EntityTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`EntityId`,`EntityTypeId`),
  KEY `FK8361DFBA868EE47E` (`EntityId`),
  KEY `FK8361DFBA378E1FD8` (`EntityTypeId`),
  CONSTRAINT `FK8361DFBA378E1FD8` FOREIGN KEY (`EntityTypeId`) REFERENCES `entity_type` (`EntityTypeId`),
  CONSTRAINT `FK8361DFBA868EE47E` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `entity_role`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `entity_role` (
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Name`,`EntityId`),
  KEY `FK4C644B5224EEAB` (`Name`),
  KEY `FK4C644B52868EE47E` (`EntityId`),
  CONSTRAINT `FK4C644B5224EEAB` FOREIGN KEY (`Name`) REFERENCES `role` (`name`),
  CONSTRAINT `FK4C644B52868EE47E` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `entity_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `entity_type` (
  `EntityTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EntityTypeId`),
  KEY `idxEntityType_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `entity_url`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `entity_url` (
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `UrlId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`EntityId`,`UrlId`),
  KEY `FKA7A02F13868EE47E` (`EntityId`),
  KEY `FKA7A02F134E33ECA` (`UrlId`),
  CONSTRAINT `FKA7A02F134E33ECA` FOREIGN KEY (`UrlId`) REFERENCES `url` (`UrlId`),
  CONSTRAINT `FKA7A02F13868EE47E` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `event`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `event` (
  `EventId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EventName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `AllowSimultaneousExec` tinyint(1) DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EventId`),
  KEY `FK5C6729A868EE47E` (`EntityId`),
  CONSTRAINT `FK5C6729A868EE47E` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `event_grid`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `event_grid` (
  `EventGridId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EventGridId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `event_instance`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `event_instance` (
  `EventInstanceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `EventGridId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EventConfigurationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `NextRunDate` datetime DEFAULT NULL,
  `RecurringPeriod` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RecurringValue` int DEFAULT NULL,
  `RecurringStatus` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IsLowPriority` tinyint(1) DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EventInstanceId`),
  KEY `fk_event_instance_grid` (`EventGridId`),
  KEY `fk_event_instance_config` (`EventConfigurationId`),
  CONSTRAINT `event_instance_e` FOREIGN KEY (`EventConfigurationId`) REFERENCES `event` (`EventId`),
  CONSTRAINT `event_instance_eg` FOREIGN KEY (`EventGridId`) REFERENCES `event_grid` (`EventGridId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `event_instance_listener`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `event_instance_listener` (
  `EventInstanceListenerId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Hostname` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EventInstanceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ListenerConfigurationId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ErrorMessage` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ExceptionMessage` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `StackTrace` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ListenerLocalJNDIName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EventFiredByUsername` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RunAfterDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EventInstanceListenerId`),
  KEY `fk_event_listener_instance` (`EventInstanceId`),
  KEY `Status` (`Status`),
  KEY `event_instance_listener_l` (`ListenerConfigurationId`),
  CONSTRAINT `event_instance_listener_ei` FOREIGN KEY (`EventInstanceId`) REFERENCES `event_instance` (`EventInstanceId`),
  CONSTRAINT `event_instance_listener_l` FOREIGN KEY (`ListenerConfigurationId`) REFERENCES `event_listener` (`ListenerName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `event_instance_parameter`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `event_instance_parameter` (
  `EventInstanceParameterId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `EventInstanceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `EventParameterId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Value` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SerializedValueObject` longblob,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EventInstanceParameterId`),
  KEY `fk_instparam_inst` (`EventInstanceId`),
  KEY `event_instance_parameter_ix2` (`EventParameterId`),
  CONSTRAINT `event_instance_parameter_ei` FOREIGN KEY (`EventInstanceId`) REFERENCES `event_instance` (`EventInstanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `event_listener`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `event_listener` (
  `EventListenerId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `EventId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LocalJNDIName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ListenerName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ListenerClassName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EventPosition` int DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EventListenerId`),
  UNIQUE KEY `event_listener_ix2` (`ListenerName`),
  KEY `FK1729D0B9112CD535` (`EventId`),
  CONSTRAINT `FK1729D0B9112CD535` FOREIGN KEY (`EventId`) REFERENCES `event` (`EventId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `event_parameter`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `event_parameter` (
  `EventParameterId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `EventId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParameterName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParameterType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Required` tinyint(1) DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EventParameterId`),
  KEY `FK8B332844112CD535` (`EventId`),
  CONSTRAINT `FK8B332844112CD535` FOREIGN KEY (`EventId`) REFERENCES `event` (`EventId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_account`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_account` (
  `AccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OpenDate` datetime DEFAULT NULL,
  `SettlementDueDate` datetime DEFAULT NULL,
  `CountryCode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT NULL,
  `IsClosed` tinyint(1) DEFAULT NULL,
  `IsDefaultAccount` tinyint(1) DEFAULT NULL,
  `AccountStatusId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FinanceEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AccountTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Balance` double DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`AccountId`),
  KEY `idxAccount_Name` (`Name`),
  KEY `FK100F06C814CD7238` (`FinanceEntityId`),
  KEY `FK100F06C841B7CDDA` (`AccountStatusId`),
  KEY `FK100F06C8FDD04262` (`AccountTypeId`),
  CONSTRAINT `FK100F06C814CD7238` FOREIGN KEY (`FinanceEntityId`) REFERENCES `finance_entity` (`FinanceEntityId`),
  CONSTRAINT `FK100F06C841B7CDDA` FOREIGN KEY (`AccountStatusId`) REFERENCES `finance_account_status` (`AccountStatusId`),
  CONSTRAINT `FK100F06C8FDD04262` FOREIGN KEY (`AccountTypeId`) REFERENCES `finance_account_type` (`AccountTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_account_status`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_account_status` (
  `AccountStatusId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`AccountStatusId`),
  KEY `idxAccountStatus_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_account_suspend_history`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_account_suspend_history` (
  `AccountSuspendHistoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Reason` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Notes` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StartDateTime` datetime DEFAULT NULL,
  `EndDateTime` datetime DEFAULT NULL,
  `AccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`AccountSuspendHistoryId`),
  KEY `FK45EFFC1AA8BDC08` (`AccountId`),
  CONSTRAINT `FK45EFFC1AA8BDC08` FOREIGN KEY (`AccountId`) REFERENCES `finance_account` (`AccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_account_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_account_type` (
  `AccountTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`AccountTypeId`),
  KEY `idxAccountType_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_billing_service`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_billing_service` (
  `BillingServiceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ScheduleVOId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FrequencyType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FrequencyValue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BillingServiceTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`BillingServiceId`),
  KEY `idxBillingService_Name` (`Name`),
  KEY `FK7255968CBF9B2A6F` (`BillingServiceTypeId`),
  KEY `FK7255968CA8BDC08` (`AccountId`),
  CONSTRAINT `FK7255968CA8BDC08` FOREIGN KEY (`AccountId`) REFERENCES `finance_account` (`AccountId`),
  CONSTRAINT `FK7255968CBF9B2A6F` FOREIGN KEY (`BillingServiceTypeId`) REFERENCES `finance_billing_service_type` (`BillingServiceTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_billing_service_plan`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_billing_service_plan` (
  `BillingServicePlanId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FrequencyType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FrequencyValue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StartDateTime` datetime DEFAULT NULL,
  `EndDateTime` datetime DEFAULT NULL,
  `BillingServiceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PriceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`BillingServicePlanId`),
  KEY `idxRecurringPrice_Name` (`Name`),
  KEY `idxBillingServicePlan_StartDateTime` (`StartDateTime`),
  KEY `idxBillingServicePlan_EndDateTime` (`EndDateTime`),
  KEY `FKA60DE4FC50712424` (`PriceId`),
  KEY `FKA60DE4FCC2FED295` (`BillingServiceId`),
  CONSTRAINT `FKA60DE4FC50712424` FOREIGN KEY (`PriceId`) REFERENCES `finance_price` (`PriceId`),
  CONSTRAINT `FKA60DE4FCC2FED295` FOREIGN KEY (`BillingServiceId`) REFERENCES `finance_billing_service` (`BillingServiceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_billing_service_term`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_billing_service_term` (
  `BillingServiceTermId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `StartDateTime` datetime DEFAULT NULL,
  `EndDateTime` datetime DEFAULT NULL,
  `IsConsolidated` tinyint(1) DEFAULT NULL,
  `BillingServiceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `LineItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`BillingServiceTermId`),
  KEY `idxBillingServiceTerm_StartDateTime` (`StartDateTime`),
  KEY `idxBillingServiceTerm_EndDateTime` (`EndDateTime`),
  KEY `idxBillingServiceTerm_IsConsolidated` (`IsConsolidated`),
  KEY `FKA60F9E3FC2FED295` (`BillingServiceId`),
  KEY `finance_billing_service_term_fk2` (`LineItemId`),
  CONSTRAINT `finance_billing_service_term_fk2` FOREIGN KEY (`LineItemId`) REFERENCES `finance_line_item` (`LineItemId`),
  CONSTRAINT `FKA60F9E3FC2FED295` FOREIGN KEY (`BillingServiceId`) REFERENCES `finance_billing_service` (`BillingServiceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_billing_service_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_billing_service_type` (
  `BillingServiceTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`BillingServiceTypeId`),
  KEY `idxBillingServiceType_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_commission`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_commission` (
  `CommissionId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CommissionRateId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IsPaymentCollected` tinyint(1) DEFAULT NULL,
  `IsInitialAllocated` tinyint(1) DEFAULT NULL,
  `IsTrailingEnabled` tinyint(1) DEFAULT NULL,
  `LineItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `RecurringBillingServiceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SoldItemLineItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AgentsCommissionLineItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CommissionId`),
  KEY `FK313AF670BB79C752` (`RecurringBillingServiceId`),
  KEY `FK313AF670A8BDC08` (`AccountId`),
  KEY `FK313AF670A73BAF06` (`CommissionRateId`),
  KEY `FK313AF6705A99BCC2` (`LineItemId`),
  KEY `fk_commission_solditem` (`SoldItemLineItemId`),
  KEY `fk_commission_lineitem` (`AgentsCommissionLineItemId`),
  CONSTRAINT `cns_commission_lineitem` FOREIGN KEY (`AgentsCommissionLineItemId`) REFERENCES `finance_line_item` (`LineItemId`),
  CONSTRAINT `cns_commission_solditem` FOREIGN KEY (`SoldItemLineItemId`) REFERENCES `finance_line_item` (`LineItemId`),
  CONSTRAINT `FK313AF6705A99BCC2` FOREIGN KEY (`LineItemId`) REFERENCES `finance_line_item` (`LineItemId`),
  CONSTRAINT `FK313AF670A73BAF06` FOREIGN KEY (`CommissionRateId`) REFERENCES `finance_commission_rate` (`CommissionRateId`),
  CONSTRAINT `FK313AF670A8BDC08` FOREIGN KEY (`AccountId`) REFERENCES `finance_account` (`AccountId`),
  CONSTRAINT `FK313AF670BB79C752` FOREIGN KEY (`RecurringBillingServiceId`) REFERENCES `finance_account` (`AccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_commission_rate`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_commission_rate` (
  `CommissionRateId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CommissionTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `InitialPriceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TrailingPriceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `InitialPercentage` float(3,2) DEFAULT NULL,
  `TrailingPercentage` float(3,2) DEFAULT NULL,
  `MinimumSalesToReachRate` float(10,2) DEFAULT NULL,
  `MaximumSalesForRate` float(10,2) DEFAULT NULL,
  `Mode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CommissionRateId`),
  KEY `FKFBD954F786A480` (`InitialPriceId`),
  KEY `FKFBD954F6C51A468` (`TrailingPriceId`),
  KEY `FKFBD954FA73BAF06` (`CommissionRateId`),
  KEY `FKFBD954FABF5C2E0` (`CommissionTypeId`),
  CONSTRAINT `FKFBD954F6C51A468` FOREIGN KEY (`TrailingPriceId`) REFERENCES `finance_price` (`PriceId`),
  CONSTRAINT `FKFBD954F786A480` FOREIGN KEY (`InitialPriceId`) REFERENCES `finance_price` (`PriceId`),
  CONSTRAINT `FKFBD954FA73BAF06` FOREIGN KEY (`CommissionRateId`) REFERENCES `finance_commission_type` (`CommissionTypeId`),
  CONSTRAINT `FKFBD954FABF5C2E0` FOREIGN KEY (`CommissionTypeId`) REFERENCES `finance_commission_type` (`CommissionTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_commission_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_commission_type` (
  `CommissionTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CommissionTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_currency`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_currency` (
  `currencyCode` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`currencyCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_discount`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_discount` (
  `DiscountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `Currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ValidFrom` datetime DEFAULT NULL,
  `ValidTo` datetime DEFAULT NULL,
  `HasDiscountBeenUsed` tinyint(1) DEFAULT NULL,
  `DiscountTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CountryCode` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`DiscountId`),
  KEY `FK817C8C06BC4D2AB6` (`DiscountTypeId`),
  CONSTRAINT `FK817C8C06BC4D2AB6` FOREIGN KEY (`DiscountTypeId`) REFERENCES `finance_discount_type` (`DiscountTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_discount_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_discount_type` (
  `DiscountTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`DiscountTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_entity`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_entity` (
  `FinanceEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`FinanceEntityId`),
  UNIQUE KEY `Name` (`Name`),
  KEY `idxFinanceEntity_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_exchange_rate`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_exchange_rate` (
  `ExchangeRateId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CurrencyFrom` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CurrencyTo` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ConversionRate` double DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ExchangeRateId`),
  UNIQUE KEY `CurrencyFrom` (`CurrencyFrom`,`CurrencyTo`),
  KEY `FK5C6D31D735E2168C` (`CurrencyTo`),
  KEY `FK5C6D31D745B05F7B` (`CurrencyFrom`),
  CONSTRAINT `FK5C6D31D735E2168C` FOREIGN KEY (`CurrencyTo`) REFERENCES `finance_currency` (`currencyCode`),
  CONSTRAINT `FK5C6D31D745B05F7B` FOREIGN KEY (`CurrencyFrom`) REFERENCES `finance_currency` (`currencyCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_join_commission_group_account`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_join_commission_group_account` (
  `ProductGroupId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `AccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ProductGroupId`,`AccountId`),
  KEY `fk_prod_group_account` (`ProductGroupId`),
  KEY `fk_account_prod_group` (`AccountId`),
  CONSTRAINT `cns_account_prod_group` FOREIGN KEY (`AccountId`) REFERENCES `finance_account` (`AccountId`),
  CONSTRAINT `cns_prod_group_account` FOREIGN KEY (`ProductGroupId`) REFERENCES `finance_product_group` (`ProductGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_join_commission_rate_group`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_join_commission_rate_group` (
  `ProductGroupId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CommissionRateId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ProductGroupId`,`CommissionRateId`),
  KEY `fk_prod_group_rate` (`CommissionRateId`),
  KEY `fk_rate_prod_group` (`ProductGroupId`),
  CONSTRAINT `cns_prod_group_rate` FOREIGN KEY (`CommissionRateId`) REFERENCES `finance_commission_rate` (`CommissionRateId`),
  CONSTRAINT `cns_rate_prod_group` FOREIGN KEY (`ProductGroupId`) REFERENCES `finance_product_group` (`ProductGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_join_lineitem_discount`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_join_lineitem_discount` (
  `LineItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `DiscountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`LineItemId`,`DiscountId`),
  KEY `fk_lineitem_discount` (`LineItemId`),
  KEY `fk_discount_lineitem` (`DiscountId`),
  CONSTRAINT `cns_discount_lineitem` FOREIGN KEY (`DiscountId`) REFERENCES `finance_discount` (`DiscountId`),
  CONSTRAINT `cns_lineitem_discount` FOREIGN KEY (`LineItemId`) REFERENCES `finance_line_item` (`LineItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_join_template_tax`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_join_template_tax` (
  `LineItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `TaxId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`LineItemId`,`TaxId`),
  KEY `FK5AE166364CD9A06` (`TaxId`),
  KEY `FK5AE166365A99BCC2` (`LineItemId`),
  CONSTRAINT `FK5AE166364CD9A06` FOREIGN KEY (`TaxId`) REFERENCES `finance_tax` (`TaxId`),
  CONSTRAINT `FK5AE166365A99BCC2` FOREIGN KEY (`LineItemId`) REFERENCES `finance_line_item` (`LineItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_line_item`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_line_item` (
  `LineItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TransactionDate` datetime DEFAULT NULL,
  `Code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SequenceNumber` int DEFAULT NULL,
  `ExTaxAmount` double DEFAULT NULL,
  `PreDiscountAmount` double DEFAULT NULL,
  `TotalAmount` double DEFAULT NULL,
  `Currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IsCreditNote` tinyint(1) DEFAULT NULL,
  `IsInvoice` tinyint(1) DEFAULT NULL,
  `RunningBalance` double DEFAULT NULL,
  `FinancePeriodId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreditNotesInvoiceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PriceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `TransactionDateInMillis` bigint DEFAULT NULL,
  `Status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`LineItemId`),
  KEY `idxLineItem_Date` (`TransactionDate`),
  KEY `idxLineItem_Quantity` (`Quantity`),
  KEY `FK4A3C1E59ABF60496` (`FinancePeriodId`),
  KEY `FK4A3C1E59C54292E0` (`CreditNotesInvoiceId`),
  KEY `FK4A3C1E5950712424` (`PriceId`),
  CONSTRAINT `FK4A3C1E5950712424` FOREIGN KEY (`PriceId`) REFERENCES `finance_price` (`PriceId`),
  CONSTRAINT `FK4A3C1E59ABF60496` FOREIGN KEY (`FinancePeriodId`) REFERENCES `finance_period` (`FinancePeriodId`),
  CONSTRAINT `FK4A3C1E59C54292E0` FOREIGN KEY (`CreditNotesInvoiceId`) REFERENCES `finance_line_item` (`LineItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_line_item_reference`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_line_item_reference` (
  `Id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ReferenceType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReferenceIdentifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LineItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `idxLineItemReference_refType` (`ReferenceType`),
  KEY `idxLineItemReference_refId` (`ReferenceIdentifier`),
  KEY `FKAFCCFCE55A99BCC2` (`LineItemId`),
  CONSTRAINT `FKAFCCFCE55A99BCC2` FOREIGN KEY (`LineItemId`) REFERENCES `finance_line_item` (`LineItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_payment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_payment` (
  `PaymentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SequenceNumber` int DEFAULT NULL,
  `AmountCurrencyFrom` double DEFAULT NULL,
  `AmountCurrencyTo` double DEFAULT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StatusCode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StatusDescription` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PaymentDate` datetime DEFAULT NULL,
  `Method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CurrencyFrom` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CurrencyTo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExchangeRate` double DEFAULT NULL,
  `ExchangeFees` double DEFAULT NULL,
  `ExchangeFeesCurrency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IsReceipt` tinyint(1) DEFAULT NULL,
  `IsRefund` tinyint(1) DEFAULT NULL,
  `RunningBalance` double DEFAULT NULL,
  `FinancePeriodId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RefundsReceiptId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `PaymentDateInMillis` bigint DEFAULT NULL,
  `Status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PaymentId`),
  KEY `idxPayment_StatusCode` (`StatusCode`),
  KEY `idxPayment_StatusDescription` (`StatusDescription`),
  KEY `idxPayment_Name` (`Name`),
  KEY `FK2757AEA18A53EBD8` (`RefundsReceiptId`),
  KEY `FK2757AEA1ABF60496` (`FinancePeriodId`),
  CONSTRAINT `FK2757AEA18A53EBD8` FOREIGN KEY (`RefundsReceiptId`) REFERENCES `finance_payment` (`PaymentId`),
  CONSTRAINT `FK2757AEA1ABF60496` FOREIGN KEY (`FinancePeriodId`) REFERENCES `finance_period` (`FinancePeriodId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_payment_assigned`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_payment_assigned` (
  `PaymentAssignedId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Amount` double DEFAULT NULL,
  `FinancePeriodId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PaymentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PaymentAssignedId`),
  KEY `idxPaymentAssign_FinPeriodId` (`FinancePeriodId`),
  KEY `FKA6F575AC7249F1A1` (`PaymentId`),
  KEY `FKA6F575ACABF60496` (`FinancePeriodId`),
  CONSTRAINT `FKA6F575AC7249F1A1` FOREIGN KEY (`PaymentId`) REFERENCES `finance_payment` (`PaymentId`),
  CONSTRAINT `FKA6F575ACABF60496` FOREIGN KEY (`FinancePeriodId`) REFERENCES `finance_period` (`FinancePeriodId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_payment_method_details`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_payment_method_details` (
  `PaymentMethodDetailsId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Value` varchar(510) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PaymentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PaymentMethodDetailsId`),
  KEY `FKB84382427249F1A1` (`PaymentId`),
  CONSTRAINT `FKB84382427249F1A1` FOREIGN KEY (`PaymentId`) REFERENCES `finance_payment` (`PaymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_payment_reference`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_payment_reference` (
  `PaymentReferenceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Value` varchar(510) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PaymentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PaymentReferenceId`),
  KEY `FKAC06D32D7249F1A1` (`PaymentId`),
  CONSTRAINT `FKAC06D32D7249F1A1` FOREIGN KEY (`PaymentId`) REFERENCES `finance_payment` (`PaymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_period`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_period` (
  `FinancePeriodId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LastUpdated` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StartDateTime` datetime DEFAULT NULL,
  `EndDateTime` datetime DEFAULT NULL,
  `LineItemsTotal` double DEFAULT NULL,
  `PaymentsTotal` double DEFAULT NULL,
  `IsConsolidated` tinyint(1) DEFAULT NULL,
  `AmountOwing` double DEFAULT NULL,
  `IsClosed` tinyint(1) DEFAULT NULL,
  `AccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`FinancePeriodId`),
  KEY `idxFinancePeriod_IsConsolidated` (`IsConsolidated`),
  KEY `idxFinancePeriod_AmountOwing` (`AmountOwing`),
  KEY `idxFinancePeriod_Name` (`Name`),
  KEY `FK3B4879C6A8BDC08` (`AccountId`),
  CONSTRAINT `FK3B4879C6A8BDC08` FOREIGN KEY (`AccountId`) REFERENCES `finance_account` (`AccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_period_plan`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_period_plan` (
  `FinancePeriodPlanId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `FrequencyType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FrequencyValue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SettlementTermsType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SettlementTermsValue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StartDateTime` datetime DEFAULT NULL,
  `EndDateTime` datetime DEFAULT NULL,
  `AccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`FinancePeriodPlanId`),
  KEY `idxFinancePeriodPlan_EndDateTime` (`EndDateTime`),
  KEY `idxFinancePeriodPlan_StartDateTime` (`StartDateTime`),
  KEY `FK6369F602A8BDC08` (`AccountId`),
  CONSTRAINT `FK6369F602A8BDC08` FOREIGN KEY (`AccountId`) REFERENCES `finance_account` (`AccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_period_plan_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_period_plan_template` (
  `Id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FrequencyType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FrequencyValue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SettlementTermsType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SettlementTermsValue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `idxPeriodPlanTemplate_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_price`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_price` (
  `PriceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `Currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FrequencyType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FrequencyValue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ValidFrom` datetime DEFAULT NULL,
  `ValidTo` datetime DEFAULT NULL,
  `HasPriceBeenUsed` tinyint(1) DEFAULT NULL,
  `BillingServiceTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CountryCode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `IsTaxIncludedInPrice` tinyint(1) NOT NULL DEFAULT '1',
  `PriceTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PriceId`),
  KEY `idxServicePlanTemplate_Name` (`Name`),
  KEY `idxServicePlanTemplate_ValidTo` (`ValidTo`),
  KEY `idxServicePlanTemplate_ValidFrom` (`ValidFrom`),
  KEY `idxServicePlanTemplate_Code` (`Code`),
  KEY `FK22F798A4BF9B2A6F` (`BillingServiceTypeId`),
  CONSTRAINT `FK22F798A4BF9B2A6F` FOREIGN KEY (`BillingServiceTypeId`) REFERENCES `finance_billing_service_type` (`BillingServiceTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_price_search`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_price_search` (
  `PriceSearchId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReturnType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReturnId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ValidFrom` datetime DEFAULT NULL,
  `ValidTo` datetime DEFAULT NULL,
  `Priority` int DEFAULT NULL,
  `PriceSearchCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PriceSearchId`),
  KEY `idxPriceSearch_Priority` (`Priority`),
  KEY `FK937889A3E42261CA` (`PriceSearchCategoryId`),
  CONSTRAINT `FK937889A3E42261CA` FOREIGN KEY (`PriceSearchCategoryId`) REFERENCES `finance_price_search_category` (`PriceSearchCategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_price_search_category`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_price_search_category` (
  `PriceSearchCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PriceSearchCategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_price_search_criteria`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_price_search_criteria` (
  `PriceSearchCriteriaId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `PriceSearchTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PriceSearchId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Value` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PriceSearchCriteriaId`),
  KEY `FK2593AE7B870C586` (`PriceSearchTypeId`),
  KEY `FK2593AE7B3813912C` (`PriceSearchId`),
  CONSTRAINT `FK2593AE7B3813912C` FOREIGN KEY (`PriceSearchId`) REFERENCES `finance_price_search` (`PriceSearchId`),
  CONSTRAINT `FK2593AE7B870C586` FOREIGN KEY (`PriceSearchTypeId`) REFERENCES `finance_price_search_type` (`PriceSearchTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_price_search_display`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_price_search_display` (
  `PriceSearchTypeDisplayId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `PriceSearchTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DisplayValue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReturnValue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PriceSearchTypeDisplayId`),
  KEY `fk_price_display` (`PriceSearchTypeId`),
  CONSTRAINT `cns_price_display` FOREIGN KEY (`PriceSearchTypeId`) REFERENCES `finance_price_search_type` (`PriceSearchTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_price_search_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_price_search_type` (
  `PriceSearchTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ValueType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RuleKey` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PriceSearchCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `IsMultiValue` bit(1) DEFAULT NULL,
  `UseDisplayQuery` bit(1) DEFAULT NULL,
  `DisplayQuery` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DisplayMethod` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DisplayOrder` int DEFAULT NULL,
  `AllowAllCriteria` tinyint(1) DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PriceSearchTypeId`),
  KEY `FKBB0C4C56E42261CA` (`PriceSearchCategoryId`),
  CONSTRAINT `FKBB0C4C56E42261CA` FOREIGN KEY (`PriceSearchCategoryId`) REFERENCES `finance_price_search_category` (`PriceSearchCategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_price_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_price_type` (
  `PriceTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PriceTypeId`),
  KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_product_group`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_product_group` (
  `ProductGroupId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ValidityScheduleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ProductGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_statement`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_statement` (
  `StatementId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DateGenerated` datetime DEFAULT NULL,
  `AccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`StatementId`),
  KEY `FK3905EB4AA8BDC08` (`AccountId`),
  CONSTRAINT `FK3905EB4AA8BDC08` FOREIGN KEY (`AccountId`) REFERENCES `finance_account` (`AccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_tax`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_tax` (
  `TaxId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `UseType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TaxTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `HasTaxBeenUsed` tinyint(1) DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TaxId`),
  KEY `idxTax_StartDate` (`StartDate`),
  KEY `idxTax_EndDate` (`EndDate`),
  KEY `FK91C1C664E6D160` (`TaxTypeId`),
  CONSTRAINT `FK91C1C664E6D160` FOREIGN KEY (`TaxTypeId`) REFERENCES `finance_tax_type` (`TaxTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `finance_tax_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `finance_tax_type` (
  `TaxTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TaxTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `hibernate_sequence`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `howdidyouhear_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `howdidyouhear_type` (
  `HowDidYouHearTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `ShowOnline` tinyint(1) DEFAULT NULL,
  `OnlineDescription` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`HowDidYouHearTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `howdidyouhear_type_licensee`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `howdidyouhear_type_licensee` (
  `HowDidYouHearTypeLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HowDidYouHearTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`HowDidYouHearTypeLicenseeId`),
  UNIQUE KEY `LicenseeId` (`LicenseeId`,`HowDidYouHearTypeId`),
  KEY `cns_howdidyouhear_type_licensee_howdidyouheartype` (`HowDidYouHearTypeId`),
  KEY `cns_howdidyouhear_type_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `cns_howdidyouhear_type_licensee_howdidyouheartype` FOREIGN KEY (`HowDidYouHearTypeId`) REFERENCES `howdidyouhear_type` (`HowDidYouHearTypeId`),
  CONSTRAINT `cns_howdidyouhear_type_licensee_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`),
  CONSTRAINT `cns_howdidyouhear_type_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `howdidyouhearaboutus`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `howdidyouhearaboutus` (
  `HowDidYouHearAboutUsId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `HowDidYouHearAboutUs` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HowDidYouHearTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`HowDidYouHearAboutUsId`),
  KEY `FKA30234A0BFESUDJE` (`HowDidYouHearTypeId`),
  KEY `FKA30234A0BFUEYRTW` (`EntityId`),
  CONSTRAINT `FKA30234A0BDKRIE` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `FKA30234A0BFEYSHDK` FOREIGN KEY (`HowDidYouHearTypeId`) REFERENCES `howdidyouhear_type` (`HowDidYouHearTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `ip_information`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `ip_information` (
  `Id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `IP_FROM` double DEFAULT NULL,
  `IP_TO` double DEFAULT NULL,
  `COUNTRY_CODE2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COUNTRY_CODE3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COUNTRY_NAME` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `idxipinfo_ipto` (`IP_TO`),
  KEY `idxipinfo_ipfrom` (`IP_FROM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `jms_channel_mapping`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `jms_channel_mapping` (
  `ID` bigint NOT NULL DEFAULT '0',
  `TYPE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `JMS_DEST_NAME` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `JMS_SUB_NAME` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_ID` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SELECTOR` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NO_LOCAL` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `jms_counter`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `jms_counter` (
  `NAME` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NEXT_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `jms_message`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `jms_message` (
  `MESSAGEID` bigint NOT NULL DEFAULT '0',
  `RELIABLE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EXPIRATION` bigint DEFAULT NULL,
  `TIMESTAMP` bigint DEFAULT NULL,
  `PRIORITY` tinyint DEFAULT NULL,
  `COREHEADERS` mediumblob,
  `PAYLOAD` longblob,
  `CHANNELCOUNT` int DEFAULT NULL,
  `TYPE` tinyint DEFAULT NULL,
  `JMSTYPE` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CORRELATIONID` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CORRELATIONID_BYTES` varbinary(254) DEFAULT NULL,
  `DESTINATION_ID` bigint DEFAULT NULL,
  `REPLYTO_ID` bigint DEFAULT NULL,
  `JMSPROPERTIES` mediumblob,
  PRIMARY KEY (`MESSAGEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `jms_message_reference`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `jms_message_reference` (
  `CHANNELID` bigint NOT NULL DEFAULT '0',
  `MESSAGEID` bigint NOT NULL DEFAULT '0',
  `TRANSACTIONID` bigint DEFAULT NULL,
  `STATE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ORD` bigint DEFAULT NULL,
  `DELIVERYCOUNT` int DEFAULT NULL,
  `RELIABLE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LOADED` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CHANNELID`,`MESSAGEID`),
  KEY `JMS_MESSAGE_REF_TX` (`TRANSACTIONID`),
  KEY `JMS_MESSAGE_REF_ORD` (`ORD`),
  KEY `JMS_MESSAGE_REF_MESSAGEID` (`MESSAGEID`),
  KEY `JMS_MESSAGE_REF_LOADED` (`LOADED`),
  KEY `JMS_MESSAGE_REF_RELIABLE` (`RELIABLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `jms_role`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `jms_role` (
  `ROLEID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `USERID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USERID`,`ROLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `jms_roles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `jms_roles` (
  `ROLEID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `USERID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USERID`,`ROLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `jms_subscriptions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `jms_subscriptions` (
  `CLIENTID` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SUBNAME` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TOPIC` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SELECTOR` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CLIENTID`,`SUBNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `jms_transaction`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `jms_transaction` (
  `TRANSACTIONID` bigint NOT NULL DEFAULT '0',
  `BRANCH_QUAL` varbinary(254) DEFAULT NULL,
  `FORMAT_ID` int DEFAULT NULL,
  `GLOBAL_TXID` varbinary(254) DEFAULT NULL,
  PRIMARY KEY (`TRANSACTIONID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `jms_user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `jms_user` (
  `USERID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PASSWD` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENTID` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `jms_users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `jms_users` (
  `USERID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PASSWD` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENTID` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `knowit_crmitem`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `knowit_crmitem` (
  `CRMItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CRMTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CRMStatusId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CRMItemEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ActionOwnerEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OpenDate` datetime DEFAULT NULL,
  `DueDate` datetime DEFAULT NULL,
  `CloseDate` datetime DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `ActionTakerEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CRMItemId`),
  KEY `cns_crm_type` (`CRMTypeId`),
  KEY `cns_crm_status` (`CRMStatusId`),
  KEY `cns_crm_entity_item` (`CRMItemEntityId`),
  KEY `cns_crm_entity_owner` (`ActionOwnerEntityId`),
  KEY `cns_crm_entity_taker` (`ActionTakerEntityId`),
  CONSTRAINT `cns_crm_entity_item` FOREIGN KEY (`CRMItemEntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `cns_crm_entity_owner` FOREIGN KEY (`ActionOwnerEntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `cns_crm_entity_taker` FOREIGN KEY (`ActionTakerEntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `cns_crm_status` FOREIGN KEY (`CRMStatusId`) REFERENCES `knowit_crmitemstatus` (`CRMStatusId`),
  CONSTRAINT `cns_crm_type` FOREIGN KEY (`CRMTypeId`) REFERENCES `knowit_crmitemtype` (`CRMTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `knowit_crmitemstatus`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `knowit_crmitemstatus` (
  `CRMStatusId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CRMStatusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `knowit_crmitemtype`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `knowit_crmitemtype` (
  `CRMTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CRMTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `knowit_tandc_acceptance`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `knowit_tandc_acceptance` (
  `AcceptanceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AcceptanceDate` datetime NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`AcceptanceId`),
  KEY `fk_tandc_entity` (`EntityId`),
  CONSTRAINT `cns_tandc_entity` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `knowledge`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `knowledge` (
  `KnowledgeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `KnowledgeCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `KnowledgeSubCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NameKey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DescriptionKey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UrlId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Weight` int DEFAULT NULL,
  `KnowledgeResponseTemplateId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`KnowledgeId`),
  KEY `FK5C61687E7EE01B54` (`KnowledgeResponseTemplateId`),
  KEY `FK5C61687E4E33ECA` (`UrlId`),
  KEY `FK5C61687EC9DB33B4` (`NameKey`),
  KEY `FK5C61687EDEF21CE3` (`DescriptionKey`),
  KEY `FK5C61687E99EAF95B` (`KnowledgeSubCategoryId`),
  KEY `FK5C61687E571C85B7` (`KnowledgeCategoryId`),
  CONSTRAINT `FK5C61687E4E33ECA` FOREIGN KEY (`UrlId`) REFERENCES `url` (`UrlId`),
  CONSTRAINT `FK5C61687E571C85B7` FOREIGN KEY (`KnowledgeCategoryId`) REFERENCES `knowledge_category` (`KnowledgeCategoryId`),
  CONSTRAINT `FK5C61687E7EE01B54` FOREIGN KEY (`KnowledgeResponseTemplateId`) REFERENCES `knowledge_response_template` (`KnowledgeResponseTemplateId`),
  CONSTRAINT `FK5C61687E99EAF95B` FOREIGN KEY (`KnowledgeSubCategoryId`) REFERENCES `knowledge_subcategory` (`KnowledgeSubCategoryId`),
  CONSTRAINT `FK5C61687EC9DB33B4` FOREIGN KEY (`NameKey`) REFERENCES `resource_key` (`KeyName`),
  CONSTRAINT `FK5C61687EDEF21CE3` FOREIGN KEY (`DescriptionKey`) REFERENCES `resource_key` (`KeyName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `knowledge_category`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `knowledge_category` (
  `KnowledgeCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `NameKey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Weight` int DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`KnowledgeCategoryId`),
  KEY `FK1B41339FC9DB33B4` (`NameKey`),
  CONSTRAINT `FK1B41339FC9DB33B4` FOREIGN KEY (`NameKey`) REFERENCES `resource_key` (`KeyName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `knowledge_relationship`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `knowledge_relationship` (
  `RelationshipId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `KnowledgeParentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `KnowledgeChildId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RelationshipTypeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`RelationshipId`),
  KEY `FK4154B4591D05B119` (`KnowledgeChildId`),
  KEY `FK4154B4592DCEDABF` (`RelationshipTypeCode`),
  KEY `FK4154B45966D23DE3` (`KnowledgeParentId`),
  CONSTRAINT `FK4154B4591D05B119` FOREIGN KEY (`KnowledgeChildId`) REFERENCES `knowledge` (`KnowledgeId`),
  CONSTRAINT `FK4154B4592DCEDABF` FOREIGN KEY (`RelationshipTypeCode`) REFERENCES `knowledge_relationship_type` (`relationshipTypeCode`),
  CONSTRAINT `FK4154B45966D23DE3` FOREIGN KEY (`KnowledgeParentId`) REFERENCES `knowledge` (`KnowledgeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `knowledge_relationship_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `knowledge_relationship_type` (
  `relationshipTypeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`relationshipTypeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `knowledge_response`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `knowledge_response` (
  `KnowledgeResponseId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `KnowledgeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `KnowledgeResponseTemplateId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OwnerId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IntegerValue` int DEFAULT NULL,
  `StringValue` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `BooleanValue` tinyint(1) DEFAULT NULL,
  `RecordingLength` double DEFAULT NULL,
  `ReviewerRecordingLength` double DEFAULT NULL,
  `ReviewerId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReviewerComment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReviewerRating` int DEFAULT NULL,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`KnowledgeResponseId`),
  KEY `FK3F58AE2245AB30E` (`OwnerId`),
  KEY `FK3F58AE27EE01B54` (`KnowledgeResponseTemplateId`),
  KEY `FK3F58AE249E5F385` (`ParentId`),
  KEY `FK3F58AE25D50620` (`ReviewerId`),
  KEY `FK3F58AE22D12F219` (`KnowledgeId`),
  CONSTRAINT `FK3F58AE2245AB30E` FOREIGN KEY (`OwnerId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `FK3F58AE22D12F219` FOREIGN KEY (`KnowledgeId`) REFERENCES `knowledge` (`KnowledgeId`),
  CONSTRAINT `FK3F58AE249E5F385` FOREIGN KEY (`ParentId`) REFERENCES `knowledge_response` (`KnowledgeResponseId`),
  CONSTRAINT `FK3F58AE25D50620` FOREIGN KEY (`ReviewerId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `FK3F58AE27EE01B54` FOREIGN KEY (`KnowledgeResponseTemplateId`) REFERENCES `knowledge_response_template` (`KnowledgeResponseTemplateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `knowledge_response_option`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `knowledge_response_option` (
  `KnowledgeResponseOptionId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `KnowledgeResponseId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ResponseTemplateOptionId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`KnowledgeResponseOptionId`),
  KEY `FKA9F5872E418183A` (`KnowledgeResponseId`),
  KEY `FKA9F5872B333398B` (`ResponseTemplateOptionId`),
  CONSTRAINT `FKA9F5872B333398B` FOREIGN KEY (`ResponseTemplateOptionId`) REFERENCES `knowledge_response_template_op` (`ResponseTemplateOptionId`),
  CONSTRAINT `FKA9F5872E418183A` FOREIGN KEY (`KnowledgeResponseId`) REFERENCES `knowledge_response` (`KnowledgeResponseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `knowledge_response_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `knowledge_response_template` (
  `KnowledgeResponseTemplateId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Length` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReviewerRatingMin` int DEFAULT NULL,
  `ReviewerRatingMax` int DEFAULT NULL,
  `ReviewType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DisplayOptions` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DescriptionKey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DefaultReviewerCommentKey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`KnowledgeResponseTemplateId`),
  KEY `FK961B913759FD5366` (`DefaultReviewerCommentKey`),
  KEY `FK961B9137DEF21CE3` (`DescriptionKey`),
  CONSTRAINT `FK961B913759FD5366` FOREIGN KEY (`DefaultReviewerCommentKey`) REFERENCES `resource_key` (`KeyName`),
  CONSTRAINT `FK961B9137DEF21CE3` FOREIGN KEY (`DescriptionKey`) REFERENCES `resource_key` (`KeyName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `knowledge_response_template_op`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `knowledge_response_template_op` (
  `ResponseTemplateOptionId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `DescriptionKey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `KnowledgeResponseTemplateId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Weight` int DEFAULT NULL,
  `Points` int DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ResponseTemplateOptionId`),
  KEY `FK320941E97EE01B54` (`KnowledgeResponseTemplateId`),
  KEY `FK320941E9DEF21CE3` (`DescriptionKey`),
  CONSTRAINT `FK320941E97EE01B54` FOREIGN KEY (`KnowledgeResponseTemplateId`) REFERENCES `knowledge_response_template` (`KnowledgeResponseTemplateId`),
  CONSTRAINT `FK320941E9DEF21CE3` FOREIGN KEY (`DescriptionKey`) REFERENCES `resource_key` (`KeyName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `knowledge_role`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `knowledge_role` (
  `KnowledgeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`KnowledgeId`,`Name`),
  KEY `FK8CB26F9724EEAB` (`Name`),
  KEY `FK8CB26F972D12F219` (`KnowledgeId`),
  CONSTRAINT `FK8CB26F9724EEAB` FOREIGN KEY (`Name`) REFERENCES `role` (`name`),
  CONSTRAINT `FK8CB26F972D12F219` FOREIGN KEY (`KnowledgeId`) REFERENCES `knowledge` (`KnowledgeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `knowledge_subcategory`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `knowledge_subcategory` (
  `KnowledgeSubCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `NameKey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `KnowledgeCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Weight` int DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`KnowledgeSubCategoryId`),
  KEY `FK9A7134FDC9DB33B4` (`NameKey`),
  KEY `FK9A7134FD571C85B7` (`KnowledgeCategoryId`),
  CONSTRAINT `FK9A7134FD571C85B7` FOREIGN KEY (`KnowledgeCategoryId`) REFERENCES `knowledge_category` (`KnowledgeCategoryId`),
  CONSTRAINT `FK9A7134FDC9DB33B4` FOREIGN KEY (`NameKey`) REFERENCES `resource_key` (`KeyName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `mail_campaign`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `mail_campaign` (
  `CampaignId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PauseInMillis` int DEFAULT NULL,
  `NumberToSend` int DEFAULT NULL,
  `EmailFrom` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailSubject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailMessage` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `EmailContentType` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailTemplate` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CampaignId`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `mail_campaign_variable`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `mail_campaign_variable` (
  `MailCampaignVariableId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CampaignId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MailCampaignVariableId`),
  KEY `fk_mail_campaign_variable` (`CampaignId`),
  CONSTRAINT `fk_mail_campaign_variable` FOREIGN KEY (`CampaignId`) REFERENCES `mail_campaign` (`CampaignId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `mail_message`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `mail_message` (
  `MailMessageId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CampaignId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MailUserId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StatusDescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ViewCount` int DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MailMessageId`),
  KEY `CampaignId` (`CampaignId`),
  KEY `EmailAddress` (`MailUserId`),
  CONSTRAINT `0_2839` FOREIGN KEY (`CampaignId`) REFERENCES `mail_campaign` (`CampaignId`),
  CONSTRAINT `0_2841` FOREIGN KEY (`MailUserId`) REFERENCES `mail_user` (`MailUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `mail_message_variable`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `mail_message_variable` (
  `MailMessageVariableId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `MailMessageId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MailMessageVariableId`),
  KEY `fk_mail_message_variable` (`MailMessageId`),
  CONSTRAINT `fk_mail_message_variable` FOREIGN KEY (`MailMessageId`) REFERENCES `mail_message` (`MailMessageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `mail_user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `mail_user` (
  `MailUserId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `EmailAddress` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `PersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Unsubscribe` tinyint(1) DEFAULT NULL,
  `OptInNewsletter` tinyint(1) DEFAULT NULL,
  `OptInUpdates` tinyint(1) DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MailUserId`),
  UNIQUE KEY `EmailAddress` (`EmailAddress`),
  KEY `idxMail_Unsubscribe` (`Unsubscribe`),
  KEY `idxMail_Updates` (`OptInUpdates`),
  KEY `idxMail_Newsletter` (`OptInNewsletter`),
  KEY `fk_mail_user_entity` (`PersonId`),
  CONSTRAINT `40288172038b77c601039b0dc49900f6` FOREIGN KEY (`PersonId`) REFERENCES `entity` (`EntityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `mv_accountprimarycontact`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `mv_accountprimarycontact` (
  `accountName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `primaryContactGivenName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactFamilyName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactTelephoneHome` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactTelephoneMobile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactEmail1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `accountName` (`accountName`),
  KEY `primaryContactEntityId` (`primaryContactEntityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `mv_booking`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `mv_booking` (
  `bookingId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enrolmentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bookingStatus` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courseId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `classStatus` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `classEntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `bookingInvoiceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bookingInvoiceUseVirtualCreditNote` bit(1) DEFAULT NULL,
  `bookingInvoiceStatus` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendanceSystemName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendanceSetByEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendanceSetDate` datetime DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  UNIQUE KEY `bookingId` (`bookingId`),
  KEY `enrolmentId` (`enrolmentId`),
  KEY `courseId` (`courseId`),
  KEY `classStatus` (`classStatus`),
  KEY `startDate` (`startDate`),
  KEY `endDate` (`endDate`),
  KEY `classEntityAttributesId` (`classEntityAttributesId`),
  KEY `bookingInvoiceId` (`bookingInvoiceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `mv_corporate_bookings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `mv_corporate_bookings` (
  `CorporateBookingId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CourseId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `BookableEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SportsStudentEAId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `EnrolmentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `AccountName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FirstLesson` datetime DEFAULT NULL,
  `LastLesson` datetime DEFAULT NULL,
  `primarykey` int unsigned NOT NULL AUTO_INCREMENT,
  `CreationDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`primarykey`),
  KEY `CourseId` (`CourseId`),
  KEY `BookableEntityId` (`BookableEntityId`),
  KEY `SportsStudentEAId` (`SportsStudentEAId`),
  KEY `EnrolmentId` (`EnrolmentId`),
  KEY `FirstLesson` (`FirstLesson`),
  KEY `LastLesson` (`LastLesson`)
) ENGINE=MyISAM AUTO_INCREMENT=16585 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `mv_course_events`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `mv_course_events` (
  `CourseEventId` bigint unsigned NOT NULL DEFAULT '0',
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TimeStart` datetime DEFAULT NULL,
  `TimeEnd` datetime DEFAULT NULL,
  `Duration` bigint unsigned NOT NULL DEFAULT '0',
  `CreationDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  KEY `CourseEventId` (`CourseEventId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `mv_enrolment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `mv_enrolment` (
  `sportsAccountEntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sportsAccountEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `financeAccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sportsAccountCreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sportsAccountCreationDate` datetime DEFAULT NULL,
  `primaryContactEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactTitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactGivenName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactFamilyName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactTelephoneWork` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactTelephoneMobile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactTelephoneHome` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactEmail1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactOrganisation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactAddressLine1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactAddressLine2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactAddressLine3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactLocality` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactState` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactPostCode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactCountry` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactLongitude` decimal(10,6) DEFAULT NULL,
  `primaryContactLatitude` decimal(10,6) DEFAULT NULL,
  `optInMarketingEmails` tinyint DEFAULT NULL,
  `optInMarketingPartners` tinyint DEFAULT NULL,
  `optInMarketingPhone` tinyint DEFAULT NULL,
  `optInMarketingSMS` tinyint DEFAULT NULL,
  `enrolmentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enrolmentType` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enrolmentStatus` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agentId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enrolmentCreationDate` datetime DEFAULT NULL,
  `bookableEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClassStartTime` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClassEndTime` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClassDayOfWeek` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CourseStartTime` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CourseEndTime` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CourseRecurrenceIncrementStart` int DEFAULT NULL,
  `studentEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `studentUsername` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `studentTitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `studentGivenName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `studentFamilyName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `studentDateOfBirth` datetime DEFAULT NULL,
  `studentGender` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `studentEntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instructorEntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instructorEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instructorName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instructorGivenName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instructorFamilyName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IsSelfEmployed` tinyint(1) DEFAULT NULL,
  `courseEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courseName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courseEntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courseType` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courseBookingType` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClassDurationInMinutes` int DEFAULT NULL,
  `NumberOfStudentsPerInstructor` int DEFAULT NULL,
  `venueEntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `venueEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `venueName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `venueCode` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `programLevelEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `programLevelName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `programEntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `programEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `programName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `termScheduleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `termScheduleName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `termStart` datetime DEFAULT NULL,
  `termEnd` datetime DEFAULT NULL,
  `termType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bookings` bigint DEFAULT NULL,
  `BookingStatus` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BookingInvoiceStatus` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UseVirtualCreditNote` bit(1) DEFAULT NULL,
  `bookingCustomerType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bookingCustomerTrend` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EnrolmentGroupId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoiceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoiceCode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoiceName` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoiceDescription` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoiceCreationDate` datetime DEFAULT NULL,
  `invoiceCreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoiceTransactionDate` datetime DEFAULT NULL,
  `InvoiceTransactionDateMidnight` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exTaxAmount` double DEFAULT NULL,
  `preDiscountAmount` double DEFAULT NULL,
  `invoiceTotal` double DEFAULT NULL,
  `invoiceQuantity` int DEFAULT NULL,
  `PriceName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PriceAmount` double DEFAULT NULL,
  `discountTypeName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DiscountTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discountName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DiscountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstClassDate` datetime DEFAULT NULL,
  `lastClassDate` datetime DEFAULT NULL,
  `licenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `licenseeCode` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referralSchools` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enrolmentSystem` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primarykey` int unsigned NOT NULL AUTO_INCREMENT,
  `CreationDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`primarykey`),
  KEY `sportsAccountEntityAttributesId` (`sportsAccountEntityAttributesId`),
  KEY `primaryContactEntityId` (`primaryContactEntityId`),
  KEY `enrolmentId` (`enrolmentId`),
  KEY `agentId` (`agentId`),
  KEY `studentEntityId` (`studentEntityId`),
  KEY `studentEntityAttributesId` (`studentEntityAttributesId`),
  KEY `instructorEntityAttributesId` (`instructorEntityAttributesId`),
  KEY `instructorEntityId` (`instructorEntityId`),
  KEY `courseEntityId` (`courseEntityId`),
  KEY `courseEntityAttributesId` (`courseEntityAttributesId`),
  KEY `venueEntityAttributesId` (`venueEntityAttributesId`),
  KEY `venueEntityId` (`venueEntityId`),
  KEY `programLevelEntityId` (`programLevelEntityId`),
  KEY `programEntityAttributesId` (`programEntityAttributesId`),
  KEY `programEntityId` (`programEntityId`),
  KEY `termScheduleId` (`termScheduleId`),
  KEY `termScheduleName` (`termScheduleName`),
  KEY `termStart` (`termStart`),
  KEY `termEnd` (`termEnd`),
  KEY `EnrolmentGroupId` (`EnrolmentGroupId`),
  KEY `invoiceId` (`invoiceId`),
  KEY `invoiceCode` (`invoiceCode`),
  KEY `invoiceTransactionDate` (`invoiceTransactionDate`),
  KEY `ClassStartTime` (`ClassStartTime`),
  KEY `ClassEndTime` (`ClassEndTime`),
  KEY `DiscountTypeId` (`DiscountTypeId`)
) ENGINE=MyISAM AUTO_INCREMENT=113668 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `mv_enrolment_invoice`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `mv_enrolment_invoice` (
  `sportsAccountEntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sportsAccountEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `financeAccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactTitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactGivenName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactFamilyName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactTelephoneWork` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactTelephoneMobile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactTelephoneHome` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactEmail1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactOrganisation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactAddressLine1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactAddressLine2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactAddressLine3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactLocality` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactState` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactPostCode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryContactCountry` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `optInMarketingEmails` tinyint DEFAULT NULL,
  `optInMarketingPartners` tinyint DEFAULT NULL,
  `optInMarketingPhone` tinyint DEFAULT NULL,
  `optInMarketingSMS` tinyint DEFAULT NULL,
  `numberOfEnrolments` bigint DEFAULT NULL,
  `enrolmentTypeList` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enrolmentStatusList` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClassStartTime` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClassEndTime` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClassDayOfWeek` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `studentEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `studentUsername` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `studentGivenName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `studentFamilyName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `studentDateOfBirth` datetime DEFAULT NULL,
  `studentGender` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `studentEntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numberOfInstructors` bigint DEFAULT NULL,
  `instructorNameList` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instructorGivenNameList` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instructorFamilyNameList` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isSelfEmployedList` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numberOfCourses` bigint DEFAULT NULL,
  `courseNameList` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courseTypeList` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClassDurationInMinutesList` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NumberOfStudentsPerInstructorList` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numberOfVenues` bigint DEFAULT NULL,
  `venueEntityIdList` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `venueNameList` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `venueCodeList` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numberOfProgramLevels` bigint DEFAULT NULL,
  `programLevelEntityIdList` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `programLevelNameList` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numberOfPrograms` bigint DEFAULT NULL,
  `programNameList` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numberOfTerms` bigint DEFAULT NULL,
  `termScheduleIdList` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `termScheduleNameList` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `initialTermStart` datetime DEFAULT NULL,
  `finalTermEnd` datetime DEFAULT NULL,
  `termTypeList` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bookings` bigint DEFAULT NULL,
  `BookingStatusList` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BookingInvoiceStatusList` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UseVirtualCreditNote` bigint unsigned DEFAULT NULL,
  `bookingCustomerTypeList` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bookingCustomerTrendList` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EnrolmentGroupIdList` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoiceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `invoiceCode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoiceName` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoiceDescription` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoiceCreationDate` datetime DEFAULT NULL,
  `invoiceCreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoiceTransactionDate` datetime DEFAULT NULL,
  `InvoiceTransactionDateMidnight` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exTaxAmount` double DEFAULT NULL,
  `preDiscountAmount` double DEFAULT NULL,
  `invoiceTotal` double DEFAULT NULL,
  `invoiceQuantity` int DEFAULT NULL,
  `PriceName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PriceAmount` double DEFAULT NULL,
  `discountTypeName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DiscountTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discountName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DiscountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstClassDate` datetime DEFAULT NULL,
  `lastClassDate` datetime DEFAULT NULL,
  `licenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `licenseeCode` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enrolmentSystem` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primarykey` int unsigned NOT NULL AUTO_INCREMENT,
  `CreationDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`primarykey`),
  KEY `sportsAccountEntityAttributesId` (`sportsAccountEntityAttributesId`),
  KEY `primaryContactEntityId` (`primaryContactEntityId`),
  KEY `initialTermStart` (`initialTermStart`),
  KEY `finalTermEnd` (`finalTermEnd`),
  KEY `invoiceId` (`invoiceId`),
  KEY `invoiceCode` (`invoiceCode`),
  KEY `invoiceTransactionDate` (`invoiceTransactionDate`),
  KEY `ClassStartTime` (`ClassStartTime`),
  KEY `ClassEndTime` (`ClassEndTime`),
  KEY `DiscountTypeId` (`DiscountTypeId`)
) ENGINE=MyISAM AUTO_INCREMENT=76950 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `mv_instructor_login`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `mv_instructor_login` (
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GivenName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FamilyName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TelephoneHome` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TelephoneWork` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TelephoneMobile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LanguagePrimary` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `Organisation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AddressLine1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AddressLine2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AddressLine3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Locality` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `State` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PostCode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Country` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `EntityId` (`EntityId`),
  KEY `Username` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `mv_invoice_creditnotestotal`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `mv_invoice_creditnotestotal` (
  `invoiceid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `invoiceTotalAmount` double DEFAULT NULL,
  `creditNotesTotalAmount` double DEFAULT NULL,
  `creditNotesTotalQuantity` decimal(32,0) DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`invoiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `mv_moodle_news`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `mv_moodle_news` (
  `NewsId` bigint unsigned NOT NULL DEFAULT '0',
  `DatePosted` datetime DEFAULT NULL,
  `UserFirstName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `UserLastName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Message` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  KEY `NewsId` (`NewsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `mv_sportsprimaryaddress`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `mv_sportsprimaryaddress` (
  `entityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GivenName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FamilyName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AddressTypeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AddressId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Organisation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AddressLine1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AddressLine2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AddressLine3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Locality` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `State` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PostCode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Country` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Longitude` decimal(10,6) DEFAULT NULL,
  `Latitude` decimal(10,6) DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  KEY `entityId` (`entityId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `mv_student_level_complete`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `mv_student_level_complete` (
  `StudentName` varchar(383) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StudentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProgramLevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LevelSequence` int DEFAULT NULL,
  `classesNumber` bigint NOT NULL DEFAULT '0',
  KEY `ProgramId` (`ProgramId`),
  KEY `StudentId` (`StudentId`),
  KEY `ProgramLevelId` (`ProgramLevelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `mv_student_numbers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `mv_student_numbers` (
  `TermId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `TermName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Year` int DEFAULT NULL,
  `WeekNumber` int DEFAULT NULL,
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `VenueName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `ProgramCode` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `NumberOfStudentsPerInstructor` int NOT NULL DEFAULT '0',
  `ClassDurationInMinutes` int NOT NULL DEFAULT '0',
  `NumberOfClasses` bigint NOT NULL DEFAULT '0',
  `NumberOfBookings` decimal(42,0) DEFAULT NULL,
  `NumberOfEmptyClasses` decimal(42,0) DEFAULT NULL,
  `primarykey` int unsigned NOT NULL AUTO_INCREMENT,
  `CreationDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`primarykey`),
  KEY `TermId` (`TermId`),
  KEY `VenueId` (`VenueId`),
  KEY `ProgramId` (`ProgramId`)
) ENGINE=MyISAM AUTO_INCREMENT=16386 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `mv_student_progression`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `mv_student_progression` (
  `BookingId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CorporateBookingId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StudentEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BookableEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BookingDate` datetime DEFAULT NULL,
  `InstructorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CourseInstructorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `InstructorGivenName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `InstructorFamilyName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TermId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `BookingTypeEnum` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProgramLevelEAId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProgramLevelName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AchievedModules` int DEFAULT NULL,
  `AchievedAwards` int DEFAULT NULL,
  `AchievedChallenges` int DEFAULT NULL,
  `primarykey` int unsigned NOT NULL AUTO_INCREMENT,
  `CreationDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`primarykey`),
  KEY `BookingId` (`BookingId`),
  KEY `InstructorId` (`InstructorId`),
  KEY `CourseInstructorId` (`CourseInstructorId`),
  KEY `CorporateBookingId` (`CorporateBookingId`),
  KEY `BookableEntityId` (`BookableEntityId`),
  KEY `StudentEntityId` (`StudentEntityId`),
  KEY `BookingDate` (`BookingDate`),
  KEY `ProgramLevelEAId` (`ProgramLevelEAId`)
) ENGINE=MyISAM AUTO_INCREMENT=304646 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `mv_student_progression_averages`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `mv_student_progression_averages` (
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProgramLevelEAId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProgramLevelName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ModuleProgressionRate` decimal(40,8) DEFAULT NULL,
  `NumberOfBookings` decimal(42,0) DEFAULT NULL,
  `AchievedModuleCount` decimal(54,0) DEFAULT NULL,
  `AchievedChallengeCount` decimal(54,0) DEFAULT NULL,
  `ChallengeProgressionRate` decimal(40,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `mv_transactions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `mv_transactions` (
  `TransactionDate` datetime DEFAULT NULL,
  `TransactionDateInMillis` bigint DEFAULT NULL,
  `Code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RunningBalance` double DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AccountName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AccountBalance` double DEFAULT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `LicenseeCode` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `primarykey` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`primarykey`),
  KEY `TransactionDate` (`TransactionDate`),
  KEY `TransactionDateInMillis` (`TransactionDateInMillis`),
  KEY `AccountName` (`AccountName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `note`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `note` (
  `NoteId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Intent` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Module` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `NoteMakerId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NoteTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IsMajorNote` tinyint(1) DEFAULT NULL,
  `IsSystemNote` tinyint(1) DEFAULT NULL,
  `IsActionRequired` tinyint(1) DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `NoteMethodId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`NoteId`),
  KEY `FK33AFF2938DC0D` (`NoteMakerId`),
  KEY `FK33AFF23F1EECA7` (`NoteTypeId`),
  KEY `FK33AFF2868EE47E` (`EntityId`),
  KEY `FKA3X23DRSDF` (`NoteMethodId`),
  CONSTRAINT `FK33AFF23F1EECA7` FOREIGN KEY (`NoteTypeId`) REFERENCES `note_type` (`NoteTypeId`),
  CONSTRAINT `FK33AFF2868EE47E` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `FK33AFF2938DC0D` FOREIGN KEY (`NoteMakerId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `FKA3X234ADASDEDFIR` FOREIGN KEY (`NoteMethodId`) REFERENCES `note_method` (`NoteMethodId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `note_method`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `note_method` (
  `NoteMethodId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`NoteMethodId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `note_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `note_type` (
  `NoteTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`NoteTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `note_type_licensee`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `note_type_licensee` (
  `NoteTypeLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NoteTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`NoteTypeLicenseeId`),
  UNIQUE KEY `LicenseeId` (`LicenseeId`,`NoteTypeId`),
  KEY `cns_note_type_licensee_note_type` (`NoteTypeId`),
  KEY `cns_note_type_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `cns_note_type_licensee_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`),
  CONSTRAINT `cns_note_type_licensee_note_type` FOREIGN KEY (`NoteTypeId`) REFERENCES `note_type` (`NoteTypeId`),
  CONSTRAINT `cns_note_type_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `personal_leave`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `personal_leave` (
  `PersonalLeaveId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PersonalLeaveId`),
  KEY `idxPersonalLeave_EndDate` (`EndDate`),
  KEY `idxPersonalLeave_StartDate` (`StartDate`),
  KEY `FK318227F8868EE47E` (`EntityId`),
  CONSTRAINT `FK318227F8868EE47E` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `relationship`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `relationship` (
  `RelationshipId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `EntityParentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `EntityChildId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `RelationshipTypeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`RelationshipId`),
  UNIQUE KEY `cns_relationship_parent_child` (`EntityParentId`,`EntityChildId`,`RelationshipTypeCode`),
  KEY `FKF06476382DCEDABF` (`RelationshipTypeCode`),
  KEY `FKF0647638198A75D4` (`EntityChildId`),
  KEY `FKF0647638FAE61088` (`EntityParentId`),
  CONSTRAINT `FKF0647638198A75D4` FOREIGN KEY (`EntityChildId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `FKF06476382DCEDABF` FOREIGN KEY (`RelationshipTypeCode`) REFERENCES `relationship_type` (`relationshipTypeCode`),
  CONSTRAINT `FKF0647638FAE61088` FOREIGN KEY (`EntityParentId`) REFERENCES `entity` (`EntityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `relationship_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `relationship_type` (
  `relationshipTypeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`relationshipTypeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `request`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `request` (
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ServletRequestId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `scheme` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `protocol` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contentLength` int DEFAULT NULL,
  `contentType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `characterEncoding` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remoteAddr` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remoteHost` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serverName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serverPort` int DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `queryString` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `authType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contextPath` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pathInfo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pathTranslated` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remoteUser` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requestedSessionId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requestURI` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StartTimeInMillis` bigint DEFAULT NULL,
  `EndTimeInMillis` bigint DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ServletRequestId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `resource_bundle`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `resource_bundle` (
  `ResourceBundleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `BundleName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ResourceBundleId`),
  UNIQUE KEY `BundleName` (`BundleName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `resource_key`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `resource_key` (
  `KeyName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LookupKey` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ResourceBundleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`KeyName`),
  KEY `idxUniqueLookupKey` (`LookupKey`),
  KEY `FKE91BDAAE15D99F8B` (`ResourceBundleId`),
  CONSTRAINT `FKE91BDAAE15D99F8B` FOREIGN KEY (`ResourceBundleId`) REFERENCES `resource_bundle` (`ResourceBundleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `resource_locale`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `resource_locale` (
  `ResourceLocaleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `LocaleName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ResourceBundleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Charset` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ResourceLocaleId`),
  KEY `FK22A63BAB15D99F8B` (`ResourceBundleId`),
  CONSTRAINT `FK22A63BAB15D99F8B` FOREIGN KEY (`ResourceBundleId`) REFERENCES `resource_bundle` (`ResourceBundleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `resource_value`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `resource_value` (
  `ResourceValueId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ResourceLocaleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `KeyName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ResourceValueId`),
  UNIQUE KEY `ResourceLocaleId` (`ResourceLocaleId`,`KeyName`),
  KEY `FK1228F600D4506763` (`ResourceLocaleId`),
  KEY `FK1228F600329ADD6A` (`KeyName`),
  CONSTRAINT `FK1228F600329ADD6A` FOREIGN KEY (`KeyName`) REFERENCES `resource_key` (`KeyName`),
  CONSTRAINT `FK1228F600D4506763` FOREIGN KEY (`ResourceLocaleId`) REFERENCES `resource_locale` (`ResourceLocaleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `resource_value_index`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `resource_value_index` (
  `ResourceValueIndexId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ResourceValueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ResourceValueIndexId`),
  KEY `FKB93001D3F839825E` (`ResourceValueId`),
  CONSTRAINT `FKB93001D3F839825E` FOREIGN KEY (`ResourceValueId`) REFERENCES `resource_value` (`ResourceValueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `role`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `role` (
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `schedule`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `schedule` (
  `ScheduleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ScheduleType` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Availability` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `Reason` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ScheduleGroupId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParentScheduleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `RecurrenceIncrement` int DEFAULT NULL,
  `RecurrenceIncrementField` int DEFAULT NULL,
  `RecurrenceIncrementStart` int DEFAULT NULL,
  `RecurrenceRangeCount` int DEFAULT NULL,
  `RecurrenceRangeStart` datetime DEFAULT NULL,
  `RecurrenceRangeEnd` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ScheduleId`),
  KEY `FKD66692974C022E7C` (`ParentScheduleId`),
  KEY `FKD6669297358B5143` (`ScheduleGroupId`),
  KEY `idx_schedule_start` (`StartDate`),
  KEY `idx_schedule_end` (`EndDate`),
  CONSTRAINT `FKD6669297358B5143` FOREIGN KEY (`ScheduleGroupId`) REFERENCES `schedule_group` (`ScheduleGroupId`),
  CONSTRAINT `FKD66692974C022E7C` FOREIGN KEY (`ParentScheduleId`) REFERENCES `schedule` (`ScheduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `schedule_assignment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `schedule_assignment` (
  `ScheduleAssignmentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ScheduleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ScheduleAssignmentId`),
  KEY `FKA5FC95754DDE2E32` (`ScheduleId`),
  KEY `FKA5FC9575868EE47E` (`EntityId`),
  CONSTRAINT `FKA5FC95754DDE2E32` FOREIGN KEY (`ScheduleId`) REFERENCES `schedule` (`ScheduleId`),
  CONSTRAINT `FKA5FC9575868EE47E` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `schedule_group`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `schedule_group` (
  `ScheduleGroupId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `OverlapType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ScheduleGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `schedule_range`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `schedule_range` (
  `RecurringScheduleRangeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `RecurringScheduleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RangeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`RecurringScheduleRangeId`),
  KEY `FK1C0EA1959D837F18` (`RangeId`),
  KEY `FK1C0EA195A7EAB4AF` (`RecurringScheduleId`),
  CONSTRAINT `FK1C0EA1959D837F18` FOREIGN KEY (`RangeId`) REFERENCES `schedule` (`ScheduleId`),
  CONSTRAINT `FK1C0EA195A7EAB4AF` FOREIGN KEY (`RecurringScheduleId`) REFERENCES `schedule` (`ScheduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `service`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `service` (
  `ServiceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BillingPrice` double DEFAULT NULL,
  `BillingFrequency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ServiceTypeCode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ServiceId`),
  KEY `FK7643C6B5868EE47E` (`EntityId`),
  CONSTRAINT `FK7643C6B5868EE47E` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_abandoned_cart`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_abandoned_cart` (
  `AbandonedCartId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsAccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsStudentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CourseId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DateAddedToCart` datetime NOT NULL,
  `ExpiryDate` datetime NOT NULL,
  `AbandonedCartConfigurationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SystemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `ProgramLevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`AbandonedCartId`),
  KEY `sports_abandoned_cart_sa` (`SportsAccountId`),
  KEY `sports_abandoned_cart_ss` (`SportsStudentId`),
  KEY `sports_abandoned_cart_c` (`CourseId`),
  KEY `sports_abandoned_cart_ac` (`AbandonedCartConfigurationId`),
  KEY `sports_abandoned_cart_sys` (`SystemId`),
  KEY `sports_abandoned_cart_pf` (`ProgramLevelId`),
  CONSTRAINT `sports_abandoned_cart_ac` FOREIGN KEY (`AbandonedCartConfigurationId`) REFERENCES `sports_abandoned_cart_configuration` (`AbandonedCartConfigurationId`),
  CONSTRAINT `sports_abandoned_cart_c` FOREIGN KEY (`CourseId`) REFERENCES `sports_course` (`EntityAttributesId`),
  CONSTRAINT `sports_abandoned_cart_pf` FOREIGN KEY (`ProgramLevelId`) REFERENCES `sports_program_level` (`EntityAttributesId`),
  CONSTRAINT `sports_abandoned_cart_sa` FOREIGN KEY (`SportsAccountId`) REFERENCES `sports_account` (`EntityAttributesId`),
  CONSTRAINT `sports_abandoned_cart_ss` FOREIGN KEY (`SportsStudentId`) REFERENCES `sports_student` (`EntityAttributesId`),
  CONSTRAINT `sports_abandoned_cart_sys` FOREIGN KEY (`SystemId`) REFERENCES `sports_system` (`SystemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_abandoned_cart_configuration`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_abandoned_cart_configuration` (
  `AbandonedCartConfigurationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ExpireAfterHours` int DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`AbandonedCartConfigurationId`),
  KEY `sports_abandoned_cart_configuration_ml` (`MasterLicenseeId`),
  CONSTRAINT `sports_abandoned_cart_configuration_ml` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_abandoned_cart_schedule`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_abandoned_cart_schedule` (
  `AbandonedCartScheduleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AbandonedCartConfigurationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SendAfterHours` int NOT NULL,
  `EmailTemplateId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CourseNotAvailableEmailTemplateId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`AbandonedCartScheduleId`),
  KEY `sports_abandoned_cart_schedule_c` (`AbandonedCartConfigurationId`),
  KEY `sports_abandoned_cart_schedule_et` (`EmailTemplateId`),
  KEY `sports_abandoned_cart_schedule_ncet` (`CourseNotAvailableEmailTemplateId`),
  CONSTRAINT `sports_abandoned_cart_schedule_c` FOREIGN KEY (`AbandonedCartConfigurationId`) REFERENCES `sports_abandoned_cart_configuration` (`AbandonedCartConfigurationId`),
  CONSTRAINT `sports_abandoned_cart_schedule_et` FOREIGN KEY (`EmailTemplateId`) REFERENCES `sports_email_template` (`EmailTemplateId`),
  CONSTRAINT `sports_abandoned_cart_schedule_ncet` FOREIGN KEY (`CourseNotAvailableEmailTemplateId`) REFERENCES `sports_email_template` (`EmailTemplateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_abandoned_cart_send_schedule`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_abandoned_cart_send_schedule` (
  `AbandonedCartSendScheduleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AbandonedCartId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AbandonedCartScheduleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DateSent` datetime DEFAULT NULL,
  `SendAfter` datetime NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FailedReason` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`AbandonedCartSendScheduleId`),
  KEY `sports_abandoned_cart_send_schedule_ac` (`AbandonedCartId`),
  KEY `sports_abandoned_cart_send_schedule_acs` (`AbandonedCartScheduleId`),
  CONSTRAINT `sports_abandoned_cart_send_schedule_ac` FOREIGN KEY (`AbandonedCartId`) REFERENCES `sports_abandoned_cart` (`AbandonedCartId`),
  CONSTRAINT `sports_abandoned_cart_send_schedule_acs` FOREIGN KEY (`AbandonedCartScheduleId`) REFERENCES `sports_abandoned_cart_schedule` (`AbandonedCartScheduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_account`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_account` (
  `EntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `FinanceAccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CampaignNumber` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PoseidonAccountNumber` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AccountName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BookableEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AutoRenewal` tinyint(1) DEFAULT NULL,
  `Archive` tinyint(1) DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EntityAttributesId`),
  KEY `FK63B096D441F058E` (`FinanceAccountId`),
  KEY `fk_account_entity` (`EntityId`),
  KEY `fk_account_finances` (`FinanceAccountId`),
  KEY `cns_account_bookable` (`BookableEntityId`),
  KEY `cns_account_licensee` (`LicenseeId`),
  CONSTRAINT `cns_account_bookable` FOREIGN KEY (`BookableEntityId`) REFERENCES `sports_bookable_entity` (`BookableEntityId`),
  CONSTRAINT `cns_account_entity` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `cns_account_finances` FOREIGN KEY (`FinanceAccountId`) REFERENCES `finance_account` (`AccountId`),
  CONSTRAINT `cns_account_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`),
  CONSTRAINT `FK63B096D441F058E` FOREIGN KEY (`FinanceAccountId`) REFERENCES `finance_account` (`AccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_account_alert`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_account_alert` (
  `SportsAccountAlertId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsAccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NoteMethodLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AlertDate` datetime NOT NULL,
  `Status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TicketId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TicketCommunicationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AcknowledgedBySportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AcknowledgedDate` datetime DEFAULT NULL,
  `OwnerSportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`SportsAccountAlertId`),
  KEY `sports_account_alert_tc` (`TicketCommunicationId`),
  KEY `sports_account_alert_sa` (`SportsAccountId`),
  KEY `sports_account_alert_nml` (`NoteMethodLicenseeId`),
  KEY `sports_account_alert_t` (`TicketId`),
  KEY `sports_account_alert_owner_sp` (`OwnerSportsPersonId`),
  KEY `sports_account_alert_ao` (`AcknowledgedBySportsPersonId`),
  CONSTRAINT `sports_account_alert_ao` FOREIGN KEY (`AcknowledgedBySportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`),
  CONSTRAINT `sports_account_alert_nml` FOREIGN KEY (`NoteMethodLicenseeId`) REFERENCES `sports_ticket_communication_method` (`NoteMethodLicenseeId`),
  CONSTRAINT `sports_account_alert_owner_sp` FOREIGN KEY (`OwnerSportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`),
  CONSTRAINT `sports_account_alert_sa` FOREIGN KEY (`SportsAccountId`) REFERENCES `sports_account` (`EntityAttributesId`),
  CONSTRAINT `sports_account_alert_t` FOREIGN KEY (`TicketId`) REFERENCES `sports_ticket` (`TicketId`),
  CONSTRAINT `sports_account_alert_tc` FOREIGN KEY (`TicketCommunicationId`) REFERENCES `sports_ticket_communication` (`TicketCommunicationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_account_payment_gateway`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_account_payment_gateway` (
  `SportsAccountPaymentGatewayId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ClientReference` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PaymentGatewayId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsAccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `Type` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MandateId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MandateStatus` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MandateStatusUpdatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`SportsAccountPaymentGatewayId`),
  KEY `sports_account_payment_gateway_gateway` (`PaymentGatewayId`),
  KEY `sports_account_payment_gateway_account` (`SportsAccountId`),
  KEY `sports_account_payment_gateway_mandate` (`MandateId`),
  CONSTRAINT `sports_account_payment_gateway_account` FOREIGN KEY (`SportsAccountId`) REFERENCES `sports_account` (`EntityAttributesId`),
  CONSTRAINT `sports_account_payment_gateway_gateway` FOREIGN KEY (`PaymentGatewayId`) REFERENCES `sports_payment_gateway` (`PaymentGatewayId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_account_payment_gateway_card`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_account_payment_gateway_card` (
  `SportsAccountPaymentGatewayCardId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsAccountPaymentGatewayId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CardType` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TrailingDigits` int DEFAULT NULL,
  `Expiry` datetime NOT NULL,
  `IsPrimary` tinyint(1) NOT NULL,
  `CardReference` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `AddressId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CardLength` int NOT NULL,
  `CardholderName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CardholderTitle` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CardholderGivenName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CardholderFamilyName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TrailingFourDigits` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`SportsAccountPaymentGatewayCardId`),
  KEY `sports_account_payment_gateway_card_gateway` (`SportsAccountPaymentGatewayId`),
  KEY `sports_account_payment_gateway_card_address` (`AddressId`),
  CONSTRAINT `sports_account_payment_gateway_card_address` FOREIGN KEY (`AddressId`) REFERENCES `address` (`AddressId`),
  CONSTRAINT `sports_account_payment_gateway_card_gateway` FOREIGN KEY (`SportsAccountPaymentGatewayId`) REFERENCES `sports_account_payment_gateway` (`SportsAccountPaymentGatewayId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_account_payment_gateway_event`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_account_payment_gateway_event` (
  `SportsAccountPaymentGatewayEventId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsAccountPaymentGatewayId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `EventId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedAt` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ResourceType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Origin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Cause` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReasonCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Scheme` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NewCustomerBankAccount` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NewMandate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Organisation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParentEvent` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Payment` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Payout` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PreviousCustomerBankAccount` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Refund` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Subscription` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `CreatedAtDate` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`SportsAccountPaymentGatewayEventId`),
  UNIQUE KEY `sports_account_payment_gateway_event_e` (`EventId`),
  KEY `sports_account_payment_gateway_event_pg` (`SportsAccountPaymentGatewayId`),
  CONSTRAINT `sports_account_payment_gateway_event_pg` FOREIGN KEY (`SportsAccountPaymentGatewayId`) REFERENCES `sports_account_payment_gateway` (`SportsAccountPaymentGatewayId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_account_payment_gateway_event_metadata`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_account_payment_gateway_event_metadata` (
  `SportsAccountPaymentGatewayEventMetadataId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsAccountPaymentGatewayEventId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MetadataKey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MetadataValue` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`SportsAccountPaymentGatewayEventMetadataId`),
  KEY `sports_account_payment_gateway_event_metadata_e` (`SportsAccountPaymentGatewayEventId`),
  CONSTRAINT `sports_account_payment_gateway_event_metadata_e` FOREIGN KEY (`SportsAccountPaymentGatewayEventId`) REFERENCES `sports_account_payment_gateway_event` (`SportsAccountPaymentGatewayEventId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_account_payment_gateway_event_notification`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_account_payment_gateway_event_notification` (
  `SportsAccountPaymentGatewayEventNotificationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NotificationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Deadline` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Mandatory` tinyint(1) DEFAULT NULL,
  `Type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SportsAccountPaymentGatewayEventId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`SportsAccountPaymentGatewayEventNotificationId`),
  KEY `sports_account_payment_gateway_event_notification_e` (`SportsAccountPaymentGatewayEventId`),
  CONSTRAINT `sports_account_payment_gateway_event_notification_e` FOREIGN KEY (`SportsAccountPaymentGatewayEventId`) REFERENCES `sports_account_payment_gateway_event` (`SportsAccountPaymentGatewayEventId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_account_policy`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_account_policy` (
  `SportsAccountPolicyId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PolicyId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsAccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Date` datetime NOT NULL,
  `SystemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AcceptanceType` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EnrolmentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`SportsAccountPolicyId`),
  KEY `sports_account_policy_policy` (`PolicyId`),
  KEY `sports_account_policy_acc` (`SportsAccountId`),
  KEY `sports_account_policy_person` (`SportsPersonId`),
  KEY `sports_account_policy_system` (`SystemId`),
  CONSTRAINT `sports_account_policy_acc` FOREIGN KEY (`SportsAccountId`) REFERENCES `sports_account` (`EntityAttributesId`),
  CONSTRAINT `sports_account_policy_person` FOREIGN KEY (`SportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`),
  CONSTRAINT `sports_account_policy_policy` FOREIGN KEY (`PolicyId`) REFERENCES `sports_policy` (`PolicyId`),
  CONSTRAINT `sports_account_policy_system` FOREIGN KEY (`SystemId`) REFERENCES `sports_system` (`SystemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_billing_service`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_billing_service` (
  `SportsRecurringBillingServiceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `EnrolmentGroupId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `BillingServiceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `EnrolmentProfileId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `PaymentType` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SubscriptionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SubscriptionStatus` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SportsAccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NextSubscriptionPaymentDate` datetime DEFAULT NULL,
  `SportsAccountPaymentGatewayId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`SportsRecurringBillingServiceId`),
  UNIQUE KEY `sports_billing_service_sub` (`SubscriptionId`),
  KEY `sports_billing_service_enrolment_group` (`EnrolmentGroupId`),
  KEY `sports_billing_service_billing_service` (`BillingServiceId`),
  KEY `sports_billing_service_config` (`EnrolmentProfileId`),
  KEY `sports_billing_service_sa` (`SportsAccountId`),
  KEY `sports_billing_service_pg` (`SportsAccountPaymentGatewayId`),
  CONSTRAINT `sports_billing_service_billing_service` FOREIGN KEY (`BillingServiceId`) REFERENCES `finance_billing_service` (`BillingServiceId`),
  CONSTRAINT `sports_billing_service_config` FOREIGN KEY (`EnrolmentProfileId`) REFERENCES `sports_enrolment_profile` (`EnrolmentProfileId`),
  CONSTRAINT `sports_billing_service_enrolment_group` FOREIGN KEY (`EnrolmentGroupId`) REFERENCES `sports_enrolment_group` (`EnrolmentGroupId`),
  CONSTRAINT `sports_billing_service_pg` FOREIGN KEY (`SportsAccountPaymentGatewayId`) REFERENCES `sports_account_payment_gateway` (`SportsAccountPaymentGatewayId`),
  CONSTRAINT `sports_billing_service_sa` FOREIGN KEY (`SportsAccountId`) REFERENCES `sports_account` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_bookable_entity`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_bookable_entity` (
  `BookableEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`BookableEntityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_booking`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_booking` (
  `BookingId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ClassId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EnrolmentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Attendance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `BookingCustomerType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BookingCustomerTrend` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `InstructorComments` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AttendanceSystemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AttendanceSetByEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AttendanceSetDate` datetime DEFAULT NULL,
  `AttendanceIncludedInInstructorHours` tinyint(1) DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`BookingId`),
  KEY `FK504287999619CC93` (`ClassId`),
  KEY `FK504287993B32EAFF` (`EnrolmentId`),
  KEY `FK504287993B32EABC` (`EnrolmentId`),
  KEY `FK504287999619CC94` (`ClassId`),
  KEY `FK504287993B32EABE` (`EnrolmentId`),
  KEY `FK50428799961994CC` (`ClassId`),
  KEY `Status` (`Status`),
  KEY `cns_booking_attendance_system` (`AttendanceSystemId`),
  KEY `cns_booking_attendance_entity` (`AttendanceSetByEntityId`),
  CONSTRAINT `cns_booking_attendance_entity` FOREIGN KEY (`AttendanceSetByEntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `cns_booking_attendance_system` FOREIGN KEY (`AttendanceSystemId`) REFERENCES `sports_system` (`SystemId`),
  CONSTRAINT `FK504287993B32EABE` FOREIGN KEY (`EnrolmentId`) REFERENCES `sports_enrolment` (`EnrolmentId`),
  CONSTRAINT `FK50428799961994CC` FOREIGN KEY (`ClassId`) REFERENCES `sports_class` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_booking_invoice`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_booking_invoice` (
  `BookingInvoiceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `BookingId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LineItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UseVirtualCreditNote` bit(1) DEFAULT NULL,
  `SportsCreditId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`BookingInvoiceId`),
  KEY `fk_booking_invoice` (`BookingId`),
  KEY `fk_invoice_booking` (`LineItemId`),
  KEY `idx_booking_invoice_status` (`Status`),
  CONSTRAINT `cns_booking_invoice` FOREIGN KEY (`BookingId`) REFERENCES `sports_booking` (`BookingId`),
  CONSTRAINT `cns_invoice_booking` FOREIGN KEY (`LineItemId`) REFERENCES `finance_line_item` (`LineItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_booking_welcome_email`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_booking_welcome_email` (
  `BookingWelcomeEmailId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsAccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TermId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DateSent` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`BookingWelcomeEmailId`),
  KEY `sports_welcome_email_account` (`SportsAccountId`),
  KEY `sports_welcome_email_term` (`TermId`),
  KEY `sports_welcome_email_venue` (`VenueId`),
  CONSTRAINT `sports_welcome_email_account` FOREIGN KEY (`SportsAccountId`) REFERENCES `sports_account` (`EntityAttributesId`),
  CONSTRAINT `sports_welcome_email_term` FOREIGN KEY (`TermId`) REFERENCES `sports_term` (`TermId`),
  CONSTRAINT `sports_welcome_email_venue` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_call`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_call` (
  `CallId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DateFrom` datetime NOT NULL,
  `DateTo` datetime DEFAULT NULL,
  `TelephoneNumber` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SportsAccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OperatorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `SportsNoteId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TicketTypeId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CallIdentifier` int DEFAULT NULL,
  PRIMARY KEY (`CallId`),
  KEY `sports_call_sports_account` (`SportsAccountId`),
  KEY `sports_call_operator` (`OperatorId`),
  KEY `sports_call_note` (`SportsNoteId`),
  KEY `sports_call_ticket_type` (`TicketTypeId`),
  CONSTRAINT `sports_call_note` FOREIGN KEY (`SportsNoteId`) REFERENCES `sports_note` (`SportsNoteId`),
  CONSTRAINT `sports_call_operator` FOREIGN KEY (`OperatorId`) REFERENCES `sports_operator` (`EntityAttributesId`),
  CONSTRAINT `sports_call_sports_account` FOREIGN KEY (`SportsAccountId`) REFERENCES `sports_account` (`EntityAttributesId`),
  CONSTRAINT `sports_call_ticket_type` FOREIGN KEY (`TicketTypeId`) REFERENCES `sports_ticket_type` (`TicketTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_campaign`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_campaign` (
  `CampaignId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CommunicationPerDay` int DEFAULT NULL,
  `TargetTakings` double DEFAULT NULL,
  `TargetEnrolments` int DEFAULT NULL,
  `IncludeInReports` tinyint(1) DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `Code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CampaignId`),
  KEY `sports_campaign_licensee` (`LicenseeId`),
  CONSTRAINT `sports_campaign_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_campaign_finder`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_campaign_finder` (
  `CampaignFinderId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Value` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CampaignId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CampaignFinderId`),
  KEY `sports_campaign_finder_campaign` (`CampaignId`),
  CONSTRAINT `sports_campaign_finder_campaign` FOREIGN KEY (`CampaignId`) REFERENCES `sports_campaign` (`CampaignId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_cancel_reason`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_cancel_reason` (
  `CancelReasonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Reason` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `AccountNumber` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StudentEAId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StudentName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VenueCode` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EnrolmentStatus` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VenueName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CancelReasonId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_change_password_email`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_change_password_email` (
  `ChangePasswordEmailId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ExpiryDate` datetime NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChangePasswordEmailId`),
  KEY `fk_change_password_person` (`PersonId`),
  CONSTRAINT `cns_change_password_person` FOREIGN KEY (`PersonId`) REFERENCES `entity` (`EntityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_class`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_class` (
  `EntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CourseId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `InstructorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProgramLevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `NextClassLevelChecked` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`EntityAttributesId`),
  KEY `FK863F8B8EDE5B2B6` (`CourseId`),
  KEY `fk_class_entity` (`EntityId`),
  KEY `fk_class_instructor` (`InstructorId`),
  KEY `sports_class_program_level` (`ProgramLevelId`),
  CONSTRAINT `cns_class_entity` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `FK863F8B8EDE5B2B6` FOREIGN KEY (`CourseId`) REFERENCES `sports_course` (`EntityAttributesId`),
  CONSTRAINT `fk_class_instructor` FOREIGN KEY (`InstructorId`) REFERENCES `sports_instructor` (`EntityAttributesId`),
  CONSTRAINT `sports_class_program_level` FOREIGN KEY (`ProgramLevelId`) REFERENCES `sports_program_level` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_class_cancellation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_class_cancellation` (
  `ClassCancellationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ClassCancellationReasonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Reason` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClassId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreditType` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `IncludedInInstructorHours` tinyint(1) DEFAULT NULL,
  `ClassCancellationPeriodId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ClassCancellationId`),
  KEY `sports_class_cancellation_reason` (`ClassCancellationReasonId`),
  KEY `sports_class_cancellation_class` (`ClassId`),
  KEY `sports_class_cancellation_period` (`ClassCancellationPeriodId`),
  CONSTRAINT `sports_class_cancellation_class` FOREIGN KEY (`ClassId`) REFERENCES `sports_class` (`EntityAttributesId`),
  CONSTRAINT `sports_class_cancellation_period` FOREIGN KEY (`ClassCancellationPeriodId`) REFERENCES `sports_class_cancellation_period` (`ClassCancellationPeriodId`),
  CONSTRAINT `sports_class_cancellation_reason` FOREIGN KEY (`ClassCancellationReasonId`) REFERENCES `sports_class_cancellation_reason` (`ClassCancellationReasonId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_class_cancellation_booking`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_class_cancellation_booking` (
  `ClassCancellationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `BookingId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ClassCancellationId`,`BookingId`),
  KEY `sports_class_cancellation_booking_booking` (`BookingId`),
  CONSTRAINT `sports_class_cancellation_booking_booking` FOREIGN KEY (`BookingId`) REFERENCES `sports_booking` (`BookingId`),
  CONSTRAINT `sports_class_cancellation_booking_cancellation` FOREIGN KEY (`ClassCancellationId`) REFERENCES `sports_class_cancellation` (`ClassCancellationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_class_cancellation_line_item`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_class_cancellation_line_item` (
  `ClassCancellationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LineItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ClassCancellationId`,`LineItemId`),
  KEY `sports_class_cancellation_booking_line_item` (`LineItemId`),
  CONSTRAINT `sports_class_cancellation_booking_cancellation_two` FOREIGN KEY (`ClassCancellationId`) REFERENCES `sports_class_cancellation` (`ClassCancellationId`),
  CONSTRAINT `sports_class_cancellation_booking_line_item` FOREIGN KEY (`LineItemId`) REFERENCES `finance_line_item` (`LineItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_class_cancellation_period`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_class_cancellation_period` (
  `ClassCancellationPeriodId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ClassCancellationPeriodId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_class_cancellation_reason`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_class_cancellation_reason` (
  `ClassCancellationReasonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Preventable` tinyint(1) NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ClassCancellationReasonId`),
  KEY `sports_class_cancellation_reason_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_class_cancellation_reason_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_corporate_booking`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_corporate_booking` (
  `CorporateBookingId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ClassId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `EnrolmentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsStudentEAId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Attendance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `InstructorComments` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AttendanceSystemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AttendanceSetByEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AttendanceSetDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CorporateBookingId`) USING BTREE,
  KEY `cns_corporate_booking_class` (`ClassId`) USING BTREE,
  KEY `cns_corporate_booking_enrolment` (`EnrolmentId`) USING BTREE,
  KEY `Status` (`Status`) USING BTREE,
  KEY `cns_corporate_booking_attendance_system` (`AttendanceSystemId`) USING BTREE,
  KEY `cns_corporate_booking_attendance_entity` (`AttendanceSetByEntityId`) USING BTREE,
  KEY `cns_corporate_booking_student` (`SportsStudentEAId`) USING BTREE,
  CONSTRAINT `cns_corporate_booking_attendance_entity` FOREIGN KEY (`AttendanceSetByEntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `cns_corporate_booking_attendance_system` FOREIGN KEY (`AttendanceSystemId`) REFERENCES `sports_system` (`SystemId`),
  CONSTRAINT `cns_corporate_booking_class` FOREIGN KEY (`ClassId`) REFERENCES `sports_class` (`EntityAttributesId`),
  CONSTRAINT `cns_corporate_booking_enrolment` FOREIGN KEY (`EnrolmentId`) REFERENCES `sports_enrolment` (`EnrolmentId`),
  CONSTRAINT `cns_corporate_booking_student` FOREIGN KEY (`SportsStudentEAId`) REFERENCES `sports_student` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_corporate_referring_account`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_corporate_referring_account` (
  `CorporateReferringAccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `StudentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `EnrolmentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ReferringAccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CorporateReferringAccountId`) USING BTREE,
  KEY `cns_corporate_referring_account_account` (`ReferringAccountId`) USING BTREE,
  KEY `cns_corporate_referring_account_enrolment` (`EnrolmentId`) USING BTREE,
  KEY `cns_corporate_referring_account_student` (`StudentId`) USING BTREE,
  CONSTRAINT `cns_corporate_referring_account_account` FOREIGN KEY (`ReferringAccountId`) REFERENCES `sports_account` (`EntityAttributesId`),
  CONSTRAINT `cns_corporate_referring_account_enrolment` FOREIGN KEY (`EnrolmentId`) REFERENCES `sports_enrolment` (`EnrolmentId`),
  CONSTRAINT `cns_corporate_referring_account_student` FOREIGN KEY (`StudentId`) REFERENCES `sports_student` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_course`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_course` (
  `EntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ClassDurationInMinutes` int NOT NULL DEFAULT '0',
  `NumberOfStudentsPerInstructor` int NOT NULL DEFAULT '0',
  `NumberOfCorporateStudentsPerInstructor` int DEFAULT NULL,
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ProgramLevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TermId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `BookingTypeEnum` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PreviousTermCourseEAId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NextTermCourseEAId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `InstructorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PricingPeriodEnum` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CourseType` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LevelLocked` tinyint(1) DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EntityAttributesId`),
  KEY `FK44E78DBA2967CBB` (`ProgramLevelId`),
  KEY `FK44E78DB77F62BCA` (`VenueId`),
  KEY `fk_course_term` (`TermId`),
  KEY `fk_course_entity` (`EntityId`),
  KEY `cns_sports_course_licensee` (`LicenseeId`),
  KEY `cns_previous_term_course` (`PreviousTermCourseEAId`),
  KEY `cns_next_term_course` (`NextTermCourseEAId`),
  CONSTRAINT `cns_course_entity` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `cns_course_term` FOREIGN KEY (`TermId`) REFERENCES `sports_term` (`TermId`),
  CONSTRAINT `cns_next_term_course` FOREIGN KEY (`NextTermCourseEAId`) REFERENCES `sports_course` (`EntityAttributesId`),
  CONSTRAINT `cns_previous_term_course` FOREIGN KEY (`PreviousTermCourseEAId`) REFERENCES `sports_course` (`EntityAttributesId`),
  CONSTRAINT `cns_sports_course_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`),
  CONSTRAINT `FK44E78DB77F62BCA` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`),
  CONSTRAINT `FK44E78DBA2967CBB` FOREIGN KEY (`ProgramLevelId`) REFERENCES `sports_program_level` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_course_change_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_course_change_log` (
  `CourseChangeLogId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CourseId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Log` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `CourseChangeLogSectionId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsPersonId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SystemId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CourseChangeLogId`),
  KEY `sports_course_change_log_fk` (`CourseId`),
  KEY `sports_course_change_log_fk2` (`SystemId`),
  KEY `sports_course_change_log_section` (`CourseChangeLogSectionId`),
  CONSTRAINT `sports_course_change_log_fk` FOREIGN KEY (`CourseId`) REFERENCES `sports_course` (`EntityAttributesId`),
  CONSTRAINT `sports_course_change_log_fk2` FOREIGN KEY (`SystemId`) REFERENCES `sports_system` (`SystemId`),
  CONSTRAINT `sports_course_change_log_section` FOREIGN KEY (`CourseChangeLogSectionId`) REFERENCES `sports_course_change_log_section` (`CourseChangeLogSectionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_course_change_log_section`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_course_change_log_section` (
  `CourseChangeLogSectionId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CourseChangeLogSectionId`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_course_referral`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_course_referral` (
  `CourseReferralId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `ReferralEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Type` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `ProgramLevelId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CourseReferralId`),
  UNIQUE KEY `sports_course_referral_code` (`Code`),
  KEY `sports_course_referral_entity` (`ReferralEntityId`),
  KEY `sports_course_referral_licensee` (`LicenseeId`),
  KEY `sports_course_referral_level` (`ProgramLevelId`),
  CONSTRAINT `sports_course_referral_entity` FOREIGN KEY (`ReferralEntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `sports_course_referral_level` FOREIGN KEY (`ProgramLevelId`) REFERENCES `sports_program_level` (`EntityAttributesId`),
  CONSTRAINT `sports_course_referral_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_course_referral_course`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_course_referral_course` (
  `CourseReferralId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CourseId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CourseReferralId`,`CourseId`),
  KEY `sports_course_referral_course_course` (`CourseId`),
  CONSTRAINT `sports_course_referral_course_course` FOREIGN KEY (`CourseId`) REFERENCES `sports_course` (`EntityAttributesId`),
  CONSTRAINT `sports_course_referral_course_referral` FOREIGN KEY (`CourseReferralId`) REFERENCES `sports_course_referral` (`CourseReferralId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_course_referral_enrolment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_course_referral_enrolment` (
  `CourseReferralId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `EnrolmentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CourseReferralId`,`EnrolmentId`),
  KEY `sports_course_referral_enrolment_enrolment` (`EnrolmentId`),
  CONSTRAINT `sports_course_referral_enrolment_enrolment` FOREIGN KEY (`EnrolmentId`) REFERENCES `sports_enrolment` (`EnrolmentId`),
  CONSTRAINT `sports_course_referral_enrolment_referral` FOREIGN KEY (`CourseReferralId`) REFERENCES `sports_course_referral` (`CourseReferralId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_course_search_history`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_course_search_history` (
  `CourseSearchHistoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SessionId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LoggedInEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DateReceived` datetime NOT NULL,
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProgramLevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TermId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MondaySelected` tinyint(1) NOT NULL,
  `TuesdaySelected` tinyint(1) NOT NULL,
  `WednesdaySelected` tinyint(1) NOT NULL,
  `ThursdaySelected` tinyint(1) NOT NULL,
  `FridaySelected` tinyint(1) NOT NULL,
  `SaturdaySelected` tinyint(1) NOT NULL,
  `SundaySelected` tinyint(1) NOT NULL,
  `ClassDurationInMinutes` int NOT NULL,
  `NumberOfStudentsPerInstructor` int NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CourseSearchHistoryId`),
  KEY `sports_course_search_history_venue` (`VenueId`),
  KEY `sports_course_search_history_program_level` (`ProgramLevelId`),
  KEY `sports_course_search_history_term` (`TermId`),
  KEY `sports_course_search_history_person` (`LoggedInEntityId`),
  CONSTRAINT `sports_course_search_history_person` FOREIGN KEY (`LoggedInEntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `sports_course_search_history_program_level` FOREIGN KEY (`ProgramLevelId`) REFERENCES `sports_program_level` (`EntityAttributesId`),
  CONSTRAINT `sports_course_search_history_term` FOREIGN KEY (`TermId`) REFERENCES `sports_term` (`TermId`),
  CONSTRAINT `sports_course_search_history_venue` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_credit`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_credit` (
  `SportsCreditId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `SportsCreditTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `TermId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `InvoiceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `EnrolmentGroupId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NumberOfClasses` int DEFAULT NULL,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BookingInvoiceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BookableEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BookingId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SportsCreditBookingId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CanConvertToFinacialCredit` tinyint(1) DEFAULT NULL,
  `DateConvertedToFinanceCredit` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `ExpiryDate` datetime DEFAULT NULL,
  PRIMARY KEY (`SportsCreditId`),
  KEY `fk_sports_credit_type` (`SportsCreditTypeId`),
  KEY `fk_sports_credit_term` (`TermId`),
  KEY `fk_sports_credit_invoice` (`InvoiceId`),
  KEY `fk_credit_enrolment_group` (`EnrolmentGroupId`),
  KEY `cns_credit_bookable` (`BookableEntityId`),
  KEY `sports_credit_credit_booking` (`SportsCreditBookingId`),
  CONSTRAINT `cns_credit_bookable` FOREIGN KEY (`BookableEntityId`) REFERENCES `sports_bookable_entity` (`BookableEntityId`),
  CONSTRAINT `cns_credit_enrolment_group` FOREIGN KEY (`EnrolmentGroupId`) REFERENCES `sports_enrolment_group` (`EnrolmentGroupId`),
  CONSTRAINT `fk_sports_credit_invoice` FOREIGN KEY (`InvoiceId`) REFERENCES `finance_line_item` (`LineItemId`),
  CONSTRAINT `fk_sports_credit_term` FOREIGN KEY (`TermId`) REFERENCES `schedule` (`ScheduleId`),
  CONSTRAINT `fk_sports_credit_type` FOREIGN KEY (`SportsCreditTypeId`) REFERENCES `sports_credit_type` (`SportsCreditTypeId`),
  CONSTRAINT `sports_credit_credit_booking` FOREIGN KEY (`SportsCreditBookingId`) REFERENCES `sports_booking` (`BookingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_credit_pack`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_credit_pack` (
  `SportsCreditPackId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NumberOfLessons` int NOT NULL,
  `NumberOfStudentsPerInstructor` int NOT NULL,
  `ClassDurationInMinutes` int NOT NULL,
  `ReminderRemainingLessons` int DEFAULT NULL,
  `NoticePeriodMinutes` int DEFAULT NULL,
  `Status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `ExpiryMonths` int NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SendLastLessonEmail` tinyint(1) DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`SportsCreditPackId`),
  KEY `sports_credit_pack_licensee` (`LicenseeId`),
  CONSTRAINT `sports_credit_pack_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_credit_pack_program`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_credit_pack_program` (
  `SportsCreditPackId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SportsCreditPackId`,`ProgramId`),
  KEY `sports_credit_pack_program_program` (`ProgramId`),
  CONSTRAINT `sports_credit_pack_program_credit_pack` FOREIGN KEY (`SportsCreditPackId`) REFERENCES `sports_credit_pack` (`SportsCreditPackId`),
  CONSTRAINT `sports_credit_pack_program_program` FOREIGN KEY (`ProgramId`) REFERENCES `sports_program` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_credit_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_credit_type` (
  `SportsCreditTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`SportsCreditTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_depth`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_depth` (
  `DepthId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `DeepEndDepth` float DEFAULT NULL,
  `FixedDepth` tinyint(1) DEFAULT NULL,
  `ShallowEndDepth` float DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`DepthId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_direct_debit_request`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_direct_debit_request` (
  `DirectDebitMandateRequestId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsAccountId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsPersonId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SystemId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RedirectId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LicenseeId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`DirectDebitMandateRequestId`),
  KEY `sports_direct_debit_request_sports_account_EntityAttributesId_fk` (`SportsAccountId`),
  KEY `sports_direct_debit_request_sports_person_EntityAttributesId_fk` (`SportsPersonId`),
  KEY `sports_direct_debit_request_sports_system_SystemId_fk` (`SystemId`),
  KEY `sports_direct_debit_request_sports_licensee_LicenseeId_fk` (`LicenseeId`),
  CONSTRAINT `sports_direct_debit_request_sports_account_EntityAttributesId_fk` FOREIGN KEY (`SportsAccountId`) REFERENCES `sports_account` (`EntityAttributesId`),
  CONSTRAINT `sports_direct_debit_request_sports_licensee_LicenseeId_fk` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`),
  CONSTRAINT `sports_direct_debit_request_sports_person_EntityAttributesId_fk` FOREIGN KEY (`SportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`),
  CONSTRAINT `sports_direct_debit_request_sports_system_SystemId_fk` FOREIGN KEY (`SystemId`) REFERENCES `sports_system` (`SystemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_email_properties`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_email_properties` (
  `EmailPropertiesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Protocol` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Host` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `User` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Port` int DEFAULT NULL,
  `UseSSL` tinyint(1) DEFAULT NULL,
  `Folder` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EmailPropertiesId`),
  KEY `sports_email_properties_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_email_properties_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_email_sending_domain`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_email_sending_domain` (
  `EmailSendingDomainId` varbinary(32) NOT NULL,
  `Domain` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EmailSendingDomainId`),
  UNIQUE KEY `sports_email_sending_domain_domain` (`Domain`),
  KEY `sports_master_licensee_email_sending_domain_ml` (`MasterLicenseeId`),
  CONSTRAINT `sports_master_licensee_email_sending_domain_ml` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_email_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_email_template` (
  `EmailTemplateId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailTemplateTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `EmailAddress` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailFrom` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SMSFrom` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Template` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Filename` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `InstructorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CustomTemplateName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EmailTemplateId`) USING BTREE,
  KEY `cns_email_template_venue` (`VenueId`) USING BTREE,
  KEY `cns_email_template_template_type` (`EmailTemplateTypeId`) USING BTREE,
  KEY `cns_email_template_licensee` (`LicenseeId`) USING BTREE,
  KEY `cns_email_template_master_licensee` (`MasterLicenseeId`),
  KEY `sports_email_template_program` (`ProgramId`),
  KEY `sports_email_template_instructor` (`InstructorId`),
  CONSTRAINT `cns_email_template_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`),
  CONSTRAINT `cns_email_template_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `cns_email_template_template_type` FOREIGN KEY (`EmailTemplateTypeId`) REFERENCES `sports_email_template_type` (`EmailTemplateTypeId`),
  CONSTRAINT `cns_email_template_venue` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`),
  CONSTRAINT `sports_email_template_instructor` FOREIGN KEY (`InstructorId`) REFERENCES `sports_instructor` (`EntityAttributesId`),
  CONSTRAINT `sports_email_template_program` FOREIGN KEY (`ProgramId`) REFERENCES `sports_program` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_email_template_default`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_email_template_default` (
  `DefaultEmailTemplateId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailTemplateTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `EmailAddress` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailFrom` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Template` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`DefaultEmailTemplateId`),
  KEY `cns_default_email_template_template_type` (`EmailTemplateTypeId`),
  KEY `cns_default_email_template_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `cns_default_email_template_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `cns_default_email_template_template_type` FOREIGN KEY (`EmailTemplateTypeId`) REFERENCES `sports_email_template_type` (`EmailTemplateTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_email_template_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_email_template_type` (
  `EmailTemplateTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SearchType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MediaType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EmailTemplateTypeId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_employment_period`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_employment_period` (
  `EmploymentPeriodId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `StartDate` datetime NOT NULL,
  `TerminationDate` datetime DEFAULT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EmploymentPeriodId`),
  KEY `sports_employment_period_sp` (`SportsPersonId`),
  KEY `sports_employment_period_l` (`LicenseeId`),
  KEY `rfk3` (`Role`),
  CONSTRAINT `rfk3` FOREIGN KEY (`Role`) REFERENCES `role` (`name`),
  CONSTRAINT `sports_employment_period_l` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`),
  CONSTRAINT `sports_employment_period_sp` FOREIGN KEY (`SportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_enquiry`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_enquiry` (
  `EnquiryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailAddress` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TelephoneNumber` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Query` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ExistingClient` tinyint(1) DEFAULT NULL,
  `EnquiryTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsAccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TicketId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DateReceived` datetime NOT NULL,
  `IPAddress` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `ProspectCreated` tinyint(1) DEFAULT NULL,
  `Subject` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `SystemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailPropertiesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TrackingId` varchar(132) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AcceptedPrivacyPolicy` tinyint(1) DEFAULT '0',
  `PolicyId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TicketTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LinkedTicketId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `CreatedBySportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CampaignId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`EnquiryId`),
  KEY `sports_enquiry_enquiry_type` (`EnquiryTypeId`),
  KEY `sports_enquiry_account` (`SportsAccountId`),
  KEY `sports_enquiry_ticket` (`TicketId`),
  KEY `sports_enquiry_system` (`SystemId`),
  KEY `sports_enquiry_policy` (`PolicyId`),
  KEY `sports_enquiry_ticket_type` (`TicketTypeId`),
  KEY `sports_enquiry_lt` (`LinkedTicketId`),
  KEY `sports_enquiry_sp` (`CreatedBySportsPersonId`),
  KEY `sports_enquiry_campaign` (`CampaignId`),
  CONSTRAINT `sports_enquiry_account` FOREIGN KEY (`SportsAccountId`) REFERENCES `sports_account` (`EntityAttributesId`),
  CONSTRAINT `sports_enquiry_campaign` FOREIGN KEY (`CampaignId`) REFERENCES `sports_campaign` (`CampaignId`),
  CONSTRAINT `sports_enquiry_enquiry_type` FOREIGN KEY (`EnquiryTypeId`) REFERENCES `sports_enquiry_type` (`EnquiryTypeId`),
  CONSTRAINT `sports_enquiry_lt` FOREIGN KEY (`LinkedTicketId`) REFERENCES `sports_ticket` (`TicketId`),
  CONSTRAINT `sports_enquiry_policy` FOREIGN KEY (`PolicyId`) REFERENCES `sports_policy` (`PolicyId`),
  CONSTRAINT `sports_enquiry_sp` FOREIGN KEY (`CreatedBySportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`),
  CONSTRAINT `sports_enquiry_system` FOREIGN KEY (`SystemId`) REFERENCES `sports_system` (`SystemId`),
  CONSTRAINT `sports_enquiry_ticket` FOREIGN KEY (`TicketId`) REFERENCES `sports_ticket` (`TicketId`),
  CONSTRAINT `sports_enquiry_ticket_type` FOREIGN KEY (`TicketTypeId`) REFERENCES `sports_ticket_type` (`TicketTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_enquiry_program`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_enquiry_program` (
  `EnquiryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`EnquiryId`,`ProgramId`),
  KEY `sports_enquiry_program_program` (`ProgramId`),
  CONSTRAINT `sports_enquiry_program_enquiry` FOREIGN KEY (`EnquiryId`) REFERENCES `sports_enquiry` (`EnquiryId`),
  CONSTRAINT `sports_enquiry_program_program` FOREIGN KEY (`ProgramId`) REFERENCES `sports_program` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_enquiry_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_enquiry_type` (
  `EnquiryTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EnquiryTypeId`),
  KEY `sports_enquiry_type_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_enquiry_type_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_enquiry_url`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_enquiry_url` (
  `EnquiryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `UrlId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`EnquiryId`,`UrlId`),
  KEY `sports_enquiry_url` (`UrlId`),
  KEY `sports_enquiry_url_enquiry` (`EnquiryId`),
  CONSTRAINT `sports_enquiry_url` FOREIGN KEY (`UrlId`) REFERENCES `url` (`UrlId`),
  CONSTRAINT `sports_enquiry_url_enquiry` FOREIGN KEY (`EnquiryId`) REFERENCES `sports_enquiry` (`EnquiryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_enquiry_venue`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_enquiry_venue` (
  `EnquiryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`EnquiryId`,`VenueId`),
  KEY `sports_enquiry_venue_venue` (`VenueId`),
  CONSTRAINT `sports_enquiry_venue_enquiry` FOREIGN KEY (`EnquiryId`) REFERENCES `sports_enquiry` (`EnquiryId`),
  CONSTRAINT `sports_enquiry_venue_venue` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_enrolment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_enrolment` (
  `EnrolmentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CourseId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `InvoiceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BookableEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `EnrolmentGroupId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SportsAccountEAId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AcceptedTermsAndConditionsEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SystemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProvisionalExpiry` datetime DEFAULT NULL,
  `ConfirmDate` datetime DEFAULT NULL,
  `AutoRenewal` tinyint(1) DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EnrolmentId`),
  KEY `FK445B12241D90896` (`BookableEntityId`),
  KEY `FK445B1224FC45508` (`InvoiceId`),
  KEY `FK445B1224EDE5B2B6` (`CourseId`),
  KEY `fk_enrol_enrolment_group` (`EnrolmentGroupId`),
  KEY `BookableEntityId` (`BookableEntityId`),
  KEY `Status` (`Status`),
  KEY `cns_enrol_account` (`SportsAccountEAId`),
  KEY `cns_enrolment_terms_cond_entity` (`AcceptedTermsAndConditionsEntityId`),
  KEY `sports_enrolment_system` (`SystemId`),
  CONSTRAINT `cns_bookable_entity` FOREIGN KEY (`BookableEntityId`) REFERENCES `sports_bookable_entity` (`BookableEntityId`),
  CONSTRAINT `cns_enrol_account` FOREIGN KEY (`SportsAccountEAId`) REFERENCES `sports_account` (`EntityAttributesId`),
  CONSTRAINT `cns_enrol_enrolment_group` FOREIGN KEY (`EnrolmentGroupId`) REFERENCES `sports_enrolment_group` (`EnrolmentGroupId`),
  CONSTRAINT `cns_enrolment_terms_cond_entity` FOREIGN KEY (`AcceptedTermsAndConditionsEntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `FK445B1224EDE5B2B6` FOREIGN KEY (`CourseId`) REFERENCES `sports_course` (`EntityAttributesId`),
  CONSTRAINT `FK445B1224FC45508` FOREIGN KEY (`InvoiceId`) REFERENCES `finance_line_item` (`LineItemId`),
  CONSTRAINT `sports_enrolment_system` FOREIGN KEY (`SystemId`) REFERENCES `sports_system` (`SystemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_enrolment_group`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_enrolment_group` (
  `EnrolmentGroupId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EnrolmentGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_enrolment_profile`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_enrolment_profile` (
  `EnrolmentProfileId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExpiryDays` int DEFAULT NULL,
  `ExpiryAction` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ApplyAccountBalance` tinyint(1) DEFAULT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ReportingEmailAddress` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `IsDefaultDirectDebitProfile` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`EnrolmentProfileId`),
  KEY `sports_recurring_billing_config_licensee` (`LicenseeId`),
  CONSTRAINT `sports_recurring_billing_config_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_enrolment_profile_schedule`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_enrolment_profile_schedule` (
  `SportsEnrolmentProfileScheduleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DayNumber` int NOT NULL,
  `Time` datetime NOT NULL,
  `EmailTemplateId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `EnrolmentProfileId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`SportsEnrolmentProfileScheduleId`),
  KEY `sports_recurring_billing_schedule_email_template` (`EmailTemplateId`),
  KEY `sports_recurring_billing_schedule_config` (`EnrolmentProfileId`),
  CONSTRAINT `sports_recurring_billing_schedule_config` FOREIGN KEY (`EnrolmentProfileId`) REFERENCES `sports_enrolment_profile` (`EnrolmentProfileId`),
  CONSTRAINT `sports_recurring_billing_schedule_email_template` FOREIGN KEY (`EmailTemplateId`) REFERENCES `sports_email_template` (`EmailTemplateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_enrolment_renewal`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_enrolment_renewal` (
  `EnrolmentRenewalId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `RenewalConfigurationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `EnrolmentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `EnrolmentProfileId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AutoEnrolmentTransactionDate` datetime DEFAULT NULL,
  `AutoPaymentStatus` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ErrorMessage` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EnrolmentRenewalId`),
  KEY `sportsenrolmentrenewal_renewalconfig` (`RenewalConfigurationId`),
  KEY `sportsenrolmentrenewal_profile` (`EnrolmentProfileId`),
  KEY `sportsenrolmentrenewal_enrolment` (`EnrolmentId`),
  CONSTRAINT `sportsenrolmentrenewal_enrolment` FOREIGN KEY (`EnrolmentId`) REFERENCES `sports_enrolment` (`EnrolmentId`),
  CONSTRAINT `sportsenrolmentrenewal_profile` FOREIGN KEY (`EnrolmentProfileId`) REFERENCES `sports_enrolment_profile` (`EnrolmentProfileId`),
  CONSTRAINT `sportsenrolmentrenewal_renewalconfig` FOREIGN KEY (`RenewalConfigurationId`) REFERENCES `sports_renewal_configuration` (`RenewalConfigurationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_enrolment_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_enrolment_type` (
  `EnrolmentTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EnrolmentTypeId`),
  UNIQUE KEY `sports_enrolment_type_ix1` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_enrolment_type_master_licensee`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_enrolment_type_master_licensee` (
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `EnrolmentTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LinkStatus` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`MasterLicenseeId`,`EnrolmentTypeId`),
  KEY `sports_enrolment_type_master_licensee_pt` (`EnrolmentTypeId`),
  CONSTRAINT `sports_enrolment_type_master_licensee_ml` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_enrolment_type_master_licensee_pt` FOREIGN KEY (`EnrolmentTypeId`) REFERENCES `sports_enrolment_type` (`EnrolmentTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_enrolment_type_venue_exclusion`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_enrolment_type_venue_exclusion` (
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `EnrolmentTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`VenueId`,`EnrolmentTypeId`),
  KEY `sports_enrolment_type_venue_exclusion_pt` (`EnrolmentTypeId`),
  CONSTRAINT `sports_enrolment_type_venue_exclusion_pt` FOREIGN KEY (`EnrolmentTypeId`) REFERENCES `sports_enrolment_type` (`EnrolmentTypeId`),
  CONSTRAINT `sports_enrolment_type_venue_exclusion_v` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_feedback`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_feedback` (
  `FeedbackId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FeedbackCampaignId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SportsAccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`FeedbackId`) USING BTREE,
  KEY `cns_feedback_account` (`SportsAccountId`),
  KEY `cns_feedback_feedback_campaign` (`FeedbackCampaignId`),
  CONSTRAINT `cns_feedback_account` FOREIGN KEY (`SportsAccountId`) REFERENCES `sports_account` (`EntityAttributesId`),
  CONSTRAINT `cns_feedback_feedback_campaign` FOREIGN KEY (`FeedbackCampaignId`) REFERENCES `sports_feedback_campaign` (`FeedbackCampaignId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_feedback_campaign`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_feedback_campaign` (
  `FeedbackCampaignId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Public` tinyint(1) NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`FeedbackCampaignId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_feedback_campaign_licensee`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_feedback_campaign_licensee` (
  `FeedbackCampaignId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`FeedbackCampaignId`,`LicenseeId`),
  KEY `cns_sports_feedback_campaign_licensee_l` (`LicenseeId`),
  CONSTRAINT `cns_sports_feedback_campaign_licensee_c` FOREIGN KEY (`FeedbackCampaignId`) REFERENCES `sports_feedback_campaign` (`FeedbackCampaignId`),
  CONSTRAINT `cns_sports_feedback_campaign_licensee_l` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_feedback_parameter`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_feedback_parameter` (
  `FeedbackParameterId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FeedbackCampaignId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`FeedbackParameterId`) USING BTREE,
  KEY `cns_feedback_parameter_feedback` (`FeedbackCampaignId`) USING BTREE,
  CONSTRAINT `cns_feedback_parameter_feedback` FOREIGN KEY (`FeedbackCampaignId`) REFERENCES `sports_feedback_campaign` (`FeedbackCampaignId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_feedback_value`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_feedback_value` (
  `FeedbackValueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FeedbackId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FeedbackParameterId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`FeedbackValueId`) USING BTREE,
  KEY `cns_feedback_parameter_parameter` (`FeedbackParameterId`) USING BTREE,
  KEY `cns_feedback_value_feedback` (`FeedbackId`),
  CONSTRAINT `cns_feedback_parameter_parameter` FOREIGN KEY (`FeedbackParameterId`) REFERENCES `sports_feedback_parameter` (`FeedbackParameterId`),
  CONSTRAINT `cns_feedback_value_feedback` FOREIGN KEY (`FeedbackId`) REFERENCES `sports_feedback` (`FeedbackId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_instructor`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_instructor` (
  `EntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Notes` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IsTBCInstructor` tinyint(1) DEFAULT NULL,
  `TbcName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TbcExpiryDate` datetime DEFAULT NULL,
  `EmploymentDate` datetime DEFAULT NULL,
  `TerminationDate` datetime DEFAULT NULL,
  `LineManagerVenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Profile` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IsSelfEmployed` tinyint(1) NOT NULL DEFAULT '0',
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EntityAttributesId`),
  UNIQUE KEY `sports_instructor_nickname` (`Nickname`),
  KEY `fk_instructor_entity` (`EntityId`),
  CONSTRAINT `cns_instructor_entity` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_instructor_absence`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_instructor_absence` (
  `InstructorAbsenceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DateNotified` datetime NOT NULL,
  `InstructorAbsenceReasonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReasonOther` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Authorised` tinyint(1) NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `InstructorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AuthorisedBySportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`InstructorAbsenceId`),
  KEY `sports_instructor_absence_reason` (`InstructorAbsenceReasonId`),
  KEY `sports_instructor_absence_instructor` (`InstructorId`),
  KEY `sports_instructor_absence_sports_person` (`AuthorisedBySportsPersonId`),
  CONSTRAINT `sports_instructor_absence_instructor` FOREIGN KEY (`InstructorId`) REFERENCES `sports_instructor` (`EntityAttributesId`),
  CONSTRAINT `sports_instructor_absence_reason` FOREIGN KEY (`InstructorAbsenceReasonId`) REFERENCES `sports_instructor_absence_reason` (`InstructorAbsenceReasonId`),
  CONSTRAINT `sports_instructor_absence_sports_person` FOREIGN KEY (`AuthorisedBySportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_instructor_absence_class`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_instructor_absence_class` (
  `InstructorAbsenceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ClassId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`InstructorAbsenceId`,`ClassId`),
  KEY `sports_instructor_absence_class_class` (`ClassId`),
  CONSTRAINT `sports_instructor_absence_class_class` FOREIGN KEY (`ClassId`) REFERENCES `sports_class` (`EntityAttributesId`),
  CONSTRAINT `sports_instructor_absence_course_absence` FOREIGN KEY (`InstructorAbsenceId`) REFERENCES `sports_instructor_absence` (`InstructorAbsenceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_instructor_absence_reason`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_instructor_absence_reason` (
  `InstructorAbsenceReasonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`InstructorAbsenceReasonId`),
  KEY `sports_instructor_absence_reason_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_instructor_absence_reason_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_instructor_accreditation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_instructor_accreditation` (
  `InstructorAccreditationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `InstructorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ScheduleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`InstructorAccreditationId`),
  KEY `cns_accreditation_instructor_instructor` (`InstructorId`),
  KEY `cns_accreditation_instructor_program` (`ProgramId`),
  KEY `cns_accreditation_instructor_schedule` (`ScheduleId`),
  CONSTRAINT `cns_accreditation_instructor_instructor` FOREIGN KEY (`InstructorId`) REFERENCES `sports_instructor` (`EntityAttributesId`),
  CONSTRAINT `cns_accreditation_instructor_program` FOREIGN KEY (`ProgramId`) REFERENCES `sports_program` (`EntityAttributesId`),
  CONSTRAINT `cns_accreditation_instructor_schedule` FOREIGN KEY (`ScheduleId`) REFERENCES `schedule` (`ScheduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_instructor_change_of_shift`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_instructor_change_of_shift` (
  `InstructorChangeOfShiftId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DateNotified` datetime NOT NULL,
  `InstructorChangeOfShiftReasonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReasonOther` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StartDate` datetime NOT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `InstructorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`InstructorChangeOfShiftId`),
  KEY `sports_instructor_cos_reason` (`InstructorChangeOfShiftReasonId`),
  KEY `sports_instructor_cos_instructor` (`InstructorId`),
  CONSTRAINT `sports_instructor_cos_instructor` FOREIGN KEY (`InstructorId`) REFERENCES `sports_instructor` (`EntityAttributesId`),
  CONSTRAINT `sports_instructor_cos_reason` FOREIGN KEY (`InstructorChangeOfShiftReasonId`) REFERENCES `sports_instructor_change_of_shift_reason` (`InstructorChangeOfShiftReasonId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_instructor_change_of_shift_course`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_instructor_change_of_shift_course` (
  `InstructorChangeOfShiftId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CourseId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`InstructorChangeOfShiftId`,`CourseId`),
  KEY `sports_instructor_cos_course_course` (`CourseId`),
  CONSTRAINT `sports_instructor_cos_course_absence` FOREIGN KEY (`InstructorChangeOfShiftId`) REFERENCES `sports_instructor_change_of_shift` (`InstructorChangeOfShiftId`),
  CONSTRAINT `sports_instructor_cos_course_course` FOREIGN KEY (`CourseId`) REFERENCES `sports_course` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_instructor_change_of_shift_reason`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_instructor_change_of_shift_reason` (
  `InstructorChangeOfShiftReasonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`InstructorChangeOfShiftReasonId`),
  KEY `sports_instructor_cos_reason_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_instructor_cos_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_instructor_compliance_profile`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_instructor_compliance_profile` (
  `InstructorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ComplianceProfileId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`InstructorId`,`ComplianceProfileId`),
  KEY `sports_instructor_compliance_profile_cp` (`ComplianceProfileId`),
  CONSTRAINT `sports_instructor_compliance_profile_cp` FOREIGN KEY (`ComplianceProfileId`) REFERENCES `sports_training_compliance_profile` (`ComplianceProfileId`),
  CONSTRAINT `sports_instructor_compliance_profile_i` FOREIGN KEY (`InstructorId`) REFERENCES `sports_instructor` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_instructor_pay_adjustment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_instructor_pay_adjustment` (
  `RevenueBandAdjustmentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `InstructorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Value` double NOT NULL,
  `AdjustmentDate` datetime NOT NULL,
  `Reason` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`RevenueBandAdjustmentId`),
  KEY `revenue_band_adjustment_instructor` (`InstructorId`),
  KEY `sports_instructor_pay_adjustment_venue` (`VenueId`),
  CONSTRAINT `revenue_band_adjustment_instructor` FOREIGN KEY (`InstructorId`) REFERENCES `sports_instructor` (`EntityAttributesId`),
  CONSTRAINT `sports_instructor_pay_adjustment_venue` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_instructor_pay_rate`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_instructor_pay_rate` (
  `InstructorPayRateId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DateFrom` datetime NOT NULL,
  `DateTo` datetime DEFAULT NULL,
  `RatePerHour` double NOT NULL,
  `InstructorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`InstructorPayRateId`),
  KEY `sports_instructor_pay_rate_instructor` (`InstructorId`),
  KEY `sports_instructor_pay_rate_program` (`ProgramId`),
  CONSTRAINT `sports_instructor_pay_rate_instructor` FOREIGN KEY (`InstructorId`) REFERENCES `sports_instructor` (`EntityAttributesId`),
  CONSTRAINT `sports_instructor_pay_rate_program` FOREIGN KEY (`ProgramId`) REFERENCES `sports_program` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_instructor_pay_rate_venue`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_instructor_pay_rate_venue` (
  `InstructorPayRateId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`InstructorPayRateId`,`VenueId`),
  KEY `sports_instructor_pay_rate_venue_venue` (`VenueId`),
  CONSTRAINT `sports_instructor_pay_rate_venue_pay_rate` FOREIGN KEY (`InstructorPayRateId`) REFERENCES `sports_instructor_pay_rate` (`InstructorPayRateId`),
  CONSTRAINT `sports_instructor_pay_rate_venue_venue` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_instructor_survey`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_instructor_survey` (
  `InstructorSurveyId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `BookingId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsAccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `InstructorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FeedbackCampaignId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FeedbackId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DateSent` datetime NOT NULL,
  `EmailAddress` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Verified` tinyint(1) NOT NULL,
  `VisibleToInstructor` tinyint(1) NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Processed` tinyint(1) NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`InstructorSurveyId`),
  KEY `sports_instructor_feedback_booking` (`BookingId`),
  KEY `sports_instructor_feedback_account` (`SportsAccountId`),
  KEY `sports_instructor_feedback_instructor` (`InstructorId`),
  KEY `sports_instructor_feedback_campaign` (`FeedbackCampaignId`),
  KEY `sports_instructor_feedback_feedback` (`FeedbackId`),
  CONSTRAINT `sports_instructor_feedback_account` FOREIGN KEY (`SportsAccountId`) REFERENCES `sports_account` (`EntityAttributesId`),
  CONSTRAINT `sports_instructor_feedback_booking` FOREIGN KEY (`BookingId`) REFERENCES `sports_booking` (`BookingId`),
  CONSTRAINT `sports_instructor_feedback_campaign` FOREIGN KEY (`FeedbackCampaignId`) REFERENCES `sports_feedback_campaign` (`FeedbackCampaignId`),
  CONSTRAINT `sports_instructor_feedback_feedback` FOREIGN KEY (`FeedbackId`) REFERENCES `sports_feedback` (`FeedbackId`),
  CONSTRAINT `sports_instructor_feedback_instructor` FOREIGN KEY (`InstructorId`) REFERENCES `sports_instructor` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_join_corporate_account_referral_account`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_join_corporate_account_referral_account` (
  `SportsAccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ReferringSportsAccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SportsAccountId`,`ReferringSportsAccountId`) USING BTREE,
  KEY `FKSportsCorporateAccountId` (`SportsAccountId`) USING BTREE,
  KEY `FKSportsReferringAccountId` (`ReferringSportsAccountId`) USING BTREE,
  CONSTRAINT `sports_join_corporate_account_referral_account_fk1` FOREIGN KEY (`SportsAccountId`) REFERENCES `sports_account` (`EntityAttributesId`),
  CONSTRAINT `sports_join_corporate_account_referral_account_fk2` FOREIGN KEY (`ReferringSportsAccountId`) REFERENCES `sports_account` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_join_course_instructor`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_join_course_instructor` (
  `InstructorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CourseId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`CourseId`,`InstructorId`),
  KEY `FK1EA2A02C36F2BAB8` (`InstructorId`),
  KEY `FK1EA2A02CEDE5B2B6` (`CourseId`),
  CONSTRAINT `FK1EA2A02C36F2BAB8` FOREIGN KEY (`InstructorId`) REFERENCES `sports_instructor` (`EntityAttributesId`),
  CONSTRAINT `FK1EA2A02CEDE5B2B6` FOREIGN KEY (`CourseId`) REFERENCES `sports_course` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_join_course_lane_segment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_join_course_lane_segment` (
  `LaneSegmentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CourseId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`CourseId`,`LaneSegmentId`),
  KEY `FKF5B013AFEDE5B2B6` (`CourseId`),
  KEY `FKF5B013AF2ADFCF02` (`LaneSegmentId`),
  CONSTRAINT `FKF5B013AF2ADFCF02` FOREIGN KEY (`LaneSegmentId`) REFERENCES `sports_lane_segment` (`EntityAttributesId`),
  CONSTRAINT `FKF5B013AFEDE5B2B6` FOREIGN KEY (`CourseId`) REFERENCES `sports_course` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_join_course_program`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_join_course_program` (
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CourseId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CourseId`,`ProgramId`),
  KEY `FKSportsProgramCourseId` (`CourseId`),
  KEY `FKSportsProgramProgramId` (`ProgramId`),
  CONSTRAINT `sports_join_course_program_course` FOREIGN KEY (`CourseId`) REFERENCES `sports_course` (`EntityAttributesId`),
  CONSTRAINT `sports_join_course_program_program` FOREIGN KEY (`ProgramId`) REFERENCES `sports_program` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_join_cpd_category`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_join_cpd_category` (
  `CPDId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CPDCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CPDId`,`CPDCategoryId`) USING BTREE,
  KEY `cns_cpd_category` (`CPDCategoryId`) USING BTREE,
  CONSTRAINT `cns_cpd` FOREIGN KEY (`CPDId`) REFERENCES `sports_training_cpd` (`CPDId`),
  CONSTRAINT `cns_cpd_category` FOREIGN KEY (`CPDCategoryId`) REFERENCES `sports_training_cpd_category` (`CPDCategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_join_enrolment_group_billing_service`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_join_enrolment_group_billing_service` (
  `EnrolmentGroupId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `BillingServiceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`EnrolmentGroupId`,`BillingServiceId`),
  KEY `enrolment_group_billing_service_enrolment_group` (`EnrolmentGroupId`),
  KEY `enrolment_group_billing_service_billing_service` (`BillingServiceId`),
  CONSTRAINT `enrolment_group_billing_service_billing_service` FOREIGN KEY (`BillingServiceId`) REFERENCES `finance_billing_service` (`BillingServiceId`),
  CONSTRAINT `enrolment_group_billing_service_enrolment_group` FOREIGN KEY (`EnrolmentGroupId`) REFERENCES `sports_enrolment_group` (`EnrolmentGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_join_enrolment_student`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_join_enrolment_student` (
  `EnrolmentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsStudentEAId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EnrolmentId`,`SportsStudentEAId`),
  KEY `cns_enrol_student` (`SportsStudentEAId`),
  CONSTRAINT `cns_enrol_student` FOREIGN KEY (`SportsStudentEAId`) REFERENCES `sports_student` (`EntityAttributesId`),
  CONSTRAINT `cns_student_enrol` FOREIGN KEY (`EnrolmentId`) REFERENCES `sports_enrolment` (`EnrolmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_join_master_licensee_enquiry_exclusions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_join_master_licensee_enquiry_exclusions` (
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ScheduleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`MasterLicenseeId`,`ScheduleId`),
  KEY `cns_master_licensee_enquiry_exclusions_ml` (`MasterLicenseeId`),
  KEY `cns_master_licensee_enquiry_exclusions_schedule` (`ScheduleId`),
  CONSTRAINT `cns_master_licensee_enquiry_exclusions_ml` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `cns_master_licensee_enquiry_exclusions_schedule` FOREIGN KEY (`ScheduleId`) REFERENCES `schedule` (`ScheduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_join_master_licensee_enquiry_hours`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_join_master_licensee_enquiry_hours` (
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ScheduleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`MasterLicenseeId`,`ScheduleId`),
  KEY `cns_master_licensee_enquiry_hours_ml` (`MasterLicenseeId`),
  KEY `cns_master_licensee_enquiry_hours_schedule` (`ScheduleId`),
  CONSTRAINT `cns_master_licensee_enquiry_hours_ml` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `cns_master_licensee_enquiry_hours_schedule` FOREIGN KEY (`ScheduleId`) REFERENCES `schedule` (`ScheduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_join_master_licensee_time_periods`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_join_master_licensee_time_periods` (
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ScheduleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`MasterLicenseeId`,`ScheduleId`),
  KEY `cns_time_schedule_master_licensee` (`MasterLicenseeId`),
  KEY `cns_time_schedule_schedule` (`ScheduleId`),
  CONSTRAINT `cns_time_schedule_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `cns_time_schedule_schedule` FOREIGN KEY (`ScheduleId`) REFERENCES `schedule` (`ScheduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_join_office_schedule_venue`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_join_office_schedule_venue` (
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ScheduleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`VenueId`,`ScheduleId`) USING BTREE,
  KEY `cns_office_schedule_venue` (`VenueId`) USING BTREE,
  KEY `cns_office_schedule_schedule` (`ScheduleId`) USING BTREE,
  CONSTRAINT `cns_office_schedule_schedule` FOREIGN KEY (`ScheduleId`) REFERENCES `schedule` (`ScheduleId`),
  CONSTRAINT `cns_office_schedule_venue` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_join_payment_gateway_card_line_item`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_join_payment_gateway_card_line_item` (
  `SportsAccountPaymentGatewayCardId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LineItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SportsAccountPaymentGatewayCardId`,`LineItemId`),
  KEY `sports_join_payment_gateway_card_line_item_line_item` (`LineItemId`),
  CONSTRAINT `sports_join_payment_gateway_card_line_item_gateway` FOREIGN KEY (`SportsAccountPaymentGatewayCardId`) REFERENCES `sports_account_payment_gateway_card` (`SportsAccountPaymentGatewayCardId`),
  CONSTRAINT `sports_join_payment_gateway_card_line_item_line_item` FOREIGN KEY (`LineItemId`) REFERENCES `finance_line_item` (`LineItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_join_person_master_licensee`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_join_person_master_licensee` (
  `SportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SportsPersonId`,`MasterLicenseeId`) USING BTREE,
  KEY `FKSportsPersonId` (`SportsPersonId`) USING BTREE,
  KEY `FKMasterLicenseeId` (`MasterLicenseeId`) USING BTREE,
  CONSTRAINT `sports_join_person_master_licensee_ml` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_join_person_master_licensee_person` FOREIGN KEY (`SportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_join_postcode_lookup_history_program`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_join_postcode_lookup_history_program` (
  `PostcodeLookupId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`PostcodeLookupId`,`ProgramId`),
  KEY `cns_postcode_lookup_history_program` (`ProgramId`) USING BTREE,
  KEY `cns_postcode_lookup_history_program_postcode` (`PostcodeLookupId`) USING BTREE,
  CONSTRAINT `cns_postcode_lookup_history_program` FOREIGN KEY (`ProgramId`) REFERENCES `sports_program` (`EntityAttributesId`),
  CONSTRAINT `cns_postcode_lookup_history_program_postcode` FOREIGN KEY (`PostcodeLookupId`) REFERENCES `sports_postcode_lookup_history` (`PostcodeLookupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_join_program_venue`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_join_program_venue` (
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`VenueId`,`ProgramId`),
  KEY `FK4BE6CF5F77F62BCA` (`VenueId`),
  KEY `FK4BE6CF5F3DB3B69F` (`ProgramId`),
  CONSTRAINT `FK4BE6CF5F3DB3B69F` FOREIGN KEY (`ProgramId`) REFERENCES `sports_program` (`EntityAttributesId`),
  CONSTRAINT `FK4BE6CF5F77F62BCA` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_join_resource_program_level`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_join_resource_program_level` (
  `ResourceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ResourceId`,`LevelId`) USING BTREE,
  KEY `cns_resource_level` (`LevelId`) USING BTREE,
  CONSTRAINT `cns_resource_level` FOREIGN KEY (`LevelId`) REFERENCES `sports_program_level` (`EntityAttributesId`),
  CONSTRAINT `cns_resource_resource` FOREIGN KEY (`ResourceId`) REFERENCES `sports_pool` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_join_schedule_venue`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_join_schedule_venue` (
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ScheduleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`VenueId`,`ScheduleId`),
  KEY `FK65BEC9BC77F62BCA` (`VenueId`),
  KEY `FK65BEC9BC4DDE2E32` (`ScheduleId`),
  CONSTRAINT `FK65BEC9BC4DDE2E32` FOREIGN KEY (`ScheduleId`) REFERENCES `schedule` (`ScheduleId`),
  CONSTRAINT `FK65BEC9BC77F62BCA` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_join_student_referral_school`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_join_student_referral_school` (
  `SportsStudentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ReferringSchoolId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SportsStudentId`,`ReferringSchoolId`),
  KEY `FKSportsStudentId` (`SportsStudentId`),
  KEY `FKSportsReferringSchoolId` (`ReferringSchoolId`),
  CONSTRAINT `sports_join_student_referral_school_school` FOREIGN KEY (`ReferringSchoolId`) REFERENCES `sports_referral_school` (`ReferralSchoolId`),
  CONSTRAINT `sports_join_student_referral_school_student` FOREIGN KEY (`SportsStudentId`) REFERENCES `sports_student` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_join_venue_facility`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_join_venue_facility` (
  `VenueFacilityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`VenueFacilityId`,`VenueId`),
  KEY `sports_join_venue_facility_venue` (`VenueId`),
  CONSTRAINT `sports_join_venue_facility_facility` FOREIGN KEY (`VenueFacilityId`) REFERENCES `sports_venue_facility` (`VenueFacilityId`),
  CONSTRAINT `sports_join_venue_facility_venue` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_join_venue_sports_person`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_join_venue_sports_person` (
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`VenueId`,`SportsPersonId`) USING BTREE,
  KEY `cns_venue_sports_person` (`SportsPersonId`) USING BTREE,
  KEY `cns_venue_venue` (`SportsPersonId`) USING BTREE,
  CONSTRAINT `sports_join_venue_sports_person_person` FOREIGN KEY (`SportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`),
  CONSTRAINT `sports_join_venue_sports_person_venue` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_join_waiting_list_instructor`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_join_waiting_list_instructor` (
  `WaitingListId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `InstructorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`WaitingListId`,`InstructorId`) USING BTREE,
  KEY `cns_instructor` (`InstructorId`),
  CONSTRAINT `cns_instructor` FOREIGN KEY (`InstructorId`) REFERENCES `sports_instructor` (`EntityAttributesId`),
  CONSTRAINT `cns_waiting_list` FOREIGN KEY (`WaitingListId`) REFERENCES `sports_waiting_list` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_lane`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_lane` (
  `EntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `LaneConfigurationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Length` float DEFAULT NULL,
  `Width` float DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sequence` int DEFAULT NULL,
  `DefaultLaneSegmentMaxOccupany` int DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EntityAttributesId`),
  KEY `FK10CD5AAC6A227105` (`LaneConfigurationId`),
  KEY `fk_lane_entity` (`EntityId`),
  CONSTRAINT `cns_lane_entity` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `FK10CD5AAC6A227105` FOREIGN KEY (`LaneConfigurationId`) REFERENCES `sports_lane_config` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_lane_config`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_lane_config` (
  `EntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `PoolId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EntityAttributesId`),
  KEY `FK24530C358ED3F677` (`PoolId`),
  KEY `fk_lane_config_entity` (`EntityId`),
  CONSTRAINT `cns_lane_config_entity` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `FK24530C358ED3F677` FOREIGN KEY (`PoolId`) REFERENCES `sports_pool` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_lane_segment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_lane_segment` (
  `EntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `DepthId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Length` float DEFAULT NULL,
  `LaneId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sequence` int DEFAULT NULL,
  `MaxNumberOfStudents` int DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EntityAttributesId`),
  KEY `FKA30234A0873ABC47` (`LaneId`),
  KEY `FKA30234A0BFE1C71E` (`DepthId`),
  KEY `fk_lane_segment_entity` (`EntityId`),
  CONSTRAINT `cns_lane_segment_entity` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `FKA30234A0873ABC47` FOREIGN KEY (`LaneId`) REFERENCES `sports_lane` (`EntityAttributesId`),
  CONSTRAINT `FKA30234A0BFE1C71E` FOREIGN KEY (`DepthId`) REFERENCES `sports_depth` (`DepthId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_license`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_license` (
  `LicenseId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`LicenseId`),
  KEY `cns_license_licensee` (`LicenseeId`),
  CONSTRAINT `cns_license_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_license_program`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_license_program` (
  `LicenseId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`LicenseId`,`ProgramId`),
  KEY `cns_license_program_program` (`ProgramId`),
  CONSTRAINT `cns_license_program_license` FOREIGN KEY (`LicenseId`) REFERENCES `sports_license` (`LicenseId`),
  CONSTRAINT `cns_license_program_program` FOREIGN KEY (`ProgramId`) REFERENCES `sports_program` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_license_schedule`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_license_schedule` (
  `LicenseId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ScheduleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`LicenseId`,`ScheduleId`),
  KEY `cns_license_schedule_schedule` (`ScheduleId`),
  CONSTRAINT `cns_license_schedule_license` FOREIGN KEY (`LicenseId`) REFERENCES `sports_license` (`LicenseId`),
  CONSTRAINT `cns_license_schedule_schedule` FOREIGN KEY (`ScheduleId`) REFERENCES `schedule` (`ScheduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_license_venue`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_license_venue` (
  `LicenseId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`LicenseId`,`VenueId`),
  KEY `cns_license_venue_venue` (`VenueId`),
  CONSTRAINT `cns_license_venue_license` FOREIGN KEY (`LicenseId`) REFERENCES `sports_license` (`LicenseId`),
  CONSTRAINT `cns_license_venue_venue` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_licensee`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_licensee` (
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IndividualType` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `ActivePriceSearchCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ActiveDiscountSearchCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ActiveDiscountListId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ActiveTaxListCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CardPaymentGatewayId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TaxId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CompanyName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AllowOnlineBookings` tinyint(1) DEFAULT NULL,
  `ActiveCreditPackPriceSearchCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ActiveCreditPackDiscountSearchCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ActiveVoucherSearchCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AllowAutoEnrolments` tinyint(1) DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `DirectDebitPaymentGatewayId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`LicenseeId`),
  KEY `cns_licensee_account` (`AccountId`),
  KEY `cns_licesee_discount` (`ActiveDiscountListId`),
  KEY `cns_licesee_tax` (`ActiveTaxListCategoryId`),
  KEY `cns_licesee_price` (`ActivePriceSearchCategoryId`),
  KEY `cns_sports_licensee_payment_gateway` (`CardPaymentGatewayId`),
  KEY `cns_licesee_master_licensee` (`MasterLicenseeId`),
  KEY `sports_licensee_credit_price` (`ActiveCreditPackPriceSearchCategoryId`),
  KEY `sports_licensee_discount_credit_pack` (`ActiveCreditPackDiscountSearchCategoryId`),
  KEY `sports_licensee_voucher` (`ActiveVoucherSearchCategoryId`),
  KEY `sports_licensee_ddpg` (`DirectDebitPaymentGatewayId`),
  CONSTRAINT `cns_licensee_account` FOREIGN KEY (`AccountId`) REFERENCES `sports_account` (`EntityAttributesId`),
  CONSTRAINT `cns_licesee_discount` FOREIGN KEY (`ActiveDiscountListId`) REFERENCES `finance_discount_type` (`DiscountTypeId`),
  CONSTRAINT `cns_licesee_price` FOREIGN KEY (`ActivePriceSearchCategoryId`) REFERENCES `finance_price_search_category` (`PriceSearchCategoryId`),
  CONSTRAINT `cns_licesee_tax` FOREIGN KEY (`ActiveTaxListCategoryId`) REFERENCES `finance_price_search_category` (`PriceSearchCategoryId`),
  CONSTRAINT `cns_sports_licensee_payment_gateway` FOREIGN KEY (`CardPaymentGatewayId`) REFERENCES `sports_payment_gateway` (`PaymentGatewayId`),
  CONSTRAINT `sports_licensee_credit_price` FOREIGN KEY (`ActiveCreditPackPriceSearchCategoryId`) REFERENCES `finance_price_search_category` (`PriceSearchCategoryId`),
  CONSTRAINT `sports_licensee_ddpg` FOREIGN KEY (`DirectDebitPaymentGatewayId`) REFERENCES `sports_payment_gateway` (`PaymentGatewayId`),
  CONSTRAINT `sports_licensee_discount_credit_pack` FOREIGN KEY (`ActiveCreditPackDiscountSearchCategoryId`) REFERENCES `finance_price_search_category` (`PriceSearchCategoryId`),
  CONSTRAINT `sports_licensee_voucher` FOREIGN KEY (`ActiveVoucherSearchCategoryId`) REFERENCES `finance_price_search_category` (`PriceSearchCategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_licensee_insurance`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_licensee_insurance` (
  `LicenseeInsuranceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IssueDate` datetime NOT NULL,
  `ExpiryDate` datetime NOT NULL,
  `PolicyNumber` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `InsuranceCopy` blob,
  `Verified` tinyint(1) DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`LicenseeInsuranceId`) USING BTREE,
  KEY `cns_licensee_insurance` (`LicenseeId`),
  CONSTRAINT `cns_licensee_insurance` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_licensee_to_discounts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_licensee_to_discounts` (
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DiscountSearchCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`LicenseeId`,`DiscountSearchCategoryId`),
  KEY `cns_licensee_discount` (`DiscountSearchCategoryId`),
  CONSTRAINT `cns_discount_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`),
  CONSTRAINT `cns_licensee_discount` FOREIGN KEY (`DiscountSearchCategoryId`) REFERENCES `finance_discount_type` (`DiscountTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_licensee_to_disount_categories`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_licensee_to_disount_categories` (
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PriceSearchCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`LicenseeId`,`PriceSearchCategoryId`) USING BTREE,
  KEY `cns_licensee_disount_categories` (`PriceSearchCategoryId`) USING BTREE,
  CONSTRAINT `cns_licensee_disount_categories` FOREIGN KEY (`PriceSearchCategoryId`) REFERENCES `finance_price_search_category` (`PriceSearchCategoryId`),
  CONSTRAINT `cns_price_disount_categories_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_licensee_to_price_lists`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_licensee_to_price_lists` (
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PriceTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`LicenseeId`,`PriceTypeId`),
  KEY `cns_licensee_price_type` (`PriceTypeId`),
  CONSTRAINT `cns_licensee_price_type` FOREIGN KEY (`PriceTypeId`) REFERENCES `finance_price_type` (`PriceTypeId`),
  CONSTRAINT `cns_price_type_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_licensee_to_prices`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_licensee_to_prices` (
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PriceSearchCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`LicenseeId`,`PriceSearchCategoryId`),
  KEY `cns_licensee_price` (`PriceSearchCategoryId`),
  CONSTRAINT `cns_licensee_price` FOREIGN KEY (`PriceSearchCategoryId`) REFERENCES `finance_price_search_category` (`PriceSearchCategoryId`),
  CONSTRAINT `cns_price_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_licensee_to_taxes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_licensee_to_taxes` (
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TaxSearchCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`LicenseeId`,`TaxSearchCategoryId`),
  KEY `cns_licensee_tax` (`TaxSearchCategoryId`),
  CONSTRAINT `cns_licensee_tax` FOREIGN KEY (`TaxSearchCategoryId`) REFERENCES `finance_price_search_category` (`PriceSearchCategoryId`),
  CONSTRAINT `cns_tax_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_map_region`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_map_region` (
  `MapRegionId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `OperatorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MapRegionId`),
  KEY `cns_map_region_operator` (`OperatorId`),
  CONSTRAINT `cns_map_region_operator` FOREIGN KEY (`OperatorId`) REFERENCES `sports_operator` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_map_region_point`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_map_region_point` (
  `MapRegionPointId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MapRegionId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Longitude` decimal(10,6) NOT NULL,
  `Latitude` decimal(10,6) NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MapRegionPointId`),
  KEY `cns_map_region_point_region` (`MapRegionId`),
  CONSTRAINT `cns_map_region_point_region` FOREIGN KEY (`MapRegionId`) REFERENCES `sports_map_region` (`MapRegionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_master_licensee`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_master_licensee` (
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CurrencyCode` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CountryCode` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Language` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `WidgetPreferencesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OnlineBookingsPreferenceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TeachingNotificationConfigurationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SMSConfigurationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CloseSLAMinutes` int DEFAULT NULL,
  `PerformanceConfigurationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UrlShortenerUrl` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProspectHotToWarmDays` int DEFAULT NULL,
  `ProspectWarmToColdDays` int DEFAULT NULL,
  `ContactDetailsAgeLimit` int DEFAULT NULL,
  `ReportingSettingsId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StaffSurveyConfigurationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TicketAcknowledgementURL` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AbandonedCartConfigurationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `ApiKey` binary(64) DEFAULT NULL,
  `EnforceReCaptcha` tinyint(1) NOT NULL DEFAULT '0',
  `ReCaptchaSecretKey` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReCaptchaSiteKey` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClassCreditsDefaultExpiryMonths` int DEFAULT NULL,
  PRIMARY KEY (`MasterLicenseeId`) USING BTREE,
  UNIQUE KEY `sports_master_licensee_api` (`ApiKey`),
  KEY `cns_master_licensee_currency` (`CurrencyCode`),
  KEY `sports_master_license_widget_preferences` (`WidgetPreferencesId`),
  KEY `sports_master_license_online_booking_preference` (`OnlineBookingsPreferenceId`),
  KEY `sports_master_licensee_tc` (`TeachingNotificationConfigurationId`),
  KEY `sports_master_licensee_sms_config` (`SMSConfigurationId`),
  KEY `sports_master_licensee_perofmrance` (`PerformanceConfigurationId`),
  KEY `sports_master_licensee_reporting_settings` (`ReportingSettingsId`),
  KEY `sports_master_licensee_ml` (`StaffSurveyConfigurationId`),
  KEY `sports_master_licensee_ac` (`AbandonedCartConfigurationId`),
  CONSTRAINT `cns_master_licensee_currency` FOREIGN KEY (`CurrencyCode`) REFERENCES `finance_currency` (`currencyCode`),
  CONSTRAINT `sports_master_license_online_booking_preference` FOREIGN KEY (`OnlineBookingsPreferenceId`) REFERENCES `sports_online_bookings_preferences` (`OnlineBookingsPreferenceId`),
  CONSTRAINT `sports_master_license_widget_preferences` FOREIGN KEY (`WidgetPreferencesId`) REFERENCES `sports_widget_preferences` (`WidgetPreferenceId`),
  CONSTRAINT `sports_master_licensee_ac` FOREIGN KEY (`AbandonedCartConfigurationId`) REFERENCES `sports_abandoned_cart_configuration` (`AbandonedCartConfigurationId`),
  CONSTRAINT `sports_master_licensee_ml` FOREIGN KEY (`StaffSurveyConfigurationId`) REFERENCES `sports_staff_survey_configuration` (`StaffSurveyConfigurationId`),
  CONSTRAINT `sports_master_licensee_perofmrance` FOREIGN KEY (`PerformanceConfigurationId`) REFERENCES `sports_performance_configuration` (`PerformanceConfigurationId`),
  CONSTRAINT `sports_master_licensee_reporting_settings` FOREIGN KEY (`ReportingSettingsId`) REFERENCES `sports_reporting_settings` (`ReportingSettingsId`),
  CONSTRAINT `sports_master_licensee_sms_config` FOREIGN KEY (`SMSConfigurationId`) REFERENCES `sports_sms_configuration` (`SMSConfigurationId`),
  CONSTRAINT `sports_master_licensee_tc` FOREIGN KEY (`TeachingNotificationConfigurationId`) REFERENCES `teaching_notification_configuration` (`TeachingNotificationConfigurationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_medical_history`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_medical_history` (
  `MedicalHistoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `StudentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MedicalHistoryId`),
  KEY `FK207FC4261D90896` (`StudentId`),
  CONSTRAINT `FK207FC4261D90896` FOREIGN KEY (`StudentId`) REFERENCES `sports_student` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_membership`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_membership` (
  `MembershipId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `MembershipTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `SportsStudentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MembershipId`),
  KEY `fk_sports_membership_type` (`MembershipTypeId`),
  KEY `fk_sports_membership_student` (`SportsStudentId`),
  CONSTRAINT `fk_sports_membership_student` FOREIGN KEY (`SportsStudentId`) REFERENCES `sports_student` (`EntityAttributesId`),
  CONSTRAINT `fk_sports_membership_type` FOREIGN KEY (`MembershipTypeId`) REFERENCES `sports_membership_type` (`MembershipTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_membership_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_membership_type` (
  `MembershipTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MembershipTypeId`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_membership_type_licensee`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_membership_type_licensee` (
  `MembershipTypeLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MembershipTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MembershipTypeLicenseeId`),
  UNIQUE KEY `LicenseeId` (`LicenseeId`,`MembershipTypeId`),
  KEY `cns_membership_type_licensee_membership_type` (`MembershipTypeId`),
  CONSTRAINT `cns_membership_type_licensee_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`),
  CONSTRAINT `cns_membership_type_licensee_membership_type` FOREIGN KEY (`MembershipTypeId`) REFERENCES `sports_membership_type` (`MembershipTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_membership_type_venue`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_membership_type_venue` (
  `MembershipTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MembershipTypeId`,`VenueId`) USING BTREE,
  KEY `cns_membership_type_venue_venue` (`MembershipTypeId`) USING BTREE,
  KEY `cns_membership_type_venue_membership_type` (`VenueId`) USING BTREE,
  CONSTRAINT `cns_membership_type_venue_membership_type` FOREIGN KEY (`MembershipTypeId`) REFERENCES `sports_membership_type` (`MembershipTypeId`),
  CONSTRAINT `cns_membership_type_venue_venue` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_multiple_term`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_multiple_term` (
  `MultipleTermId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TermId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MinStudentsPerInstructor` int DEFAULT NULL,
  `MaxStudentsPerInstructor` int DEFAULT NULL,
  `ClassCredits` int DEFAULT NULL,
  `Status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `PreSaleFromDate` datetime DEFAULT NULL,
  `PreSaleToDate` datetime DEFAULT NULL,
  `PreSaleClassCredits` int DEFAULT NULL,
  `PreSaleDiscount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ValidFrom` datetime DEFAULT NULL,
  `ValidTo` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MultipleTermId`) USING BTREE,
  KEY `cns_multiple_term_term` (`TermId`) USING BTREE,
  KEY `cns_multiple_term_licensee` (`LicenseeId`) USING BTREE,
  KEY `sports_multiple_term_pre_sale_discount` (`PreSaleDiscount`),
  CONSTRAINT `cns_multiple_term_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`),
  CONSTRAINT `cns_multiple_term_term` FOREIGN KEY (`TermId`) REFERENCES `sports_term` (`TermId`),
  CONSTRAINT `sports_multiple_term_pre_sale_discount` FOREIGN KEY (`PreSaleDiscount`) REFERENCES `finance_discount` (`DiscountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_multiple_term_pre_sale_term`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_multiple_term_pre_sale_term` (
  `MultipleTermId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TermId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`MultipleTermId`,`TermId`),
  KEY `sports_multiple_term_pre_sale_term_t` (`TermId`),
  CONSTRAINT `sports_multiple_term_pre_sale_term_mt` FOREIGN KEY (`MultipleTermId`) REFERENCES `sports_multiple_term` (`MultipleTermId`),
  CONSTRAINT `sports_multiple_term_pre_sale_term_t` FOREIGN KEY (`TermId`) REFERENCES `sports_term` (`TermId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_multiple_term_program`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_multiple_term_program` (
  `MultipleTermId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`MultipleTermId`,`ProgramId`),
  KEY `sports_multiple_term_program_program` (`ProgramId`),
  CONSTRAINT `sports_multiple_term_program_mt` FOREIGN KEY (`MultipleTermId`) REFERENCES `sports_multiple_term` (`MultipleTermId`),
  CONSTRAINT `sports_multiple_term_program_program` FOREIGN KEY (`ProgramId`) REFERENCES `sports_program` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_multiple_term_to_terms`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_multiple_term_to_terms` (
  `MultipleTermId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TermId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MultipleTermId`,`TermId`) USING BTREE,
  KEY `cns_multiple_term_terms` (`MultipleTermId`) USING BTREE,
  KEY `cns_mult_term_term` (`TermId`) USING BTREE,
  CONSTRAINT `cns_mult_term_term` FOREIGN KEY (`TermId`) REFERENCES `sports_term` (`TermId`),
  CONSTRAINT `cns_multiple_term_terms` FOREIGN KEY (`MultipleTermId`) REFERENCES `sports_multiple_term` (`MultipleTermId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_multiple_term_to_venues`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_multiple_term_to_venues` (
  `MultipleTermId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VenueEAId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MultipleTermId`,`VenueEAId`) USING BTREE,
  KEY `cns_multiple_term_venues` (`MultipleTermId`) USING BTREE,
  KEY `cns_mult_term_venue` (`VenueEAId`) USING BTREE,
  CONSTRAINT `cns_mult_term_venue` FOREIGN KEY (`VenueEAId`) REFERENCES `sports_venue` (`EntityAttributesId`),
  CONSTRAINT `cns_multiple_term_venues` FOREIGN KEY (`MultipleTermId`) REFERENCES `sports_multiple_term` (`MultipleTermId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_nationality`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_nationality` (
  `NationalityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`NationalityId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_news`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_news` (
  `NewsId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ShortDescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Introduction` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ValidFrom` datetime NOT NULL,
  `ValidTo` datetime NOT NULL,
  `IncludeOnFeed` tinyint(1) NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`NewsId`) USING BTREE,
  KEY `cns_news_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `cns_news_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_note`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_note` (
  `SportsNoteId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DateSent` datetime DEFAULT NULL,
  `NoteId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TicketTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Direction` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `TotalOpens` int DEFAULT NULL,
  PRIMARY KEY (`SportsNoteId`),
  KEY `sports_note_note` (`NoteId`),
  KEY `sports_note_sports_person` (`SportsPersonId`),
  KEY `sports_note_ticket_type` (`TicketTypeId`),
  CONSTRAINT `sports_note_note` FOREIGN KEY (`NoteId`) REFERENCES `note` (`NoteId`),
  CONSTRAINT `sports_note_sports_person` FOREIGN KEY (`SportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`),
  CONSTRAINT `sports_note_ticket_type` FOREIGN KEY (`TicketTypeId`) REFERENCES `sports_ticket_type` (`TicketTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_note_open`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_note_open` (
  `SportsNoteOpenId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `OpenDate` datetime NOT NULL,
  `IPAddress` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SportsNoteId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailAddress` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`SportsNoteOpenId`),
  KEY `sports_note_open_note` (`SportsNoteId`),
  CONSTRAINT `sports_note_open_note` FOREIGN KEY (`SportsNoteId`) REFERENCES `sports_note` (`SportsNoteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_notification`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_notification` (
  `NotificationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SendDate` datetime NOT NULL,
  `EmailTemplateId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `EnrolmentProfileId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PendingPaymentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `EnrolmentRenewalId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ErrorMessage` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`NotificationId`),
  KEY `sports_pending_payment_email_template` (`EmailTemplateId`),
  KEY `sports_pending_payment_notification_config` (`EnrolmentProfileId`),
  KEY `sports_pending_payment_notification_pending_payment` (`PendingPaymentId`),
  KEY `sportsnotification_renewal` (`EnrolmentRenewalId`),
  CONSTRAINT `sports_pending_payment_email_template` FOREIGN KEY (`EmailTemplateId`) REFERENCES `sports_email_template` (`EmailTemplateId`),
  CONSTRAINT `sports_pending_payment_notification_config` FOREIGN KEY (`EnrolmentProfileId`) REFERENCES `sports_enrolment_profile` (`EnrolmentProfileId`),
  CONSTRAINT `sports_pending_payment_notification_pending_payment` FOREIGN KEY (`PendingPaymentId`) REFERENCES `sports_pending_payment` (`PendingPaymentId`),
  CONSTRAINT `sportsnotification_renewal` FOREIGN KEY (`EnrolmentRenewalId`) REFERENCES `sports_enrolment_renewal` (`EnrolmentRenewalId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_observation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_observation` (
  `ObservationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DateObserved` datetime NOT NULL,
  `ObservedByEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Grade` double NOT NULL,
  `Status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ReportUrlId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ObservationTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `PeriodFromDate` datetime DEFAULT NULL,
  `PeriodToDate` datetime DEFAULT NULL,
  `SportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ObservationId`),
  KEY `sports_instructor_observation_entity` (`ObservedByEntityId`),
  KEY `sports_instructor_observation_type` (`ObservationTypeId`),
  KEY `sports_instructor_observation_url` (`ReportUrlId`),
  KEY `sports_observation_sports_person` (`SportsPersonId`),
  CONSTRAINT `sports_instructor_observation_entity` FOREIGN KEY (`ObservedByEntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `sports_instructor_observation_type` FOREIGN KEY (`ObservationTypeId`) REFERENCES `sports_observation_type` (`ObservationTypeId`),
  CONSTRAINT `sports_instructor_observation_url` FOREIGN KEY (`ReportUrlId`) REFERENCES `url` (`UrlId`),
  CONSTRAINT `sports_observation_sports_person` FOREIGN KEY (`SportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_observation_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_observation_type` (
  `ObservationTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `MaximumPoints` double DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ObservationTypeId`),
  KEY `sports_instructor_observation_type_ml` (`MasterLicenseeId`),
  CONSTRAINT `sports_instructor_observation_type_ml` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_observation_type_role`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_observation_type_role` (
  `ObservationTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ObservationTypeId`,`Role`),
  KEY `sports_observation_type_role_role` (`Role`),
  CONSTRAINT `sports_observation_type_role_observation` FOREIGN KEY (`ObservationTypeId`) REFERENCES `sports_observation_type` (`ObservationTypeId`),
  CONSTRAINT `sports_observation_type_role_role` FOREIGN KEY (`Role`) REFERENCES `role` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_online_bookings_preferences`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_online_bookings_preferences` (
  `OnlineBookingsPreferenceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `StyleSheetFolder` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TermsOfUseUrl` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataProtectionUrl` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TermsAndConditionsUrl` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReferrerName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReferrerUrl` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `UpgradeText` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `URLPath` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Hostname` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AnalyticsTracker` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AnalyticsDomain` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ChatEnabled` tinyint(1) NOT NULL,
  `ChatScript` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `PreSaleUpgradeTextResourceKey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OptOutSMSOperationsUrl` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RenewalUrl` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ForceAutoEnrolment` tinyint(1) DEFAULT NULL,
  `AutoRenewalTextResourceKey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AdwordsTracker` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FacebookPixelId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `ApplyAccountBalance` tinyint(1) NOT NULL DEFAULT '1',
  `ContactTelephone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LogoImageUrlId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LogoImageInverseUrlId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ContactUrl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CourseReferralLink` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tagline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AutoGeneratePendingPayments` tinyint(1) NOT NULL DEFAULT '0',
  `PendingPaymentGenerationInvoiceMonths` int DEFAULT NULL,
  `KeycloakLoginStyle` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ActivateAccountLink` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ForgotPasswordLink` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`OnlineBookingsPreferenceId`) USING BTREE,
  UNIQUE KEY `sports_online_bookings_preferences_url` (`Hostname`),
  KEY `cns_online_bookings_preferences_master_licensee` (`MasterLicenseeId`) USING BTREE,
  KEY `sports_online_bookings_pre_sale_resource` (`PreSaleUpgradeTextResourceKey`),
  KEY `sports_online_bookings_auto_renewal_resource` (`AutoRenewalTextResourceKey`),
  KEY `sports_online_bookings_preferences_logo` (`LogoImageUrlId`),
  KEY `sports_online_bookings_preferences_logo_inverse` (`LogoImageInverseUrlId`),
  CONSTRAINT `cns_online_bookings_preferences_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_online_bookings_auto_renewal_resource` FOREIGN KEY (`AutoRenewalTextResourceKey`) REFERENCES `resource_key` (`KeyName`),
  CONSTRAINT `sports_online_bookings_pre_sale_resource` FOREIGN KEY (`PreSaleUpgradeTextResourceKey`) REFERENCES `resource_key` (`KeyName`),
  CONSTRAINT `sports_online_bookings_preferences_logo` FOREIGN KEY (`LogoImageUrlId`) REFERENCES `url` (`UrlId`),
  CONSTRAINT `sports_online_bookings_preferences_logo_inverse` FOREIGN KEY (`LogoImageInverseUrlId`) REFERENCES `url` (`UrlId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_online_bookings_preferences_link`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_online_bookings_preferences_link` (
  `OnlineBookingsPreferenceLinkId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OnlineBookingsPreferenceLinkTypeId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ColumnNumber` int DEFAULT NULL,
  `Sequence` int DEFAULT NULL,
  `Label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` text COLLATE utf8mb4_unicode_ci,
  `LinkAction` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Icon` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Highlighted` tinyint DEFAULT '0',
  `OnlineBookingsPreferenceId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`OnlineBookingsPreferenceLinkId`),
  KEY `sports_online_bookings_preferences_link_op` (`OnlineBookingsPreferenceId`),
  KEY `sports_online_bookings_preferences_link_lt` (`OnlineBookingsPreferenceLinkTypeId`),
  CONSTRAINT `sports_online_bookings_preferences_link_lt` FOREIGN KEY (`OnlineBookingsPreferenceLinkTypeId`) REFERENCES `sports_online_bookings_preferences_link_type` (`OnlineBookingsPreferenceLinkTypeId`),
  CONSTRAINT `sports_online_bookings_preferences_link_op` FOREIGN KEY (`OnlineBookingsPreferenceId`) REFERENCES `sports_online_bookings_preferences` (`OnlineBookingsPreferenceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_online_bookings_preferences_link_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_online_bookings_preferences_link_type` (
  `OnlineBookingsPreferenceLinkTypeId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`OnlineBookingsPreferenceLinkTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_online_bookings_preferences_payment_type_description`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_online_bookings_preferences_payment_type_description` (
  `OnlineBookingsPreferencePaymentTypeDescriptionId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EnrolmentType` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Sequence` int DEFAULT NULL,
  `Content` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OnlineBookingsPreferenceId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`OnlineBookingsPreferencePaymentTypeDescriptionId`),
  KEY `sports_online_bookings_preferences_payment_type_description_ob` (`OnlineBookingsPreferenceId`),
  CONSTRAINT `sports_online_bookings_preferences_payment_type_description_ob` FOREIGN KEY (`OnlineBookingsPreferenceId`) REFERENCES `sports_online_bookings_preferences` (`OnlineBookingsPreferenceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_operator`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_operator` (
  `EntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `CallConnectLineId` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`EntityAttributesId`),
  KEY `FKA30234AEKJARTW` (`EntityAttributesId`),
  KEY `fk_operator_entity` (`EntityId`),
  CONSTRAINT `cns_operator_entity` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_otp_default_roles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_otp_default_roles` (
  `MasterLicenseeId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RoleName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`MasterLicenseeId`,`RoleName`),
  KEY `sports_otp_default_roles_r` (`RoleName`),
  CONSTRAINT `sports_otp_default_roles_ml` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_otp_default_roles_r` FOREIGN KEY (`RoleName`) REFERENCES `role` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_payment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_payment` (
  `SportsPaymentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SystemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PaymentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `ProcessedByEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`SportsPaymentId`),
  KEY `sports_payment_system` (`SystemId`),
  KEY `sports_payment_payment` (`PaymentId`),
  KEY `sports_payment_entity` (`ProcessedByEntityId`),
  CONSTRAINT `sports_payment_entity` FOREIGN KEY (`ProcessedByEntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `sports_payment_system` FOREIGN KEY (`SystemId`) REFERENCES `sports_system` (`SystemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_payment_country`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_payment_country` (
  `CountryCode` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CountryCode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_payment_failure_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_payment_failure_log` (
  `SportsPaymentFailureLogId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsAccountPaymentGatewayCardId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ErrorType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ErrorMessage` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PaymentFailureDate` datetime NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BillingServiceTermId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Amount` double NOT NULL,
  `PendingPaymentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Method` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsAccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`SportsPaymentFailureLogId`),
  KEY `sports_payment_failure_log_card` (`SportsAccountPaymentGatewayCardId`),
  KEY `sports_payment_failure_log_billing_service` (`BillingServiceTermId`),
  KEY `sportspaymentfailurelog_pending_payment` (`PendingPaymentId`),
  KEY `sportspaymentfailurelog_sports_account` (`SportsAccountId`),
  CONSTRAINT `sports_payment_failure_log_billing_service` FOREIGN KEY (`BillingServiceTermId`) REFERENCES `finance_billing_service_term` (`BillingServiceTermId`),
  CONSTRAINT `sports_payment_failure_log_card` FOREIGN KEY (`SportsAccountPaymentGatewayCardId`) REFERENCES `sports_account_payment_gateway_card` (`SportsAccountPaymentGatewayCardId`),
  CONSTRAINT `sportspaymentfailurelog_pending_payment` FOREIGN KEY (`PendingPaymentId`) REFERENCES `sports_pending_payment` (`PendingPaymentId`),
  CONSTRAINT `sportspaymentfailurelog_sports_account` FOREIGN KEY (`SportsAccountId`) REFERENCES `sports_account` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_payment_failure_log_reference`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_payment_failure_log_reference` (
  `SportsPaymentFailureLogReferenceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SportsPaymentFailureLogId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`SportsPaymentFailureLogReferenceId`),
  KEY `fk_failed_payment_payment` (`SportsPaymentFailureLogId`),
  CONSTRAINT `fk_failed_payment_payment` FOREIGN KEY (`SportsPaymentFailureLogId`) REFERENCES `sports_payment_failure_log` (`SportsPaymentFailureLogId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_payment_gateway`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_payment_gateway` (
  `PaymentGatewayId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PaymentGateway` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `Type` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`PaymentGatewayId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_payment_gateway_vars`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_payment_gateway_vars` (
  `PaymentGatewayVarsId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PaymentGatewayId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PaymentGatewayVarsId`) USING BTREE,
  KEY `cns_payment_gateway_vars_payment_gateway` (`PaymentGatewayId`),
  CONSTRAINT `cns_payment_gateway_vars_payment_gateway` FOREIGN KEY (`PaymentGatewayId`) REFERENCES `sports_payment_gateway` (`PaymentGatewayId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_payment_invoice`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_payment_invoice` (
  `SportsPaymentInvoiceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsPaymentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LineItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Amount` double NOT NULL,
  `InitialBookingCustomerType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `InitialBookingCustomerTrend` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`SportsPaymentInvoiceId`),
  KEY `sports_payment_invoice_payment` (`SportsPaymentId`),
  KEY `sports_payment_invoice_line_item` (`LineItemId`),
  CONSTRAINT `sports_payment_invoice_line_item` FOREIGN KEY (`LineItemId`) REFERENCES `finance_line_item` (`LineItemId`),
  CONSTRAINT `sports_payment_invoice_payment` FOREIGN KEY (`SportsPaymentId`) REFERENCES `sports_payment` (`SportsPaymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_payment_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_payment_type` (
  `PaymentTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `IsMonthly` tinyint(1) NOT NULL DEFAULT '0',
  `CanRefund` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PaymentTypeId`),
  UNIQUE KEY `sports_payment_type_ix1` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_payment_type_master_licensee`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_payment_type_master_licensee` (
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PaymentTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`MasterLicenseeId`,`PaymentTypeId`),
  KEY `sports_payment_type_master_licensee_pt` (`PaymentTypeId`),
  CONSTRAINT `sports_payment_type_master_licensee_ml` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_payment_type_master_licensee_pt` FOREIGN KEY (`PaymentTypeId`) REFERENCES `sports_payment_type` (`PaymentTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_payment_type_venue_exclusion`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_payment_type_venue_exclusion` (
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PaymentTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`VenueId`,`PaymentTypeId`),
  KEY `sports_payment_type_venue_exclusion_pt` (`PaymentTypeId`),
  CONSTRAINT `sports_payment_type_venue_exclusion_pt` FOREIGN KEY (`PaymentTypeId`) REFERENCES `sports_payment_type` (`PaymentTypeId`),
  CONSTRAINT `sports_payment_type_venue_exclusion_v` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_pending_payment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_pending_payment` (
  `PendingPaymentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsAccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Reference` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsPaid` tinyint(1) NOT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Expiry` datetime DEFAULT NULL,
  `ExpiryAction` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Amount` double NOT NULL,
  `ReceiptName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReceiptDescription` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProcessedBySportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `DirectDebitPaymentId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DirectDebitStatus` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Direction` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DirectDebitPaymentDate` datetime DEFAULT NULL,
  `DirectDebitRefundPaymentId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SportsAccountPaymentGatewayId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RecurringBillingServiceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RefundReasonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Reason` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Cause` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Retries` int DEFAULT NULL,
  PRIMARY KEY (`PendingPaymentId`),
  UNIQUE KEY `sports_pending_payment_reference` (`Reference`),
  UNIQUE KEY `sports_pending_payment_dd` (`DirectDebitPaymentId`),
  KEY `sports_pending_payment_sports_account` (`SportsAccountId`),
  KEY `sports_pending_payment_sp` (`ProcessedBySportsPersonId`),
  KEY `sports_pending_payment_pg` (`SportsAccountPaymentGatewayId`),
  KEY `sports_pending_payment_srb` (`RecurringBillingServiceId`),
  KEY `sports_pending_payment_rr` (`RefundReasonId`),
  CONSTRAINT `sports_pending_payment_pg` FOREIGN KEY (`SportsAccountPaymentGatewayId`) REFERENCES `sports_account_payment_gateway` (`SportsAccountPaymentGatewayId`),
  CONSTRAINT `sports_pending_payment_rr` FOREIGN KEY (`RefundReasonId`) REFERENCES `sports_refund_reason` (`RefundReasonId`),
  CONSTRAINT `sports_pending_payment_sp` FOREIGN KEY (`ProcessedBySportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`),
  CONSTRAINT `sports_pending_payment_sports_account` FOREIGN KEY (`SportsAccountId`) REFERENCES `sports_account` (`EntityAttributesId`),
  CONSTRAINT `sports_pending_payment_srb` FOREIGN KEY (`RecurringBillingServiceId`) REFERENCES `sports_billing_service` (`SportsRecurringBillingServiceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_pending_payment_invoice`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_pending_payment_invoice` (
  `PendingPaymentInvoiceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PendingPaymentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LineItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsPaid` tinyint(1) NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `EnrolmentGroupId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EnrolmentExpiryStartDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PendingPaymentInvoiceId`),
  KEY `sports_pending_payment_invoice_line_item` (`LineItemId`),
  KEY `sports_pending_payment_invoice_pending_payment` (`PendingPaymentId`),
  KEY `sports_pending_payment_invoice_group` (`EnrolmentGroupId`),
  CONSTRAINT `sports_pending_payment_invoice_group` FOREIGN KEY (`EnrolmentGroupId`) REFERENCES `sports_enrolment_group` (`EnrolmentGroupId`),
  CONSTRAINT `sports_pending_payment_invoice_line_item` FOREIGN KEY (`LineItemId`) REFERENCES `finance_line_item` (`LineItemId`),
  CONSTRAINT `sports_pending_payment_invoice_pending_payment` FOREIGN KEY (`PendingPaymentId`) REFERENCES `sports_pending_payment` (`PendingPaymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_pending_payment_payment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_pending_payment_payment` (
  `PendingPaymentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsPaymentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`PendingPaymentId`,`SportsPaymentId`),
  KEY `sports_pending_payment_payment_sp` (`SportsPaymentId`),
  CONSTRAINT `sports_pending_payment_payment_pp` FOREIGN KEY (`PendingPaymentId`) REFERENCES `sports_pending_payment` (`PendingPaymentId`),
  CONSTRAINT `sports_pending_payment_payment_sp` FOREIGN KEY (`SportsPaymentId`) REFERENCES `sports_payment` (`SportsPaymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_pending_payment_refund`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_pending_payment_refund` (
  `PendingPaymentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `RefundId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`PendingPaymentId`,`RefundId`),
  KEY `sports_pending_payment_refund_r` (`RefundId`),
  CONSTRAINT `sports_pending_payment_refund_pp` FOREIGN KEY (`PendingPaymentId`) REFERENCES `sports_pending_payment` (`PendingPaymentId`),
  CONSTRAINT `sports_pending_payment_refund_r` FOREIGN KEY (`RefundId`) REFERENCES `sports_refund` (`RefundId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_performance`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_performance` (
  `PerformanceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PerformanceIndicatorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date` datetime NOT NULL,
  `PointsAwarded` int NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `PerformanceIndicatorScaleValueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Score` double NOT NULL,
  `InstructorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OperatorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PerformanceId`),
  KEY `sports_performance_indicator` (`PerformanceIndicatorId`),
  KEY `sports_performance_licensee` (`LicenseeId`),
  KEY `sports_performance_venue` (`VenueId`),
  KEY `sports_performance_indicator_scale_value` (`PerformanceIndicatorScaleValueId`),
  KEY `sports_performance_instructor` (`InstructorId`),
  KEY `sports_performance_ml` (`MasterLicenseeId`),
  KEY `sports_performance_o` (`OperatorId`),
  CONSTRAINT `sports_performance_indicator` FOREIGN KEY (`PerformanceIndicatorId`) REFERENCES `sports_performance_indicator` (`PerformanceIndicatorId`),
  CONSTRAINT `sports_performance_indicator_scale_value` FOREIGN KEY (`PerformanceIndicatorScaleValueId`) REFERENCES `sports_performance_indicator_scale_value` (`PerformanceIndicatorScaleValueId`),
  CONSTRAINT `sports_performance_instructor` FOREIGN KEY (`InstructorId`) REFERENCES `sports_instructor` (`EntityAttributesId`),
  CONSTRAINT `sports_performance_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`),
  CONSTRAINT `sports_performance_ml` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_performance_o` FOREIGN KEY (`OperatorId`) REFERENCES `sports_operator` (`EntityAttributesId`),
  CONSTRAINT `sports_performance_venue` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_performance_configuration`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_performance_configuration` (
  `PerformanceConfigurationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LastRun` datetime NOT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `WeeklyReportingLastRun` datetime DEFAULT NULL,
  `DailyReportingLastRun` datetime DEFAULT NULL,
  `RunAfterTime` datetime DEFAULT NULL,
  `DailyReportLastRun` datetime NOT NULL,
  `DailyReportRunAfterTime` datetime DEFAULT NULL,
  `WeeklyReportLastRun` datetime NOT NULL,
  `WeeklyReportRunAfterTime` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PerformanceConfigurationId`),
  KEY `sports_performance_configuration_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_performance_configuration_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_performance_indicator`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_performance_indicator` (
  `PerformanceIndicatorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `ValueType` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PerformanceIndicatorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_performance_indicator_master_licensee`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_performance_indicator_master_licensee` (
  `PerformanceIndicatorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`PerformanceIndicatorId`,`MasterLicenseeId`),
  KEY `sports_performance_indicator_master_licensee_ml` (`MasterLicenseeId`),
  CONSTRAINT `sports_performance_indicator_master_licensee_ml` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_performance_indicator_master_licensee_pi` FOREIGN KEY (`PerformanceIndicatorId`) REFERENCES `sports_performance_indicator` (`PerformanceIndicatorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_performance_indicator_parameter`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_performance_indicator_parameter` (
  `PerformanceIndicatorParameterId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PerformanceIndicatorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PerformanceIndicatorParameterId`),
  KEY `sports_performance_indicator_parameter_indicator` (`PerformanceIndicatorId`),
  CONSTRAINT `sports_performance_indicator_parameter_indicator` FOREIGN KEY (`PerformanceIndicatorId`) REFERENCES `sports_performance_indicator` (`PerformanceIndicatorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_performance_indicator_parameter_value`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_performance_indicator_parameter_value` (
  `PerformanceIndicatorParameterValueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PerformanceIndicatorParameterId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Value` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ValidFrom` datetime NOT NULL,
  `ValidTo` datetime DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PerformanceIndicatorParameterValueId`),
  KEY `sports_performance_indicator_parameter_value_p` (`PerformanceIndicatorParameterId`),
  CONSTRAINT `sports_performance_indicator_parameter_value_p` FOREIGN KEY (`PerformanceIndicatorParameterId`) REFERENCES `sports_performance_indicator_parameter` (`PerformanceIndicatorParameterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_performance_indicator_scale`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_performance_indicator_scale` (
  `PerformanceIndicatorScaleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PerformanceIndicatorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MaximumPoints` int NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PerformanceIndicatorScaleId`),
  KEY `sports_performance_indicator_scale_indicator` (`PerformanceIndicatorId`),
  CONSTRAINT `sports_performance_indicator_scale_indicator` FOREIGN KEY (`PerformanceIndicatorId`) REFERENCES `sports_performance_indicator` (`PerformanceIndicatorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_performance_indicator_scale_value`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_performance_indicator_scale_value` (
  `PerformanceIndicatorScaleValueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PerformanceIndicatorScaleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FromValue` double NOT NULL,
  `ToValue` double NOT NULL,
  `Points` int NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PerformanceIndicatorScaleValueId`),
  KEY `performance_indicator_scale_value_scale` (`PerformanceIndicatorScaleId`),
  CONSTRAINT `performance_indicator_scale_value_scale` FOREIGN KEY (`PerformanceIndicatorScaleId`) REFERENCES `sports_performance_indicator_scale` (`PerformanceIndicatorScaleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_performance_indicator_value`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_performance_indicator_value` (
  `PerformanceIndicatorValueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PerformanceIndicatorParameterId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PerformanceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Value` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PerformanceIndicatorValueId`),
  KEY `sports_performance_indicator_value_parameter` (`PerformanceIndicatorParameterId`),
  KEY `sports_performance_indicator_value_performance` (`PerformanceId`),
  CONSTRAINT `sports_performance_indicator_value_parameter` FOREIGN KEY (`PerformanceIndicatorParameterId`) REFERENCES `sports_performance_indicator_parameter` (`PerformanceIndicatorParameterId`),
  CONSTRAINT `sports_performance_indicator_value_performance` FOREIGN KEY (`PerformanceId`) REFERENCES `sports_performance` (`PerformanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_person`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_person` (
  `EntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PrimaryAccountEAId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `AcceptedTermsAndConditions` tinyint(1) NOT NULL,
  `AcceptedTermsAndConditionsDate` datetime DEFAULT NULL,
  `ExistingSystemId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PhotoVerified` tinyint(1) DEFAULT '0',
  `PhotoVerificationCode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `WidgetPreferenceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FileKey` blob,
  `FileKeyIV` blob,
  `SubscribedToAbandonedCart` tinyint(1) DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `ZendeskUserId` int DEFAULT NULL,
  PRIMARY KEY (`EntityAttributesId`),
  KEY `cns_person_entity` (`EntityId`),
  KEY `cns_person_default_account` (`PrimaryAccountEAId`),
  KEY `cns_person_widget_preference` (`WidgetPreferenceId`),
  CONSTRAINT `cns_person_default_account` FOREIGN KEY (`PrimaryAccountEAId`) REFERENCES `sports_account` (`EntityAttributesId`),
  CONSTRAINT `cns_person_entity` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `cns_person_widget_preference` FOREIGN KEY (`WidgetPreferenceId`) REFERENCES `sports_widget_preferences` (`WidgetPreferenceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_person_licensee`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_person_licensee` (
  `SportsPersonLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `RoleName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`SportsPersonLicenseeId`),
  UNIQUE KEY `LicenseeId` (`LicenseeId`,`SportsPersonId`,`RoleName`),
  KEY `cns_sports_person_licensee_person` (`SportsPersonId`),
  KEY `cns_sports_person_licensee_role` (`RoleName`),
  CONSTRAINT `cns_sports_person_licensee_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`),
  CONSTRAINT `cns_sports_person_licensee_person` FOREIGN KEY (`SportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`),
  CONSTRAINT `cns_sports_person_licensee_role` FOREIGN KEY (`RoleName`) REFERENCES `role` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_person_reporting`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_person_reporting` (
  `SportsPersonReportingId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DailyFinancialSnapshotSubscribed` tinyint(1) NOT NULL,
  `WeeklyMarketingReportSubscribed` tinyint(1) NOT NULL,
  `WeeklyMasterLicenseePerformanceSubscribed` tinyint(1) NOT NULL,
  `WeeklyLicenseePerformanceSubscribed` tinyint(1) NOT NULL,
  `WeeklyVenuePerformanceSubscribed` tinyint(1) NOT NULL,
  `WeeklyOperatorPerformanceSubscribed` tinyint(1) NOT NULL,
  `WeeklyInstructorPerformanceSubscribed` tinyint(1) NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`SportsPersonReportingId`),
  KEY `sports_person_reporting_sp` (`SportsPersonId`),
  CONSTRAINT `sports_person_reporting_sp` FOREIGN KEY (`SportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_person_reporting_licensees`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_person_reporting_licensees` (
  `SportsPersonReportingId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SportsPersonReportingId`,`LicenseeId`),
  KEY `sports_person_reporting_licensees_fk2` (`LicenseeId`),
  CONSTRAINT `sports_person_reporting_licensees_fk1` FOREIGN KEY (`SportsPersonReportingId`) REFERENCES `sports_person_reporting` (`SportsPersonReportingId`),
  CONSTRAINT `sports_person_reporting_licensees_fk2` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_person_reporting_master_licensees`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_person_reporting_master_licensees` (
  `SportsPersonReportingId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SportsPersonReportingId`,`MasterLicenseeId`),
  KEY `sports_person_reporting_master_licensees_fk2` (`MasterLicenseeId`),
  CONSTRAINT `sports_person_reporting_master_licensees_fk1` FOREIGN KEY (`SportsPersonReportingId`) REFERENCES `sports_person_reporting` (`SportsPersonReportingId`),
  CONSTRAINT `sports_person_reporting_master_licensees_fk2` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_person_reporting_venues`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_person_reporting_venues` (
  `SportsPersonReportingId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SportsPersonReportingId`,`VenueId`),
  KEY `sports_person_reporting_venues_fk2` (`VenueId`),
  CONSTRAINT `sports_person_reporting_venues_fk1` FOREIGN KEY (`SportsPersonReportingId`) REFERENCES `sports_person_reporting` (`SportsPersonReportingId`),
  CONSTRAINT `sports_person_reporting_venues_fk2` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_policy`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_policy` (
  `PolicyId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ValidFrom` datetime NOT NULL,
  `ValidTo` datetime DEFAULT NULL,
  `SummaryTextResounceKey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PolicyTextResounceKey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PolicyId`),
  KEY `sports_policy_ml` (`MasterLicenseeId`),
  KEY `sports_policy_sk` (`SummaryTextResounceKey`),
  KEY `sports_policy_pk` (`PolicyTextResounceKey`),
  CONSTRAINT `sports_policy_ml` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_policy_pk` FOREIGN KEY (`PolicyTextResounceKey`) REFERENCES `resource_key` (`KeyName`),
  CONSTRAINT `sports_policy_sk` FOREIGN KEY (`SummaryTextResounceKey`) REFERENCES `resource_key` (`KeyName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_pool`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_pool` (
  `EntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Length` float DEFAULT NULL,
  `Width` float DEFAULT NULL,
  `DepthId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Heated` tinyint(1) DEFAULT NULL,
  `Indoor` tinyint(1) DEFAULT NULL,
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AverageTemperature` float DEFAULT '0',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EntityAttributesId`),
  KEY `FK10CF60DC77F62BCA` (`VenueId`),
  KEY `FK10CF60DCBFE1C71E` (`DepthId`),
  KEY `fk_pool_entity` (`EntityId`),
  CONSTRAINT `cns_pool_entity` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `FK10CF60DC77F62BCA` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`),
  CONSTRAINT `FK10CF60DCBFE1C71E` FOREIGN KEY (`DepthId`) REFERENCES `sports_depth` (`DepthId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_postcode_lookup_history`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_postcode_lookup_history` (
  `PostcodeLookupId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Query` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DateRequested` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `RemoteIPAddress` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RemoteHost` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Longitude` decimal(10,6) DEFAULT NULL,
  `Latitude` decimal(10,6) DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PostcodeLookupId`) USING BTREE,
  KEY `cns_postcode_lookup_history_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `cns_postcode_lookup_history_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_postcode_lookup_history_summary`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_postcode_lookup_history_summary` (
  `PostcodeLookupSummaryId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DateFrom` datetime NOT NULL,
  `DateTo` datetime NOT NULL,
  `TotalLookups` int NOT NULL,
  `ProgramReportingCategoryId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MasterLicenseeId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PostcodeLookupSummaryId`),
  KEY `sports_postcode_lookup_history_summary_ml` (`MasterLicenseeId`),
  KEY `sports_postcode_lookup_history_summary_p` (`ProgramReportingCategoryId`),
  CONSTRAINT `sports_postcode_lookup_history_summary_ml` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_postcode_lookup_history_summary_p` FOREIGN KEY (`ProgramReportingCategoryId`) REFERENCES `sports_program_reporting_category` (`ProgramReportingCategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_postcode_lookup_history_summary_group`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_postcode_lookup_history_summary_group` (
  `PostcodeLookupSummaryGroupId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TotalLookups` int NOT NULL,
  `PostcodeLookupSummaryId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PostcodeLookupSummaryGroupId`),
  KEY `sports_postcode_lookup_history_summary_group_s` (`PostcodeLookupSummaryId`),
  CONSTRAINT `sports_postcode_lookup_history_summary_group_s` FOREIGN KEY (`PostcodeLookupSummaryId`) REFERENCES `sports_postcode_lookup_history_summary` (`PostcodeLookupSummaryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_postcode_lookup_history_summary_point`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_postcode_lookup_history_summary_point` (
  `PostcodeLookupSummaryPointId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `PostcodeLookupSummaryGroupId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PostcodeLookupSummaryPointId`),
  KEY `sports_postcode_lookup_history_summary_point_g` (`PostcodeLookupSummaryGroupId`),
  CONSTRAINT `sports_postcode_lookup_history_summary_point_g` FOREIGN KEY (`PostcodeLookupSummaryGroupId`) REFERENCES `sports_postcode_lookup_history_summary_group` (`PostcodeLookupSummaryGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_postcode_lookup_summary_settings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_postcode_lookup_summary_settings` (
  `PostcodeLookupSummarySettingsId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ClusterEPS` double NOT NULL,
  `ClusterMinPoints` int NOT NULL,
  `RetainForMonths` int NOT NULL,
  `MasterLicenseeId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NextRunDate` datetime NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PostcodeLookupSummarySettingsId`),
  KEY `sports_postcode_lookup_summary_settings_ml` (`MasterLicenseeId`),
  CONSTRAINT `sports_postcode_lookup_summary_settings_ml` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_program`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_program` (
  `EntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ProgramCode` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Sequence` int DEFAULT NULL,
  `MaximumAgeInMonths` int DEFAULT NULL,
  `MinimumAgeInMonths` int DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IncludeInReports` tinyint(1) DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `ProgramReportingCategoryId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`EntityAttributesId`),
  UNIQUE KEY `ProgramCode` (`ProgramCode`),
  KEY `idxProgram_Code` (`ProgramCode`),
  KEY `fk_program_master_licensee` (`MasterLicenseeId`),
  KEY `sports_program_reporting_category` (`ProgramReportingCategoryId`),
  CONSTRAINT `fk_program_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_program_reporting_category` FOREIGN KEY (`ProgramReportingCategoryId`) REFERENCES `sports_program_reporting_category` (`ProgramReportingCategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_program_level`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_program_level` (
  `EntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sequence` int DEFAULT NULL,
  `MaximumClassDurationInMinutes` int DEFAULT NULL,
  `MaximumNumberOfStudentsPerInstructor` int DEFAULT NULL,
  `RecommendedClassDurationInMinutes` int DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LevelImageUrl` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MaxBookingAgeDifferenceInMonths` int DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `LevelDescriptionLookupKey` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`EntityAttributesId`),
  KEY `FKC45039493DB3B69F` (`ProgramId`),
  KEY `cns_program_level_image` (`LevelImageUrl`),
  KEY `sports_program_level_description` (`LevelDescriptionLookupKey`),
  CONSTRAINT `cns_program_level_image` FOREIGN KEY (`LevelImageUrl`) REFERENCES `url` (`UrlId`),
  CONSTRAINT `FKC45039493DB3B69F` FOREIGN KEY (`ProgramId`) REFERENCES `sports_program` (`EntityAttributesId`),
  CONSTRAINT `sports_program_level_description` FOREIGN KEY (`LevelDescriptionLookupKey`) REFERENCES `resource_key` (`LookupKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_program_level_finder`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_program_level_finder` (
  `ProgramLevelFinderId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ProgramLevelFinderId`),
  KEY `program_level_finder_program` (`ProgramId`),
  CONSTRAINT `program_level_finder_program` FOREIGN KEY (`ProgramId`) REFERENCES `sports_program` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_program_level_finder_answer`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_program_level_finder_answer` (
  `ProgramLevelFinderAnswerId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProgramLevelFinderQuestionId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NextProgramLevelFinderQuestionId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AnswerProgramLevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Answer` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Sequence` int NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ProgramLevelFinderAnswerId`),
  KEY `program_level_finder_finder_answer_question` (`ProgramLevelFinderQuestionId`),
  KEY `program_level_finder_finder_answer_next_question` (`NextProgramLevelFinderQuestionId`),
  KEY `program_level_finder_finder_answer_program_level` (`AnswerProgramLevelId`),
  CONSTRAINT `program_level_finder_finder_answer_next_question` FOREIGN KEY (`NextProgramLevelFinderQuestionId`) REFERENCES `sports_program_level_finder_question` (`ProgramLevelFinderQuestionId`),
  CONSTRAINT `program_level_finder_finder_answer_program_level` FOREIGN KEY (`AnswerProgramLevelId`) REFERENCES `sports_program_level` (`EntityAttributesId`),
  CONSTRAINT `program_level_finder_finder_answer_question` FOREIGN KEY (`ProgramLevelFinderQuestionId`) REFERENCES `sports_program_level_finder_question` (`ProgramLevelFinderQuestionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_program_level_finder_question`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_program_level_finder_question` (
  `ProgramLevelFinderQuestionId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProgramLevelFinderId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PreviousProgramLevelFinderQuestionId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Heading` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Question` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Sequence` int NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Summary` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ProgramLevelFinderQuestionId`),
  KEY `program_level_finder_finder` (`ProgramLevelFinderId`),
  KEY `program_level_finder_finder_previous_question` (`PreviousProgramLevelFinderQuestionId`),
  CONSTRAINT `program_level_finder_finder` FOREIGN KEY (`ProgramLevelFinderId`) REFERENCES `sports_program_level_finder` (`ProgramLevelFinderId`),
  CONSTRAINT `program_level_finder_finder_previous_question` FOREIGN KEY (`PreviousProgramLevelFinderQuestionId`) REFERENCES `sports_program_level_finder_question` (`ProgramLevelFinderQuestionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_program_level_finder_question_media`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_program_level_finder_question_media` (
  `ProgramLevelFinderQuestionId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `UrlId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ProgramLevelFinderQuestionId`,`UrlId`),
  KEY `program_level_finder_finder_media_question` (`ProgramLevelFinderQuestionId`),
  KEY `program_level_finder_finder_media_url` (`UrlId`),
  CONSTRAINT `program_level_finder_finder_media_question` FOREIGN KEY (`ProgramLevelFinderQuestionId`) REFERENCES `sports_program_level_finder_question` (`ProgramLevelFinderQuestionId`),
  CONSTRAINT `program_level_finder_finder_media_url` FOREIGN KEY (`UrlId`) REFERENCES `url` (`UrlId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_program_reporting_category`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_program_reporting_category` (
  `ProgramReportingCategoryId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `MasterLicenseeId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ProgramReportingCategoryId`),
  KEY `sports_program_reporting_category_ml` (`MasterLicenseeId`),
  CONSTRAINT `sports_program_reporting_category_ml` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_prospect`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_prospect` (
  `ProspectId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsAccountEAId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ConversionDate` datetime DEFAULT NULL,
  `ConvertedByEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ConvertedToLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProspectStatus` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProspectFirstContactDate` datetime DEFAULT NULL,
  `ProspectStatusSetDate` datetime DEFAULT NULL,
  `ConversionStatus` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LeadOwnerSportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProspectConversionLostReasonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProspectLeadSourceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProspectConversionLostCompetitorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ProspectId`) USING BTREE,
  KEY `cns_prospect_account` (`SportsAccountEAId`) USING BTREE,
  KEY `cns_prospect_converted_entity` (`ConvertedByEntityId`) USING BTREE,
  KEY `cns_prospect_licensee` (`ConvertedToLicenseeId`) USING BTREE,
  KEY `sports_prospect_lead_owner` (`LeadOwnerSportsPersonId`),
  KEY `sports_prospect_clr` (`ProspectConversionLostReasonId`),
  KEY `sports_prospect_ls` (`ProspectLeadSourceId`),
  CONSTRAINT `cns_prospect_account` FOREIGN KEY (`SportsAccountEAId`) REFERENCES `sports_account` (`EntityAttributesId`),
  CONSTRAINT `cns_prospect_converted_entity` FOREIGN KEY (`ConvertedByEntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `cns_prospect_licensee` FOREIGN KEY (`ConvertedToLicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`),
  CONSTRAINT `sports_prospect_clr` FOREIGN KEY (`ProspectConversionLostReasonId`) REFERENCES `sports_prospect_conversion_lost_reason` (`ProspectConversionLostReasonId`),
  CONSTRAINT `sports_prospect_lead_owner` FOREIGN KEY (`LeadOwnerSportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`),
  CONSTRAINT `sports_prospect_ls` FOREIGN KEY (`ProspectLeadSourceId`) REFERENCES `sports_prospect_lead_source` (`ProspectLeadSourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_prospect_conversion_lost_competitor`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_prospect_conversion_lost_competitor` (
  `ProspectConversionLostCompetitorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ProspectConversionLostCompetitorId`),
  KEY `sports_prospect_conversion_competitor_reason_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_prospect_conversion_competitor_reason_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_prospect_conversion_lost_reason`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_prospect_conversion_lost_reason` (
  `ProspectConversionLostReasonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ProspectConversionLostReasonId`),
  KEY `sports_prospect_conversion_lost_reason_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_prospect_conversion_lost_reason_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_prospect_lead_source`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_prospect_lead_source` (
  `ProspectLeadSourceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ProspectLeadSourceId`),
  KEY `sports_prospect_lead_source_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_prospect_lead_source_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_prospect_program`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_prospect_program` (
  `ProspectId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProgramId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ProspectId`,`ProgramId`),
  KEY `sports_prospect_program_program` (`ProgramId`),
  CONSTRAINT `sports_prospect_program_program` FOREIGN KEY (`ProgramId`) REFERENCES `sports_program` (`EntityAttributesId`),
  CONSTRAINT `sports_prospect_program_prospect` FOREIGN KEY (`ProspectId`) REFERENCES `sports_prospect` (`ProspectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_prospect_venue`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_prospect_venue` (
  `ProspectId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ProspectId`,`VenueId`) USING BTREE,
  KEY `cns_prospect_venue_prospect` (`ProspectId`) USING BTREE,
  KEY `cns_prospect_venue_venue` (`VenueId`) USING BTREE,
  CONSTRAINT `cns_prospect_venue_prospect` FOREIGN KEY (`ProspectId`) REFERENCES `sports_prospect` (`ProspectId`),
  CONSTRAINT `cns_prospect_venue_venue` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_push_notification_device`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_push_notification_device` (
  `PushNotificationDeviceId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsPersonId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Token` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DeviceName` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PushNotificationDeviceId`),
  KEY `sports_course_change_log_sp` (`SportsPersonId`),
  KEY `sports_notification_device_token` (`Token`(30)),
  CONSTRAINT `sports_course_change_log_sp` FOREIGN KEY (`SportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_push_notification_settings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_push_notification_settings` (
  `PushNotificationSettingsId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MasterLicenseeId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SendAfterMinutes` int NOT NULL,
  `MaxToSendPerDay` int NOT NULL,
  `LastRun` datetime DEFAULT NULL,
  `Status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PushNotificationSettingsId`),
  KEY `sports_notification_device_settings_ml` (`MasterLicenseeId`),
  CONSTRAINT `sports_notification_device_settings_ml` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_referral`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_referral` (
  `ReferralId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `AccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ReferredName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReferredPhoneNumber` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReferredTitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReferredGivenName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReferredFamilyName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReferredEmail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ConvertedAccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ConvertedByEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DateConverted` datetime DEFAULT NULL,
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ReferralId`),
  KEY `idx_sports_referral_id` (`ReferralId`),
  KEY `idx_sports_referral_account` (`AccountId`),
  KEY `fk_sports_referral_converted_account` (`ConvertedAccountId`),
  KEY `fk_sports_referral_entity` (`ConvertedByEntityId`),
  KEY `fk_sports_referral_program` (`ProgramId`),
  CONSTRAINT `fk_sports_referral_account` FOREIGN KEY (`AccountId`) REFERENCES `sports_account` (`EntityAttributesId`),
  CONSTRAINT `fk_sports_referral_converted_account` FOREIGN KEY (`ConvertedAccountId`) REFERENCES `sports_account` (`EntityAttributesId`),
  CONSTRAINT `fk_sports_referral_entity` FOREIGN KEY (`ConvertedByEntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `fk_sports_referral_program` FOREIGN KEY (`ProgramId`) REFERENCES `sports_program` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_referral_school`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_referral_school` (
  `ReferralSchoolId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SchoolName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ReferralSchoolId`),
  KEY `idx_sports_school_id` (`ReferralSchoolId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_referral_school_licensee`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_referral_school_licensee` (
  `ReferralSchoolLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ReferralSchoolId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ReferralSchoolLicenseeId`),
  UNIQUE KEY `LicenseeId` (`LicenseeId`,`ReferralSchoolId`),
  KEY `cns_referral_school_licensee_referral_school` (`ReferralSchoolId`),
  CONSTRAINT `cns_referral_school_licensee_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`),
  CONSTRAINT `cns_referral_school_licensee_referral_school` FOREIGN KEY (`ReferralSchoolId`) REFERENCES `sports_referral_school` (`ReferralSchoolId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_refund`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_refund` (
  `RefundId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `RefundReasonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Reason` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SportsAccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PaymentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FeesInvoiceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Amount` double NOT NULL,
  `Fee` double NOT NULL,
  `TotalAmount` double NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`RefundId`),
  KEY `sports_refund_reason` (`RefundReasonId`),
  KEY `sports_refund_sports_account` (`SportsAccountId`),
  KEY `sports_refund_payment` (`PaymentId`),
  KEY `sports_refund_fees_line_item` (`FeesInvoiceId`),
  CONSTRAINT `sports_refund_fees_line_item` FOREIGN KEY (`FeesInvoiceId`) REFERENCES `finance_line_item` (`LineItemId`),
  CONSTRAINT `sports_refund_payment` FOREIGN KEY (`PaymentId`) REFERENCES `finance_payment` (`PaymentId`),
  CONSTRAINT `sports_refund_reason` FOREIGN KEY (`RefundReasonId`) REFERENCES `sports_refund_reason` (`RefundReasonId`),
  CONSTRAINT `sports_refund_sports_account` FOREIGN KEY (`SportsAccountId`) REFERENCES `sports_account` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_refund_line_item`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_refund_line_item` (
  `RefundId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LineItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RefundId`,`LineItemId`),
  KEY `sports_refund_line_item_line_item` (`LineItemId`),
  CONSTRAINT `sports_refund_line_item_line_item` FOREIGN KEY (`LineItemId`) REFERENCES `finance_line_item` (`LineItemId`),
  CONSTRAINT `sports_refund_line_item_refund` FOREIGN KEY (`RefundId`) REFERENCES `sports_refund` (`RefundId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_refund_reason`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_refund_reason` (
  `RefundReasonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`RefundReasonId`),
  KEY `sports_refund_reason_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_refund_reason_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_renewal_configuration`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_renewal_configuration` (
  `RenewalConfigurationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ManualEnrolmentProfileId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AutoEnrolmentProfileId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FailedAutoEnrolmentProfileId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ManualEnrolmentNotificationStartDate` datetime DEFAULT NULL,
  `AutoEnrolmentNotificationStartDate` datetime DEFAULT NULL,
  `AutoEnrolmentTransactionDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`RenewalConfigurationId`),
  KEY `sportsrenewalconfiguration_manualprofile` (`ManualEnrolmentProfileId`),
  KEY `sportsrenewalconfiguration_autoprofile` (`AutoEnrolmentProfileId`),
  KEY `sportsrenewalconfiguration_failedautoprofile` (`FailedAutoEnrolmentProfileId`),
  CONSTRAINT `sportsrenewalconfiguration_autoprofile` FOREIGN KEY (`AutoEnrolmentProfileId`) REFERENCES `sports_enrolment_profile` (`EnrolmentProfileId`),
  CONSTRAINT `sportsrenewalconfiguration_failedautoprofile` FOREIGN KEY (`FailedAutoEnrolmentProfileId`) REFERENCES `sports_enrolment_profile` (`EnrolmentProfileId`),
  CONSTRAINT `sportsrenewalconfiguration_manualprofile` FOREIGN KEY (`ManualEnrolmentProfileId`) REFERENCES `sports_enrolment_profile` (`EnrolmentProfileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_reporting_exclusion`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_reporting_exclusion` (
  `ReportingExclusionId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `Reason` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReportingSettingsId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ReportingExclusionId`),
  KEY `sports_reporting_exclusion_settings` (`ReportingSettingsId`),
  CONSTRAINT `sports_reporting_exclusion_settings` FOREIGN KEY (`ReportingSettingsId`) REFERENCES `sports_reporting_settings` (`ReportingSettingsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_reporting_exclusion_venue`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_reporting_exclusion_venue` (
  `ReportingExclusionId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ReportingExclusionId`,`VenueId`),
  KEY `sports_reporting_exclusion_venue_venue` (`VenueId`),
  CONSTRAINT `sports_reporting_exclusion_venue_exclusion` FOREIGN KEY (`ReportingExclusionId`) REFERENCES `sports_reporting_exclusion` (`ReportingExclusionId`),
  CONSTRAINT `sports_reporting_exclusion_venue_venue` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_reporting_settings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_reporting_settings` (
  `ReportingSettingsId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LeadReportStartInterval` int DEFAULT NULL,
  `LeadReportStartPeriod` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LeadReportEndInterval` int DEFAULT NULL,
  `LeadReportEndPeriod` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TakingsStartInterval` int DEFAULT NULL,
  `TakingsStartPeriod` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TakingsEndInterval` int DEFAULT NULL,
  `TakingsEndPeriod` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ObservationStartInterval` int DEFAULT NULL,
  `ObservationStartPeriod` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ObservationEndInterval` int DEFAULT NULL,
  `ObservationEndPeriod` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TicketStartInterval` int DEFAULT NULL,
  `TicketStartPeriod` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TicketEndInterval` int DEFAULT NULL,
  `TicketEndPeriod` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ReportingSettingsId`),
  KEY `sports_reporting_settings_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_reporting_settings_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_resource_occupancy`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_resource_occupancy` (
  `ResourceOccupancyId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ResourceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VenueDocumentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DefaultProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ResourceOccupancyId`),
  KEY `sports_resource_schedule_resource` (`ResourceId`),
  KEY `sports_resource_schedule_venue_doc` (`VenueDocumentId`),
  KEY `sports_resource_occupancy_program` (`DefaultProgramId`),
  CONSTRAINT `sports_resource_occupancy_program` FOREIGN KEY (`DefaultProgramId`) REFERENCES `sports_program` (`EntityAttributesId`),
  CONSTRAINT `sports_resource_schedule_resource` FOREIGN KEY (`ResourceId`) REFERENCES `sports_pool` (`EntityAttributesId`),
  CONSTRAINT `sports_resource_schedule_venue_doc` FOREIGN KEY (`VenueDocumentId`) REFERENCES `sports_venue_document` (`VenueDocumentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_resource_occupancy_course_options`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_resource_occupancy_course_options` (
  `ResourceOccupancyCourseOptionsId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ResourceOccupancyId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NumberOfStudentsPerInstructor` int NOT NULL,
  `ClassDurationInMinutes` int NOT NULL,
  `MaximumInstructors` int NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ResourceOccupancyCourseOptionsId`),
  KEY `sports_resource_occupancy_occupancy` (`ResourceOccupancyId`),
  CONSTRAINT `sports_resource_occupancy_occupancy` FOREIGN KEY (`ResourceOccupancyId`) REFERENCES `sports_resource_occupancy` (`ResourceOccupancyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_resource_occupancy_course_options_duration`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_resource_occupancy_course_options_duration` (
  `ResourceOccupancyCourseOptionsId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ClassDurationInMinutes` int NOT NULL,
  PRIMARY KEY (`ResourceOccupancyCourseOptionsId`,`ClassDurationInMinutes`),
  CONSTRAINT `sports_resource_occupancy_course_options_duraton_co` FOREIGN KEY (`ResourceOccupancyCourseOptionsId`) REFERENCES `sports_resource_occupancy_course_options` (`ResourceOccupancyCourseOptionsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_resource_occupancy_course_options_program`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_resource_occupancy_course_options_program` (
  `ResourceOccupancyCourseOptionsId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ResourceOccupancyCourseOptionsId`,`ProgramId`),
  KEY `sports_resource_availability_program_program` (`ProgramId`),
  CONSTRAINT `sports_resource_availability_program_availability` FOREIGN KEY (`ResourceOccupancyCourseOptionsId`) REFERENCES `sports_resource_occupancy_course_options` (`ResourceOccupancyCourseOptionsId`),
  CONSTRAINT `sports_resource_availability_program_program` FOREIGN KEY (`ProgramId`) REFERENCES `sports_program` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_resource_occupancy_course_options_student_ratio`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_resource_occupancy_course_options_student_ratio` (
  `ResourceOccupancyCourseOptionsId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NumberOfStudentsPerInstructor` int NOT NULL,
  PRIMARY KEY (`ResourceOccupancyCourseOptionsId`,`NumberOfStudentsPerInstructor`),
  CONSTRAINT `sports_resource_occupancy_course_options_ratio_co` FOREIGN KEY (`ResourceOccupancyCourseOptionsId`) REFERENCES `sports_resource_occupancy_course_options` (`ResourceOccupancyCourseOptionsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_resource_occupancy_schedule`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_resource_occupancy_schedule` (
  `ResourceOccupancyId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ScheduleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ResourceOccupancyId`,`ScheduleId`),
  KEY `sports_resource_occupancy_schedule_schedule` (`ScheduleId`),
  CONSTRAINT `sports_resource_occupancy_schedule_occupancy` FOREIGN KEY (`ResourceOccupancyId`) REFERENCES `sports_resource_occupancy` (`ResourceOccupancyId`),
  CONSTRAINT `sports_resource_occupancy_schedule_schedule` FOREIGN KEY (`ScheduleId`) REFERENCES `schedule` (`ScheduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_revenue_band`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_revenue_band` (
  `RevenueBandId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `BandName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Type` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Value` double NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `BookingTypes` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EnrolmentTypes` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NumberOfStudentsPerInstructor` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClassDurationInMinutes` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`RevenueBandId`),
  KEY `sports_instructor_revenue_band_licensee` (`LicenseeId`),
  CONSTRAINT `sports_instructor_revenue_band_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_revenue_band_override`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_revenue_band_override` (
  `RevenueBandOverrideId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Type` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Value` double NOT NULL,
  `RevenueBandId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `InstructorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FromDate` datetime NOT NULL,
  `ToDate` datetime DEFAULT NULL,
  `Status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`RevenueBandOverrideId`),
  KEY `sports_instructor_revenue_band_override_revenue_band` (`RevenueBandId`),
  KEY `sports_instructor_revenue_band_override_revenue_instructor` (`InstructorId`),
  CONSTRAINT `sports_instructor_revenue_band_override_revenue_band` FOREIGN KEY (`RevenueBandId`) REFERENCES `sports_revenue_band` (`RevenueBandId`),
  CONSTRAINT `sports_instructor_revenue_band_override_revenue_instructor` FOREIGN KEY (`InstructorId`) REFERENCES `sports_instructor` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_revenue_band_program`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_revenue_band_program` (
  `RevenueBandId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RevenueBandId`,`ProgramId`),
  KEY `sports_revenue_band_program_program` (`ProgramId`),
  CONSTRAINT `sports_revenue_band_program_program` FOREIGN KEY (`ProgramId`) REFERENCES `sports_program` (`EntityAttributesId`),
  CONSTRAINT `sports_revenue_band_program_revenue_band` FOREIGN KEY (`RevenueBandId`) REFERENCES `sports_revenue_band` (`RevenueBandId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_revenue_band_schedule`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_revenue_band_schedule` (
  `RevenueBandId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ScheduleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RevenueBandId`,`ScheduleId`),
  KEY `sports_revenue_band_schedule_schedule` (`ScheduleId`),
  CONSTRAINT `sports_revenue_band_schedule_revenue_band` FOREIGN KEY (`RevenueBandId`) REFERENCES `sports_revenue_band` (`RevenueBandId`),
  CONSTRAINT `sports_revenue_band_schedule_schedule` FOREIGN KEY (`ScheduleId`) REFERENCES `schedule` (`ScheduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_revenue_band_venue`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_revenue_band_venue` (
  `RevenueBandId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RevenueBandId`,`VenueId`),
  KEY `sports_revenue_band_venue_schedule` (`VenueId`),
  CONSTRAINT `sports_revenue_band_venue_revenue_band` FOREIGN KEY (`RevenueBandId`) REFERENCES `sports_revenue_band` (`RevenueBandId`),
  CONSTRAINT `sports_revenue_band_venue_schedule` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_sms`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_sms` (
  `SMSId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsAccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MobileNumber` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Message` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DateSent` datetime NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `ResultId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ErrorCode` int DEFAULT NULL,
  `ErrorMessage` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SMSId`),
  UNIQUE KEY `sports_sms_result` (`ResultId`),
  KEY `cns_sports_sms_account` (`SportsAccountId`),
  CONSTRAINT `cns_sports_sms_account` FOREIGN KEY (`SportsAccountId`) REFERENCES `sports_account` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_sms_configuration`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_sms_configuration` (
  `SMSConfigurationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `APIKey` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ServiceRunning` tinyint(1) NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `APIToken` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FromNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SMSConfigurationId`),
  KEY `sports_sms_configuration_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_sms_configuration_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_staff_survey`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_staff_survey` (
  `StaffSurveyId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FeedbackId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailAddress` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DateSent` datetime NOT NULL,
  `SportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FeedbackCampaignId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SportsAccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DateResent` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`StaffSurveyId`),
  KEY `sports_staff_survey_feedback` (`FeedbackId`),
  KEY `sports_staff_survey_sp` (`SportsPersonId`),
  KEY `sports_staff_survey_fc` (`FeedbackCampaignId`),
  KEY `sports_staff_survey_sa` (`SportsAccountId`),
  CONSTRAINT `sports_staff_survey_fc` FOREIGN KEY (`FeedbackCampaignId`) REFERENCES `sports_feedback_campaign` (`FeedbackCampaignId`),
  CONSTRAINT `sports_staff_survey_feedback` FOREIGN KEY (`FeedbackId`) REFERENCES `sports_feedback` (`FeedbackId`),
  CONSTRAINT `sports_staff_survey_sa` FOREIGN KEY (`SportsAccountId`) REFERENCES `sports_account` (`EntityAttributesId`),
  CONSTRAINT `sports_staff_survey_sp` FOREIGN KEY (`SportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_staff_survey_configuration`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_staff_survey_configuration` (
  `StaffSurveyConfigurationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MaximumSurveysPerWeek` int NOT NULL,
  `MinimumDaysActive` int NOT NULL,
  `SurveyPeriodDays` int NOT NULL,
  `FeedbackCampaignId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SurveyResendDays` int DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`StaffSurveyConfigurationId`),
  KEY `sports_staff_survey_configuration_ml` (`MasterLicenseeId`),
  KEY `sports_staff_survey_configuration_fc` (`FeedbackCampaignId`),
  CONSTRAINT `sports_staff_survey_configuration_fc` FOREIGN KEY (`FeedbackCampaignId`) REFERENCES `sports_feedback_campaign` (`FeedbackCampaignId`),
  CONSTRAINT `sports_staff_survey_configuration_ml` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_staff_survey_configuration_role`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_staff_survey_configuration_role` (
  `StaffSurveyConfigurationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `RoleName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`StaffSurveyConfigurationId`,`RoleName`),
  KEY `sports_staff_survey_configuration_role_r` (`RoleName`),
  CONSTRAINT `sports_staff_survey_configuration_role_cr` FOREIGN KEY (`StaffSurveyConfigurationId`) REFERENCES `sports_staff_survey_configuration` (`StaffSurveyConfigurationId`),
  CONSTRAINT `sports_staff_survey_configuration_role_r` FOREIGN KEY (`RoleName`) REFERENCES `role` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_student`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_student` (
  `EntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `LevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StartLevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AttendedBooking` bit(1) DEFAULT NULL,
  `BookableEntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParentGardian1Relationship` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParentGardian2Relationship` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EntityAttributesId`),
  KEY `FKDC66017B67616B9F` (`LevelId`),
  KEY `fk_student_entity` (`EntityId`),
  KEY `cns_student_bookable` (`BookableEntityId`),
  KEY `cns_student_start_level_id` (`StartLevelId`) USING BTREE,
  CONSTRAINT `cns_student_bookable` FOREIGN KEY (`BookableEntityId`) REFERENCES `sports_bookable_entity` (`BookableEntityId`),
  CONSTRAINT `cns_student_entity` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `cns_student_start_level_id` FOREIGN KEY (`StartLevelId`) REFERENCES `sports_program_level` (`EntityAttributesId`),
  CONSTRAINT `FKDC66017B67616B9F` FOREIGN KEY (`LevelId`) REFERENCES `sports_program_level` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_student_alert`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_student_alert` (
  `StudentAlertId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `StudentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DateReported` datetime DEFAULT NULL,
  `DateExpires` datetime DEFAULT NULL,
  `Status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TicketId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StudentAlertConfigurationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsAccountId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AlertStatusSetBySportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AlertStatusSetDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`StudentAlertId`),
  KEY `sports_student_alert_student` (`StudentId`),
  KEY `sports_student_alert_ticket` (`TicketId`),
  KEY `sports_student_alert_configuration` (`StudentAlertConfigurationId`),
  KEY `sports_student_alert_account` (`SportsAccountId`),
  KEY `sports_student_alert_sp` (`AlertStatusSetBySportsPersonId`),
  CONSTRAINT `sports_student_alert_account` FOREIGN KEY (`SportsAccountId`) REFERENCES `sports_account` (`EntityAttributesId`),
  CONSTRAINT `sports_student_alert_configuration` FOREIGN KEY (`StudentAlertConfigurationId`) REFERENCES `sports_student_alert_configuration` (`StudentAlertConfigurationId`),
  CONSTRAINT `sports_student_alert_sp` FOREIGN KEY (`AlertStatusSetBySportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`),
  CONSTRAINT `sports_student_alert_student` FOREIGN KEY (`StudentId`) REFERENCES `sports_student` (`EntityAttributesId`),
  CONSTRAINT `sports_student_alert_ticket` FOREIGN KEY (`TicketId`) REFERENCES `sports_ticket` (`TicketId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_student_alert_alarm`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_student_alert_alarm` (
  `StudentAlertAlarmId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `StudentAlertId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `Value` int NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`StudentAlertAlarmId`),
  KEY `sports_student_alert_alarm_alert` (`StudentAlertId`),
  CONSTRAINT `sports_student_alert_alarm_alert` FOREIGN KEY (`StudentAlertId`) REFERENCES `sports_student_alert` (`StudentAlertId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_student_alert_configuration`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_student_alert_configuration` (
  `StudentAlertConfigurationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `InstructorChangesDatePeriodDays` int DEFAULT NULL,
  `MaximumNumberOfInstructors` int DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExpiryDays` int DEFAULT NULL,
  `ClassCancellationDatePeriodDays` int DEFAULT NULL,
  `MaximumNumberOfCancellations` int DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`StudentAlertConfigurationId`),
  KEY `sports_student_alert_configuration_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_student_alert_configuration_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_student_credit_pack`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_student_credit_pack` (
  `SportsStudentCreditPackId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `StudentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PurchaseDate` datetime NOT NULL,
  `ExpiryDate` datetime NOT NULL,
  `LineItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsCreditPackId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LastLessonEmailDateSent` datetime DEFAULT NULL,
  `ExpiryReminderEmailSent` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`SportsStudentCreditPackId`),
  KEY `sports_student_credit_pack_student` (`StudentId`),
  KEY `sports_student_credit_pack_credit_pack` (`SportsCreditPackId`),
  CONSTRAINT `sports_student_credit_pack_credit_pack` FOREIGN KEY (`SportsCreditPackId`) REFERENCES `sports_credit_pack` (`SportsCreditPackId`),
  CONSTRAINT `sports_student_credit_pack_student` FOREIGN KEY (`StudentId`) REFERENCES `sports_student` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_student_credit_pack_credit`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_student_credit_pack_credit` (
  `SportsStudentCreditPackId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsCreditId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SportsStudentCreditPackId`,`SportsCreditId`),
  KEY `sports_student_credit_pack_credit_credit` (`SportsCreditId`),
  CONSTRAINT `sports_student_credit_pack_credit_credit` FOREIGN KEY (`SportsCreditId`) REFERENCES `sports_credit` (`SportsCreditId`),
  CONSTRAINT `sports_student_credit_pack_credit_credit_pack` FOREIGN KEY (`SportsStudentCreditPackId`) REFERENCES `sports_student_credit_pack` (`SportsStudentCreditPackId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_student_level`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_student_level` (
  `StudentLevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `StudentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StartLevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `VerifiedInstructorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VerifiedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`StudentLevelId`) USING BTREE,
  KEY `cns_student_level_student` (`StudentId`) USING BTREE,
  KEY `cns_student_level_level` (`LevelId`) USING BTREE,
  KEY `cns_student_level_start_level` (`StartLevelId`) USING BTREE,
  KEY `cns_student_level_program` (`ProgramId`) USING BTREE,
  KEY `cns_student_level_instructor` (`VerifiedInstructorId`),
  CONSTRAINT `cns_student_level_instructor` FOREIGN KEY (`VerifiedInstructorId`) REFERENCES `sports_instructor` (`EntityAttributesId`),
  CONSTRAINT `cns_student_level_level` FOREIGN KEY (`LevelId`) REFERENCES `sports_program_level` (`EntityAttributesId`),
  CONSTRAINT `cns_student_level_program` FOREIGN KEY (`ProgramId`) REFERENCES `sports_program` (`EntityAttributesId`),
  CONSTRAINT `cns_student_level_start_level` FOREIGN KEY (`StartLevelId`) REFERENCES `sports_program_level` (`EntityAttributesId`),
  CONSTRAINT `cns_student_level_student` FOREIGN KEY (`StudentId`) REFERENCES `sports_student` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_student_numbers_tier`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_student_numbers_tier` (
  `StudentNumbersTierId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MinimumStudents` int NOT NULL,
  `MaximumStudents` int NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sequence` int NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`StudentNumbersTierId`),
  KEY `sports_student_numbers_tier_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_student_numbers_tier_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_system`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_system` (
  `SystemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`SystemId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_system_message`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_system_message` (
  `SystemMessageId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Message` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `StartDate` timestamp NULL DEFAULT NULL,
  `EndDate` timestamp NULL DEFAULT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsUrgent` tinyint(1) NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `SystemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`SystemMessageId`),
  KEY `sports_system_message_master_licensee` (`MasterLicenseeId`),
  KEY `sports_system_message_system` (`SystemId`),
  CONSTRAINT `sports_system_message_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_system_message_system` FOREIGN KEY (`SystemId`) REFERENCES `sports_system` (`SystemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_system_message_roles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_system_message_roles` (
  `SystemMessageId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `RoleName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SystemMessageId`,`RoleName`),
  KEY `sports_system_message_roles_role` (`RoleName`),
  CONSTRAINT `sports_system_message_roles_role` FOREIGN KEY (`RoleName`) REFERENCES `role` (`name`),
  CONSTRAINT `sports_system_message_roles_system_message` FOREIGN KEY (`SystemMessageId`) REFERENCES `sports_system_message` (`SystemMessageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_target`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_target` (
  `TargetId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `Target` double NOT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TargetType` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `SearchType` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TermId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OperatorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TargetId`),
  KEY `sports_target_licensee` (`LicenseeId`),
  KEY `sports_target_program` (`ProgramId`),
  KEY `sports_target_venue` (`VenueId`),
  KEY `sports_target_term` (`TermId`),
  KEY `sports_target_operator` (`OperatorId`),
  CONSTRAINT `sports_target_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`),
  CONSTRAINT `sports_target_operator` FOREIGN KEY (`OperatorId`) REFERENCES `sports_operator` (`EntityAttributesId`),
  CONSTRAINT `sports_target_program` FOREIGN KEY (`ProgramId`) REFERENCES `sports_program` (`EntityAttributesId`),
  CONSTRAINT `sports_target_term` FOREIGN KEY (`TermId`) REFERENCES `sports_term` (`TermId`),
  CONSTRAINT `sports_target_venue` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_term`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_term` (
  `TermId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ScheduleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `BookingPeriodStart` datetime DEFAULT NULL,
  `BookingPeriodEnd` datetime DEFAULT NULL,
  `ReenrolPeriodStart` datetime DEFAULT NULL,
  `ReenrolPeriodEnd` datetime DEFAULT NULL,
  `ProvisionalsCleared` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `TermType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TermId`),
  UNIQUE KEY `ScheduleId` (`ScheduleId`),
  KEY `fk_term_schedule` (`ScheduleId`),
  KEY `cns_sports_term_licensee` (`LicenseeId`),
  CONSTRAINT `cns_sports_term_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`),
  CONSTRAINT `cns_term_schedule` FOREIGN KEY (`ScheduleId`) REFERENCES `schedule` (`ScheduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_ticket`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_ticket` (
  `TicketId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Priority` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TicketReference` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CRMItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CampaignId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CampaignStatus` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CallbackDate` datetime DEFAULT NULL,
  `ActionDate` datetime NOT NULL,
  `InititalDueDate` datetime DEFAULT NULL,
  `CloseMinutes` int DEFAULT NULL,
  `CloseOnAcknowledgement` tinyint(1) DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `InstructorSurveyId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CallIdentifier` int DEFAULT NULL,
  PRIMARY KEY (`TicketId`),
  UNIQUE KEY `sports_ticket_reference` (`TicketReference`),
  KEY `sports_ticket_crm_item` (`CRMItemId`),
  KEY `sports_ticket_campaign` (`CampaignId`),
  KEY `sports_ticket_is` (`InstructorSurveyId`),
  CONSTRAINT `sports_ticket_campaign` FOREIGN KEY (`CampaignId`) REFERENCES `sports_campaign` (`CampaignId`),
  CONSTRAINT `sports_ticket_crm_item` FOREIGN KEY (`CRMItemId`) REFERENCES `knowit_crmitem` (`CRMItemId`),
  CONSTRAINT `sports_ticket_is` FOREIGN KEY (`InstructorSurveyId`) REFERENCES `sports_instructor_survey` (`InstructorSurveyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_ticket_communication`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_ticket_communication` (
  `TicketCommunicationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Direction` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TicketId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NoteId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `EmailFromAddress` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailFromName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailSubject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailSendDate` datetime DEFAULT NULL,
  `EmailToAddress` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailToName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Acknowledged` tinyint(1) DEFAULT NULL,
  `AcknowledgementExpiry` datetime DEFAULT NULL,
  `DateAcknowledged` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TicketCommunicationId`),
  KEY `sports_ticket_note` (`NoteId`),
  KEY `sports_ticket_communication_ticket` (`TicketId`),
  KEY `sports_ticket_communication_ad` (`AcknowledgementExpiry`),
  CONSTRAINT `sports_ticket_communication_ticket` FOREIGN KEY (`TicketId`) REFERENCES `sports_ticket` (`TicketId`),
  CONSTRAINT `sports_ticket_note` FOREIGN KEY (`NoteId`) REFERENCES `note` (`NoteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_ticket_communication_method`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_ticket_communication_method` (
  `NoteMethodLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NoteMethodId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IncludeInCalloutReport` tinyint(1) DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`NoteMethodLicenseeId`),
  UNIQUE KEY `LicenseeId` (`LicenseeId`,`NoteMethodId`),
  KEY `cns_note_method_licensee_note_method` (`NoteMethodId`),
  KEY `cns_note_method_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `cns_note_method_licensee_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`),
  CONSTRAINT `cns_note_method_licensee_note_method` FOREIGN KEY (`NoteMethodId`) REFERENCES `note_method` (`NoteMethodId`),
  CONSTRAINT `cns_note_method_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_ticket_communication_system_note`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_ticket_communication_system_note` (
  `TicketCommunicationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NoteId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`TicketCommunicationId`,`NoteId`),
  KEY `sports_communication_system_note` (`NoteId`),
  CONSTRAINT `sports_communication_system_note` FOREIGN KEY (`NoteId`) REFERENCES `note` (`NoteId`),
  CONSTRAINT `sports_communication_ticket_communication` FOREIGN KEY (`TicketCommunicationId`) REFERENCES `sports_ticket_communication` (`TicketCommunicationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_ticket_communication_touch_point`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_ticket_communication_touch_point` (
  `TicketCommunicationTouchPointId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TicketTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NoteMethodLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `UpdateCommunicationMinutes` int DEFAULT NULL,
  `AlertMinutes` int DEFAULT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TicketCommunicationTouchPointId`),
  KEY `sports_ticket_communication_touch_point_tt` (`TicketTypeId`),
  KEY `sports_ticket_communication_touch_point_nm` (`NoteMethodLicenseeId`),
  CONSTRAINT `sports_ticket_communication_touch_point_nm` FOREIGN KEY (`NoteMethodLicenseeId`) REFERENCES `sports_ticket_communication_method` (`NoteMethodLicenseeId`),
  CONSTRAINT `sports_ticket_communication_touch_point_tt` FOREIGN KEY (`TicketTypeId`) REFERENCES `sports_ticket_type` (`TicketTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_ticket_communication_url`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_ticket_communication_url` (
  `TicketCommunicationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `UrlId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`TicketCommunicationId`,`UrlId`),
  KEY `sports_communication_ticket_url` (`UrlId`),
  CONSTRAINT `sports_communication_ticket_url` FOREIGN KEY (`UrlId`) REFERENCES `url` (`UrlId`),
  CONSTRAINT `sports_ticket_communication_ticket_ticket` FOREIGN KEY (`TicketCommunicationId`) REFERENCES `sports_ticket_communication` (`TicketCommunicationId`),
  CONSTRAINT `sports_ticket_communication_ticket_ticket_fk1` FOREIGN KEY (`TicketCommunicationId`) REFERENCES `sports_ticket_communication` (`TicketCommunicationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_ticket_person`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_ticket_person` (
  `TicketId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`TicketId`,`SportsPersonId`),
  KEY `sports_ticket_sports_person` (`SportsPersonId`),
  CONSTRAINT `sports_ticket_sports_person` FOREIGN KEY (`SportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`),
  CONSTRAINT `sports_ticket_ticket` FOREIGN KEY (`TicketId`) REFERENCES `sports_ticket` (`TicketId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_ticket_reference_ticket`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_ticket_reference_ticket` (
  `TicketId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ReferenceTicketId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`TicketId`,`ReferenceTicketId`),
  KEY `sports_ticket_reference_ticket` (`ReferenceTicketId`),
  CONSTRAINT `sports_ticket_reference_ticket` FOREIGN KEY (`ReferenceTicketId`) REFERENCES `sports_ticket` (`TicketId`),
  CONSTRAINT `sports_ticket_reference_ticket_ticket` FOREIGN KEY (`TicketId`) REFERENCES `sports_ticket` (`TicketId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_ticket_touch_point`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_ticket_touch_point` (
  `TicketTouchPointId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TicketId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TicketCommunicationTouchPointId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DueDate` datetime NOT NULL,
  `AlertDue` datetime DEFAULT NULL,
  `SportsAccountAlertId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdateCommunicationMinutes` int DEFAULT NULL,
  `TicketCommunicationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AlertCancelledReason` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AlertActive` tinyint(1) NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TicketTouchPointId`),
  KEY `sports_ticket_touch_point_t` (`TicketId`),
  KEY `sports_ticket_touch_point_tp` (`TicketCommunicationTouchPointId`),
  KEY `sports_ticket_touch_point_tc` (`TicketCommunicationId`),
  CONSTRAINT `sports_ticket_touch_point_t` FOREIGN KEY (`TicketId`) REFERENCES `sports_ticket` (`TicketId`),
  CONSTRAINT `sports_ticket_touch_point_tc` FOREIGN KEY (`TicketCommunicationId`) REFERENCES `sports_ticket_communication` (`TicketCommunicationId`),
  CONSTRAINT `sports_ticket_touch_point_tp` FOREIGN KEY (`TicketCommunicationTouchPointId`) REFERENCES `sports_ticket_communication_touch_point` (`TicketCommunicationTouchPointId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_ticket_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_ticket_type` (
  `TicketTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CRMTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CloseSLAMinutes` int DEFAULT NULL,
  `EnforceSLADueDate` tinyint(1) DEFAULT NULL,
  `LeadStatus` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TicketTypeCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowOnline` tinyint(1) DEFAULT NULL,
  `OnlineDescription` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TicketTypeId`),
  UNIQUE KEY `LicenseeId` (`LicenseeId`,`CRMTypeId`),
  KEY `cns_crm_item_type_licensee_crm_item_type` (`CRMTypeId`),
  KEY `sports_ticket_type_ttc` (`TicketTypeCategoryId`),
  CONSTRAINT `cns_crm_item_type_licensee_crm_item_type` FOREIGN KEY (`CRMTypeId`) REFERENCES `knowit_crmitemtype` (`CRMTypeId`),
  CONSTRAINT `cns_crm_item_type_licensee_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`),
  CONSTRAINT `sports_ticket_type_ttc` FOREIGN KEY (`TicketTypeCategoryId`) REFERENCES `sports_ticket_type_category` (`TicketTypeCategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_ticket_type_category`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_ticket_type_category` (
  `TicketTypeCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TicketTypeCategoryId`),
  KEY `sports_ticket_type_category_ml` (`MasterLicenseeId`),
  CONSTRAINT `sports_ticket_type_category_ml` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_training_compliance_profile`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_training_compliance_profile` (
  `ComplianceProfileId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CrbRequired` tinyint(1) DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ComplianceProfileId`),
  KEY `sports_training_compliance_profile_ml` (`MasterLicenseeId`),
  CONSTRAINT `sports_training_compliance_profile_ml` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_training_compliance_profile_program`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_training_compliance_profile_program` (
  `ComplianceProfileId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ComplianceProfileId`,`ProgramId`),
  KEY `sports_training_compliance_profile_program_p` (`ProgramId`),
  CONSTRAINT `sports_training_compliance_profile_program_co` FOREIGN KEY (`ComplianceProfileId`) REFERENCES `sports_training_compliance_profile` (`ComplianceProfileId`),
  CONSTRAINT `sports_training_compliance_profile_program_p` FOREIGN KEY (`ProgramId`) REFERENCES `sports_program` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_training_compliance_profile_qualification_group`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_training_compliance_profile_qualification_group` (
  `ComplianceProfileQualificationGroupId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ComplianceProfileId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ComplianceProfileQualificationGroupId`),
  KEY `sports_training_compliance_profile_qualification_group_cp` (`ComplianceProfileId`),
  CONSTRAINT `sports_training_compliance_profile_qualification_group_cp` FOREIGN KEY (`ComplianceProfileId`) REFERENCES `sports_training_compliance_profile` (`ComplianceProfileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_training_compliance_profile_qualification_group_course`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_training_compliance_profile_qualification_group_course` (
  `ComplianceProfileQualificationGroupId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `QualficationCourseId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ComplianceProfileQualificationGroupId`,`QualficationCourseId`),
  KEY `sports_training_compliance_profile_qqc_qc` (`QualficationCourseId`),
  CONSTRAINT `sports_training_compliance_profile_qqc_qc` FOREIGN KEY (`QualficationCourseId`) REFERENCES `sports_training_qualification_course` (`QualificationCourseId`),
  CONSTRAINT `sports_training_cpqg_course_qcg` FOREIGN KEY (`ComplianceProfileQualificationGroupId`) REFERENCES `sports_training_compliance_profile_qualification_group` (`ComplianceProfileQualificationGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_training_cpd`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_training_cpd` (
  `CPDId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CompletedMaxPoints` int DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `AttendanceMaxPoints` int NOT NULL,
  `MonthsValid` int NOT NULL,
  `CPDTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsCompulsory` tinyint(1) NOT NULL,
  `MaximumCompletionMonths` int DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CPDId`) USING BTREE,
  KEY `cns_cpd_cpd_type` (`CPDTypeId`),
  CONSTRAINT `cns_cpd_cpd_type` FOREIGN KEY (`CPDTypeId`) REFERENCES `sports_training_cpd_type` (`CPDTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_training_cpd_category`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_training_cpd_category` (
  `CPDCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MinimumPointsRequired` int NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Active` tinyint(1) NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CPDCategoryId`) USING BTREE,
  KEY `cns_cpd_category_master_licensee` (`ProgramId`),
  CONSTRAINT `cns_cpd_category_program` FOREIGN KEY (`ProgramId`) REFERENCES `sports_program` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_training_cpd_completed`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_training_cpd_completed` (
  `CPDCompletedId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `InstructorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CPDId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IssueDate` datetime NOT NULL,
  `CompletionPointsObtained` int NOT NULL,
  `Passed` tinyint(1) NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `AttendancePointsObtained` int NOT NULL,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CPDCompletedId`),
  KEY `cns_instructor_cpd_person` (`InstructorId`),
  KEY `cns_instructor_cpd_type` (`CPDId`),
  CONSTRAINT `cns_cpd_completed_cpd` FOREIGN KEY (`CPDId`) REFERENCES `sports_training_cpd` (`CPDId`),
  CONSTRAINT `cns_cpd_completed_instructor` FOREIGN KEY (`InstructorId`) REFERENCES `sports_instructor` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_training_cpd_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_training_cpd_type` (
  `CPDTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CPDTypeId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_training_crb`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_training_crb` (
  `CRBId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CRBNumber` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `IssuingEmployer` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CRBResultId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CRBId`) USING BTREE,
  KEY `cns_instructor_crb_instructor` (`SportsPersonId`),
  KEY `cns_crb_crb_result` (`CRBResultId`),
  CONSTRAINT `cns_crb_crb_result` FOREIGN KEY (`CRBResultId`) REFERENCES `sports_training_crb_result` (`CRBResultId`),
  CONSTRAINT `cns_instructor_crb_person` FOREIGN KEY (`SportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_training_crb_result`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_training_crb_result` (
  `CRBResultId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CRBResultId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_training_document`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_training_document` (
  `TrainingDocumentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TrainingDocumentCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DocumentName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DocumentMimeType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FileName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Type` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LandingTrainingDocumentPageId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `showOnLogin` tinyint NOT NULL DEFAULT '0',
  `showOnLoginFrom` datetime DEFAULT NULL,
  `showOnLoginTo` datetime DEFAULT NULL,
  `RequiresAcceptance` tinyint NOT NULL DEFAULT '0',
  `ScormLandingPage` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DateSetInactive` datetime DEFAULT NULL,
  PRIMARY KEY (`TrainingDocumentId`),
  KEY `sports_training_document_c` (`TrainingDocumentCategoryId`),
  KEY `sports_training_document_tdp` (`LandingTrainingDocumentPageId`),
  CONSTRAINT `sports_training_document_c` FOREIGN KEY (`TrainingDocumentCategoryId`) REFERENCES `sports_training_document_category` (`TrainingDocumentCategoryId`),
  CONSTRAINT `sports_training_document_tdp` FOREIGN KEY (`LandingTrainingDocumentPageId`) REFERENCES `sports_training_document_page` (`TrainingDocumentPageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_training_document_category`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_training_document_category` (
  `TrainingDocumentCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `FilterLicensees` tinyint(1) NOT NULL,
  `FilterVenues` tinyint(1) NOT NULL,
  `FilterPrograms` tinyint(1) NOT NULL,
  PRIMARY KEY (`TrainingDocumentCategoryId`),
  KEY `sports_training_document_category_ml` (`MasterLicenseeId`),
  CONSTRAINT `sports_training_document_category_ml` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_training_document_category_licensee`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_training_document_category_licensee` (
  `TrainingDocumentCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`TrainingDocumentCategoryId`,`LicenseeId`),
  KEY `sports_training_document_category_licensee_l` (`LicenseeId`),
  CONSTRAINT `sports_training_document_category_licensee_l` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`),
  CONSTRAINT `sports_training_document_category_licensee_tc` FOREIGN KEY (`TrainingDocumentCategoryId`) REFERENCES `sports_training_document_category` (`TrainingDocumentCategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_training_document_category_program`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_training_document_category_program` (
  `TrainingDocumentCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`TrainingDocumentCategoryId`,`ProgramId`),
  KEY `sports_training_document_category_program_p` (`ProgramId`),
  CONSTRAINT `sports_training_document_category_program_p` FOREIGN KEY (`ProgramId`) REFERENCES `sports_program` (`EntityAttributesId`),
  CONSTRAINT `sports_training_document_category_program_tc` FOREIGN KEY (`TrainingDocumentCategoryId`) REFERENCES `sports_training_document_category` (`TrainingDocumentCategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_training_document_category_role`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_training_document_category_role` (
  `TrainingDocumentCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `RoleName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`TrainingDocumentCategoryId`,`RoleName`),
  KEY `sports_training_document_category_role_role` (`RoleName`),
  CONSTRAINT `sports_training_document_category_role_c` FOREIGN KEY (`TrainingDocumentCategoryId`) REFERENCES `sports_training_document_category` (`TrainingDocumentCategoryId`),
  CONSTRAINT `sports_training_document_category_role_role` FOREIGN KEY (`RoleName`) REFERENCES `role` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_training_document_category_venue`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_training_document_category_venue` (
  `TrainingDocumentCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`TrainingDocumentCategoryId`,`VenueId`),
  KEY `sports_training_document_category_venue_v` (`VenueId`),
  CONSTRAINT `sports_training_document_category_venue_tc` FOREIGN KEY (`TrainingDocumentCategoryId`) REFERENCES `sports_training_document_category` (`TrainingDocumentCategoryId`),
  CONSTRAINT `sports_training_document_category_venue_v` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_training_document_page`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_training_document_page` (
  `TrainingDocumentPageId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TrainingDocumentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `HtmlSource` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`TrainingDocumentPageId`),
  KEY `sports_training_document_page_td` (`TrainingDocumentId`),
  CONSTRAINT `sports_training_document_page_td` FOREIGN KEY (`TrainingDocumentId`) REFERENCES `sports_training_document` (`TrainingDocumentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_training_document_request`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_training_document_request` (
  `TrainingDocumentRequestId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TrainingDocumentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DateRequested` datetime NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `IPAddress` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RequestType` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`TrainingDocumentRequestId`),
  KEY `sports_training_document_request_td` (`TrainingDocumentId`),
  KEY `sports_training_document_request_sp` (`SportsPersonId`),
  CONSTRAINT `sports_training_document_request_sp` FOREIGN KEY (`SportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`),
  CONSTRAINT `sports_training_document_request_td` FOREIGN KEY (`TrainingDocumentId`) REFERENCES `sports_training_document` (`TrainingDocumentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_training_identification`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_training_identification` (
  `IdentificationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdentificationTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NationalityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VisaRequired` tinyint(1) NOT NULL,
  `IdentificationNumber` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `DocumentName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VerificationStatus` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`IdentificationId`) USING BTREE,
  KEY `cns_instructor_identification_nationality` (`NationalityId`),
  KEY `cns_instructor_identification_instructor` (`SportsPersonId`),
  KEY `cns_instructor_identification_type` (`IdentificationTypeId`),
  CONSTRAINT `cns_instructor_identification_instructor` FOREIGN KEY (`SportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`),
  CONSTRAINT `cns_instructor_identification_nationality` FOREIGN KEY (`NationalityId`) REFERENCES `sports_nationality` (`NationalityId`),
  CONSTRAINT `cns_instructor_identification_type` FOREIGN KEY (`IdentificationTypeId`) REFERENCES `sports_training_identification_type` (`IdentificationTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_training_identification_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_training_identification_type` (
  `IdentificationTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`IdentificationTypeId`) USING BTREE,
  KEY `cns_identification_type_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `cns_identification_type_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_training_qualification`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_training_qualification` (
  `QualificationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `QualificationCourseId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DocumentNumber` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IssueDate` datetime NOT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `DocumentName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VerificationStatus` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`QualificationId`) USING BTREE,
  KEY `cns_instructor_qualification_person` (`SportsPersonId`),
  KEY `cns_instructor_qualification_course` (`QualificationCourseId`),
  CONSTRAINT `cns_instructor_qualification_course` FOREIGN KEY (`QualificationCourseId`) REFERENCES `sports_training_qualification_course` (`QualificationCourseId`),
  CONSTRAINT `cns_instructor_qualification_person` FOREIGN KEY (`SportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_training_qualification_course`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_training_qualification_course` (
  `QualificationCourseId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Code` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`QualificationCourseId`) USING BTREE,
  KEY `cns_qualification_course_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `cns_qualification_course_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_training_visa`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_training_visa` (
  `VisaId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VisaTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DocumentNumber` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `DocumentName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Notes` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VerificationStatus` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`VisaId`) USING BTREE,
  KEY `cns_instructor_visa_nationality` (`VisaTypeId`),
  KEY `cns_instructor_visa_instructor` (`SportsPersonId`),
  CONSTRAINT `cns_instructor_visa_nationality` FOREIGN KEY (`VisaTypeId`) REFERENCES `sports_training_visa_type` (`VisaTypeId`),
  CONSTRAINT `cns_instructor_visa_person` FOREIGN KEY (`SportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_training_visa_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_training_visa_type` (
  `VisaTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`VisaTypeId`) USING BTREE,
  KEY `cns_visa_type_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `cns_visa_type_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_url_shortener`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_url_shortener` (
  `UrlShortenerId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`UrlShortenerId`),
  UNIQUE KEY `sports_url_shortener_code` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_venue`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_venue` (
  `EntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `VenueCode` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `OperatorId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Longitude` decimal(10,6) DEFAULT NULL,
  `Latitude` decimal(10,6) DEFAULT NULL,
  `IncludeOnWeb` int DEFAULT NULL,
  `VenueTelephone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VenueEmail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VenueLocality` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VenueUrl` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VenueImageLocation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AddressRegionId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CoordinatorSportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExcludeFromPerformanceReporting` tinyint(1) NOT NULL DEFAULT '1',
  `DefaultImageUrlId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RegionId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VenueCustomerServiceTelephone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `PlaceId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`EntityAttributesId`),
  KEY `idxVenue_Code` (`VenueCode`),
  KEY `fk_venue_entity` (`EntityId`),
  KEY `cns_sports_venue_licensee` (`LicenseeId`),
  KEY `cns_sports_venue_operator` (`OperatorId`),
  KEY `cns_venue_region` (`AddressRegionId`),
  KEY `sports_venue_coordinator` (`CoordinatorSportsPersonId`),
  KEY `sports_venue_default_image` (`DefaultImageUrlId`),
  KEY `sports_venue_venue_region` (`RegionId`),
  CONSTRAINT `cns_sports_venue_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`),
  CONSTRAINT `cns_sports_venue_operator` FOREIGN KEY (`OperatorId`) REFERENCES `sports_operator` (`EntityAttributesId`),
  CONSTRAINT `cns_venue_entity` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `sports_venue_address_region` FOREIGN KEY (`AddressRegionId`) REFERENCES `sports_venue_address_region` (`AddressRegionId`),
  CONSTRAINT `sports_venue_coordinator` FOREIGN KEY (`CoordinatorSportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`),
  CONSTRAINT `sports_venue_default_image` FOREIGN KEY (`DefaultImageUrlId`) REFERENCES `url` (`UrlId`),
  CONSTRAINT `sports_venue_venue_region` FOREIGN KEY (`RegionId`) REFERENCES `sports_venue_region` (`RegionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_venue_address_region`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_venue_address_region` (
  `AddressRegionId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `RegionName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sequence` int NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`AddressRegionId`),
  KEY `cns_region_master_licensee` (`MasterLicenseeId`) USING BTREE,
  CONSTRAINT `cns_region_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_venue_details_key`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_venue_details_key` (
  `VenueDetailsKeyId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Sequence` int DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`VenueDetailsKeyId`) USING BTREE,
  KEY `FKVenueDetailsMasterLicenseeId` (`MasterLicenseeId`) USING BTREE,
  CONSTRAINT `FKVenueDetailsMasterLicenseeId` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_venue_details_value`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_venue_details_value` (
  `VenueDetailsValueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VenueDetailsKeyId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`VenueDetailsValueId`) USING BTREE,
  KEY `FKVenueDetailsKeyId` (`VenueDetailsKeyId`) USING BTREE,
  KEY `FKVenueDetailsVenueId` (`VenueId`) USING BTREE,
  CONSTRAINT `FKVenueDetailsKeyId` FOREIGN KEY (`VenueDetailsKeyId`) REFERENCES `sports_venue_details_key` (`VenueDetailsKeyId`),
  CONSTRAINT `FKVenueDetailsVenueId` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_venue_document`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_venue_document` (
  `VenueDocumentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  `VenueDocumentTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DocumentName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`VenueDocumentId`),
  KEY `sports_venue_document_type` (`VenueDocumentTypeId`),
  KEY `sports_venue_document_venue` (`VenueId`),
  CONSTRAINT `sports_venue_document_type` FOREIGN KEY (`VenueDocumentTypeId`) REFERENCES `sports_venue_document_type` (`VenueDocumentTypeId`),
  CONSTRAINT `sports_venue_document_venue` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_venue_document_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_venue_document_type` (
  `VenueDocumentTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Required` tinyint(1) NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`VenueDocumentTypeId`),
  KEY `sports_venue_document_type_ml` (`MasterLicenseeId`),
  CONSTRAINT `sports_venue_document_type_ml` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_venue_facility`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_venue_facility` (
  `VenueFacilityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Sequence` int NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`VenueFacilityId`),
  KEY `sports_venue_facility_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `sports_venue_facility_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_venue_image`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_venue_image` (
  `VenueId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `UrlId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`VenueId`,`UrlId`),
  KEY `sports_venue_image_url` (`UrlId`),
  CONSTRAINT `sports_venue_image_url` FOREIGN KEY (`UrlId`) REFERENCES `url` (`UrlId`),
  CONSTRAINT `sports_venue_image_venue` FOREIGN KEY (`VenueId`) REFERENCES `sports_venue` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_venue_region`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_venue_region` (
  `RegionId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `RegionName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`RegionId`),
  KEY `cns_venue_region_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `cns_venue_region_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_waiting_list`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_waiting_list` (
  `EntityAttributesId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsStudentEAId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ExistingEnrolmentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DateRequested` datetime NOT NULL,
  `DateRequired` datetime DEFAULT NULL,
  `DatePlaced` datetime DEFAULT NULL,
  `ClassDurationInMinutes` int DEFAULT NULL,
  `NumberOfStudentsPerInstructor` int DEFAULT NULL,
  `Notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PlaceWithSibling` tinyint(1) DEFAULT NULL,
  `InstructorGender` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EntityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`EntityAttributesId`) USING BTREE,
  KEY `cns_sports_student` (`SportsStudentEAId`),
  KEY `cns_waiting_list_entity` (`EntityId`),
  KEY `cns_waiting_list_enrolment` (`ExistingEnrolmentId`),
  KEY `cns_waiting_list_program` (`ProgramId`),
  CONSTRAINT `cns_sports_student` FOREIGN KEY (`SportsStudentEAId`) REFERENCES `sports_student` (`EntityAttributesId`),
  CONSTRAINT `cns_waiting_list_enrolment` FOREIGN KEY (`ExistingEnrolmentId`) REFERENCES `sports_enrolment` (`EnrolmentId`),
  CONSTRAINT `cns_waiting_list_entity` FOREIGN KEY (`EntityId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `cns_waiting_list_program` FOREIGN KEY (`ProgramId`) REFERENCES `sports_program` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_waiting_list_expiry`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_waiting_list_expiry` (
  `WaitingListExpiryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DateSent` datetime NOT NULL,
  `Expiry` datetime NOT NULL,
  `WaitingListId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`WaitingListExpiryId`),
  KEY `sports_waiting_list_expiry_waitlist` (`WaitingListId`),
  CONSTRAINT `sports_waiting_list_expiry_waitlist` FOREIGN KEY (`WaitingListId`) REFERENCES `sports_waiting_list` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_waiting_list_placement`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_waiting_list_placement` (
  `WaitingListPlacementId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `WaitingListId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProvisionalEnrolmentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`WaitingListPlacementId`),
  KEY `sports_waiting_list_placement_waiting_list` (`WaitingListId`),
  KEY `sports_waiting_list_placement_enrolment` (`ProvisionalEnrolmentId`),
  CONSTRAINT `sports_waiting_list_placement_enrolment` FOREIGN KEY (`ProvisionalEnrolmentId`) REFERENCES `sports_enrolment` (`EnrolmentId`),
  CONSTRAINT `sports_waiting_list_placement_waiting_list` FOREIGN KEY (`WaitingListId`) REFERENCES `sports_waiting_list` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_widget`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_widget` (
  `WidgetId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ContentUrl` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Height` int DEFAULT NULL,
  `WidgetCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `WidgetDefaultSearchCriteriaId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`WidgetId`) USING BTREE,
  KEY `cns_widget_widget_category` (`WidgetCategoryId`) USING BTREE,
  KEY `cns_widget_defualt_search` (`WidgetDefaultSearchCriteriaId`),
  CONSTRAINT `cns_widget_defualt_search` FOREIGN KEY (`WidgetDefaultSearchCriteriaId`) REFERENCES `sports_widget_default_search` (`WidgetDefaultSearchCriteriaId`),
  CONSTRAINT `cns_widget_widget_category` FOREIGN KEY (`WidgetCategoryId`) REFERENCES `sports_widget_category` (`WidgetCategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_widget_category`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_widget_category` (
  `WidgetCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IconURL` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `SystemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`WidgetCategoryId`) USING BTREE,
  KEY `sports_widget_category_system` (`SystemId`),
  CONSTRAINT `sports_widget_category_system` FOREIGN KEY (`SystemId`) REFERENCES `sports_system` (`SystemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_widget_configuration`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_widget_configuration` (
  `WidgetConfigurationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Page` int DEFAULT NULL,
  `SortColumn` int NOT NULL,
  `SortOrder` int NOT NULL,
  `Collapsed` tinyint(1) DEFAULT NULL,
  `WidgetCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `WidgetId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsPersonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`WidgetConfigurationId`) USING BTREE,
  KEY `cns_widget_configuration_widget_category` (`WidgetCategoryId`) USING BTREE,
  KEY `cns_widget_configuration_widget` (`WidgetId`) USING BTREE,
  KEY `cns_widget_configuration_widget_sports_person` (`SportsPersonId`) USING BTREE,
  KEY `sports_widget_configuration_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `cns_widget_configuration_sports_person` FOREIGN KEY (`SportsPersonId`) REFERENCES `sports_person` (`EntityAttributesId`),
  CONSTRAINT `cns_widget_configuration_widget` FOREIGN KEY (`WidgetId`) REFERENCES `sports_widget` (`WidgetId`),
  CONSTRAINT `cns_widget_configuration_widget_category` FOREIGN KEY (`WidgetCategoryId`) REFERENCES `sports_widget_category` (`WidgetCategoryId`),
  CONSTRAINT `sports_widget_configuration_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_widget_default_configuration`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_widget_default_configuration` (
  `WidgetDefaultConfigurationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SortColumn` int NOT NULL,
  `SortOrder` int NOT NULL,
  `Collapsed` tinyint(1) DEFAULT NULL,
  `WidgetCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `WidgetId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Page` int DEFAULT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RoleName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`WidgetDefaultConfigurationId`) USING BTREE,
  KEY `cns_widget_default_configuration_widget_category` (`WidgetCategoryId`) USING BTREE,
  KEY `cns_widget_default_configuration_widget` (`WidgetId`) USING BTREE,
  KEY `sports_widget_default_configuration_role` (`RoleName`),
  CONSTRAINT `cns_widget_default_configuration_widget` FOREIGN KEY (`WidgetId`) REFERENCES `sports_widget` (`WidgetId`),
  CONSTRAINT `cns_widget_default_configuration_widget_category` FOREIGN KEY (`WidgetCategoryId`) REFERENCES `sports_widget_category` (`WidgetCategoryId`),
  CONSTRAINT `sports_widget_default_configuration_role` FOREIGN KEY (`RoleName`) REFERENCES `role` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_widget_default_search`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_widget_default_search` (
  `WidgetDefaultSearchCriteriaId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `WidgetId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`WidgetDefaultSearchCriteriaId`),
  KEY `sports_widget_default_search_widget` (`WidgetId`),
  CONSTRAINT `sports_widget_default_search_widget` FOREIGN KEY (`WidgetId`) REFERENCES `sports_widget` (`WidgetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_widget_default_search_criteria`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_widget_default_search_criteria` (
  `WidgetDefaultSearchCriteriaId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `WidgetSearchCriteriaId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`WidgetDefaultSearchCriteriaId`,`WidgetSearchCriteriaId`),
  KEY `sports_widget_default_search_criteria_criteria` (`WidgetSearchCriteriaId`),
  CONSTRAINT `sports_widget_default_search_criteria_criteria` FOREIGN KEY (`WidgetSearchCriteriaId`) REFERENCES `sports_widget_search_criteria` (`WidgetSearchCriteriaId`),
  CONSTRAINT `sports_widget_default_search_criteria_search` FOREIGN KEY (`WidgetDefaultSearchCriteriaId`) REFERENCES `sports_widget_default_search` (`WidgetDefaultSearchCriteriaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_widget_default_search_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_widget_default_search_type` (
  `WidgetId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `WidgetSearchTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`WidgetId`,`WidgetSearchTypeId`),
  KEY `sports_widget_search_type_type` (`WidgetSearchTypeId`),
  CONSTRAINT `sports_widget_search_type_type` FOREIGN KEY (`WidgetSearchTypeId`) REFERENCES `sports_widget_search_type` (`WidgetSearchTypeId`),
  CONSTRAINT `sports_widget_search_type_widget` FOREIGN KEY (`WidgetId`) REFERENCES `sports_widget` (`WidgetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_widget_preferences`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_widget_preferences` (
  `WidgetPreferenceId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `StyleSheetFolder` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TermsOfUseUrl` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataProtectionUrl` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`WidgetPreferenceId`) USING BTREE,
  KEY `cns_widget_preferences_master_licensee` (`MasterLicenseeId`) USING BTREE,
  CONSTRAINT `cns_widget_preferences_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_widget_search_criteria`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_widget_search_criteria` (
  `WidgetSearchCriteriaId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `WidgetSearchTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `WidgetConfigurationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`WidgetSearchCriteriaId`),
  KEY `sports_widget_search_type` (`WidgetSearchTypeId`),
  KEY `sports_widget_search_config` (`WidgetConfigurationId`),
  CONSTRAINT `sports_widget_search_config` FOREIGN KEY (`WidgetConfigurationId`) REFERENCES `sports_widget_configuration` (`WidgetConfigurationId`),
  CONSTRAINT `sports_widget_search_type` FOREIGN KEY (`WidgetSearchTypeId`) REFERENCES `sports_widget_search_type` (`WidgetSearchTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_widget_search_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_widget_search_type` (
  `WidgetSearchTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`WidgetSearchTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_widget_to_master_licensee`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_widget_to_master_licensee` (
  `WidgetId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`WidgetId`,`MasterLicenseeId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_widget_to_roles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_widget_to_roles` (
  `WidgetCategoryId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `RoleName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`WidgetCategoryId`,`RoleName`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_withdrawal_reason`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_withdrawal_reason` (
  `WithdrawalReasonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`WithdrawalReasonId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `sports_withdrawal_reason_licensee`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `sports_withdrawal_reason_licensee` (
  `WithdrawalReasonLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `WithdrawalReasonId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowToClients` tinyint(1) DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`WithdrawalReasonLicenseeId`) USING BTREE,
  UNIQUE KEY `LicenseeId` (`LicenseeId`,`WithdrawalReasonId`) USING BTREE,
  KEY `cns_withdrawal_reason_licensee_withdrawal_reason` (`WithdrawalReasonId`) USING BTREE,
  KEY `cns_withdrawal_reason_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `cns_withdrawal_reason_licensee_licensee` FOREIGN KEY (`LicenseeId`) REFERENCES `sports_licensee` (`LicenseeId`),
  CONSTRAINT `cns_withdrawal_reason_licensee_withdrawal_reason` FOREIGN KEY (`WithdrawalReasonId`) REFERENCES `sports_withdrawal_reason` (`WithdrawalReasonId`),
  CONSTRAINT `cns_withdrawal_reason_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `survey`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `survey` (
  `SurveyId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Dob` datetime DEFAULT NULL,
  `Email1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EducationLevel` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `WrittenEnglishYears` double DEFAULT NULL,
  `WrittenEnglishProficiency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `WouldYouUse` int DEFAULT NULL,
  `PreferredPlanTerm` int DEFAULT NULL,
  `PreferredPlanPrePaid` int DEFAULT NULL,
  `ValueForMoney` int DEFAULT NULL,
  `LikeToSeeNextSpoken` tinyint(1) DEFAULT NULL,
  `LikeToSeeNextComments` tinyint(1) DEFAULT NULL,
  `LikeToSeeNextPictures` tinyint(1) DEFAULT NULL,
  `LikeToSeeNextDocomo` tinyint(1) DEFAULT NULL,
  `LikeToSeeNextVideoLessons` tinyint(1) DEFAULT NULL,
  `SuggestionsForImprovement` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `PreferredPaymentMethodCards` tinyint(1) DEFAULT NULL,
  `PreferredPaymentMethodAmex` tinyint(1) DEFAULT NULL,
  `PreferredPaymentMethodTransfer` tinyint(1) DEFAULT NULL,
  `CountryOfResidence` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CountryOfOrigin` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CouponCode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`SurveyId`),
  KEY `idxSurvey_Email1` (`Email1`),
  KEY `FKCAE3A75A8F79A199` (`CountryOfResidence`),
  KEY `FKCAE3A75AC7FB2973` (`CountryOfOrigin`),
  CONSTRAINT `FKCAE3A75A8F79A199` FOREIGN KEY (`CountryOfResidence`) REFERENCES `country` (`countryCode`),
  CONSTRAINT `FKCAE3A75AC7FB2973` FOREIGN KEY (`CountryOfOrigin`) REFERENCES `country` (`countryCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `system_settings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `system_settings` (
  `SystemSettingsId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `State` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `HostName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `HttpPort` int NOT NULL,
  `HttpsPort` int NOT NULL,
  `ProxiedHttpPort` int DEFAULT NULL,
  `ProxiedHttpsPort` int DEFAULT NULL,
  `UseSSL` tinyint(1) DEFAULT NULL,
  `NamingURL` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RunMode` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TrainingDocumentFolder` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PersonPhotoFolder` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PersonPhotoTempFolder` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LevelImageFolder` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TicketAttachmentTempFolder` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TicketAttachmentFolder` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CardEnvironment` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VenueDocumentFolder` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ImageOpenURL` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AcknowledgementURL` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReportFolder` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `WearableDataLogFolder` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GoogleAjaxSearchKey` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GoogleMapsKey` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `ResourcesDirectory` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EventsPaused` tinyint(1) NOT NULL DEFAULT '0',
  `NumberSimultaneousProcesses` int NOT NULL DEFAULT '1',
  `EnableJMS` tinyint(1) NOT NULL DEFAULT '0',
  `HostIdentifier` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DirectDebitPaymentGatewayId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataDumpDirectory` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailTemplatesDirectory` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SmsStatusCallbackUrl` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OnlineBookingPreferencesFolder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ZendeskClientSecret` text COLLATE utf8mb4_unicode_ci,
  `ZendeskAccessToken` text COLLATE utf8mb4_unicode_ci,
  `ZendeskClientId` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NoteOpenRetainMonths` int DEFAULT NULL,
  `AccountOpenLogRetainMonths` int DEFAULT NULL,
  `RequestRetainMonths` int DEFAULT NULL,
  `EventInstanceRetainWeeks` int DEFAULT NULL,
  `EventInstanceExtendedRetainWeeks` int DEFAULT NULL,
  PRIMARY KEY (`SystemSettingsId`),
  KEY `system_settings_pg` (`DirectDebitPaymentGatewayId`),
  CONSTRAINT `system_settings_pg` FOREIGN KEY (`DirectDebitPaymentGatewayId`) REFERENCES `sports_payment_gateway` (`PaymentGatewayId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `system_settings_parameters`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `system_settings_parameters` (
  `SystemSettingsParameterId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SystemSettingsId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Parameter` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`SystemSettingsParameterId`),
  KEY `system_settings_parameters_fk` (`SystemSettingsId`),
  CONSTRAINT `system_settings_parameters_fk` FOREIGN KEY (`SystemSettingsId`) REFERENCES `system_settings` (`SystemSettingsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `task`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `task` (
  `TaskId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `State` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DueDate` datetime DEFAULT NULL,
  `ActionedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TaskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `task_action`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `task_action` (
  `TaskActionId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ActionDate` datetime DEFAULT NULL,
  `DueDate` datetime DEFAULT NULL,
  `State` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TaskId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ActionerId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TaskActionId`),
  KEY `FK59EFF630E53AEDFE` (`ActionerId`),
  KEY `FK59EFF63094E3DDA0` (`TaskId`),
  KEY `FK59EFF630E53AEDFEF1B0D96` (`ActionerId`),
  CONSTRAINT `FK59EFF63094E3DDA0` FOREIGN KEY (`TaskId`) REFERENCES `task` (`TaskId`),
  CONSTRAINT `FK59EFF630E53AEDFE` FOREIGN KEY (`ActionerId`) REFERENCES `entity` (`EntityId`),
  CONSTRAINT `FK59EFF630E53AEDFEF1B0D96` FOREIGN KEY (`ActionerId`) REFERENCES `entity` (`EntityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `task_action_config`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `task_action_config` (
  `TaskActionConfigId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `TaskActionName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `InitialState` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TaskConfigId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TaskActionConfigId`),
  KEY `FK9737343187D05CC2` (`TaskConfigId`),
  CONSTRAINT `FK9737343187D05CC2` FOREIGN KEY (`TaskConfigId`) REFERENCES `task_config` (`TaskConfigId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `task_action_event_config`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `task_action_event_config` (
  `TaskActionEventConfigId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `EventName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TaskActionTransitionToConfigId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TaskActionEventConfigId`),
  KEY `FKA1FECE36B0AB3BA8` (`TaskActionTransitionToConfigId`),
  CONSTRAINT `FKA1FECE36B0AB3BA8` FOREIGN KEY (`TaskActionTransitionToConfigId`) REFERENCES `task_action_transition_to_config` (`TaskActionTransitionToConfigId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `task_action_state_config`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `task_action_state_config` (
  `TaskActionStateConfigId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TaskActionConfigId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TaskActionStateConfigId`),
  KEY `FK762FA85F9A454158` (`TaskActionConfigId`),
  CONSTRAINT `FK762FA85F9A454158` FOREIGN KEY (`TaskActionConfigId`) REFERENCES `task_action_config` (`TaskActionConfigId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `task_action_transition_to_config`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `task_action_transition_to_config` (
  `TaskActionTransitionToConfigId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TaskActionStateConfigId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TaskActionTransitionToConfigId`),
  KEY `FK75B7A5CB69656F33` (`TaskActionStateConfigId`),
  CONSTRAINT `FK75B7A5CB69656F33` FOREIGN KEY (`TaskActionStateConfigId`) REFERENCES `task_action_state_config` (`TaskActionStateConfigId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `task_config`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `task_config` (
  `TaskConfigId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `TaskName` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `InitialState` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TaskConfigId`),
  UNIQUE KEY `TaskName` (`TaskName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `task_event_config`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `task_event_config` (
  `TaskEventConfigId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `EventName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TaskTransitionToConfigId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TaskEventConfigId`),
  KEY `FK70BAE10139A68812` (`TaskTransitionToConfigId`),
  CONSTRAINT `FK70BAE10139A68812` FOREIGN KEY (`TaskTransitionToConfigId`) REFERENCES `task_transition_to_config` (`TaskTransitionToConfigId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `task_search_property`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `task_search_property` (
  `TaskSearchPropertyId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SearchId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TaskId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TaskSearchPropertyId`),
  KEY `FK7FDA67D294E3DDA0` (`TaskId`),
  CONSTRAINT `FK7FDA67D294E3DDA0` FOREIGN KEY (`TaskId`) REFERENCES `task` (`TaskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `task_state_config`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `task_state_config` (
  `TaskStateConfigId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TaskConfigId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TaskStateConfigId`),
  KEY `FK44EBBB2A87D05CC2` (`TaskConfigId`),
  CONSTRAINT `FK44EBBB2A87D05CC2` FOREIGN KEY (`TaskConfigId`) REFERENCES `task_config` (`TaskConfigId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `task_transition_to_config`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `task_transition_to_config` (
  `TaskTransitionToConfigId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TaskStateConfigId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TaskTransitionToConfigId`),
  KEY `FK2A85BD96274E609` (`TaskStateConfigId`),
  CONSTRAINT `FK2A85BD96274E609` FOREIGN KEY (`TaskStateConfigId`) REFERENCES `task_state_config` (`TaskStateConfigId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_activity`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_activity` (
  `TeachingActivityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TeachingActivityId`),
  KEY `teaching_activity_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `teaching_activity_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_equipment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_equipment` (
  `TeachingEquipmentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TeachingEquipmentId`),
  KEY `teaching_equipment_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `teaching_equipment_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_focus`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_focus` (
  `TeachingFocusId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TeachingActivityId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TeachingFocusId`),
  KEY `teaching_join_focus_activity` (`TeachingActivityId`),
  CONSTRAINT `teaching_join_focus_activity` FOREIGN KEY (`TeachingActivityId`) REFERENCES `teaching_activity` (`TeachingActivityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_heath_and_safety`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_heath_and_safety` (
  `TeachingHealthAndSafetyId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TeachingHealthAndSafetyId`),
  KEY `teaching_health_and_safety_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `teaching_health_and_safety_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_join_practice_item_equipment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_join_practice_item_equipment` (
  `TeachingPracticeItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TeachingEquipmentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`TeachingPracticeItemId`,`TeachingEquipmentId`),
  KEY `teaching_program_template_item_equipment` (`TeachingEquipmentId`),
  CONSTRAINT `teaching_join_practice_item_equipment_item` FOREIGN KEY (`TeachingPracticeItemId`) REFERENCES `teaching_practice_item` (`TeachingPracticeItemId`),
  CONSTRAINT `teaching_program_template_item_equipment` FOREIGN KEY (`TeachingEquipmentId`) REFERENCES `teaching_equipment` (`TeachingEquipmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_join_practice_item_health_and_safety`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_join_practice_item_health_and_safety` (
  `TeachingPracticeItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TeachingHealthAndSafetyId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`TeachingPracticeItemId`,`TeachingHealthAndSafetyId`),
  KEY `teaching_program_template_item_health_safety` (`TeachingHealthAndSafetyId`),
  CONSTRAINT `teaching_join_practice_item_health_and_safety_practice` FOREIGN KEY (`TeachingPracticeItemId`) REFERENCES `teaching_practice_item` (`TeachingPracticeItemId`),
  CONSTRAINT `teaching_program_template_item_health_safety` FOREIGN KEY (`TeachingHealthAndSafetyId`) REFERENCES `teaching_heath_and_safety` (`TeachingHealthAndSafetyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_join_practice_item_level`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_join_practice_item_level` (
  `TeachingPracticeItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProgramLevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`TeachingPracticeItemId`,`ProgramLevelId`),
  KEY `teaching_join_practice_item_level` (`ProgramLevelId`),
  CONSTRAINT `teaching_join_practice_item_level` FOREIGN KEY (`ProgramLevelId`) REFERENCES `sports_program_level` (`EntityAttributesId`),
  CONSTRAINT `teaching_join_practice_item_pi` FOREIGN KEY (`TeachingPracticeItemId`) REFERENCES `teaching_practice_item` (`TeachingPracticeItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_join_practice_item_media`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_join_practice_item_media` (
  `TeachingPracticeItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `UrlId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`TeachingPracticeItemId`,`UrlId`),
  KEY `teaching_join_practice_type_media_media` (`UrlId`),
  CONSTRAINT `teaching_join_practice_item_media_practice` FOREIGN KEY (`TeachingPracticeItemId`) REFERENCES `teaching_practice_item` (`TeachingPracticeItemId`),
  CONSTRAINT `teaching_join_practice_type_media_media` FOREIGN KEY (`UrlId`) REFERENCES `url` (`UrlId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_join_practice_item_module_level`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_join_practice_item_module_level` (
  `TeachingPracticeItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ModuleToLevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`TeachingPracticeItemId`,`ModuleToLevelId`),
  KEY `teaching_join_focus_module_module` (`ModuleToLevelId`),
  CONSTRAINT `teaching_join_focus_module_module` FOREIGN KEY (`ModuleToLevelId`) REFERENCES `assessment_module_level` (`Id`),
  CONSTRAINT `teaching_join_practice_item_module_level_practice` FOREIGN KEY (`TeachingPracticeItemId`) REFERENCES `teaching_practice_item` (`TeachingPracticeItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_layout`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_layout` (
  `TeachingLayoutId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LessonAims` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ClassDurationInMinutes` int NOT NULL,
  `ProgramLevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TeachingLayoutId`),
  KEY `teaching_layout_program_level` (`ProgramLevelId`),
  CONSTRAINT `teaching_layout_program_level` FOREIGN KEY (`ProgramLevelId`) REFERENCES `sports_program_level` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_layout_item`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_layout_item` (
  `TeachingLayoutItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TeachingPracticeType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sequence` int NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `TeachingLayoutItemGroupId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TeachingLayoutItemId`),
  KEY `teaching_layout_item_group` (`TeachingLayoutItemGroupId`),
  CONSTRAINT `teaching_layout_item_group` FOREIGN KEY (`TeachingLayoutItemGroupId`) REFERENCES `teaching_layout_item_group` (`TeachingLayoutItemGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_layout_item_group`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_layout_item_group` (
  `TeachingLayoutItemGroupId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TeachingLayoutId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Sequence` int NOT NULL,
  `LessonMinutes` int NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TeachingLayoutItemGroupId`),
  KEY `teaching_layout_item_group_layout` (`TeachingLayoutId`),
  CONSTRAINT `teaching_layout_item_group_layout` FOREIGN KEY (`TeachingLayoutId`) REFERENCES `teaching_layout` (`TeachingLayoutId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_location`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_location` (
  `TeachingLocationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TeachingLocationId`),
  KEY `teaching_location_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `teaching_location_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_notification_configuration`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_notification_configuration` (
  `TeachingNotificationConfigurationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `RunPeriod` int NOT NULL,
  `RunPeriodType` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NextRunDate` datetime NOT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IncludeAttendanceBeforeDays` int NOT NULL,
  `IgnoreAttendanceAfterDays` int NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `SurveyPeriodDays` int DEFAULT NULL,
  `SurveyMinimumAttendedLessons` int DEFAULT NULL,
  `SurveyMaximumPerWeek` int DEFAULT NULL,
  `SurveyMaximumPerDay` int DEFAULT NULL,
  `SurveyFeedbackCampaignId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `StudentEmailNextRunDate` datetime DEFAULT NULL,
  `StudentEmailLastRunDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `ClassLevelCheckLastRun` datetime DEFAULT NULL,
  PRIMARY KEY (`TeachingNotificationConfigurationId`),
  KEY `teaching_notification_configuration_feedback_campaign` (`SurveyFeedbackCampaignId`),
  KEY `teaching_notification_configuration_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `teaching_notification_configuration_feedback_campaign` FOREIGN KEY (`SurveyFeedbackCampaignId`) REFERENCES `sports_feedback_campaign` (`FeedbackCampaignId`),
  CONSTRAINT `teaching_notification_configuration_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_notification_configuration_survey_programs`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_notification_configuration_survey_programs` (
  `TeachingNotificationConfigurationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`TeachingNotificationConfigurationId`,`ProgramId`),
  KEY `teaching_notification_configuration_survey_programs_p` (`ProgramId`),
  CONSTRAINT `teaching_notification_configuration_survey_programs_p` FOREIGN KEY (`ProgramId`) REFERENCES `sports_program` (`EntityAttributesId`),
  CONSTRAINT `teaching_notification_configuration_survey_programs_tn` FOREIGN KEY (`TeachingNotificationConfigurationId`) REFERENCES `teaching_notification_configuration` (`TeachingNotificationConfigurationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_practice`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_practice` (
  `TeachingPracticeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `TeachingFocusId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Aims` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TeachingPracticeId`),
  KEY `teaching_practice_focus` (`TeachingFocusId`),
  CONSTRAINT `teaching_practice_focus` FOREIGN KEY (`TeachingFocusId`) REFERENCES `teaching_focus` (`TeachingFocusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_practice_item`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_practice_item` (
  `TeachingPracticeItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Sequence` int DEFAULT NULL,
  `Value` decimal(10,0) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LessonTimeInMinutes` int DEFAULT NULL,
  `TeachingLocationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Units` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ChallengeToLevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TeachingPracticeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProgramLevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TeachingPracticeItemId`),
  KEY `teaching_program_item_location` (`TeachingLocationId`),
  KEY `teaching_practice_item_challenge_level` (`ChallengeToLevelId`),
  KEY `teaching_practice_item_teaching_practice` (`TeachingPracticeId`),
  KEY `teaching_practice_item_program_level` (`ProgramLevelId`),
  CONSTRAINT `teaching_practice_item_challenge_level` FOREIGN KEY (`ChallengeToLevelId`) REFERENCES `assessment_challenge_program` (`Id`),
  CONSTRAINT `teaching_practice_item_program_level` FOREIGN KEY (`ProgramLevelId`) REFERENCES `sports_program_level` (`EntityAttributesId`),
  CONSTRAINT `teaching_practice_item_teaching_practice` FOREIGN KEY (`TeachingPracticeId`) REFERENCES `teaching_practice` (`TeachingPracticeId`),
  CONSTRAINT `teaching_program_item_location` FOREIGN KEY (`TeachingLocationId`) REFERENCES `teaching_location` (`TeachingLocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_program`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_program` (
  `TeachingProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ClassId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TeachingProgramId`),
  KEY `teaching_program_class` (`ClassId`),
  CONSTRAINT `teaching_program_class` FOREIGN KEY (`ClassId`) REFERENCES `sports_class` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_program_item`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_program_item` (
  `TeachingProgramItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TeachingProgramTemplateItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Sequence` int DEFAULT NULL,
  `LessonTimeInMinutes` int DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TeachingProgramItemId`),
  KEY `teaching_program_item_program_template_item` (`TeachingProgramTemplateItemId`),
  CONSTRAINT `teaching_program_item_program_template_item` FOREIGN KEY (`TeachingProgramTemplateItemId`) REFERENCES `teaching_program_template_item` (`TeachingProgramTemplateItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_program_practice`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_program_practice` (
  `TeachingProgramPracticeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TeachingPracticeItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Sequence` int NOT NULL,
  `Value` decimal(10,0) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `LessonTimeInMinutes` int DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `TeachingLayoutItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TeachingProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TeachingProgramPracticeId`),
  KEY `teaching_program_teaching_practice` (`TeachingPracticeItemId`),
  KEY `teaching_program_layout_item` (`TeachingLayoutItemId`),
  KEY `teaching_program_practice_p` (`TeachingProgramId`),
  CONSTRAINT `teaching_program_layout_item` FOREIGN KEY (`TeachingLayoutItemId`) REFERENCES `teaching_layout_item` (`TeachingLayoutItemId`),
  CONSTRAINT `teaching_program_practice_p` FOREIGN KEY (`TeachingProgramId`) REFERENCES `teaching_program` (`TeachingProgramId`),
  CONSTRAINT `teaching_program_teaching_practice` FOREIGN KEY (`TeachingPracticeItemId`) REFERENCES `teaching_practice_item` (`TeachingPracticeItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_program_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_program_template` (
  `TeachingProgramTemplateId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TeachingProgramTemplateId`),
  KEY `cns_teaching_program_program` (`ProgramId`),
  CONSTRAINT `cns_teaching_program_program` FOREIGN KEY (`ProgramId`) REFERENCES `sports_program` (`EntityAttributesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_program_template_item`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_program_template_item` (
  `TeachingProgramTemplateItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TeachingProgramTemplateId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Sequence` int DEFAULT NULL,
  `ClassDurationInMinutes` int DEFAULT NULL,
  `NumberOfStudentsPerInstructor` int DEFAULT NULL,
  `ProgramLevelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `LessonAims` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TeachingProgramTemplateItemId`),
  KEY `teaching_program_template_item_program_level` (`ProgramLevelId`),
  KEY `teaching_program_template_item_template` (`TeachingProgramTemplateId`),
  CONSTRAINT `teaching_program_template_item_program_level` FOREIGN KEY (`ProgramLevelId`) REFERENCES `sports_program_level` (`EntityAttributesId`),
  CONSTRAINT `teaching_program_template_item_template` FOREIGN KEY (`TeachingProgramTemplateId`) REFERENCES `teaching_program_template` (`TeachingProgramTemplateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_student_program`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_student_program` (
  `TeachingStudentProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `BookingId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportsStudentId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  `TeachingProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`TeachingStudentProgramId`),
  KEY `teaching_student_program_booking` (`BookingId`),
  KEY `teaching_student_program_student` (`SportsStudentId`),
  KEY `teaching_student_program_tp` (`TeachingProgramId`),
  CONSTRAINT `teaching_student_program_booking` FOREIGN KEY (`BookingId`) REFERENCES `sports_booking` (`BookingId`),
  CONSTRAINT `teaching_student_program_student` FOREIGN KEY (`SportsStudentId`) REFERENCES `sports_student` (`EntityAttributesId`),
  CONSTRAINT `teaching_student_program_tp` FOREIGN KEY (`TeachingProgramId`) REFERENCES `teaching_program` (`TeachingProgramId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_student_program_practice`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_student_program_practice` (
  `TeachingStudentProgramPracticeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Sequence` int DEFAULT NULL,
  `Value` decimal(10,0) NOT NULL,
  `Quantity` int NOT NULL,
  `Type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LessonTimeInMinutes` int DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `TeachingPracticeItemId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TeachingStudentProgramId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TeachingStudentProgramPracticeId`),
  KEY `teaching_student_program_practice_item` (`TeachingPracticeItemId`),
  KEY `teaching_student_program_practice_student_program` (`TeachingStudentProgramId`),
  CONSTRAINT `teaching_student_program_practice_item` FOREIGN KEY (`TeachingPracticeItemId`) REFERENCES `teaching_practice_item` (`TeachingPracticeItemId`),
  CONSTRAINT `teaching_student_program_practice_student_program` FOREIGN KEY (`TeachingStudentProgramId`) REFERENCES `teaching_student_program` (`TeachingStudentProgramId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_wearable`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_wearable` (
  `WearableId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Address` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MasterLicenseeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `WearableVersionId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`WearableId`),
  UNIQUE KEY `teaching_wearable_ix1` (`Address`),
  KEY `teaching_wearable_master_licensee` (`MasterLicenseeId`),
  KEY `teaching_wearable_version` (`WearableVersionId`),
  CONSTRAINT `teaching_wearable_master_licensee` FOREIGN KEY (`MasterLicenseeId`) REFERENCES `sports_master_licensee` (`MasterLicenseeId`),
  CONSTRAINT `teaching_wearable_version` FOREIGN KEY (`WearableVersionId`) REFERENCES `teaching_wearable_version` (`WearableVersionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_wearable_calibration`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_wearable_calibration` (
  `WearableCalibrationId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `WearableId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `WearableVersionId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MagBiasX` float NOT NULL,
  `MagBiasY` float NOT NULL,
  `MagBiasZ` float NOT NULL,
  `MagScaleX` float NOT NULL,
  `MagScaleY` float NOT NULL,
  `MagScaleZ` float NOT NULL,
  `DateCalibrated` datetime NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`WearableCalibrationId`),
  KEY `teaching_wearable_calibration_wearable` (`WearableId`),
  KEY `teaching_wearable_calibration_version` (`WearableVersionId`),
  CONSTRAINT `teaching_wearable_calibration_version` FOREIGN KEY (`WearableVersionId`) REFERENCES `teaching_wearable_version` (`WearableVersionId`),
  CONSTRAINT `teaching_wearable_calibration_wearable` FOREIGN KEY (`WearableId`) REFERENCES `teaching_wearable` (`WearableId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_wearable_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_wearable_log` (
  `WearableLogId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `StartTime` datetime DEFAULT NULL,
  `SessionId` int DEFAULT NULL,
  `UserId` int DEFAULT NULL,
  `BookingId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MagneticDeclination` double DEFAULT NULL,
  `WearableId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VersionId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `RemoteIPAddress` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SynchronizedDate` datetime DEFAULT NULL,
  `WearableLogUploadId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`WearableLogId`),
  KEY `teaching_wearable_log_booking` (`BookingId`),
  KEY `teaching_wearable_log_wearable` (`WearableId`),
  KEY `teaching_wearable_log_version` (`VersionId`),
  KEY `teaching_wearable_log_upload` (`WearableLogUploadId`),
  CONSTRAINT `teaching_wearable_log_booking` FOREIGN KEY (`BookingId`) REFERENCES `sports_booking` (`BookingId`),
  CONSTRAINT `teaching_wearable_log_upload` FOREIGN KEY (`WearableLogUploadId`) REFERENCES `teaching_wearable_log_upload` (`WearableLogUploadId`),
  CONSTRAINT `teaching_wearable_log_version` FOREIGN KEY (`VersionId`) REFERENCES `teaching_wearable_version` (`WearableVersionId`),
  CONSTRAINT `teaching_wearable_log_wearable` FOREIGN KEY (`WearableId`) REFERENCES `teaching_wearable` (`WearableId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_wearable_log_data`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_wearable_log_data` (
  `WearableLogDataId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `WearableLogId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Sequence` int NOT NULL,
  `AccX` float NOT NULL,
  `AccY` float NOT NULL,
  `AccZ` float NOT NULL,
  `GyroX` float NOT NULL,
  `GyroY` float NOT NULL,
  `GyroZ` float NOT NULL,
  `MagX` float DEFAULT NULL,
  `MagY` float DEFAULT NULL,
  `MagZ` float DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Yaw` float DEFAULT NULL,
  `Pitch` float DEFAULT NULL,
  `Roll` float DEFAULT NULL,
  `Q1` float DEFAULT NULL,
  `Q2` float DEFAULT NULL,
  `Q3` float DEFAULT NULL,
  `Q4` float DEFAULT NULL,
  `RawAccX` float DEFAULT NULL,
  `RawAccY` float DEFAULT NULL,
  `RawAccZ` float DEFAULT NULL,
  `RawGyroX` float DEFAULT NULL,
  `RawGyroY` float DEFAULT NULL,
  `RawGyroZ` float DEFAULT NULL,
  `RawMagX` float DEFAULT NULL,
  `RawMagY` float DEFAULT NULL,
  `RawMagZ` float DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`WearableLogDataId`),
  KEY `teaching_wearable_log_data_wd` (`WearableLogId`),
  CONSTRAINT `teaching_wearable_log_data_wd` FOREIGN KEY (`WearableLogId`) REFERENCES `teaching_wearable_log` (`WearableLogId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_wearable_log_upload`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_wearable_log_upload` (
  `WearableLogUploadId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `UploadDate` datetime NOT NULL,
  `UploadReference` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`WearableLogUploadId`),
  UNIQUE KEY `teaching_wearable_log_upload_reference` (`UploadReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `teaching_wearable_version`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `teaching_wearable_version` (
  `WearableVersionId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VersionNumber` double NOT NULL,
  `Name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GyroDps` int DEFAULT NULL,
  `OutputFrequencyHz` double DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AccelDps` int DEFAULT NULL,
  `MagScale` int DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`WearableVersionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `transaction_lock`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `transaction_lock` (
  `Id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Expiry` datetime DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `unique_identifier_num`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `unique_identifier_num` (
  `Id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Number` int DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `url`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
CREATE TABLE `url` (
  `UrlId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `File` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Host` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Port` int NOT NULL DEFAULT '0',
  `Protocol` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Query` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `FileSize` bigint DEFAULT NULL,
  `CreatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`UrlId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET character_set_client = @saved_cs_client;
SET TIME_ZONE=@OLD_TIME_ZONE;
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT;
SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS;
SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION;
SET SQL_NOTES=@OLD_SQL_NOTES;
