-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 20, 2021 at 09:19 PM
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

--
-- Dumping data for table `changedfields`
--

INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`) VALUES
(2, 1, 1, '2021-06-20 14:35:03', 0, 1),
(2, 1, 5, '2021-06-20 15:01:42', 0, 1),
(2, 1, 9, '2021-06-20 16:28:32', 0, 1),
(2, 1, 14, '2021-06-20 14:53:32', 0, 1);

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
(1, 1, 1, NULL, '2021-06-17 10:02:01', '2021-06-17 10:02:01', '508a3402-55a5-4472-bd8f-76f5cc11c7ae'),
(2, 2, 1, 'Style Guide', '2021-06-20 02:07:41', '2021-06-20 16:28:32', 'aab3abe1-4fdc-4ca4-ba15-82fefa8bc536'),
(3, 3, 1, 'Style Guide', '2021-06-20 02:07:41', '2021-06-20 02:07:41', '00f16507-c0a6-4c69-8c76-02865be916c2'),
(4, 4, 1, 'Style Guide', '2021-06-20 02:45:06', '2021-06-20 02:45:06', '645f5c87-2788-411a-9dbe-f09c530ac0f4'),
(5, 5, 1, 'Style Guide', '2021-06-20 06:55:15', '2021-06-20 06:55:15', '388d958c-3928-4844-aae1-5e13b45c9e55'),
(6, 6, 1, 'Style Guide', '2021-06-20 06:55:23', '2021-06-20 06:55:23', 'a8d550a0-eb92-4573-9fd7-b4bf19eee2de'),
(7, 7, 1, 'Style Guide', '2021-06-20 07:06:40', '2021-06-20 07:06:40', '27d1c76c-dee6-437f-be1f-86ca7e9e8fb8'),
(8, 9, 1, 'Style Guide', '2021-06-20 07:15:09', '2021-06-20 07:15:09', '026f34f2-e942-4baa-840e-c905ca92916c'),
(9, 11, 1, 'Style Guide', '2021-06-20 07:38:07', '2021-06-20 07:38:07', '2c96ceca-d323-4ea0-ad06-a06bf0aaf6af'),
(10, 13, 1, 'Style Guide', '2021-06-20 07:43:02', '2021-06-20 07:43:02', '203183c0-e001-406e-8ff7-91e50014d24f'),
(11, 19, 1, 'Style Guide', '2021-06-20 07:51:34', '2021-06-20 07:51:34', 'fe9febe4-fbfc-4d5a-ba5d-83e90bb2c5d0'),
(12, 27, 1, 'Style Guide', '2021-06-20 07:57:21', '2021-06-20 07:57:21', 'd5e8e410-fc66-4ca5-b58a-4f9e4b91ff49'),
(13, 35, 1, 'Style Guide', '2021-06-20 08:24:33', '2021-06-20 08:24:33', 'd161f5b6-388d-410c-803a-2ec1cb5c4d54'),
(14, 48, 1, 'Style Guide', '2021-06-20 08:35:27', '2021-06-20 08:35:27', 'b4100964-99c3-4f83-8ceb-34bba27f062f'),
(15, 56, 1, 'Style Guide', '2021-06-20 11:46:02', '2021-06-20 11:46:02', '6d3a7694-e369-4366-aee6-5fd84a7d546b'),
(16, 64, 1, 'Style Guide', '2021-06-20 11:56:09', '2021-06-20 11:56:09', '200ac1e9-6f65-420c-a182-1ef79f65fe77'),
(17, 72, 1, 'Style Guide', '2021-06-20 11:57:08', '2021-06-20 11:57:08', '26d9f392-6f94-47c5-9be3-454519d37718'),
(18, 80, 1, 'Style Guide', '2021-06-20 12:16:45', '2021-06-20 12:16:45', 'ef702910-9641-4ec5-a32a-253d4e18d258'),
(19, 93, 1, 'Style Guide', '2021-06-20 14:35:03', '2021-06-20 14:35:03', '178aa9d8-a3fa-4041-940f-befb88089c75'),
(20, 116, 1, 'Style Guide', '2021-06-20 14:50:25', '2021-06-20 14:50:25', '2df07bef-6dfd-4967-bdcb-8a3729036e3e'),
(21, 140, 1, 'Style Guide', '2021-06-20 14:51:25', '2021-06-20 14:51:25', '252e6884-0cab-4045-b5ac-c6b0f764b07b'),
(22, 164, 1, 'Style Guide', '2021-06-20 14:53:31', '2021-06-20 14:53:31', '84f39184-77af-4303-b341-de05b44e0e60'),
(23, 189, 1, 'Style Guide', '2021-06-20 15:01:42', '2021-06-20 15:01:42', '1dddcf93-06bb-485c-9868-e90642da2dcd'),
(24, 214, 1, 'Style Guide', '2021-06-20 16:11:13', '2021-06-20 16:11:13', '0399f970-77e2-42dc-a55d-ebc22e195f0b'),
(25, 239, 1, 'Style Guide', '2021-06-20 16:28:32', '2021-06-20 16:28:32', '16c9735b-f3a0-47ef-9320-47a351705d46');

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
(1, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2021-06-17 10:02:01', '2021-06-17 10:02:01', NULL, 'd8aaa17e-e62d-4fa3-b27e-817092bf4dd1'),
(2, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2021-06-20 02:07:41', '2021-06-20 16:28:32', NULL, '72f5ae92-bae6-4beb-9556-3849600f0550'),
(3, NULL, 1, 1, 'craft\\elements\\Entry', 1, 0, '2021-06-20 02:07:41', '2021-06-20 02:07:41', NULL, 'c01516a5-613b-4416-88d8-27c0a46840df'),
(4, NULL, 2, 1, 'craft\\elements\\Entry', 1, 0, '2021-06-20 02:45:06', '2021-06-20 02:45:06', NULL, 'b4396f8f-9378-453a-bbfc-7b35483429bb'),
(5, NULL, 3, 1, 'craft\\elements\\Entry', 1, 0, '2021-06-20 06:55:15', '2021-06-20 06:55:15', NULL, '22bd66fa-e896-4bb3-8efd-19212b4fdecf'),
(6, NULL, 4, 1, 'craft\\elements\\Entry', 1, 0, '2021-06-20 06:55:23', '2021-06-20 06:55:23', NULL, '4d88a7fd-cab2-41be-842a-89bed293c596'),
(7, NULL, 5, 1, 'craft\\elements\\Entry', 1, 0, '2021-06-20 07:06:40', '2021-06-20 07:06:40', NULL, '6449fafe-9b5d-4293-b824-49053f8fdff4'),
(8, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 07:15:09', '2021-06-20 14:53:31', NULL, 'b182fdea-2bfb-44db-81f5-8ff11d3ab07b'),
(9, NULL, 6, 1, 'craft\\elements\\Entry', 1, 0, '2021-06-20 07:15:09', '2021-06-20 07:15:09', NULL, '0423736f-8d5a-4303-a865-a3c1a3415466'),
(10, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 07:15:09', '2021-06-20 07:15:09', NULL, '5d63e566-70fd-455e-8b3a-95bed3cd36d4'),
(11, NULL, 7, 1, 'craft\\elements\\Entry', 1, 0, '2021-06-20 07:38:07', '2021-06-20 07:38:07', NULL, '4b2aacb4-74b0-47e3-b4c7-7ef7e5875ba9'),
(12, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 07:43:02', '2021-06-20 07:43:02', '2021-06-20 07:51:34', '6fdbc936-60a9-407c-a027-28ca2cd59cdf'),
(13, NULL, 8, 1, 'craft\\elements\\Entry', 1, 0, '2021-06-20 07:43:02', '2021-06-20 07:43:02', NULL, 'e0951971-419b-4667-94c4-13fde174984f'),
(14, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 07:43:02', '2021-06-20 07:43:02', NULL, 'f3660000-aa69-41e4-92a3-441744518b8d'),
(15, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 07:51:34', '2021-06-20 07:57:21', '2021-06-20 08:27:57', '7232c3c6-4060-4aad-875d-ba6c772fc0ef'),
(16, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 07:51:34', '2021-06-20 07:57:21', '2021-06-20 08:27:57', '62bcaff0-1a82-467d-b666-639b33b0cff1'),
(17, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 07:51:34', '2021-06-20 07:57:21', '2021-06-20 08:27:57', 'facf2903-c475-4a28-ab61-4f816fec8bea'),
(18, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 07:51:34', '2021-06-20 07:57:21', '2021-06-20 08:27:57', 'bc126c9b-54b8-4981-8a98-089decf08ad2'),
(19, NULL, 9, 1, 'craft\\elements\\Entry', 1, 0, '2021-06-20 07:51:34', '2021-06-20 07:51:34', NULL, '54af0553-502c-444f-b898-cba76690fdb2'),
(20, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 07:51:34', '2021-06-20 07:51:34', NULL, 'ed62d6e0-d38a-4e02-99f6-36cb92332571'),
(21, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 07:51:34', '2021-06-20 07:51:34', NULL, '53436130-0059-4cc5-9fe1-b198e1955903'),
(22, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 07:51:34', '2021-06-20 07:51:34', NULL, '93871dcd-72f8-4a01-8900-9398e9c0beb4'),
(23, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 07:51:34', '2021-06-20 07:51:34', NULL, '7e4684e8-2913-42fa-ae1a-dc2fddc5ce0f'),
(24, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 07:57:21', '2021-06-20 14:35:03', NULL, 'b3a812ce-7ae7-4ec2-a5ba-100e68c1a1f3'),
(25, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 07:57:21', '2021-06-20 07:57:21', '2021-06-20 08:27:57', '22de9ea8-d5bb-4876-9c99-6a4752cff517'),
(26, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 07:57:21', '2021-06-20 07:57:21', '2021-06-20 08:27:57', 'db0affc4-6033-41bb-a800-f68e7f8875cb'),
(27, NULL, 10, 1, 'craft\\elements\\Entry', 1, 0, '2021-06-20 07:57:21', '2021-06-20 07:57:21', NULL, '89b0e5ea-6ed8-47b3-9b91-93455f968adb'),
(28, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 07:57:21', '2021-06-20 07:57:21', NULL, '42f3d946-6a58-4091-8fb3-cad49b03306c'),
(29, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 07:57:21', '2021-06-20 07:57:21', NULL, '44ef3712-f31a-40c6-9d1d-594c7105eee0'),
(30, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 07:57:21', '2021-06-20 07:57:21', NULL, '4ae43a43-0a38-420f-b19e-9bf157880a65'),
(31, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 07:57:21', '2021-06-20 07:57:21', NULL, '47340f49-7395-4b8c-ad8a-663cc7e3a097'),
(32, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 07:57:21', '2021-06-20 07:57:21', NULL, 'c3c0f9c1-b2da-4bb2-be51-7d8f4bb507ca'),
(33, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 07:57:21', '2021-06-20 07:57:21', NULL, '9f18eb10-caa3-47b2-a691-d2e5a5ff0ad3'),
(34, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 07:57:21', '2021-06-20 07:57:21', NULL, '5845fc75-3dc0-4484-aded-14b7a54ac473'),
(35, NULL, 11, 1, 'craft\\elements\\Entry', 1, 0, '2021-06-20 08:24:33', '2021-06-20 08:24:33', NULL, '9c9a85b5-7409-4d54-8426-d36ffb3ae8d6'),
(36, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 08:24:33', '2021-06-20 07:15:09', NULL, '84a26c56-0671-4352-9110-6e5d39a41ec0'),
(37, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 08:24:33', '2021-06-20 07:57:21', NULL, '81827a48-00b9-496e-9f30-c005d6bd7c67'),
(38, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 08:24:33', '2021-06-20 07:57:21', NULL, '6eb93885-2251-4ebd-8b1d-8adb116e9e1c'),
(39, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 08:24:33', '2021-06-20 07:57:21', NULL, 'df09efd9-ca72-4480-aa53-781a522a16df'),
(40, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 08:24:33', '2021-06-20 07:57:21', NULL, '8284d2d2-1f4c-41e8-9c2b-dd37b6ddd578'),
(41, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 08:24:33', '2021-06-20 07:57:21', NULL, '92f57b60-097c-4dcf-b1a9-3744a1cc411c'),
(42, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 08:24:33', '2021-06-20 07:57:21', NULL, '8837cbcf-d769-402c-9ddf-2f613febcc8e'),
(43, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 08:24:33', '2021-06-20 07:57:21', NULL, 'f747673f-01f4-4c63-81ed-e67eca52210b'),
(44, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 08:35:27', '2021-06-20 14:53:31', NULL, '8062fc97-9eb4-4938-b2d6-340ccc5c1429'),
(45, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 08:35:27', '2021-06-20 14:50:25', NULL, 'f80a58c7-6f6b-48da-9f59-dcbb4493ddc5'),
(46, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 08:35:27', '2021-06-20 14:50:25', NULL, 'e2bbbeec-19c1-4f0f-b000-8484d0209e8a'),
(47, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 08:35:27', '2021-06-20 14:53:31', NULL, '1aaf9ad4-3dd9-4f48-98c8-4930490eb90d'),
(48, NULL, 12, 1, 'craft\\elements\\Entry', 1, 0, '2021-06-20 08:35:27', '2021-06-20 08:35:27', NULL, 'f6ff03c5-81b0-4a01-a00a-83a8b44c4ff7'),
(49, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 08:35:27', '2021-06-20 08:35:27', NULL, '3da97d02-7e47-4bc8-9855-09b2ee196be4'),
(50, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 08:35:27', '2021-06-20 08:35:27', NULL, '796db4c2-d3d2-448b-8f26-f7919de6d01d'),
(51, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 08:35:27', '2021-06-20 08:35:27', NULL, '13cd5b81-9a52-41dc-98f4-7b3aa4936b94'),
(52, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 08:35:27', '2021-06-20 08:35:27', NULL, '80dd9dc3-43a6-42da-9d5d-8314800b6475'),
(53, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 08:35:27', '2021-06-20 08:35:27', NULL, '87f560d0-b37d-4df0-bf9b-19fe4a6373b5'),
(54, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 08:35:27', '2021-06-20 07:57:21', NULL, 'bbfecf27-0471-47cc-9a6b-a73864bb91bf'),
(55, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 11:46:02', '2021-06-20 14:35:03', NULL, '9325b616-6b28-40d7-a7d1-4a557f677b6a'),
(56, NULL, 13, 1, 'craft\\elements\\Entry', 1, 0, '2021-06-20 11:46:02', '2021-06-20 11:46:02', NULL, '59e536e9-320d-40e5-b6c0-3f78743ea8d9'),
(57, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 11:46:03', '2021-06-20 08:35:27', NULL, 'add620cb-517d-4109-96ea-532d9f966f94'),
(58, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 11:46:03', '2021-06-20 08:35:27', NULL, 'fabd200b-a7fa-443a-a508-249a6d488857'),
(59, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 11:46:03', '2021-06-20 08:35:27', NULL, 'f9935fe8-8fd6-4721-859f-fbfa835926f8'),
(60, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 11:46:03', '2021-06-20 08:35:27', NULL, 'a12f8fe1-acd2-4a58-9646-8f6eb32fbd0d'),
(61, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 11:46:03', '2021-06-20 08:35:27', NULL, '06cae650-ca90-4844-9859-8441f2899e9d'),
(62, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 11:46:03', '2021-06-20 11:46:02', NULL, '11c3faea-ad9a-4509-a345-26521e2de0dd'),
(63, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 11:46:03', '2021-06-20 11:46:02', NULL, '6f6f4974-fef7-4143-ba35-47875f38d4df'),
(64, NULL, 14, 1, 'craft\\elements\\Entry', 1, 0, '2021-06-20 11:56:08', '2021-06-20 11:56:08', NULL, '85f8db8d-5800-45fd-b6ce-714051fa28b0'),
(65, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 11:56:09', '2021-06-20 08:35:27', NULL, 'ee38e220-dc1c-4641-8711-498a9f4ad517'),
(66, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 11:56:09', '2021-06-20 08:35:27', NULL, '5c6baae4-2476-4545-9e69-00f7080c67b9'),
(67, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 11:56:09', '2021-06-20 08:35:27', NULL, '068af2ae-177c-4cc3-8c3e-780725e9d26a'),
(68, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 11:56:09', '2021-06-20 08:35:27', NULL, '8354f082-5170-453e-bc71-34b39b1b0a05'),
(69, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 11:56:09', '2021-06-20 08:35:27', NULL, '3bdf1ece-7664-41a4-b6a1-cea79d43d8e4'),
(70, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 11:56:09', '2021-06-20 11:56:09', NULL, '934f96b1-bc3c-4325-ae51-c2f8e3c0d9a7'),
(71, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 11:56:09', '2021-06-20 11:56:09', NULL, '8d48c836-95b4-4772-9d45-966ddeb2923e'),
(72, NULL, 15, 1, 'craft\\elements\\Entry', 1, 0, '2021-06-20 11:57:08', '2021-06-20 11:57:08', NULL, '67e61ea7-0151-48c4-8cd0-36d640da617d'),
(73, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 11:57:08', '2021-06-20 08:35:27', NULL, 'ddef971f-ca60-49a7-a48d-2db02b993a08'),
(74, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 11:57:08', '2021-06-20 08:35:27', NULL, '00bb5030-dbb0-402d-bf99-f6afcfd7645d'),
(75, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 11:57:08', '2021-06-20 08:35:27', NULL, 'cb8c6e54-d9e0-4aac-9aa1-fe02a4bc8c31'),
(76, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 11:57:08', '2021-06-20 08:35:27', NULL, '058d520a-dbed-4af3-8759-c8d2b5ccd6ca'),
(77, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 11:57:08', '2021-06-20 08:35:27', NULL, '330aa22e-fcef-45fc-89c5-b2b264e89c62'),
(78, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 11:57:08', '2021-06-20 11:57:08', NULL, '95d6bfa7-99e3-46f0-8dac-b0dc7515db37'),
(79, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 11:57:08', '2021-06-20 11:57:08', NULL, '2283c4bc-2ccd-49e0-8bbd-b61cc66c8b31'),
(80, NULL, 16, 1, 'craft\\elements\\Entry', 1, 0, '2021-06-20 12:16:44', '2021-06-20 12:16:44', NULL, '47c1fe6a-69d7-4177-93b2-232cc5e308e9'),
(81, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 12:16:45', '2021-06-20 08:35:27', NULL, '4715cf4c-9136-40ea-be20-46a466ca2807'),
(82, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 12:16:45', '2021-06-20 08:35:27', NULL, 'fa520f00-984c-42d4-a8fa-e42fc6f8c641'),
(83, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 12:16:45', '2021-06-20 08:35:27', NULL, 'ce9b4fb7-dd86-43d9-8917-f0d7da38c106'),
(84, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 12:16:45', '2021-06-20 08:35:27', NULL, '92cf51a4-7eda-437f-955a-16ba546c9c16'),
(85, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 12:16:45', '2021-06-20 08:35:27', NULL, '1968ff90-619b-4ace-a7c6-844206c02a01'),
(86, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 12:16:45', '2021-06-20 12:16:44', NULL, 'deeb84ba-87a4-4be8-b854-f2b1f6747de2'),
(87, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 12:16:45', '2021-06-20 11:57:08', NULL, '57887f45-6789-4f3c-b4c4-91a742d68804'),
(88, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:35:03', '2021-06-20 14:35:03', NULL, '185b991a-4af3-4ec7-a0a3-31683d825f3b'),
(89, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:35:03', '2021-06-20 14:35:03', NULL, 'dd007079-7010-49d5-ab55-5574c690cc06'),
(90, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:35:03', '2021-06-20 14:35:03', NULL, 'c7d5944b-5c54-4798-af11-45d4673af331'),
(91, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:35:03', '2021-06-20 14:35:03', NULL, '6256cbc3-c532-4ac8-87cb-d8657bed535e'),
(92, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:35:03', '2021-06-20 14:35:03', NULL, '5d2b753f-cb8b-436b-b8f8-12a1907bd6a6'),
(93, NULL, 17, 1, 'craft\\elements\\Entry', 1, 0, '2021-06-20 14:35:03', '2021-06-20 14:35:03', NULL, '021f89f5-5a86-4d20-a9a6-b4fa90d78009'),
(94, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:35:03', '2021-06-20 08:35:27', NULL, 'bce2cb54-be01-49e9-b10f-bdfe48aba136'),
(95, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:35:03', '2021-06-20 08:35:27', NULL, '113c8da1-48de-475d-adfd-475d884d3a8e'),
(96, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:35:03', '2021-06-20 08:35:27', NULL, '7bbd02e2-505b-4873-a9b2-00b394049448'),
(97, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:35:03', '2021-06-20 08:35:27', NULL, 'efbea4d6-b02e-4ceb-b164-a6f7fde8e9fb'),
(98, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:35:03', '2021-06-20 08:35:27', NULL, 'a0d2e390-7e7f-438d-9d8f-57483120fe15'),
(99, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:35:03', '2021-06-20 14:35:03', NULL, '5c8f68dc-6f06-4461-95b8-a492f11e5245'),
(100, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:35:03', '2021-06-20 14:35:03', NULL, 'be814f87-73de-40fe-86d3-0ced65148f50'),
(101, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:35:03', '2021-06-20 14:35:03', NULL, '2b5f6091-d660-4212-87ea-6e8b91a41466'),
(102, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:35:03', '2021-06-20 14:35:03', NULL, '9e7580f3-f42e-4670-95c2-76c5121181e3'),
(103, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:35:03', '2021-06-20 14:35:03', NULL, '99d08bd4-154c-4b60-9a8b-fc2b719449b2'),
(104, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:35:03', '2021-06-20 14:35:03', NULL, '60fa3e75-8ac0-46ab-bd83-494c57a0edcf'),
(105, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:35:03', '2021-06-20 14:35:03', NULL, '3128a897-44c1-4b6b-bcc7-e96fd3dc2e6c'),
(106, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 14:50:25', NULL, '7579422a-7bad-4e42-a79f-cc024282edd7'),
(107, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 16:28:32', NULL, 'a1c0b327-402d-446b-a4b1-c5cb97f9cbc0'),
(108, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 16:28:32', NULL, '209489e4-a35f-4ae0-a3e2-fb368cb2f234'),
(109, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 16:11:13', NULL, '1fce2f91-028d-4bee-8ddc-897ddb917980'),
(110, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 16:28:32', NULL, '786fe317-92d5-49b0-b751-c604390dbef6'),
(111, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 16:28:32', NULL, '55104a30-1f95-42bd-9e04-3b55afbbd988'),
(112, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 15:01:42', NULL, '88e30472-b414-4346-a7a1-842652a0cfa6'),
(113, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 15:01:42', NULL, '83484c95-4613-4163-bb0b-93db95a21cea'),
(114, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 15:01:42', NULL, 'ec3d7af0-7e5d-434b-8a6f-20cb09fb80ed'),
(115, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 15:01:42', NULL, 'fed531df-e060-4eb5-b787-85e6c2e75749'),
(116, NULL, 18, 1, 'craft\\elements\\Entry', 1, 0, '2021-06-20 14:50:25', '2021-06-20 14:50:25', NULL, '458b1ff7-da85-4a69-9edd-ea7b83c0dc45'),
(117, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 14:50:25', NULL, 'b87c5135-cc1f-4aa4-a087-8f6cac8b4658'),
(118, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 14:50:25', NULL, 'c23766a0-ee73-4ab4-a4ff-ad2d2ba3c641'),
(119, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 14:50:25', NULL, '5be6c94e-7385-47d9-a86a-a4ab8e2604b6'),
(120, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 14:50:25', NULL, '9f67a8fc-02e2-4ae4-9907-fc2db63bc58c'),
(121, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 14:50:25', NULL, '07ba14ab-19b7-4dcd-8590-38720c5a556a'),
(122, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 14:50:25', NULL, '411553f2-6760-4086-a23d-a6d1e10275f7'),
(123, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 14:50:25', NULL, '20e1a2ef-81dd-43aa-b09d-b72964f9ade3'),
(124, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 14:50:25', NULL, '7aa22ee0-2cac-47e4-bb5d-84439b7380ce'),
(125, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 14:50:25', NULL, '3332a5dd-7d39-45df-a3f2-9c306525710c'),
(126, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 14:50:25', NULL, 'bb3edb39-6cba-4046-814c-cf94d56e92dc'),
(127, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 14:50:25', NULL, 'b288daf5-f8f9-4406-97b3-d27f1586bafd'),
(128, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 14:50:25', NULL, 'af62e5e6-520e-4628-be43-84d43e63a1e8'),
(129, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 14:50:25', NULL, 'e0ffc8a7-3ce0-4cca-9a72-40f7f257ba9e'),
(130, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 14:50:25', NULL, 'f560bd98-3ee7-4a71-8932-2044251e9008'),
(131, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 14:50:25', NULL, '76add39e-eeea-4143-ab1a-6299a29ae378'),
(132, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 14:35:03', NULL, '96078068-6d96-4dc0-8074-82f4caadd9d6'),
(133, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 14:35:03', NULL, 'b1964db4-7f7c-45d8-8a3c-e2e697935b48'),
(134, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 14:35:03', NULL, '1695fc6e-5047-47a3-9612-1dc864407ed5'),
(135, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 14:35:03', NULL, '019148de-886d-47c1-8039-97bcf70464e0'),
(136, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 14:35:03', NULL, 'f6c4f6f2-e713-4249-acfb-3d3f410a0cb6'),
(137, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 14:35:03', NULL, '64a316f7-c22c-438b-a59a-1463de536d96'),
(138, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:50:25', '2021-06-20 14:35:03', NULL, '363b321a-a85c-4b0a-8337-89bb14e3eb6f'),
(139, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:51:24', '2021-06-20 16:28:32', NULL, '2b29fea5-0a29-40da-b771-f34a7b9a8471'),
(140, NULL, 19, 1, 'craft\\elements\\Entry', 1, 0, '2021-06-20 14:51:24', '2021-06-20 14:51:24', NULL, 'b46cb64c-74da-4f68-8021-f40f56589fbb'),
(141, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:51:25', '2021-06-20 14:50:25', NULL, '9d0ed294-253e-4046-9564-fc7e4cd3798f'),
(142, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:51:25', '2021-06-20 14:50:25', NULL, '007caaed-3db5-4350-9b14-81535bc0769d'),
(143, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:51:25', '2021-06-20 14:50:25', NULL, '8bc9998d-46bd-49f0-9237-e140e53e2e27'),
(144, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:51:25', '2021-06-20 14:50:25', NULL, '9963b035-d24f-4fd2-aa6d-3d6f5ff62b79'),
(145, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:51:25', '2021-06-20 14:50:25', NULL, '2d8dae9b-b26c-44ac-aa4c-7597263a37ed'),
(146, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:51:25', '2021-06-20 14:50:25', NULL, 'c425478b-0d1a-437e-8dc4-6655f9d93dba'),
(147, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:51:25', '2021-06-20 14:51:24', NULL, '960c2d1c-96ac-4340-9e2c-f5fa344e1273'),
(148, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:51:25', '2021-06-20 14:51:24', NULL, '23585c33-ae7a-4cdf-b68c-0aa0a8b4fbea'),
(149, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:51:25', '2021-06-20 14:51:24', NULL, '026bcfc7-95b1-4753-9e2b-ddeae5931ca6'),
(150, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:51:25', '2021-06-20 14:51:24', NULL, 'dcdcbbc4-b2ae-41f6-9ebe-4fc14a312985'),
(151, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:51:25', '2021-06-20 14:51:24', NULL, 'e54421e4-2b88-4671-a267-094b1692474e'),
(152, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:51:25', '2021-06-20 14:51:24', NULL, 'da7de8e7-7a2c-4359-9104-d6297ca8d9a8'),
(153, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:51:25', '2021-06-20 14:50:25', NULL, '61740b84-02b0-4dbc-998d-e9ebea9e6f73'),
(154, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:51:25', '2021-06-20 14:50:25', NULL, '973271e4-1914-4320-bb64-8f2e8629dcf6'),
(155, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:51:25', '2021-06-20 14:50:25', NULL, '7be579d9-5c3a-48ff-8310-5151e34c6548'),
(156, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:51:25', '2021-06-20 14:50:25', NULL, '2e6f2595-e356-4ca5-bec1-a39f08c9efa2'),
(157, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:51:25', '2021-06-20 14:35:03', NULL, '01b1b43c-142d-4c10-82ec-630b172a0a2d'),
(158, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:51:25', '2021-06-20 14:35:03', NULL, '3a63e706-782c-48fa-b01d-74c248c38bc8'),
(159, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:51:25', '2021-06-20 14:35:03', NULL, 'ed7a3f15-203d-4338-b665-4d921f1f52c0'),
(160, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:51:25', '2021-06-20 14:35:03', NULL, '744742d4-b665-4863-a55c-f12174f3846b'),
(161, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:51:25', '2021-06-20 14:35:03', NULL, 'f1d10729-27fb-40f1-8789-252f28c9e219'),
(162, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:51:25', '2021-06-20 14:35:03', NULL, 'a96270e8-79cf-4611-a362-e208ec321c80'),
(163, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:51:25', '2021-06-20 14:35:03', NULL, '66cb6ba3-9e89-4fce-a09f-aa1d2eda44dd'),
(164, NULL, 20, 1, 'craft\\elements\\Entry', 1, 0, '2021-06-20 14:53:31', '2021-06-20 14:53:31', NULL, '89c2e446-e722-415e-a27b-0081c5bc7c5c'),
(165, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:53:32', '2021-06-20 14:53:31', NULL, '6ae5cfc3-a5d5-4b54-bb49-b25873388d60'),
(166, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:53:32', '2021-06-20 14:53:31', NULL, '9afc018f-3d04-4a77-ad3e-0458033b13fe'),
(167, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:53:32', '2021-06-20 14:50:25', NULL, 'f6a6da9f-0324-4b72-b531-df8c84339391'),
(168, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:53:32', '2021-06-20 14:50:25', NULL, '03d1f3f2-802a-4b2b-be81-e31b435d09e3'),
(169, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:53:32', '2021-06-20 14:53:31', NULL, '26131da0-97f0-484c-a93d-87bb4050f888'),
(170, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:53:32', '2021-06-20 14:50:25', NULL, '2adda03f-8fc1-4283-b92b-b8c3771f5c54'),
(171, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:53:32', '2021-06-20 14:51:24', NULL, 'ce9f389d-6d02-4a14-bb25-4180367c7fef'),
(172, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:53:32', '2021-06-20 14:51:24', NULL, '731299de-1f59-4c04-930a-81fa82c2f75b'),
(173, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:53:32', '2021-06-20 14:51:24', NULL, '43977eaf-97cd-4cf0-b784-c68523f5880b'),
(174, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:53:32', '2021-06-20 14:51:24', NULL, '1c8f8356-f9fa-4bad-bd59-1caf52dae48d'),
(175, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:53:32', '2021-06-20 14:51:24', NULL, '41bceaee-fa26-4a2a-90e2-c6eb9c532a38'),
(176, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:53:32', '2021-06-20 14:51:24', NULL, '415c9729-aaf1-4a3c-9633-8ad9c77dd985'),
(177, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:53:32', '2021-06-20 14:50:25', NULL, 'c9f699ff-0f2a-4d46-a559-1c805e596e45'),
(178, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:53:32', '2021-06-20 14:50:25', NULL, 'bed12308-2da7-4470-9a41-1303c3a15349'),
(179, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:53:32', '2021-06-20 14:50:25', NULL, 'f5e8c303-50c3-47cd-85f5-be59b8503004'),
(180, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:53:32', '2021-06-20 14:50:25', NULL, '5e94663e-fc09-40de-b3da-6ea32c9a9489'),
(181, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:53:32', '2021-06-20 14:35:03', NULL, '4cabc283-f25f-48fe-ab59-fd96f37cd5ce'),
(182, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:53:32', '2021-06-20 14:35:03', NULL, '174aa3c1-963d-4877-acf7-43a04fd317f3'),
(183, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:53:32', '2021-06-20 14:35:03', NULL, '5b819fb5-6551-43a0-85c4-e9408a011aff'),
(184, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:53:32', '2021-06-20 14:35:03', NULL, '2fdcd308-5aa6-497a-94e8-68861bf24f8f'),
(185, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:53:32', '2021-06-20 14:35:03', NULL, 'ad65fb5e-1af1-4913-b5b3-03df427db289'),
(186, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:53:32', '2021-06-20 14:35:03', NULL, '93282e96-5576-4152-91d8-3bfdbcaef646'),
(187, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 14:53:32', '2021-06-20 14:35:03', NULL, 'e9139824-fd60-4137-90d7-7cc929b4459a'),
(188, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 15:01:42', NULL, '0646adca-c85c-459f-bdd2-015cd5f2fc7e'),
(189, NULL, 21, 1, 'craft\\elements\\Entry', 1, 0, '2021-06-20 15:01:42', '2021-06-20 15:01:42', NULL, '5e741415-7d0c-445e-b018-d2b5c2811d24'),
(190, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 14:53:31', NULL, '8a41c59e-a3ac-4f4c-96f1-7e85c7af6c90'),
(191, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 14:53:31', NULL, '124f720a-677f-4e1e-81ce-a4c9bd86ee83'),
(192, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 14:50:25', NULL, '54164fcd-4529-4b32-af28-f0b9e405f796'),
(193, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 14:50:25', NULL, 'eb72a622-2f73-44f0-8e2c-b51169003ca6'),
(194, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 14:53:31', NULL, 'd69bf954-2206-4ef0-9796-2c65f74d2eb1'),
(195, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 14:50:25', NULL, '61b02979-1387-48bc-98d3-996c7a79947b'),
(196, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 14:51:24', NULL, '92e7e8ad-3f72-4146-b592-0e44d948680f'),
(197, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 14:51:24', NULL, 'd42422b9-afe9-4e35-9482-9032d010e5f8'),
(198, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 14:51:24', NULL, '9b50f3d9-87c9-4478-afda-80a8b110a2d1'),
(199, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 14:51:24', NULL, '0dd180d4-ac10-4923-a0f6-2f4c73244906'),
(200, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 14:51:24', NULL, '88374934-6e3c-4a9c-82a8-1e6b84bf59da'),
(201, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 14:51:24', NULL, 'ff79e9f0-71da-47c3-b557-a3db98508e27'),
(202, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 15:01:42', NULL, '4bb2bf89-0545-4a02-a04d-d0cc818f8c7a'),
(203, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 15:01:42', NULL, '628fdbf0-2cfa-44d7-87b2-a5f86b5bc8f2'),
(204, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 15:01:42', NULL, 'aba67804-a429-4b27-ac1e-2f58a83aa73e'),
(205, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 15:01:42', NULL, '94b576a7-d67f-4776-b85d-506475c95240'),
(206, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 15:01:42', NULL, '1fc28722-7fd7-4965-8bb1-351402bcdd0a'),
(207, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 14:35:03', NULL, '030d4226-0a6b-4c73-9daa-d0abbfd3d813'),
(208, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 14:35:03', NULL, '4076ce7a-d0b6-4664-9d21-e2491ff15905'),
(209, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 14:35:03', NULL, '0133c7fd-907c-4400-a629-d0516d02546a'),
(210, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 14:35:03', NULL, '09df4c8b-ceb3-4858-9a81-9fdb8c7242c4'),
(211, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 14:35:03', NULL, '464acbdf-4262-45c5-9887-ca031f65e78e'),
(212, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 14:35:03', NULL, 'f95c1c01-cb68-4fcd-8ed6-7244530ef134'),
(213, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 15:01:42', '2021-06-20 14:35:03', NULL, '83a58efc-c52a-41e5-a472-4a9e0e63f2ee'),
(214, NULL, 22, 1, 'craft\\elements\\Entry', 1, 0, '2021-06-20 16:11:13', '2021-06-20 16:11:13', NULL, 'af80aaa0-996b-4b0f-8272-38ecd17e4846'),
(215, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:11:13', '2021-06-20 14:53:31', NULL, '03c8e595-79ff-4688-abf2-cdaeef84867d'),
(216, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:11:13', '2021-06-20 14:53:31', NULL, '8569da36-9d02-4546-ab87-159dc8a29309'),
(217, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:11:13', '2021-06-20 14:50:25', NULL, '3ef5a1bf-8eb9-4961-831c-569b1f89a906'),
(218, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:11:13', '2021-06-20 14:50:25', NULL, 'c179acd9-c517-47e8-8c81-95bb63a4a3a7'),
(219, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:11:13', '2021-06-20 14:53:31', NULL, 'c3cc9aa6-0696-41d7-b6a1-dee2b97a1ac1'),
(220, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:11:13', '2021-06-20 14:50:25', NULL, 'cf4dabea-5f75-4b96-aaf3-7e4c7343720a'),
(221, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:11:13', '2021-06-20 16:11:13', NULL, '3d19227e-9312-4462-a476-0cc2f9f99ea4'),
(222, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:11:13', '2021-06-20 16:11:13', NULL, '9c201f94-006a-46b2-abc8-f80fcd9860e9'),
(223, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:11:13', '2021-06-20 16:11:13', NULL, '896277c8-1832-4759-ad4b-fb6f8db86796'),
(224, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:11:13', '2021-06-20 16:11:13', NULL, '8eeaa5b4-5373-45bd-9176-59345df32834'),
(225, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:11:13', '2021-06-20 16:11:13', NULL, '16991b87-989a-498f-bf0c-1e5a9d299464'),
(226, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:11:13', '2021-06-20 16:11:13', NULL, 'ec815dbe-b495-4be4-8393-f2f8b2d2f5c2'),
(227, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:11:13', '2021-06-20 15:01:42', NULL, '64b08ad3-d977-4ad3-afb8-699d8d813770'),
(228, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:11:13', '2021-06-20 15:01:42', NULL, '4ee94bd9-4f77-43ce-9c07-005683f21029'),
(229, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:11:13', '2021-06-20 15:01:42', NULL, '02ab8547-2685-4e11-988e-92160b41a380'),
(230, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:11:13', '2021-06-20 15:01:42', NULL, '26a666a4-a629-4e8a-a3c3-307f177b35e6'),
(231, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:11:13', '2021-06-20 15:01:42', NULL, '235592f3-e00f-46a8-a79f-347dead0832c'),
(232, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:11:13', '2021-06-20 14:35:03', NULL, 'a5823681-c709-4789-a170-4f2deb41775b'),
(233, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:11:13', '2021-06-20 14:35:03', NULL, '4a2e5f39-9800-4215-a040-c7a14d087d83'),
(234, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:11:13', '2021-06-20 14:35:03', NULL, 'f5de6f22-4a89-434a-8260-7bc87d6c8b80'),
(235, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:11:13', '2021-06-20 14:35:03', NULL, 'e1ad0a12-532e-4ffd-8a9e-cf1c8d862630'),
(236, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:11:13', '2021-06-20 14:35:03', NULL, '2f11bd89-900a-4742-aefe-2684effe4063'),
(237, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:11:13', '2021-06-20 14:35:03', NULL, '6c53dc8c-4b43-4c49-bf2e-7d2eecb67436'),
(238, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:11:13', '2021-06-20 14:35:03', NULL, 'bf659bf5-d1d3-45e5-9004-91e9799d053c'),
(239, NULL, 23, 1, 'craft\\elements\\Entry', 1, 0, '2021-06-20 16:28:32', '2021-06-20 16:28:32', NULL, '22d2afcc-0ab5-47ca-ae5c-7715af684a92'),
(240, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:28:32', '2021-06-20 14:53:31', NULL, '116b12f6-6319-4cd8-b029-4a1e85898e27'),
(241, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:28:32', '2021-06-20 14:53:31', NULL, '0c61a6a0-982f-41f2-bdbc-9943be9a5ee1'),
(242, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:28:32', '2021-06-20 14:50:25', NULL, '206f23c6-34a3-477b-805e-e412bd54e517'),
(243, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:28:32', '2021-06-20 14:50:25', NULL, '2ac71025-b0dd-48e0-b7dc-4179126de456'),
(244, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:28:32', '2021-06-20 14:53:31', NULL, 'e980adf3-83c6-4b94-902f-b394235f27c9'),
(245, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:28:32', '2021-06-20 14:50:25', NULL, '28872c16-019a-4bad-bfbe-b3e7a29f7cdd'),
(246, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:28:32', '2021-06-20 16:28:32', NULL, '513e3322-0bd6-46cd-93ea-5a228867466e'),
(247, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:28:32', '2021-06-20 16:28:32', NULL, '5d0044e2-8663-4e79-b019-b2ba5025ba60'),
(248, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:28:32', '2021-06-20 16:11:13', NULL, '0fe789e6-43c6-4aac-b7d2-c03f87d6a31d'),
(249, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:28:32', '2021-06-20 16:28:32', NULL, '47218fb4-8b73-42ec-ad3b-0050b952d1e4'),
(250, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:28:32', '2021-06-20 16:28:32', NULL, '3f02600f-f9bc-443e-a5aa-bf25f54fa65a'),
(251, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:28:32', '2021-06-20 16:28:32', NULL, '33d08456-80e2-4147-ac93-97ab316ce6e1'),
(252, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:28:32', '2021-06-20 15:01:42', NULL, '963fb50c-b8be-4b4d-b904-f824aa638805'),
(253, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:28:32', '2021-06-20 15:01:42', NULL, '4e040f88-f18d-4692-aa4a-85f300ca5541'),
(254, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:28:32', '2021-06-20 15:01:42', NULL, 'f08ee8f1-0bbb-46de-ad13-cd205b73b053'),
(255, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:28:32', '2021-06-20 15:01:42', NULL, '2b03101c-c5f7-426b-addb-137254f7b293'),
(256, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:28:32', '2021-06-20 15:01:42', NULL, '205e9c5a-6e2d-42ea-8696-3f725b3b88a8'),
(257, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:28:32', '2021-06-20 14:35:03', NULL, '03e1cc15-9e8a-410c-84c3-f4ea32219273'),
(258, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:28:32', '2021-06-20 14:35:03', NULL, 'e6622fff-d4ed-49e9-b288-f5e4b67a3645'),
(259, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:28:32', '2021-06-20 14:35:03', NULL, '46682e0d-4828-45db-8ae4-b9e089cbb730'),
(260, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:28:32', '2021-06-20 14:35:03', NULL, '19877ffc-bcb9-46d2-9a34-6fce88abba74'),
(261, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:28:32', '2021-06-20 14:35:03', NULL, '51521210-9a4d-4cc8-a2f2-fc6d61e52f14'),
(262, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:28:32', '2021-06-20 14:35:03', NULL, '9a2089cc-1971-4582-a52b-c75c9fe7a5ab'),
(263, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-20 16:28:32', '2021-06-20 14:35:03', NULL, 'cbeee680-d60b-45df-a069-0852b631863e');

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
(1, 1, 1, NULL, NULL, 1, '2021-06-17 10:02:01', '2021-06-17 10:02:01', '38d188d9-6b70-47e3-8d38-679eb8637a58'),
(2, 2, 1, 'style-guide', 'style-guide', 1, '2021-06-20 02:07:41', '2021-06-20 02:07:41', 'b17ce49e-23a0-4502-8135-1c5b5086b009'),
(3, 3, 1, 'style-guide', 'style-guide', 1, '2021-06-20 02:07:41', '2021-06-20 02:07:41', '505fe3a8-aea7-4c6b-b77a-8e0f2a331156'),
(4, 4, 1, 'style-guide', 'style-guide', 1, '2021-06-20 02:45:06', '2021-06-20 02:45:06', '13bb5859-c451-4453-b8d6-113d92953aa0'),
(5, 5, 1, 'style-guide', 'style-guide', 1, '2021-06-20 06:55:15', '2021-06-20 06:55:15', 'b2882ee4-ac0c-4c84-8c2e-3999372de2db'),
(6, 6, 1, 'style-guide', 'style-guide', 1, '2021-06-20 06:55:23', '2021-06-20 06:55:23', '5a915b47-21fe-48d3-8ea2-f9741bdf0f69'),
(7, 7, 1, 'style-guide', 'style-guide', 1, '2021-06-20 07:06:40', '2021-06-20 07:06:40', '27c8a074-da73-48a2-9a72-89e30bd8d39a'),
(8, 8, 1, NULL, NULL, 1, '2021-06-20 07:15:09', '2021-06-20 07:15:09', 'ffcea627-cc7e-43e0-b520-dc87d551c141'),
(9, 9, 1, 'style-guide', 'style-guide', 1, '2021-06-20 07:15:09', '2021-06-20 07:15:09', '6c64e651-50ad-4f2c-b452-5e48deba6380'),
(10, 10, 1, NULL, NULL, 1, '2021-06-20 07:15:09', '2021-06-20 07:15:09', 'dd391260-9583-4300-9b24-21eadd2d27fd'),
(11, 11, 1, 'style-guide', 'style-guide', 1, '2021-06-20 07:38:07', '2021-06-20 07:38:07', '8739a028-f68e-4942-961d-f1eccbd4a75e'),
(12, 12, 1, NULL, NULL, 1, '2021-06-20 07:43:02', '2021-06-20 07:43:02', 'e06adeb2-d896-4680-8a98-fc8855c783bf'),
(13, 13, 1, 'style-guide', 'style-guide', 1, '2021-06-20 07:43:02', '2021-06-20 07:43:02', 'c8c3eaf7-a4a2-4871-be7e-83987af0c263'),
(14, 14, 1, NULL, NULL, 1, '2021-06-20 07:43:02', '2021-06-20 07:43:02', 'b3e9eb7c-8a7f-4ca7-af46-12aa00aa17b5'),
(15, 15, 1, NULL, NULL, 1, '2021-06-20 07:51:34', '2021-06-20 07:51:34', '09493e7a-b2f2-4cd1-8186-edf1a666d092'),
(16, 16, 1, NULL, NULL, 1, '2021-06-20 07:51:34', '2021-06-20 07:51:34', '83d83348-e708-4219-9fcf-f6aa6bd23752'),
(17, 17, 1, NULL, NULL, 1, '2021-06-20 07:51:34', '2021-06-20 07:51:34', '0d505694-98b5-497c-9f95-beaefac47c87'),
(18, 18, 1, NULL, NULL, 1, '2021-06-20 07:51:34', '2021-06-20 07:51:34', 'ad3a2189-9309-4a6c-be5b-a4c7ac130d95'),
(19, 19, 1, 'style-guide', 'style-guide', 1, '2021-06-20 07:51:34', '2021-06-20 07:51:34', '851218c1-9373-42bc-8039-78b851be5998'),
(20, 20, 1, NULL, NULL, 1, '2021-06-20 07:51:34', '2021-06-20 07:51:34', 'a544b181-a7b9-4883-abf0-f91848461be6'),
(21, 21, 1, NULL, NULL, 1, '2021-06-20 07:51:34', '2021-06-20 07:51:34', '090845e8-da47-4bc6-9a18-c7476bf1a075'),
(22, 22, 1, NULL, NULL, 1, '2021-06-20 07:51:34', '2021-06-20 07:51:34', '4d3602d2-25b5-4f42-b90d-647ef35add40'),
(23, 23, 1, NULL, NULL, 1, '2021-06-20 07:51:34', '2021-06-20 07:51:34', '9fc3cea2-c161-4c43-ae9d-18d548cbeeb4'),
(24, 24, 1, NULL, NULL, 1, '2021-06-20 07:57:21', '2021-06-20 07:57:21', '6f2e0a10-fb69-4a54-a57a-249e759d6bc3'),
(25, 25, 1, NULL, NULL, 1, '2021-06-20 07:57:21', '2021-06-20 07:57:21', 'ce6b2222-22e0-48ee-b423-29752bff9902'),
(26, 26, 1, NULL, NULL, 1, '2021-06-20 07:57:21', '2021-06-20 07:57:21', '728212c3-befb-4155-80d2-9cc976807f68'),
(27, 27, 1, 'style-guide', 'style-guide', 1, '2021-06-20 07:57:21', '2021-06-20 07:57:21', '3c642c79-7627-49a0-907c-60755ead7ee0'),
(28, 28, 1, NULL, NULL, 1, '2021-06-20 07:57:21', '2021-06-20 07:57:21', 'bc0b476a-d1b0-43f7-b57b-25a13a398cd9'),
(29, 29, 1, NULL, NULL, 1, '2021-06-20 07:57:21', '2021-06-20 07:57:21', '6f435120-eaf8-4c88-bcba-012c2f526838'),
(30, 30, 1, NULL, NULL, 1, '2021-06-20 07:57:21', '2021-06-20 07:57:21', 'f290ebbd-183d-4837-9b5e-63e3d7ab2f66'),
(31, 31, 1, NULL, NULL, 1, '2021-06-20 07:57:21', '2021-06-20 07:57:21', '7e7d931c-9ede-40be-977b-435ff7c80e97'),
(32, 32, 1, NULL, NULL, 1, '2021-06-20 07:57:21', '2021-06-20 07:57:21', '4c7ee8ba-622d-4e65-9288-d996b638b409'),
(33, 33, 1, NULL, NULL, 1, '2021-06-20 07:57:21', '2021-06-20 07:57:21', 'e609326e-6c26-499e-a8eb-0c08afe86f1d'),
(34, 34, 1, NULL, NULL, 1, '2021-06-20 07:57:21', '2021-06-20 07:57:21', '9094f57a-df19-4b6c-a636-974a00610ff1'),
(35, 35, 1, 'style-guide', 'style-guide', 1, '2021-06-20 08:24:33', '2021-06-20 08:24:33', '97d98517-9b84-4214-94e8-5a965b1120e8'),
(36, 36, 1, NULL, NULL, 1, '2021-06-20 08:24:33', '2021-06-20 08:24:33', '721bc110-d7a5-4776-9a5a-9466bfd8c3f7'),
(37, 37, 1, NULL, NULL, 1, '2021-06-20 08:24:33', '2021-06-20 08:24:33', 'f1b9f54d-34f8-4794-9483-b94c5cb24ba7'),
(38, 38, 1, NULL, NULL, 1, '2021-06-20 08:24:33', '2021-06-20 08:24:33', '67041003-9814-4194-b6b2-b4678b443eb5'),
(39, 39, 1, NULL, NULL, 1, '2021-06-20 08:24:33', '2021-06-20 08:24:33', '73705229-eb77-4d1d-89c5-de42d0872914'),
(40, 40, 1, NULL, NULL, 1, '2021-06-20 08:24:33', '2021-06-20 08:24:33', '655c9b3d-87aa-49cd-9b30-28075c2b8df7'),
(41, 41, 1, NULL, NULL, 1, '2021-06-20 08:24:33', '2021-06-20 08:24:33', '7c4314e6-aaba-4178-b3bb-4273594decf2'),
(42, 42, 1, NULL, NULL, 1, '2021-06-20 08:24:33', '2021-06-20 08:24:33', '5aed4bb3-d285-43ff-ae19-014dad7b4613'),
(43, 43, 1, NULL, NULL, 1, '2021-06-20 08:24:33', '2021-06-20 08:24:33', '43a14a36-7b24-4ed4-bf3b-b3ae2b943b59'),
(44, 44, 1, NULL, NULL, 1, '2021-06-20 08:35:27', '2021-06-20 08:35:27', 'a166a766-26a9-4ac4-a60a-1e7f464a14a7'),
(45, 45, 1, NULL, NULL, 1, '2021-06-20 08:35:27', '2021-06-20 08:35:27', '648e41d6-906a-4414-9410-69d6e77e800b'),
(46, 46, 1, NULL, NULL, 1, '2021-06-20 08:35:27', '2021-06-20 08:35:27', '04c28ed7-cdf3-4cf0-8263-f604f9ee60d8'),
(47, 47, 1, NULL, NULL, 1, '2021-06-20 08:35:27', '2021-06-20 08:35:27', '4416cf7d-91a9-4cc4-9199-448b71c2c6b0'),
(48, 48, 1, 'style-guide', 'style-guide', 1, '2021-06-20 08:35:27', '2021-06-20 08:35:27', '657ba17f-a849-4932-bf15-e67d47fa64d7'),
(49, 49, 1, NULL, NULL, 1, '2021-06-20 08:35:27', '2021-06-20 08:35:27', '37a6de8a-0ece-49ee-a74b-b59bc043fe00'),
(50, 50, 1, NULL, NULL, 1, '2021-06-20 08:35:27', '2021-06-20 08:35:27', 'b8b5ad99-0400-4132-ae42-5712df834b66'),
(51, 51, 1, NULL, NULL, 1, '2021-06-20 08:35:27', '2021-06-20 08:35:27', 'b0ac929c-381e-40a8-9c76-de97713241fd'),
(52, 52, 1, NULL, NULL, 1, '2021-06-20 08:35:27', '2021-06-20 08:35:27', '22581285-9c8e-455d-8c6a-c3bb469c32de'),
(53, 53, 1, NULL, NULL, 1, '2021-06-20 08:35:27', '2021-06-20 08:35:27', '15566bd7-7664-4487-81dc-a8913bef2e0a'),
(54, 54, 1, NULL, NULL, 1, '2021-06-20 08:35:27', '2021-06-20 08:35:27', 'c8fb3ffe-a45a-435a-9334-c1515d8a3197'),
(55, 55, 1, NULL, NULL, 1, '2021-06-20 11:46:02', '2021-06-20 11:46:02', 'e5a21d2f-7da6-486a-aa71-bb1d18a97873'),
(56, 56, 1, 'style-guide', 'style-guide', 1, '2021-06-20 11:46:02', '2021-06-20 11:46:02', 'c31c39f6-fc99-4613-8ce2-b6385a6d388d'),
(57, 57, 1, NULL, NULL, 1, '2021-06-20 11:46:03', '2021-06-20 11:46:03', '57565b81-0bf7-4f91-aad6-4ba546804589'),
(58, 58, 1, NULL, NULL, 1, '2021-06-20 11:46:03', '2021-06-20 11:46:03', '3889ba69-a21e-4f7d-82d3-35c4ede8dae1'),
(59, 59, 1, NULL, NULL, 1, '2021-06-20 11:46:03', '2021-06-20 11:46:03', '7099fc31-0780-457c-ab3b-351b8555b739'),
(60, 60, 1, NULL, NULL, 1, '2021-06-20 11:46:03', '2021-06-20 11:46:03', 'f1f9d126-5e3c-4901-890f-29e1d4419671'),
(61, 61, 1, NULL, NULL, 1, '2021-06-20 11:46:03', '2021-06-20 11:46:03', 'cb14a5e3-3b22-4e05-b152-e16851721e23'),
(62, 62, 1, NULL, NULL, 1, '2021-06-20 11:46:03', '2021-06-20 11:46:03', 'a1f648c3-8e45-461b-a8bb-d7f6236f7444'),
(63, 63, 1, NULL, NULL, 1, '2021-06-20 11:46:03', '2021-06-20 11:46:03', 'f0941ca5-4569-4ad0-b93a-fb01da41161c'),
(64, 64, 1, 'style-guide', 'style-guide', 1, '2021-06-20 11:56:09', '2021-06-20 11:56:09', '97385742-ef2b-40d0-bc54-f2be2990bae6'),
(65, 65, 1, NULL, NULL, 1, '2021-06-20 11:56:09', '2021-06-20 11:56:09', '444efe0e-07a4-4b93-b39f-3a9b5138e231'),
(66, 66, 1, NULL, NULL, 1, '2021-06-20 11:56:09', '2021-06-20 11:56:09', 'c5b72113-888c-41a0-84ce-5f6eca7170d4'),
(67, 67, 1, NULL, NULL, 1, '2021-06-20 11:56:09', '2021-06-20 11:56:09', '79459247-6c1b-4415-81e2-acce4a55ad99'),
(68, 68, 1, NULL, NULL, 1, '2021-06-20 11:56:09', '2021-06-20 11:56:09', '70660282-6603-495b-b18d-08a2a59b82c8'),
(69, 69, 1, NULL, NULL, 1, '2021-06-20 11:56:09', '2021-06-20 11:56:09', '34634f97-444c-4917-988d-91132bd4993e'),
(70, 70, 1, NULL, NULL, 1, '2021-06-20 11:56:09', '2021-06-20 11:56:09', '265713a5-dfe0-40fd-96f3-49e6a0b1fc58'),
(71, 71, 1, NULL, NULL, 1, '2021-06-20 11:56:09', '2021-06-20 11:56:09', '5a3adc3f-b8c5-4073-91b4-0e6c9d5536df'),
(72, 72, 1, 'style-guide', 'style-guide', 1, '2021-06-20 11:57:08', '2021-06-20 11:57:08', 'b5757f83-b8bb-4550-94fc-3f69c2b22575'),
(73, 73, 1, NULL, NULL, 1, '2021-06-20 11:57:08', '2021-06-20 11:57:08', '6f805f5e-8e6c-44e3-a66a-cf9a88f6a956'),
(74, 74, 1, NULL, NULL, 1, '2021-06-20 11:57:08', '2021-06-20 11:57:08', '89033467-7b14-4bab-a20a-118ac2f42a2c'),
(75, 75, 1, NULL, NULL, 1, '2021-06-20 11:57:08', '2021-06-20 11:57:08', 'a2e24878-9036-4ed3-8527-4da5bb0362fe'),
(76, 76, 1, NULL, NULL, 1, '2021-06-20 11:57:08', '2021-06-20 11:57:08', '891051b2-0659-44a8-8c4c-cae53403edcd'),
(77, 77, 1, NULL, NULL, 1, '2021-06-20 11:57:08', '2021-06-20 11:57:08', '72c81b5b-b1ce-4c70-9554-873c378cebc0'),
(78, 78, 1, NULL, NULL, 1, '2021-06-20 11:57:08', '2021-06-20 11:57:08', '1b290128-47f1-49e4-9f2c-310925b63cbf'),
(79, 79, 1, NULL, NULL, 1, '2021-06-20 11:57:08', '2021-06-20 11:57:08', 'ad4f39a5-19a6-4e92-9127-e98702b39721'),
(80, 80, 1, 'style-guide', 'style-guide', 1, '2021-06-20 12:16:45', '2021-06-20 12:16:45', 'fce6ac2d-cd5a-409d-8c15-0d626b1e1c7c'),
(81, 81, 1, NULL, NULL, 1, '2021-06-20 12:16:45', '2021-06-20 12:16:45', '1aaca056-bfe6-4bbf-abfd-9f5d1dcd5e5c'),
(82, 82, 1, NULL, NULL, 1, '2021-06-20 12:16:45', '2021-06-20 12:16:45', 'aed6b2da-5eb1-415f-9d00-80eec4a37f4c'),
(83, 83, 1, NULL, NULL, 1, '2021-06-20 12:16:45', '2021-06-20 12:16:45', '94c7516d-a6a0-4de2-bb1f-ffd291a12596'),
(84, 84, 1, NULL, NULL, 1, '2021-06-20 12:16:45', '2021-06-20 12:16:45', '933e1b65-be2a-49cc-a9d6-41e68087abf0'),
(85, 85, 1, NULL, NULL, 1, '2021-06-20 12:16:45', '2021-06-20 12:16:45', 'c057904b-6dec-4253-8175-9806edaa31f9'),
(86, 86, 1, NULL, NULL, 1, '2021-06-20 12:16:45', '2021-06-20 12:16:45', 'd36f51d2-c762-4c28-b3f6-7f28e7c98315'),
(87, 87, 1, NULL, NULL, 1, '2021-06-20 12:16:45', '2021-06-20 12:16:45', '31fdb597-f89a-45a6-8462-e4f487c9fb5d'),
(88, 88, 1, NULL, NULL, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '81bad9c7-0e46-42a3-bf40-b07e12b7db15'),
(89, 89, 1, NULL, NULL, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '5376dcae-162e-4cee-b155-614604f8190e'),
(90, 90, 1, NULL, NULL, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '9430961a-19ff-4aa2-aab7-0c176bd21f77'),
(91, 91, 1, NULL, NULL, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '5800ccb8-6a87-4c65-b568-cdeafb8b1e4c'),
(92, 92, 1, NULL, NULL, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '89c6d2b3-cb16-4b09-8a9e-8bc5d71795d9'),
(93, 93, 1, 'style-guide', 'style-guide', 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', 'c9235e8a-aa54-424d-8ccf-40ced79641cb'),
(94, 94, 1, NULL, NULL, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '2d47c2c2-020f-40c7-904c-30ee83150ebb'),
(95, 95, 1, NULL, NULL, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '5dc63d78-0c5a-4622-8a81-b2188accbcbd'),
(96, 96, 1, NULL, NULL, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '62a8b234-e11e-4682-8877-c12fc38cb2cf'),
(97, 97, 1, NULL, NULL, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '9cf9443c-2521-4185-ae66-dc19df706aba'),
(98, 98, 1, NULL, NULL, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '02327008-034a-4c51-a71a-d39a1b23ed39'),
(99, 99, 1, NULL, NULL, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '4ce7a3aa-dde6-49c0-a307-63af7ecac607'),
(100, 100, 1, NULL, NULL, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '5855affa-e9e8-4b22-85e2-ce884811b862'),
(101, 101, 1, NULL, NULL, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '72e13f12-a46f-4da6-ab8c-f7daa46b5be5'),
(102, 102, 1, NULL, NULL, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '749d97c2-1478-4bea-8c78-aa93142ab161'),
(103, 103, 1, NULL, NULL, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '4706ffcd-64ba-4357-bb97-124a9292836b'),
(104, 104, 1, NULL, NULL, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', 'dcf74717-b3a1-4691-a255-a863ef556923'),
(105, 105, 1, NULL, NULL, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', 'ed6a3f4c-6f63-4098-a580-47c7a8c10702'),
(106, 106, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '3ef882e1-0da3-4725-943f-7495081057ab'),
(107, 107, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '612c5241-3da1-4f6f-8cb4-ab57e484a56e'),
(108, 108, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '20e5a6e5-c97b-4a3f-9344-4722db8912eb'),
(109, 109, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '2904f276-3c71-4bdb-8a6d-a5c860457f61'),
(110, 110, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '333676c8-8586-441e-a2cd-de84bb1f3c88'),
(111, 111, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'ea980e0a-3740-438c-a1e7-abd2f63d02ed'),
(112, 112, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'c4ca5b46-5f31-4e3c-a5d5-4d498022cc8d'),
(113, 113, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'aa8c9ab5-f2b8-4bd7-bb40-8379745871fb'),
(114, 114, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '7a6461da-b3c5-4cd3-a5b5-fc836630e81c'),
(115, 115, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '021fb701-1ad5-4a72-915a-64006a31edeb'),
(116, 116, 1, 'style-guide', 'style-guide', 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '7b67bf69-454e-49ca-ab08-283a57c8ab83'),
(117, 117, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '267a4a0f-f7bf-4d6c-8775-0b59436bd47c'),
(118, 118, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '5fa9b678-9f80-47a7-85c7-11f1b585f49e'),
(119, 119, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '0bcee49e-0b72-4d7c-a08d-b7f116652190'),
(120, 120, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '9bfe6a31-298c-4967-a0c4-f304198fad53'),
(121, 121, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '126b3141-0a20-431e-8cc3-6aadfc8d40bf'),
(122, 122, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'f4498cec-03c3-41aa-b0a8-c45e040c02e1'),
(123, 123, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'f129468a-a3f3-424d-99f6-cbf2f9c17547'),
(124, 124, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'a61e4f52-fd41-4e9d-b366-5e287c3acd1e'),
(125, 125, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '24fc4e49-0c73-4340-805c-b12052aef4b1'),
(126, 126, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'a84871d7-327d-45c1-864e-782b28636216'),
(127, 127, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'aa35c0c1-2cb4-49ff-bac2-1e278e0594ca'),
(128, 128, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'e95bc45f-eb5b-4407-9cc8-c295de7cbb8a'),
(129, 129, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'b1485968-9177-4a6d-b023-2f6a9990b8d7'),
(130, 130, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '3a366062-f7ed-4efd-97fc-29268a68bb4a'),
(131, 131, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '4b0a9f8b-d714-42eb-aca3-2371d622656f'),
(132, 132, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '7fe2146b-d4b1-4153-a42d-e97d5ce0f21f'),
(133, 133, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '56c7867e-f2e7-45ca-95a9-c9e5ec969464'),
(134, 134, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '661a62df-964c-47c1-99a6-5ff409ea7ab1'),
(135, 135, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'e6e5bc32-f01d-422e-90df-f6a1fffdc3d6'),
(136, 136, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'f4976944-8184-4402-80f3-2e44ecc912a4'),
(137, 137, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'ccde6c3e-2c01-41eb-822b-0ee14617c3dd'),
(138, 138, 1, NULL, NULL, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '5087dc3b-9e0c-4993-82a8-db3663af32bf'),
(139, 139, 1, NULL, NULL, 1, '2021-06-20 14:51:24', '2021-06-20 14:51:24', '82efc126-1252-43fa-b763-b00a4683f5bc'),
(140, 140, 1, 'style-guide', 'style-guide', 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '893481a9-a4ba-4855-a48d-7516407e5be9'),
(141, 141, 1, NULL, NULL, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'd859198d-0836-4b64-b221-d512468c109e'),
(142, 142, 1, NULL, NULL, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '1c03174d-2c58-47b2-ac10-48fa4f1901ab'),
(143, 143, 1, NULL, NULL, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '87d4822f-cd8c-47d9-a7c2-0df9a20623f1'),
(144, 144, 1, NULL, NULL, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'b2dc47a8-d9e5-4e4f-b314-fe891e7a8d3c'),
(145, 145, 1, NULL, NULL, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'e3ddb9e3-757b-45d4-a565-4aa6c09d859e'),
(146, 146, 1, NULL, NULL, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '0328dedb-e551-4489-b887-5bac8b1cc3ce'),
(147, 147, 1, NULL, NULL, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '9f0a9dd0-9572-4573-97e1-3bff2d5b53e9'),
(148, 148, 1, NULL, NULL, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '50340894-220d-4931-b799-ebf3be7dedf6'),
(149, 149, 1, NULL, NULL, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '4c15143e-93c3-4550-ac22-7046db5a3b6d'),
(150, 150, 1, NULL, NULL, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '47fdf2f4-f8ff-4bd7-9038-f99b8d3fdaf5'),
(151, 151, 1, NULL, NULL, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '23f640f3-1150-4f8d-a10a-7dbf793ca913'),
(152, 152, 1, NULL, NULL, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'a9ddf416-8654-4658-8343-29baf1423926'),
(153, 153, 1, NULL, NULL, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '8e00a4d3-0ad6-4823-870e-be2c24532c94'),
(154, 154, 1, NULL, NULL, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '00f418a0-f736-41e6-b2da-53773a09b94d'),
(155, 155, 1, NULL, NULL, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '4223db98-15ed-4244-9333-d1480c56111b'),
(156, 156, 1, NULL, NULL, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'd784da53-c4db-4434-b1a7-fe4a6e61ea5b'),
(157, 157, 1, NULL, NULL, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '53892a9f-98b1-47ce-9b4a-0ccb4f1b7d96'),
(158, 158, 1, NULL, NULL, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'c147031c-8819-4297-a508-0fc48fea5949'),
(159, 159, 1, NULL, NULL, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '53430d96-b3b3-441b-bbd8-b479b0e0859b'),
(160, 160, 1, NULL, NULL, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '39816659-3ac5-47df-99b9-dcdad4c587da'),
(161, 161, 1, NULL, NULL, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'a77a658a-10ed-48a3-b525-01e724984154'),
(162, 162, 1, NULL, NULL, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '62de488b-3331-4875-a1db-43437844094d'),
(163, 163, 1, NULL, NULL, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '86b27338-917f-437d-ab6a-de1f0dc654cc'),
(164, 164, 1, 'style-guide', 'style-guide', 1, '2021-06-20 14:53:31', '2021-06-20 14:53:31', 'c2f0b3be-141a-44c2-a62e-a02043311b4d'),
(165, 165, 1, NULL, NULL, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '0f363c51-e0d3-469f-aefb-804fbdd3bbb1'),
(166, 166, 1, NULL, NULL, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '538cf772-a019-4c63-82dc-96372fd8605b'),
(167, 167, 1, NULL, NULL, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '860707bd-9b39-48bd-9fd4-c10d8ddd75ce'),
(168, 168, 1, NULL, NULL, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '9910f163-f99d-4699-a28e-e5d8e4aa3a25'),
(169, 169, 1, NULL, NULL, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'a813cb8e-9e65-4614-8e43-eeac5f7eb3f7'),
(170, 170, 1, NULL, NULL, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '5e8275f7-145d-46e7-9081-b93c92e67564'),
(171, 171, 1, NULL, NULL, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'ee79b6fd-ad8a-4bab-8a22-0146b88bc3cf'),
(172, 172, 1, NULL, NULL, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'a7cc5662-5fb0-4fd8-98d4-0213eea2590d'),
(173, 173, 1, NULL, NULL, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '6212d44b-adca-4787-98d0-5e7e93092cef'),
(174, 174, 1, NULL, NULL, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '76bb5b7e-1cc2-45a2-8ef3-bba0b4bffa14'),
(175, 175, 1, NULL, NULL, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'b5a68172-d168-4f86-943e-d1699d3ee2e8'),
(176, 176, 1, NULL, NULL, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'de7f583d-1995-4b94-a508-4088a8387352'),
(177, 177, 1, NULL, NULL, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'ea8c4ca6-5fc2-4119-9604-56359f1251cc'),
(178, 178, 1, NULL, NULL, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'b01070b6-422a-4aa2-9c10-02701c94aff1'),
(179, 179, 1, NULL, NULL, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'c9673b87-9e32-4045-baf2-b9bcfe254601'),
(180, 180, 1, NULL, NULL, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '18563e2b-6c5b-4dc7-8c4d-c2883a7cc8c9'),
(181, 181, 1, NULL, NULL, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'add27523-de6b-4e75-9809-286e5e8133f7'),
(182, 182, 1, NULL, NULL, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '589682e3-1945-401a-881a-7a115d67d00d'),
(183, 183, 1, NULL, NULL, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '0ec291d2-d5ed-40c6-b141-7ca54e0001cd'),
(184, 184, 1, NULL, NULL, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '0cc78783-ad94-4a80-9696-703bfec96b92'),
(185, 185, 1, NULL, NULL, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '78fb88df-6361-4a7d-bfdc-6d1350167877'),
(186, 186, 1, NULL, NULL, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'ff2ef7aa-debc-414d-9930-5cfbc53a4471'),
(187, 187, 1, NULL, NULL, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'b06ca09e-9a83-4017-bd8d-90e0dde1214c'),
(188, 188, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '02febba7-fe9b-488b-ae53-ceca649af735'),
(189, 189, 1, 'style-guide', 'style-guide', 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '274dee0b-dd1a-4746-82b3-91034a43b57a'),
(190, 190, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '7e48d1c0-7e96-41ed-a844-06ba0bc7f7a4'),
(191, 191, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'f1e2e2b0-ae71-45d9-983b-5934ea81135a'),
(192, 192, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '499e4821-88c5-4d7d-afb2-e727cd437caa'),
(193, 193, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '57031bf5-6475-480a-a8d2-402abe7bca88'),
(194, 194, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'd642a1bc-3714-4ed9-ae9a-3adea720cfe6'),
(195, 195, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '09117804-0c95-4b66-921b-eb8a21cbe30a'),
(196, 196, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '8d6217f9-050a-45a1-b894-66773dca446d'),
(197, 197, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '0ac354b5-36fd-4a16-bfc7-1889b19b654b'),
(198, 198, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '6513de8e-71c8-4ef1-b8d0-4f37ab2bc8b4'),
(199, 199, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '8d0cbc17-4c5d-4031-b54b-b9c95ffc3dbc'),
(200, 200, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '18c23625-6b56-4edc-9489-2abce8654ff4'),
(201, 201, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'f0b9e0ba-b528-43f9-b753-b027149bf965'),
(202, 202, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '6995ce92-c122-4f38-b76d-4ff8ce62ec26'),
(203, 203, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'fc74b5ac-a8ee-4752-9fd5-aa4f74c9121e'),
(204, 204, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '05a3a3a6-dd22-47e0-ab2e-cde6044642d1'),
(205, 205, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '89be9728-b3d8-4854-bab7-66b46daecc94'),
(206, 206, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '72c0fee8-0bb2-42ca-8dc6-374258497908'),
(207, 207, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '412a1d60-30a9-4e4c-9e24-bc2031297836'),
(208, 208, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'e60cbc4e-3f7d-4254-b028-c4a1c1cc67ad'),
(209, 209, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '89bd02d6-038d-4fc1-be7f-73be6869d04c'),
(210, 210, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '7f3704ab-ffce-4746-9fc0-27aca390a0cf'),
(211, 211, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '1c902747-1e0a-4543-86de-6890e9ff75b7'),
(212, 212, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'a5b826d7-7b80-471f-b598-50923ae12703'),
(213, 213, 1, NULL, NULL, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '164e212b-d638-44bc-a664-e745f55eb966'),
(214, 214, 1, 'style-guide', 'style-guide', 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '55d49a93-05f9-48e8-a0b8-55de6758c2eb'),
(215, 215, 1, NULL, NULL, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '6d6d1e35-eecf-4c5d-8a7b-0ae149532ed2'),
(216, 216, 1, NULL, NULL, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '4e2926d1-582e-418d-8bc3-15c601e1a50f'),
(217, 217, 1, NULL, NULL, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'b514afa8-6ffb-4af0-ab0b-2687554b0cc4'),
(218, 218, 1, NULL, NULL, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '3c97fe93-14d2-4dd1-9117-9cf7c646e91c'),
(219, 219, 1, NULL, NULL, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'a5c6297b-7707-45d1-bd75-3c0710e802f7'),
(220, 220, 1, NULL, NULL, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'fa61cee6-1897-4d6a-b629-e286397b13f2'),
(221, 221, 1, NULL, NULL, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '76dd84c7-ba07-4559-9390-e2aa5fd1ff51'),
(222, 222, 1, NULL, NULL, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'c809976f-6c66-47b1-8b1f-3bf6f500bc53'),
(223, 223, 1, NULL, NULL, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '3e0d5fec-a49c-4c0e-96ec-aefa11b1121d'),
(224, 224, 1, NULL, NULL, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '084bdf74-a76e-4fc6-b3e0-922a461591a5'),
(225, 225, 1, NULL, NULL, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'f3e72e90-59b4-4989-909f-fbcb919bc79f'),
(226, 226, 1, NULL, NULL, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'a8880504-a25e-4319-afeb-68ba8fb1e225'),
(227, 227, 1, NULL, NULL, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '735a41c4-6622-4fb3-923c-c80950d1937e'),
(228, 228, 1, NULL, NULL, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'ed643d67-37a4-44a2-aa53-b3b757d0967b'),
(229, 229, 1, NULL, NULL, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'b2b6a943-0708-487c-97da-4ec2e12fc849'),
(230, 230, 1, NULL, NULL, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'e06edbf1-52b3-4cdf-bfa0-29336279c879'),
(231, 231, 1, NULL, NULL, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '4575df3f-1d01-4f4d-89e2-c5163bb6c946'),
(232, 232, 1, NULL, NULL, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'f4b40719-655a-426e-b99e-8b64a21d9e5d'),
(233, 233, 1, NULL, NULL, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '284d2690-c568-42f5-b4b2-437160e46879'),
(234, 234, 1, NULL, NULL, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'e57c2da7-cb4a-4363-be0b-a97ef15b18ed'),
(235, 235, 1, NULL, NULL, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'b00dee0d-26fe-458d-b831-72ad5d472241'),
(236, 236, 1, NULL, NULL, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'f7ce430a-0d09-49a5-8aec-3fac94dd2d40'),
(237, 237, 1, NULL, NULL, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '22ae6d8c-ba14-4389-9478-3d93c9cc4251'),
(238, 238, 1, NULL, NULL, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '8ac93ffc-d7d4-4836-9935-d3313f5f0e7d'),
(239, 239, 1, 'style-guide', 'style-guide', 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '1f15a43e-8429-4814-aa6d-232552f10c24'),
(240, 240, 1, NULL, NULL, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', 'c3de6c65-b144-43e8-a2b8-c22de1944683'),
(241, 241, 1, NULL, NULL, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '8eefa4c3-89e1-4148-b759-cad7ff9a603c'),
(242, 242, 1, NULL, NULL, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '4c91f664-43dc-423e-9ec4-1500c97eb28c'),
(243, 243, 1, NULL, NULL, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '10a44916-acc0-4736-9e33-5628b7153b33'),
(244, 244, 1, NULL, NULL, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '4ff9407a-d928-47e8-9d53-046897380004'),
(245, 245, 1, NULL, NULL, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', 'fa81f21b-ee04-4add-bff3-de03428d8c61'),
(246, 246, 1, NULL, NULL, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '8db2c8f9-983f-42be-abc1-286aafedb657'),
(247, 247, 1, NULL, NULL, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '3e570382-b285-45d2-a285-8a8dc3449f76'),
(248, 248, 1, NULL, NULL, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', 'e9b5a7a1-82b9-4c53-af40-00dfa7e9427c'),
(249, 249, 1, NULL, NULL, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', 'aa34dd8b-3135-4c16-8463-e3dd2c90a17c'),
(250, 250, 1, NULL, NULL, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '2b819e92-b873-45a2-b3c6-5befa46c8672'),
(251, 251, 1, NULL, NULL, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '22d7300a-a3a4-48ef-8d0f-f7372845040e'),
(252, 252, 1, NULL, NULL, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', 'd7834fbe-98a7-46bf-bfb6-57ec388c443f'),
(253, 253, 1, NULL, NULL, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '18bf420d-196f-4ec2-b10f-51816429fb20'),
(254, 254, 1, NULL, NULL, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', 'a5dca473-d889-4d13-b3ed-216508fad01a'),
(255, 255, 1, NULL, NULL, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '5535b862-57c1-47e6-af2c-f79fb69f95bf'),
(256, 256, 1, NULL, NULL, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '647d4fa5-ed21-4882-a865-d4ced5fbaee6'),
(257, 257, 1, NULL, NULL, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '6957949e-2935-450c-b98a-b5946268d1c3'),
(258, 258, 1, NULL, NULL, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', 'b04139bc-6f60-4bc0-b71d-c09a75dc09a9'),
(259, 259, 1, NULL, NULL, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', 'cf5de2d4-4e28-4a89-adf6-8952a72b75cb'),
(260, 260, 1, NULL, NULL, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '58caf307-f8f9-46ad-b4f9-e2fb9c47dae2'),
(261, 261, 1, NULL, NULL, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '28ffe45e-b98d-4735-a340-353955e65560'),
(262, 262, 1, NULL, NULL, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '5a2c2391-96e5-43bc-8556-535ee42c1621'),
(263, 263, 1, NULL, NULL, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '64c7bf05-c2c0-4aa2-901e-c45ba9172035');

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

--
-- Dumping data for table `entries`
--

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, NULL, 1, NULL, '2021-06-20 02:07:00', NULL, NULL, '2021-06-20 02:07:41', '2021-06-20 02:07:41', 'b9d64f1a-eda1-48b4-bfe8-ab0ecc9725d6'),
(3, 1, NULL, 1, NULL, '2021-06-20 02:07:00', NULL, NULL, '2021-06-20 02:07:41', '2021-06-20 02:07:41', '5a7ccdc8-133d-4c9e-8bb4-f15a6882b148'),
(4, 1, NULL, 1, NULL, '2021-06-20 02:07:00', NULL, NULL, '2021-06-20 02:45:06', '2021-06-20 02:45:06', '9f954796-b05a-4af0-b3d1-37e535d0d3f2'),
(5, 1, NULL, 1, NULL, '2021-06-20 02:07:00', NULL, NULL, '2021-06-20 06:55:15', '2021-06-20 06:55:15', '51acd5d7-3bf1-41b9-96e6-efef7ed02527'),
(6, 1, NULL, 1, NULL, '2021-06-20 02:07:00', NULL, NULL, '2021-06-20 06:55:23', '2021-06-20 06:55:23', 'dc5d34eb-c04e-47f2-bcda-7f1a66bbb79c'),
(7, 1, NULL, 1, NULL, '2021-06-20 02:07:00', NULL, NULL, '2021-06-20 07:06:40', '2021-06-20 07:06:40', '00d0ef54-af6c-4610-a845-a7151da854a8'),
(9, 1, NULL, 1, NULL, '2021-06-20 02:07:00', NULL, NULL, '2021-06-20 07:15:09', '2021-06-20 07:15:09', '63407004-3929-4f20-8d01-859f62b94874'),
(11, 1, NULL, 1, NULL, '2021-06-20 02:07:00', NULL, NULL, '2021-06-20 07:38:07', '2021-06-20 07:38:07', '2423e0f5-fdad-4718-949b-a35dfe8feee0'),
(13, 1, NULL, 1, NULL, '2021-06-20 02:07:00', NULL, NULL, '2021-06-20 07:43:02', '2021-06-20 07:43:02', 'adda8d7a-1220-4225-90cb-e323b9756a6e'),
(19, 1, NULL, 1, NULL, '2021-06-20 02:07:00', NULL, NULL, '2021-06-20 07:51:34', '2021-06-20 07:51:34', 'f1450e72-8146-4af9-b7a7-47d51f59876a'),
(27, 1, NULL, 1, NULL, '2021-06-20 02:07:00', NULL, NULL, '2021-06-20 07:57:21', '2021-06-20 07:57:21', '3307f2ea-557c-421e-a762-1b340885c99d'),
(35, 1, NULL, 1, NULL, '2021-06-20 02:07:00', NULL, NULL, '2021-06-20 08:24:33', '2021-06-20 08:24:33', '5d1bae60-e165-4342-ac85-f5a966ccc486'),
(48, 1, NULL, 1, NULL, '2021-06-20 02:07:00', NULL, NULL, '2021-06-20 08:35:27', '2021-06-20 08:35:27', 'a56cd2ed-ddf2-485a-beb2-9855d31edbe1'),
(56, 1, NULL, 1, NULL, '2021-06-20 02:07:00', NULL, NULL, '2021-06-20 11:46:02', '2021-06-20 11:46:02', 'ca2fa8fe-c442-4b73-99e0-665fe81a7516'),
(64, 1, NULL, 1, NULL, '2021-06-20 02:07:00', NULL, NULL, '2021-06-20 11:56:09', '2021-06-20 11:56:09', 'a0eef1cf-d3b1-437c-ac1a-c9d6487e1d46'),
(72, 1, NULL, 1, NULL, '2021-06-20 02:07:00', NULL, NULL, '2021-06-20 11:57:08', '2021-06-20 11:57:08', 'bea82b18-7dd6-482b-b3ba-b32382a1b740'),
(80, 1, NULL, 1, NULL, '2021-06-20 02:07:00', NULL, NULL, '2021-06-20 12:16:45', '2021-06-20 12:16:45', 'f939d624-7908-4220-ab7e-770d3be14775'),
(93, 1, NULL, 1, NULL, '2021-06-20 02:07:00', NULL, NULL, '2021-06-20 14:35:03', '2021-06-20 14:35:03', 'd7178945-f545-49a7-a3b0-df06aa0763e7'),
(116, 1, NULL, 1, NULL, '2021-06-20 02:07:00', NULL, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '3cb80afd-aa7d-4d57-bb96-1aff4783e446'),
(140, 1, NULL, 1, NULL, '2021-06-20 02:07:00', NULL, NULL, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'c82a7e35-c6e7-463f-bcad-cc643bc9df8e'),
(164, 1, NULL, 1, NULL, '2021-06-20 02:07:00', NULL, NULL, '2021-06-20 14:53:31', '2021-06-20 14:53:31', '2bec50be-6c37-4653-9edc-83fc7653a76e'),
(189, 1, NULL, 1, NULL, '2021-06-20 02:07:00', NULL, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'cd1c12ce-8240-45fc-b5d7-f044baf15858'),
(214, 1, NULL, 1, NULL, '2021-06-20 02:07:00', NULL, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '3405c513-e67b-4f50-b250-e78822c404dc'),
(239, 1, NULL, 1, NULL, '2021-06-20 02:07:00', NULL, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', 'bccce47f-9f6e-48cb-8606-f4b8dee23aa1');

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

--
-- Dumping data for table `entrytypes`
--

INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'Style Guide', 'styleGuide', 0, 'site', NULL, '{section.name|raw}', 1, '2021-06-20 02:07:41', '2021-06-20 02:07:41', NULL, 'b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2');

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
(1, 'Common', '2021-06-17 10:02:01', '2021-06-17 10:02:01', NULL, '3de9f34b-4f3e-4e93-ac00-2031eee86068'),
(2, 'Style Guide', '2021-06-20 02:37:34', '2021-06-20 02:37:34', NULL, '6b83f33a-5c36-4d1a-bde3-463e90ce95d2');

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

--
-- Dumping data for table `fieldlayoutfields`
--

INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(27, 4, 13, 8, 0, 0, '2021-06-20 07:10:21', '2021-06-20 07:10:21', '9257ff4f-8034-487b-a383-1d9013229e23'),
(28, 4, 13, 6, 0, 1, '2021-06-20 07:10:21', '2021-06-20 07:10:21', '5909e3e2-ca97-41b4-ad2f-42981ddc810f'),
(29, 4, 13, 7, 0, 2, '2021-06-20 07:10:21', '2021-06-20 07:10:21', 'f6232353-fbc8-43d4-bd16-1ac46cb01a64'),
(52, 1, 22, 14, 0, 1, '2021-06-20 08:24:33', '2021-06-20 08:24:33', '51d6f374-8c59-425a-a343-e77b73e1e220'),
(53, 1, 22, 9, 0, 2, '2021-06-20 08:24:33', '2021-06-20 08:24:33', 'db34e9fc-9ce7-406e-8a8d-6d462a23c527'),
(54, 1, 22, 5, 0, 3, '2021-06-20 08:24:33', '2021-06-20 08:24:33', 'a47dfda4-b7a2-46b7-b8b7-9dcef9593305'),
(55, 1, 22, 1, 0, 4, '2021-06-20 08:24:33', '2021-06-20 08:24:33', 'efe8c33d-cf31-43eb-ace6-e4a98daf41ec'),
(58, 6, 24, 15, 0, 0, '2021-06-20 08:30:34', '2021-06-20 08:30:34', '62384f3c-c627-4e9a-9ff4-3491d22d0d34'),
(59, 6, 24, 16, 0, 1, '2021-06-20 08:30:34', '2021-06-20 08:30:34', '35c979c3-c549-4e89-90f8-196e6fde1bc7'),
(76, 2, 29, 2, 0, 0, '2021-06-20 11:56:39', '2021-06-20 11:56:39', '09546c41-6423-4376-b8f0-05830c304452'),
(77, 2, 29, 4, 0, 1, '2021-06-20 11:56:39', '2021-06-20 11:56:39', '6a1db3e9-86ee-4117-a72b-882e5c56c00f'),
(78, 2, 29, 29, 0, 2, '2021-06-20 11:56:39', '2021-06-20 11:56:39', '54bba256-c4bf-4db6-9041-e0fca0c42554'),
(79, 2, 29, 30, 0, 3, '2021-06-20 11:56:39', '2021-06-20 11:56:39', '2271d3a0-d3a5-434d-a1f5-bc1909798b42'),
(80, 2, 29, 31, 0, 4, '2021-06-20 11:56:39', '2021-06-20 11:56:39', '1dc28ed8-2585-4c8a-af01-9bef6aa9dd76'),
(81, 2, 29, 28, 0, 5, '2021-06-20 11:56:39', '2021-06-20 11:56:39', '0f9c45fc-4191-4d8b-b3cf-e8a06df84293'),
(101, 5, 33, 13, 0, 0, '2021-06-20 16:09:46', '2021-06-20 16:09:46', '810bd7b5-7f12-481c-8457-3446e39977c2'),
(102, 5, 33, 32, 0, 1, '2021-06-20 16:09:46', '2021-06-20 16:09:46', 'ff493f58-7a81-4e20-b476-9770eb818e88'),
(103, 5, 33, 12, 0, 2, '2021-06-20 16:09:46', '2021-06-20 16:09:46', '853c3836-d719-4753-ab26-1e04540c8562'),
(104, 5, 33, 10, 0, 3, '2021-06-20 16:09:46', '2021-06-20 16:09:46', '279071ac-9c06-4bfb-8603-a2150c0caf7d'),
(105, 5, 33, 11, 0, 4, '2021-06-20 16:09:46', '2021-06-20 16:09:46', 'fab95273-d07e-4634-ae32-529b318d84bf'),
(106, 5, 33, 34, 0, 5, '2021-06-20 16:09:46', '2021-06-20 16:09:46', '64c5faf5-c950-497b-8cad-55551aa603df'),
(107, 5, 33, 33, 0, 6, '2021-06-20 16:09:46', '2021-06-20 16:09:46', 'c9210cc8-d3ac-4a58-b38b-061b99172bab');

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

--
-- Dumping data for table `fieldlayouts`
--

INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '2021-06-20 02:07:41', '2021-06-20 02:07:41', NULL, '76e5b3be-9593-4fae-8331-5dda09498daa'),
(2, 'craft\\elements\\MatrixBlock', '2021-06-20 02:44:10', '2021-06-20 02:44:10', NULL, 'f9472ea6-85d3-497d-8af2-0b84bd47fbdf'),
(3, 'craft\\elements\\MatrixBlock', '2021-06-20 02:44:10', '2021-06-20 02:44:10', '2021-06-20 05:01:11', '49a70716-2197-447a-acca-7f310a27388f'),
(4, 'craft\\elements\\MatrixBlock', '2021-06-20 05:07:38', '2021-06-20 05:07:38', NULL, 'd2d9cb92-3e31-4dfb-8ef8-e62450923fec'),
(5, 'craft\\elements\\MatrixBlock', '2021-06-20 05:09:33', '2021-06-20 05:09:33', NULL, '3e9a6b10-4124-434e-965f-aed73cfcfe1a'),
(6, 'craft\\elements\\MatrixBlock', '2021-06-20 05:18:32', '2021-06-20 05:18:32', NULL, 'a70ffbfe-9a3e-408e-b6d7-2b47bdd254bd'),
(7, 'craft\\elements\\MatrixBlock', '2021-06-20 07:37:35', '2021-06-20 07:37:35', '2021-06-20 08:27:57', '1f6fe246-ee62-40a9-acce-40b42ccdfca5'),
(8, 'craft\\elements\\MatrixBlock', '2021-06-20 07:37:35', '2021-06-20 07:37:35', '2021-06-20 08:27:57', '462cec4f-e0bc-436b-b919-d55a9e057d71'),
(9, 'craft\\elements\\MatrixBlock', '2021-06-20 07:37:35', '2021-06-20 07:37:35', '2021-06-20 08:27:57', '10c8abbd-3e3f-47b0-9009-bd7e0fa502d1');

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

--
-- Dumping data for table `fieldlayouttabs`
--

INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 3, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"735b3b14-2f7e-49b4-9c25-9cf4bb942d45\"}]', 1, '2021-06-20 02:44:10', '2021-06-20 02:44:10', '5f8c342c-4fd8-4bef-9792-99aa2fdafea6'),
(13, 4, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"b72516f8-0a20-475b-a1e8-e02b72f2e679\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4d4253f8-e888-4874-879e-5a538ea7fefc\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"443921d4-34ec-439f-b3b7-3a9b608989f0\"}]', 1, '2021-06-20 07:10:21', '2021-06-20 07:10:21', 'cb9165b6-4355-49f5-aa34-b85807516eaa'),
(18, 7, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"e5f5b17f-2f3f-421f-8207-1bd247d0f756\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"54ebf06a-88e5-4bc7-987e-b4d95c73205b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"361fa5dd-1d9f-4ffc-8c8c-fbe55aad2a90\"}]', 1, '2021-06-20 07:37:35', '2021-06-20 07:37:35', '1605b7a1-5246-4a5f-997f-47c3e2b7e44a'),
(19, 8, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d2fd1cd3-4bdc-48aa-9bc2-5cf70c85fc75\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"151a73fb-3012-404c-97df-d3f92d859799\"}]', 1, '2021-06-20 07:37:35', '2021-06-20 07:37:35', '5e11a5d0-c1d8-4575-9310-f8c28c7c7f75'),
(20, 9, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"973b5ad7-e02b-4a48-8a4d-6a27ad207b38\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"59d66601-51b7-4d9f-aaae-22210e3d20f4\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"17f48d33-fc5e-4ff6-86a7-cb2706abcfaf\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7efafbd6-4ed1-4d32-a4aa-001822bdc69c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"86c5a9ea-0052-483f-ae19-4eea6a5a895e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"854cbf0e-201b-4cea-add5-0a96aec7ac41\"}]', 1, '2021-06-20 07:37:35', '2021-06-20 07:37:35', '925c6ae7-ea5a-457c-877f-ef71332a1c01'),
(22, 1, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"b5a47791-9697-440b-97de-1045d6e56906\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"8a09f4c0-7dec-4ea8-b167-1edb46ad117f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"545cc5ba-6369-4d6d-82a0-4534459ea8ed\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f315fa2c-faf1-4d0a-99a6-4675580793d5\"}]', 1, '2021-06-20 08:24:33', '2021-06-20 08:24:33', '3588676b-0c51-4190-8f4e-9de9b6705569'),
(24, 6, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"28016837-d7f2-4eb3-9cfd-4f04b3b18049\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"af79b58f-062d-46ec-9479-412768072903\"}]', 1, '2021-06-20 08:30:34', '2021-06-20 08:30:34', 'cd81c282-ab6f-4733-a530-14761fa777c1'),
(29, 2, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":25,\"fieldUid\":\"ea5743bb-ab28-45ff-bdb9-38834e4a254a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":25,\"fieldUid\":\"06099193-0e6c-4791-87a6-26abed3cebd6\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":25,\"fieldUid\":\"77864449-99ac-4316-a005-671eab591a1c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":25,\"fieldUid\":\"81325012-d0a8-43fc-a153-74dccf1059b8\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":50,\"fieldUid\":\"5403b5b2-cfae-4c44-8405-d5d6c0f52bea\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":50,\"fieldUid\":\"60dd8281-5aad-4f4c-847d-bece85650947\"}]', 1, '2021-06-20 11:56:39', '2021-06-20 11:56:39', 'd60ef381-970f-4a2e-a9ea-a3cdea5943b0'),
(33, 5, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":50,\"fieldUid\":\"209bd109-eb97-446d-a8aa-9452ca8b8787\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":50,\"fieldUid\":\"c10813a5-7287-48d9-a893-c6d53dd647eb\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":25,\"fieldUid\":\"8e48e8d5-cf72-4b79-baa7-b88991c5afe0\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":25,\"fieldUid\":\"6b3359c4-2514-46f2-9309-9eedc1fe991a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":25,\"fieldUid\":\"6d9cf833-1758-43bc-a23d-d083ea9f09fe\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"e8bc3529-9459-48cd-83a1-e17256cccdc0\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"5c5c0143-c0f1-427b-a6d3-2d0013085a25\"}]', 1, '2021-06-20 16:09:46', '2021-06-20 16:09:46', '0f33d1c0-dc9b-442e-959b-b4d3be3aab29');

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

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 2, 'Typography', 'typography', 'global', '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_typography}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}', '2021-06-20 02:44:10', '2021-06-20 08:27:56', 'f315fa2c-faf1-4d0a-99a6-4675580793d5'),
(2, NULL, 'element', 'element', 'matrixBlockType:b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4', '', 0, 'none', NULL, 'craft\\fields\\Dropdown', '{\"optgroups\":true,\"options\":[{\"label\":\"H1\",\"value\":\"h1\",\"default\":\"\"},{\"label\":\"H2\",\"value\":\"h2\",\"default\":\"\"},{\"label\":\"H3\",\"value\":\"h3\",\"default\":\"\"},{\"label\":\"H4\",\"value\":\"h4\",\"default\":\"\"},{\"label\":\"H5\",\"value\":\"h5\",\"default\":\"\"},{\"label\":\"H6\",\"value\":\"h6\",\"default\":\"\"},{\"label\":\"Paragraph (Normal)\",\"value\":\"paragraph\",\"default\":\"\"},{\"label\":\"Paragraph (Small)\",\"value\":\"paragraphSmall\",\"default\":\"\"},{\"label\":\"Paragraph (Medium)\",\"value\":\"paragraphMedium\",\"default\":\"\"},{\"label\":\"Paragraph (Big)\",\"value\":\"paragraphBig\",\"default\":\"\"}]}', '2021-06-20 02:44:10', '2021-06-20 11:43:01', 'ea5743bb-ab28-45ff-bdb9-38834e4a254a'),
(4, NULL, 'Font Size (desktop)', 'fontSizeDesktop', 'matrixBlockType:b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2021-06-20 05:01:11', '2021-06-20 11:52:13', '06099193-0e6c-4791-87a6-26abed3cebd6'),
(5, 2, 'Links', 'links', 'global', '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_links}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}', '2021-06-20 05:07:38', '2021-06-20 05:07:38', '545cc5ba-6369-4d6d-82a0-4534459ea8ed'),
(6, NULL, 'Font Color', 'fontColor', 'matrixBlockType:6b9aed45-53ef-49c3-9bab-b3840d9b955b', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2021-06-20 05:07:38', '2021-06-20 05:07:38', '4d4253f8-e888-4874-879e-5a538ea7fefc'),
(7, NULL, 'Background Color', 'backgroundColor', 'matrixBlockType:6b9aed45-53ef-49c3-9bab-b3840d9b955b', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2021-06-20 05:07:38', '2021-06-20 05:07:38', '443921d4-34ec-439f-b3b7-3a9b608989f0'),
(8, NULL, 'State', 'state', 'matrixBlockType:6b9aed45-53ef-49c3-9bab-b3840d9b955b', '', 0, 'none', NULL, 'craft\\fields\\Dropdown', '{\"optgroups\":true,\"options\":[{\"label\":\"Normal\",\"value\":\"normal\",\"default\":\"\"},{\"label\":\"Hover\",\"value\":\"hover\",\"default\":\"\"},{\"label\":\"Focus\",\"value\":\"focus\",\"default\":\"\"},{\"label\":\"Active\",\"value\":\"active\",\"default\":\"\"},{\"label\":\"Visited\",\"value\":\"visited\",\"default\":\"\"},{\"label\":\"\",\"value\":\"\",\"default\":\"\"}]}', '2021-06-20 05:07:38', '2021-06-20 05:07:38', 'b72516f8-0a20-475b-a1e8-e02b72f2e679'),
(9, 2, 'Buttons', 'buttons', 'global', '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_buttons}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}', '2021-06-20 05:09:33', '2021-06-20 05:09:33', '8a09f4c0-7dec-4ea8-b167-1edb46ad117f'),
(10, NULL, 'Background Color', 'backgroundColor', 'matrixBlockType:3a002a99-2c41-49fe-9e39-060688231108', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2021-06-20 05:09:33', '2021-06-20 05:09:33', '6b3359c4-2514-46f2-9309-9eedc1fe991a'),
(11, NULL, 'Padding', 'padding', 'matrixBlockType:3a002a99-2c41-49fe-9e39-060688231108', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2021-06-20 05:09:33', '2021-06-20 05:09:33', '6d9cf833-1758-43bc-a23d-d083ea9f09fe'),
(12, NULL, 'Font Color', 'fontColor', 'matrixBlockType:3a002a99-2c41-49fe-9e39-060688231108', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2021-06-20 05:09:33', '2021-06-20 05:09:33', '8e48e8d5-cf72-4b79-baa7-b88991c5afe0'),
(13, NULL, 'State', 'state', 'matrixBlockType:3a002a99-2c41-49fe-9e39-060688231108', '', 0, 'none', NULL, 'craft\\fields\\Dropdown', '{\"optgroups\":true,\"options\":[{\"label\":\"Normal\",\"value\":\"normal\",\"default\":\"\"},{\"label\":\"Active\",\"value\":\"active\",\"default\":\"\"},{\"label\":\"Hover\",\"value\":\"hover\",\"default\":\"\"},{\"label\":\"Focus\",\"value\":\"focus\",\"default\":\"\"}]}', '2021-06-20 05:09:33', '2021-06-20 05:09:33', '209bd109-eb97-446d-a8aa-9452ca8b8787'),
(14, 2, 'Colors', 'colors', 'global', '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_colors}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}', '2021-06-20 05:18:32', '2021-06-20 05:18:32', 'b5a47791-9697-440b-97de-1045d6e56906'),
(15, NULL, 'Hex', 'hex', 'matrixBlockType:234dff92-509e-4671-a7e1-f2af941b4470', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2021-06-20 05:18:32', '2021-06-20 05:18:32', '28016837-d7f2-4eb3-9cfd-4f04b3b18049'),
(16, NULL, 'Variant name', 'variantName', 'matrixBlockType:234dff92-509e-4671-a7e1-f2af941b4470', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2021-06-20 05:18:32', '2021-06-20 08:30:34', 'af79b58f-062d-46ec-9479-412768072903'),
(28, NULL, 'Font Family', 'fontFamily', 'matrixBlockType:b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2021-06-20 11:31:03', '2021-06-20 11:31:03', '60dd8281-5aad-4f4c-847d-bece85650947'),
(29, NULL, 'Font Size (mobile)', 'fontSizeMobile', 'matrixBlockType:b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2021-06-20 11:52:14', '2021-06-20 11:52:14', '77864449-99ac-4316-a005-671eab591a1c'),
(30, NULL, 'Line Height', 'lineHeight', 'matrixBlockType:b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2021-06-20 11:52:14', '2021-06-20 11:52:14', '81325012-d0a8-43fc-a153-74dccf1059b8'),
(31, NULL, 'Font Weight', 'fontWeight', 'matrixBlockType:b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2021-06-20 11:56:38', '2021-06-20 11:56:38', '5403b5b2-cfae-4c44-8405-d5d6c0f52bea'),
(32, NULL, 'Button Type', 'buttonType', 'matrixBlockType:3a002a99-2c41-49fe-9e39-060688231108', '', 0, 'none', NULL, 'craft\\fields\\Dropdown', '{\"optgroups\":true,\"options\":[{\"label\":\"Primary button\",\"value\":\"Primary Button\",\"default\":\"\"},{\"label\":\"Secondary button\",\"value\":\"Secondary Button\",\"default\":\"\"}]}', '2021-06-20 14:42:29', '2021-06-20 16:09:46', 'c10813a5-7287-48d9-a893-c6d53dd647eb'),
(33, NULL, 'Border (width, color and type)', 'border', 'matrixBlockType:3a002a99-2c41-49fe-9e39-060688231108', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2021-06-20 15:56:22', '2021-06-20 15:56:22', '5c5c0143-c0f1-427b-a6d3-2d0013085a25'),
(34, NULL, 'Border Radius', 'borderRadius', 'matrixBlockType:3a002a99-2c41-49fe-9e39-060688231108', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2021-06-20 15:56:22', '2021-06-20 16:00:01', 'e8bc3529-9459-48cd-83a1-e17256cccdc0');

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
(1, '3.6.17', '3.6.8', 0, 'sojetjbicdeh', 'jmvvxkvtiivx', '2021-06-17 10:02:01', '2021-06-20 16:09:46', '166b442d-d5d7-45b1-87b2-827a76f7f992');

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

--
-- Dumping data for table `matrixblocks`
--

INSERT INTO `matrixblocks` (`id`, `ownerId`, `fieldId`, `typeId`, `sortOrder`, `deletedWithOwner`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(8, 2, 14, 5, 1, NULL, '2021-06-20 07:15:09', '2021-06-20 07:15:09', '231b6de7-6eac-4a7e-97e0-4b13052b50ca'),
(10, 9, 14, 5, 1, NULL, '2021-06-20 07:15:09', '2021-06-20 07:15:09', '0d1db81d-92de-463f-9aef-d767f1abccf2'),
(12, 2, 1, 1, 1, 0, '2021-06-20 07:43:02', '2021-06-20 07:43:02', 'a66a2d42-0e06-42ec-a250-a5186a086f2a'),
(14, 13, 1, 1, 1, NULL, '2021-06-20 07:43:02', '2021-06-20 07:43:02', 'c8e22dde-69e6-4454-93e0-dbf4f703cef1'),
(24, 2, 1, 1, 1, NULL, '2021-06-20 07:57:21', '2021-06-20 11:46:02', '7dbcd70a-7430-46b1-b115-362ae2dd48e0'),
(32, 27, 1, 1, 5, NULL, '2021-06-20 07:57:21', '2021-06-20 07:57:21', '91840b3b-2484-48f1-a8e7-0d4986841874'),
(36, 35, 14, 5, 1, NULL, '2021-06-20 08:24:33', '2021-06-20 08:24:33', '964a20fb-752f-40a1-8003-317e3e02ef2a'),
(41, 35, 1, 1, 5, NULL, '2021-06-20 08:24:33', '2021-06-20 08:24:33', 'ee30ac37-fa61-4c16-9868-c42673c93862'),
(44, 2, 14, 5, 2, NULL, '2021-06-20 08:35:27', '2021-06-20 08:35:27', '8a17fe92-7b57-4d5e-b0e5-abdf430f233c'),
(45, 2, 14, 5, 3, NULL, '2021-06-20 08:35:27', '2021-06-20 08:35:27', '083fd731-ebda-4f6b-943c-0f4741a80dc5'),
(46, 2, 14, 5, 4, NULL, '2021-06-20 08:35:27', '2021-06-20 08:35:27', 'ae4d2d15-a764-4c6d-826d-74c9e98f7d89'),
(47, 2, 14, 5, 5, NULL, '2021-06-20 08:35:27', '2021-06-20 08:35:27', '94dd8a3d-ee51-4dc6-9fee-212feeee6ddf'),
(49, 48, 14, 5, 1, NULL, '2021-06-20 08:35:27', '2021-06-20 08:35:27', '5da81a2e-f99f-4f66-a802-5f0ac939a8c7'),
(50, 48, 14, 5, 2, NULL, '2021-06-20 08:35:27', '2021-06-20 08:35:27', '8aefdfa9-2cdc-48d2-a8d2-7badc9854226'),
(51, 48, 14, 5, 3, NULL, '2021-06-20 08:35:27', '2021-06-20 08:35:27', '5dee995a-ea4c-42ae-906e-93100c14d3c9'),
(52, 48, 14, 5, 4, NULL, '2021-06-20 08:35:27', '2021-06-20 08:35:27', 'ba0dfd3a-f3e9-43ae-a1da-8ed113b354cc'),
(53, 48, 14, 5, 5, NULL, '2021-06-20 08:35:27', '2021-06-20 08:35:27', '77c6eee9-4696-4996-be6b-c39bc14e3c43'),
(54, 48, 1, 1, 5, NULL, '2021-06-20 08:35:27', '2021-06-20 08:35:27', 'aaaa3d94-798b-4bdc-8e47-61e5e4034098'),
(55, 2, 1, 1, 7, NULL, '2021-06-20 11:46:02', '2021-06-20 14:35:03', '3b3837f1-b7b0-40e1-8c2e-8fb5a1ec992e'),
(57, 56, 14, 5, 1, NULL, '2021-06-20 11:46:03', '2021-06-20 11:46:03', '906f6866-656e-466b-a7fc-1b2bf6260ff6'),
(58, 56, 14, 5, 2, NULL, '2021-06-20 11:46:03', '2021-06-20 11:46:03', '4b9a1d7c-3a53-42b9-bae4-06081a994c3c'),
(59, 56, 14, 5, 3, NULL, '2021-06-20 11:46:03', '2021-06-20 11:46:03', 'd759bc8a-5b06-4947-9bf0-1834b6d48f69'),
(60, 56, 14, 5, 4, NULL, '2021-06-20 11:46:03', '2021-06-20 11:46:03', 'f6fcc1ae-aa70-4fd6-b7f8-096b2e2d3c7f'),
(61, 56, 14, 5, 5, NULL, '2021-06-20 11:46:03', '2021-06-20 11:46:03', 'debeb82e-a6aa-411c-947d-67ada948d7d6'),
(62, 56, 1, 1, 1, NULL, '2021-06-20 11:46:03', '2021-06-20 11:46:03', 'e08bf36c-f55e-4756-978e-090d82b587b4'),
(63, 56, 1, 1, 2, NULL, '2021-06-20 11:46:03', '2021-06-20 11:46:03', 'ae99887e-0a60-4c15-bb3a-98deeba2d771'),
(65, 64, 14, 5, 1, NULL, '2021-06-20 11:56:09', '2021-06-20 11:56:09', 'a6d2aa5c-f8e2-4fda-be7c-57cf24c02c8e'),
(66, 64, 14, 5, 2, NULL, '2021-06-20 11:56:09', '2021-06-20 11:56:09', '744ef19e-cf9a-428a-88c1-bffc865fd223'),
(67, 64, 14, 5, 3, NULL, '2021-06-20 11:56:09', '2021-06-20 11:56:09', 'e6743e88-3047-4c55-a756-3f7519387fc9'),
(68, 64, 14, 5, 4, NULL, '2021-06-20 11:56:09', '2021-06-20 11:56:09', '8be4c76f-dec4-4b70-a7a8-b14ceccbd9e7'),
(69, 64, 14, 5, 5, NULL, '2021-06-20 11:56:09', '2021-06-20 11:56:09', 'aa314f9a-c005-4a1e-87c2-0d58f5bb63f4'),
(70, 64, 1, 1, 1, NULL, '2021-06-20 11:56:09', '2021-06-20 11:56:09', '34b14d0e-e70a-42e4-b463-ea0710b38d47'),
(71, 64, 1, 1, 2, NULL, '2021-06-20 11:56:09', '2021-06-20 11:56:09', 'a712212c-dcc4-4ae1-8d54-2184b7bbfe79'),
(73, 72, 14, 5, 1, NULL, '2021-06-20 11:57:08', '2021-06-20 11:57:08', 'eb07f56b-4540-4f9a-8ce6-70862cba2ab3'),
(74, 72, 14, 5, 2, NULL, '2021-06-20 11:57:08', '2021-06-20 11:57:08', '6bca3188-f688-42f3-af87-cd77ece69e39'),
(75, 72, 14, 5, 3, NULL, '2021-06-20 11:57:08', '2021-06-20 11:57:08', '9aaaecfd-143b-4b9d-ba6b-399c64eebe82'),
(76, 72, 14, 5, 4, NULL, '2021-06-20 11:57:08', '2021-06-20 11:57:08', '49efd527-7368-46af-9483-920fdd116d7d'),
(77, 72, 14, 5, 5, NULL, '2021-06-20 11:57:08', '2021-06-20 11:57:08', '7dde0325-45cd-4323-8462-834ff29e81d9'),
(78, 72, 1, 1, 1, NULL, '2021-06-20 11:57:08', '2021-06-20 11:57:08', 'fc7d0988-3bad-4153-89d1-0711a3b90f8f'),
(79, 72, 1, 1, 2, NULL, '2021-06-20 11:57:08', '2021-06-20 11:57:08', '7e62ff0d-000b-48c9-af20-2ae322e440b3'),
(81, 80, 14, 5, 1, NULL, '2021-06-20 12:16:45', '2021-06-20 12:16:45', 'a6bd25d4-5be1-48be-be79-6551f4e59375'),
(82, 80, 14, 5, 2, NULL, '2021-06-20 12:16:45', '2021-06-20 12:16:45', '199d2f13-f0ea-4487-92e5-84ef93b9e97b'),
(83, 80, 14, 5, 3, NULL, '2021-06-20 12:16:45', '2021-06-20 12:16:45', '8a83e053-fa77-4977-8324-2127d1fa72ee'),
(84, 80, 14, 5, 4, NULL, '2021-06-20 12:16:45', '2021-06-20 12:16:45', '3b345b18-ad1a-42b1-8626-3c2d4fbcea4a'),
(85, 80, 14, 5, 5, NULL, '2021-06-20 12:16:45', '2021-06-20 12:16:45', 'f443d5cf-2d77-40b4-b6fe-e76def5c4439'),
(86, 80, 1, 1, 1, NULL, '2021-06-20 12:16:45', '2021-06-20 12:16:45', '55a16baf-69ac-4d94-9ddc-b2f5cc53d58d'),
(87, 80, 1, 1, 2, NULL, '2021-06-20 12:16:45', '2021-06-20 12:16:45', 'cbde4dbc-0fb8-43a5-be44-b79927debd68'),
(88, 2, 1, 1, 2, NULL, '2021-06-20 14:35:03', '2021-06-20 14:35:03', 'fc236225-9a29-49d2-a53b-34846d40315b'),
(89, 2, 1, 1, 3, NULL, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '3e010b9b-e57a-4d65-aafe-04da3f146e08'),
(90, 2, 1, 1, 4, NULL, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '4e0b2ebb-0a82-44af-b082-910f9e66ee11'),
(91, 2, 1, 1, 5, NULL, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '7673eea4-85a4-42d6-89b3-e7d196243c2d'),
(92, 2, 1, 1, 6, NULL, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '8b91934a-b19b-4900-8ee8-73ffc5f8057f'),
(94, 93, 14, 5, 1, NULL, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '9716c8cd-ba08-4093-a459-1af4ee905014'),
(95, 93, 14, 5, 2, NULL, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '4fde1dd9-1bb3-4cb5-98f1-3a4f84c30c19'),
(96, 93, 14, 5, 3, NULL, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '188ab735-9ef0-42bf-9cac-d525dad989b6'),
(97, 93, 14, 5, 4, NULL, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '0a4abadb-1d5b-4fb2-937a-85c0895286ae'),
(98, 93, 14, 5, 5, NULL, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '35d5df3f-cce3-437b-bca5-2ad1da97ec16'),
(99, 93, 1, 1, 1, NULL, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '4d217151-6a24-46dc-b1e9-f9bc560eb17d'),
(100, 93, 1, 1, 2, NULL, '2021-06-20 14:35:03', '2021-06-20 14:35:03', 'af9e5b63-5d65-4796-a347-3cf91b311a1b'),
(101, 93, 1, 1, 3, NULL, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '2cd85e37-1cc3-46cd-a879-297dad23f0a4'),
(102, 93, 1, 1, 4, NULL, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '50551775-5a84-4279-b4d3-d1effaa47857'),
(103, 93, 1, 1, 5, NULL, '2021-06-20 14:35:03', '2021-06-20 14:35:03', 'a5ca61ef-600d-4dc0-b59d-05e376b7de38'),
(104, 93, 1, 1, 6, NULL, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '7b42865f-6b7c-4364-bcc4-9f1c921f2a12'),
(105, 93, 1, 1, 7, NULL, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '3f4b397a-c10e-4bbe-a841-90809f7f317c'),
(106, 2, 14, 5, 6, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '6b9f78dd-085d-4893-a07d-b88b28b00ee3'),
(107, 2, 9, 4, 1, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'fe6177ea-9d4c-47ce-8ec8-11f06a870252'),
(108, 2, 9, 4, 2, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'd9135de6-3355-4500-8a1b-380f2939289e'),
(109, 2, 9, 4, 3, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'b20f2e5e-152b-4fd1-9c3f-fad19709125f'),
(110, 2, 9, 4, 4, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '85bb372a-8d59-4507-b25c-9973eabdd1e0'),
(111, 2, 9, 4, 5, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '0ca8b633-3564-4db3-bb12-c6b4a46a718d'),
(112, 2, 5, 3, 1, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'a0f5026a-a413-42d8-88ff-87f13519f57a'),
(113, 2, 5, 3, 2, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '2346ad0d-2d91-47e0-9e31-6b1c5397704c'),
(114, 2, 5, 3, 3, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '4169261b-4f1a-47f6-8ad8-73861fa28764'),
(115, 2, 5, 3, 4, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '04380271-1cdb-4803-8a70-7ba8f02b26d9'),
(117, 116, 14, 5, 1, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '7c0a6a32-7379-4497-9aec-5349def8ea9f'),
(118, 116, 14, 5, 2, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '6f630765-80e3-41bc-8f00-41ba75c80b60'),
(119, 116, 14, 5, 3, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '9968fe06-b4cc-47e9-860c-b723e471f85e'),
(120, 116, 14, 5, 4, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'a82067fb-b17f-42fe-bba3-9b4870fd4b71'),
(121, 116, 14, 5, 5, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'cfdb2e0b-f788-40c9-9075-048f7b73dc1e'),
(122, 116, 14, 5, 6, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '00ae5b84-f82e-4fb6-b224-fc16de8687fd'),
(123, 116, 9, 4, 1, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'f9aa7e0a-9a45-4fc7-bfaf-14adc98ee89c'),
(124, 116, 9, 4, 2, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'e2d9f64c-580a-4502-bd64-c72a4b4a9000'),
(125, 116, 9, 4, 3, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'f660d212-487b-48b2-aacb-fc879f813837'),
(126, 116, 9, 4, 4, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'a9160e3f-118e-4236-9338-624bcd117480'),
(127, 116, 9, 4, 5, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'a95c5dd0-65e2-4006-8fa6-1aa71f8d01d9'),
(128, 116, 5, 3, 1, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'f80412d3-f872-47a1-aee5-20591eaa9c05'),
(129, 116, 5, 3, 2, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'e65941a7-5751-489a-9f83-e10fdd3ca1cd'),
(130, 116, 5, 3, 3, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'abda1d8d-e807-45cd-b0ff-65032bb50ddc'),
(131, 116, 5, 3, 4, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '37d704ea-9ce4-4ff4-aae7-a1fc0830c506'),
(132, 116, 1, 1, 1, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '69fc3673-4c9f-49f8-acc9-c44d013a46bb'),
(133, 116, 1, 1, 2, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '6643b5dc-0f15-4a3a-9411-c6d4706e5046'),
(134, 116, 1, 1, 3, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '3ed58443-c306-4cb9-919b-b98d3fde6d17'),
(135, 116, 1, 1, 4, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'db83f1e9-1110-4ad7-96c0-6e56567e8411'),
(136, 116, 1, 1, 5, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '7bb093d5-34a1-4ee6-8933-fc456aee01a7'),
(137, 116, 1, 1, 6, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '19641697-53a9-45e8-812a-d4b7063907a6'),
(138, 116, 1, 1, 7, NULL, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '4af63df1-83db-4c92-b0b0-4aa8556864c5'),
(139, 2, 9, 4, 6, NULL, '2021-06-20 14:51:24', '2021-06-20 14:51:24', '4d6b1a81-fcdf-4b54-b4b5-34e9460522e3'),
(141, 140, 14, 5, 1, NULL, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '0d529e24-6636-4c5a-b42c-bd4d8374e3f0'),
(142, 140, 14, 5, 2, NULL, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'df64439b-ec95-46bd-bab3-69c166fcb6ef'),
(143, 140, 14, 5, 3, NULL, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'f7461c7e-7f00-4b26-86d8-419913479bfc'),
(144, 140, 14, 5, 4, NULL, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'cde71689-3d22-4367-b60c-9bb7149d8fcf'),
(145, 140, 14, 5, 5, NULL, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'c8bbe052-7b84-4ef7-b46b-1cc9c298402e'),
(146, 140, 14, 5, 6, NULL, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '8600deb5-18ae-4697-bc3e-0434afdfeb94'),
(147, 140, 9, 4, 1, NULL, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '9e419a2b-a4e4-4c15-8792-8df5f16a56f3'),
(148, 140, 9, 4, 2, NULL, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '912d30a7-1961-4b0e-9fb1-3bb70156c7ab'),
(149, 140, 9, 4, 3, NULL, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '96d4c1c1-7d66-43c7-8fdd-a94e5f2e7d15'),
(150, 140, 9, 4, 4, NULL, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'ec3b60ea-613b-40c1-bbab-0b40c309e77a'),
(151, 140, 9, 4, 5, NULL, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '675d8ac8-3323-4640-acd4-3d73ea7dce0b'),
(152, 140, 9, 4, 6, NULL, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'd1a9130a-10a2-4f77-8acb-742654233b6a'),
(153, 140, 5, 3, 1, NULL, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '41af8112-73aa-4b4b-9ccc-439f52df7034'),
(154, 140, 5, 3, 2, NULL, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'ee6a67d2-6662-4c96-8d24-df8e5e75a9d1'),
(155, 140, 5, 3, 3, NULL, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '4783fc16-3a76-4b41-81d1-d8045b136a96'),
(156, 140, 5, 3, 4, NULL, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'e8b27751-63d1-4236-947b-594f75c0b204'),
(157, 140, 1, 1, 1, NULL, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'a7585949-a7d3-40c0-bd50-f9497c9a6eaa'),
(158, 140, 1, 1, 2, NULL, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '96456951-b88b-4488-9ebf-ecbbc02e1549'),
(159, 140, 1, 1, 3, NULL, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'fb1dc8e2-5fa4-4172-ac52-72488936582c'),
(160, 140, 1, 1, 4, NULL, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'ae8a7a3a-b755-46de-ab3d-f4fae1d1530b'),
(161, 140, 1, 1, 5, NULL, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'afa81064-5aaf-430c-9172-5f39d2b9cbc1'),
(162, 140, 1, 1, 6, NULL, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '0e214a5c-a63b-41df-af44-58b1550a6a44'),
(163, 140, 1, 1, 7, NULL, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '25ed93b3-e60e-4a27-8cfb-17b39106175e'),
(165, 164, 14, 5, 1, NULL, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '80c05f23-e840-46ed-adc2-ceb9deaf0bb0'),
(166, 164, 14, 5, 2, NULL, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '6ac4135a-a232-4bef-a9d0-a545542fe4b2'),
(167, 164, 14, 5, 3, NULL, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '35d87eef-71f3-4d30-a5ee-dc411d0c5205'),
(168, 164, 14, 5, 4, NULL, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'c3713e34-08ba-4bda-834d-3aa0e2e36277'),
(169, 164, 14, 5, 5, NULL, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'e25a43f9-5b5c-4f98-90a8-8b0293d0de42'),
(170, 164, 14, 5, 6, NULL, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '7de52d03-1e73-4c16-9177-6256b5473a22'),
(171, 164, 9, 4, 1, NULL, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '06e3b8f3-a062-4fab-b494-4fdb53c5d801'),
(172, 164, 9, 4, 2, NULL, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'd1554673-2b5c-4fc8-a937-a47587707862'),
(173, 164, 9, 4, 3, NULL, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '9c8c79af-abfa-40fc-a769-194aadbbaaa0'),
(174, 164, 9, 4, 4, NULL, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '08fe1372-d3ea-4e92-b012-f5eb07e04402'),
(175, 164, 9, 4, 5, NULL, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '2d01a596-1a5a-4403-81e4-48dc6d90e409'),
(176, 164, 9, 4, 6, NULL, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'a68c0aae-181a-4d61-a856-752cdbc0bf7a'),
(177, 164, 5, 3, 1, NULL, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'd3189a50-9714-4e21-bd6c-e011f0b6c58e'),
(178, 164, 5, 3, 2, NULL, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '8c94e1c0-7590-412a-965b-0466065251aa'),
(179, 164, 5, 3, 3, NULL, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '255fb17a-d3ff-4a9b-a4fb-5d505fc721d9'),
(180, 164, 5, 3, 4, NULL, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '138352db-2494-4c86-9a54-8ad4c9b66a75'),
(181, 164, 1, 1, 1, NULL, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '1ff75e16-a45c-4fb2-a5e9-e4b97acad649'),
(182, 164, 1, 1, 2, NULL, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'e85bd393-bedf-48e1-a930-c195f2dc2234'),
(183, 164, 1, 1, 3, NULL, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '4d03c398-d280-40e6-b0b9-a3f3f329ee52'),
(184, 164, 1, 1, 4, NULL, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '7d369aae-43e2-4d60-a681-898c79126d41'),
(185, 164, 1, 1, 5, NULL, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '4ea47414-eda5-4123-ba3f-b392cb6c9ff6'),
(186, 164, 1, 1, 6, NULL, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '037df600-0937-4e71-9d29-1387b62a0079'),
(187, 164, 1, 1, 7, NULL, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '4cbfa7a9-768c-4206-b56e-45d972e49348'),
(188, 2, 5, 3, 5, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '0ff89946-1f1e-402d-ab59-aec9579584ef'),
(190, 189, 14, 5, 1, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '794dc410-da46-496b-8bcb-b2d050126c31'),
(191, 189, 14, 5, 2, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'ec221b69-500c-4d5d-8151-effacf6f8994'),
(192, 189, 14, 5, 3, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '24110cac-d15c-41e4-a38c-fe36d34a24c6'),
(193, 189, 14, 5, 4, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '53f0875c-fc8d-4899-87e7-d1d8ad9e6f8d'),
(194, 189, 14, 5, 5, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'ea1e5ba8-1b5a-49e0-a124-bf9a40811bc8'),
(195, 189, 14, 5, 6, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '6f94d4b2-e43e-479f-9dc7-4ffb7fc6fd81'),
(196, 189, 9, 4, 1, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'fae49495-c769-49b1-99a0-3b26f32fa0e7'),
(197, 189, 9, 4, 2, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '115430ac-754b-469d-87e2-a89926239473'),
(198, 189, 9, 4, 3, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'aa75d11b-c0c4-4a4c-8a2b-094ad682802d'),
(199, 189, 9, 4, 4, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '15fd7d84-a4f7-484d-be76-5151ea992808'),
(200, 189, 9, 4, 5, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '0d2c6c0f-4034-48d3-8b77-a34b9ccb03d0'),
(201, 189, 9, 4, 6, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'f1d1ebfb-0824-4829-9ddb-6bd4dda6ff2d'),
(202, 189, 5, 3, 1, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '72d6fcc5-bf5f-4325-a713-74c06330a52f'),
(203, 189, 5, 3, 2, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '771fbeb3-611a-49ee-a4d0-47f317263da0'),
(204, 189, 5, 3, 3, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'afd4a338-e9f3-49d8-a978-f14d69b03921'),
(205, 189, 5, 3, 4, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '0f25476e-9dc8-416c-8002-565e5a23eafd'),
(206, 189, 5, 3, 5, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '7c1570c3-4084-44a0-9553-59bfb112d6a0'),
(207, 189, 1, 1, 1, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '009163c7-6dd2-475d-89ad-932d05611f1a'),
(208, 189, 1, 1, 2, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'c3e87fea-cb33-4828-97db-25078f6a0574'),
(209, 189, 1, 1, 3, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '05e9ba3a-c922-4dc2-8428-3a0b712b8f56'),
(210, 189, 1, 1, 4, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'cee96fb4-0d04-43ba-b835-91682ae019cf'),
(211, 189, 1, 1, 5, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'cd573631-9885-4b86-ab90-a581992f6108'),
(212, 189, 1, 1, 6, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'b29609d6-631e-4deb-bf61-77db26a15a51'),
(213, 189, 1, 1, 7, NULL, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'de538493-abfc-448c-8e90-179a5a33479c'),
(215, 214, 14, 5, 1, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '188359ac-0861-46dc-b1ff-223c506a2dcc'),
(216, 214, 14, 5, 2, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'b36f21be-1f7a-419c-a535-bc9c140f9ad5'),
(217, 214, 14, 5, 3, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'a41e8431-0c86-4539-b760-3f3e455f8a73'),
(218, 214, 14, 5, 4, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '314da11c-d073-47a3-88fc-825402cd1cac'),
(219, 214, 14, 5, 5, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '489eb84e-6037-4aa4-abc1-c7f8b7ddbc54'),
(220, 214, 14, 5, 6, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'fc43b2c9-23f4-494f-ad11-6b2728ad7809'),
(221, 214, 9, 4, 1, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '69c415f9-bec2-4949-a65c-aa8039cca499'),
(222, 214, 9, 4, 2, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '08d0dd6b-1cc2-4f34-a10f-fabea4233876'),
(223, 214, 9, 4, 3, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '9e8543cb-d12d-4946-a495-fe8628500a15'),
(224, 214, 9, 4, 4, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'fb62ba15-1b34-47b7-8fee-0a0e525ea165'),
(225, 214, 9, 4, 5, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'bf834f5e-3646-4e45-8739-dbd497493eec'),
(226, 214, 9, 4, 6, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'b1992acd-bb9a-4017-add4-3726d1079886'),
(227, 214, 5, 3, 1, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'bf9ddf91-b394-4ee3-baea-f75bc5e2c4cf'),
(228, 214, 5, 3, 2, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '4fedbf83-ead8-4c29-8ed3-93296c9c8ab7'),
(229, 214, 5, 3, 3, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'eedb7fe4-ab3f-4a67-8a89-9a22f2c6dcba'),
(230, 214, 5, 3, 4, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '76d4647c-14ab-4c59-85fc-8db2db406601'),
(231, 214, 5, 3, 5, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'de12ae48-256e-4a0b-beff-935bd9bae662'),
(232, 214, 1, 1, 1, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '79fc42e6-3b66-438a-8021-862ca129a917'),
(233, 214, 1, 1, 2, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '187a1d5d-65b2-4e2d-8776-d9fa088b2de8'),
(234, 214, 1, 1, 3, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '5423355d-0680-4b98-9d5d-1fcb569f3ee2'),
(235, 214, 1, 1, 4, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'e2f7c702-17f0-4e8e-afed-8eaaaf08c005'),
(236, 214, 1, 1, 5, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '43da0ee5-13fe-45d0-b79d-67c6e2243b40'),
(237, 214, 1, 1, 6, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '1657dd35-25f1-448d-9adb-646ff5e7e868'),
(238, 214, 1, 1, 7, NULL, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '66f58c5a-f699-4cd4-af61-5172b0827000'),
(240, 239, 14, 5, 1, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', 'd8509d15-6933-427a-a3c1-ee97dde2d11f'),
(241, 239, 14, 5, 2, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', 'c05b96dc-59a4-4535-bed7-bbc2d8cebee0'),
(242, 239, 14, 5, 3, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '1c410c3c-51ee-487f-b721-ad4b1a257232'),
(243, 239, 14, 5, 4, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', 'df803ac8-c2c6-41ee-9c78-665dd2fe5274'),
(244, 239, 14, 5, 5, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '1a80f6ec-ee20-4d82-80dc-2dc438028b83'),
(245, 239, 14, 5, 6, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '39009ebb-d841-461c-9786-9f44a2d4cd54'),
(246, 239, 9, 4, 1, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', 'd482ba93-312b-4c1c-a00d-125070538de2'),
(247, 239, 9, 4, 2, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', 'b2a8ae8f-b26f-444c-b6b5-590f5c6c5e37'),
(248, 239, 9, 4, 3, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '9359c8ff-5114-4243-aa38-85fd597e00a5'),
(249, 239, 9, 4, 4, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', 'd2770ff3-b596-4754-9f6e-45ed53d73017'),
(250, 239, 9, 4, 5, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', 'be7fd4d4-38ce-4a84-94c8-5375ae7552d7'),
(251, 239, 9, 4, 6, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '428a49a1-a356-464d-a5df-681504580407'),
(252, 239, 5, 3, 1, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', 'd475abe0-f99f-46b7-aab5-f426b19023a4'),
(253, 239, 5, 3, 2, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '854ade57-55a1-4f08-a8ec-9a728b803520'),
(254, 239, 5, 3, 3, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '578f67d8-910b-4b1e-be5f-1b853ce9c260'),
(255, 239, 5, 3, 4, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '06691523-c326-44e9-b4e4-6438be537b22'),
(256, 239, 5, 3, 5, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '466110b4-ec4f-4d56-8f0c-d30880df04b2'),
(257, 239, 1, 1, 1, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '8506b0f7-98e4-46d7-84ab-e81f0c5095c0'),
(258, 239, 1, 1, 2, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', 'a023074c-bfd4-4cec-b02b-dfc8118fe960'),
(259, 239, 1, 1, 3, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '2876bcb1-f611-440b-b9e4-bbc18f3407d9'),
(260, 239, 1, 1, 4, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', 'a0104cf3-46cd-4834-ae22-be171789c8d6'),
(261, 239, 1, 1, 5, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', 'a47ce3a2-772e-4722-a2b6-48964cbfe0eb'),
(262, 239, 1, 1, 6, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', 'daf9bbcd-6644-4e87-ba13-a422a71a0eea'),
(263, 239, 1, 1, 7, NULL, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '38a159a0-63b3-4a16-ac15-f87c0f04b4bf');

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

--
-- Dumping data for table `matrixblocktypes`
--

INSERT INTO `matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 2, 'Typography', 'typography', 1, '2021-06-20 02:44:10', '2021-06-20 07:10:41', 'b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4'),
(3, 5, 4, 'Links', 'links', 1, '2021-06-20 05:07:38', '2021-06-20 07:10:21', '6b9aed45-53ef-49c3-9bab-b3840d9b955b'),
(4, 9, 5, 'Buttons', 'buttons', 1, '2021-06-20 05:09:33', '2021-06-20 07:11:09', '3a002a99-2c41-49fe-9e39-060688231108'),
(5, 14, 6, 'Colors', 'colors', 1, '2021-06-20 05:18:32', '2021-06-20 07:10:52', '234dff92-509e-4671-a7e1-f2af941b4470');

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_buttons`
--

CREATE TABLE `matrixcontent_buttons` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_buttons_backgroundColor` text COLLATE utf8_unicode_ci,
  `field_buttons_padding` text COLLATE utf8_unicode_ci,
  `field_buttons_fontColor` text COLLATE utf8_unicode_ci,
  `field_buttons_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_buttons_buttonType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_buttons_border` text COLLATE utf8_unicode_ci,
  `field_buttons_borderRadius` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `matrixcontent_buttons`
