-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 17, 2021 at 06:58 PM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dev_craftgulp_craft3`
--

-- --------------------------------------------------------

--
-- Table structure for table `assetindexdata`
--

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assettransformindex`
--

CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assettransforms`
--

CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups`
--

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups_sites`
--

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `changedattributes`
--

CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `changedfields`
--

CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, '2021-06-17 10:02:01', '2021-06-17 10:02:01', '508a3402-55a5-4472-bd8f-76f5cc11c7ae');

-- --------------------------------------------------------

--
-- Table structure for table `craftidtokens`
--

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deprecationerrors`
--

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drafts`
--

CREATE TABLE `drafts` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `elementindexsettings`
--

CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE `elements` (
  `id` int(11) NOT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2021-06-17 10:02:01', '2021-06-17 10:02:01', NULL, 'd8aaa17e-e62d-4fa3-b27e-817092bf4dd1');

-- --------------------------------------------------------

--
-- Table structure for table `elements_sites`
--

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2021-06-17 10:02:01', '2021-06-17 10:02:01', '38d188d9-6b70-47e3-8d38-679eb8637a58');

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `entrytypes`
--

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fieldgroups`
--

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fieldgroups`
--

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Common', '2021-06-17 10:02:01', '2021-06-17 10:02:01', NULL, '3de9f34b-4f3e-4e93-ac00-2031eee86068');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayoutfields`
--

CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouts`
--

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouttabs`
--

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `instructions` text COLLATE utf8_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `globalsets`
--

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gqlschemas`
--

CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gqltokens`
--

CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.6.17', '3.6.8', 0, 'yrbvbmufnlew', 'ishcemkzuduh', '2021-06-17 10:02:01', '2021-06-17 10:02:02', '166b442d-d5d7-45b1-87b2-827a76f7f992');

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocks`
--

CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocktypes`
--

CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft', 'Install', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'f093abab-a169-43d4-92f1-c5ee15361b9a'),
(2, 'craft', 'm150403_183908_migrations_table_changes', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '5ea9263a-30e5-491c-9f82-1d6affed0e27'),
(3, 'craft', 'm150403_184247_plugins_table_changes', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'c36a92b8-e5c3-46c5-b22f-8b97fecf76aa'),
(4, 'craft', 'm150403_184533_field_version', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '25bf99e3-77fd-4c56-a724-1637ba8fcd75'),
(5, 'craft', 'm150403_184729_type_columns', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '53a19b3f-6069-493d-b63b-7ec08a4e1de5'),
(6, 'craft', 'm150403_185142_volumes', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '562c5613-5442-46ce-a766-02dd50cfebc8'),
(7, 'craft', 'm150428_231346_userpreferences', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '4007aa56-8963-4cad-8506-27de7de5ba3a'),
(8, 'craft', 'm150519_150900_fieldversion_conversion', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'e624d96e-b0f0-4656-9bc3-1152add5ee78'),
(9, 'craft', 'm150617_213829_update_email_settings', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'dab1d1e8-e3f3-4521-a9be-da4411c49422'),
(10, 'craft', 'm150721_124739_templatecachequeries', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '6e11b98a-a084-4169-982d-b41d2fca53ae'),
(11, 'craft', 'm150724_140822_adjust_quality_settings', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'c144d186-b568-4f70-865b-231243d0e07a'),
(12, 'craft', 'm150815_133521_last_login_attempt_ip', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'bfed4fb9-d089-47a0-a653-d6ed6e8a2d90'),
(13, 'craft', 'm151002_095935_volume_cache_settings', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'a13e9d98-7e17-4e43-9dbb-042cb44db661'),
(14, 'craft', 'm151005_142750_volume_s3_storage_settings', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'b563a6bf-4105-4dc6-b4e2-e238253056e4'),
(15, 'craft', 'm151016_133600_delete_asset_thumbnails', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'b6a35db0-71de-4a37-a910-4245ccee69f0'),
(16, 'craft', 'm151209_000000_move_logo', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '9b100abc-20e2-4eb7-bf1b-c3d886c9c203'),
(17, 'craft', 'm151211_000000_rename_fileId_to_assetId', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '5c4742d0-b5cc-48bd-977b-82025ac0ac47'),
(18, 'craft', 'm151215_000000_rename_asset_permissions', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '21ae3b96-d909-43d6-8d3e-0f9871c03572'),
(19, 'craft', 'm160707_000001_rename_richtext_assetsource_setting', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'a63e6179-f29a-4794-a0d6-068853516b13'),
(20, 'craft', 'm160708_185142_volume_hasUrls_setting', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '6fdbf180-9924-402d-a0b4-bebe11c07f46'),
(21, 'craft', 'm160714_000000_increase_max_asset_filesize', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '76c8703f-bb67-40d4-b93e-8bc725771449'),
(22, 'craft', 'm160727_194637_column_cleanup', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'de28a9b6-a72c-4072-ad6b-b484c4b51f01'),
(23, 'craft', 'm160804_110002_userphotos_to_assets', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'c01008e8-bfa6-4887-8631-af708b8bcd69'),
(24, 'craft', 'm160807_144858_sites', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'c0869c54-b6d5-4000-b2ec-be74ab8cde40'),
(25, 'craft', 'm160829_000000_pending_user_content_cleanup', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2e5aac1d-8f3c-4f33-a022-e63eaab280a2'),
(26, 'craft', 'm160830_000000_asset_index_uri_increase', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '8f6965d9-7e3c-4915-b8ed-ead309daeed0'),
(27, 'craft', 'm160912_230520_require_entry_type_id', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '7052c23e-e072-4060-9e9e-614ef6317e2f'),
(28, 'craft', 'm160913_134730_require_matrix_block_type_id', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'dbf05aa9-cef0-42fb-a5cc-a4af59aae9ee'),
(29, 'craft', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '445d1ec6-c617-4def-bfb0-c330b44ef884'),
(30, 'craft', 'm160920_231045_usergroup_handle_title_unique', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'd8277539-1b03-4e26-9851-14108834c607'),
(31, 'craft', 'm160925_113941_route_uri_parts', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '4cd09bd8-03ac-4895-9b6f-16513ed37bb0'),
(32, 'craft', 'm161006_205918_schemaVersion_not_null', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '72fa9019-fb15-4844-858f-dec808b4f418'),
(33, 'craft', 'm161007_130653_update_email_settings', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '9afdd665-2597-4404-a5e9-93ecfbf20692'),
(34, 'craft', 'm161013_175052_newParentId', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '75306d77-f616-4709-8f32-168db52b18c4'),
(35, 'craft', 'm161021_102916_fix_recent_entries_widgets', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '15306683-6d56-4cc0-a22a-22bdc0aeaabe'),
(36, 'craft', 'm161021_182140_rename_get_help_widget', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'e9d3e58c-a022-4d1c-aaa0-8e617fd19519'),
(37, 'craft', 'm161025_000000_fix_char_columns', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'de17c90d-ec5b-471d-81e1-5dd99fc29e66'),
(38, 'craft', 'm161029_124145_email_message_languages', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '1afa27e5-6404-4613-9843-7b461b88dbca'),
(39, 'craft', 'm161108_000000_new_version_format', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '839308cf-db1b-4959-bdc8-1d9a4f6ac7fe'),
(40, 'craft', 'm161109_000000_index_shuffle', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '51459c43-2fc1-4c0d-8027-9be8be929c11'),
(41, 'craft', 'm161122_185500_no_craft_app', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'fa18bd13-7a88-42b7-8509-31a999a4a0b1'),
(42, 'craft', 'm161125_150752_clear_urlmanager_cache', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '3c3e9971-b0e6-4bd2-a6e8-dcff00ec0c60'),
(43, 'craft', 'm161220_000000_volumes_hasurl_notnull', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '83ebee0a-a0f0-4bea-a0ee-fb3c6bdf7356'),
(44, 'craft', 'm170114_161144_udates_permission', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '53c03309-255b-4afe-8910-a3579a2a3cf8'),
(45, 'craft', 'm170120_000000_schema_cleanup', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'b2676e7d-dc35-421b-b869-cd3fdc5d0a38'),
(46, 'craft', 'm170126_000000_assets_focal_point', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '159fda66-156e-44a0-bf92-4b2f341b7fa9'),
(47, 'craft', 'm170206_142126_system_name', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'f46dfb71-054e-4378-a561-b901eae47a1b'),
(48, 'craft', 'm170217_044740_category_branch_limits', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'fe56ce80-871e-43e7-89a2-a770c9cdaba3'),
(49, 'craft', 'm170217_120224_asset_indexing_columns', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'cc399104-9c04-4d1b-8d45-2f51ff6e9433'),
(50, 'craft', 'm170223_224012_plain_text_settings', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '8d0513ef-c52c-470c-9030-739503a6d254'),
(51, 'craft', 'm170227_120814_focal_point_percentage', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '809614d7-2486-4320-96ff-2cd6a0d12d2f'),
(52, 'craft', 'm170228_171113_system_messages', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '01c2063d-1e4a-4152-b142-730de49134bd'),
(53, 'craft', 'm170303_140500_asset_field_source_settings', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '54ca6568-c800-46d0-8f0a-03c4f2260ef4'),
(54, 'craft', 'm170306_150500_asset_temporary_uploads', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'dd746a0b-763f-4221-88ac-7e593533bd61'),
(55, 'craft', 'm170523_190652_element_field_layout_ids', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '02fd1710-3571-4bfb-8d6f-d970009e4a55'),
(56, 'craft', 'm170621_195237_format_plugin_handles', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'a9282f20-4ad6-4f8b-a808-3dbd9fc2eea8'),
(57, 'craft', 'm170630_161027_deprecation_line_nullable', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '104a6e14-eaf1-485e-997e-dec078d7637f'),
(58, 'craft', 'm170630_161028_deprecation_changes', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'fabf12ad-cb82-4613-b412-17e807ae60c0'),
(59, 'craft', 'm170703_181539_plugins_table_tweaks', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '7a3ed88f-7866-407f-91e6-4a12b5095804'),
(60, 'craft', 'm170704_134916_sites_tables', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '486b3d5e-7ff6-4f70-8b7b-ad8c7f639f44'),
(61, 'craft', 'm170706_183216_rename_sequences', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'ef325fe2-e7f2-4881-a2a7-aa0a99fb25a5'),
(62, 'craft', 'm170707_094758_delete_compiled_traits', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '6c11fbcc-930a-4bd7-9dc2-9fed297c91ba'),
(63, 'craft', 'm170731_190138_drop_asset_packagist', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '40465507-e207-4144-89a7-d00216ad170b'),
(64, 'craft', 'm170810_201318_create_queue_table', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '37d6070f-442a-47d8-a583-0ff7485a6685'),
(65, 'craft', 'm170903_192801_longblob_for_queue_jobs', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '59e32785-b096-47d6-bf1e-a9036217b125'),
(66, 'craft', 'm170914_204621_asset_cache_shuffle', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'e9670aeb-d3d1-419c-9066-f830588d1511'),
(67, 'craft', 'm171011_214115_site_groups', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '6036ee17-a893-41ba-abf6-5e6c11edd1a3'),
(68, 'craft', 'm171012_151440_primary_site', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'a27fb884-0f43-4209-a320-f6e29f5e788e'),
(69, 'craft', 'm171013_142500_transform_interlace', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'f5e8da4d-8ace-4892-9cc2-7fb6cd9fe656'),
(70, 'craft', 'm171016_092553_drop_position_select', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'd4cb8f6d-15cf-4b16-9b9b-fb6d90c38f51'),
(71, 'craft', 'm171016_221244_less_strict_translation_method', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'a8363656-4607-49c6-b418-1459abbcb9fe'),
(72, 'craft', 'm171107_000000_assign_group_permissions', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'e600782f-f55d-42d0-9e98-683ca915d636'),
(73, 'craft', 'm171117_000001_templatecache_index_tune', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '6237feaa-e795-48d8-af09-f54f8fc0412a'),
(74, 'craft', 'm171126_105927_disabled_plugins', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'c0ea9938-eaa6-4203-b42e-eb150b702595'),
(75, 'craft', 'm171130_214407_craftidtokens_table', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '5dca0bb1-94c9-4da2-b8da-2d5aee4e2717'),
(76, 'craft', 'm171202_004225_update_email_settings', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '842d6a5a-c3b1-47ef-84b6-09e6cb3c73f5'),
(77, 'craft', 'm171204_000001_templatecache_index_tune_deux', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'df12c907-52cf-4494-8b82-1af8ac81bd00'),
(78, 'craft', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '9d52d84a-4982-433f-928e-fdc73e3f9c72'),
(79, 'craft', 'm171218_143135_longtext_query_column', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'c04623d8-7b98-464e-bbb5-41f4e19331e3'),
(80, 'craft', 'm171231_055546_environment_variables_to_aliases', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '9341f0c5-e9b4-42b0-8016-79866f46c45a'),
(81, 'craft', 'm180113_153740_drop_users_archived_column', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '0c5236a8-13c8-4252-9582-0292f1515aca'),
(82, 'craft', 'm180122_213433_propagate_entries_setting', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'd868e449-10b1-4b9f-9292-e1161f956fa9'),
(83, 'craft', 'm180124_230459_fix_propagate_entries_values', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '285db3cd-6e4d-4752-96c8-8807e7317a40'),
(84, 'craft', 'm180128_235202_set_tag_slugs', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '1a2bc749-37a4-4a42-a200-0694561f757e'),
(85, 'craft', 'm180202_185551_fix_focal_points', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '82e11b19-7130-4cb9-9eab-be181dc8ced0'),
(86, 'craft', 'm180217_172123_tiny_ints', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '3ea9df8c-4052-4295-9e90-68b1c4925f0f'),
(87, 'craft', 'm180321_233505_small_ints', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'bda81105-43ee-45d3-82e7-e95e646772e7'),
(88, 'craft', 'm180404_182320_edition_changes', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'dbf7a760-ec84-45e9-8726-748b5ccd744a'),
(89, 'craft', 'm180411_102218_fix_db_routes', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '35d75802-f43e-40e0-8f7f-05edde579f63'),
(90, 'craft', 'm180416_205628_resourcepaths_table', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'a31d8d7d-9b49-44a6-9969-f7a0998177df'),
(91, 'craft', 'm180418_205713_widget_cleanup', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '7d7cc98b-0446-4837-b54a-f9dd5b146890'),
(92, 'craft', 'm180425_203349_searchable_fields', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '9e0db0ef-5163-4ceb-bb77-6c1c1d675ea4'),
(93, 'craft', 'm180516_153000_uids_in_field_settings', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '25a2386a-ca35-4147-aaa8-4d6103137e4b'),
(94, 'craft', 'm180517_173000_user_photo_volume_to_uid', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '0469f6c8-a8d2-46d4-a6e6-63766b9c926b'),
(95, 'craft', 'm180518_173000_permissions_to_uid', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'cc9738b1-c4dd-47fd-81a4-5a54975b1326'),
(96, 'craft', 'm180520_173000_matrix_context_to_uids', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '73d9551d-22ed-4097-ad8e-07fb1613e9a8'),
(97, 'craft', 'm180521_172900_project_config_table', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '85743bcb-b859-4699-8fda-4bad7cd766ec'),
(98, 'craft', 'm180521_173000_initial_yml_and_snapshot', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '48045c31-0bfc-4e7e-8085-b3287d7c0e0e'),
(99, 'craft', 'm180731_162030_soft_delete_sites', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'efe30eea-e95c-4a64-b770-e0f812a8c4c8'),
(100, 'craft', 'm180810_214427_soft_delete_field_layouts', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'e11c0247-e10d-46d8-aacb-74e942bde833'),
(101, 'craft', 'm180810_214439_soft_delete_elements', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2eecfd18-9c9d-491f-81bb-973ed219493b'),
(102, 'craft', 'm180824_193422_case_sensitivity_fixes', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'b1e79779-e572-415b-a9b9-d568cdb8931e'),
(103, 'craft', 'm180901_151639_fix_matrixcontent_tables', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'b38dc3c5-0e76-4d89-88d9-6089446f2ceb'),
(104, 'craft', 'm180904_112109_permission_changes', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '7c9fe5f2-99e7-47d7-9daf-7957f1d6ebfe'),
(105, 'craft', 'm180910_142030_soft_delete_sitegroups', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '1799e762-f70b-4b06-bd5e-acead699c21a'),
(106, 'craft', 'm181011_160000_soft_delete_asset_support', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '5f87219b-83de-46ad-b37e-4e8c542df33a'),
(107, 'craft', 'm181016_183648_set_default_user_settings', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'fe205219-4768-4309-8ed9-09b01765f02e'),
(108, 'craft', 'm181017_225222_system_config_settings', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '45d1f4e9-4b08-46ed-963e-319bbbd153fd'),
(109, 'craft', 'm181018_222343_drop_userpermissions_from_config', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '6ed64c03-ab99-4a20-bfe3-1c9a5078e6a2'),
(110, 'craft', 'm181029_130000_add_transforms_routes_to_config', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'b8112799-9863-47ac-abad-46f173678d6e'),
(111, 'craft', 'm181112_203955_sequences_table', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '00383e14-095d-4140-98f5-93742bbf2f3d'),
(112, 'craft', 'm181121_001712_cleanup_field_configs', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '5d8fb330-4d8e-43cc-9c1e-cdf6875cc7d2'),
(113, 'craft', 'm181128_193942_fix_project_config', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'e8b7de7d-3704-47af-81d4-5781f55a58fb'),
(114, 'craft', 'm181130_143040_fix_schema_version', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '064fe538-9d7a-4e4b-bd33-1124fc5f5809'),
(115, 'craft', 'm181211_143040_fix_entry_type_uids', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'bc86bc27-a275-47cf-8913-3cc245c422ae'),
(116, 'craft', 'm181217_153000_fix_structure_uids', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'f3dce8de-9b86-4e0f-b7a2-7bc17c07470a'),
(117, 'craft', 'm190104_152725_store_licensed_plugin_editions', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '91c7f61d-9370-4f54-9599-02bd90c8107c'),
(118, 'craft', 'm190108_110000_cleanup_project_config', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '78d7c17e-2ca5-4a56-a1c5-07df0e4f62e3'),
(119, 'craft', 'm190108_113000_asset_field_setting_change', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'bfafc806-4053-4139-b000-de2b7b4c5e4c'),
(120, 'craft', 'm190109_172845_fix_colspan', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '538f17a7-2cb8-42ed-b513-6800e4a120db'),
(121, 'craft', 'm190110_150000_prune_nonexisting_sites', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '262eaee5-5a99-4d2b-92f9-04ccfbbe195c'),
(122, 'craft', 'm190110_214819_soft_delete_volumes', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'eb6ac404-77bb-4f3e-91ca-d4403ae97285'),
(123, 'craft', 'm190112_124737_fix_user_settings', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '3c53f3d7-018e-4b13-92a0-33e47d968835'),
(124, 'craft', 'm190112_131225_fix_field_layouts', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '92e1a8d7-44e3-40be-bcaf-34b847f6658a'),
(125, 'craft', 'm190112_201010_more_soft_deletes', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '3508edfa-abb4-42f9-83b4-7b5722e5f04f'),
(126, 'craft', 'm190114_143000_more_asset_field_setting_changes', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '1a516718-fa21-4b97-ba12-4c6f4f54faf9'),
(127, 'craft', 'm190121_120000_rich_text_config_setting', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '605edc3a-352c-4194-b86e-5c8d9d51b78c'),
(128, 'craft', 'm190125_191628_fix_email_transport_password', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'fc8899bc-6908-4dca-ab3a-e5962045c922'),
(129, 'craft', 'm190128_181422_cleanup_volume_folders', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '8c02a3f1-472e-4398-823c-fd70562f4b6b'),
(130, 'craft', 'm190205_140000_fix_asset_soft_delete_index', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'cdb9aa00-3d30-4c36-b4c8-3f9d2d735409'),
(131, 'craft', 'm190218_143000_element_index_settings_uid', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '814a8319-a175-43fe-9987-99bcc901db08'),
(132, 'craft', 'm190312_152740_element_revisions', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'd39c5c44-ee86-488d-a924-fb91c6571afe'),
(133, 'craft', 'm190327_235137_propagation_method', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '158b46e5-1827-40fa-9461-4d1cd1bb4c70'),
(134, 'craft', 'm190401_223843_drop_old_indexes', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '7ad4f617-aec5-47f9-8427-878710bda809'),
(135, 'craft', 'm190416_014525_drop_unique_global_indexes', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '29d71214-b2c1-4234-8327-8bbb8e130f43'),
(136, 'craft', 'm190417_085010_add_image_editor_permissions', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '971bbcdb-f8c2-43f8-8489-938846adbef6'),
(137, 'craft', 'm190502_122019_store_default_user_group_uid', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'ea93c22d-e996-45c8-844b-c44b5001945c'),
(138, 'craft', 'm190504_150349_preview_targets', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'b1802114-5754-492b-830f-2f94e499bd28'),
(139, 'craft', 'm190516_184711_job_progress_label', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '878e0741-3840-4414-bf4b-193cf82f4042'),
(140, 'craft', 'm190523_190303_optional_revision_creators', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '9d0d10a7-f1b9-4410-aa28-2a6af7978bfc'),
(141, 'craft', 'm190529_204501_fix_duplicate_uids', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '9155b22c-9fbe-4edc-8c88-7e8c386c76ad'),
(142, 'craft', 'm190605_223807_unsaved_drafts', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '6d3f985f-56c6-431b-9436-fb5304654804'),
(143, 'craft', 'm190607_230042_entry_revision_error_tables', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '26e3e654-691b-49a3-8a91-f244092acf1a'),
(144, 'craft', 'm190608_033429_drop_elements_uid_idx', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '3d6c82c1-4759-4fa9-9c91-a7de90247e02'),
(145, 'craft', 'm190617_164400_add_gqlschemas_table', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '89630b29-5b23-4bb5-9e22-b6a0f195696c'),
(146, 'craft', 'm190624_234204_matrix_propagation_method', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'd047eeb8-61a9-46de-b471-9f05d5ccdab6'),
(147, 'craft', 'm190711_153020_drop_snapshots', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '79e5b087-b937-4190-8e5b-2807b8733031'),
(148, 'craft', 'm190712_195914_no_draft_revisions', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'd1bd82e2-6f73-4c2f-9423-896cb02cc591'),
(149, 'craft', 'm190723_140314_fix_preview_targets_column', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '62c792b5-a02d-4f91-a551-7f9f7132187f'),
(150, 'craft', 'm190820_003519_flush_compiled_templates', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '1f042518-d153-4c69-b2d6-132fa1c694a3'),
(151, 'craft', 'm190823_020339_optional_draft_creators', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'cbbb4938-df6a-49c5-9a15-f49a28e66335'),
(152, 'craft', 'm190913_152146_update_preview_targets', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'f855b587-110f-431b-bf8f-3b5b8ad7594b'),
(153, 'craft', 'm191107_122000_add_gql_project_config_support', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'cd2fa684-53a0-4f9c-8d28-41718d7b523e'),
(154, 'craft', 'm191204_085100_pack_savable_component_settings', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'c239b0fc-fa98-4675-9d55-4a5c22975455'),
(155, 'craft', 'm191206_001148_change_tracking', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '0bd83608-616d-4a96-989d-a7ae14605e42'),
(156, 'craft', 'm191216_191635_asset_upload_tracking', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2f02381b-fb0f-461a-a15f-fa96b7dac154'),
(157, 'craft', 'm191222_002848_peer_asset_permissions', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '1e61cc02-d018-4569-a71a-4eb7198c8a2b'),
(158, 'craft', 'm200127_172522_queue_channels', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '951442ee-6b73-4070-95d5-de814480aefb'),
(159, 'craft', 'm200211_175048_truncate_element_query_cache', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'a9076b8c-8556-4b3c-ab60-ab500e235f92'),
(160, 'craft', 'm200213_172522_new_elements_index', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '4915fe86-1a64-4f2d-8922-2de4c89d3621'),
(161, 'craft', 'm200228_195211_long_deprecation_messages', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'acfe65c2-1c81-4fad-aabe-19a3755ccdc4'),
(162, 'craft', 'm200306_054652_disabled_sites', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '9d4d4bf8-ab33-463d-97bf-3c4b8c4c5891'),
(163, 'craft', 'm200522_191453_clear_template_caches', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '0e081b8b-628e-4ee0-a66f-842ab7379682'),
(164, 'craft', 'm200606_231117_migration_tracks', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '6a732492-6dab-460d-9d13-cd811508a58e'),
(165, 'craft', 'm200619_215137_title_translation_method', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '48ee6a51-caed-4033-b622-52d08969ede9'),
(166, 'craft', 'm200620_005028_user_group_descriptions', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '67ea64cd-1cff-4839-bc3e-ce1d708182ec'),
(167, 'craft', 'm200620_230205_field_layout_changes', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '71292bca-b60d-4a5d-8d22-78a2afe95d1a'),
(168, 'craft', 'm200625_131100_move_entrytypes_to_top_project_config', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'd397145d-438f-4791-87e1-4a44bf101a08'),
(169, 'craft', 'm200629_112700_remove_project_config_legacy_files', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'f2075f72-eeb0-49ad-adfe-6f5a53b95fe9'),
(170, 'craft', 'm200630_183000_drop_configmap', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '9dab5fdf-99c0-4cd7-9cf2-78d7a94332da'),
(171, 'craft', 'm200715_113400_transform_index_error_flag', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '3016353c-0d8b-4e4e-bc09-a0805a613be1'),
(172, 'craft', 'm200716_110900_replace_file_asset_permissions', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '9b9d1f40-90e4-416a-a309-e6d3c0f3c3e8'),
(173, 'craft', 'm200716_153800_public_token_settings_in_project_config', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '6a47fc02-96f6-467d-abcb-90657def154c'),
(174, 'craft', 'm200720_175543_drop_unique_constraints', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '24a73ac1-e162-40ad-8f11-1dfc449f88ce'),
(175, 'craft', 'm200825_051217_project_config_version', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '7b665da1-5f5f-4a27-8ea3-ce3f2ddee578'),
(176, 'craft', 'm201116_190500_asset_title_translation_method', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'c7f0d45f-8645-46c9-abbb-918a456aff4a'),
(177, 'craft', 'm201124_003555_plugin_trials', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'b9a2297a-1037-47a8-a0fe-cf62db891baf'),
(178, 'craft', 'm210209_135503_soft_delete_field_groups', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '7e72a204-44ce-4e84-b66a-754a0a5ceaa7'),
(179, 'craft', 'm210212_223539_delete_invalid_drafts', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'd457940f-c575-4709-8a49-466ae6305b8f'),
(180, 'craft', 'm210214_202731_track_saved_drafts', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'ab11dc46-2b5c-4af1-86e3-323cb328dd89'),
(181, 'craft', 'm210223_150900_add_new_element_gql_schema_components', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'c12313d8-10d9-4c1c-a6f2-8ef981ee5406'),
(182, 'craft', 'm210224_162000_add_projectconfignames_table', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', 'e14d6f27-b060-4bc4-be4b-c7acbd194688'),
(183, 'craft', 'm210326_132000_invalidate_projectconfig_cache', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '8e5daf01-7ee5-4fb6-86bd-d703f98a8a43'),
(184, 'craft', 'm210331_220322_null_author', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:02:02', '7547a8e8-77f6-4197-8c53-a9a3228aab62');

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projectconfig`
--

CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projectconfig`
--

INSERT INTO `projectconfig` (`path`, `value`) VALUES
('dateModified', '1623924121'),
('email.fromEmail', '\"anuar@hey.com\"'),
('email.fromName', '\"CraftCMS - Gulp workflow\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('fieldGroups.3de9f34b-4f3e-4e93-ac00-2031eee86068.name', '\"Common\"'),
('siteGroups.a39cbc0a-4889-4c0c-b4ad-ac304421b5e4.name', '\"CraftCMS - Gulp workflow\"'),
('sites.df5f6408-413c-4f1d-bbd3-057c41b0e8b4.baseUrl', '\"$PRIMARY_SITE_URL\"'),
('sites.df5f6408-413c-4f1d-bbd3-057c41b0e8b4.handle', '\"default\"'),
('sites.df5f6408-413c-4f1d-bbd3-057c41b0e8b4.hasUrls', 'true'),
('sites.df5f6408-413c-4f1d-bbd3-057c41b0e8b4.language', '\"en-US\"'),
('sites.df5f6408-413c-4f1d-bbd3-057c41b0e8b4.name', '\"CraftCMS - Gulp workflow\"'),
('sites.df5f6408-413c-4f1d-bbd3-057c41b0e8b4.primary', 'true'),
('sites.df5f6408-413c-4f1d-bbd3-057c41b0e8b4.siteGroup', '\"a39cbc0a-4889-4c0c-b4ad-ac304421b5e4\"'),
('sites.df5f6408-413c-4f1d-bbd3-057c41b0e8b4.sortOrder', '1'),
('system.edition', '\"solo\"'),
('system.live', 'true'),
('system.name', '\"CraftCMS - Gulp workflow\"'),
('system.schemaVersion', '\"3.6.8\"'),
('system.timeZone', '\"America/Los_Angeles\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', 'null'),
('users.photoVolumeUid', 'null'),
('users.requireEmailVerification', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `projectconfignames`
--

CREATE TABLE `projectconfignames` (
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projectconfignames`
--

INSERT INTO `projectconfignames` (`uid`, `name`) VALUES
('3de9f34b-4f3e-4e93-ac00-2031eee86068', 'Common'),
('a39cbc0a-4889-4c0c-b4ad-ac304421b5e4', 'CraftCMS - Gulp workflow'),
('df5f6408-413c-4f1d-bbd3-057c41b0e8b4', 'CraftCMS - Gulp workflow');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) UNSIGNED NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

CREATE TABLE `relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resourcepaths`
--

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('10509713', '@craft/web/assets/craftsupport/dist'),
('185620de', '@craft/web/assets/login/dist'),
('2688a050', '@lib/axios'),
('2c5fe019', '@lib/jquery-ui'),
('2f45aa57', '@craft/web/assets/feed/dist'),
('34380dba', '@craft/web/assets/editsection/dist'),
('56068c9c', '@craft/web/assets/dashboard/dist'),
('5ce92734', '@lib/element-resize-detector'),
('62f67bbc', '@lib/velocity'),
('73798cc1', '@bower/jquery/dist'),
('7ed1d454', '@lib/jquery.payment'),
('89462374', '@craft/web/assets/recententries/dist'),
('a0fee35d', '@craft/web/assets/installer/dist'),
('a1c1d948', '@lib/xregexp'),
('abad9dc2', '@lib/selectize'),
('ad82b88b', '@craft/web/assets/cp/dist'),
('b630325', '@lib/vue'),
('b7fc611a', '@craft/web/assets/updateswidget/dist'),
('c2cb8791', '@lib/garnishjs'),
('d78d53af', '@lib/fabric'),
('de666297', '@craft/web/assets/admintable/dist'),
('e73bb1b8', '@lib/fileupload'),
('eb988eaf', '@lib/iframe-resizer'),
('f1769017', '@lib/d3'),
('f8778c84', '@lib/jquery-touch-events'),
('ffd3b046', '@lib/picturefill');

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `searchindex`
--

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' admin craftgulp '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' anuar hey com '),
(1, 'slug', 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `previewTargets` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections_sites`
--

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sequences`
--

CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, 'S-m1cisS7yAgtBrB6Pvl9fCEB8KLb5CZ_RiWikikXKfoXppwoFMF03gGjgmeqf-5itUIsQ3u-T7OoeUinynnEcoVg45X0FRnauEB', '2021-06-17 10:03:46', '2021-06-17 10:03:46', 'b1a09b2a-8b88-487c-b5a8-d99e0d01254e');

-- --------------------------------------------------------

--
-- Table structure for table `shunnedmessages`
--

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sitegroups`
--

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'CraftCMS - Gulp workflow', '2021-06-17 10:02:01', '2021-06-17 10:02:01', NULL, 'a39cbc0a-4889-4c0c-b4ad-ac304421b5e4');

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 1, 'CraftCMS - Gulp workflow', 'default', 'en-US', 1, '$PRIMARY_SITE_URL', 1, '2021-06-17 10:02:01', '2021-06-17 10:02:01', NULL, 'df5f6408-413c-4f1d-bbd3-057c41b0e8b4');

-- --------------------------------------------------------

--
-- Table structure for table `structureelements`
--

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `structures`
--

CREATE TABLE `structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `systemmessages`
--

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taggroups`
--

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templatecacheelements`
--

CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templatecachequeries`
--

CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templatecaches`
--

CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups`
--

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups_users`
--

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions`
--

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_usergroups`
--

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_users`
--

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpreferences`
--

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\"}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'admin_craftgulp', NULL, NULL, NULL, 'anuar@hey.com', '$2y$13$d/FChUKRB5IJDGZxojQWJubP/q6rHi9/xV2cuRLOVb4SabtDB/l.O', 1, 0, 0, 0, '2021-06-17 10:03:46', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-17 10:03:46', '3c08f9e6-0f71-4c9b-955e-ceb5b9bb49e7');

-- --------------------------------------------------------

--
-- Table structure for table `volumefolders`
--

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `volumes`
--

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"siteId\":1,\"section\":\"*\",\"limit\":10}', 1, '2021-06-17 10:03:45', '2021-06-17 10:03:45', '0d65ec8c-9354-4d08-a5cb-d451410839ec'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2021-06-17 10:03:45', '2021-06-17 10:03:45', '2e72e687-de9d-49f2-8bcc-ec77de1ac1f6'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2021-06-17 10:03:45', '2021-06-17 10:03:45', 'e71c5271-e08a-4c52-861b-1b9ee251b574'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2021-06-17 10:03:45', '2021-06-17 10:03:45', '93b014d6-0002-4675-8a12-16afd0c4a779');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lwkbjellwcrnvvfrflttsbczsovtmrktsedo` (`sessionId`,`volumeId`),
  ADD KEY `idx_stsitbyzxhaclglmdvncxilqrngjfdmgodtb` (`volumeId`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jvyvnellgpqnlgvqoggcnoylsjouyojletin` (`filename`,`folderId`),
  ADD KEY `idx_dslifxtkyqkikwykjkcuigvkiszdfpfpuhsg` (`folderId`),
  ADD KEY `idx_mxioqmmgehnnvlustgmgytcnztcaamceuimh` (`volumeId`),
  ADD KEY `fk_anlawijfzazgbivqnsekmedigmwmaxfygeys` (`uploaderId`);

--
-- Indexes for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vetinxhynjxbbyuktjlrqcnfcpecuwsavdcq` (`volumeId`,`assetId`,`location`);

--
-- Indexes for table `assettransforms`
--
ALTER TABLE `assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_yqwjgodwpowknubimbvzrojfiouotbvljzdv` (`name`),
  ADD KEY `idx_wejemoffyxgjnggtwbwacfvlmlopzoizbaii` (`handle`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pjehrsgdcebdlcdgdbogevglkfocosetqwyn` (`groupId`),
  ADD KEY `fk_aiuuklroumaofemjfxnmkraqyithtqlfnzgy` (`parentId`);

--
-- Indexes for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rdqzbkwjqtsjyyeoubkuyyofrskkhpvimfom` (`name`),
  ADD KEY `idx_nxseklwyvkozncdfgrwncrpvhulqujwjvqbg` (`handle`),
  ADD KEY `idx_ujcvkaujdmwhymmyhmuxsmlyeopkyesdggko` (`structureId`),
  ADD KEY `idx_sijrqqmaqfsgfomxxxnxkqurqtebspwmnhll` (`fieldLayoutId`),
  ADD KEY `idx_jmilyzlytgykdnqxtrxmpmvjezjvjofspzzs` (`dateDeleted`);

--
-- Indexes for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_uvhcdlifjgouokdgbnsxlupzrknnvaclaggu` (`groupId`,`siteId`),
  ADD KEY `idx_lgedypxfdsuvnstkaxelkpsfcxnuhmsqqogs` (`siteId`);

--
-- Indexes for table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  ADD KEY `idx_qxbpevpdrtfdmglyfynrugtgauedfijytvaw` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `fk_dvxplgvgfotkgivetvgwordtinzmofwoppry` (`siteId`),
  ADD KEY `fk_wugifkbriwtlcmovjjqwwmjqbahjxxtlppza` (`userId`);

--
-- Indexes for table `changedfields`
--
ALTER TABLE `changedfields`
  ADD PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  ADD KEY `idx_apmaeqlqslqgnslnbgievgxpkiniqdhtlenb` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `fk_htbosmquqfcwdpjwqibxpmhxizoqvjztyewf` (`siteId`),
  ADD KEY `fk_trkrswmjdaytaxpctcbpldxnsesnpfbvnsrh` (`fieldId`),
  ADD KEY `fk_gsksbgujrtrllfpvzgqhbttdqhqkfoefxbwm` (`userId`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_hgscipmutoolqbsezkanppcruxznimczhxww` (`elementId`,`siteId`),
  ADD KEY `idx_judhhtzylmcobzfqrqyfcmnnrwumijhqygdo` (`siteId`),
  ADD KEY `idx_ntsdvqfytiysvpauzrlgjflbppfpkrfowprt` (`title`);

--
-- Indexes for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bucmjrbulujghyvpufipswznxejclyucnnge` (`userId`);

--
-- Indexes for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_cnzzvjcdfomudslfaqhthquajczsbnypzlmv` (`key`,`fingerprint`);

--
-- Indexes for table `drafts`
--
ALTER TABLE `drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jiuxrpvutnknaeygziugogskratkmyiauwgs` (`saved`),
  ADD KEY `fk_flepcxulhzlfnnltisycwosoekrkgxpbwnax` (`creatorId`),
  ADD KEY `fk_mljqgywwsphpbypojxmritmgbjcbbrtfhrot` (`sourceId`);

--
-- Indexes for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_jvmofxrkgwkgxswxviemvujubkqbqqhfhqye` (`type`);

--
-- Indexes for table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wzargvwhodsysddevxwcepcbouhsxufwjpqd` (`dateDeleted`),
  ADD KEY `idx_ugsfdhlpwefmbhqotaoroqheivoaolienwam` (`fieldLayoutId`),
  ADD KEY `idx_fczrrrsrofelycraokkhtwzcpiiviflayghq` (`type`),
  ADD KEY `idx_imsxghaxwvpekyrwiwnvxazfjlgnxamiegqu` (`enabled`),
  ADD KEY `idx_qlpaluyohkmgadkjryuapyaxzvdlfzlmfxpa` (`archived`,`dateCreated`),
  ADD KEY `idx_ogmfbqstumgilaxihsqvfoytgisudzsuogcb` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  ADD KEY `fk_tgiepgjyxfvavyqlgaxnlagrzrakepmtncjb` (`draftId`),
  ADD KEY `fk_fhmoqcjpnyhyazzhqoknhprqfcrwfwkyzddu` (`revisionId`);

--
-- Indexes for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_miwgjchtdewfsekwyhalgbpqtuzkbjvinqdk` (`elementId`,`siteId`),
  ADD KEY `idx_szvwlnwmeusbsrecbpknsygpfkuqpzqeekhj` (`siteId`),
  ADD KEY `idx_kbmyoidiqixaoyvxpouznsxecqzqbcspoosq` (`slug`,`siteId`),
  ADD KEY `idx_mqzmxohxiilauqnjdrhrbfnzfmuimzrnomtf` (`enabled`),
  ADD KEY `idx_icqlxkdqdusopvxffiixikgjqvdozuqbathh` (`uri`,`siteId`);

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vsvmlqduhxohepgggjqljgcbyjonfrrcteuz` (`postDate`),
  ADD KEY `idx_zkcnayjxuximepofwnsksztdvmqzkpucokoo` (`expiryDate`),
  ADD KEY `idx_rfpbexptdtahnnftfzjexsxugmjwfbmacxbn` (`authorId`),
  ADD KEY `idx_arwjtffpitecrjllcdecejurxvvrehwwjuqw` (`sectionId`),
  ADD KEY `idx_usfremqoxerdoclppzmsllxtgfwqttzpjlii` (`typeId`),
  ADD KEY `fk_gelpaxfuajmntpyfmgeugiguimxkkhcruepq` (`parentId`);

--
-- Indexes for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_devsnzxfrmxluyqzkmtyuneffvjcrbavgvod` (`name`,`sectionId`),
  ADD KEY `idx_fdrooklnuoefqnqfqbxsbayxviijosbdynqi` (`handle`,`sectionId`),
  ADD KEY `idx_mixunoktmzjgvreaqghjxvhpxsbhajcjhevi` (`sectionId`),
  ADD KEY `idx_xjyghrkvpbarewmukiprjzfqgyornecdkrao` (`fieldLayoutId`),
  ADD KEY `idx_mjgqtknzhhzayxamzqlznazwiyhfvodavfsa` (`dateDeleted`);

--
-- Indexes for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_azllwskqamcfmecfsshopxvobgtqgopklabw` (`name`),
  ADD KEY `idx_kxwnbxsatvtigsrgmtmxokzwtyyldmqceskf` (`dateDeleted`,`name`);

--
-- Indexes for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_rdfbtvwqzupmavtegsltmwsvxgqgucibqluv` (`layoutId`,`fieldId`),
  ADD KEY `idx_olgyswttqozpuwmocylkncceshzwfulcajmc` (`sortOrder`),
  ADD KEY `idx_gebquhdrzexctzisenhoewpddzmcxvnoajyr` (`tabId`),
  ADD KEY `idx_updazbjodegxeeutxwdgydvpmbvepauoduzs` (`fieldId`);

--
-- Indexes for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_xhsiexpmribxupqiazhgmemhqttiggrdqrbu` (`dateDeleted`),
  ADD KEY `idx_tcmsomtjzzfbyqfszbtnwmccwfqyodbgzypb` (`type`);

--
-- Indexes for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fzbryovvsdzmwvnvaoyqanfnuieypybdyasy` (`sortOrder`),
  ADD KEY `idx_wrjpxnglltnpfcwhlyuvjcujzehxrfatluou` (`layoutId`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vkenyjcojmcfxpdmwtcjomdmstubeutizzbs` (`handle`,`context`),
  ADD KEY `idx_mhrbogdjhsbycnpevyrpqfzcvpwyduvulhvw` (`groupId`),
  ADD KEY `idx_nzxmiebthewexdhutcalkctdcrjphxigygxf` (`context`);

--
-- Indexes for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_yunkibfjexntiytqgyevfhyjxbkjhevqzgpg` (`name`),
  ADD KEY `idx_ydrlfmbswchkviquamywmhtwbfgopshgesje` (`handle`),
  ADD KEY `idx_cdeqpbhpnlzvfioncwpjzhvtrvnpufqlvwib` (`fieldLayoutId`);

--
-- Indexes for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_tjzdbmwpyegyndjvlcvmircrsoohicbfvzkn` (`accessToken`),
  ADD UNIQUE KEY `idx_evszpwizjmnbhmisbmqdqybdputpgawhoscy` (`name`),
  ADD KEY `fk_ggzzftrhkyfasmtorldtyaesxywawqzqxfdb` (`schemaId`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_gkccuyxigfohvvzamtjptqhauzylzxonpvxx` (`ownerId`),
  ADD KEY `idx_ulddtpwyybairkuqzbfasbpkizpmgcjbaqux` (`fieldId`),
  ADD KEY `idx_fslkpetcafeokdfmhluuzphcnxcmhwihnvhy` (`typeId`),
  ADD KEY `idx_zqoorpvdeprwswfqufkayezflixyvueyxkho` (`sortOrder`);

--
-- Indexes for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_zvayujrzpdutplpaytrogdpcablopwbudhrz` (`name`,`fieldId`),
  ADD KEY `idx_jiebdgjzxoeqzmgootdxplrdhxtbcijkocge` (`handle`,`fieldId`),
  ADD KEY `idx_mtadnawehebcnbxxtpfyvuuvfqkdcahncwzl` (`fieldId`),
  ADD KEY `idx_cgjxxuxtqhgwooyjnaqtzxbrzrhbutvyfpxh` (`fieldLayoutId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ezciwatxykzacwrdldyhmscsjcmjwoeoydrc` (`track`,`name`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_iqslmvodnqhelebeaesuzksplruemglbdehv` (`handle`);

--
-- Indexes for table `projectconfig`
--
ALTER TABLE `projectconfig`
  ADD PRIMARY KEY (`path`);

--
-- Indexes for table `projectconfignames`
--
ALTER TABLE `projectconfignames`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_xqclkdiqyukhjvdigsuwnootqarbxzvegpms` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `idx_hqwvwqndumbzvcdhtdyvjgiufosjykahzqri` (`channel`,`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_lwjvkziicfqceaoalbijxlunhsnhwxdncwzu` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `idx_iuxlhepkenejevjgalcvghuvtductzvdodim` (`sourceId`),
  ADD KEY `idx_wvxgcnrchhxcnmbwmfbemeemjlawgcxrkahz` (`targetId`),
  ADD KEY `idx_thwdusubmqjkkwemwjnscnxirdrypimpfowb` (`sourceSiteId`);

--
-- Indexes for table `resourcepaths`
--
ALTER TABLE `resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ijjoabkvcblvxpetbnyobhlmwhqzuiywgeuw` (`sourceId`,`num`),
  ADD KEY `fk_gpdojhamzgesyfeairvhirqypnabfbfpcsjp` (`creatorId`);

--
-- Indexes for table `searchindex`
--
ALTER TABLE `searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `idx_osffttzetpiwvjqbsefcfkvcfrelwktrjklg` (`keywords`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_zqfmclljektnsntigkklongoqpmmxqoegmqy` (`handle`),
  ADD KEY `idx_gmcnpbrrsrdegcdzoicjnoblxoqcbxkaohlu` (`name`),
  ADD KEY `idx_vnriidhdknmiqvkezjkhanbbgkycerffqgxj` (`structureId`),
  ADD KEY `idx_xmwwbfrgdndznocxcpivkgoftbiftpclhadr` (`dateDeleted`);

--
-- Indexes for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_xdlpmgbnelyongekjblmvzrfwonopmenehug` (`sectionId`,`siteId`),
  ADD KEY `idx_xzlfbdhzrumiznxnnponbitzbljvjqhlmuvy` (`siteId`);

--
-- Indexes for table `sequences`
--
ALTER TABLE `sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_eirqmmviwtygmgbgwuameivxiofzcuyviosz` (`uid`),
  ADD KEY `idx_powsitwjjophygkhpfcktldkeorfxkdcsoog` (`token`),
  ADD KEY `idx_tvjziglbajeoybvlvrjmmxwlrxgutxksxvpi` (`dateUpdated`),
  ADD KEY `idx_byjhjoxbixedzjhepofwvptopkomqqkvkmxr` (`userId`);

--
-- Indexes for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_npvawgcdbkxeoqslscvhqujmfirkzdbbwbad` (`userId`,`message`);

--
-- Indexes for table `sitegroups`
--
ALTER TABLE `sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lcoybdfoodmbxvqbhpntglmhepavnhowdzxv` (`name`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tqwvgovcochdcqpitvutivlfqtrdkjsbamyw` (`dateDeleted`),
  ADD KEY `idx_ttldynwxbqpbnonzdlpzeijwamrwahotziaf` (`handle`),
  ADD KEY `idx_oxknfqnkbymaunkhstfgnpocyzsbxlmgrybn` (`sortOrder`),
  ADD KEY `fk_cfarozydetsycoyxivfxetkopbsavvpgoasx` (`groupId`);

--
-- Indexes for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_rhgvumpvdxsqclbwlflcsrdxhojmjyzqutxd` (`structureId`,`elementId`),
  ADD KEY `idx_xxvpwvvpeochdpzhrxgexrorrhmzlhqvipzm` (`root`),
  ADD KEY `idx_eowqkopuxzohwporalngjijhbdbignnhsylw` (`lft`),
  ADD KEY `idx_cznktwsfdrppwmzgewbxwakpthuyadiiygco` (`rgt`),
  ADD KEY `idx_zksqbymkzwzdwoctmobnnrswinmuauklgkwm` (`level`),
  ADD KEY `idx_jlfcuasrekteaplfruzjggtcmesooylmrzkg` (`elementId`);

--
-- Indexes for table `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_xkigldjhplghvkclbaqbqinuweekaviacvbm` (`dateDeleted`);

--
-- Indexes for table `systemmessages`
--
ALTER TABLE `systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_vyubnochhrrnhgwsmidiqpbxfiueepvldwcx` (`key`,`language`),
  ADD KEY `idx_sdfavgcchyrobwpihvtqerdhkplayogztanf` (`language`);

--
-- Indexes for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_flmllqtyszweiigxjkeymcikgxkinzydvujk` (`name`),
  ADD KEY `idx_jyknasmcdkzchteeafribqcbhjzdombgqfbu` (`handle`),
  ADD KEY `idx_dsejnewfvbioraanfalfjkxfzywmjcoqtmgw` (`dateDeleted`),
  ADD KEY `fk_grocuoiybjlmofeatlxihjxtjneqzzrdbdqc` (`fieldLayoutId`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ubvywfyqdsjtyixpeautnekpncwnfulobvhx` (`groupId`);

--
-- Indexes for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rnhbszzgiamdkjnakvukeledmtihhirrdhqr` (`cacheId`),
  ADD KEY `idx_tfrfojebzsgnldweoxcdeehtsxsutczxyhxc` (`elementId`);

--
-- Indexes for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ovrushuyteijxtmzmuikgnylnpqfrmjlnanl` (`cacheId`),
  ADD KEY `idx_rgaeqegjchqnzaiqcngnbfjglppfovzgidbr` (`type`);

--
-- Indexes for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tpdrlkoqdtydaiyqvkuwbsqvuiqmvfstnloe` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `idx_sxqpbttrqwbslwmtbcnwaactgkgbutomnnhf` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `idx_tcbdcrmkrzbcmbbzixysfpspxdfsnxgopfhs` (`siteId`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_cxlyegwagfnwhdufsjtqnlirolkpfsrrtipj` (`token`),
  ADD KEY `idx_ruohxyefisyeaqgwmfplzkmsfygebphxvsjp` (`expiryDate`);

--
-- Indexes for table `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_drualnftletvkyoiykdtuzgmgwycbzjtcbgs` (`handle`),
  ADD KEY `idx_kdxetadhzkfapxcknvlvspledqmvyowpvtyl` (`name`);

--
-- Indexes for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_wfygirmezjjrofsffwftarspfttiqhdwnhoz` (`groupId`,`userId`),
  ADD KEY `idx_tuifinaizewbmwnrtyguinpixaqlrlltwarx` (`userId`);

--
-- Indexes for table `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_mmavrxkxcarrzxyshmjarvljuixbgvdpsnuj` (`name`);

--
-- Indexes for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_otlaerxetsxzgvymkqxczeuyjrwehigqdbug` (`permissionId`,`groupId`),
  ADD KEY `idx_jqmtojlbgzkrjfelyniagmcvyfnckphbrzmc` (`groupId`);

--
-- Indexes for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_yptdvryrnncngsbauejwfbyhnwqnmalkdpjp` (`permissionId`,`userId`),
  ADD KEY `idx_xqasszfaquyuradawcsrdvxcwpgxptgzzyta` (`userId`);

--
-- Indexes for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_dmnwswvlyngxbpmiyilqphygkqmwdnxfebug` (`uid`),
  ADD KEY `idx_xlgamcygamhoiswwcppqcziobizdaltdgofl` (`verificationCode`),
  ADD KEY `idx_mxkflccffhekixzfzalkzhbbzlfcjhealled` (`email`),
  ADD KEY `idx_grzmnldgpxynrwbzdvmbfuypelbcptqxswqu` (`username`),
  ADD KEY `fk_ugocxqqmozsgmfkkxpkdgotkffawhiqkrtjp` (`photoId`);

--
-- Indexes for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_mupacuhyrajgfswminoyfrgcypuanzwmwivm` (`name`,`parentId`,`volumeId`),
  ADD KEY `idx_oimnycxfutsrketnidujrwuizzbicztyalyt` (`parentId`),
  ADD KEY `idx_fyojugjoiolfxdjhcohiiynwseyfxqphylcp` (`volumeId`);

--
-- Indexes for table `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ssyxykxmidqvbxpzzdibgtmptxofmwudpqhi` (`name`),
  ADD KEY `idx_umpqnqchlqurvzkuipqepeyssujoviacwtmd` (`handle`),
  ADD KEY `idx_wfkvymvofvpfxfzawzqmsaxvylrmjjckfwbf` (`fieldLayoutId`),
  ADD KEY `idx_vipwyveykfqjdwdkjbwmyzyofbxzidnvjqrs` (`dateDeleted`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_bzyrwkwqagnjejqzfticxsguajyypfmdwgqg` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransforms`
--
ALTER TABLE `assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups`
--
ALTER TABLE `categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gqltokens`
--
ALTER TABLE `gqltokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitegroups`
--
ALTER TABLE `sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `structureelements`
--
ALTER TABLE `structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `systemmessages`
--
ALTER TABLE `systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taggroups`
--
ALTER TABLE `taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecaches`
--
ALTER TABLE `templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpreferences`
--
ALTER TABLE `userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `volumefolders`
--
ALTER TABLE `volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `volumes`
--
ALTER TABLE `volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `fk_ihsanksqtzjfhovyddfsblmwrjavysjonwpe` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `fk_anlawijfzazgbivqnsekmedigmwmaxfygeys` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_kgntabiiamlupxwwxvntlhcvnaynpepaxvhj` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_naltcdwgixardwkkjjgpfisuwzfhzyoeihxm` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vbkpmeuubseqbwbjnhgouglgnqntmucpxyjq` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_aiuuklroumaofemjfxnmkraqyithtqlfnzgy` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_uucqdkoarhvwfxyynbrhhtmjdprviglmcspp` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vsrlvillydeejcycurfdxrwzqmnuocqltqqt` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `fk_juaboxfrhidondkuedonnzqwiyvyekdrbmon` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sdhpgxuetuwxmuzxsoazhjwvpllkzpwcwmdz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `fk_dvlzzdsxjipepitvmxwvuurwdgcquyyobbwp` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_hwwkuwehzzrljhioqsfubyveezydgoaznduu` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD CONSTRAINT `fk_dvxplgvgfotkgivetvgwordtinzmofwoppry` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_wugifkbriwtlcmovjjqwwmjqbahjxxtlppza` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_zefvxpwppslforyfpimisnpapqxfoakhaaaa` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `changedfields`
--
ALTER TABLE `changedfields`
  ADD CONSTRAINT `fk_gsksbgujrtrllfpvzgqhbttdqhqkfoefxbwm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_htbosmquqfcwdpjwqibxpmhxizoqvjztyewf` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_qojtgrcvwebndbgzmcphhjzaerufwbcqujju` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_trkrswmjdaytaxpctcbpldxnsesnpfbvnsrh` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `fk_nwjarkuudyajebkbeihsmtbfcepivxwoggxu` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zpzmawfyqzpsgkiunaadynhpbefrrizugqrt` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `fk_bucmjrbulujghyvpufipswznxejclyucnnge` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drafts`
--
ALTER TABLE `drafts`
  ADD CONSTRAINT `fk_flepcxulhzlfnnltisycwosoekrkgxpbwnax` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_mljqgywwsphpbypojxmritmgbjcbbrtfhrot` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `fk_fhmoqcjpnyhyazzhqoknhprqfcrwfwkyzddu` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_quepjpbatcbxwvcdybkpyeuaxfvlamgvpmjj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_tgiepgjyxfvavyqlgaxnlagrzrakepmtncjb` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `fk_nggjuohblaebugtigtruksmjgsupdsrpekib` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_rptkfsgwiursiuoxupzrjtyfpnnmcvwqjrqi` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `fk_crosbmbegwequfcpncqbkgmzbhgbkjismqbg` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_gaqcszgtlusunjclzzfmlijugclrcuwqyhfc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_gelpaxfuajmntpyfmgeugiguimxkkhcruepq` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_hrrzktqnztcigatfsraoorucwsjyywadffzm` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zpbxidfxxtpcxkbysfedtxagkbyvlnmpudvc` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `fk_wirefanxaktywprxtqlmmulwelzaommtfzez` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_ymdzmfurjcdpmejweymxukagpgvtgdduvxne` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD CONSTRAINT `fk_clypspnhynhrhmqxybvdaboeizyzknodipxe` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_fpkxrgawazajjgrirbryykddtkapobnhhkit` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_yedtwbbyguoknllvphkegwacvgrmissbcjfa` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD CONSTRAINT `fk_pclhtggltebnlhqwkqihaisnizhtzqhcebyb` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fk_kyuwinchujombpduymjblkwkxribyqwnccsa` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `fk_jacdxtjuvmazjmpiilsnknwnwkopvjntrmps` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_yosubtmzruujvrkyzawqslprluspftwcefpc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD CONSTRAINT `fk_ggzzftrhkyfasmtorldtyaesxywawqzqxfdb` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD CONSTRAINT `fk_bsekpxvuuwdblfnhhigvnpiymafpaxtswixv` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_gephdcugbmjqpcednwowykhcujhqyqoilkxs` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_szkazsahctlznmltjmrbsfbhbbjrdefskjjy` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zcykrmxjwoqrikfiupsopkchikhdovnjxjkt` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD CONSTRAINT `fk_ettqlvtatircvomavvkqbuzlfkjrekjgesag` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_qdmgfdmqelmyutdxmocwhovihuzmcvtjxmxe` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `fk_etvzrbqtlidhfxvssocbpsmwctqlqfdqaxdz` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ixvyzdkmdnhalspzrkkvfexkmqbyckkldtsn` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_oyqfkgiocwusvftyujbxxskqzvfoxopcvxds` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_uuotryjiyfafvvasgdmrnimjozwhkclbmirf` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `revisions`
--
ALTER TABLE `revisions`
  ADD CONSTRAINT `fk_gpdojhamzgesyfeairvhirqypnabfbfpcsjp` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_lehykesmlpvazgmxuxwqxoinnyvokeozbdde` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `fk_dersodzvpfgccylbdakbxxmfbimstaqemive` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `fk_lliayblwmcfttclvlxmytbtceaywlfgcnspt` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_qyeiqoebqeveuleznklsdzcbyhwbciedmjax` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `fk_xhwjwegybknyuxcxxckiifvcbdsjmthbdkms` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `fk_ypwclqmcjkyjhvbaxmcuohardxdvigmmmroq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `fk_cfarozydetsycoyxivfxetkopbsavvpgoasx` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `fk_kknpffkwkkuunzfodnxjmkajmdsfhkfyglfz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sjtymcyxnhbfswtqzgrigyeruljyqadeonmn` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `fk_grocuoiybjlmofeatlxihjxtjneqzzrdbdqc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `fk_opzlvgcydkhrpacjokqnrnrnadzspcutvleo` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_oyiaglbawdoougmydxlzknywuduroakxewjr` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD CONSTRAINT `fk_lcskwaduwfrpffsajkmezwjmxrhluwojvtzy` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_woymzqiipqhtmzgxgbakxvmyzzrlepffpcju` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD CONSTRAINT `fk_byduyakaxgcemruxftnmzqracijssyoctoxm` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD CONSTRAINT `fk_adxleuzxqswyqjpsghmagrfojhaqpfqqssdm` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `fk_vkmizdxqhndsxfxrckegrjhpqxletjvljlho` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xojjexnggadlelmgavafwyooifuaybwciisr` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `fk_tzrubjxtybrulcacmchyyzxbyyyxwxvycmuk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xvpjbwdppsnockmsgvvkttifncsraqfcxawg` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `fk_lejbpzrayipkzmufusoamxetvmgzyujhvfre` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_mjpnhqwyiuuhbftgyojpakhxwwctroimmvod` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `fk_dtlujmozounabogzrnowemkkmmamkqvcpnak` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_bxsdmzxttcxbgomnbkakwunzuzolopgdstbi` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ugocxqqmozsgmfkkxpkdgotkffawhiqkrtjp` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `fk_vftfgtvxdhdecwrrsohayhlgkcupzpvysqaj` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zfvpxmsuqelzjtyhiczlxikhcfbrqgxdlnxu` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `fk_frypuqeyiopzutvzijtzckynyqebzwgcipuk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `fk_kwxbllhrvsmfivrdhdvnotmuckomjiivnlzi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
