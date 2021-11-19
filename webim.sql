-- phpMyAdmin SQL Dump
-- version 4.4.15
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2019-10-20 22:34:53
-- 服务器版本： 10.1.8-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webim`
--

-- --------------------------------------------------------

--
-- 表的结构 `wei_archives`
--

CREATE TABLE IF NOT EXISTS `wei_archives` (
  `id` int(11) NOT NULL,
  `title` varchar(155) NOT NULL,
  `url` varchar(155) NOT NULL,
  `keywords` varchar(155) DEFAULT '' COMMENT '文章关键词',
  `description` varchar(155) DEFAULT '' COMMENT '文章的描述',
  `typeid` int(5) NOT NULL DEFAULT '1' COMMENT '文章栏目id',
  `sort` int(3) NOT NULL DEFAULT '1' COMMENT '文章权重',
  `cnum` int(10) NOT NULL DEFAULT '2' COMMENT '文章点击次数',
  `writer` varchar(155) NOT NULL DEFAULT 'admin' COMMENT '文章作者',
  `addtime` int(10) NOT NULL COMMENT '添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `wei_articleinfo`
--

CREATE TABLE IF NOT EXISTS `wei_articleinfo` (
  `aid` int(11) NOT NULL COMMENT '文章对应的id',
  `body` text NOT NULL,
  `typeid` int(5) NOT NULL DEFAULT '1' COMMENT '文章栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `wei_category`
--

CREATE TABLE IF NOT EXISTS `wei_category` (
  `id` int(11) NOT NULL,
  `tname` varchar(255) NOT NULL COMMENT '类别名称',
  `type` varchar(155) NOT NULL COMMENT '归属分类',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 启用 2 禁用',
  `typeid` int(11) NOT NULL COMMENT '父类id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `wei_chatgroup`
--

CREATE TABLE IF NOT EXISTS `wei_chatgroup` (
  `id` int(11) NOT NULL COMMENT '群组id',
  `groupname` varchar(155) NOT NULL COMMENT '群组名称',
  `avatar` varchar(155) DEFAULT NULL COMMENT '群组头像',
  `owner_name` varchar(155) DEFAULT NULL COMMENT '群主名称',
  `owner_id` int(11) DEFAULT NULL COMMENT '群主id',
  `owner_avatar` varchar(155) DEFAULT NULL COMMENT '群主头像',
  `owner_sign` varchar(155) DEFAULT NULL COMMENT '群主签名',
  `created_time` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `wei_chatgroup`
--

INSERT INTO `wei_chatgroup` (`id`, `groupname`, `avatar`, `owner_name`, `owner_id`, `owner_avatar`, `owner_sign`, `created_time`) VALUES
(3, '测试群3', '/uploads/20190825/a9a3b918b516338496ba59eb868a3a91.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(4, '测试群4', '/uploads/20190825/d657624723f8fa3aecc279328f2dfe80.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(5, '测试5', '/uploads/20190825/553ec59ed91a9d77c41a430be4e5c8f7.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(6, '测试群6', '/uploads/20190825/a9f0141049bd6ee341bdbb078003596d.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(8, '群8', '/uploads/20190825/00821f400f6f2d46f313a40b61043458.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(9, '群9', '/uploads/20190825/029d5c019ac5f86ef6b99688042abb15.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(10, '群10', '/uploads/20190825/7cdbb8e22395136f0ec597afb36511cd.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(11, '群11', '/uploads/20190825/e188c4bb7525cfe5be31d9ccc9863c6e.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(12, '群11', '/uploads/20190825/5e3517ff966c32b603c07f0eb837bef1.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(13, '群12', '/uploads/20190825/be28cc7f51962c268a65f7e27c226f47.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(14, '群13', '/uploads/20190825/90a31ed32c867a21b4918c006727fe1f.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(15, '群14', '/uploads/20190825/f02aa1b88a6bd3afd1ecb2abc52187cc.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(41, 'ads', '/uploads/20190919/3ba45f085eb105f4d030559491a97775.jpg', '马云', 2, '/uploads/20190907/m.jpg', '让天下没有难做的生意', 0),
(40, 'af', '/uploads/20190919/1764c1a75148f4c42664fd7640ccf044.jpg', '马云', 2, '/uploads/20190907/m.jpg', '让天下没有难做的生意', 0),
(19, '群15', '/uploads/20190825/52c94600e0ccee079e9566c07d75a5ec.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(20, '群16', '/uploads/20190825/fb65e62bcf9524c3f6841df54f938615.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(21, '群17', '/uploads/20190825/20cdc0dc8ca7332c513d0ca02c83d8fc.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(22, '群18', '/uploads/20190825/b8312d8435f671d96faf535724ea9200.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(23, '群29', '/uploads/20190825/ea86fb2ec4052dce94d8441530875115.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(24, '群20', '/uploads/20190825/e380ca890f7b9d958a1b4d632b911510.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(25, '群21', '/uploads/20190825/25dba07075e141e967ddfef46561a029.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(26, '群22', '/uploads/20190825/0b5c097e415c898e5afd56273656b2d0.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(27, '群23', '/uploads/20190825/8cd73acec3a9c7126e26be6a270f5d44.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(28, '群24', '/uploads/20190825/3db3d24190da2c76a680ed1928d51930.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(29, '群25', '/uploads/20190825/86fb542fb292ad819548ebec3697509e.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(30, '群26', '/uploads/20190825/e0d1210d0eeab6d2f217f4ae308b4368.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(31, '群27', '/uploads/20190825/1a993eb5d86575fab879aa776c863400.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(32, '群28', '/uploads/20190825/0b12eb6baf496f5944cf668594a1e52b.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(33, '群29', '/uploads/20190825/446eeaa75f3bcb160ac5a6136b1b6f01.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(34, '群30', '/uploads/20190825/c071504b711dcc6dda52e013b525ae4a.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(35, '群31', '/uploads/20190825/2d43b02d4afd18b9859b61db22126c98.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(36, '群32', '/uploads/20190825/58e9a9299464c5a172abdcc55a737d68.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(37, '群33', '/uploads/20190825/2c00184f38f0a3fb30d82b923b147748.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(38, '群34', '/uploads/20190825/a8630d1898c03c58af3f3215caa54bcf.jpg', '马云', 2, 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', '让天下没有难写的代码', 0),
(45, '啊啊', '/uploads/20190923/3b72eabaf63be534a4bbaad43cce572c.jpg', '吕洞宾', 4, '/uploads/20190907/fm.jpg', '我是神仙', 1569249294);

-- --------------------------------------------------------

--
-- 表的结构 `wei_chatlog`
--

CREATE TABLE IF NOT EXISTS `wei_chatlog` (
  `id` int(11) NOT NULL,
  `fromid` int(11) NOT NULL COMMENT '会话来源id',
  `fromname` varchar(155) NOT NULL DEFAULT '' COMMENT '消息来源用户名',
  `fromavatar` varchar(155) NOT NULL DEFAULT '' COMMENT '来源的用户头像',
  `toid` int(11) NOT NULL COMMENT '会话发送的id',
  `content` text NOT NULL COMMENT '发送的内容',
  `timeline` int(10) NOT NULL COMMENT '记录时间',
  `type` varchar(55) NOT NULL COMMENT '聊天类型',
  `needsend` tinyint(1) DEFAULT '0' COMMENT '0 不需要推送 1 需要推送'
) ENGINE=MyISAM AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `wei_chatlog`
--

INSERT INTO `wei_chatlog` (`id`, `fromid`, `fromname`, `fromavatar`, `toid`, `content`, `timeline`, `type`, `needsend`) VALUES
(1, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 2, 'weewewew', 1566008347, 'friend', 0),
(2, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, 'img[/uploads/20190817/396f315f553e2fd93355f70061ebab39.jpg]', 1566008398, 'friend', 0),
(3, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, 'face[馋嘴] ', 1566008409, 'friend', 0),
(4, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 2, 'file(/uploads/20190817/8437be76518ded5cb53e9b88689b5bf8.sql)[下载文件]', 1566008643, 'friend', 0),
(5, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, 'dfffffffffff', 1566009957, 'friend', 0),
(6, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, 'dffffffffffffffff', 1566009959, 'friend', 0),
(7, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, 'ffffffff', 1566009960, 'friend', 0),
(8, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 2, '费大幅度发大幅度发大幅度发大幅度', 1566037705, 'friend', 0),
(9, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '111', 1566305915, 'friend', 0),
(10, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 2, 'face[吃惊] ', 1566305926, 'friend', 0),
(11, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, 'face[挤眼] ', 1566305933, 'friend', 0),
(12, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 2, 'file(/uploads/20190820/fc98b5daa1dadbf5d7f6c4b8b65cb603.jpg)[下载文件]', 1566305995, 'friend', 0),
(13, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 2, 'img[/uploads/20190820/f29badff6b6b4c1e4992b3e18f484466.jpg]', 1566306007, 'friend', 0),
(14, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 2, '6666666666666', 1566306072, 'friend', 0),
(15, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '222', 1566306978, 'friend', 0),
(16, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 2, '333', 1566306983, 'friend', 0),
(17, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '4444444', 1566307004, 'friend', 0),
(18, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '55555', 1566307008, 'friend', 0),
(19, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '66666', 1566307010, 'friend', 0),
(20, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '777777', 1566307012, 'friend', 0),
(21, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '88888', 1566307014, 'friend', 0),
(22, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '99999', 1566307016, 'friend', 0),
(23, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, 'aaaa', 1566307021, 'friend', 0),
(24, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, 'bbbbb', 1566307023, 'friend', 0),
(25, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, 'ccccc', 1566307025, 'friend', 0),
(26, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 13, '222', 1566310057, 'friend', 1),
(27, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '2222', 1566310070, 'friend', 0),
(28, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 13, '热热热', 1566705644, 'friend', 1),
(29, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 2, '实打实大声道', 1566705679, 'friend', 0),
(30, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '试试', 1566709236, 'friend', 0),
(31, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 1, 'dsds', 1566710322, 'friend', 0),
(32, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 2, 'dssssssssssss', 1566710331, 'friend', 0),
(33, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '2222', 1566711963, 'friend', 0),
(34, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, 'wewewe', 1566711972, 'friend', 0),
(35, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 2, '是是是', 1566711985, 'friend', 0),
(36, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 2, '1', 1566712033, 'friend', 0),
(37, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 2, '222', 1566718035, 'friend', 0),
(38, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 34, '的士速递', 1566718479, 'group', 0),
(39, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 11, 'dsdsds', 1566724146, 'group', 0),
(40, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 12, '23222', 1566724157, 'group', 0),
(41, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 13, 'wqqwqwwq', 1566724169, 'group', 0),
(42, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 11, 'ddssdds', 1566724195, 'group', 0),
(43, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 12, 'sss', 1566724235, 'group', 0),
(44, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 11, '222', 1566724313, 'group', 0),
(45, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 12, 'dddd', 1566724318, 'group', 0),
(46, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 11, '111', 1566724380, 'group', 0),
(47, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 12, '222', 1566724391, 'group', 0),
(48, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 11, 'a', 1566724430, 'group', 0),
(49, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 12, 'b', 1566724433, 'group', 0),
(50, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 2, 'a', 1566743952, 'friend', 0),
(51, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 2, 'dfddf', 1567864448, 'friend', 0),
(52, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '111', 1567864458, 'friend', 0),
(53, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 3, 'qqq', 1567864475, 'group', 0),
(54, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 3, 'bbb', 1567864484, 'group', 0),
(55, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 39, '说的', 1567866838, 'group', 0),
(56, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 39, '嗯嗯', 1567866890, 'group', 0),
(57, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 39, '333', 1567866895, 'group', 0),
(58, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '是', 1567914094, 'friend', 0),
(59, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '而威尔', 1567915116, 'friend', 0),
(60, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '是', 1567915191, 'friend', 0),
(61, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '问问我', 1567915238, 'friend', 0),
(62, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '放的地方', 1567915266, 'friend', 0),
(63, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '啊啊', 1567915278, 'friend', 0),
(64, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '不', 1567915390, 'friend', 0),
(65, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '1', 1567915448, 'friend', 0),
(66, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 2, '2', 1567915510, 'friend', 0),
(67, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 2, '啊', 1567915606, 'friend', 0),
(68, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '不', 1567915626, 'friend', 0),
(69, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 2, 'ss', 1567920134, 'friend', 0),
(70, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '3', 1567920139, 'friend', 0),
(71, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '1', 1567920668, 'friend', 0),
(72, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, 'b', 1567920805, 'friend', 0),
(73, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 2, 'a', 1567920811, 'friend', 0),
(74, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 39, '热', 1567921118, 'group', 0),
(75, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 39, '实打实大多数', 1567921164, 'group', 0),
(76, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 3, '东方饭店', 1567926207, 'group', 0),
(77, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 39, '试试', 1567926391, 'group', 0),
(78, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '1', 1567929920, 'friend', 0),
(79, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '1', 1567929945, 'group', 0),
(80, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '1', 1567930287, 'friend', 0),
(81, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, '1', 1567930294, 'group', 0),
(82, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 3, '的', 1567930322, 'friend', 0),
(83, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 3, '是', 1567930339, 'friend', 0),
(84, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, 'ss', 1567932879, 'friend', 0),
(85, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 2, 'a', 1567932889, 'friend', 0),
(86, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, 'ss', 1567933124, 'friend', 0),
(87, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, 'a', 1567933554, 'friend', 0),
(88, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, 'aa', 1567933682, 'friend', 0),
(89, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, 's', 1567933897, 'friend', 0),
(90, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, 'aaa', 1567933908, 'group', 0),
(91, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 3, 'fffffffffff', 1567933934, 'group', 0),
(92, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, 'a', 1567934534, 'friend', 0),
(93, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 2, 'b', 1567934540, 'friend', 0),
(94, 2, '马云', 'http://tp4.sinaimg.cn/2145291155/180/5601307179/1', 1, 'c', 1567934543, 'friend', 0),
(95, 1, '纸飞机', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg', 3, 'aa', 1567934570, 'group', 0),
(96, 2, '马云', '/uploads/20190907/m.jpg', 3, 'bbb', 1568466344, 'friend', 0),
(97, 3, '貂蝉', '/uploads/20190907/fm.jpg', 2, 'ccc', 1568466350, 'friend', 0),
(98, 3, '貂蝉', '/uploads/20190907/fm.jpg', 2, '你好，是马总吗face[微笑] ', 1568466589, 'friend', 0),
(99, 2, '马云', '/uploads/20190907/m.jpg', 3, '是的，有事吗', 1568466601, 'friend', 0),
(100, 2, '马云', '/uploads/20190907/m.jpg', 13, '你好，吕布，看到信息尽快回复我，找你有事', 1568466677, 'friend', 1),
(101, 3, '貂蝉', '/uploads/20190907/fm.jpg', 2, '你是马云吗？', 1568640086, 'friend', 0),
(102, 2, '马云', '/uploads/20190907/m.jpg', 3, '是的', 1568640092, 'friend', 0),
(103, 2, '马云', '/uploads/20190907/m.jpg', 6, 's', 1568643330, 'group', 0),
(104, 3, '貂蝉', '/uploads/20190907/fm.jpg', 6, 'd', 1568644162, 'group', 0),
(105, 3, '貂蝉', '/uploads/20190907/fm.jpg', 6, 'd', 1568645558, 'group', 0),
(106, 2, '马云', '/uploads/20190907/m.jpg', 6, '哈哈哈哈啊哈哈哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈', 1568645570, 'group', 0),
(107, 1, '曹操', 'http://layim.layui.com/uploads/20190907/m.jpg', 3, 'd', 1569244731, 'friend', 1),
(108, 2, '马云', 'http://layim.layui.com/uploads/20190907/m.jpg', 1, 'f', 1569244737, 'friend', 0),
(109, 1, '曹操', 'http://layim.layui.com/uploads/20190907/m.jpg', 3, 'img[http://layim.layui.com/uploads/20190923/567e1dbd17d0708d033a79c20c728d1d.jpg]', 1569244742, 'friend', 1),
(110, 1, '曹操', 'http://layim.layui.com/uploads/20190907/m.jpg', 2, 'img[http://layim.layui.com/uploads/20190923/4d6c785bf91b9d70a6d37c03c0792b86.jpg]', 1569244761, 'friend', 0),
(111, 2, '马云', 'http://layim.layui.com/uploads/20190907/m.jpg', 1, 'mobie', 1569247844, 'friend', 0),
(112, 2, '马云', 'http://layim.layui.com/uploads/20190907/m.jpg', 1, '我来自移动端', 1569247915, 'friend', 0),
(113, 2, '马云', 'http://layim.layui.com/uploads/20190907/m.jpg', 4, '你好，吕洞宾', 1569247990, 'friend', 0),
(114, 2, '马云', 'http://layim.layui.com/uploads/20190907/m.jpg', 4, '反对党丰富的', 1569248062, 'friend', 0),
(115, 2, '马云', 'http://layim.layui.com/uploads/20190907/m.jpg', 4, '啊啊', 1569248154, 'friend', 0),
(116, 4, '吕洞宾', 'http://layim.layui.com/uploads/20190907/fm.jpg', 2, '订单', 1569248253, 'friend', 0),
(117, 4, '吕洞宾', 'http://layim.layui.com/uploads/20190907/fm.jpg', 2, '的', 1569249145, 'friend', 0),
(118, 2, '马云', 'http://layim.layui.com/uploads/20190907/m.jpg', 4, '地方', 1569249171, 'friend', 0),
(119, 4, '吕洞宾', 'http://layim.layui.com/uploads/20190907/fm.jpg', 2, 'img[http://layim.layui.com/uploads/20190923/39b16a49ae886e92b3685b91bd3b6e2f.jpg]', 1569249179, 'friend', 0),
(120, 2, '马云', 'http://layim.layui.com/uploads/20190907/m.jpg', 4, 'file(http://layim.layui.com/uploads/20190923/aa889b93aaf2ef2d1a6aafcadcdb2a36.docx)[下载文件]', 1569249186, 'friend', 0),
(121, 4, '吕洞宾', 'http://im.51wbw.cn/uploads/20190907/fm.jpg', 3, 'df', 1569504543, 'group', 0),
(122, 4, '吕洞宾', 'http://layim.layui.com/uploads/20190907/fm.jpg', 2, '订单', 1571579439, 'friend', 0),
(123, 3, '貂蝉', 'http://layim.layui.com/uploads/20190907/fm.jpg', 13, 'ddd', 1571579772, 'friend', 1),
(124, 2, '马云', 'http://layim.layui.com/uploads/20190907/m.jpg', 4, 'ddddddd', 1571579829, 'friend', 0),
(125, 4, '吕洞宾', 'http://layim.layui.com/uploads/20190907/fm.jpg', 2, '222222222222222', 1571579839, 'friend', 0);

-- --------------------------------------------------------

--
-- 表的结构 `wei_chatuser`
--

CREATE TABLE IF NOT EXISTS `wei_chatuser` (
  `id` int(11) NOT NULL,
  `username` varchar(155) DEFAULT NULL,
  `phone` varchar(50) NOT NULL DEFAULT '',
  `pwd` varchar(155) DEFAULT NULL COMMENT '密码',
  `status` varchar(55) DEFAULT 'offline',
  `sign` varchar(255) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `created_time` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_time` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `wei_chatuser`