--

INSERT INTO `matrixcontent_buttons` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_buttons_backgroundColor`, `field_buttons_padding`, `field_buttons_fontColor`, `field_buttons_state`, `field_buttons_buttonType`, `field_buttons_border`, `field_buttons_borderRadius`) VALUES
(1, 107, 1, '2021-06-20 14:50:25', '2021-06-20 16:28:32', 'f75afd5d-32c9-4bc8-9b93-682b97281cc4', '#004EB7', '0.75em 2.25em', '#FFF', 'normal', 'Primary Button', 'None', '0'),
(2, 108, 1, '2021-06-20 14:50:25', '2021-06-20 16:28:32', '74acd7ec-9cd1-446e-ab6e-e96a3ec6d88a', '#001C71', '0.75em 2.25em', '#FFF', 'focus', 'Primary Button', 'None', '0'),
(3, 109, 1, '2021-06-20 14:50:25', '2021-06-20 16:11:13', '31287d55-5065-4ab5-bf99-f42bec5badbe', '#001C71', '0.75em 2.25em', '#FFF', 'hover', 'Primary Button', NULL, NULL),
(4, 110, 1, '2021-06-20 14:50:25', '2021-06-20 16:28:32', '09a56521-452d-422e-b204-232c5c469444', '#001C71', '0.75em 2.25em', '#FFF', 'normal', 'Secondary Button', 'None', '0'),
(5, 111, 1, '2021-06-20 14:50:25', '2021-06-20 16:28:32', 'd1f1a171-e515-4b49-b088-7864757db504', '#008EEC', '0.75em 2.25em', '#FFF', 'hover', 'Secondary Button', 'None', '0'),
(6, 123, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '7f52eb7e-27a5-42d0-8f9b-9c91b4599384', '#004EB7', '0.75em 2.25em', '#FFF', 'normal', 'Primary button', NULL, NULL),
(7, 124, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'c93cb169-dc32-4d9f-937b-82a1b7bb5012', '#001C71', '0.75em 2.25em', '#FFF', 'focus', 'Primary button focus', NULL, NULL),
(8, 125, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'c9416704-ebff-4b79-9b05-a600fd222c66', '#001C71', '0.75em 2.25em', '#FFF', 'hover', 'Primary button hover', NULL, NULL),
(9, 126, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '60f5588e-c326-41ce-9551-d3fe38aef32b', '#001C71', '0.75em 2.25em', '#FFF', 'normal', 'Secondary button', NULL, NULL),
(10, 127, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'fd5fce0b-0e8b-478b-ab1b-1785520d3244', NULL, NULL, NULL, 'normal', NULL, NULL, NULL),
(11, 139, 1, '2021-06-20 14:51:24', '2021-06-20 16:28:32', '5d50f9c1-b046-44ee-98b1-56df520e4c82', '#008EEC', NULL, '#FFF', 'focus', 'Secondary Button', 'None', '0'),
(12, 147, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '67ff481c-1bf4-4bcf-b9e8-fe3cc47de215', '#004EB7', '0.75em 2.25em', '#FFF', 'normal', 'Primary button', NULL, NULL),
(13, 148, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'ab4e99e7-bfbc-4bf8-bd29-9f2498c21253', '#001C71', '0.75em 2.25em', '#FFF', 'focus', 'Primary button focus', NULL, NULL),
(14, 149, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'df7ca734-aa21-4387-9b03-0301ce414db7', '#001C71', '0.75em 2.25em', '#FFF', 'hover', 'Primary button hover', NULL, NULL),
(15, 150, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '29926849-23c7-43bc-bd45-4c8fdde92a16', '#001C71', '0.75em 2.25em', '#FFF', 'normal', 'Secondary button', NULL, NULL),
(16, 151, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'f9209d87-2aff-4aed-9b58-e4355f13c163', '#008EEC', '0.75em 2.25em', '#FFF', 'hover', 'Secondary button hover', NULL, NULL),
(17, 152, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '375e3072-2307-4442-8fe8-3c31aebb66a4', '#008EEC', NULL, '#FFF', 'focus', 'Secondary button focus', NULL, NULL),
(18, 171, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'd0f65710-406d-4476-a939-8dd6eec14127', '#004EB7', '0.75em 2.25em', '#FFF', 'normal', 'Primary button', NULL, NULL),
(19, 172, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '89f896bc-405e-48fa-91ff-bf6d5ebdf5b6', '#001C71', '0.75em 2.25em', '#FFF', 'focus', 'Primary button focus', NULL, NULL),
(20, 173, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '8d6f17a4-ee5c-4409-a540-e00722c11315', '#001C71', '0.75em 2.25em', '#FFF', 'hover', 'Primary button hover', NULL, NULL),
(21, 174, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '0c942ef8-0f7b-4ddc-bfc9-5909edd53704', '#001C71', '0.75em 2.25em', '#FFF', 'normal', 'Secondary button', NULL, NULL),
(22, 175, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '87e2a270-28ab-4370-b33d-f46ecc41ba62', '#008EEC', '0.75em 2.25em', '#FFF', 'hover', 'Secondary button hover', NULL, NULL),
(23, 176, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '2cdd76e9-48cb-4839-8d5e-6d560b1f95e1', '#008EEC', NULL, '#FFF', 'focus', 'Secondary button focus', NULL, NULL),
(24, 196, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '9100b54e-817b-45f3-b0f4-f91dbb7adc35', '#004EB7', '0.75em 2.25em', '#FFF', 'normal', 'Primary button', NULL, NULL),
(25, 197, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'b13f8abf-34cf-4b03-a11c-8eb1aef09358', '#001C71', '0.75em 2.25em', '#FFF', 'focus', 'Primary button focus', NULL, NULL),
(26, 198, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'd3a75ff3-af9a-4201-ac11-bf565294483c', '#001C71', '0.75em 2.25em', '#FFF', 'hover', 'Primary button hover', NULL, NULL),
(27, 199, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'abb17013-005c-4521-9e2e-3e5a77c92112', '#001C71', '0.75em 2.25em', '#FFF', 'normal', 'Secondary button', NULL, NULL),
(28, 200, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '26052b50-8a98-4254-a287-d3f18befe8d5', '#008EEC', '0.75em 2.25em', '#FFF', 'hover', 'Secondary button hover', NULL, NULL),
(29, 201, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '8279ec4b-0ea3-4edc-826a-571d75f68883', '#008EEC', NULL, '#FFF', 'focus', 'Secondary button focus', NULL, NULL),
(30, 221, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '2db2bc08-0377-42ec-a048-1d8f43570e97', '#004EB7', '0.75em 2.25em', '#FFF', 'normal', 'Primary Button', NULL, NULL),
(31, 222, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '504547ba-b8cb-4864-8ea7-adc85f321cbf', '#001C71', '0.75em 2.25em', '#FFF', 'focus', 'Primary Button', NULL, NULL),
(32, 223, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'cc359442-56a7-4e4a-ab42-ad1880b9ae19', '#001C71', '0.75em 2.25em', '#FFF', 'hover', 'Primary Button', NULL, NULL),
(33, 224, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '20b5b23c-8ae2-445d-97ef-93f11c3389b2', '#001C71', '0.75em 2.25em', '#FFF', 'normal', 'Secondary Button', NULL, NULL),
(34, 225, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '8b1c6d93-eedf-4d1f-8d31-c27f05f8609b', '#008EEC', '0.75em 2.25em', '#FFF', 'hover', 'Secondary Button', NULL, NULL),
(35, 226, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '2026ea86-9182-4f01-a834-169f77a3367d', '#008EEC', NULL, '#FFF', 'focus', 'Secondary Button', NULL, NULL),
(36, 246, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '2b580ae3-b77c-4cfa-a7f7-46712a8dfe14', '#004EB7', '0.75em 2.25em', '#FFF', 'normal', 'Primary Button', 'None', '0'),
(37, 247, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '0146e221-5b40-415a-b484-344ebb67468e', '#001C71', '0.75em 2.25em', '#FFF', 'focus', 'Primary Button', 'None', '0'),
(38, 248, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '14b0d0bd-29f4-4a69-81ab-6e9efb85ee0c', '#001C71', '0.75em 2.25em', '#FFF', 'hover', 'Primary Button', NULL, NULL),
(39, 249, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '5aa019ea-d5ee-497a-9d0e-be9011e18a3a', '#001C71', '0.75em 2.25em', '#FFF', 'normal', 'Secondary Button', 'None', '0'),
(40, 250, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', 'f7caec95-0508-4939-b1fb-8e008fd7f77b', '#008EEC', '0.75em 2.25em', '#FFF', 'hover', 'Secondary Button', 'None', '0'),
(41, 251, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', 'e5822261-ceb2-4af4-a32f-cb8b21dcfe9d', '#008EEC', NULL, '#FFF', 'focus', 'Secondary Button', 'None', '0');

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_colors`
--

