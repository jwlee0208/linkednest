-- tb_board  table creation
CREATE TABLE `TB_BOARD` (
  `board_id` int(11) NOT NULL AUTO_INCREMENT,
  `board_category_id` int(11) DEFAULT NULL,
  `board_name` varchar(45) DEFAULT NULL,
  `board_type` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT '0 : 기본 게시판, 1: 이미지 게시판',
  `create_user_id` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `create_user_name` varchar(45) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_user_id` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `modify_user_name` varchar(45) DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  PRIMARY KEY (`board_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- tb_board_article table creation
CREATE TABLE `TB_BOARD_ARTICLE` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '게시글 아이디',
  `board_id` int(11) DEFAULT NULL COMMENT '게시판 아이디',
  `title` varchar(45) DEFAULT NULL COMMENT '게시글 제목\n',
  `content` text COMMENT '게시글 내용\n',
  `file_path` varchar(200) DEFAULT NULL COMMENT '썸네일 파일 경로\n',
  `original_file_name` varchar(100) DEFAULT NULL COMMENT '썸네일 파일 명',
  `author_id` varchar(45) DEFAULT NULL COMMENT '작성자 아이디',
  `author_nm` varchar(45) DEFAULT NULL COMMENT '작성자 이름',
  `create_date` datetime DEFAULT NULL COMMENT '작성 일자',
  `status` int(1) DEFAULT '1' COMMENT '게시글 상태값(0 : 삭제, 1 : 저장, 2 : 임시저장) ',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

-- tb_user table creation
CREATE TABLE `TB_USER` (
  `user_id` varchar(50) NOT NULL,
  `user_nm` varchar(100) NOT NULL,
  `passwd` varchar(100) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone_no` varchar(45) DEFAULT NULL,
  `join_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- tb_prohibited_word table creation
CREATE TABLE `TB_PROHIBITED_WORD` (
  `prohibited_word_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '금칙어 아이디',
  `prohibited_word_str` varchar(100) DEFAULT NULL COMMENT '''금칙어''',
  `create_user_id` varchar(45) DEFAULT NULL COMMENT '''금칙어 생성자 아이디''',
  `create_user_nm` varchar(45) DEFAULT NULL COMMENT '''금칙어 생성자 명''',
  `create_date` datetime DEFAULT NULL COMMENT '금칙어 생성 일자',
  PRIMARY KEY (`prohibited_word_id`),
  UNIQUE KEY `prohibited_word_id_UNIQUE` (`prohibited_word_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='금칙어 관리';




-- this queries is for testing about 'searching category's attribute' 
-- tb_category table creation
CREATE TABLE `TB_CATEGORY` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '카테고리 아이디',
  `parent_cat_id` varchar(45) DEFAULT NULL COMMENT '''상위 카테고리 아이디''',
  `cat_name` varchar(45) DEFAULT NULL COMMENT '''카테고리 이름''',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '''생성일자''',
  `create_user_id` varchar(45) DEFAULT NULL COMMENT '''생성자 아이디''',
  `create_user_name` varchar(200) DEFAULT NULL COMMENT '''생성자 이름''',
  `modify_user_id` varchar(45) DEFAULT NULL COMMENT '''수정자 아이디''',
  `modify_user_name` varchar(200) DEFAULT NULL COMMENT '''수정자 이름''',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='카테고리 테이블';



-- tb_attr table creation
CREATE TABLE `TB_ATTR` (
  `attr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '속성 아이디(하위 카테고리 아이디에 연결되는 아이디)',
  `cat_id` int(11) DEFAULT NULL COMMENT '카테고리 아이디(최 하위 카테고리 아이디)',
  `attr_name` varchar(45) DEFAULT NULL COMMENT '''속성 이름''',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '생성일자',
  `create_user_id` varchar(45) DEFAULT NULL COMMENT '생성자 아이디',
  `create_user_name` varchar(200) DEFAULT NULL COMMENT '생성자 이름',
  `modify_date` timestamp NULL DEFAULT NULL COMMENT '수정일자',
  `modify_user_id` varchar(45) DEFAULT NULL COMMENT '수정자 아이디',
  `modify_user_name` varchar(200) DEFAULT NULL COMMENT '수정자 이름',
  PRIMARY KEY (`attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='속성 테이블(최하위 카테고리에 종속적인 속성 관리 테이블)';

-- tb_attr_elem table creation
CREATE TABLE `TB_ATTR_ELEM` (
  `attr_elem_id` int(11) NOT NULL AUTO_INCREMENT,
  `attr_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `attr_elem_name` varchar(200) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `create_user_id` varchar(45) DEFAULT NULL,
  `create_user_name` varchar(200) DEFAULT NULL,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user_id` varchar(45) DEFAULT NULL,
  `modify_user_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`attr_elem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- tb_attr_elem_map table creation
CREATE TABLE `TB_ATTR_ELEM_MAP` (
  `attr_elem_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `attr_id` int(11) DEFAULT NULL,
  `attr_elem_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `user_id` varchar(45) DEFAULT NULL,
  `user_name` varchar(200) DEFAULT NULL,
  `attr_elem_map_name` varchar(200) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `create_user_id` varchar(45) DEFAULT NULL,
  `create_user_name` varchar(200) DEFAULT NULL,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user_id` varchar(45) DEFAULT NULL,
  `modify_user_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`attr_elem_map_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- tb_player_info table creation
CREATE TABLE `TB_PLAYER_INFO` (
  `player_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) DEFAULT NULL,
  `cat_id1` int(11) DEFAULT NULL,
  `cat_id2` int(11) DEFAULT NULL,
  PRIMARY KEY (`player_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- tb_player_video_link table creation
CREATE TABLE `TB_PLAYER_VIDEO_LINK` (
  `player_video_link_id` int(11) NOT NULL AUTO_INCREMENT,
  `player_info_id` int(11) NOT NULL,
  `link_url` varchar(500) DEFAULT NULL,
  `seq` smallint(6) DEFAULT '1',
  PRIMARY KEY (`player_video_link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- tb_code table creation
CREATE TABLE `test`.`TB_CODE` (
  `code_id` INT NOT NULL AUTO_INCREMENT,
  `code_name` VARCHAR(100) NULL,
  `code_value` VARCHAR(45) NULL,
  `code_type` CHAR(2) NULL COMMENT '01 : 국가, 02: 언어',
  `create_date` TIMESTAMP NULL,
  PRIMARY KEY (`code_id`));
  
-- tb_board_category table creation
CREATE TABLE `test`.`TB_BOARD_CATEGORY` (
  `board_category_id` INT NOT NULL,
  `board_category_name` VARCHAR(50) NULL,
  PRIMARY KEY (`board_category_id`));  
  
-- tb_share table creation
CREATE TABLE `TB_SHARE` (
  `share_id` int(11) NOT NULL AUTO_INCREMENT,
  `share_name` varchar(200) NOT NULL,
  `share_type` char(1) DEFAULT '1' COMMENT '''쉐어 타입(블로그 타입을 구분) : default는 1''',
  `introduce` longtext,
  `user_id` varchar(45) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`share_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='쉐어(블로그) 정보'; 

-- tb_slideshare_link table creation
CREATE TABLE `TB_SLIDESHARE_LINK` (
  `slide_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `slideshare_link_url` varchar(2000) COLLATE utf8_bin NOT NULL,
  `create_user_id` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`slide_id`),
  UNIQUE KEY `slide_id_UNIQUE` (`slide_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='slideshare link table';


-- tb_web_bookmark table creation
CREATE TABLE `test`.`TB_WEB_BOOKMARK` (
  `web_bookmark_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(50) NOT NULL,
  `bookmark_url` VARCHAR(200) NOT NULL,
  `bookmark_name` VARCHAR(100) NULL,
  `bookmark_description` VARCHAR(45) NULL,
  `create_date` TIMESTAMP NULL,
  `modify_date` TIMESTAMP NULL,
  PRIMARY KEY (`web_bookmark_id`),
  UNIQUE INDEX `web_bookmark_id_UNIQUE` (`web_bookmark_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '웹 북마크 테이블';