--

INSERT INTO `wei_chatuser` (`id`, `username`, `phone`, `pwd`, `status`, `sign`, `avatar`, `created_time`, `updated_time`) VALUES
(1, '曹操', '18301917201', 'e10adc3949ba59abbe56e057f20f883e', 'offline', '我是一代枭雄', '/uploads/20190907/m.jpg', 1568452352, 1568452352),
(2, '马云', '18301917202', 'e10adc3949ba59abbe56e057f20f883e', 'online', '让天下没有难做的生意', '/uploads/20190907/m.jpg', 1568452352, 1568452352),
(3, '貂蝉', '18301917203', 'e10adc3949ba59abbe56e057f20f883e', 'offline', '我是第一美女', '/uploads/20190907/fm.jpg', 1568452352, 1568452352),
(13, '吕布', '18301917204', 'e10adc3949ba59abbe56e057f20f883e', 'offline', '实力决定一切', '/uploads/20190907/m.jpg', 1568452352, 1568452352),
(15, '大侠', '18301917207', 'e10adc3949ba59abbe56e057f20f883e', 'offline', '个性', '/uploads/20190907/m.jpg', 1568452352, 1568452352),
(4, '吕洞宾', '18301917209', 'e10adc3949ba59abbe56e057f20f883e', 'online', '我是神仙1', '/uploads/20190907/fm.jpg', 1568452352, 1568452352);

-- --------------------------------------------------------

--
-- 表的结构 `wei_company_user`
--

CREATE TABLE IF NOT EXISTS `wei_company_user` (
  `id` bigint(20) unsigned NOT NULL,
  `nickname` varchar(50) DEFAULT '' COMMENT '员工姓名',
  `svn_username` varchar(50) DEFAULT '' COMMENT '员工账号',
  `svn_password` varchar(32) DEFAULT '' COMMENT '员工密码',
  `svn_authorize` varchar(255) DEFAULT '' COMMENT '权限授权',
  `user_type` varchar(20) DEFAULT '' COMMENT '员工身份',
  `entry_date` varchar(30) DEFAULT '' COMMENT '入职日期',
  `leave_date` varchar(30) DEFAULT '' COMMENT '离职日期',
  `become_date` varchar(30) DEFAULT '' COMMENT '转正日期',
  `contact_qq` varchar(16) DEFAULT '' COMMENT '联系QQ',
  `contact_mail` varchar(32) DEFAULT '' COMMENT '联系邮箱',
  `contact_phone` varchar(16) DEFAULT '' COMMENT '联系手机',
  `mobile_macs` text COMMENT '打卡手机',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0禁用,1正常,2离职)',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除(1删除,0未删)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='企业-员工信息';

-- --------------------------------------------------------

--
-- 表的结构 `wei_company_user_auth`
--

CREATE TABLE IF NOT EXISTS `wei_company_user_auth` (
  `id` bigint(20) unsigned NOT NULL,
  `title` varchar(50) DEFAULT '' COMMENT '权限名称',
  `path` varchar(500) DEFAULT '' COMMENT '权限路径',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0禁用,1正常)',
  `desc` varchar(500) DEFAULT '' COMMENT '权限描述',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除(1删除,0未删)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='企业-仓库权限';

-- --------------------------------------------------------

--
-- 表的结构 `wei_company_user_clock`
--

