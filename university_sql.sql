
-- 创建university_schema
CREATE SCHEMA `university` DEFAULT CHARACTER SET utf8 ;

-- 创建department_table
CREATE TABLE `university`.`department` (
  `dept_name` VARCHAR(45) NOT NULL,       #定义department的三个属性：
  `building` VARCHAR(45) NULL,            #dept_name、building、budget
  `budget` MEDIUMINT UNSIGNED NULL,       #其中dept_name为key
  PRIMARY KEY (`dept_name`));

-- 创建student_table
CREATE TABLE `university`.`student` (
  `ID` INT NOT NULL,                      #定义student的五个属性：
  `name` VARCHAR(45) NULL,                #ID、name、sex、age、emotion_state、dept_name
  `sex` CHAR(1) NULL,                     #ID为key
  `age` INT UNSIGNED NULL,
  `emotion_state` VARCHAR(45) NULL,
  `dept_name` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_student_1_idx` (`dept_name` ASC),    
  CONSTRAINT `fk_student_1`
    FOREIGN KEY (`dept_name`)                          #外键为deptment
    REFERENCES `university`.`department` (`dept_name`) 
    ON DELETE SET NULL                                 #在主数据删除的时候，从属数据不会删除，只是将从属数据的关联属性字段设置成NULL，从而变为无主待关联数据
    ON UPDATE CASCADE);                                #主数据更新的时候，从属数据一并更新

-- 创建exam_table
CREATE TABLE `university`.`exam` (
  `student_ID` INT NOT NULL,               #定义exam的三个属性：
  `exam_name` VARCHAR(45) NOT NULL,        #student_ID、exam_name、grade
  `grade` INT UNSIGNED NULL,               #student_ID、exam_name均为key
  PRIMARY KEY (`student_ID`, `exam_name`),
  CONSTRAINT `fk_exam_1`
    FOREIGN KEY (`student_ID`)
    REFERENCES `university`.`student` (`ID`)  #外键为student
    ON DELETE CASCADE                         #主数据删除的时候，从属数据一并删除
    ON UPDATE CASCADE);                       #主数据更新的时候，从属数据一并更新