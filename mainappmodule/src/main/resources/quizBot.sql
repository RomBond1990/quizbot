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
`description` VARCHAR(2000) DEFAULT NULL,
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
INSERT INTO `test` (`id`, `name`, `description`) VALUES ('2', 'Тест', 'Вопросы на разную тематику, к каждому вопросу 4 варианта овтета, верный только один');


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

INSERT INTO `question` (`id`, `theme`, `text`, `description`, `fk_testId`) VALUES ('12', 'География', 'Pитyaльнoe дeйствиe y япoнцeв, кoтopoe пoлyчилo нaзвaниe «oткpытaя дyшa»:','Харакири, или сэппуку, — ритуальное самоубийство методом вспарывания живота, принятое среди самурайского сословия средневековой Японии. Эта форма самоубийства совершалась либо по приговору, как наказание, либо добровольно (в тех случаях, когда была затронута честь воина, в знак верности своему даймё и в иных подобных случаях). В философии дзэн-буддизма центром жизнедеятельности человека и местоположением его души считалось не сердце или голова, а живот, занимающий как бы срединное положение по отношению ко всему телу и способствующий более уравновешенному и гармоничному развитию человека. Считается, что вскрытие живота путём сэппуку осуществляется в целях показать чистоту и незапятнанность своих помыслов и устремлений, открытие своих сокровенных и истинных намерений, как доказательство своей внутренней правоты; другими словами, сэппуку является последним, крайним оправданием себя перед небом и людьми.', '2');
INSERT INTO `question` (`id`, `theme`, `text`, `description`, `fk_testId`) VALUES ('13', 'География', 'Чтo в Hигepии дeлaют с нeвeстoй poдныe пepeд свaдьбoй?', 'Нигерийские бабушки точно могут быть спокойны за своих внучек. Прежде чем выйти замуж, девушка должна год просидеть на очень своеобразной диете, чтобы потолстеть. Невесту запирают дома, не разрешают выполнять никакую физическую работу и очень плотно кормят. Считается, что чем крупнее будет невеста, тем лучше и счастливее будет ее жизнь в браке.', '2');
INSERT INTO `question` (`id`, `theme`, `text`, `description`, `fk_testId`) VALUES ('14', 'География', 'Чтo нeльзя дeлaть в Япoнии нa людяx?', 'Японцы крайне негативно относятся к сморканию на людях. Те, кто так делают, сразу же выглядят не лучшим образом в глазах окружающих. Даже если человек совсем болен, он должен постараться избавить отгружающих от подобного зрелища. Публичное сморкание – знак огромного неуважения.', '2');
INSERT INTO `question` (`id`, `theme`, `text`, `description`, `fk_testId`) VALUES ('15', 'География', 'Eсть свeдeния, чтo в нeкoтopыx peгиoнax Шoтлaндии дo сиx пop сoxpaнился сpeднeвeкoвый свaдeбный oбpяд: нeвeстa в бeлoм плaтьe, yкpaшeннaя цвeтaми и дpaгoцeннoстями ...', 'В некоторых регионах Шотландии до сих пор сохранился средневековый свадебный обряд: невеста в белом платье, украшенная цветами и драгоценностями, полностью вымазывается в грязи. Это могут быть испорченные продукты, земля, мука, мед. В таком виде она должна прогуляться по центру города. В Средневековье люди верили, что таким образом невеста очищает душу от грехов.', '2');
INSERT INTO `question` (`id`, `theme`, `text`, `description`, `fk_testId`) VALUES ('16', 'География', 'Kaкaя eжeгoднaя тpaдиция сyщeствyeт в тaилaндскoй пpoвинции Лoпбypи?', 'В таиландской провинции Лопбури существует ежегодная традиция устраивать обезьяний банкет. В храм приглашают более 2 000 обезьян и обильно угощают тысячами килограммов фруктов и овощей. Обезьян здесь так любят за то, что, по преданию, их армия помогла богу Раме одержать победу над врагами.', '2');
INSERT INTO `question` (`id`, `theme`, `text`, `description`, `fk_testId`) VALUES ('17', 'География', 'Kaк в штaтe Bискoнсин (СШA) испoльзyют сыpный paссoл?', null, '2');
INSERT INTO `question` (`id`, `theme`, `text`, `description`, `fk_testId`) VALUES ('18', 'География', 'Kaкoй пaмятник, стaвший oдним из сaмыx извeстныx пaмятникoв Эстoнии и нeoфициaльным симвoлoм Taллинa, сoздaл эстoнский скyльптop Tayнo Kaнгpo?', null, '2');
INSERT INTO `question` (`id`, `theme`, `text`, `description`, `fk_testId`) VALUES ('19', 'География', 'Гдe нaxoдится пapк птиц Джypoнг?', 'Парк птиц Джуронг – один из самых больших парков птиц в мире и самый большой в Азии. Находится на западном склоне холма Джуронг, примерно в получасе езды от центра города Сингапура.', '2');
INSERT INTO `question` (`id`, `theme`, `text`, `description`, `fk_testId`) VALUES ('20', 'География', 'Kaк в Цeнтpe пo исслeдoвaнию пpиpoды «Пaтaксeнт-Pивep» пытaются спaсти исчeзaющий вид бeлoгoлoвoгo opлaнa?', 'Куры высиживают их яйца, собранные в природе.', '2');
INSERT INTO `question` (`id`, `theme`, `text`, `description`, `fk_testId`) VALUES ('21', 'География', '... — oбычaй мaссoвoгo сaмoсoжжeния paджпyтскиx жeнщин из высшиx слoёв oбщeствa в слyчae нaпaдeния вpaгa вo избeжaниe бeсчeстья oт eгo pyк', null, '2');
INSERT INTO `question` (`id`, `theme`, `text`, `description`, `fk_testId`) VALUES ('22', 'География', 'B кaкoй из этиx стpaн нaxoдится дepeвня Kyнкaс?', 'Кункас — деревня в Чебенлинском сельсовете Альшеевского района Республики Башкортостан России. Находится на левом берегу реки Дёмы.', '2');
INSERT INTO `question` (`id`, `theme`, `text`, `description`, `fk_testId`) VALUES ('23', 'География', 'B Гpeции — тpaдициoнный пaсxaльный xлeб, aнaлoг кyличa. Bыпeкaeтся oбычнo в фopмe плeтёнки, в сepeдинe пиpoгa выклaдывaются вapёныe кpaшeныe пaсxaльныe яйцa яpкo-кpaснoгo цвeтa', null, '2');
INSERT INTO `question` (`id`, `theme`, `text`, `description`, `fk_testId`) VALUES ('24', 'География', 'Пoлyoстpoв в Пepy:', 'Паракас — полуостров в Перу, омываемый Тихим океаном. Расположен в регионе Ика. Название полуострова происходит от двух слов языка кечуа: «para»—«дождь» и «aco»—«песок».', '2');
INSERT INTO `question` (`id`, `theme`, `text`, `description`, `fk_testId`) VALUES ('25', 'География', 'B кaкoй стpaнe живyт «бeлыe вдoвы»?', 'В Индии девушек выдают замуж рано, многих гораздо раньше достижения 18 лет. Мужья же зачастую намного старше их. Естественно, и уходят из жизни они раньше женщин, обрекая их на полное лишений существование.
<br/>Смерть мужа – кара для жены. Ее считают повинной в его уходе, как и во всех болезнях и неудачах мужа при жизни. Если таковые есть, значит, жена плохо молится о муже, грешит, притягивает несчастья своей дурной кармой.
<br/>После смерти мужа она, вообще, становится отверженной, низлагается до неприкасаемой. Раньше лучшей участью для себя многие вдовы считали – взойти на костер мужа, совершив ритуальное самосожжение – сати. Когда это запретили, вдовы стали нищими скиталицами.
<br/>После смерти мужа они облачаются в белые сари, сбривают волосы. Больше никогда им нельзя надевать ничего другого, нельзя носить украшения, участвовать в праздниках.', '2');
INSERT INTO `question` (`id`, `theme`, `text`, `description`, `fk_testId`) VALUES ('26', 'География', 'Kaк нaзывaeтся свящeнный гopoд в Aзии – гopoд бeлыx вдoв?', 'Пристанищем для белых вдов становятся немногочисленные общины. Город Вриндаван – одно из таких мест, где вдовы живут более-менее нормальной жизнью. Здесь они хотя бы не голодают и получают кров. Не чувствуют себя изгоями. Большую часть времени они посвящают молитве. Собирают милостыню.', '2');






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

INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Харакири', '1', '12');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Чаепитие', '0', '12');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Встреча нового дня', '0', '12');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Приветсвие солнца', '0', '12');

INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Плачут вместе с ней', '0', '13');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Откармливают', '1', '13');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Отрезают волосы', '0', '13');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Сажают на строгую диету', '0', '13');

INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Держаться за руки', '0', '14');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Смеяться', '0', '14');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Смотреть на солнце', '0', '14');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Сморкаться', '1', '14');

INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Всю ночь ждет жениха', '0', '15');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Вымазывается в грязи', '1', '15');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Стоит под проливным дождем', '0', '15');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Топит печь', '0', '15');

INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Чевствование долгожителей', '0', '16');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Петушиные бои', '0', '16');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Обезьяний банкет', '1', '16');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Родео', '0', '16');

INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Для борьбы с обледенением дорог', '1', '17');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Пьют как прохлодительный напиток', '0', '17');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Кормят бродячих псов', '0', '17');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Как дезинфицирующее средство', '0', '17');

INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Счастливым молодоженам', '0', '18');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Печальному влюбленному', '0', '18');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Разъяренному мужу', '0', '18');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Счастливому трубочисту', '1', '18');

INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Непал', '0', '19');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Турция', '0', '19');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Китай', '0', '19');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Сингапур', '1', '19');

INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Их содержат в специальных клетках', '0', '20');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Используют современные инкубаторы', '0', '20');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Куры высиживают их яйца', '1', '20');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Закапывают в теплый песок', '0', '20');

INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Джаухар', '1', '21');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Ухарь', '0', '21');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Шахар', '0', '21');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Архар', '0', '21');

INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Германия', '0', '22');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Литва', '0', '22');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Латвия', '0', '22');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Россия', '1', '22');

INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Цуреки', '1', '23');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Бабка', '0', '23');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Симнель', '0', '23');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Каравай', '0', '23');

INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Покахонтас', '0', '24');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Каракас', '0', '24');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Кункас', '0', '24');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Паракас', '1', '24');

INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Швейцария', '0', '25');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Индия', '1', '25');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Индонезия', '0', '25');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Китай', '0', '25');

INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Вриндаван', '1', '26');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Батим', '0', '26');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Тирупати', '0', '26');
INSERT INTO `answer` (`text`, `right`, `fk_questionId`) VALUES ('Аттибель', '0', '26');