CREATE TABLE IF NOT EXISTS `wei_company_user_clock` (
  `id` bigint(20) unsigned NOT NULL,
  `uid` bigint(20) unsigned DEFAULT NULL COMMENT '用户ID',
  `name` varchar(20) DEFAULT NULL COMMENT '用户姓名',
  `ip` varchar(15) NOT NULL COMMENT '权限名称',
  `mac` char(17) DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `desc` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `date` date DEFAULT NULL,
  `start_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `end_at` datetime DEFAULT NULL COMMENT '结束时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='企业-打卡记录';

-- --------------------------------------------------------

--
-- 表的结构 `wei_friend`
--

CREATE TABLE IF NOT EXISTS `wei_friend` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `friend_id` int(11) NOT NULL COMMENT '好友id',
  `friend_group_id` int(11) NOT NULL COMMENT '好友分组id'
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='好友表';

--
-- 转存表中的数据 `wei_friend`
--

INSERT INTO `wei_friend` (`id`, `user_id`, `friend_id`, `friend_group_id`) VALUES
(2, 1, 3, 0),
(4, 2, 3, 0),
(5, 3, 1, 0),
(6, 3, 2, 0),
(7, 1, 13, 0),
(8, 2, 13, 0),
(9, 3, 13, 0),
(10, 13, 1, 0),
(11, 13, 2, 0),
(12, 13, 3, 0),
(19, 1, 2, 0),
(20, 2, 1, 0),
(21, 4, 1, 0),
(22, 4, 2, 0),
(23, 2, 4, 0);

-- --------------------------------------------------------

--
-- 表的结构 `wei_friend_group`
--

CREATE TABLE IF NOT EXISTS `wei_friend_group` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `groupname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户好友分组表，保存用户有哪些好友分组';

-- --------------------------------------------------------

--
-- 表的结构 `wei_groupdetail`
--

CREATE TABLE IF NOT EXISTS `wei_groupdetail` (
  `userid` int(11) NOT NULL,
  `username` varchar(155) NOT NULL,
  `useravatar` varchar(155) NOT NULL,
  `usersign` varchar(155) NOT NULL,
  `groupid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `wei_groupdetail`
--

INSERT INTO `wei_groupdetail` (`userid`, `username`, `useravatar`, `usersign`, `groupid`) VALUES
(3, '罗玉凤', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '在自己实力不济的时候，不要去相信什么媒体和记者。他们不是善良的人，有时候候他们的采访对当事人而言就是陷阱', 2),
(3, '罗玉凤', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '在自己实力不济的时候，不要去相信什么媒体和记者。他们不是善良的人，有时候候他们的采访对当事人而言就是陷阱', 3),
(3, '罗玉凤', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '在自己实力不济的时候，不要去相信什么媒体和记者。他们不是善良的人，有时候候他们的采访对当事人而言就是陷阱', 4),
(3, '罗玉凤', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '在自己实力不济的时候，不要去相信什么媒体和记者。他们不是善良的人，有时候候他们的采访对当事人而言就是陷阱', 5),
(3, '罗玉凤', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '在自己实力不济的时候，不要去相信什么媒体和记者。他们不是善良的人，有时候候他们的采访对当事人而言就是陷阱', 8),
(3, '罗玉凤', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '在自己实力不济的时候，不要去相信什么媒体和记者。他们不是善良的人，有时候候他们的采访对当事人而言就是陷阱', 9),
(3, '罗玉凤', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '在自己实力不济的时候，不要去相信什么媒体和记者。他们不是善良的人，有时候候他们的采访对当事人而言就是陷阱', 10),
(3, '罗玉凤', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '在自己实力不济的时候，不要去相信什么媒体和记者。他们不是善良的人，有时候候他们的采访对当事人而言就是陷阱', 12),
(3, '罗玉凤', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '在自己实力不济的时候，不要去相信什么媒体和记者。他们不是善良的人，有时候候他们的采访对当事人而言就是陷阱', 13),
(3, '罗玉凤', 'http://tp1.sinaimg.cn/1241679004/180/5743814375/0', '在自己实力不济的时候，不要去相信什么媒体和记者。他们不是善良的人，有时候候他们的采访对当事人而言就是陷阱', 14),
(2, '马云', '/uploads/20190907/m.jpg', '让天下没有难做的生意', 3),
(2, '马云', '/uploads/20190907/m.jpg', '让天下没有难做的生意', 4),
(4, '吕洞宾', '/uploads/20190907/fm.jpg', '我是神仙', 3),
(4, '吕洞宾', '/uploads/20190907/fm.jpg', '我是神仙', 4),
(4, '吕洞宾', '/uploads/20190907/fm.jpg', '我是神仙', 6),
(4, '吕洞宾', '/uploads/20190907/fm.jpg', '我是神仙', 45),
(4, '吕洞宾', '/uploads/20190907/fm.jpg', '我是神仙', 10),
(4, '吕洞宾', '/uploads/20190907/fm.jpg', '我是神仙', 38),
(4, '吕洞宾', '/uploads/20190907/fm.jpg', '我是神仙', 14),
(4, '吕洞宾', '/uploads/20190907/fm.jpg', '我是神仙', 27);

-- --------------------------------------------------------

--
-- 表的结构 `wei_sms_code`
--

CREATE TABLE IF NOT EXISTS `wei_sms_code` (
  `id` int(11) unsigned NOT NULL,
  `phone` varchar(50) NOT NULL DEFAULT '',
  `code` varchar(10) NOT NULL DEFAULT '',
  `msg` varchar(100) NOT NULL DEFAULT '',
  `created_time` int(11) unsigned NOT NULL,
  `updated_time` int(11) unsigned NOT NULL,
  `expire_time` int(11) unsigned NOT NULL COMMENT '过期时间'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `wei_sms_code`
--

INSERT INTO `wei_sms_code` (`id`, `phone`, `code`, `msg`, `created_time`, `updated_time`, `expire_time`) VALUES
(1, '18301917208', '8315', '发送成功', 1568451854, 1568451854, 1568452854);

-- --------------------------------------------------------

--
-- 表的结构 `wei_store_express_company`
--

CREATE TABLE IF NOT EXISTS `wei_store_express_company` (
  `id` bigint(20) unsigned NOT NULL,
  `express_title` varchar(50) DEFAULT '' COMMENT '快递公司名称',
  `express_code` varchar(50) DEFAULT '' COMMENT '快递公司代码',
  `express_desc` varchar(512) DEFAULT '' COMMENT '快递公司描述',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0.无效,1.有效)',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商城-快递-公司';

--
-- 转存表中的数据 `wei_store_express_company`
--

INSERT INTO `wei_store_express_company` (`id`, `express_title`, `express_code`, `express_desc`, `status`, `sort`, `is_deleted`, `create_at`) VALUES
(5, 'AAE全球专递', 'aae', NULL, 0, 0, 0, '2017-09-11 19:53:40'),
(6, '安捷快递', 'anjie', '', 0, 0, 0, '2017-09-12 23:27:26'),
(7, '安信达快递', 'anxindakuaixi', NULL, 0, 0, 0, '2017-09-13 00:05:19'),
(8, '彪记快递', 'biaojikuaidi', NULL, 0, 0, 0, '2017-09-13 00:05:26'),
(9, 'BHT', 'bht', '', 0, 0, 0, '2017-09-13 00:05:37'),
(10, '百福东方国际物流', 'baifudongfang', NULL, 0, 0, 0, '2017-09-13 00:05:41'),
(11, '中国东方（COE）', 'coe', NULL, 0, 0, 0, '2017-09-13 00:05:48'),
(12, '长宇物流', 'changyuwuliu', NULL, 0, 0, 0, '2017-09-13 00:05:58'),
(13, '大田物流', 'datianwuliu', NULL, 0, 0, 0, '2017-09-13 00:06:06'),
(14, '德邦物流', 'debangwuliu', '', 0, 1, 0, '2017-09-13 00:06:14'),
(15, 'DHL', 'dhl', NULL, 0, 0, 0, '2017-09-13 00:06:24'),
(16, 'DPEX', 'dpex', NULL, 0, 0, 0, '2017-09-13 00:06:29'),
(17, 'd速快递', 'dsukuaidi', NULL, 0, 0, 0, '2017-09-13 00:06:34'),
(18, '递四方', 'disifang', NULL, 0, 0, 0, '2017-09-13 00:06:40'),
(19, 'EMS快递', 'ems', '', 1, 0, 0, '2017-09-13 00:06:47'),
(20, 'FEDEX（国外）', 'fedex', NULL, 0, 0, 0, '2017-09-13 00:06:56'),
(21, '飞康达物流', 'feikangda', NULL, 0, 0, 0, '2017-09-13 00:07:03'),
(22, '凤凰快递', 'fenghuangkuaidi', NULL, 0, 0, 0, '2017-09-13 00:07:10'),
(23, '飞快达', 'feikuaida', NULL, 0, 0, 0, '2017-09-13 00:07:16'),
(24, '国通快递', 'guotongkuaidi', NULL, 0, 0, 0, '2017-09-13 00:07:27'),
(25, '港中能达物流', 'ganzhongnengda', NULL, 0, 0, 0, '2017-09-13 00:07:33'),
(26, '广东邮政物流', 'guangdongyouzhengwuliu', NULL, 0, 0, 0, '2017-09-13 00:08:22'),
(27, '共速达', 'gongsuda', NULL, 0, 0, 0, '2017-09-13 00:08:48'),
(28, '汇通快运', 'huitongkuaidi', NULL, 0, 0, 0, '2017-09-13 00:08:56'),
(29, '恒路物流', 'hengluwuliu', NULL, 0, 0, 0, '2017-09-13 00:09:02'),
(30, '华夏龙物流', 'huaxialongwuliu', NULL, 0, 0, 0, '2017-09-13 00:09:12'),
(31, '海红', 'haihongwangsong', NULL, 0, 0, 0, '2017-09-13 00:09:20'),
(32, '海外环球', 'haiwaihuanqiu', NULL, 0, 0, 0, '2017-09-13 00:09:27'),
(33, '佳怡物流', 'jiayiwuliu', NULL, 0, 0, 0, '2017-09-13 00:09:35'),
(34, '京广速递', 'jinguangsudikuaijian', NULL, 0, 0, 0, '2017-09-13 00:09:42'),
(35, '急先达', 'jixianda', NULL, 0, 0, 0, '2017-09-13 00:09:49'),
(36, '佳吉物流', 'jjwl', NULL, 0, 0, 0, '2017-09-13 00:10:01'),
(37, '加运美物流', 'jymwl', NULL, 0, 0, 0, '2017-09-13 00:10:13'),
(38, '金大物流', 'jindawuliu', NULL, 0, 0, 0, '2017-09-13 00:10:22'),
(39, '嘉里大通', 'jialidatong', NULL, 0, 0, 0, '2017-09-13 00:10:33'),
(40, '晋越快递', 'jykd', NULL, 0, 0, 0, '2017-09-13 00:10:40'),
(41, '快捷速递', 'kuaijiesudi', NULL, 0, 0, 0, '2017-09-13 00:10:49'),
(42, '联邦快递（国内）', 'lianb', NULL, 0, 0, 0, '2017-09-13 00:10:58'),
(43, '联昊通物流', 'lianhaowuliu', NULL, 0, 0, 0, '2017-09-13 00:11:07'),
(44, '龙邦物流', 'longbanwuliu', NULL, 0, 0, 0, '2017-09-13 00:11:15'),
(45, '立即送', 'lijisong', NULL, 0, 0, 0, '2017-09-13 00:11:25'),
(46, '乐捷递', 'lejiedi', NULL, 0, 0, 0, '2017-09-13 00:11:36'),
(47, '民航快递', 'minghangkuaidi', NULL, 0, 0, 0, '2017-09-13 00:11:45'),
(48, '美国快递', 'meiguokuaidi', NULL, 0, 0, 0, '2017-09-13 00:11:53'),
(49, '门对门', 'menduimen', NULL, 0, 0, 0, '2017-09-13 00:12:01'),
(50, 'OCS', 'ocs', NULL, 0, 0, 0, '2017-09-13 00:12:10'),
(51, '配思货运', 'peisihuoyunkuaidi', NULL, 0, 0, 0, '2017-09-13 00:12:18'),
(52, '全晨快递', 'quanchenkuaidi', NULL, 0, 0, 0, '2017-09-13 00:12:26'),
(53, '全峰快递', 'quanfengkuaidi', NULL, 0, 0, 0, '2017-09-13 00:12:34'),
(54, '全际通物流', 'quanjitong', NULL, 0, 0, 0, '2017-09-13 00:12:41'),
(55, '全日通快递', 'quanritongkuaidi', NULL, 0, 0, 0, '2017-09-13 00:12:49'),
(56, '全一快递', 'quanyikuaidi', NULL, 0, 0, 0, '2017-09-13 00:12:56'),
(57, '如风达', 'rufengda', NULL, 0, 0, 0, '2017-09-13 00:13:03'),
(58, '三态速递', 'santaisudi', NULL, 0, 0, 0, '2017-09-13 00:13:15'),
(59, '盛辉物流', 'shenghuiwuliu', NULL, 0, 0, 0, '2017-09-13 00:13:22'),
(60, '申通', 'shentong', NULL, 0, 0, 0, '2017-09-13 00:13:34'),
(61, '顺丰', 'shunfeng', '', 0, 0, 0, '2017-09-13 00:13:41'),
(62, '速尔物流', 'sue', NULL, 0, 0, 0, '2017-09-13 00:13:48'),
(63, '盛丰物流', 'shengfeng', NULL, 0, 0, 0, '2017-09-13 00:13:55'),
(64, '赛澳递', 'saiaodi', NULL, 0, 0, 0, '2017-09-13 00:14:02'),
(65, '天地华宇', 'tiandihuayu', NULL, 0, 0, 0, '2017-09-13 00:14:11'),
(66, '天天快递', 'tiantian', NULL, 0, 0, 0, '2017-09-13 00:14:19'),
(67, 'TNT', 'tnt', NULL, 0, 0, 0, '2017-09-13 00:14:26'),
(68, 'UPS', 'ups', NULL, 0, 0, 0, '2017-09-13 00:14:29'),
(69, '万家物流', 'wanjiawuliu', NULL, 0, 0, 0, '2017-09-13 00:14:37'),
(70, '文捷航空速递', 'wenjiesudi', NULL, 0, 0, 0, '2017-09-13 00:14:46'),
(71, '伍圆', 'wuyuan', NULL, 0, 0, 0, '2017-09-13 00:14:52'),
(72, '万象物流', 'wxwl', NULL, 0, 0, 0, '2017-09-13 00:15:00'),
(73, '新邦物流', 'xinbangwuliu', NULL, 0, 0, 0, '2017-09-13 00:15:06'),
(74, '信丰物流', 'xinfengwuliu', NULL, 0, 0, 0, '2017-09-13 00:15:15'),
(75, '亚风速递', 'yafengsudi', NULL, 0, 0, 0, '2017-09-13 00:15:23'),
(76, '一邦速递', 'yibangwuliu', NULL, 0, 0, 0, '2017-09-13 00:15:30'),
(77, '优速物流', 'youshuwuliu', NULL, 0, 0, 0, '2017-09-13 00:15:36'),
(78, '邮政包裹挂号信', 'youzhengguonei', NULL, 0, 3, 0, '2017-09-13 00:15:44'),
(79, '邮政国际包裹挂号信', 'youzhengguoji', NULL, 0, 2, 0, '2017-09-13 00:15:51'),
(80, '远成物流', 'yuanchengwuliu', NULL, 0, 0, 0, '2017-09-13 00:15:57'),
(81, '圆通速递', 'yuantong', '', 1, 1, 0, '2017-09-13 00:16:03'),
(82, '源伟丰快递', 'yuanweifeng', NULL, 0, 0, 0, '2017-09-13 00:16:10'),
(83, '元智捷诚快递', 'yuanzhijiecheng', NULL, 0, 0, 0, '2017-09-13 00:16:17'),
(84, '韵达快运', 'yunda', NULL, 0, 0, 0, '2017-09-13 00:16:24'),
(85, '运通快递', 'yuntongkuaidi', NULL, 0, 0, 0, '2017-09-13 00:16:33'),
(86, '越丰物流', 'yuefengwuliu', NULL, 0, 0, 0, '2017-09-13 00:16:40'),
(87, '源安达', 'yad', NULL, 0, 0, 0, '2017-09-13 00:16:47'),
(88, '银捷速递', 'yinjiesudi', NULL, 0, 0, 0, '2017-09-13 00:16:56'),
(89, '宅急送', 'zhaijisong', NULL, 0, 0, 0, '2017-09-13 00:17:03'),
(90, '中铁快运', 'zhongtiekuaiyun', NULL, 0, 0, 0, '2017-09-13 00:17:10'),
(91, '中通速递', 'zhongtong', '', 0, 0, 0, '2017-09-13 00:17:16'),
(92, '中邮物流', 'zhongyouwuliu', NULL, 0, 0, 0, '2017-09-13 00:17:27'),
(93, '忠信达', 'zhongxinda', NULL, 0, 0, 0, '2017-09-13 00:17:34'),
(94, '芝麻开门', 'zhimakaimen', '', 1, 0, 0, '2017-09-13 00:17:41');

-- --------------------------------------------------------

--
-- 表的结构 `wei_store_express_template`
--

CREATE TABLE IF NOT EXISTS `wei_store_express_template` (
  `id` bigint(20) unsigned NOT NULL,
  `rule` longtext COMMENT '省份规则内容',
  `order_reduction_state` tinyint(1) unsigned DEFAULT '0' COMMENT '订单满减状态',
  `order_reduction_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '订单满减金额',
  `first_number` bigint(20) unsigned DEFAULT '0' COMMENT '首件数量',
  `first_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '首件邮费',
  `next_number` bigint(20) unsigned DEFAULT '0' COMMENT '续件数量',
  `next_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '续件邮费',
  `is_default` tinyint(1) unsigned DEFAULT '0' COMMENT '默认规则',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='商城-快递-模板';

-- --------------------------------------------------------

--
-- 表的结构 `wei_store_goods`
--

CREATE TABLE IF NOT EXISTS `wei_store_goods` (
  `id` bigint(20) unsigned NOT NULL,
  `cate_id` bigint(20) unsigned DEFAULT '0' COMMENT '商品分类',
  `title` text COMMENT '商品标题',
  `logo` text COMMENT '商品图标',
  `specs` text COMMENT '商品规格JSON',
  `lists` text COMMENT '商品列表JSON',
  `image` text COMMENT '商品图片',
  `content` longtext COMMENT '商品内容',
  `number_sales` bigint(20) unsigned DEFAULT '0' COMMENT '销售数量',
  `number_stock` bigint(20) unsigned DEFAULT '0' COMMENT '库库数量',
  `price_rate` decimal(20,4) unsigned DEFAULT '0.0000' COMMENT '返利比例',
  `price_express` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '统一运费',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '销售状态',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='商品-记录';

-- --------------------------------------------------------

--
-- 表的结构 `wei_store_goods_cate`
--

CREATE TABLE IF NOT EXISTS `wei_store_goods_cate` (
  `id` bigint(20) unsigned NOT NULL,
  `logo` varchar(500) DEFAULT '' COMMENT '分类图标',
  `title` varchar(255) DEFAULT '' COMMENT '分类名称',
  `desc` varchar(1024) DEFAULT '' COMMENT '分类描述',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '销售状态',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='商品-分类';

-- --------------------------------------------------------

--
-- 表的结构 `wei_store_goods_list`
--

CREATE TABLE IF NOT EXISTS `wei_store_goods_list` (
  `id` bigint(20) unsigned NOT NULL,
  `sku` varchar(20) DEFAULT '' COMMENT 'sku',
  `goods_id` bigint(20) unsigned DEFAULT '0' COMMENT '商品ID',
  `goods_spec` varchar(100) DEFAULT '' COMMENT '商品规格',
  `price_market` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '商品标价',
  `price_selling` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '商品售价',
  `number_sales` bigint(20) unsigned DEFAULT '0' COMMENT '销售数量',
  `number_stock` bigint(20) unsigned DEFAULT '0' COMMENT '商品库存',
  `number_virtual` bigint(20) unsigned DEFAULT '0' COMMENT '虚拟销量',
  `number_express` bigint(20) unsigned DEFAULT '1' COMMENT '快递数量',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '商品状态',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='商品-详情';

-- --------------------------------------------------------

--
-- 表的结构 `wei_store_goods_stock`
--

CREATE TABLE IF NOT EXISTS `wei_store_goods_stock` (
  `id` bigint(20) unsigned NOT NULL,
  `goods_id` bigint(20) unsigned DEFAULT '0' COMMENT '商品ID',
  `goods_spec` varchar(200) DEFAULT '' COMMENT '商品规格',
  `number_stock` bigint(20) unsigned DEFAULT '0' COMMENT '商品库存',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='商品-入库';

-- --------------------------------------------------------

--
-- 表的结构 `wei_store_member`
--

CREATE TABLE IF NOT EXISTS `wei_store_member` (
  `id` bigint(20) unsigned NOT NULL,
  `openid` varchar(100) DEFAULT '' COMMENT '微信OPENID',
  `headimg` varchar(512) DEFAULT '' COMMENT '头像地址',
  `nickname` varchar(100) DEFAULT '' COMMENT '微信昵称',
  `phone` varchar(20) DEFAULT '' COMMENT '联系手机',
  `username` varchar(50) DEFAULT '' COMMENT '真实姓名',
  `vip_level` tinyint(1) unsigned DEFAULT '0' COMMENT '会员级别(0游客,1为临时,2为VIP1,3为VIP2)',
  `vip_date` date DEFAULT NULL COMMENT '保级日期',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='会员-记录';

-- --------------------------------------------------------

--
-- 表的结构 `wei_store_member_address`
--

CREATE TABLE IF NOT EXISTS `wei_store_member_address` (
  `id` bigint(20) unsigned NOT NULL,
  `mid` bigint(20) unsigned DEFAULT '0' COMMENT '会员ID',
  `name` varchar(100) DEFAULT '' COMMENT '收货姓名',
  `phone` varchar(20) DEFAULT '' COMMENT '收货手机',
  `province` varchar(100) DEFAULT '' COMMENT '地址-省份',
  `city` varchar(100) DEFAULT '' COMMENT '地址-城市',
  `area` varchar(100) DEFAULT '' COMMENT '地址-区域',
  `address` varchar(255) DEFAULT '' COMMENT '地址-详情',
  `is_default` tinyint(1) unsigned DEFAULT '0' COMMENT '默认地址',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='会员-地址';

-- --------------------------------------------------------

--
-- 表的结构 `wei_store_member_sms_history`
--

CREATE TABLE IF NOT EXISTS `wei_store_member_sms_history` (
  `id` bigint(20) unsigned NOT NULL,
  `mid` bigint(20) unsigned DEFAULT '0' COMMENT '会员ID',
  `phone` varchar(20) DEFAULT '' COMMENT '目标手机',
  `content` varchar(512) DEFAULT '' COMMENT '短信内容',
  `region` varchar(100) DEFAULT '' COMMENT '区域编码',
  `result` varchar(100) DEFAULT '' COMMENT '返回结果',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='会员-短信';

-- --------------------------------------------------------

--
-- 表的结构 `wei_store_order`
--

CREATE TABLE IF NOT EXISTS `wei_store_order` (
  `id` bigint(20) unsigned NOT NULL,
  `mid` bigint(20) unsigned DEFAULT '0' COMMENT '会员ID',
  `order_no` bigint(20) unsigned DEFAULT '0' COMMENT '订单单号',
  `from_mid` bigint(20) unsigned DEFAULT '0' COMMENT '推荐会员ID',
  `price_total` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '待付金额统计',
  `price_goods` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '商品费用统计',
  `price_express` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '快递费用统计',
  `price_rate_amount` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '返利金额统计',
  `pay_state` tinyint(1) unsigned DEFAULT '0' COMMENT '支付状态(0未支付,1已支付)',
  `pay_type` varchar(10) DEFAULT '' COMMENT '支付方式',
  `pay_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '支付金额',
  `pay_no` varchar(100) DEFAULT '' COMMENT '支付单号',
  `pay_at` datetime DEFAULT NULL COMMENT '支付时间',
  `cancel_state` tinyint(1) unsigned DEFAULT '0' COMMENT '取消状态',
  `cancel_at` datetime DEFAULT NULL COMMENT '取消时间',
  `cancel_desc` varchar(500) DEFAULT '' COMMENT '取消描述',
  `refund_state` tinyint(1) unsigned DEFAULT '0' COMMENT '退款状态(0未退款,1待退款,2已退款)',
  `refund_at` datetime DEFAULT NULL COMMENT '退款时间',
  `refund_no` varchar(100) DEFAULT '' COMMENT '退款单号',
  `refund_price` decimal(20,2) DEFAULT '0.00' COMMENT '退款金额',
  `refund_desc` varchar(500) DEFAULT '' COMMENT '退款描述',
  `express_state` tinyint(1) unsigned DEFAULT '0' COMMENT '发货状态(0未发货,1已发货,2已签收)',
  `express_company_code` varchar(255) DEFAULT '' COMMENT '发货快递公司编码',
  `express_company_title` varchar(255) DEFAULT '' COMMENT '发货快递公司名称',
  `express_send_no` varchar(50) DEFAULT '' COMMENT '发货单号',
  `express_send_at` datetime DEFAULT NULL COMMENT '发货时间',
  `express_address_id` bigint(20) unsigned DEFAULT '0' COMMENT '收货地址ID',
  `express_name` varchar(255) DEFAULT '' COMMENT '收货人姓名',
  `express_phone` varchar(11) DEFAULT '' COMMENT '收货人手机',
  `express_province` varchar(255) DEFAULT '' COMMENT '收货地址省份',
  `express_city` varchar(255) DEFAULT '' COMMENT '收货地址城市',
  `express_area` varchar(255) DEFAULT '' COMMENT '收货地址区域',
  `express_address` varchar(255) DEFAULT '' COMMENT '收货详细地址',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '订单状态(0已取消,1预订单待补全,2新订单待支付,3已支付待发货,4已发货待签收,5已完成)',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='订单-记录';

-- --------------------------------------------------------

--
-- 表的结构 `wei_store_order_list`
--

CREATE TABLE IF NOT EXISTS `wei_store_order_list` (
  `id` bigint(20) unsigned NOT NULL,
  `mid` bigint(20) unsigned DEFAULT '0' COMMENT '会员ID',
  `from_id` bigint(20) unsigned DEFAULT '0' COMMENT '推荐会员',
  `order_no` bigint(20) unsigned DEFAULT '0' COMMENT '订单单号',
  `goods_id` bigint(20) unsigned DEFAULT '0' COMMENT '商品标识',
  `goods_title` varchar(255) DEFAULT '' COMMENT '商品标题',
  `goods_logo` varchar(500) DEFAULT '' COMMENT '商品图标',
  `goods_spec` varchar(100) DEFAULT '' COMMENT '商品规格',
  `price_real` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '交易金额',
  `price_selling` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '销售价格',
  `price_market` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '市场价格',
  `price_express` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '快递费用',
  `price_rate` decimal(20,4) unsigned DEFAULT '0.0000' COMMENT '分成比例',
  `price_rate_amount` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '分成金额',
  `number_goods` bigint(20) unsigned DEFAULT '0' COMMENT '商品数量',
  `number_express` bigint(20) unsigned DEFAULT '0' COMMENT '快递数量',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='订单-详情';

-- --------------------------------------------------------

--
-- 表的结构 `wei_system_auth`
--

CREATE TABLE IF NOT EXISTS `wei_system_auth` (
  `id` bigint(20) unsigned NOT NULL,
  `title` varchar(20) DEFAULT NULL COMMENT '权限名称',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '权限状态',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统-权限';

-- --------------------------------------------------------

--
-- 表的结构 `wei_system_auth_node`
--

CREATE TABLE IF NOT EXISTS `wei_system_auth_node` (
  `id` bigint(20) unsigned NOT NULL,
  `auth` bigint(20) unsigned DEFAULT NULL COMMENT '角色',
  `node` varchar(200) DEFAULT NULL COMMENT '节点'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统-权限-授权';

-- --------------------------------------------------------

--
-- 表的结构 `wei_system_config`
--

CREATE TABLE IF NOT EXISTS `wei_system_config` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(100) DEFAULT '' COMMENT '配置名',
  `value` varchar(500) DEFAULT '' COMMENT '配置值'
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统-配置';

--
-- 转存表中的数据 `wei_system_config`
--

INSERT INTO `wei_system_config` (`id`, `name`, `value`) VALUES
(1, 'app_name', 'ThinkAdmin'),
(2, 'site_name', 'ThinkAdmin'),
(3, 'app_version', 'dev'),
(4, 'site_copy', '©版权所有 2014-2018 楚才科技'),
(5, 'site_icon', '/upload/decb0fe26fa3f486/b3f6521bf29403c8.png'),
(7, 'miitbeian', '粤ICP备16006642号-2'),
(8, 'storage_type', 'local'),
(9, 'storage_local_exts', 'doc,gif,icon,jpg,mp3,mp4,p12,pem,png,rar'),
(10, 'storage_qiniu_bucket', 'https'),
(11, 'storage_qiniu_domain', '用你自己的吧'),
(12, 'storage_qiniu_access_key', '用你自己的吧'),
(13, 'storage_qiniu_secret_key', '用你自己的吧'),
(14, 'storage_oss_bucket', 'cuci-mytest'),
(15, 'storage_oss_endpoint', 'oss-cn-hangzhou.aliyuncs.com'),
(16, 'storage_oss_domain', '用你自己的吧'),
(17, 'storage_oss_keyid', '用你自己的吧'),
(18, 'storage_oss_secret', '用你自己的吧'),
(36, 'storage_oss_is_https', 'http'),
(43, 'storage_qiniu_region', '华东'),
(44, 'storage_qiniu_is_https', 'https'),
(45, 'wechat_mch_id', '1332187001'),
(46, 'wechat_mch_key', 'A82DC5BD1F3359081049C568D8502BC5'),
(47, 'wechat_mch_ssl_type', 'p12'),
(48, 'wechat_mch_ssl_p12', '65b8e4f56718182d/1bc857ee646aa15d.p12'),
(49, 'wechat_mch_ssl_key', 'cc2e3e1345123930/c407d033294f283d.pem'),
(50, 'wechat_mch_ssl_cer', '966eaf89299e9c95/7014872cc109b29a.pem'),
(51, 'wechat_token', 'mytoken'),
(52, 'wechat_appid', 'wx60a43dd8161666d4'),
(53, 'wechat_appsecret', '9978422e0e431643d4b42868d183d60b'),
(54, 'wechat_encodingaeskey', ''),
(55, 'wechat_push_url', '消息推送地址：http://127.0.0.1:8000/wechat/api.push'),
(56, 'wechat_type', 'thr'),
(57, 'wechat_thr_appid', 'wx60a43dd8161666d4'),
(58, 'wechat_thr_appkey', '5caf4b0727f6e46a7e6ccbe773cc955d'),
(60, 'wechat_thr_appurl', '消息推送地址：http://127.0.0.1:2314/wechat/api.push'),
(61, 'component_appid', 'wx28b58798480874f9'),
(62, 'component_appsecret', '8d0e1ec14ea0adc5027dd0ad82c64bc9'),
(63, 'component_token', 'P8QHTIxpBEq88IrxatqhgpBm2OAQROkI'),
(64, 'component_encodingaeskey', 'L5uFIa0U6KLalPyXckyqoVIJYLhsfrg8k9YzybZIHsx'),
(65, 'system_message_state', '0'),
(66, 'sms_zt_username', '可以找CUCI申请'),
(67, 'sms_zt_password', '可以找CUCI申请'),
(68, 'sms_reg_template', '您的验证码为{code}，请在十分钟内完成操作！'),
(69, 'sms_secure', '可以找CUCI申请'),
(70, 'store_title', '测试商城'),
(71, 'store_order_wait_time', '0.50'),
(72, 'store_order_clear_time', '24.00'),
(73, 'store_order_confirm_time', '60.00'),
(74, 'sms_zt_username2', '可以找CUCI申请2'),
(75, 'sms_zt_password2', '可以找CUCI申请2'),
(76, 'sms_secure2', '可以找CUCI申请2'),
(77, 'sms_reg_template2', '您的验证码为{code}，请在十分钟内完成操作！2'),
(78, 'michat_appid', '2882303761518074614'),
(79, 'michat_appkey', '5861807470614'),
(80, 'michat_appsecert', 'CP/WUTUgDuyOxgLQ5ztesg==');

-- --------------------------------------------------------

--
-- 表的结构 `wei_system_data`
--

CREATE TABLE IF NOT EXISTS `wei_system_data` (
  `id` bigint(11) unsigned NOT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '配置名',
  `value` longtext COMMENT '配置值'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统-数据';

--
-- 转存表中的数据 `wei_system_data`
--

INSERT INTO `wei_system_data` (`id`, `name`, `value`) VALUES
(1, 'menudata', '[{"name":"请输入名称","type":"scancode_push","key":"scancode_push"}]');

-- --------------------------------------------------------

--
-- 表的结构 `wei_system_log`
--

CREATE TABLE IF NOT EXISTS `wei_system_log` (
  `id` bigint(20) unsigned NOT NULL,
  `node` varchar(200) NOT NULL DEFAULT '' COMMENT '当前操作节点',
  `geoip` varchar(15) NOT NULL DEFAULT '' COMMENT '操作者IP地址',
  `action` varchar(200) NOT NULL DEFAULT '' COMMENT '操作行为名称',
  `content` varchar(1024) NOT NULL DEFAULT '' COMMENT '操作内容描述',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人用户名',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统-日志';

--
-- 转存表中的数据 `wei_system_log`
--

INSERT INTO `wei_system_log` (`id`, `node`, `geoip`, `action`, `content`, `username`, `create_at`) VALUES
(1, 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-09-22 16:44:11'),
(2, 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-09-23 08:20:58');

-- --------------------------------------------------------

--
-- 表的结构 `wei_system_menu`
--

CREATE TABLE IF NOT EXISTS `wei_system_menu` (
  `id` bigint(20) unsigned NOT NULL,
  `pid` bigint(20) unsigned DEFAULT '0' COMMENT '父ID',
  `title` varchar(100) DEFAULT '' COMMENT '名称',
  `node` varchar(200) DEFAULT '' COMMENT '节点代码',
  `icon` varchar(100) DEFAULT '' COMMENT '菜单图标',
  `url` varchar(400) DEFAULT '' COMMENT '链接',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) DEFAULT '_self' COMMENT '打开方式',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统-菜单';

--
-- 转存表中的数据 `wei_system_menu`
--

INSERT INTO `wei_system_menu` (`id`, `pid`, `title`, `node`, `icon`, `url`, `params`, `target`, `sort`, `status`, `create_at`) VALUES
(1, 0, '后台首页', '', '', 'admin/index/main', '', '_self', 500, 0, '2018-09-05 01:59:38'),
(2, 0, '系统管理', '', '', '#', '', '_self', 100, 1, '2018-09-05 02:04:52'),
(3, 4, '系统菜单管理', '', 'layui-icon layui-icon-layouts', 'admin/menu/index', '', '_self', 1, 1, '2018-09-05 02:05:26'),
(4, 2, '系统配置', '', '', '#', '', '_self', 20, 1, '2018-09-05 02:07:17'),
(5, 12, '系统用户管理', '', 'layui-icon layui-icon-username', 'admin/user/index', '', '_self', 1, 1, '2018-09-05 19:10:42'),
(7, 12, '访问权限管理', '', 'layui-icon layui-icon-vercode', 'admin/auth/index', '', '_self', 2, 1, '2018-09-05 23:17:14'),
(11, 4, '系统参数配置', '', 'layui-icon layui-icon-set', 'admin/config/info', '', '_self', 4, 1, '2018-09-06 00:43:47'),
(12, 2, '权限管理', '', '', '#', '', '_self', 10, 1, '2018-09-06 02:01:31'),
(13, 0, '商城管理', '', '', '#', '', '_self', 400, 0, '2018-10-11 21:56:29'),
(14, 48, '商品信息管理', '', 'layui-icon layui-icon-component', 'store/goods/index', '', '_self', 3, 0, '2018-10-11 21:56:48'),
(16, 0, '微信管理', '', '', '#', '', '_self', 300, 0, '2018-10-30 23:15:27'),
(17, 16, '微信管理', '', '', '#', '', '_self', 20, 0, '2018-10-30 23:16:46'),
(18, 17, '微信授权配置', '', 'layui-icon layui-icon-set', 'wechat/config/options', '', '_self', 2, 0, '2018-10-30 23:17:11'),
(19, 17, '微信支付配置', '', 'layui-icon layui-icon-rmb', 'wechat/config/payment', '', '_self', 1, 0, '2018-10-31 02:28:09'),
(20, 16, '微信定制', '', '', '#', '', '_self', 10, 0, '2018-11-12 19:46:27'),
(21, 20, '图文素材管理', '', 'layui-icon layui-icon-template', 'wechat/news/index', '', '_self', 6, 0, '2018-11-12 19:46:55'),
(22, 20, '粉丝信息管理', '', 'layui-icon layui-icon-user', 'wechat/fans/index', '', '_self', 5, 0, '2018-11-14 17:51:13'),
(23, 20, '回复规则管理', '', 'layui-icon layui-icon-engine', 'wechat/keys/index', '', '_self', 4, 0, '2018-11-21 19:29:08'),
(24, 20, '关注回复配置', '', 'layui-icon layui-icon-senior', 'wechat/keys/subscribe', '', '_self', 3, 0, '2018-11-26 19:45:28'),
(25, 20, '默认回复配置', '', 'layui-icon layui-icon-survey', 'wechat/keys/defaults', '', '_self', 2, 0, '2018-11-26 19:45:58'),
(26, 20, '微信菜单管理', '', 'layui-icon layui-icon-cellphone', 'wechat/menu/index', '', '_self', 1, 0, '2018-11-27 01:56:56'),
(27, 4, '系统任务管理', '', 'layui-icon layui-icon-log', 'admin/queue/index', '', '_self', 3, 1, '2018-11-28 19:13:34'),
(37, 0, '开放平台', '', '', '#', '', '_self', 200, 0, '2018-12-27 21:29:25'),
(38, 40, '开放平台配置', '', 'layui-icon layui-icon-set', 'service/config/index', '', '_self', 0, 0, '2018-12-27 21:29:44'),
(39, 40, '公众授权管理', '', 'layui-icon layui-icon-template-1', 'service/index/index', '', '_self', 0, 0, '2018-12-27 21:30:07'),
(40, 37, '平台管理', '', '', '#', '', '_self', 0, 0, '2018-12-28 00:05:46'),
(42, 48, '会员信息管理', '', 'layui-icon layui-icon-user', 'store/member/index', '', '_self', 1, 0, '2019-01-21 22:24:23'),
(43, 48, '订单记录管理', '', 'layui-icon layui-icon-template-1', 'store/order/index', '', '_self', 2, 0, '2019-01-21 22:46:22'),
(44, 48, '商品分类管理', '', 'layui-icon layui-icon-app', 'store/goods_cate/index', '', '_self', 4, 0, '2019-01-22 18:41:06'),
(45, 47, '商城参数配置', '', 'layui-icon layui-icon-set', 'store/config/index', '', '_self', 5, 0, '2019-01-24 00:47:33'),
(46, 47, '短信发送记录', '', 'layui-icon layui-icon-console', 'store/message/index', '', '_self', 4, 0, '2019-01-24 02:09:58'),
(47, 13, '商城配置', '', '', '#', '', '_self', 20, 0, '2019-01-25 00:47:49'),
(48, 13, '数据管理', '', '', '#', '', '_self', 10, 0, '2019-01-25 00:48:35'),
(49, 4, '系统日志管理', '', 'layui-icon layui-icon-form', 'admin/oplog/index', '', '_self', 2, 1, '2019-02-17 20:56:56'),
(50, 47, '快递公司管理', '', 'layui-icon layui-icon-form', 'store/express_company/index', '', '_self', 3, 0, '2019-04-01 01:10:59'),
(52, 47, '邮费模板管理', '', 'layui-icon layui-icon-fonts-clear', 'store/express_template/index', '', '_self', 1, 0, '2019-04-22 21:17:10'),
(55, 17, '微信数据统计', '', 'layui-icon layui-icon-chart-screen', 'wechat/index/index', '', '_self', 3, 0, '2019-06-14 23:03:51'),
(56, 40, '微信粉丝管理', '', 'layui-icon layui-icon-username', 'service/fans/index', '', '_self', 0, 0, '2019-07-22 17:57:24'),
(57, 0, '企业管理', '', '', '#', '', '_self', 150, 0, '2019-08-08 01:20:29'),
(58, 57, '基础管理', '', '', '#', '', '_self', 0, 0, '2019-08-08 01:20:42'),
(59, 58, '企业员工管理', '', 'layui-icon layui-icon-username', 'company/user/index', '', '_self', 0, 0, '2019-08-08 01:20:59'),
(60, 58, '仓库权限管理', '', 'layui-icon layui-icon-template-1', 'company/auth/index', '', '_self', 0, 0, '2019-08-08 02:39:37'),
(61, 58, '网络打卡管理', '', 'layui-icon layui-icon-engine', 'company/clock/index', '', '_self', 0, 0, '2019-08-08 22:44:23'),
(62, 0, '聊天管理', '', '', '#', '', '_self', 0, 1, '2019-09-20 17:30:38'),
(63, 62, '聊天记录管理', '', 'layui-icon layui-icon-user', 'admin/chatlog/index', '', '_self', 0, 1, '2019-09-20 17:31:49'),
(64, 62, '群组管理', '', 'layui-icon layui-icon-group', '/admin/chatgroup/index', '', '_self', 0, 1, '2019-09-20 22:28:01'),
(65, 62, '用户管理', '', '', 'store/member/index', '', '_self', 0, 1, '2019-09-23 09:21:36');

-- --------------------------------------------------------

--
-- 表的结构 `wei_system_message`
--

CREATE TABLE IF NOT EXISTS `wei_system_message` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '接收用户id',
  `from_id` int(11) NOT NULL COMMENT '来源相关用户id',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '添加好友附言',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0好友请求 1请求结果通知',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未处理 1同意 2拒绝',
  `read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未读 1已读，用来显示消息盒子数量',
  `time` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统消息表';

--
-- 转存表中的数据 `wei_system_message`
--

INSERT INTO `wei_system_message` (`id`, `user_id`, `from_id`, `group_id`, `remark`, `type`, `status`, `read`, `time`) VALUES
(1, 1, 2, 0, '是大多数', 0, 2, 1, 1567175841),
(2, 1, 2, 0, '水电费', 0, 2, 1, 1567176460),
(3, 1, 2, 0, '实打实的', 0, 2, 1, 1567176780),
(4, 1, 2, 0, '水电费', 0, 2, 1, 1567176868),
(5, 2, 1, 0, '', 1, 2, 1, 1567178431),
(6, 2, 1, 0, '', 1, 2, 1, 1567178528),
(7, 2, 1, 0, '', 1, 2, 1, 1567178533),
(8, 2, 1, 0, '', 1, 2, 1, 1567178631),
(9, 2, 1, 0, '', 1, 2, 1, 1567178663),
(10, 2, 1, 0, '', 1, 2, 1, 1567178664),
(11, 2, 1, 0, '', 1, 2, 1, 1567178665),
(12, 2, 1, 0, '', 1, 2, 1, 1567178752),
(13, 2, 1, 0, '', 1, 2, 1, 1567178803),
(14, 1, 2, 0, '1', 0, 0, 1, 1567178952),
(15, 1, 2, 0, '2', 0, 1, 1, 1567178956),
(16, 1, 2, 0, '3', 0, 2, 1, 1567178960),
(17, 1, 2, 0, '4', 0, 2, 1, 1567178964),
(18, 1, 2, 0, '5', 0, 2, 1, 1567178968),
(19, 1, 2, 0, '6', 0, 2, 1, 1567178982),
(20, 2, 1, 0, '', 1, 2, 1, 1567178989),
(21, 2, 1, 0, '', 1, 2, 1, 1567179102),
(22, 2, 1, 0, '', 1, 2, 1, 1567179155),
(23, 2, 1, 0, '', 1, 2, 1, 1567180288),
(24, 1, 2, 0, '都是', 0, 2, 1, 1567180884),
(25, 2, 1, 0, '', 1, 1, 1, 1567180902),
(26, 1, 2, 0, '是', 0, 2, 1, 1567181146),
(27, 2, 1, 0, '', 1, 1, 1, 1567181154),
(28, 2, 1, 0, '', 1, 2, 0, 1568817190),
(29, 2, 1, 0, '', 1, 2, 0, 1568817191),
(30, 2, 1, 0, '', 1, 2, 0, 1568817193),
(31, 2, 1, 0, '', 1, 2, 0, 1568817197),
(32, 2, 1, 0, '', 1, 2, 0, 1568817198),
(33, 2, 1, 0, '', 1, 2, 0, 1568817199),
(34, 2, 1, 0, '', 1, 2, 0, 1568817200);

-- --------------------------------------------------------

--
-- 表的结构 `wei_system_queue`
--

CREATE TABLE IF NOT EXISTS `wei_system_queue` (
  `id` bigint(20) NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '任务名称',
  `data` longtext NOT NULL COMMENT '执行参数',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '任务状态(1新任务,2处理中,3成功,4失败)',
  `preload` varchar(500) DEFAULT '' COMMENT '执行内容',
  `time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '执行时间',
  `double` tinyint(1) DEFAULT '1' COMMENT '单例模式',
  `desc` varchar(500) DEFAULT '' COMMENT '状态描述',
  `start_at` varchar(20) DEFAULT '' COMMENT '开始时间',
  `end_at` varchar(20) DEFAULT '' COMMENT '结束时间',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统-任务';

-- --------------------------------------------------------

--
-- 表的结构 `wei_system_user`
--

CREATE TABLE IF NOT EXISTS `wei_system_user` (
  `id` bigint(20) unsigned NOT NULL,
  `username` varchar(50) DEFAULT '' COMMENT '用户账号',
  `password` varchar(32) DEFAULT '' COMMENT '用户密码',
  `qq` varchar(16) DEFAULT '' COMMENT '联系QQ',
  `mail` varchar(32) DEFAULT '' COMMENT '联系邮箱',
  `phone` varchar(16) DEFAULT '' COMMENT '联系手机',
  `login_at` datetime DEFAULT NULL COMMENT '登录时间',
  `login_ip` varchar(255) DEFAULT '' COMMENT '登录IP',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `authorize` varchar(255) DEFAULT '' COMMENT '权限授权',
  `tags` varchar(255) DEFAULT '' COMMENT '用户标签',
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0禁用,1启用)',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除(1删除,0未删)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统-用户';

--
-- 转存表中的数据 `wei_system_user`
--

INSERT INTO `wei_system_user` (`id`, `username`, `password`, `qq`, `mail`, `phone`, `login_at`, `login_ip`, `login_num`, `authorize`, `tags`, `desc`, `status`, `is_deleted`, `create_at`) VALUES
(10000, 'admin', '21232f297a57a5a743894a0e4a801fc3', '22222222', '', '', '2019-09-23 16:20:58', '127.0.0.1', 663, '', '', '', 1, 0, '2015-11-12 23:14:22');

-- --------------------------------------------------------

--
-- 表的结构 `wei_wechat_fans`
--

CREATE TABLE IF NOT EXISTS `wei_wechat_fans` (
  `id` bigint(20) unsigned NOT NULL,
  `appid` varchar(50) DEFAULT '' COMMENT '公众号APPID',
  `unionid` varchar(100) DEFAULT '' COMMENT '粉丝unionid',
  `openid` varchar(100) DEFAULT '' COMMENT '粉丝openid',
  `tagid_list` varchar(100) DEFAULT '' COMMENT '粉丝标签id',
  `is_black` tinyint(1) unsigned DEFAULT '0' COMMENT '是否为黑名单状态',
  `subscribe` tinyint(1) unsigned DEFAULT '0' COMMENT '关注状态(0未关注,1已关注)',
  `nickname` varchar(200) DEFAULT '' COMMENT '用户昵称',
  `sex` tinyint(1) unsigned DEFAULT NULL COMMENT '用户性别(1男性,2女性,0未知)',
  `country` varchar(50) DEFAULT '' COMMENT '用户所在国家',
  `province` varchar(50) DEFAULT '' COMMENT '用户所在省份',
  `city` varchar(50) DEFAULT '' COMMENT '用户所在城市',
  `language` varchar(50) DEFAULT '' COMMENT '用户的语言(zh_CN)',
  `headimgurl` varchar(500) DEFAULT '' COMMENT '用户头像',
  `subscribe_time` bigint(20) unsigned DEFAULT '0' COMMENT '关注时间',
  `subscribe_at` datetime DEFAULT NULL COMMENT '关注时间',
  `remark` varchar(50) DEFAULT '' COMMENT '备注',
  `subscribe_scene` varchar(200) DEFAULT '' COMMENT '扫码关注场景',
  `qr_scene` varchar(100) DEFAULT '' COMMENT '二维码场景值',
  `qr_scene_str` varchar(200) DEFAULT '' COMMENT '二维码场景内容',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='微信-粉丝';

-- --------------------------------------------------------

--
-- 表的结构 `wei_wechat_fans_tags`
--

CREATE TABLE IF NOT EXISTS `wei_wechat_fans_tags` (
  `id` bigint(20) unsigned NOT NULL COMMENT '标签ID',
  `appid` varchar(50) DEFAULT '' COMMENT '公众号APPID',
  `name` varchar(35) DEFAULT NULL COMMENT '标签名称',
  `count` bigint(20) unsigned DEFAULT '0' COMMENT '总数',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='微信-粉丝-标签';

-- --------------------------------------------------------

--
-- 表的结构 `wei_wechat_keys`
--

CREATE TABLE IF NOT EXISTS `wei_wechat_keys` (
  `id` bigint(20) NOT NULL,
  `appid` char(100) DEFAULT '' COMMENT '公众号APPID',
  `type` varchar(20) DEFAULT '' COMMENT '类型(text,image,news)',
  `keys` varchar(100) DEFAULT NULL COMMENT '关键字',
  `content` text COMMENT '文本内容',
  `image_url` varchar(255) DEFAULT '' COMMENT '图片链接',
  `voice_url` varchar(255) DEFAULT '' COMMENT '语音链接',
  `music_title` varchar(100) DEFAULT '' COMMENT '音乐标题',
  `music_url` varchar(255) DEFAULT '' COMMENT '音乐链接',
  `music_image` varchar(255) DEFAULT '' COMMENT '缩略图片',
  `music_desc` varchar(255) DEFAULT '' COMMENT '音乐描述',
  `video_title` varchar(100) DEFAULT '' COMMENT '视频标题',
  `video_url` varchar(255) DEFAULT '' COMMENT '视频URL',
  `video_desc` varchar(255) DEFAULT '' COMMENT '视频描述',
  `news_id` bigint(20) unsigned DEFAULT NULL COMMENT '图文ID',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序字段',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0禁用,1启用)',
  `create_by` bigint(20) unsigned DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='微信-关键字';

-- --------------------------------------------------------

--
-- 表的结构 `wei_wechat_media`
--

CREATE TABLE IF NOT EXISTS `wei_wechat_media` (
  `id` bigint(20) unsigned NOT NULL,
  `appid` varchar(100) DEFAULT '' COMMENT '公众号ID',
  `md5` varchar(32) DEFAULT '' COMMENT '文件md5',
  `type` varchar(20) DEFAULT '' COMMENT '媒体类型',
  `media_id` varchar(100) DEFAULT '' COMMENT '永久素材MediaID',
  `local_url` varchar(300) DEFAULT '' COMMENT '本地文件链接',
  `media_url` varchar(300) DEFAULT '' COMMENT '远程图片链接',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='微信-素材';

-- --------------------------------------------------------

--
-- 表的结构 `wei_wechat_news`
--

CREATE TABLE IF NOT EXISTS `wei_wechat_news` (
  `id` bigint(20) unsigned NOT NULL,
  `media_id` varchar(100) DEFAULT '' COMMENT '永久素材MediaID',
  `local_url` varchar(300) DEFAULT '' COMMENT '永久素材显示URL',
  `article_id` varchar(60) DEFAULT '' COMMENT '关联图文ID(用英文逗号做分割)',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '是否删除',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='微信-图文';

-- --------------------------------------------------------

--
-- 表的结构 `wei_wechat_news_article`
--

CREATE TABLE IF NOT EXISTS `wei_wechat_news_article` (
  `id` bigint(20) unsigned NOT NULL,
  `title` varchar(50) DEFAULT '' COMMENT '素材标题',
  `local_url` varchar(300) DEFAULT '' COMMENT '永久素材显示URL',
  `show_cover_pic` tinyint(4) unsigned DEFAULT '0' COMMENT '显示封面(0不显示,1显示)',
  `author` varchar(20) DEFAULT '' COMMENT '文章作者',
  `digest` varchar(300) DEFAULT '' COMMENT '摘要内容',
  `content` longtext COMMENT '图文内容',
  `content_source_url` varchar(200) DEFAULT '' COMMENT '原文地址',
  `read_num` bigint(20) unsigned DEFAULT '0' COMMENT '阅读数量',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='微信-图文-文章';

-- --------------------------------------------------------

--
-- 表的结构 `wei_wechat_service_config`
--

CREATE TABLE IF NOT EXISTS `wei_wechat_service_config` (
  `id` bigint(20) unsigned NOT NULL,
  `authorizer_appid` varchar(100) DEFAULT '' COMMENT '公众号APPID',
  `authorizer_access_token` varchar(200) DEFAULT '' COMMENT '公众号授权Token',
  `authorizer_refresh_token` varchar(200) DEFAULT '' COMMENT '公众号刷新Token',
  `func_info` varchar(100) DEFAULT '' COMMENT '公众号集权',
  `nick_name` varchar(50) DEFAULT '' COMMENT '公众号昵称',
  `head_img` varchar(200) DEFAULT '' COMMENT '公众号头像',
  `expires_in` bigint(20) DEFAULT NULL COMMENT 'Token有效时间',
  `service_type` tinyint(2) DEFAULT NULL COMMENT '微信类型(0代表订阅号,2代表服务号,3代表小程序)',
  `service_type_info` tinyint(2) DEFAULT NULL COMMENT '公众号实际类型',
  `verify_type` tinyint(2) DEFAULT NULL COMMENT '公众号认证类型(-1代表未认证, 0代表微信认证)',
  `verify_type_info` tinyint(2) DEFAULT NULL COMMENT '公众号实际认证类型',
  `user_name` varchar(100) DEFAULT '' COMMENT '众众号原始账号',
  `alias` varchar(100) DEFAULT '' COMMENT '公众号别名',
  `qrcode_url` varchar(200) DEFAULT '' COMMENT '公众号二维码',
  `business_info` varchar(255) DEFAULT '',
  `principal_name` varchar(255) DEFAULT '' COMMENT '公司名称',
  `miniprograminfo` varchar(1024) DEFAULT '' COMMENT '小程序JSON',
  `idc` tinyint(1) unsigned DEFAULT NULL,
  `signature` text COMMENT '小程序的描述',
  `total` bigint(20) unsigned DEFAULT '0' COMMENT '统计调用次数',
  `appkey` varchar(32) DEFAULT '' COMMENT '应用接口KEY',
  `appuri` varchar(255) DEFAULT '' COMMENT '应用接口URI',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1正常授权,0取消授权)',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(0未删除,1已删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='微信-授权';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wei_archives`
--
ALTER TABLE `wei_archives`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `wei_category`
--
ALTER TABLE `wei_category`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `type` (`type`) USING BTREE;

--
-- Indexes for table `wei_chatgroup`
--
ALTER TABLE `wei_chatgroup`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `wei_chatlog`
--
ALTER TABLE `wei_chatlog`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fromid` (`fromid`) USING BTREE,
  ADD KEY `toid` (`toid`) USING BTREE;

--
-- Indexes for table `wei_chatuser`
--
ALTER TABLE `wei_chatuser`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `wei_company_user`
--
ALTER TABLE `wei_company_user`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `idx_company_user_nickname` (`nickname`) USING BTREE,
  ADD KEY `idx_company_user_svn_username` (`svn_username`) USING BTREE,
  ADD KEY `idx_company_user_deleted` (`is_deleted`) USING BTREE,
  ADD KEY `idx_company_user_status` (`status`) USING BTREE,
  ADD KEY `idx_company_user_type` (`user_type`) USING BTREE;

--
-- Indexes for table `wei_company_user_auth`
--
ALTER TABLE `wei_company_user_auth`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_company_user_auth_status` (`status`) USING BTREE,
  ADD KEY `idx_company_user_auth_deleted` (`is_deleted`) USING BTREE;

--
-- Indexes for table `wei_company_user_clock`
--
ALTER TABLE `wei_company_user_clock`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_company_user_clock_date` (`date`) USING BTREE,
  ADD KEY `idx_company_user_clock_uid` (`uid`) USING BTREE,
  ADD KEY `idx_company_user_clock_name` (`name`) USING BTREE;

--
-- Indexes for table `wei_friend`
--
ALTER TABLE `wei_friend`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `wei_friend_group`
--
ALTER TABLE `wei_friend_group`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `wei_groupdetail`
--
ALTER TABLE `wei_groupdetail`
  ADD KEY `groupid` (`groupid`) USING BTREE;

--
-- Indexes for table `wei_sms_code`
--
ALTER TABLE `wei_sms_code`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `wei_store_express_company`
--
ALTER TABLE `wei_store_express_company`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `wei_store_express_template`
--
ALTER TABLE `wei_store_express_template`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_store_express_template_is_default` (`is_default`) USING BTREE;

--
-- Indexes for table `wei_store_goods`
--
ALTER TABLE `wei_store_goods`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_store_goods_status` (`status`) USING BTREE,
  ADD KEY `idx_store_goods_cate_id` (`cate_id`) USING BTREE,
  ADD KEY `idx_store_goods_is_deleted` (`is_deleted`) USING BTREE;

--
-- Indexes for table `wei_store_goods_cate`
--
ALTER TABLE `wei_store_goods_cate`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_store_goods_cate_is_deleted` (`is_deleted`) USING BTREE,
  ADD KEY `idx_store_goods_cate_status` (`status`) USING BTREE;

--
-- Indexes for table `wei_store_goods_list`
--
ALTER TABLE `wei_store_goods_list`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_store_goods_list_id` (`goods_id`) USING BTREE,
  ADD KEY `idx_store_goods_list_spec` (`goods_spec`) USING BTREE,
  ADD KEY `idx_store_goods_list_status` (`status`) USING BTREE,
  ADD KEY `idx_store_goods_list_sku` (`sku`) USING BTREE;

--
-- Indexes for table `wei_store_goods_stock`
--
ALTER TABLE `wei_store_goods_stock`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_store_goods_stock_gid` (`goods_id`) USING BTREE,
  ADD KEY `idx_store_goods_stock_spec` (`goods_spec`(191)) USING BTREE;

--
-- Indexes for table `wei_store_member`
--
ALTER TABLE `wei_store_member`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_store_member_openid` (`openid`) USING BTREE,
  ADD KEY `idx_store_member_phone` (`phone`) USING BTREE,
  ADD KEY `idx_store_member_vip_level` (`vip_level`) USING BTREE;

--
-- Indexes for table `wei_store_member_address`
--
ALTER TABLE `wei_store_member_address`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_store_member_address_mid` (`mid`) USING BTREE,
  ADD KEY `idx_store_member_address_is_default` (`is_default`) USING BTREE;

--
-- Indexes for table `wei_store_member_sms_history`
--
ALTER TABLE `wei_store_member_sms_history`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_store_member_sms_history_phone` (`phone`) USING BTREE,
  ADD KEY `idx_store_member_sms_history_mid` (`mid`) USING BTREE;

--
-- Indexes for table `wei_store_order`
--
ALTER TABLE `wei_store_order`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_store_groups_order_mid` (`mid`) USING BTREE,
  ADD KEY `idx_store_groups_order_order_no` (`order_no`) USING BTREE,
  ADD KEY `idx_store_groups_order_pay_state` (`pay_state`) USING BTREE,
  ADD KEY `idx_store_groups_order_cancel_state` (`cancel_state`) USING BTREE,
  ADD KEY `idx_store_groups_order_refund_state` (`refund_state`) USING BTREE,
  ADD KEY `idx_store_groups_order_status` (`status`) USING BTREE,
  ADD KEY `idx_store_groups_order_pay_no` (`pay_no`) USING BTREE;

--
-- Indexes for table `wei_store_order_list`
--
ALTER TABLE `wei_store_order_list`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_store_goods_list_id` (`goods_id`) USING BTREE,
  ADD KEY `idx_store_goods_list_spec` (`goods_spec`) USING BTREE;

--
-- Indexes for table `wei_system_auth`
--
ALTER TABLE `wei_system_auth`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_system_auth_status` (`status`) USING BTREE,
  ADD KEY `idx_system_auth_title` (`title`) USING BTREE;

--
-- Indexes for table `wei_system_auth_node`
--
ALTER TABLE `wei_system_auth_node`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_system_auth_auth` (`auth`) USING BTREE,
  ADD KEY `idx_system_auth_node` (`node`(191)) USING BTREE;

--
-- Indexes for table `wei_system_config`
--
ALTER TABLE `wei_system_config`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_system_config_name` (`name`) USING BTREE;

--
-- Indexes for table `wei_system_data`
--
ALTER TABLE `wei_system_data`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_system_data_name` (`name`) USING BTREE;

--
-- Indexes for table `wei_system_log`
--
ALTER TABLE `wei_system_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `wei_system_menu`
--
ALTER TABLE `wei_system_menu`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_system_menu_node` (`node`(191)) USING BTREE,
  ADD KEY `idx_system_menu_status` (`status`) USING BTREE;

--
-- Indexes for table `wei_system_message`
--
ALTER TABLE `wei_system_message`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `wei_system_queue`
--
ALTER TABLE `wei_system_queue`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_system_queue_double` (`double`) USING BTREE,
  ADD KEY `idx_system_queue_time` (`time`) USING BTREE,
  ADD KEY `idx_system_queue_title` (`title`) USING BTREE,
  ADD KEY `idx_system_queue_create_at` (`create_at`) USING BTREE;

--
-- Indexes for table `wei_system_user`
--
ALTER TABLE `wei_system_user`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_system_user_username` (`username`) USING BTREE,
  ADD KEY `idx_system_user_status` (`status`) USING BTREE,
  ADD KEY `idx_system_user_deleted` (`is_deleted`) USING BTREE;

--
-- Indexes for table `wei_wechat_fans`
--
ALTER TABLE `wei_wechat_fans`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_wechat_fans_openid` (`openid`) USING BTREE,
  ADD KEY `idx_wechat_fans_unionid` (`unionid`) USING BTREE,
  ADD KEY `idx_wechat_fans_is_back` (`is_black`) USING BTREE,
  ADD KEY `idx_wechat_fans_subscribe` (`subscribe`) USING BTREE;

--
-- Indexes for table `wei_wechat_fans_tags`
--
ALTER TABLE `wei_wechat_fans_tags`
  ADD KEY `idx_wechat_fans_tags_id` (`id`) USING BTREE,
  ADD KEY `idx_wechat_fans_tags_appid` (`appid`) USING BTREE;

--
-- Indexes for table `wei_wechat_keys`
--
ALTER TABLE `wei_wechat_keys`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_wechat_keys_appid` (`appid`) USING BTREE,
  ADD KEY `idx_wechat_keys_type` (`type`) USING BTREE,
  ADD KEY `idx_wechat_keys_keys` (`keys`) USING BTREE;

--
-- Indexes for table `wei_wechat_media`
--
ALTER TABLE `wei_wechat_media`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_wechat_media_appid` (`appid`) USING BTREE,
  ADD KEY `idx_wechat_media_md5` (`md5`) USING BTREE,
  ADD KEY `idx_wechat_media_type` (`type`) USING BTREE,
  ADD KEY `idx_wechat_media_media_id` (`media_id`) USING BTREE;

--
-- Indexes for table `wei_wechat_news`
--
ALTER TABLE `wei_wechat_news`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_wechat_news_artcle_id` (`article_id`) USING BTREE,
  ADD KEY `idx_wechat_news_media_id` (`media_id`) USING BTREE;

--
-- Indexes for table `wei_wechat_news_article`
--
ALTER TABLE `wei_wechat_news_article`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `wei_wechat_service_config`
--
ALTER TABLE `wei_wechat_service_config`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `idx_wechat_service_config_authorizer_appid` (`authorizer_appid`) USING BTREE,
  ADD KEY `idx_wechat_service_config_status` (`status`) USING BTREE,
  ADD KEY `idx_wechat_service_config_is_deleted` (`is_deleted`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wei_archives`
--
ALTER TABLE `wei_archives`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wei_category`
--
ALTER TABLE `wei_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wei_chatgroup`
--
ALTER TABLE `wei_chatgroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '群组id',AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `wei_chatlog`
--
ALTER TABLE `wei_chatlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=126;
--
-- AUTO_INCREMENT for table `wei_chatuser`
--
ALTER TABLE `wei_chatuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `wei_company_user`
--
ALTER TABLE `wei_company_user`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wei_company_user_auth`
--
ALTER TABLE `wei_company_user_auth`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wei_company_user_clock`
--
ALTER TABLE `wei_company_user_clock`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wei_friend`
--
ALTER TABLE `wei_friend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `wei_friend_group`
--
ALTER TABLE `wei_friend_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wei_sms_code`
--
ALTER TABLE `wei_sms_code`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wei_store_express_company`
--
ALTER TABLE `wei_store_express_company`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `wei_store_express_template`
--
ALTER TABLE `wei_store_express_template`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wei_store_goods`
--
ALTER TABLE `wei_store_goods`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wei_store_goods_cate`
--
ALTER TABLE `wei_store_goods_cate`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wei_store_goods_list`
--
ALTER TABLE `wei_store_goods_list`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wei_store_goods_stock`
--
ALTER TABLE `wei_store_goods_stock`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wei_store_member`
--
ALTER TABLE `wei_store_member`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wei_store_member_address`
--
ALTER TABLE `wei_store_member_address`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wei_store_member_sms_history`
--
ALTER TABLE `wei_store_member_sms_history`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wei_store_order`
--
ALTER TABLE `wei_store_order`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wei_store_order_list`
--
ALTER TABLE `wei_store_order_list`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wei_system_auth`
--
ALTER TABLE `wei_system_auth`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wei_system_auth_node`
--
ALTER TABLE `wei_system_auth_node`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wei_system_config`
--
ALTER TABLE `wei_system_config`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `wei_system_data`
--
ALTER TABLE `wei_system_data`
  MODIFY `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wei_system_log`
--
ALTER TABLE `wei_system_log`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wei_system_menu`
--
ALTER TABLE `wei_system_menu`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `wei_system_message`
--
ALTER TABLE `wei_system_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `wei_system_queue`
--
ALTER TABLE `wei_system_queue`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wei_system_user`
--
ALTER TABLE `wei_system_user`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10001;
--
-- AUTO_INCREMENT for table `wei_wechat_fans`
--
ALTER TABLE `wei_wechat_fans`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wei_wechat_fans_tags`
--
ALTER TABLE `wei_wechat_fans_tags`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签ID';
--
-- AUTO_INCREMENT for table `wei_wechat_keys`
--
ALTER TABLE `wei_wechat_keys`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wei_wechat_media`
--
ALTER TABLE `wei_wechat_media`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wei_wechat_news`
--
ALTER TABLE `wei_wechat_news`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wei_wechat_news_article`
--
ALTER TABLE `wei_wechat_news_article`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wei_wechat_service_config`
--
ALTER TABLE `wei_wechat_service_config`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
