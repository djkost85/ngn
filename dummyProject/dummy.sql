#
# DbDumper SQL Dump
# Version 1.0
# 
# Host: localhost
# Generation Time: Jan 19, 2012 at 18:36
# Server version: 5.1.53-community
# Database : `dev_myninja_ru`
#

# --------------------------------------------------------

#
# Table structure for table `comments`
#

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL DEFAULT '0',
  `id2` int(11) NOT NULL DEFAULT '0',
  `uri` varchar(255) CHARACTER SET cp1251 DEFAULT NULL,
  `name` varchar(255) CHARACTER SET cp1251 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET cp1251 DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `pageTitle` varchar(255) DEFAULT NULL,
  `text` text CHARACTER SET cp1251,
  `text_f` text CHARACTER SET cp1251,
  `ans` text CHARACTER SET cp1251,
  `dateCreate` datetime NOT NULL,
  `dateUpdate` datetime NOT NULL,
  `userId` bigint(11) DEFAULT '0',
  `active` int(1) NOT NULL DEFAULT '1',
  `ip` varchar(15) CHARACTER SET cp1251 DEFAULT NULL,
  `ansId` int(11) NOT NULL,
  `ansUserId` int(10) DEFAULT NULL,
  `nick` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ansUserId` (`ansUserId`),
  KEY `active` (`active`),
  KEY `userId` (`userId`),
  KEY `id2` (`id2`),
  KEY `parentId` (`parentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `comments_active`
#