CREATE TABLE `matrixcontent_colors` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_colors_hex` text COLLATE utf8_unicode_ci,
  `field_colors_variantName` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `matrixcontent_colors`
--

INSERT INTO `matrixcontent_colors` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_colors_hex`, `field_colors_variantName`) VALUES
(1, 8, 1, '2021-06-20 07:15:09', '2021-06-20 14:53:31', '24620ed8-5aa1-4f66-8246-7a5c663a2a0c', '#000', 'black'),
(2, 10, 1, '2021-06-20 07:15:09', '2021-06-20 07:15:09', '95fa6bec-ca05-4e55-977a-709fa94de832', '#000', 'Black'),
(3, 36, 1, '2021-06-20 08:24:33', '2021-06-20 08:24:33', 'b7b4289e-4c63-4fff-a66a-db7b07b15338', '#000', 'Black'),
(4, 44, 1, '2021-06-20 08:35:27', '2021-06-20 14:53:31', '2efd19c8-1ed4-442e-95ff-a61970dc0490', '#001C71', 'darkBlue'),
(5, 45, 1, '2021-06-20 08:35:27', '2021-06-20 14:50:25', '5840dd06-6c2c-4cb9-93b8-3f75e067f2cf', '#FFF', 'white'),
(6, 46, 1, '2021-06-20 08:35:27', '2021-06-20 14:50:25', 'fdfc00ed-2245-4e56-83d0-ab4d998dbaf7', '#F2F2F2', 'gray'),
(7, 47, 1, '2021-06-20 08:35:27', '2021-06-20 14:53:31', 'e06194a7-6d5f-4756-a02f-c376ede1c4d5', '#004EB7', 'blue'),
(8, 49, 1, '2021-06-20 08:35:27', '2021-06-20 08:35:27', '97d61f33-8877-4191-ba2c-092e7c030258', '#000', 'Black'),
(9, 50, 1, '2021-06-20 08:35:27', '2021-06-20 08:35:27', 'b9c3c712-29ec-451b-be18-18f9373d55b6', '#001C71', 'blue'),
(10, 51, 1, '2021-06-20 08:35:27', '2021-06-20 08:35:27', '0832e266-41f7-44a2-86f4-092db6c7859b', '#FFF', 'white'),
(11, 52, 1, '2021-06-20 08:35:27', '2021-06-20 08:35:27', 'bbc05685-3429-4e74-b6dd-f4f470c62e60', '#F2F2F2', 'gray'),
(12, 53, 1, '2021-06-20 08:35:27', '2021-06-20 08:35:27', 'dd7e4c37-ab82-40f4-8594-19ba1e0fdfd4', '#004EB7', 'darkBlue'),
(13, 57, 1, '2021-06-20 11:46:03', '2021-06-20 11:46:03', '4006dd3f-8685-43ac-859a-15a11b104dcf', '#000', 'Black'),
(14, 58, 1, '2021-06-20 11:46:03', '2021-06-20 11:46:03', '98aacc29-de99-41a8-aae2-bdd9a0c914b7', '#001C71', 'blue'),
(15, 59, 1, '2021-06-20 11:46:03', '2021-06-20 11:46:03', '29f1c158-9ed7-4eb2-aca0-22fa516fd6cf', '#FFF', 'white'),
(16, 60, 1, '2021-06-20 11:46:03', '2021-06-20 11:46:03', '70f43c73-b5ed-4c4c-92eb-abba7a0eaeff', '#F2F2F2', 'gray'),
(17, 61, 1, '2021-06-20 11:46:03', '2021-06-20 11:46:03', '64e53dd3-37ce-4354-8d3a-ef44e707bda3', '#004EB7', 'darkBlue'),
(18, 65, 1, '2021-06-20 11:56:09', '2021-06-20 11:56:09', '5af52367-37b8-4a49-a406-8e00d75c54ca', '#000', 'Black'),
(19, 66, 1, '2021-06-20 11:56:09', '2021-06-20 11:56:09', 'dd942046-d6b1-4aa2-93c1-6c0f4d341cff', '#001C71', 'blue'),
(20, 67, 1, '2021-06-20 11:56:09', '2021-06-20 11:56:09', '6bce7c82-93ed-42c3-8c88-ea3ad231252c', '#FFF', 'white'),
(21, 68, 1, '2021-06-20 11:56:09', '2021-06-20 11:56:09', 'fff26151-2bb1-40dc-9546-d8b2b63cb17e', '#F2F2F2', 'gray'),
(22, 69, 1, '2021-06-20 11:56:09', '2021-06-20 11:56:09', '9b54b7c4-4aa9-4b3b-b07e-1950ff0d8d81', '#004EB7', 'darkBlue'),
(23, 73, 1, '2021-06-20 11:57:08', '2021-06-20 11:57:08', '77b12f60-8bcb-424f-a55e-e32459d9d3ee', '#000', 'Black'),
(24, 74, 1, '2021-06-20 11:57:08', '2021-06-20 11:57:08', 'ad31047e-9ccf-44d4-9517-6bae472768d2', '#001C71', 'blue'),
(25, 75, 1, '2021-06-20 11:57:08', '2021-06-20 11:57:08', '64c62f74-2833-4a3d-af83-a209a99538f3', '#FFF', 'white'),
(26, 76, 1, '2021-06-20 11:57:08', '2021-06-20 11:57:08', '6fc970b3-6dc7-417a-b347-a52168375901', '#F2F2F2', 'gray'),
(27, 77, 1, '2021-06-20 11:57:08', '2021-06-20 11:57:08', '6d9b4986-ad20-43cb-aa71-850d711e4966', '#004EB7', 'darkBlue'),
(28, 81, 1, '2021-06-20 12:16:45', '2021-06-20 12:16:45', 'c9839e60-17d3-422d-b18c-95f5cee9819f', '#000', 'Black'),
(29, 82, 1, '2021-06-20 12:16:45', '2021-06-20 12:16:45', '7b429a78-e253-4978-aeb7-2fbbb163e497', '#001C71', 'blue'),
(30, 83, 1, '2021-06-20 12:16:45', '2021-06-20 12:16:45', 'db504971-e262-4a71-8577-2b64eb07c0c1', '#FFF', 'white'),
(31, 84, 1, '2021-06-20 12:16:45', '2021-06-20 12:16:45', '037e3286-3058-4596-b18a-675cd9829e56', '#F2F2F2', 'gray'),
(32, 85, 1, '2021-06-20 12:16:45', '2021-06-20 12:16:45', 'b7391ce0-c5a7-4714-a594-48b3d2260ba5', '#004EB7', 'darkBlue'),
(33, 94, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '8ae03e80-ac7f-4279-b24c-ab4bd5dbf36f', '#000', 'Black'),
(34, 95, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', 'b210f2fe-00c7-43cc-8afb-e7b89da9e0f1', '#001C71', 'blue'),
(35, 96, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', 'dd698dab-713b-4ded-bfa7-6ceaaf9c5be4', '#FFF', 'white'),
(36, 97, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '694c2d8f-30f6-42d2-9314-3e186766e9dc', '#F2F2F2', 'gray'),
(37, 98, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', 'af130128-31a8-4193-b56c-174bb205ccce', '#004EB7', 'darkBlue'),
(38, 106, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'cb7abd4c-6959-4b68-a0da-fae74680e8c3', '#008EEC', 'lightBlue'),
(39, 117, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '524c717b-0daa-4375-adce-95ff11cc1a9e', '#000', 'Black'),
(40, 118, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '70ba54b9-61c0-42b1-abc1-0806c019ee99', '#001C71', 'blue'),
(41, 119, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'f829e0f3-f813-4f68-ada1-521d961798d8', '#FFF', 'white'),
(42, 120, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '3241d4ce-5264-4b22-99c0-8857d626de53', '#F2F2F2', 'gray'),
(43, 121, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '0be3f828-ba31-4cbc-a4f3-a2ab1b4f4b1c', '#004EB7', 'darkBlue'),
(44, 122, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'bf3d1481-6b15-453d-ba56-ff45f10603fb', '#008EEC', 'lightBlue'),
(45, 141, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'd587db72-73da-4ebb-b4c4-e2a57706b1b1', '#000', 'Black'),
(46, 142, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '3e7cef78-bde5-491a-a983-e33f4a4e6921', '#001C71', 'blue'),
(47, 143, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'ca081868-1be0-4394-988a-351ea609024e', '#FFF', 'white'),
(48, 144, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'c8a4350f-6943-4121-aaed-65bbeecd8902', '#F2F2F2', 'gray'),
(49, 145, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '6701599e-b8b9-469b-bad7-790149dcf43e', '#004EB7', 'darkBlue'),
(50, 146, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'c45384f5-3f13-49ae-b3b0-2f0a3fd10c9d', '#008EEC', 'lightBlue'),
(51, 165, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'd2dcea8e-9ebb-41ac-8a4c-9244a4cc82e3', '#000', 'black'),
(52, 166, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '3dba55b2-7d40-49c4-acfa-7573a4817c85', '#001C71', 'darkBlue'),
(53, 167, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'd98273d4-a01b-4914-81e4-0ee19bd2c16a', '#FFF', 'white'),
(54, 168, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '272c9cd9-f808-4cb4-a62e-ed449d73ea94', '#F2F2F2', 'gray'),
(55, 169, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '5e80caef-2eba-49a5-9be0-0323f8209fee', '#004EB7', 'blue'),
(56, 170, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'ef160eae-6c41-4b16-aecd-0ec085a8e76c', '#008EEC', 'lightBlue'),
(57, 190, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'f9c7d0c9-e42c-4642-a4b5-67ee016ba994', '#000', 'black'),
(58, 191, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '1b032cb8-5d46-412a-8cf6-00457c4bf7d3', '#001C71', 'darkBlue'),
(59, 192, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '3bac84e5-37b4-4553-91f4-bd2e1a65b647', '#FFF', 'white'),
(60, 193, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'f4ce40c5-f2bc-46cb-b91d-93585faf53eb', '#F2F2F2', 'gray'),
(61, 194, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '0db98e78-4e3d-47d7-8206-ec55f7651c58', '#004EB7', 'blue'),
(62, 195, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'a43ec67b-6e7e-436f-a538-dde818595160', '#008EEC', 'lightBlue'),
(63, 215, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '960301d7-c88b-44c4-8470-c5064876dba5', '#000', 'black'),
(64, 216, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '01d053de-86fc-4031-94ac-19c667d02d7d', '#001C71', 'darkBlue'),
(65, 217, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'fc6dc076-49ed-4404-85b4-3212ef30ecfe', '#FFF', 'white'),
(66, 218, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '93385c37-d1e0-4583-ba7b-c88bb604168e', '#F2F2F2', 'gray'),
(67, 219, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '401de2f5-4f9e-4ecb-97c2-f382cbbe4473', '#004EB7', 'blue'),
(68, 220, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '4617d825-5091-4441-a7ec-7743a849ba62', '#008EEC', 'lightBlue'),
(69, 240, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '5d46d46c-b0b3-43ca-acd3-f5bef270ef78', '#000', 'black'),
(70, 241, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '9ff65a3a-6fbd-4196-a706-a1436d4d74e1', '#001C71', 'darkBlue'),
(71, 242, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '3545a034-38f9-481a-9ae0-a2e2108dabe6', '#FFF', 'white'),
(72, 243, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '7f9c5364-45bd-46ab-af05-a1b5f71b9c52', '#F2F2F2', 'gray'),
(73, 244, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '3313d744-34ef-41f1-ba98-cd52c2e37a93', '#004EB7', 'blue'),
(74, 245, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '8f00d4a5-bce0-492b-bb99-efa9e133c551', '#008EEC', 'lightBlue');

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_links`
--

CREATE TABLE `matrixcontent_links` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_links_fontColor` text COLLATE utf8_unicode_ci,
  `field_links_backgroundColor` text COLLATE utf8_unicode_ci,
  `field_links_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `matrixcontent_links`
--

INSERT INTO `matrixcontent_links` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_links_fontColor`, `field_links_backgroundColor`, `field_links_state`) VALUES
(1, 112, 1, '2021-06-20 14:50:25', '2021-06-20 15:01:42', 'c1fc2807-c499-4b3c-865f-d90ee3ce3995', '#004EB7', NULL, 'normal'),
(2, 113, 1, '2021-06-20 14:50:25', '2021-06-20 15:01:42', '384099a0-64de-461b-a62e-11fa2287b35d', '#001C71', NULL, 'hover'),
(3, 114, 1, '2021-06-20 14:50:25', '2021-06-20 15:01:42', 'c7fbcd03-5fb2-44c6-805c-9183cca16691', '#001C71', NULL, 'active'),
(4, 115, 1, '2021-06-20 14:50:25', '2021-06-20 15:01:42', '66bc4fbf-2252-4973-9605-03145c9bf827', '#001C71', NULL, 'focus'),
(5, 128, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '8972a502-2ff7-476c-a0f7-a5569dadaa0c', '#004EB7', NULL, 'normal'),
(6, 129, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'a8fbcb73-d913-4513-b6b7-69c450a671c8', '#001C71', NULL, 'hover'),
(7, 130, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '2daa96fd-ee84-4e18-b308-6cc5654649c8', '#001C71', NULL, 'active'),
(8, 131, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '7df270a0-c37f-4be4-a7e1-280c7df51bc0', '#001C71', NULL, 'focus'),
(9, 153, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '4976c1ab-b06e-4516-a862-aba153fcbf41', '#004EB7', NULL, 'normal'),
(10, 154, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '93aefd9c-d694-499f-b1f6-2704040512d9', '#001C71', NULL, 'hover'),
(11, 155, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '374a87d1-458c-4369-ad12-d5ec78fa93e0', '#001C71', NULL, 'active'),
(12, 156, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '9aa0cd01-c317-407d-8361-0799ddce7272', '#001C71', NULL, 'focus'),
(13, 177, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '84523b2e-0584-4699-a729-1d392d6beaae', '#004EB7', NULL, 'normal'),
(14, 178, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '8672eb8e-8fda-4661-b16d-37232cebede9', '#001C71', NULL, 'hover'),
(15, 179, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '5884412c-7735-40de-a24f-293198709706', '#001C71', NULL, 'active'),
(16, 180, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'a7d6b228-613d-42d2-99b8-4f4b3aaca9b0', '#001C71', NULL, 'focus'),
(17, 188, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '95415a16-dfc9-49bb-ad7c-bd8d7ca23149', '#001C71', NULL, 'visited'),
(18, 202, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '76f52bf0-fb52-4844-a370-ec6c45302657', '#004EB7', NULL, 'normal'),
(19, 203, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'bdcb057b-3b89-46b1-ae84-bf2c95260402', '#001C71', NULL, 'hover'),
(20, 204, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'a4c78a6d-b8c1-4694-a605-1489557be532', '#001C71', NULL, 'active'),
(21, 205, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'f4fc80bd-22a7-4e1f-a8d5-f708b4db918c', '#001C71', NULL, 'focus'),
(22, 206, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '8c7caa57-f676-4919-bd14-587b752fb6e9', '#001C71', NULL, 'visited'),
(23, 227, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '96d27f99-f709-4943-be89-07eb80223dd6', '#004EB7', NULL, 'normal'),
(24, 228, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '815eec57-7e5f-43b4-ae8c-6f16bbaedba2', '#001C71', NULL, 'hover'),
(25, 229, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '95a7417b-08b4-453a-b674-cb036ea79cfd', '#001C71', NULL, 'active'),
(26, 230, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '27eeeb23-afa9-4ea6-ac12-ce519f31b8f1', '#001C71', NULL, 'focus'),
(27, 231, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'acc2ab11-7068-4fea-bff5-2d22c1adbb6f', '#001C71', NULL, 'visited'),
(28, 252, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', 'd896c76b-5e5b-40f1-b2ff-9a3c12fee9fe', '#004EB7', NULL, 'normal'),
(29, 253, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '53d59eff-63e5-4a75-99b6-b7578c00ff60', '#001C71', NULL, 'hover'),
(30, 254, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '32c47e0d-3eb9-45cf-8000-32bfaad93978', '#001C71', NULL, 'active'),
(31, 255, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '481d4f78-f643-4c85-8eef-476061fb22a1', '#001C71', NULL, 'focus'),
(32, 256, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '4d1ca9ae-0ee3-4128-a643-726454795a59', '#001C71', NULL, 'visited');

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_typography`
--

CREATE TABLE `matrixcontent_typography` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_typography_element` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_typography_fontSizeDesktop` text COLLATE utf8_unicode_ci,
  `field_typography_fontFamily` text COLLATE utf8_unicode_ci,
  `field_typography_fontSizeMobile` text COLLATE utf8_unicode_ci,
  `field_typography_lineHeight` text COLLATE utf8_unicode_ci,
  `field_typography_fontWeight` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `matrixcontent_typography`
--

INSERT INTO `matrixcontent_typography` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_typography_element`, `field_typography_fontSizeDesktop`, `field_typography_fontFamily`, `field_typography_fontSizeMobile`, `field_typography_lineHeight`, `field_typography_fontWeight`) VALUES
(1, 12, 1, '2021-06-20 07:43:02', '2021-06-20 07:43:02', '66f4bb8f-6bbf-45b7-9ff4-b8270f7573da', 'h1', '23', NULL, NULL, NULL, NULL),
(2, 14, 1, '2021-06-20 07:43:02', '2021-06-20 07:43:02', 'b1c4413b-b99a-4e88-b8fb-95db67a34772', 'h1', '23', NULL, NULL, NULL, NULL),
(3, 15, 1, '2021-06-20 07:51:34', '2021-06-20 07:57:21', 'b3be3a0f-d041-4477-99ce-2395d732763d', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 16, 1, '2021-06-20 07:51:34', '2021-06-20 07:57:21', '0ee73209-30b9-4c99-97c8-9afcdf7fa940', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 17, 1, '2021-06-20 07:51:34', '2021-06-20 07:57:21', '765d06b5-5cc2-4332-9cc6-fbe293dc512e', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 18, 1, '2021-06-20 07:51:34', '2021-06-20 07:57:21', '5b1b6d1a-73fe-4963-932d-cad0d1189da1', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 20, 1, '2021-06-20 07:51:34', '2021-06-20 07:51:34', '28265313-4573-4283-8c08-59cd4ddf1ac1', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 21, 1, '2021-06-20 07:51:34', '2021-06-20 07:51:34', '7793624e-d4bf-4106-9bdf-27e4b5e5d482', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 22, 1, '2021-06-20 07:51:34', '2021-06-20 07:51:34', '26bd5559-7013-466b-975a-189ca7dc2793', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 23, 1, '2021-06-20 07:51:34', '2021-06-20 07:51:34', 'e0d57799-b55c-4ca1-b773-4c3d100846ab', NULL, NULL, NULL, NULL, NULL, NULL),
(11, 24, 1, '2021-06-20 07:57:21', '2021-06-20 14:35:03', '7bcb4b90-cf40-45e9-a5c4-e33e12556df6', 'h1', '6rem', 'Arial, Helvetica, sans-serif', '3.8rem', '1.1', '600'),
(12, 25, 1, '2021-06-20 07:57:21', '2021-06-20 07:57:21', 'f003f0c8-ea27-4616-9d41-bf5b54f70687', NULL, NULL, NULL, NULL, NULL, NULL),
(13, 26, 1, '2021-06-20 07:57:21', '2021-06-20 07:57:21', '20cc38ab-f304-41bf-91f0-f1936f722a05', NULL, NULL, NULL, NULL, NULL, NULL),
(14, 28, 1, '2021-06-20 07:57:21', '2021-06-20 07:57:21', '7121dd79-e834-4532-94bb-b79684461029', NULL, NULL, NULL, NULL, NULL, NULL),
(15, 29, 1, '2021-06-20 07:57:21', '2021-06-20 07:57:21', 'a9df7684-ea21-4e99-a512-9e7cb19e5e4d', NULL, NULL, NULL, NULL, NULL, NULL),
(16, 30, 1, '2021-06-20 07:57:21', '2021-06-20 07:57:21', '451c84e1-0790-49da-b5fd-025389bc273a', NULL, NULL, NULL, NULL, NULL, NULL),
(17, 31, 1, '2021-06-20 07:57:21', '2021-06-20 07:57:21', '7a024e8b-e44b-4fa6-b3a9-66c66b80cf71', NULL, NULL, NULL, NULL, NULL, NULL),
(18, 32, 1, '2021-06-20 07:57:21', '2021-06-20 07:57:21', 'cc1b6f0e-3365-42d5-82fb-f3f90e5cde55', 'h1', '23', NULL, NULL, NULL, NULL),
(19, 33, 1, '2021-06-20 07:57:21', '2021-06-20 07:57:21', 'c36a1d94-40dd-4cec-b9a3-f62da8bff0ec', NULL, NULL, NULL, NULL, NULL, NULL),
(20, 34, 1, '2021-06-20 07:57:21', '2021-06-20 07:57:21', '902b75ac-576c-44f5-9fec-a31027a5d197', NULL, NULL, NULL, NULL, NULL, NULL),
(21, 37, 1, '2021-06-20 08:24:33', '2021-06-20 08:24:33', '90e48d6c-6685-47d2-afee-d167c560aedc', NULL, NULL, NULL, NULL, NULL, NULL),
(22, 38, 1, '2021-06-20 08:24:33', '2021-06-20 08:24:33', '2a83229a-9193-4c5b-9a85-817ea6531716', NULL, NULL, NULL, NULL, NULL, NULL),
(23, 39, 1, '2021-06-20 08:24:33', '2021-06-20 08:24:33', '5e3b6841-aa59-4e1a-b5ba-e306340873f6', NULL, NULL, NULL, NULL, NULL, NULL),
(24, 40, 1, '2021-06-20 08:24:33', '2021-06-20 08:24:33', '896d3317-6df7-46d9-a8df-bba7b8e407d2', NULL, NULL, NULL, NULL, NULL, NULL),
(25, 41, 1, '2021-06-20 08:24:33', '2021-06-20 08:24:33', 'c0873541-d530-49c7-969c-0e2eaafae5ad', 'h1', '23', NULL, NULL, NULL, NULL),
(26, 42, 1, '2021-06-20 08:24:33', '2021-06-20 08:24:33', '0ea63a84-79df-4ae2-9687-0db2788c1427', NULL, NULL, NULL, NULL, NULL, NULL),
(27, 43, 1, '2021-06-20 08:24:33', '2021-06-20 08:24:33', 'ab251581-3b8f-4445-a120-54f625009ca4', NULL, NULL, NULL, NULL, NULL, NULL),
(28, 54, 1, '2021-06-20 08:35:27', '2021-06-20 08:35:27', '2027d7af-1c62-4ebd-a286-9ba5b448b92a', 'h1', '23', NULL, NULL, NULL, NULL),
(29, 55, 1, '2021-06-20 11:46:02', '2021-06-20 14:35:03', 'b6b99421-5a84-46e9-93a0-036d78da985a', 'paragraph', '2rem', 'Arial, Helvetica, sans-serif', '2rem', '1.4', '200'),
(30, 62, 1, '2021-06-20 11:46:03', '2021-06-20 11:46:03', 'd3d20759-1938-432f-8e57-78e567ee9e34', 'h1', '40rem', 'Helvetica', NULL, NULL, NULL),
(31, 63, 1, '2021-06-20 11:46:03', '2021-06-20 11:46:03', '330d745b-4eca-46c1-b19f-6f26da89fa99', 'paragraph', '1rem', 'Helvetica', NULL, NULL, NULL),
(32, 70, 1, '2021-06-20 11:56:09', '2021-06-20 11:56:09', '79eadb36-20fc-4d3e-ba29-a36be7107d0a', 'h1', '40rem', 'Helvetica', '32rem', '1.5', NULL),
(33, 71, 1, '2021-06-20 11:56:09', '2021-06-20 11:56:09', '838655f9-0611-4846-9e27-9ade4a7f6cc2', 'paragraph', '2rem', 'Helvetica', '2rem', '1.4', NULL),
(34, 78, 1, '2021-06-20 11:57:08', '2021-06-20 11:57:08', '1ea4b16d-c9b2-4119-a8a6-aafa63094df6', 'h1', '40rem', 'Helvetica', '32rem', '1.5', 'bold'),
(35, 79, 1, '2021-06-20 11:57:08', '2021-06-20 11:57:08', '8a909281-a371-4e12-91c4-eb8acf786ac0', 'paragraph', '2rem', 'Helvetica', '2rem', '1.4', 'normal'),
(36, 86, 1, '2021-06-20 12:16:45', '2021-06-20 12:16:45', 'eb481f49-c8c6-43a1-9a5e-22f1c6c3ad8e', 'h1', '6rem', 'Helvetica', '3.8rem', '1.1', 'bold'),
(37, 87, 1, '2021-06-20 12:16:45', '2021-06-20 12:16:45', '01e600ab-feac-459d-9a48-0ef3e99f8d3a', 'paragraph', '2rem', 'Helvetica', '2rem', '1.4', 'normal'),
(38, 88, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '2e52b4e4-8635-4c8d-8f21-91c9719804df', 'h2', '4rem', 'Arial, Helvetica, sans-serif', '4rem', '1.4', '600'),
(39, 89, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', 'df2bc8fb-76b2-4f0a-838a-d1835b28e42f', 'h3', '2.8rem', 'Arial, Helvetica, sans-serif', '3.5rem', '1.4', '600'),
(40, 90, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '764761f1-d09e-4bf1-b646-910f7ada9567', 'h4', '3rem', 'Arial, Helvetica, sans-serif', '3rem', '1.4', '600'),
(41, 91, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '94ce66cf-5527-4c20-b0e9-991c4dcd58d7', 'h5', '2.5rem', 'Arial, Helvetica, sans-serif', '2.5rem', '1.4', '600'),
(42, 92, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', 'ac01d6eb-1ca9-458a-ad0f-21a5c6cbb0d9', 'h6', '1.8rem', 'Arial, Helvetica, sans-serif', '2.4rem', '1.4', '600'),
(43, 99, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', 'b665fb0a-0bc8-4805-a41e-384266b6b160', 'h1', '6rem', 'Arial, Helvetica, sans-serif', '3.8rem', '1.1', '600'),
(44, 100, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', 'cf4a1aa2-3f99-4873-bf6d-aaae0c14c576', 'h2', '4rem', 'Arial, Helvetica, sans-serif', '4rem', '1.4', '600'),
(45, 101, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '789d7c47-75ae-49f0-bf4d-b040c3ccccc6', 'h3', '2.8rem', 'Arial, Helvetica, sans-serif', '3.5rem', '1.4', '600'),
(46, 102, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '01eaf191-66b8-49ed-bfd9-e14da77b98fb', 'h4', '3rem', 'Arial, Helvetica, sans-serif', '3rem', '1.4', '600'),
(47, 103, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', 'b6a1115f-ec3f-4eb0-a7ab-dfbe169ac8a6', 'h5', '2.5rem', 'Arial, Helvetica, sans-serif', '2.5rem', '1.4', '600'),
(48, 104, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', 'de3401cb-aace-4245-91e4-0903babbad57', 'h6', '1.8rem', 'Arial, Helvetica, sans-serif', '2.4rem', '1.4', '600'),
(49, 105, 1, '2021-06-20 14:35:03', '2021-06-20 14:35:03', '467409e7-cfc3-4338-993b-93aa44f6f515', 'paragraph', '2rem', 'Arial, Helvetica, sans-serif', '2rem', '1.4', '200'),
(50, 132, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'b98f4fbd-f002-45f5-bcdc-3b3936d70d32', 'h1', '6rem', 'Arial, Helvetica, sans-serif', '3.8rem', '1.1', '600'),
(51, 133, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'eafb4163-872a-434d-8381-3415de886eea', 'h2', '4rem', 'Arial, Helvetica, sans-serif', '4rem', '1.4', '600'),
(52, 134, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '0797efbf-28be-497e-80fa-f1250eefb8bb', 'h3', '2.8rem', 'Arial, Helvetica, sans-serif', '3.5rem', '1.4', '600'),
(53, 135, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '295aa0ef-e63e-4146-9133-d64633097cb5', 'h4', '3rem', 'Arial, Helvetica, sans-serif', '3rem', '1.4', '600'),
(54, 136, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '64ef7735-a1a1-4869-bde5-4562d790e1b8', 'h5', '2.5rem', 'Arial, Helvetica, sans-serif', '2.5rem', '1.4', '600'),
(55, 137, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', '930076fa-96d0-4e20-8f76-ee3e446c1e20', 'h6', '1.8rem', 'Arial, Helvetica, sans-serif', '2.4rem', '1.4', '600'),
(56, 138, 1, '2021-06-20 14:50:25', '2021-06-20 14:50:25', 'fcb10c9d-1edd-4beb-818d-47f79750d335', 'paragraph', '2rem', 'Arial, Helvetica, sans-serif', '2rem', '1.4', '200'),
(57, 157, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '5332de85-2b9c-4dec-aef1-f9cc59762a65', 'h1', '6rem', 'Arial, Helvetica, sans-serif', '3.8rem', '1.1', '600'),
(58, 158, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '2fb7ad14-74da-468c-9846-a081dc98cad1', 'h2', '4rem', 'Arial, Helvetica, sans-serif', '4rem', '1.4', '600'),
(59, 159, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'c6c232ad-c8c0-4207-a86e-6e75d1e0b9d3', 'h3', '2.8rem', 'Arial, Helvetica, sans-serif', '3.5rem', '1.4', '600'),
(60, 160, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'd37146fa-3da0-44c1-8fdb-0a35faaeb952', 'h4', '3rem', 'Arial, Helvetica, sans-serif', '3rem', '1.4', '600'),
(61, 161, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', '906815ce-d9a0-41bc-a54d-e80d84906752', 'h5', '2.5rem', 'Arial, Helvetica, sans-serif', '2.5rem', '1.4', '600'),
(62, 162, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'e4a68e81-0646-4fa3-9ebe-bd239d2ed985', 'h6', '1.8rem', 'Arial, Helvetica, sans-serif', '2.4rem', '1.4', '600'),
(63, 163, 1, '2021-06-20 14:51:25', '2021-06-20 14:51:25', 'a4e4e79c-afbe-4705-80c9-a3e6f1b43230', 'paragraph', '2rem', 'Arial, Helvetica, sans-serif', '2rem', '1.4', '200'),
(64, 181, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'f1013f90-f0c5-4656-a34c-4dca5c865cc5', 'h1', '6rem', 'Arial, Helvetica, sans-serif', '3.8rem', '1.1', '600'),
(65, 182, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'b74e04f9-c67e-4589-b972-fe6888180670', 'h2', '4rem', 'Arial, Helvetica, sans-serif', '4rem', '1.4', '600'),
(66, 183, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'a7c56a5a-f733-4973-8c2c-c2dfae6266fb', 'h3', '2.8rem', 'Arial, Helvetica, sans-serif', '3.5rem', '1.4', '600'),
(67, 184, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'ed88a904-c7f1-4a76-a6cf-f3c953c6f8a4', 'h4', '3rem', 'Arial, Helvetica, sans-serif', '3rem', '1.4', '600'),
(68, 185, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'f5b81da8-57c2-40ee-9f83-2c1ac8641eba', 'h5', '2.5rem', 'Arial, Helvetica, sans-serif', '2.5rem', '1.4', '600'),
(69, 186, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', 'c4016a01-1a1d-4bbc-8bf2-b01edf71b3f6', 'h6', '1.8rem', 'Arial, Helvetica, sans-serif', '2.4rem', '1.4', '600'),
(70, 187, 1, '2021-06-20 14:53:32', '2021-06-20 14:53:32', '9fca245d-bb91-4a78-8dea-7589f2b34c27', 'paragraph', '2rem', 'Arial, Helvetica, sans-serif', '2rem', '1.4', '200'),
(71, 207, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'd738b9db-2eac-469d-9ce3-1789056873ab', 'h1', '6rem', 'Arial, Helvetica, sans-serif', '3.8rem', '1.1', '600'),
(72, 208, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'c101d5ab-7728-4879-a36e-f50b714910e6', 'h2', '4rem', 'Arial, Helvetica, sans-serif', '4rem', '1.4', '600'),
(73, 209, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'f2868f83-b225-4f3f-80a4-aee1af6877a8', 'h3', '2.8rem', 'Arial, Helvetica, sans-serif', '3.5rem', '1.4', '600'),
(74, 210, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '47c2e9bd-443c-4f1f-acaa-ac14b6fa1d63', 'h4', '3rem', 'Arial, Helvetica, sans-serif', '3rem', '1.4', '600'),
(75, 211, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '2b6bb946-8c74-4b1f-bc22-d11224e0cc3c', 'h5', '2.5rem', 'Arial, Helvetica, sans-serif', '2.5rem', '1.4', '600'),
(76, 212, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', '7a381fcf-7291-4a6f-b3d1-f1a1dfd0a752', 'h6', '1.8rem', 'Arial, Helvetica, sans-serif', '2.4rem', '1.4', '600'),
(77, 213, 1, '2021-06-20 15:01:42', '2021-06-20 15:01:42', 'afb0c5c4-3d6b-49b3-8c5e-0f2f4c8a51b2', 'paragraph', '2rem', 'Arial, Helvetica, sans-serif', '2rem', '1.4', '200'),
(78, 232, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '150b312f-76be-4a13-8568-0312bdf126dd', 'h1', '6rem', 'Arial, Helvetica, sans-serif', '3.8rem', '1.1', '600'),
(79, 233, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'b2e3d092-86b5-4ef8-9e06-d2ea8f291507', 'h2', '4rem', 'Arial, Helvetica, sans-serif', '4rem', '1.4', '600'),
(80, 234, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '0176489d-6c96-4d28-8de6-85b7039a6df4', 'h3', '2.8rem', 'Arial, Helvetica, sans-serif', '3.5rem', '1.4', '600'),
(81, 235, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '5a7696ac-73bf-4b3d-b24e-016d156b5817', 'h4', '3rem', 'Arial, Helvetica, sans-serif', '3rem', '1.4', '600'),
(82, 236, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'b4d8e695-5797-4439-96fa-0993d4293c91', 'h5', '2.5rem', 'Arial, Helvetica, sans-serif', '2.5rem', '1.4', '600'),
(83, 237, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', '3dc86398-a86e-4c83-921d-0af066074c76', 'h6', '1.8rem', 'Arial, Helvetica, sans-serif', '2.4rem', '1.4', '600'),
(84, 238, 1, '2021-06-20 16:11:13', '2021-06-20 16:11:13', 'dffeff72-ac8b-472c-ae0b-bf3714ee5799', 'paragraph', '2rem', 'Arial, Helvetica, sans-serif', '2rem', '1.4', '200'),
(85, 257, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '5ef570ac-61e7-4797-8265-853590a3dfd0', 'h1', '6rem', 'Arial, Helvetica, sans-serif', '3.8rem', '1.1', '600'),
(86, 258, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '32d32b0f-7208-48bb-abe3-ec66358783b9', 'h2', '4rem', 'Arial, Helvetica, sans-serif', '4rem', '1.4', '600'),
(87, 259, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '9fce1ab0-6665-4ac2-9fe5-c226691531e2', 'h3', '2.8rem', 'Arial, Helvetica, sans-serif', '3.5rem', '1.4', '600'),
(88, 260, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '66a8d736-f3a4-44c8-b2b7-3a5e691056de', 'h4', '3rem', 'Arial, Helvetica, sans-serif', '3rem', '1.4', '600'),
(89, 261, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '7c4d148c-47eb-4863-8a28-ae8afe9a1b25', 'h5', '2.5rem', 'Arial, Helvetica, sans-serif', '2.5rem', '1.4', '600'),
(90, 262, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '29ca5dbd-bd0e-47ee-8879-1ad60bb23cde', 'h6', '1.8rem', 'Arial, Helvetica, sans-serif', '2.4rem', '1.4', '600'),
(91, 263, 1, '2021-06-20 16:28:32', '2021-06-20 16:28:32', '58f20129-ce8a-4240-ab25-54d10ed06b97', 'paragraph', '2rem', 'Arial, Helvetica, sans-serif', '2rem', '1.4', '200');

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
('dateModified', '1624205386'),
('email.fromEmail', '\"anuar@hey.com\"'),
('email.fromName', '\"CraftCMS - Gulp workflow\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.0.class', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.0.disabled', 'false'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.0.id', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.0.instructions', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.0.label', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.0.max', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.0.min', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.0.name', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.0.orientation', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.0.readonly', 'false'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.0.requirable', 'false'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.0.size', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.0.step', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.0.tip', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.0.title', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.0.warning', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.0.width', '100'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.1.fieldUid', '\"b5a47791-9697-440b-97de-1045d6e56906\"'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.1.instructions', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.1.label', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.1.required', 'false'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.1.tip', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.1.warning', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.1.width', '100'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.2.fieldUid', '\"8a09f4c0-7dec-4ea8-b167-1edb46ad117f\"'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.2.instructions', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.2.label', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.2.required', 'false'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.2.tip', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.2.warning', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.2.width', '100'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.3.fieldUid', '\"545cc5ba-6369-4d6d-82a0-4534459ea8ed\"'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.3.instructions', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.3.label', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.3.required', 'false'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.3.tip', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.3.warning', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.3.width', '100'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.4.fieldUid', '\"f315fa2c-faf1-4d0a-99a6-4675580793d5\"'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.4.instructions', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.4.label', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.4.required', 'false'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.4.tip', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.4.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.4.warning', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.elements.4.width', '100'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.name', '\"Content\"'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.fieldLayouts.76e5b3be-9593-4fae-8331-5dda09498daa.tabs.0.sortOrder', '1'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.handle', '\"styleGuide\"'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.hasTitleField', 'false'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.name', '\"Style Guide\"'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.section', '\"226862bd-49ad-4a42-b3f0-54913b81c86e\"'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.sortOrder', '1'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.titleTranslationKeyFormat', 'null'),
('entryTypes.b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2.titleTranslationMethod', '\"site\"'),
('fieldGroups.3de9f34b-4f3e-4e93-ac00-2031eee86068.name', '\"Common\"'),
('fieldGroups.6b83f33a-5c36-4d1a-bde3-463e90ce95d2.name', '\"Style Guide\"'),
('fields.545cc5ba-6369-4d6d-82a0-4534459ea8ed.contentColumnType', '\"string\"'),
('fields.545cc5ba-6369-4d6d-82a0-4534459ea8ed.fieldGroup', '\"6b83f33a-5c36-4d1a-bde3-463e90ce95d2\"'),
('fields.545cc5ba-6369-4d6d-82a0-4534459ea8ed.handle', '\"links\"'),
('fields.545cc5ba-6369-4d6d-82a0-4534459ea8ed.instructions', '\"\"'),
('fields.545cc5ba-6369-4d6d-82a0-4534459ea8ed.name', '\"Links\"'),
('fields.545cc5ba-6369-4d6d-82a0-4534459ea8ed.searchable', 'false'),
('fields.545cc5ba-6369-4d6d-82a0-4534459ea8ed.settings.contentTable', '\"{{%matrixcontent_links}}\"'),
('fields.545cc5ba-6369-4d6d-82a0-4534459ea8ed.settings.maxBlocks', '\"\"'),
('fields.545cc5ba-6369-4d6d-82a0-4534459ea8ed.settings.minBlocks', '\"\"'),
('fields.545cc5ba-6369-4d6d-82a0-4534459ea8ed.settings.propagationMethod', '\"all\"'),
('fields.545cc5ba-6369-4d6d-82a0-4534459ea8ed.translationKeyFormat', 'null'),
('fields.545cc5ba-6369-4d6d-82a0-4534459ea8ed.translationMethod', '\"site\"'),
('fields.545cc5ba-6369-4d6d-82a0-4534459ea8ed.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.8a09f4c0-7dec-4ea8-b167-1edb46ad117f.contentColumnType', '\"string\"'),
('fields.8a09f4c0-7dec-4ea8-b167-1edb46ad117f.fieldGroup', '\"6b83f33a-5c36-4d1a-bde3-463e90ce95d2\"'),
('fields.8a09f4c0-7dec-4ea8-b167-1edb46ad117f.handle', '\"buttons\"'),
('fields.8a09f4c0-7dec-4ea8-b167-1edb46ad117f.instructions', '\"\"'),
('fields.8a09f4c0-7dec-4ea8-b167-1edb46ad117f.name', '\"Buttons\"'),
('fields.8a09f4c0-7dec-4ea8-b167-1edb46ad117f.searchable', 'false'),
('fields.8a09f4c0-7dec-4ea8-b167-1edb46ad117f.settings.contentTable', '\"{{%matrixcontent_buttons}}\"'),
('fields.8a09f4c0-7dec-4ea8-b167-1edb46ad117f.settings.maxBlocks', '\"\"'),
('fields.8a09f4c0-7dec-4ea8-b167-1edb46ad117f.settings.minBlocks', '\"\"'),
('fields.8a09f4c0-7dec-4ea8-b167-1edb46ad117f.settings.propagationMethod', '\"all\"'),
('fields.8a09f4c0-7dec-4ea8-b167-1edb46ad117f.translationKeyFormat', 'null'),
('fields.8a09f4c0-7dec-4ea8-b167-1edb46ad117f.translationMethod', '\"site\"'),
('fields.8a09f4c0-7dec-4ea8-b167-1edb46ad117f.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.b5a47791-9697-440b-97de-1045d6e56906.contentColumnType', '\"string\"'),
('fields.b5a47791-9697-440b-97de-1045d6e56906.fieldGroup', '\"6b83f33a-5c36-4d1a-bde3-463e90ce95d2\"'),
('fields.b5a47791-9697-440b-97de-1045d6e56906.handle', '\"colors\"'),
('fields.b5a47791-9697-440b-97de-1045d6e56906.instructions', '\"\"'),
('fields.b5a47791-9697-440b-97de-1045d6e56906.name', '\"Colors\"'),
('fields.b5a47791-9697-440b-97de-1045d6e56906.searchable', 'false'),
('fields.b5a47791-9697-440b-97de-1045d6e56906.settings.contentTable', '\"{{%matrixcontent_colors}}\"'),
('fields.b5a47791-9697-440b-97de-1045d6e56906.settings.maxBlocks', '\"\"'),
('fields.b5a47791-9697-440b-97de-1045d6e56906.settings.minBlocks', '\"\"'),
('fields.b5a47791-9697-440b-97de-1045d6e56906.settings.propagationMethod', '\"all\"'),
('fields.b5a47791-9697-440b-97de-1045d6e56906.translationKeyFormat', 'null'),
('fields.b5a47791-9697-440b-97de-1045d6e56906.translationMethod', '\"site\"'),
('fields.b5a47791-9697-440b-97de-1045d6e56906.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.f315fa2c-faf1-4d0a-99a6-4675580793d5.contentColumnType', '\"string\"'),
('fields.f315fa2c-faf1-4d0a-99a6-4675580793d5.fieldGroup', '\"6b83f33a-5c36-4d1a-bde3-463e90ce95d2\"'),
('fields.f315fa2c-faf1-4d0a-99a6-4675580793d5.handle', '\"typography\"'),
('fields.f315fa2c-faf1-4d0a-99a6-4675580793d5.instructions', '\"\"'),
('fields.f315fa2c-faf1-4d0a-99a6-4675580793d5.name', '\"Typography\"'),
('fields.f315fa2c-faf1-4d0a-99a6-4675580793d5.searchable', 'false'),
('fields.f315fa2c-faf1-4d0a-99a6-4675580793d5.settings.contentTable', '\"{{%matrixcontent_typography}}\"'),
('fields.f315fa2c-faf1-4d0a-99a6-4675580793d5.settings.maxBlocks', '\"\"'),
('fields.f315fa2c-faf1-4d0a-99a6-4675580793d5.settings.minBlocks', '\"\"'),
('fields.f315fa2c-faf1-4d0a-99a6-4675580793d5.settings.propagationMethod', '\"all\"'),
('fields.f315fa2c-faf1-4d0a-99a6-4675580793d5.translationKeyFormat', 'null'),
('fields.f315fa2c-faf1-4d0a-99a6-4675580793d5.translationMethod', '\"site\"'),
('fields.f315fa2c-faf1-4d0a-99a6-4675580793d5.type', '\"craft\\\\fields\\\\Matrix\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.field', '\"b5a47791-9697-440b-97de-1045d6e56906\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fieldLayouts.a70ffbfe-9a3e-408e-b6d7-2b47bdd254bd.tabs.0.elements.0.fieldUid', '\"28016837-d7f2-4eb3-9cfd-4f04b3b18049\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fieldLayouts.a70ffbfe-9a3e-408e-b6d7-2b47bdd254bd.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fieldLayouts.a70ffbfe-9a3e-408e-b6d7-2b47bdd254bd.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fieldLayouts.a70ffbfe-9a3e-408e-b6d7-2b47bdd254bd.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fieldLayouts.a70ffbfe-9a3e-408e-b6d7-2b47bdd254bd.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fieldLayouts.a70ffbfe-9a3e-408e-b6d7-2b47bdd254bd.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fieldLayouts.a70ffbfe-9a3e-408e-b6d7-2b47bdd254bd.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fieldLayouts.a70ffbfe-9a3e-408e-b6d7-2b47bdd254bd.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fieldLayouts.a70ffbfe-9a3e-408e-b6d7-2b47bdd254bd.tabs.0.elements.1.fieldUid', '\"af79b58f-062d-46ec-9479-412768072903\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fieldLayouts.a70ffbfe-9a3e-408e-b6d7-2b47bdd254bd.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fieldLayouts.a70ffbfe-9a3e-408e-b6d7-2b47bdd254bd.tabs.0.elements.1.label', 'null'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fieldLayouts.a70ffbfe-9a3e-408e-b6d7-2b47bdd254bd.tabs.0.elements.1.required', 'false'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fieldLayouts.a70ffbfe-9a3e-408e-b6d7-2b47bdd254bd.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fieldLayouts.a70ffbfe-9a3e-408e-b6d7-2b47bdd254bd.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fieldLayouts.a70ffbfe-9a3e-408e-b6d7-2b47bdd254bd.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fieldLayouts.a70ffbfe-9a3e-408e-b6d7-2b47bdd254bd.tabs.0.elements.1.width', '100'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fieldLayouts.a70ffbfe-9a3e-408e-b6d7-2b47bdd254bd.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fieldLayouts.a70ffbfe-9a3e-408e-b6d7-2b47bdd254bd.tabs.0.sortOrder', '1'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.28016837-d7f2-4eb3-9cfd-4f04b3b18049.contentColumnType', '\"text\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.28016837-d7f2-4eb3-9cfd-4f04b3b18049.fieldGroup', 'null'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.28016837-d7f2-4eb3-9cfd-4f04b3b18049.handle', '\"hex\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.28016837-d7f2-4eb3-9cfd-4f04b3b18049.instructions', '\"\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.28016837-d7f2-4eb3-9cfd-4f04b3b18049.name', '\"Hex\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.28016837-d7f2-4eb3-9cfd-4f04b3b18049.searchable', 'false'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.28016837-d7f2-4eb3-9cfd-4f04b3b18049.settings.byteLimit', 'null'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.28016837-d7f2-4eb3-9cfd-4f04b3b18049.settings.charLimit', 'null'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.28016837-d7f2-4eb3-9cfd-4f04b3b18049.settings.code', '\"\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.28016837-d7f2-4eb3-9cfd-4f04b3b18049.settings.columnType', 'null'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.28016837-d7f2-4eb3-9cfd-4f04b3b18049.settings.initialRows', '\"4\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.28016837-d7f2-4eb3-9cfd-4f04b3b18049.settings.multiline', '\"\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.28016837-d7f2-4eb3-9cfd-4f04b3b18049.settings.placeholder', 'null'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.28016837-d7f2-4eb3-9cfd-4f04b3b18049.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.28016837-d7f2-4eb3-9cfd-4f04b3b18049.translationKeyFormat', 'null'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.28016837-d7f2-4eb3-9cfd-4f04b3b18049.translationMethod', '\"none\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.28016837-d7f2-4eb3-9cfd-4f04b3b18049.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.af79b58f-062d-46ec-9479-412768072903.contentColumnType', '\"text\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.af79b58f-062d-46ec-9479-412768072903.fieldGroup', 'null'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.af79b58f-062d-46ec-9479-412768072903.handle', '\"variantName\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.af79b58f-062d-46ec-9479-412768072903.instructions', '\"\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.af79b58f-062d-46ec-9479-412768072903.name', '\"Variant name\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.af79b58f-062d-46ec-9479-412768072903.searchable', 'false'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.af79b58f-062d-46ec-9479-412768072903.settings.byteLimit', 'null'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.af79b58f-062d-46ec-9479-412768072903.settings.charLimit', 'null'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.af79b58f-062d-46ec-9479-412768072903.settings.code', '\"\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.af79b58f-062d-46ec-9479-412768072903.settings.columnType', 'null'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.af79b58f-062d-46ec-9479-412768072903.settings.initialRows', '\"4\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.af79b58f-062d-46ec-9479-412768072903.settings.multiline', '\"\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.af79b58f-062d-46ec-9479-412768072903.settings.placeholder', 'null'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.af79b58f-062d-46ec-9479-412768072903.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.af79b58f-062d-46ec-9479-412768072903.translationKeyFormat', 'null'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.af79b58f-062d-46ec-9479-412768072903.translationMethod', '\"none\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.fields.af79b58f-062d-46ec-9479-412768072903.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.handle', '\"colors\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.name', '\"Colors\"'),
('matrixBlockTypes.234dff92-509e-4671-a7e1-f2af941b4470.sortOrder', '1'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.field', '\"8a09f4c0-7dec-4ea8-b167-1edb46ad117f\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.0.fieldUid', '\"209bd109-eb97-446d-a8aa-9452ca8b8787\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.0.width', '50'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.1.fieldUid', '\"c10813a5-7287-48d9-a893-c6d53dd647eb\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.1.label', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.1.required', 'false'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.1.width', '50'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.2.fieldUid', '\"8e48e8d5-cf72-4b79-baa7-b88991c5afe0\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.2.instructions', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.2.label', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.2.required', 'false'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.2.tip', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.2.warning', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.2.width', '25'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.3.fieldUid', '\"6b3359c4-2514-46f2-9309-9eedc1fe991a\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.3.instructions', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.3.label', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.3.required', 'false'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.3.tip', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.3.warning', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.3.width', '25'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.4.fieldUid', '\"6d9cf833-1758-43bc-a23d-d083ea9f09fe\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.4.instructions', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.4.label', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.4.required', 'false'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.4.tip', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.4.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.4.warning', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.4.width', '25'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.5.fieldUid', '\"e8bc3529-9459-48cd-83a1-e17256cccdc0\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.5.instructions', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.5.label', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.5.required', 'false'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.5.tip', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.5.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.5.warning', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.5.width', '100'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.6.fieldUid', '\"5c5c0143-c0f1-427b-a6d3-2d0013085a25\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.6.instructions', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.6.label', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.6.required', 'false'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.6.tip', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.6.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.6.warning', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.elements.6.width', '100'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fieldLayouts.3e9a6b10-4124-434e-965f-aed73cfcfe1a.tabs.0.sortOrder', '1'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.contentColumnType', '\"string\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.fieldGroup', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.handle', '\"state\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.instructions', '\"\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.name', '\"State\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.searchable', 'false'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.optgroups', 'true'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.options.0.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.options.0.__assoc__.0.1', '\"Normal\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.options.0.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.options.0.__assoc__.1.1', '\"normal\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.options.0.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.options.0.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.options.1.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.options.1.__assoc__.0.1', '\"Active\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.options.1.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.options.1.__assoc__.1.1', '\"active\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.options.1.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.options.1.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.options.2.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.options.2.__assoc__.0.1', '\"Hover\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.options.2.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.options.2.__assoc__.1.1', '\"hover\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.options.2.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.options.2.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.options.3.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.options.3.__assoc__.0.1', '\"Focus\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.options.3.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.options.3.__assoc__.1.1', '\"focus\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.options.3.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.settings.options.3.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.translationKeyFormat', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.translationMethod', '\"none\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.209bd109-eb97-446d-a8aa-9452ca8b8787.type', '\"craft\\\\fields\\\\Dropdown\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.5c5c0143-c0f1-427b-a6d3-2d0013085a25.contentColumnType', '\"text\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.5c5c0143-c0f1-427b-a6d3-2d0013085a25.fieldGroup', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.5c5c0143-c0f1-427b-a6d3-2d0013085a25.handle', '\"border\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.5c5c0143-c0f1-427b-a6d3-2d0013085a25.instructions', '\"\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.5c5c0143-c0f1-427b-a6d3-2d0013085a25.name', '\"Border (width, color and type)\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.5c5c0143-c0f1-427b-a6d3-2d0013085a25.searchable', 'false'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.5c5c0143-c0f1-427b-a6d3-2d0013085a25.settings.byteLimit', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.5c5c0143-c0f1-427b-a6d3-2d0013085a25.settings.charLimit', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.5c5c0143-c0f1-427b-a6d3-2d0013085a25.settings.code', '\"\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.5c5c0143-c0f1-427b-a6d3-2d0013085a25.settings.columnType', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.5c5c0143-c0f1-427b-a6d3-2d0013085a25.settings.initialRows', '\"4\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.5c5c0143-c0f1-427b-a6d3-2d0013085a25.settings.multiline', '\"\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.5c5c0143-c0f1-427b-a6d3-2d0013085a25.settings.placeholder', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.5c5c0143-c0f1-427b-a6d3-2d0013085a25.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.5c5c0143-c0f1-427b-a6d3-2d0013085a25.translationKeyFormat', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.5c5c0143-c0f1-427b-a6d3-2d0013085a25.translationMethod', '\"none\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.5c5c0143-c0f1-427b-a6d3-2d0013085a25.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6b3359c4-2514-46f2-9309-9eedc1fe991a.contentColumnType', '\"text\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6b3359c4-2514-46f2-9309-9eedc1fe991a.fieldGroup', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6b3359c4-2514-46f2-9309-9eedc1fe991a.handle', '\"backgroundColor\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6b3359c4-2514-46f2-9309-9eedc1fe991a.instructions', '\"\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6b3359c4-2514-46f2-9309-9eedc1fe991a.name', '\"Background Color\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6b3359c4-2514-46f2-9309-9eedc1fe991a.searchable', 'false'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6b3359c4-2514-46f2-9309-9eedc1fe991a.settings.byteLimit', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6b3359c4-2514-46f2-9309-9eedc1fe991a.settings.charLimit', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6b3359c4-2514-46f2-9309-9eedc1fe991a.settings.code', '\"\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6b3359c4-2514-46f2-9309-9eedc1fe991a.settings.columnType', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6b3359c4-2514-46f2-9309-9eedc1fe991a.settings.initialRows', '\"4\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6b3359c4-2514-46f2-9309-9eedc1fe991a.settings.multiline', '\"\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6b3359c4-2514-46f2-9309-9eedc1fe991a.settings.placeholder', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6b3359c4-2514-46f2-9309-9eedc1fe991a.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6b3359c4-2514-46f2-9309-9eedc1fe991a.translationKeyFormat', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6b3359c4-2514-46f2-9309-9eedc1fe991a.translationMethod', '\"none\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6b3359c4-2514-46f2-9309-9eedc1fe991a.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6d9cf833-1758-43bc-a23d-d083ea9f09fe.contentColumnType', '\"text\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6d9cf833-1758-43bc-a23d-d083ea9f09fe.fieldGroup', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6d9cf833-1758-43bc-a23d-d083ea9f09fe.handle', '\"padding\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6d9cf833-1758-43bc-a23d-d083ea9f09fe.instructions', '\"\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6d9cf833-1758-43bc-a23d-d083ea9f09fe.name', '\"Padding\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6d9cf833-1758-43bc-a23d-d083ea9f09fe.searchable', 'false'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6d9cf833-1758-43bc-a23d-d083ea9f09fe.settings.byteLimit', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6d9cf833-1758-43bc-a23d-d083ea9f09fe.settings.charLimit', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6d9cf833-1758-43bc-a23d-d083ea9f09fe.settings.code', '\"\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6d9cf833-1758-43bc-a23d-d083ea9f09fe.settings.columnType', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6d9cf833-1758-43bc-a23d-d083ea9f09fe.settings.initialRows', '\"4\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6d9cf833-1758-43bc-a23d-d083ea9f09fe.settings.multiline', '\"\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6d9cf833-1758-43bc-a23d-d083ea9f09fe.settings.placeholder', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6d9cf833-1758-43bc-a23d-d083ea9f09fe.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6d9cf833-1758-43bc-a23d-d083ea9f09fe.translationKeyFormat', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6d9cf833-1758-43bc-a23d-d083ea9f09fe.translationMethod', '\"none\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.6d9cf833-1758-43bc-a23d-d083ea9f09fe.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.8e48e8d5-cf72-4b79-baa7-b88991c5afe0.contentColumnType', '\"text\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.8e48e8d5-cf72-4b79-baa7-b88991c5afe0.fieldGroup', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.8e48e8d5-cf72-4b79-baa7-b88991c5afe0.handle', '\"fontColor\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.8e48e8d5-cf72-4b79-baa7-b88991c5afe0.instructions', '\"\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.8e48e8d5-cf72-4b79-baa7-b88991c5afe0.name', '\"Font Color\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.8e48e8d5-cf72-4b79-baa7-b88991c5afe0.searchable', 'false'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.8e48e8d5-cf72-4b79-baa7-b88991c5afe0.settings.byteLimit', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.8e48e8d5-cf72-4b79-baa7-b88991c5afe0.settings.charLimit', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.8e48e8d5-cf72-4b79-baa7-b88991c5afe0.settings.code', '\"\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.8e48e8d5-cf72-4b79-baa7-b88991c5afe0.settings.columnType', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.8e48e8d5-cf72-4b79-baa7-b88991c5afe0.settings.initialRows', '\"4\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.8e48e8d5-cf72-4b79-baa7-b88991c5afe0.settings.multiline', '\"\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.8e48e8d5-cf72-4b79-baa7-b88991c5afe0.settings.placeholder', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.8e48e8d5-cf72-4b79-baa7-b88991c5afe0.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.8e48e8d5-cf72-4b79-baa7-b88991c5afe0.translationKeyFormat', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.8e48e8d5-cf72-4b79-baa7-b88991c5afe0.translationMethod', '\"none\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.8e48e8d5-cf72-4b79-baa7-b88991c5afe0.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.c10813a5-7287-48d9-a893-c6d53dd647eb.contentColumnType', '\"string\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.c10813a5-7287-48d9-a893-c6d53dd647eb.fieldGroup', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.c10813a5-7287-48d9-a893-c6d53dd647eb.handle', '\"buttonType\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.c10813a5-7287-48d9-a893-c6d53dd647eb.instructions', '\"\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.c10813a5-7287-48d9-a893-c6d53dd647eb.name', '\"Button Type\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.c10813a5-7287-48d9-a893-c6d53dd647eb.searchable', 'false'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.c10813a5-7287-48d9-a893-c6d53dd647eb.settings.optgroups', 'true'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.c10813a5-7287-48d9-a893-c6d53dd647eb.settings.options.0.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.c10813a5-7287-48d9-a893-c6d53dd647eb.settings.options.0.__assoc__.0.1', '\"Primary button\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.c10813a5-7287-48d9-a893-c6d53dd647eb.settings.options.0.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.c10813a5-7287-48d9-a893-c6d53dd647eb.settings.options.0.__assoc__.1.1', '\"Primary Button\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.c10813a5-7287-48d9-a893-c6d53dd647eb.settings.options.0.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.c10813a5-7287-48d9-a893-c6d53dd647eb.settings.options.0.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.c10813a5-7287-48d9-a893-c6d53dd647eb.settings.options.1.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.c10813a5-7287-48d9-a893-c6d53dd647eb.settings.options.1.__assoc__.0.1', '\"Secondary button\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.c10813a5-7287-48d9-a893-c6d53dd647eb.settings.options.1.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.c10813a5-7287-48d9-a893-c6d53dd647eb.settings.options.1.__assoc__.1.1', '\"Secondary Button\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.c10813a5-7287-48d9-a893-c6d53dd647eb.settings.options.1.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.c10813a5-7287-48d9-a893-c6d53dd647eb.settings.options.1.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.c10813a5-7287-48d9-a893-c6d53dd647eb.translationKeyFormat', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.c10813a5-7287-48d9-a893-c6d53dd647eb.translationMethod', '\"none\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.c10813a5-7287-48d9-a893-c6d53dd647eb.type', '\"craft\\\\fields\\\\Dropdown\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.e8bc3529-9459-48cd-83a1-e17256cccdc0.contentColumnType', '\"text\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.e8bc3529-9459-48cd-83a1-e17256cccdc0.fieldGroup', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.e8bc3529-9459-48cd-83a1-e17256cccdc0.handle', '\"borderRadius\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.e8bc3529-9459-48cd-83a1-e17256cccdc0.instructions', '\"\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.e8bc3529-9459-48cd-83a1-e17256cccdc0.name', '\"Border Radius\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.e8bc3529-9459-48cd-83a1-e17256cccdc0.searchable', 'false'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.e8bc3529-9459-48cd-83a1-e17256cccdc0.settings.byteLimit', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.e8bc3529-9459-48cd-83a1-e17256cccdc0.settings.charLimit', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.e8bc3529-9459-48cd-83a1-e17256cccdc0.settings.code', '\"\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.e8bc3529-9459-48cd-83a1-e17256cccdc0.settings.columnType', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.e8bc3529-9459-48cd-83a1-e17256cccdc0.settings.initialRows', '\"4\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.e8bc3529-9459-48cd-83a1-e17256cccdc0.settings.multiline', '\"\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.e8bc3529-9459-48cd-83a1-e17256cccdc0.settings.placeholder', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.e8bc3529-9459-48cd-83a1-e17256cccdc0.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.e8bc3529-9459-48cd-83a1-e17256cccdc0.translationKeyFormat', 'null'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.e8bc3529-9459-48cd-83a1-e17256cccdc0.translationMethod', '\"none\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.fields.e8bc3529-9459-48cd-83a1-e17256cccdc0.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.handle', '\"buttons\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.name', '\"Buttons\"'),
('matrixBlockTypes.3a002a99-2c41-49fe-9e39-060688231108.sortOrder', '1'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.field', '\"545cc5ba-6369-4d6d-82a0-4534459ea8ed\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.elements.0.fieldUid', '\"b72516f8-0a20-475b-a1e8-e02b72f2e679\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.elements.1.fieldUid', '\"4d4253f8-e888-4874-879e-5a538ea7fefc\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.elements.1.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.elements.1.required', 'false'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.elements.1.width', '100'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.elements.2.fieldUid', '\"443921d4-34ec-439f-b3b7-3a9b608989f0\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.elements.2.instructions', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.elements.2.label', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.elements.2.required', 'false'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.elements.2.tip', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.elements.2.warning', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.elements.2.width', '100'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fieldLayouts.d2d9cb92-3e31-4dfb-8ef8-e62450923fec.tabs.0.sortOrder', '1'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.443921d4-34ec-439f-b3b7-3a9b608989f0.contentColumnType', '\"text\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.443921d4-34ec-439f-b3b7-3a9b608989f0.fieldGroup', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.443921d4-34ec-439f-b3b7-3a9b608989f0.handle', '\"backgroundColor\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.443921d4-34ec-439f-b3b7-3a9b608989f0.instructions', '\"\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.443921d4-34ec-439f-b3b7-3a9b608989f0.name', '\"Background Color\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.443921d4-34ec-439f-b3b7-3a9b608989f0.searchable', 'false'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.443921d4-34ec-439f-b3b7-3a9b608989f0.settings.byteLimit', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.443921d4-34ec-439f-b3b7-3a9b608989f0.settings.charLimit', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.443921d4-34ec-439f-b3b7-3a9b608989f0.settings.code', '\"\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.443921d4-34ec-439f-b3b7-3a9b608989f0.settings.columnType', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.443921d4-34ec-439f-b3b7-3a9b608989f0.settings.initialRows', '\"4\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.443921d4-34ec-439f-b3b7-3a9b608989f0.settings.multiline', '\"\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.443921d4-34ec-439f-b3b7-3a9b608989f0.settings.placeholder', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.443921d4-34ec-439f-b3b7-3a9b608989f0.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.443921d4-34ec-439f-b3b7-3a9b608989f0.translationKeyFormat', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.443921d4-34ec-439f-b3b7-3a9b608989f0.translationMethod', '\"none\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.443921d4-34ec-439f-b3b7-3a9b608989f0.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.4d4253f8-e888-4874-879e-5a538ea7fefc.contentColumnType', '\"text\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.4d4253f8-e888-4874-879e-5a538ea7fefc.fieldGroup', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.4d4253f8-e888-4874-879e-5a538ea7fefc.handle', '\"fontColor\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.4d4253f8-e888-4874-879e-5a538ea7fefc.instructions', '\"\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.4d4253f8-e888-4874-879e-5a538ea7fefc.name', '\"Font Color\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.4d4253f8-e888-4874-879e-5a538ea7fefc.searchable', 'false'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.4d4253f8-e888-4874-879e-5a538ea7fefc.settings.byteLimit', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.4d4253f8-e888-4874-879e-5a538ea7fefc.settings.charLimit', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.4d4253f8-e888-4874-879e-5a538ea7fefc.settings.code', '\"\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.4d4253f8-e888-4874-879e-5a538ea7fefc.settings.columnType', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.4d4253f8-e888-4874-879e-5a538ea7fefc.settings.initialRows', '\"4\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.4d4253f8-e888-4874-879e-5a538ea7fefc.settings.multiline', '\"\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.4d4253f8-e888-4874-879e-5a538ea7fefc.settings.placeholder', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.4d4253f8-e888-4874-879e-5a538ea7fefc.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.4d4253f8-e888-4874-879e-5a538ea7fefc.translationKeyFormat', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.4d4253f8-e888-4874-879e-5a538ea7fefc.translationMethod', '\"none\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.4d4253f8-e888-4874-879e-5a538ea7fefc.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.contentColumnType', '\"string\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.fieldGroup', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.handle', '\"state\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.instructions', '\"\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.name', '\"State\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.searchable', 'false'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.optgroups', 'true'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.0.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.0.__assoc__.0.1', '\"Normal\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.0.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.0.__assoc__.1.1', '\"normal\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.0.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.0.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.1.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.1.__assoc__.0.1', '\"Hover\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.1.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.1.__assoc__.1.1', '\"hover\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.1.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.1.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.2.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.2.__assoc__.0.1', '\"Focus\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.2.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.2.__assoc__.1.1', '\"focus\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.2.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.2.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.3.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.3.__assoc__.0.1', '\"Active\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.3.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.3.__assoc__.1.1', '\"active\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.3.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.3.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.4.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.4.__assoc__.0.1', '\"Visited\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.4.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.4.__assoc__.1.1', '\"visited\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.4.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.4.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.5.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.5.__assoc__.0.1', '\"\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.5.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.5.__assoc__.1.1', '\"\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.5.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.settings.options.5.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.translationKeyFormat', 'null'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.translationMethod', '\"none\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.fields.b72516f8-0a20-475b-a1e8-e02b72f2e679.type', '\"craft\\\\fields\\\\Dropdown\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.handle', '\"links\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.name', '\"Links\"'),
('matrixBlockTypes.6b9aed45-53ef-49c3-9bab-b3840d9b955b.sortOrder', '1'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.field', '\"f315fa2c-faf1-4d0a-99a6-4675580793d5\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.0.fieldUid', '\"ea5743bb-ab28-45ff-bdb9-38834e4a254a\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.0.width', '25'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.1.fieldUid', '\"06099193-0e6c-4791-87a6-26abed3cebd6\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.1.label', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.1.required', 'false'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.1.width', '25'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.2.fieldUid', '\"77864449-99ac-4316-a005-671eab591a1c\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.2.instructions', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.2.label', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.2.required', 'false'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.2.tip', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.2.warning', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.2.width', '25'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.3.fieldUid', '\"81325012-d0a8-43fc-a153-74dccf1059b8\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.3.instructions', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.3.label', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.3.required', 'false'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.3.tip', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.3.warning', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.3.width', '25'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.4.fieldUid', '\"5403b5b2-cfae-4c44-8405-d5d6c0f52bea\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.4.instructions', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.4.label', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.4.required', 'false'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.4.tip', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.4.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.4.warning', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.4.width', '50'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.5.fieldUid', '\"60dd8281-5aad-4f4c-847d-bece85650947\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.5.instructions', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.5.label', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.5.required', 'false'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.5.tip', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.5.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.5.warning', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.elements.5.width', '50'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fieldLayouts.f9472ea6-85d3-497d-8af2-0b84bd47fbdf.tabs.0.sortOrder', '1'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.06099193-0e6c-4791-87a6-26abed3cebd6.contentColumnType', '\"text\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.06099193-0e6c-4791-87a6-26abed3cebd6.fieldGroup', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.06099193-0e6c-4791-87a6-26abed3cebd6.handle', '\"fontSizeDesktop\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.06099193-0e6c-4791-87a6-26abed3cebd6.instructions', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.06099193-0e6c-4791-87a6-26abed3cebd6.name', '\"Font Size (desktop)\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.06099193-0e6c-4791-87a6-26abed3cebd6.searchable', 'false'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.06099193-0e6c-4791-87a6-26abed3cebd6.settings.byteLimit', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.06099193-0e6c-4791-87a6-26abed3cebd6.settings.charLimit', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.06099193-0e6c-4791-87a6-26abed3cebd6.settings.code', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.06099193-0e6c-4791-87a6-26abed3cebd6.settings.columnType', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.06099193-0e6c-4791-87a6-26abed3cebd6.settings.initialRows', '\"4\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.06099193-0e6c-4791-87a6-26abed3cebd6.settings.multiline', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.06099193-0e6c-4791-87a6-26abed3cebd6.settings.placeholder', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.06099193-0e6c-4791-87a6-26abed3cebd6.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.06099193-0e6c-4791-87a6-26abed3cebd6.translationKeyFormat', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.06099193-0e6c-4791-87a6-26abed3cebd6.translationMethod', '\"none\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.06099193-0e6c-4791-87a6-26abed3cebd6.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.5403b5b2-cfae-4c44-8405-d5d6c0f52bea.contentColumnType', '\"text\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.5403b5b2-cfae-4c44-8405-d5d6c0f52bea.fieldGroup', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.5403b5b2-cfae-4c44-8405-d5d6c0f52bea.handle', '\"fontWeight\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.5403b5b2-cfae-4c44-8405-d5d6c0f52bea.instructions', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.5403b5b2-cfae-4c44-8405-d5d6c0f52bea.name', '\"Font Weight\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.5403b5b2-cfae-4c44-8405-d5d6c0f52bea.searchable', 'false'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.5403b5b2-cfae-4c44-8405-d5d6c0f52bea.settings.byteLimit', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.5403b5b2-cfae-4c44-8405-d5d6c0f52bea.settings.charLimit', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.5403b5b2-cfae-4c44-8405-d5d6c0f52bea.settings.code', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.5403b5b2-cfae-4c44-8405-d5d6c0f52bea.settings.columnType', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.5403b5b2-cfae-4c44-8405-d5d6c0f52bea.settings.initialRows', '\"4\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.5403b5b2-cfae-4c44-8405-d5d6c0f52bea.settings.multiline', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.5403b5b2-cfae-4c44-8405-d5d6c0f52bea.settings.placeholder', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.5403b5b2-cfae-4c44-8405-d5d6c0f52bea.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.5403b5b2-cfae-4c44-8405-d5d6c0f52bea.translationKeyFormat', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.5403b5b2-cfae-4c44-8405-d5d6c0f52bea.translationMethod', '\"none\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.5403b5b2-cfae-4c44-8405-d5d6c0f52bea.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.60dd8281-5aad-4f4c-847d-bece85650947.contentColumnType', '\"text\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.60dd8281-5aad-4f4c-847d-bece85650947.fieldGroup', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.60dd8281-5aad-4f4c-847d-bece85650947.handle', '\"fontFamily\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.60dd8281-5aad-4f4c-847d-bece85650947.instructions', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.60dd8281-5aad-4f4c-847d-bece85650947.name', '\"Font Family\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.60dd8281-5aad-4f4c-847d-bece85650947.searchable', 'false'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.60dd8281-5aad-4f4c-847d-bece85650947.settings.byteLimit', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.60dd8281-5aad-4f4c-847d-bece85650947.settings.charLimit', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.60dd8281-5aad-4f4c-847d-bece85650947.settings.code', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.60dd8281-5aad-4f4c-847d-bece85650947.settings.columnType', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.60dd8281-5aad-4f4c-847d-bece85650947.settings.initialRows', '\"4\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.60dd8281-5aad-4f4c-847d-bece85650947.settings.multiline', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.60dd8281-5aad-4f4c-847d-bece85650947.settings.placeholder', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.60dd8281-5aad-4f4c-847d-bece85650947.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.60dd8281-5aad-4f4c-847d-bece85650947.translationKeyFormat', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.60dd8281-5aad-4f4c-847d-bece85650947.translationMethod', '\"none\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.60dd8281-5aad-4f4c-847d-bece85650947.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.77864449-99ac-4316-a005-671eab591a1c.contentColumnType', '\"text\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.77864449-99ac-4316-a005-671eab591a1c.fieldGroup', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.77864449-99ac-4316-a005-671eab591a1c.handle', '\"fontSizeMobile\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.77864449-99ac-4316-a005-671eab591a1c.instructions', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.77864449-99ac-4316-a005-671eab591a1c.name', '\"Font Size (mobile)\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.77864449-99ac-4316-a005-671eab591a1c.searchable', 'false'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.77864449-99ac-4316-a005-671eab591a1c.settings.byteLimit', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.77864449-99ac-4316-a005-671eab591a1c.settings.charLimit', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.77864449-99ac-4316-a005-671eab591a1c.settings.code', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.77864449-99ac-4316-a005-671eab591a1c.settings.columnType', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.77864449-99ac-4316-a005-671eab591a1c.settings.initialRows', '\"4\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.77864449-99ac-4316-a005-671eab591a1c.settings.multiline', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.77864449-99ac-4316-a005-671eab591a1c.settings.placeholder', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.77864449-99ac-4316-a005-671eab591a1c.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.77864449-99ac-4316-a005-671eab591a1c.translationKeyFormat', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.77864449-99ac-4316-a005-671eab591a1c.translationMethod', '\"none\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.77864449-99ac-4316-a005-671eab591a1c.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.81325012-d0a8-43fc-a153-74dccf1059b8.contentColumnType', '\"text\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.81325012-d0a8-43fc-a153-74dccf1059b8.fieldGroup', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.81325012-d0a8-43fc-a153-74dccf1059b8.handle', '\"lineHeight\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.81325012-d0a8-43fc-a153-74dccf1059b8.instructions', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.81325012-d0a8-43fc-a153-74dccf1059b8.name', '\"Line Height\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.81325012-d0a8-43fc-a153-74dccf1059b8.searchable', 'false'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.81325012-d0a8-43fc-a153-74dccf1059b8.settings.byteLimit', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.81325012-d0a8-43fc-a153-74dccf1059b8.settings.charLimit', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.81325012-d0a8-43fc-a153-74dccf1059b8.settings.code', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.81325012-d0a8-43fc-a153-74dccf1059b8.settings.columnType', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.81325012-d0a8-43fc-a153-74dccf1059b8.settings.initialRows', '\"4\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.81325012-d0a8-43fc-a153-74dccf1059b8.settings.multiline', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.81325012-d0a8-43fc-a153-74dccf1059b8.settings.placeholder', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.81325012-d0a8-43fc-a153-74dccf1059b8.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.81325012-d0a8-43fc-a153-74dccf1059b8.translationKeyFormat', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.81325012-d0a8-43fc-a153-74dccf1059b8.translationMethod', '\"none\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.81325012-d0a8-43fc-a153-74dccf1059b8.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.contentColumnType', '\"string\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.fieldGroup', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.handle', '\"element\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.instructions', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.name', '\"element\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.searchable', 'false'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.optgroups', 'true'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.0.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.0.__assoc__.0.1', '\"H1\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.0.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.0.__assoc__.1.1', '\"h1\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.0.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.0.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.1.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.1.__assoc__.0.1', '\"H2\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.1.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.1.__assoc__.1.1', '\"h2\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.1.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.1.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.2.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.2.__assoc__.0.1', '\"H3\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.2.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.2.__assoc__.1.1', '\"h3\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.2.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.2.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.3.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.3.__assoc__.0.1', '\"H4\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.3.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.3.__assoc__.1.1', '\"h4\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.3.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.3.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.4.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.4.__assoc__.0.1', '\"H5\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.4.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.4.__assoc__.1.1', '\"h5\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.4.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.4.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.5.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.5.__assoc__.0.1', '\"H6\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.5.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.5.__assoc__.1.1', '\"h6\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.5.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.5.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.6.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.6.__assoc__.0.1', '\"Paragraph (Normal)\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.6.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.6.__assoc__.1.1', '\"paragraph\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.6.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.6.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.7.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.7.__assoc__.0.1', '\"Paragraph (Small)\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.7.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.7.__assoc__.1.1', '\"paragraphSmall\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.7.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.7.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.8.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.8.__assoc__.0.1', '\"Paragraph (Medium)\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.8.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.8.__assoc__.1.1', '\"paragraphMedium\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.8.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.8.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.9.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.9.__assoc__.0.1', '\"Paragraph (Big)\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.9.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.9.__assoc__.1.1', '\"paragraphBig\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.9.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.settings.options.9.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.translationKeyFormat', 'null'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.translationMethod', '\"none\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.fields.ea5743bb-ab28-45ff-bdb9-38834e4a254a.type', '\"craft\\\\fields\\\\Dropdown\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.handle', '\"typography\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.name', '\"Typography\"'),
('matrixBlockTypes.b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4.sortOrder', '1'),
('sections.226862bd-49ad-4a42-b3f0-54913b81c86e.enableVersioning', 'true'),
('sections.226862bd-49ad-4a42-b3f0-54913b81c86e.handle', '\"styleGuide\"'),
('sections.226862bd-49ad-4a42-b3f0-54913b81c86e.name', '\"Style Guide\"'),
('sections.226862bd-49ad-4a42-b3f0-54913b81c86e.propagationMethod', '\"all\"'),
('sections.226862bd-49ad-4a42-b3f0-54913b81c86e.siteSettings.df5f6408-413c-4f1d-bbd3-057c41b0e8b4.enabledByDefault', 'true'),
('sections.226862bd-49ad-4a42-b3f0-54913b81c86e.siteSettings.df5f6408-413c-4f1d-bbd3-057c41b0e8b4.hasUrls', 'true'),
('sections.226862bd-49ad-4a42-b3f0-54913b81c86e.siteSettings.df5f6408-413c-4f1d-bbd3-057c41b0e8b4.template', '\"templates/style-guide\"'),
('sections.226862bd-49ad-4a42-b3f0-54913b81c86e.siteSettings.df5f6408-413c-4f1d-bbd3-057c41b0e8b4.uriFormat', '\"style-guide\"'),
('sections.226862bd-49ad-4a42-b3f0-54913b81c86e.type', '\"single\"'),
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
('06099193-0e6c-4791-87a6-26abed3cebd6', 'Font Size (desktop)'),
('151a73fb-3012-404c-97df-d3f92d859799', 'Variant name'),
('17f48d33-fc5e-4ff6-86a7-cb2706abcfaf', 'Background Color'),
('209bd109-eb97-446d-a8aa-9452ca8b8787', 'State'),
('226862bd-49ad-4a42-b3f0-54913b81c86e', 'Style Guide'),
('234dff92-509e-4671-a7e1-f2af941b4470', 'Colors'),
('28016837-d7f2-4eb3-9cfd-4f04b3b18049', 'Hex'),
('361fa5dd-1d9f-4ffc-8c8c-fbe55aad2a90', 'Background Color'),
('3a002a99-2c41-49fe-9e39-060688231108', 'Buttons'),
('3de9f34b-4f3e-4e93-ac00-2031eee86068', 'Common'),
('443921d4-34ec-439f-b3b7-3a9b608989f0', 'Background Color'),
('4d4253f8-e888-4874-879e-5a538ea7fefc', 'Font Color'),
('5403b5b2-cfae-4c44-8405-d5d6c0f52bea', 'Font Weight'),
('545cc5ba-6369-4d6d-82a0-4534459ea8ed', 'Links'),
('54ebf06a-88e5-4bc7-987e-b4d95c73205b', 'Font Color'),
('59d66601-51b7-4d9f-aaae-22210e3d20f4', 'Font Color'),
('5c5c0143-c0f1-427b-a6d3-2d0013085a25', 'Border (width, color and type)'),
('60dd8281-5aad-4f4c-847d-bece85650947', 'Font Family'),
('6b3359c4-2514-46f2-9309-9eedc1fe991a', 'Background Color'),
('6b83f33a-5c36-4d1a-bde3-463e90ce95d2', 'Style Guide'),
('6b9aed45-53ef-49c3-9bab-b3840d9b955b', 'Links'),
('6d9cf833-1758-43bc-a23d-d083ea9f09fe', 'Padding'),
('735b3b14-2f7e-49b4-9c25-9cf4bb942d45', 'test'),
('77864449-99ac-4316-a005-671eab591a1c', 'Font Size (mobile)'),
('7efafbd6-4ed1-4d32-a4aa-001822bdc69c', 'Border Color'),
('81325012-d0a8-43fc-a153-74dccf1059b8', 'Line Height'),
('854cbf0e-201b-4cea-add5-0a96aec7ac41', 'Padding'),
('86c5a9ea-0052-483f-ae19-4eea6a5a895e', 'Border Radious'),
('8a09f4c0-7dec-4ea8-b167-1edb46ad117f', 'Buttons'),
('8e48e8d5-cf72-4b79-baa7-b88991c5afe0', 'Font Color'),
('973b5ad7-e02b-4a48-8a4d-6a27ad207b38', 'State'),
('a39cbc0a-4889-4c0c-b4ad-ac304421b5e4', 'CraftCMS - Gulp workflow'),
('af79b58f-062d-46ec-9479-412768072903', 'Variant name'),
('b2c9e781-0b2d-4d81-88e6-0a94a78f7ed2', 'Style Guide'),
('b5a47791-9697-440b-97de-1045d6e56906', 'Colors'),
('b6f168c4-d1fb-40d3-92d4-b2f8a1545dc4', 'Typography'),
('b72516f8-0a20-475b-a1e8-e02b72f2e679', 'State'),
('c10813a5-7287-48d9-a893-c6d53dd647eb', 'Button Type'),
('d2fd1cd3-4bdc-48aa-9bc2-5cf70c85fc75', 'Hex'),
('df5f6408-413c-4f1d-bbd3-057c41b0e8b4', 'CraftCMS - Gulp workflow'),
('e5f5b17f-2f3f-421f-8207-1bd247d0f756', 'State'),
('e8bc3529-9459-48cd-83a1-e17256cccdc0', 'Border Radius'),
('ea5743bb-ab28-45ff-bdb9-38834e4a254a', 'element'),
('f315fa2c-faf1-4d0a-99a6-4675580793d5', 'Typography');

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
('458c083e', '@craft/web/assets/routes/dist'),
('49cc6ff0', '@craft/web/assets/matrixsettings/dist'),
('56068c9c', '@craft/web/assets/dashboard/dist'),
('5ce92734', '@lib/element-resize-detector'),
('62f67bbc', '@lib/velocity'),
('73798cc1', '@bower/jquery/dist'),
('76a04e9c', '@craft/web/assets/editentry/dist'),
('7ed1d454', '@lib/jquery.payment'),
('89462374', '@craft/web/assets/recententries/dist'),
('9e3e813d', '@lib/timepicker'),
('a0fee35d', '@craft/web/assets/installer/dist'),
('a1c1d948', '@lib/xregexp'),
('a4f988f6', '@craft/web/assets/pluginstore/dist'),
('abad9dc2', '@lib/selectize'),
('ad82b88b', '@craft/web/assets/cp/dist'),
('b630325', '@lib/vue'),
('b7fc611a', '@craft/web/assets/updateswidget/dist'),
('babf4243', '@craft/web/assets/fieldsettings/dist'),
('c2cb8791', '@lib/garnishjs'),
('d7489a42', '@craft/web/assets/fields/dist'),
('d78d53af', '@lib/fabric'),
('de666297', '@craft/web/assets/admintable/dist'),
('e73bb1b8', '@lib/fileupload'),
('eb988eaf', '@lib/iframe-resizer'),
('f1769017', '@lib/d3'),
('f8778c84', '@lib/jquery-touch-events'),
('ff5a2837', '@craft/web/assets/tablesettings/dist'),
('ffab5438', '@craft/web/assets/matrix/dist'),
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

--
-- Dumping data for table `revisions`
--

INSERT INTO `revisions` (`id`, `sourceId`, `creatorId`, `num`, `notes`) VALUES
(1, 2, 1, 1, NULL),
(2, 2, 1, 2, NULL),
(3, 2, 1, 3, NULL),
(4, 2, 1, 4, NULL),
(5, 2, 1, 5, NULL),
(6, 2, 1, 6, ''),
(7, 2, 1, 7, NULL),
(8, 2, 1, 8, ''),
(9, 2, 1, 9, ''),
(10, 2, 1, 10, ''),
(11, 2, 1, 11, NULL),
(12, 2, 1, 12, ''),
(13, 2, 1, 13, ''),
(14, 2, 1, 14, ''),
(15, 2, 1, 15, ''),
(16, 2, 1, 16, ''),
(17, 2, 1, 17, ''),
(18, 2, 1, 18, ''),
(19, 2, 1, 19, ''),
(20, 2, 1, 20, ''),
(21, 2, 1, 21, ''),
(22, 2, 1, 22, ''),
(23, 2, 1, 23, '');

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
(1, 'slug', 0, 1, ''),
(2, 'slug', 0, 1, ' style guide '),
(2, 'title', 0, 1, ' style guide '),
(8, 'slug', 0, 1, ''),
(10, 'slug', 0, 1, ''),
(12, 'slug', 0, 1, ''),
(14, 'slug', 0, 1, ''),
(15, 'slug', 0, 1, ''),
(16, 'slug', 0, 1, ''),
(17, 'slug', 0, 1, ''),
(18, 'slug', 0, 1, ''),
(20, 'slug', 0, 1, ''),
(21, 'slug', 0, 1, ''),
(22, 'slug', 0, 1, ''),
(23, 'slug', 0, 1, ''),
(24, 'slug', 0, 1, ''),
(25, 'slug', 0, 1, ''),
(26, 'slug', 0, 1, ''),
(28, 'slug', 0, 1, ''),
(29, 'slug', 0, 1, ''),
(30, 'slug', 0, 1, ''),
(31, 'slug', 0, 1, ''),
(32, 'slug', 0, 1, ''),
(33, 'slug', 0, 1, ''),
(34, 'slug', 0, 1, ''),
(36, 'slug', 0, 1, ''),
(37, 'slug', 0, 1, ''),
(38, 'slug', 0, 1, ''),
(39, 'slug', 0, 1, ''),
(40, 'slug', 0, 1, ''),
(41, 'slug', 0, 1, ''),
(42, 'slug', 0, 1, ''),
(43, 'slug', 0, 1, ''),
(44, 'slug', 0, 1, ''),
(45, 'slug', 0, 1, ''),
(46, 'slug', 0, 1, ''),
(47, 'slug', 0, 1, ''),
(49, 'slug', 0, 1, ''),
(50, 'slug', 0, 1, ''),
(51, 'slug', 0, 1, ''),
(52, 'slug', 0, 1, ''),
(53, 'slug', 0, 1, ''),
(54, 'slug', 0, 1, ''),
(55, 'slug', 0, 1, ''),
(57, 'slug', 0, 1, ''),
(58, 'slug', 0, 1, ''),
(59, 'slug', 0, 1, ''),
(60, 'slug', 0, 1, ''),
(61, 'slug', 0, 1, ''),
(62, 'slug', 0, 1, ''),
(63, 'slug', 0, 1, ''),
(65, 'slug', 0, 1, ''),
(66, 'slug', 0, 1, ''),
(67, 'slug', 0, 1, ''),
(68, 'slug', 0, 1, ''),
(69, 'slug', 0, 1, ''),
(70, 'slug', 0, 1, ''),
(71, 'slug', 0, 1, ''),
(73, 'slug', 0, 1, ''),
(74, 'slug', 0, 1, ''),
(75, 'slug', 0, 1, ''),
(76, 'slug', 0, 1, ''),
(77, 'slug', 0, 1, ''),
(78, 'slug', 0, 1, ''),
(79, 'slug', 0, 1, ''),
(81, 'slug', 0, 1, ''),
(82, 'slug', 0, 1, ''),
(83, 'slug', 0, 1, ''),
(84, 'slug', 0, 1, ''),
(85, 'slug', 0, 1, ''),
(86, 'slug', 0, 1, ''),
(87, 'slug', 0, 1, ''),
(88, 'slug', 0, 1, ''),
(89, 'slug', 0, 1, ''),
(90, 'slug', 0, 1, ''),
(91, 'slug', 0, 1, ''),
(92, 'slug', 0, 1, ''),
(94, 'slug', 0, 1, ''),
(95, 'slug', 0, 1, ''),
(96, 'slug', 0, 1, ''),
(97, 'slug', 0, 1, ''),
(98, 'slug', 0, 1, ''),
(99, 'slug', 0, 1, ''),
(100, 'slug', 0, 1, ''),
(101, 'slug', 0, 1, ''),
(102, 'slug', 0, 1, ''),
(103, 'slug', 0, 1, ''),
(104, 'slug', 0, 1, ''),
(105, 'slug', 0, 1, ''),
(106, 'slug', 0, 1, ''),
(107, 'slug', 0, 1, ''),
(108, 'slug', 0, 1, ''),
(109, 'slug', 0, 1, ''),
(110, 'slug', 0, 1, ''),
(111, 'slug', 0, 1, ''),
(112, 'slug', 0, 1, ''),
(113, 'slug', 0, 1, ''),
(114, 'slug', 0, 1, ''),
(115, 'slug', 0, 1, ''),
(117, 'slug', 0, 1, ''),
(118, 'slug', 0, 1, ''),
(119, 'slug', 0, 1, ''),
(120, 'slug', 0, 1, ''),
(121, 'slug', 0, 1, ''),
(122, 'slug', 0, 1, ''),
(123, 'slug', 0, 1, ''),
(124, 'slug', 0, 1, ''),
(125, 'slug', 0, 1, ''),
(126, 'slug', 0, 1, ''),
(127, 'slug', 0, 1, ''),
(128, 'slug', 0, 1, ''),
(129, 'slug', 0, 1, ''),
(130, 'slug', 0, 1, ''),
(131, 'slug', 0, 1, ''),
(132, 'slug', 0, 1, ''),
(133, 'slug', 0, 1, ''),
(134, 'slug', 0, 1, ''),
(135, 'slug', 0, 1, ''),
(136, 'slug', 0, 1, ''),
(137, 'slug', 0, 1, ''),
(138, 'slug', 0, 1, ''),
(139, 'slug', 0, 1, ''),
(141, 'slug', 0, 1, ''),
(142, 'slug', 0, 1, ''),
(143, 'slug', 0, 1, ''),
(144, 'slug', 0, 1, ''),
(145, 'slug', 0, 1, ''),
(146, 'slug', 0, 1, ''),
(147, 'slug', 0, 1, ''),
(148, 'slug', 0, 1, ''),
(149, 'slug', 0, 1, ''),
(150, 'slug', 0, 1, ''),
(151, 'slug', 0, 1, ''),
(152, 'slug', 0, 1, ''),
(153, 'slug', 0, 1, ''),
(154, 'slug', 0, 1, ''),
(155, 'slug', 0, 1, ''),
(156, 'slug', 0, 1, ''),
(157, 'slug', 0, 1, ''),
(158, 'slug', 0, 1, ''),
(159, 'slug', 0, 1, ''),
(160, 'slug', 0, 1, ''),
(161, 'slug', 0, 1, ''),
(162, 'slug', 0, 1, ''),
(163, 'slug', 0, 1, ''),
(165, 'slug', 0, 1, ''),
(166, 'slug', 0, 1, ''),
(167, 'slug', 0, 1, ''),
(168, 'slug', 0, 1, ''),
(169, 'slug', 0, 1, ''),
(170, 'slug', 0, 1, ''),
(171, 'slug', 0, 1, ''),
(172, 'slug', 0, 1, ''),
(173, 'slug', 0, 1, ''),
(174, 'slug', 0, 1, ''),
(175, 'slug', 0, 1, ''),
(176, 'slug', 0, 1, ''),
(177, 'slug', 0, 1, ''),
(178, 'slug', 0, 1, ''),
(179, 'slug', 0, 1, ''),
(180, 'slug', 0, 1, ''),
(181, 'slug', 0, 1, ''),
(182, 'slug', 0, 1, ''),
(183, 'slug', 0, 1, ''),
(184, 'slug', 0, 1, ''),
(185, 'slug', 0, 1, ''),
(186, 'slug', 0, 1, ''),
(187, 'slug', 0, 1, ''),
(188, 'slug', 0, 1, ''),
(190, 'slug', 0, 1, ''),
(191, 'slug', 0, 1, ''),
(192, 'slug', 0, 1, ''),
(193, 'slug', 0, 1, ''),
(194, 'slug', 0, 1, ''),
(195, 'slug', 0, 1, ''),
(196, 'slug', 0, 1, ''),
(197, 'slug', 0, 1, ''),
(198, 'slug', 0, 1, ''),
(199, 'slug', 0, 1, ''),
(200, 'slug', 0, 1, ''),
(201, 'slug', 0, 1, ''),
(202, 'slug', 0, 1, ''),
(203, 'slug', 0, 1, ''),
(204, 'slug', 0, 1, ''),
(205, 'slug', 0, 1, ''),
(206, 'slug', 0, 1, ''),
(207, 'slug', 0, 1, ''),
(208, 'slug', 0, 1, ''),
(209, 'slug', 0, 1, ''),
(210, 'slug', 0, 1, ''),
(211, 'slug', 0, 1, ''),
(212, 'slug', 0, 1, ''),
(213, 'slug', 0, 1, ''),
(215, 'slug', 0, 1, ''),
(216, 'slug', 0, 1, ''),
(217, 'slug', 0, 1, ''),
(218, 'slug', 0, 1, ''),
(219, 'slug', 0, 1, ''),
(220, 'slug', 0, 1, ''),
(221, 'slug', 0, 1, ''),
(222, 'slug', 0, 1, ''),
(223, 'slug', 0, 1, ''),
(224, 'slug', 0, 1, ''),
(225, 'slug', 0, 1, ''),
(226, 'slug', 0, 1, ''),
(227, 'slug', 0, 1, ''),
(228, 'slug', 0, 1, ''),
(229, 'slug', 0, 1, ''),
(230, 'slug', 0, 1, ''),
(231, 'slug', 0, 1, ''),
(232, 'slug', 0, 1, ''),
(233, 'slug', 0, 1, ''),
(234, 'slug', 0, 1, ''),
(235, 'slug', 0, 1, ''),
(236, 'slug', 0, 1, ''),
(237, 'slug', 0, 1, ''),
(238, 'slug', 0, 1, ''),
(240, 'slug', 0, 1, ''),
(241, 'slug', 0, 1, ''),
(242, 'slug', 0, 1, ''),
(243, 'slug', 0, 1, ''),
(244, 'slug', 0, 1, ''),
(245, 'slug', 0, 1, ''),
(246, 'slug', 0, 1, ''),
(247, 'slug', 0, 1, ''),
(248, 'slug', 0, 1, ''),
(249, 'slug', 0, 1, ''),
(250, 'slug', 0, 1, ''),
(251, 'slug', 0, 1, ''),
(252, 'slug', 0, 1, ''),
(253, 'slug', 0, 1, ''),
(254, 'slug', 0, 1, ''),
(255, 'slug', 0, 1, ''),
(256, 'slug', 0, 1, ''),
(257, 'slug', 0, 1, ''),
(258, 'slug', 0, 1, ''),
(259, 'slug', 0, 1, ''),
(260, 'slug', 0, 1, ''),
(261, 'slug', 0, 1, ''),
(262, 'slug', 0, 1, ''),
(263, 'slug', 0, 1, '');

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

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'Style Guide', 'styleGuide', 'single', 1, 'all', NULL, '2021-06-20 02:07:41', '2021-06-20 02:07:41', NULL, '226862bd-49ad-4a42-b3f0-54913b81c86e');

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

--
-- Dumping data for table `sections_sites`
--

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, 'style-guide', 'templates/style-guide', 1, '2021-06-20 02:07:41', '2021-06-20 07:06:40', '5050caaa-a32f-4723-aa94-502099679a16');

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
(2, 1, 'S-m1cisS7yAgtBrB6Pvl9fCEB8KLb5CZ_RiWikikXKfoXppwoFMF03gGjgmeqf-5itUIsQ3u-T7OoeUinynnEcoVg45X0FRnauEB', '2021-06-17 10:03:46', '2021-06-17 10:03:46', 'b1a09b2a-8b88-487c-b5a8-d99e0d01254e'),
(7, 1, 'OVCylersgAz5vqeTGW1GjwYP6XL9yv_Zu04J_AAYXZUutufTJCZM7IOoJnMmJ55yPC1QjfIzOmT-Or8VZ--Kcmb4m5lwTGjaX2eH', '2021-06-20 11:28:46', '2021-06-20 13:01:04', '090f362e-56f0-4de8-876b-d880846f2418');

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
(1, 'admin_craftgulp', NULL, NULL, NULL, 'anuar@hey.com', '$2y$13$d/FChUKRB5IJDGZxojQWJubP/q6rHi9/xV2cuRLOVb4SabtDB/l.O', 1, 0, 0, 0, '2021-06-20 14:30:59', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2021-06-17 10:02:02', '2021-06-17 10:02:02', '2021-06-20 14:30:59', '3c08f9e6-0f71-4c9b-955e-ceb5b9bb49e7');

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
-- Indexes for table `matrixcontent_buttons`
--
ALTER TABLE `matrixcontent_buttons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_tdordcyxrzylktkzrqzmahbuneujfqfymwdw` (`elementId`,`siteId`),
  ADD KEY `fk_sbncvdwbiczrokxhefdbqttsbgjwgbivrirq` (`siteId`);

--
-- Indexes for table `matrixcontent_colors`
--
ALTER TABLE `matrixcontent_colors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_zdziddqamclmdkltlkdgjinqnquarkptxeid` (`elementId`,`siteId`),
  ADD KEY `fk_vndwlmgtewrkjtvzddmedpletydzdloqmtvk` (`siteId`);

--
-- Indexes for table `matrixcontent_links`
--
ALTER TABLE `matrixcontent_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ayohvytxpvqfbycknsowsmosmaosdpjripnp` (`elementId`,`siteId`),
  ADD KEY `fk_mxyjzcspmeznzmizhwmbmwvzlmroqzwqshrg` (`siteId`);

--
-- Indexes for table `matrixcontent_typography`
--
ALTER TABLE `matrixcontent_typography`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ftqkblxcbblbqffhyanrsrpzjusmfwmzhjgd` (`elementId`,`siteId`),
  ADD KEY `idx_dljaaemmiqamdeurrvnggqisviqzqcqurery` (`siteId`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT for table `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT for table `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `matrixcontent_buttons`
--
ALTER TABLE `matrixcontent_buttons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `matrixcontent_colors`
--
ALTER TABLE `matrixcontent_colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `matrixcontent_links`
--
ALTER TABLE `matrixcontent_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `matrixcontent_typography`
--
ALTER TABLE `matrixcontent_typography`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=328;

--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
-- Constraints for table `matrixcontent_buttons`
--
ALTER TABLE `matrixcontent_buttons`
  ADD CONSTRAINT `fk_cpztqfnqwabcovepcsqsdgbtocssniggfacp` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sbncvdwbiczrokxhefdbqttsbgjwgbivrirq` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `matrixcontent_colors`
--
ALTER TABLE `matrixcontent_colors`
  ADD CONSTRAINT `fk_vndwlmgtewrkjtvzddmedpletydzdloqmtvk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_zjhqvzqvblsvxacjjrragrbtvunlbfeinhfi` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matrixcontent_links`
--
ALTER TABLE `matrixcontent_links`
  ADD CONSTRAINT `fk_mxyjzcspmeznzmizhwmbmwvzlmroqzwqshrg` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vqowonsktfwnhkvxojxknaqxrggevncjfgac` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matrixcontent_typography`
--
ALTER TABLE `matrixcontent_typography`
  ADD CONSTRAINT `fk_aikogkuhlnhvpnbzdccvhhpefbmespbddpuj` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_otbzwurumkusglgowwyvuuolesannqhypvwm` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

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
