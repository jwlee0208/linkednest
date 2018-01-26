CREATE TABLE IF NOT EXISTS `TB_PROFILE` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '프로파일 아이디\n',
  `profile_type` char(1) NOT NULL DEFAULT '1' COMMENT '프로파일 타입 : {선수 : 1, 코치 : 2, 팀 : 3}',
  `cat_id1` char(8) DEFAULT NULL,
  `cat_id2` char(8) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL COMMENT '프로파일 제목',
  `name` varchar(150) DEFAULT NULL COMMENT '프로파일 명',
  `profile_img_path` varchar(200) DEFAULT NULL COMMENT '프로파일 이미지 경로',
  `introduce` text COMMENT '소개',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '생성 일자',
  `create_user_id` varchar(45) DEFAULT NULL COMMENT '생성 자',
  `status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `profile_id_UNIQUE` (`profile_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='프로파일 공통 테이블' AUTO_INCREMENT=65 ;



CREATE TABLE IF NOT EXISTS `TB_PROFILE_ATTR` (
  `profile_attr_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `profile_attr_name` varchar(100) NOT NULL,
  `cat_id` char(8) NOT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `create_user_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`profile_attr_id`),
  UNIQUE KEY `profile_attr_id_UNIQUE` (`profile_attr_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;


CREATE TABLE IF NOT EXISTS `TB_PROFILE_ATTR_ELEMENT` (
  `profile_attr_element_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profile_attr_id` int(11) DEFAULT NULL,
  `profile_attr_element_name` varchar(100) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `create_user_id` varchar(45) DEFAULT NULL,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`profile_attr_element_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;


CREATE TABLE IF NOT EXISTS `TB_PROFILE_ATTR_ELEMENT_MAP` (
  `profile_attr_element_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) DEFAULT NULL,
  `profile_attr_id` int(11) DEFAULT NULL,
  `profile_attr_name` varchar(100) DEFAULT NULL,
  `profile_attr_element_id` int(11) DEFAULT NULL,
  `profile_attr_element_name` varchar(100) DEFAULT NULL,
  `profile_attr_element_map_name` varchar(100) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `create_user_id` varchar(45) DEFAULT NULL,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`profile_attr_element_map_id`),
  UNIQUE KEY `profile_attr_element_map_id_UNIQUE` (`profile_attr_element_map_id`),
  KEY `profile_id_idx` (`profile_id`),
  KEY `profile_id4_idx` (`profile_id`),
  KEY `profile_id5_idx` (`profile_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=186 ;

CREATE TABLE IF NOT EXISTS `TB_PROFILE_CAREER` (
  `career_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `career_title` varchar(200) DEFAULT NULL,
  `career_description` text,
  `start_date` char(10) DEFAULT NULL,
  `end_date` char(10) DEFAULT NULL,
  `career_status` char(1) DEFAULT NULL,
  `career_seq` int(11) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `create_user_id` varchar(45) DEFAULT NULL,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`career_id`),
  UNIQUE KEY `career_id_UNIQUE` (`career_id`),
  KEY `profilel_id_idx` (`profile_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

CREATE TABLE IF NOT EXISTS `TB_PROFILE_PLAYER` (
  `profile_player_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `birth_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `height` varchar(20) NOT NULL,
  `weight` varchar(20) NOT NULL,
  `birth_place` varchar(100) DEFAULT NULL,
  `education` text,
  `hobbies` varchar(45) DEFAULT NULL,
  `favorite_food` varchar(45) DEFAULT NULL,
  `nationality` varchar(45) NOT NULL,
  `language` varchar(45) NOT NULL,
  PRIMARY KEY (`profile_player_id`),
  UNIQUE KEY `profile_player_id_UNIQUE` (`profile_player_id`),
  KEY `profile_id` (`profile_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='선수 프로파일 ' AUTO_INCREMENT=35 ;


CREATE TABLE IF NOT EXISTS `TB_PROFILE_STAT_FIELDER` (
  `stat_fielder_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `f_team_name` varchar(200) NOT NULL,
  `f_stat_year` char(8) DEFAULT NULL,
  `pos` char(2) DEFAULT NULL,
  `g` int(11) DEFAULT NULL,
  `gs` int(11) DEFAULT NULL,
  `inn` float DEFAULT NULL,
  `tc` int(11) DEFAULT NULL,
  `po` int(11) DEFAULT NULL,
  `a` int(11) DEFAULT NULL,
  `e` int(11) DEFAULT NULL,
  `dp` int(11) DEFAULT NULL,
  `sb` int(11) DEFAULT NULL,
  `cs` int(11) DEFAULT NULL,
  `sbpct` int(11) DEFAULT NULL,
  `pb` int(11) DEFAULT NULL,
  `c_wp` int(11) DEFAULT NULL,
  `fpct` float DEFAULT NULL,
  `rf` float DEFAULT NULL,
  `etc` text,
  `create_date` timestamp NULL DEFAULT NULL,
  `create_user_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`stat_fielder_id`),
  UNIQUE KEY `stat_fielder_id_UNIQUE` (`stat_fielder_id`),
  KEY `profile_id_idx` (`profile_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;


CREATE TABLE IF NOT EXISTS `TB_PROFILE_STAT_HITTER` (
  `stat_hitter_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `h_team_name` varchar(200) NOT NULL,
  `h_stat_year` char(8) DEFAULT NULL,
  `g` int(11) DEFAULT NULL,
  `ab` int(11) DEFAULT NULL,
  `r` int(11) DEFAULT NULL,
  `h` int(11) DEFAULT NULL,
  `two_b` int(11) DEFAULT NULL,
  `three_b` int(11) DEFAULT NULL,
  `hr` int(11) DEFAULT NULL,
  `rbi` int(11) DEFAULT NULL,
  `bb` int(11) DEFAULT NULL,
  `so` int(11) DEFAULT NULL,
  `sb` int(11) DEFAULT NULL,
  `cs` int(11) DEFAULT NULL,
  `avg` float DEFAULT NULL,
  `obp` float DEFAULT NULL,
  `slg` float DEFAULT NULL,
  `ops` float DEFAULT NULL,
  `etc` text,
  `create_date` timestamp NULL DEFAULT NULL,
  `create_user_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`stat_hitter_id`),
  UNIQUE KEY `stat_hitter_id_UNIQUE` (`stat_hitter_id`),
  KEY `profile_id_idx` (`profile_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;


CREATE TABLE IF NOT EXISTS `TB_PROFILE_STAT_PITCHER` (
  `stat_pitcher_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `p_team_name` varchar(100) NOT NULL,
  `p_stat_year` char(8) DEFAULT NULL,
  `inn` float DEFAULT NULL,
  `w` int(11) DEFAULT NULL,
  `l` int(11) DEFAULT NULL,
  `era` float DEFAULT NULL,
  `g` int(11) DEFAULT NULL,
  `gs` int(11) DEFAULT NULL,
  `sv` int(11) DEFAULT NULL,
  `svo` int(11) DEFAULT NULL,
  `ip` float DEFAULT NULL,
  `h` int(11) DEFAULT NULL,
  `r` int(11) DEFAULT NULL,
  `er` int(11) DEFAULT NULL,
  `hr` int(11) DEFAULT NULL,
  `bb` int(11) DEFAULT NULL,
  `so` int(11) DEFAULT NULL,
  `avg` float DEFAULT NULL,
  `whip` float DEFAULT NULL,
  `k` int(11) DEFAULT NULL,
  `etc` text,
  `create_date` timestamp NULL DEFAULT NULL,
  `create_user_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`stat_pitcher_id`),
  UNIQUE KEY `stat_pitcher_id_UNIQUE` (`stat_pitcher_id`),
  KEY `profile_id_idx` (`profile_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;


CREATE TABLE IF NOT EXISTS `TB_PROFILE_STREAM` (
  `stream_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `stream_title` varchar(200) NOT NULL,
  `stream_url` varchar(200) NOT NULL,
  PRIMARY KEY (`stream_id`),
  UNIQUE KEY `stream_id_UNIQUE` (`stream_id`),
  KEY `profile_id_idx` (`profile_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

CREATE TABLE IF NOT EXISTS `TB_PROFILE_TEAM` (
  `profile_team_id` int(11) NOT NULL AUTO_INCREMENT,
  `league_id` int(11) DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `established_date` timestamp NULL DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `create_user_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`profile_team_id`),
  UNIQUE KEY `profile_team_id_UNIQUE` (`profile_team_id`),
  KEY `profile_id_idx` (`profile_id`),
  KEY `profile_id5_idx` (`profile_id`),
  KEY `profile_id6_idx` (`profile_id`),
  KEY `profile_id7_idx` (`profile_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

CREATE TABLE IF NOT EXISTS `TB_CONTACT_INFO` (
  `contact_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `phone_no` varchar(20) DEFAULT NULL,
  `cell_phone_no` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website_url` varchar(200) DEFAULT NULL,
  `facebook_url` varchar(100) DEFAULT NULL,
  `twitter_url` varchar(100) DEFAULT NULL,
  `instagram_url` varchar(100) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`contact_info_id`),
  UNIQUE KEY `contact_info_id_UNIQUE` (`contact_info_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;


CREATE TABLE IF NOT EXISTS `TB_LEAGUE_INFO` (
  `league_id` int(11) NOT NULL AUTO_INCREMENT,
  `league_img_path` varchar(200) DEFAULT NULL,
  `league_type` varchar(12) DEFAULT NULL COMMENT 'pro, semipro, independence',
  `league_name` varchar(200) DEFAULT NULL,
  `league_division` varchar(45) DEFAULT NULL,
  `commissioner` varchar(45) DEFAULT NULL,
  `introduce` text,
  `league_website_url` varchar(200) DEFAULT NULL,
  `joined_team_cnt` varchar(45) DEFAULT NULL,
  `established_date` timestamp NULL DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL COMMENT '대륙 구분 : 아시아, 유럽, 아프리카, 아메리카, 오세아니아',
  `country` char(2) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `create_user_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`league_id`),
  UNIQUE KEY `league_id_UNIQUE` (`league_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;