DROP TABLE IF EXISTS `comments_active`;
CREATE TABLE `comments_active` (
  `parentId` int(11) NOT NULL,
  `id2` int(11) NOT NULL,
  `active` int(1) NOT NULL,
  PRIMARY KEY (`parentId`,`id2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `comments_counts`
#

DROP TABLE IF EXISTS `comments_counts`;
CREATE TABLE `comments_counts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL DEFAULT '0',
  `id2` int(11) NOT NULL DEFAULT '0',
  `cnt` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`parentId`,`id2`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `comments_srt`
#

DROP TABLE IF EXISTS `comments_srt`;
CREATE TABLE `comments_srt` (
  `id` int(11) NOT NULL,
  `active` int(1) NOT NULL,
  `parentId` int(11) NOT NULL,
  `id2` int(11) NOT NULL,
  KEY `id` (`id`,`active`,`parentId`,`id2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `dd_fields`
#

DROP TABLE IF EXISTS `dd_fields`;
CREATE TABLE `dd_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(6) NOT NULL DEFAULT '0',
  `strName` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `help` varchar(255) DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `valuesList` text,
  `required` int(1) NOT NULL DEFAULT '0',
  `default` varchar(255) DEFAULT NULL,
  `maxlength` int(5) DEFAULT '0',
  `notList` int(1) NOT NULL DEFAULT '0',
  `defaultDisallow` int(1) NOT NULL DEFAULT '0',
  `editable` int(1) NOT NULL DEFAULT '1',
  `virtual` int(1) NOT NULL,
  `system` int(1) NOT NULL DEFAULT '0',
  `ddItemsStrName` varchar(20) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  `dateCreate` datetime NOT NULL,
  `dateUpdate` datetime NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `dd_grabber_keys`
#

DROP TABLE IF EXISTS `dd_grabber_keys`;
CREATE TABLE `dd_grabber_keys` (
  `k` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `dd_items`
#

DROP TABLE IF EXISTS `dd_items`;
CREATE TABLE `dd_items` (
  `itemId` int(11) NOT NULL,
  `strName` varchar(50) NOT NULL,
  `pageId` int(11) NOT NULL,
  `hash` varchar(41) NOT NULL,
  `userId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `dateCreate` datetime NOT NULL,
  `datePublish` datetime NOT NULL,
  `dateUpdate` datetime NOT NULL,
  `commentsUpdate` datetime NOT NULL,
  KEY `hash` (`hash`,`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `dd_lists`
#

DROP TABLE IF EXISTS `dd_lists`;
CREATE TABLE `dd_lists` (
  `fieldId` int(11) NOT NULL,
  `k` varchar(255) CHARACTER SET cp1251 NOT NULL,
  `v` varchar(255) CHARACTER SET cp1251 NOT NULL,
  `oid` int(11) NOT NULL,
  UNIQUE KEY `field_id_2` (`fieldId`,`k`),
  KEY `fieldId` (`fieldId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `dd_meta`
#

DROP TABLE IF EXISTS `dd_meta`;
CREATE TABLE `dd_meta` (
  `id` int(11) NOT NULL,
  `strName` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `titleType` enum('add','replace') NOT NULL,
  `description` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `dateCreate` datetime NOT NULL,
  `dateUpdate` datetime NOT NULL,
  PRIMARY KEY (`id`,`strName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `dd_multivalues`
#

DROP TABLE IF EXISTS `dd_multivalues`;
CREATE TABLE `dd_multivalues` (
  `fieldId` int(11) NOT NULL,
  `v` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `dd_privileges`
#

DROP TABLE IF EXISTS `dd_privileges`;
CREATE TABLE `dd_privileges` (
  `pageId` int(11) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `strName` varchar(20) CHARACTER SET cp1251 NOT NULL,
  `type` varchar(50) CHARACTER SET cp1251 NOT NULL,
  `field` varchar(255) CHARACTER SET cp1251 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `dd_structures`
#

DROP TABLE IF EXISTS `dd_structures`;
CREATE TABLE `dd_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET cp1251 NOT NULL,
  `oid` int(6) NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET cp1251 NOT NULL,
  `descr` varchar(255) CHARACTER SET cp1251 NOT NULL,
  `type` enum('static','dynamic','variant') DEFAULT 'dynamic',
  `locked` int(1) DEFAULT '0',
  `indx` int(1) NOT NULL,
  `dateCreate` datetime NOT NULL,
  `dateUpdate` int(11) NOT NULL,
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `id` (`id`),
  KEY `oid` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `dd_titles`
#

DROP TABLE IF EXISTS `dd_titles`;
CREATE TABLE `dd_titles` (
  `itemId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT '',
  `strName` varchar(50) NOT NULL,
  `pageId` int(11) NOT NULL,
  UNIQUE KEY `itemId` (`itemId`,`strName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `events`
#

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `dateCreate` datetime NOT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`),
  UNIQUE KEY `id_3` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `grabberChannel`
#

DROP TABLE IF EXISTS `grabberChannel`;
CREATE TABLE `grabberChannel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(5) NOT NULL,
  `type` enum('html','rss','dummy') NOT NULL,
  `pageId` int(11) NOT NULL,
  `data` text NOT NULL,
  `attempts` int(6) NOT NULL DEFAULT '0',
  `active` int(1) NOT NULL DEFAULT '0',
  `dateCreate` datetime NOT NULL,
  `dateUpdate` datetime NOT NULL,
  `dateLastGrab` datetime NOT NULL,
  `dateLastCheck` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `grabber_keys`
#

DROP TABLE IF EXISTS `grabber_keys`;
CREATE TABLE `grabber_keys` (
  `strName` varchar(50) NOT NULL,
  `itemId` int(11) NOT NULL,
  `k` varchar(255) NOT NULL,
  `dateCreate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `indx`
#

DROP TABLE IF EXISTS `indx`;
CREATE TABLE `indx` (
  `text` longtext NOT NULL,
  `id` int(15) NOT NULL,
  `strid` int(15) NOT NULL,
  FULLTEXT KEY `text` (`text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `level_items`
#

DROP TABLE IF EXISTS `level_items`;
CREATE TABLE `level_items` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` enum('dd','comments') NOT NULL,
  `strName` varchar(50) NOT NULL,
  `weight` int(2) NOT NULL DEFAULT '1',
  `usedLevel` int(2) NOT NULL DEFAULT '0',
  `dateCreate` datetime NOT NULL,
  PRIMARY KEY (`id`,`userId`,`type`,`strName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `level_users`
#

DROP TABLE IF EXISTS `level_users`;
CREATE TABLE `level_users` (
  `userId` int(11) NOT NULL,
  `level` int(2) NOT NULL,
  `nominateDate` datetime NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `memcache`
#

DROP TABLE IF EXISTS `memcache`;
CREATE TABLE `memcache` (
  `k` int(250) NOT NULL,
  `v` longtext NOT NULL,
  KEY `k` (`k`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `menu`
#

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `oid` int(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `onmap` int(1) NOT NULL DEFAULT '0',
  `active` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`),
  KEY `onmap` (`onmap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `notify_subscribe_items`
#

DROP TABLE IF EXISTS `notify_subscribe_items`;
CREATE TABLE `notify_subscribe_items` (
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `pageId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`type`,`pageId`,`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `notify_subscribe_pages`
#

DROP TABLE IF EXISTS `notify_subscribe_pages`;
CREATE TABLE `notify_subscribe_pages` (
  `event` varchar(50) NOT NULL,
  `userId` int(11) NOT NULL,
  `pageId` int(11) NOT NULL,
  UNIQUE KEY `event` (`event`,`userId`,`pageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `notify_subscribe_types`
#

DROP TABLE IF EXISTS `notify_subscribe_types`;
CREATE TABLE `notify_subscribe_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `dateCreate` datetime NOT NULL,
  `dateSent` datetime NOT NULL,
  PRIMARY KEY (`userId`,`type`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `pageBlocks`
#

DROP TABLE IF EXISTS `pageBlocks`;
CREATE TABLE `pageBlocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) NOT NULL,
  `colN` int(2) NOT NULL DEFAULT '0',
  `ownPageId` int(11) NOT NULL,
  `pageId` int(11) NOT NULL,
  `dateCreate` datetime NOT NULL,
  `dateUpdate` datetime NOT NULL,
  `type` varchar(50) NOT NULL,
  `global` int(1) NOT NULL DEFAULT '1',
  `settings` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `pages`
#

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` varchar(11) NOT NULL DEFAULT '0',
  `pids` varchar(255) NOT NULL,
  `oid` int(11) unsigned DEFAULT '0',
  `menuId` int(10) NOT NULL DEFAULT '0',
  `userId` int(15) NOT NULL DEFAULT '0',
  `active` int(1) unsigned DEFAULT '0',
  `slave` int(1) NOT NULL DEFAULT '0',
  `folder` int(1) NOT NULL,
  `title` varchar(255) DEFAULT '0',
  `fullTitle` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `path` varchar(255) NOT NULL,
  `pathData` text NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT '0',
  `dateCreate` datetime NOT NULL,
  `dateUpdate` datetime NOT NULL,
  `home` int(1) DEFAULT '0',
  `onMenu` int(1) DEFAULT '0',
  `onMap` int(1) DEFAULT '0',
  `isLock` int(1) DEFAULT '0',
  `counter` int(6) NOT NULL DEFAULT '0',
  `initSettings` text NOT NULL,
  `settings` text NOT NULL,
  `controller` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `strName` varchar(20) NOT NULL,
  `mysite` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`),
  KEY `home` (`home`),
  KEY `home_2` (`home`),
  KEY `home_3` (`home`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `pages_log`
#

DROP TABLE IF EXISTS `pages_log`;
CREATE TABLE `pages_log` (
  `dateCreate` datetime NOT NULL,
  `pageId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `processTime` float NOT NULL,
  `memory` float NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `pages_meta`
#

DROP TABLE IF EXISTS `pages_meta`;
CREATE TABLE `pages_meta` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `titleType` enum('add','replace') NOT NULL,
  `description` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `dateCreate` datetime NOT NULL,
  `dateUpdate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `patches`
#

DROP TABLE IF EXISTS `patches`;
CREATE TABLE `patches` (
  `filename` varchar(255) NOT NULL,
  `dateCreate` datetime NOT NULL,
  `status` enum('','complete') NOT NULL,
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `priv_msgs`
#

DROP TABLE IF EXISTS `priv_msgs`;
CREATE TABLE `priv_msgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pairId` int(11) NOT NULL DEFAULT '0',
  `userId` int(11) NOT NULL DEFAULT '0',
  `fromUserId` int(11) NOT NULL DEFAULT '0',
  `toUserId` int(11) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `time1` int(11) NOT NULL DEFAULT '0',
  `time2` int(11) NOT NULL DEFAULT '0',
  `viewed` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `host` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`userId`,`toUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `privs`
#

DROP TABLE IF EXISTS `privs`;
CREATE TABLE `privs` (
  `userId` int(11) NOT NULL,
  `pageId` int(11) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `rating_dd_voted_ips`
#

DROP TABLE IF EXISTS `rating_dd_voted_ips`;
CREATE TABLE `rating_dd_voted_ips` (
  `strName` varchar(50) NOT NULL,
  `itemId` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `voteDate` datetime NOT NULL,
  `votes` int(5) NOT NULL,
  PRIMARY KEY (`strName`,`itemId`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `rating_dd_voted_users`
#

DROP TABLE IF EXISTS `rating_dd_voted_users`;
CREATE TABLE `rating_dd_voted_users` (
  `strName` varchar(50) NOT NULL,
  `itemId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `voteDate` datetime NOT NULL,
  `votes` int(5) NOT NULL,
  PRIMARY KEY (`strName`,`itemId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `redirects`
#

DROP TABLE IF EXISTS `redirects`;
CREATE TABLE `redirects` (
  `type` varchar(50) NOT NULL,
  `userId` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `rss_subscribes`
#

DROP TABLE IF EXISTS `rss_subscribes`;
CREATE TABLE `rss_subscribes` (
  `channelId` int(11) NOT NULL,
  `pageId` int(11) NOT NULL,
  PRIMARY KEY (`channelId`,`pageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `sessions`
#

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `settings`
#

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` varchar(255) NOT NULL,
  `settings` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `slices`
#

DROP TABLE IF EXISTS `slices`;
CREATE TABLE `slices` (
  `id` varchar(255) NOT NULL,
  `pageId` int(11) NOT NULL,
  `dateCreate` datetime NOT NULL,
  `dateUpdate` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'html',
  `absolute` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `sound_play_time_log`
#

DROP TABLE IF EXISTS `sound_play_time_log`;
CREATE TABLE `sound_play_time_log` (
  `strName` varchar(50) NOT NULL,
  `itemId` int(11) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `sec` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `storeCart`
#

DROP TABLE IF EXISTS `storeCart`;
CREATE TABLE `storeCart` (
  `sessionId` varchar(255) NOT NULL DEFAULT '',
  `pageId` int(11) NOT NULL DEFAULT '0',
  `itemId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sessionId`,`pageId`,`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `subs_emails`
#

DROP TABLE IF EXISTS `subs_emails`;
CREATE TABLE `subs_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listId` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `code` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `subs_list`
#

DROP TABLE IF EXISTS `subs_list`;
CREATE TABLE `subs_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(1) NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `useUsers` int(1) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `subs_returns`
#

DROP TABLE IF EXISTS `subs_returns`;
CREATE TABLE `subs_returns` (
  `subsId` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `type` enum('users','emails') NOT NULL,
  `returnDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `subs_subscribers`
#

DROP TABLE IF EXISTS `subs_subscribers`;
CREATE TABLE `subs_subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `code` varchar(20) NOT NULL,
  `n` int(11) NOT NULL,
  `type` enum('users','emails') NOT NULL,
  `subsId` int(11) NOT NULL,
  `status` enum('','process','complete') NOT NULL,
  KEY `n` (`n`,`subsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `subs_subscribes`
#

DROP TABLE IF EXISTS `subs_subscribes`;
CREATE TABLE `subs_subscribes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listId` int(11) NOT NULL,
  `text` text NOT NULL,
  `subsBeginDate` datetime NOT NULL,
  `subsEndDate` datetime NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `subs_users`
#

DROP TABLE IF EXISTS `subs_users`;
CREATE TABLE `subs_users` (
  `userId` int(11) NOT NULL,
  `listId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`listId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `tags`
#

DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL,
  `oid` int(11) NOT NULL,
  `userGroupId` int(11) NOT NULL DEFAULT '0',
  `groupName` varchar(50) NOT NULL,
  `strName` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cnt` int(11) NOT NULL,
  `dateCreate` datetime NOT NULL,
  `dateUpdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `tags_groups`
#

DROP TABLE IF EXISTS `tags_groups`;
CREATE TABLE `tags_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `strName` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `itemsDirected` tinyint(1) NOT NULL,
  `unicalTagsName` tinyint(1) NOT NULL,
  `tree` tinyint(1) NOT NULL,
  PRIMARY KEY (`strName`,`name`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `tags_items`
#

DROP TABLE IF EXISTS `tags_items`;
CREATE TABLE `tags_items` (
  `groupName` varchar(50) NOT NULL,
  `strName` varchar(50) NOT NULL,
  `tagId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `collection` int(2) NOT NULL DEFAULT '0',
  `active` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `tasks_items`
#

DROP TABLE IF EXISTS `tasks_items`;
CREATE TABLE `tasks_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `timeBegin` datetime NOT NULL,
  `taskSettings` text NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `tasks_types`
#

DROP TABLE IF EXISTS `tasks_types`;
CREATE TABLE `tasks_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `upload_temp`
#

DROP TABLE IF EXISTS `upload_temp`;
CREATE TABLE `upload_temp` (
  `tempId` varchar(255) NOT NULL,
  `fieldName` varchar(255) NOT NULL,
  `fileName` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `userGroup`
#

DROP TABLE IF EXISTS `userGroup`;
CREATE TABLE `userGroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `dateCreate` datetime DEFAULT NULL,
  `dateUpdate` datetime DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `userStoreOrder`
#

DROP TABLE IF EXISTS `userStoreOrder`;
CREATE TABLE `userStoreOrder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `data` text NOT NULL,
  `dateCreate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateUpdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `userStoreOrderItems`
#

DROP TABLE IF EXISTS `userStoreOrderItems`;
CREATE TABLE `userStoreOrderItems` (
  `itemId` int(11) DEFAULT NULL,
  `pageId` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `userStoreSettings`
#

DROP TABLE IF EXISTS `userStoreSettings`;
CREATE TABLE `userStoreSettings` (
  `id` int(10) DEFAULT NULL,
  `settings` text,
  `dateCreate` datetime DEFAULT NULL,
  `dateUpdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `users`
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL DEFAULT '',
  `pass` varchar(255) NOT NULL DEFAULT '',
  `passClear` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `active` int(1) NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `dateCreate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateUpdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `image` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(50) DEFAULT NULL,
  `lastIp` varchar(15) NOT NULL DEFAULT '',
  `text` varchar(26) NOT NULL DEFAULT '',
  `mat` int(6) NOT NULL DEFAULT '0',
  `sex` enum('m','w','') NOT NULL DEFAULT '',
  `access` varchar(20) NOT NULL DEFAULT '',
  `actCode` varchar(20) NOT NULL DEFAULT '',
  `userDataPageId` int(11) NOT NULL DEFAULT '0',
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`),
  KEY `last_ip` (`lastIp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `users_pages`
#

DROP TABLE IF EXISTS `users_pages`;
CREATE TABLE `users_pages` (
  `userId` int(11) NOT NULL DEFAULT '0',
  `pageId` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `path` varchar(255) NOT NULL DEFAULT '',
  `dateCreate` datetime NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `users_settings`
#

DROP TABLE IF EXISTS `users_settings`;
CREATE TABLE `users_settings` (
  `userId` mediumint(9) NOT NULL,
  `settings` longtext,
  PRIMARY KEY (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `voting_log`
#

DROP TABLE IF EXISTS `voting_log`;
CREATE TABLE `voting_log` (
  `pageId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `fieldName` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

