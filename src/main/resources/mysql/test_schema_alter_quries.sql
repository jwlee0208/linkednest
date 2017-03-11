ALTER TABLE tb_player_info add FOREIGN KEY (user_id) REFERENCES test.tb_user(user_id);


ALTER TABLE tb_attr_elem add FOREIGN KEY (attr_id) REFERENCES test.tb_attr(attr_id);


ALTER TABLE tb_attr_elem_map add FOREIGN KEY (attr_elem_id) REFERENCES test.tb_attr_elem(attr_elem_id);


ALTER TABLE `TB_USER` ADD COLUMN `nationality` VARCHAR(30) NULL AFTER `phone_no`, ADD COLUMN `language` CHAR(2) NULL AFTER `nationality`;


ALTER TABLE `TB_BOARD` CHANGE COLUMN `board_category` `board_category` VARCHAR(50) NULL DEFAULT NULL COMMENT '게시판 카테고리' AFTER `board_type`;


ALTER TABLE `TB_BOARD` CHANGE COLUMN `board_category` `board_category_id` INT NULL DEFAULT NULL COMMENT '게시판 카테고리' AFTER `board_id`;


ALTER TABLE `tb_player_info` CHANGE COLUMN `introduce` `introduce` LONGTEXT NULL DEFAULT NULL ;


ALTER TABLE `TB_BOARD_ARTICLE` CHANGE COLUMN `content` `content` LONGTEXT NULL DEFAULT NULL COMMENT '게시글 내용\n' ;


ALTER TABLE `TB_BOARD_CATEGORY` ADD COLUMN `create_user_id` VARCHAR(45) NULL AFTER `board_category_name`, ADD COLUMN `create_date` TIMESTAMP NULL AFTER `create_user_id`;

ALTER TABLE `jwlee0208`.`TB_USER` 
ADD COLUMN `fb_user_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '페이스북 사용자 아이디' AFTER `phone_no`,
ADD COLUMN `tw_user_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '트위터 사용자 아이디' AFTER `fb_user_id`;
