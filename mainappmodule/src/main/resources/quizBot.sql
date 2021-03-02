DROP SCHEMA IF EXISTS `quizBot`;

CREATE SCHEMA IF NOT EXISTS `quizBot`;

USE `quizBot` ;


CREATE TABLE IF NOT EXISTS `usr` (
`id` BIGINT NOT NULL AUTO_INCREMENT,
`telegramUserId` BIGINT NOT NULL,
PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `test` (
`id` BIGINT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(255) NOT NULL,
`description` VARCHAR(255) NOT NULL,
PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `score` (
`id` BIGINT NOT NULL AUTO_INCREMENT,
`fk_userId` BIGINT NOT NULL,
`fk_testId` BIGINT NOT NULL,
`score` INTEGER NOT NULL DEFAULT 0,

PRIMARY KEY (`id`),
    
CONSTRAINT `fk_score_to_usr` FOREIGN KEY
    (`fk_userId`) REFERENCES `usr` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
    
    CONSTRAINT `fk_score_to_test` FOREIGN KEY
    (`fk_testId`) REFERENCES `test` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS `question` (
`id` BIGINT NOT NULL AUTO_INCREMENT,
`theme` VARCHAR(20) NOT NULL,
`text` VARCHAR(255) NOT NULL,
`fk_testId` BIGINT NOT NULL,
    
PRIMARY KEY (`id`),
    
CONSTRAINT `fk_question_to_test` FOREIGN KEY
(`fk_testId`) REFERENCES `test` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS `answer` (
`id` BIGINT NOT NULL AUTO_INCREMENT,
`text` VARCHAR(255) NOT NULL,
`right` BOOLEAN NOT NULL,
`fk_questionId` BIGINT NOT NULL,
    
PRIMARY KEY (`id`),
    
CONSTRAINT `fk_answer_to_question` FOREIGN KEY
(`fk_questionId`) REFERENCES `question` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
);


INSERT INTO `test` (`id`, `name`, `description`) VALUES ('1', 'Блиц Крик', 'Вам приводится факт/цитата/фейл и вы должны его закончить');


INSERT INTO `question` (`id`, `theme`, `text`, `fk_testId`) VALUES ('1', 'Факты', 'Единсвтенный человеческий орган, который не тонет в воде - это ... ', '1');
INSERT INTO `question` (`id`, `theme`, `text`, `fk_testId`) VALUES ('2', 'Факты', 'Самки стрекоз иногда притворяются мертвыми, чтобы не общаться с ... ', '1');
INSERT INTO `question` (`id`, `theme`, `text`, `fk_testId`) VALUES ('3', 'Факты', 'Самым заразным источником распространения болезней являются ... ', '1');
INSERT INTO `question` (`id`, `theme`, `text`, `fk_testId`) VALUES ('4', 'Факты', 'Норвегия- одна из немногих стран, где иностранцы могут бесплатно получить ... ', '1');
INSERT INTO `question` (`id`, `theme`, `text`, `fk_testId`) VALUES ('5', 'Факты', 'До изобретения ластика люди стирали карандаш кусочками ... ', '1');
INSERT INTO `question` (`theme`, `text`, `fk_testId`) VALUES ('Факты', 'Актриса сыгравшая красного телепузика, до этого снималась в ... ', '1');
INSERT INTO `question` (`theme`, `text`, `fk_testId`) VALUES ('Факты', 'Киты могут 100 дней обходиться без ... ', '1');
INSERT INTO `question` (`theme`, `text`, `fk_testId`) VALUES ('Факты', 'В Тихом океане есть подводный ... ', '1');
INSERT INTO `question` (`theme`, `text`, `fk_testId`) VALUES ('Факты', 'Создатели "Звездных войн" придумали имя Чубака на основе русского слова ... ', '1');
INSERT INTO `question` (`theme`, `text`, `fk_testId`) VALUES ('Факты', 'Животное, которое дольше всех может не пить - это вовсе не верблюд, а ... ', '1');
INSERT INTO `question` (`theme`, `text`, `fk_testId`) VALUES ('Факты', 'В космосе чисто физически невозможно ... ', '1');


INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('легкие', '1', '1');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('самцами', '1', '2');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('наличные деньги', '1', '3');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('образование', '1', '4');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('хлеба', '1', '5');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('порно', '1', '6');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('сна', '1', '7');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('собака', '1', '8');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('крыса', '1', '9');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('крыса', '1', '10');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('плакать', '1', '11');
























