INSERT INTO Reservation VALUES ('1','2023-04-28','45051','46','816268195-7');
INSERT INTO Reservation VALUES ('2','2023-04-13','45036','42','319574956-4');
INSERT INTO Reservation VALUES ('3','2023-06-01','45085','38','385822452-9');
INSERT INTO Reservation VALUES ('4','2023-05-10','45063','32','645068151-9');
INSERT INTO Reservation VALUES ('5','2023-04-20','45043','22','813111322-1');
INSERT INTO Reservation VALUES ('6','2023-05-24','45077','40','419089712-4');
INSERT INTO Reservation VALUES ('7','2023-05-05','45058','7','680500806-9');
INSERT INTO Reservation VALUES ('8','2023-04-19','45042','49','199490187-X');
INSERT INTO Reservation VALUES ('9','2023-04-21','45044','20','291469644-2');
INSERT INTO Reservation VALUES ('10','2023-05-11','45064','41','785838146-6');
INSERT INTO Reservation VALUES ('11','2023-05-23','45076','5','876322583-2');
INSERT INTO Reservation VALUES ('12','2023-05-21','45074','22','548886946-8');
INSERT INTO Reservation VALUES ('13','2023-05-13','45066','43','122129388-5');
INSERT INTO Reservation VALUES ('14','2023-05-25','45078','6','398871562-X');
INSERT INTO Reservation VALUES ('15','2023-05-24','45077','26','946554247-4');
INSERT INTO Reservation VALUES ('16','2023-05-18','45071','26','918375802-X');
INSERT INTO Reservation VALUES ('17','2023-05-02','45055','10','848203730-7');
INSERT INTO Reservation VALUES ('18','2023-04-27','45051','33','764400937-X');
INSERT INTO Reservation VALUES ('19','2023-05-01','45054','48','934963542-9');
INSERT INTO Reservation VALUES ('20','2023-05-11','45064','31','890021515-9');
INSERT INTO Reservation VALUES ('21','2023-05-27','45073','16','374810360-3');
INSERT INTO Reservation VALUES ('22','2023-04-15','45038','36','922528486-1');
INSERT INTO Reservation VALUES ('23','2023-05-04','45057','37','659961744-1');
INSERT INTO Reservation VALUES ('24','2023-04-21','45044','36','996340112-0');
INSERT INTO Reservation VALUES ('25','2023-05-03','45056','15','648314470-9');
INSERT INTO Reservation VALUES ('26','2023-06-02','45086','28','822418417-X');
INSERT INTO Reservation VALUES ('27','2023-05-05','45058','35','617184627-9');
INSERT INTO Reservation VALUES ('28','2023-04-22','45045','42','149070964-9');
INSERT INTO Reservation VALUES ('29','2023-05-07','45053','38','697465398-0');
INSERT INTO Reservation VALUES ('30','2023-05-16','45069','21','488587439-4');
INSERT INTO Reservation VALUES ('31','2023-04-22','45045','43','026564100-4');
INSERT INTO Reservation VALUES ('32','2023-05-11','45064','5','106000244-2');
INSERT INTO Reservation VALUES ('33','2023-04-25','45048','13','076139067-7');
INSERT INTO Reservation VALUES ('34','2023-04-27','45043','32','311467988-9');
INSERT INTO Reservation VALUES ('35','2023-04-25','45048','13','431206102-5');
INSERT INTO Reservation VALUES ('36','2023-05-10','45063','21','228742729-5');
INSERT INTO Reservation VALUES ('37','2023-04-26','45049','17','186794611-4');
INSERT INTO Reservation VALUES ('38','2023-05-19','45072','45','314688084-9');
INSERT INTO Reservation VALUES ('39','2023-05-08','45061','24','151813419-X');
INSERT INTO Reservation VALUES ('40','2023-05-06','45059','37','065416790-7');
INSERT INTO Reservation VALUES ('41','2023-05-10','45063','33','966694353-0');
INSERT INTO Reservation VALUES ('42','2023-05-11','45064','23','370939279-9');
INSERT INTO Reservation VALUES ('43','2023-05-26','45079','18','497423628-8');
INSERT INTO Reservation VALUES ('44','2023-05-27','45081','44','376060112-X');
INSERT INTO Reservation VALUES ('45','2023-06-01','45085','45','014108164-3');
INSERT INTO Reservation VALUES ('46','2023-05-09','45062','35','063303873-3');
INSERT INTO Reservation VALUES ('47','2023-05-18','45071','16','287721822-8');
INSERT INTO Reservation VALUES ('48','2023-05-16','45069','29','257249462-0');
INSERT INTO Reservation VALUES ('49','2023-04-20','45043','10','897904342-2');
INSERT INTO Reservation VALUES ('50','2023-06-01','45085','45','195996972-2');

UPDATE reservation 
SET expiration_date = DATE_ADD(reservation_date, INTERVAL 7 DAY);

UPDATE reservation
set user_id = (select user_id 
		from user
        where school_id = 1
        order by rand()
        limit 1)
WHERE isbn IN (select distinct isbn
		from book b
        join user u on u.school_id = b.school_id
        where u.school_id = 1);
        
UPDATE reservation
set user_id = (select user_id 
		from user
        where school_id = 2
        order by rand()
        limit 1)
WHERE isbn IN (select distinct isbn
		from book b
        join user u on u.school_id = b.school_id
        where u.school_id = 2);
        
UPDATE reservation
set user_id = (select user_id 
		from user
        where school_id = 3
        order by rand()
        limit 1)
WHERE isbn IN (select distinct isbn
		from book b
        join user u on u.school_id = b.school_id
        where u.school_id = 3);
        
UPDATE reservation
set user_id = (select user_id 
		from user
        where school_id = 4
        order by rand()
        limit 1)
WHERE isbn IN (select distinct isbn
		from book b
        join user u on u.school_id = b.school_id
        where u.school_id = 4);
        
UPDATE reservation
set user_id = (select user_id 
		from user
        where school_id = 5
        order by rand()
        limit 1)
WHERE isbn IN (select distinct isbn
		from book b
        join user u on u.school_id = b.school_id
        where u.school_id = 5);