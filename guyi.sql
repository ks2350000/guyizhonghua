-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2018-03-11 04:02:15
-- 服务器版本： 5.7.9
-- PHP Version: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `guyi`
--

-- --------------------------------------------------------

--
-- 表的结构 `sc_access`
--

DROP TABLE IF EXISTS `sc_access`;
CREATE TABLE IF NOT EXISTS `sc_access` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL COMMENT '权限名称',
  `urls` varchar(1000) NOT NULL COMMENT 'json 数组',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1：有效 0：无效',
  `updated_time` timestamp NOT NULL COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限详情表';

-- --------------------------------------------------------

--
-- 表的结构 `sc_access_log`
--

DROP TABLE IF EXISTS `sc_access_log`;
CREATE TABLE IF NOT EXISTS `sc_access_log` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '对应操作人员',
  `ip` varchar(40) NOT NULL COMMENT 'ip地址',
  `note` varchar(1000) NOT NULL COMMENT '做了什么',
  `created_time` timestamp NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `sc_role`
--

DROP TABLE IF EXISTS `sc_role`;
CREATE TABLE IF NOT EXISTS `sc_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1：有效 0：无效',
  `updated_time` timestamp NOT NULL COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- --------------------------------------------------------

--
-- 表的结构 `sc_role_access`
--

DROP TABLE IF EXISTS `sc_role_access`;
CREATE TABLE IF NOT EXISTS `sc_role_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色id',
  `access_id` int(11) NOT NULL DEFAULT '0' COMMENT '权限id',
  `created_time` int(11) NOT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- --------------------------------------------------------

--
-- 表的结构 `sc_user`
--

DROP TABLE IF EXISTS `sc_user`;
CREATE TABLE IF NOT EXISTS `sc_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(40) NOT NULL COMMENT '密码',
  `email` varchar(30) NOT NULL COMMENT '邮箱',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是超级管理员 1表示是 0 表示不是',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1：有效 0：无效',
  `updated_time` timestamp NOT NULL COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL COMMENT '插入时间',
  `phone` int(11) NOT NULL COMMENT '手机号',
  `sex` tinyint(1) NOT NULL COMMENT '性别 1：男 0：女',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
