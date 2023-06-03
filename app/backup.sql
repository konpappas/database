-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: schoollibrary
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Clifford','Maudsley'),(2,'Angie','Gonnin'),(3,'Brewster','Zimmer'),(4,'Franchot','Daen'),(5,'Marti','Boome'),(6,'Rheta','Trengrouse'),(7,'Timothea','Reade'),(8,'Arnoldo','Youd'),(9,'Manya','Merrifield'),(10,'Cher','Ondracek');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `authors_and_professors`
--

DROP TABLE IF EXISTS `authors_and_professors`;
/*!50001 DROP VIEW IF EXISTS `authors_and_professors`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `authors_and_professors` AS SELECT 
 1 AS `author_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `isbn` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `publisher` varchar(50) NOT NULL,
  `pages` int NOT NULL,
  `summary` text NOT NULL,
  `available_copies` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `keywords` varchar(100) DEFAULT NULL,
  `category_id` int NOT NULL,
  `author_id` int NOT NULL,
  `sec_category_id` int DEFAULT NULL,
  `school_id` int DEFAULT NULL,
  PRIMARY KEY (`isbn`),
  KEY `school_id` (`school_id`),
  KEY `category_id` (`category_id`),
  KEY `sec_category_id` (`sec_category_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE,
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE,
  CONSTRAINT `book_ibfk_3` FOREIGN KEY (`sec_category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE,
  CONSTRAINT `book_ibfk_4` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`) ON DELETE CASCADE,
  CONSTRAINT `available_copies` CHECK ((`available_copies` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('011566924-8','Suicide Shop, The  ','HILL COUNTRY ESSENTIALS',559,'fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id',7,'http://dummyimage.com/222x100.png/cc0000/ffffff','Gagauz','magna bibendum imperdiet nullam orci',9,8,7,2),('014108164-3','Journey to Saturn (Rejsen til Saturn)','Pramosone',643,'vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo',7,'http://dummyimage.com/181x100.png/5fa2dd/ffffff','Thai','ipsum primis in faucibus',5,7,4,1),('026564100-4','Girl Next Door, The','Quinapril',425,'nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio',4,'http://dummyimage.com/181x100.png/cc0000/ffffff','Korean','iaculis justo in',6,8,7,2),('044983320-8','Moment After, The','Home Care Fluoride',652,'curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero',2,'http://dummyimage.com/118x100.png/dddddd/000000','Romanian','vitae mattis nibh',8,9,4,1),('047315667-9','Kronos','mupirocin',542,'luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget',7,'http://dummyimage.com/239x100.png/cc0000/ffffff','Albanian','etiam faucibus cursus urna ut',3,6,10,4),('053828033-6','Too Big to Fail','SH18',778,'mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit',5,'http://dummyimage.com/230x100.png/5fa2dd/ffffff','Belarusian','risus dapibus augue',8,4,9,1),('054567213-9','Paper Clips','Diltiazem Hydrochloride',306,'porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis',4,'http://dummyimage.com/104x100.png/cc0000/ffffff','Kazakh','nam ultrices libero non mattis',3,1,10,3),('063303873-3','Dragon Eyes','BareMinerals Multi-Tasking SPF 20 Concealer',628,'id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula',1,'http://dummyimage.com/170x100.png/dddddd/000000','Danish','donec dapibus',1,3,2,2),('065416790-7','For a Lost Soldier (Voor een Verloren Soldaat)','Mercaptopurine',327,'aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac',8,'http://dummyimage.com/202x100.png/ff4444/ffffff','Korean','faucibus orci luctus et ultrices',10,9,2,5),('066558704-X','River of Grass','CUPRUM METALLICUM',369,'risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi',6,'http://dummyimage.com/197x100.png/dddddd/000000','Punjabi','dapibus augue vel',9,1,8,1),('074923923-9','Two Solutions for One Problem ','LAMICTAL',439,'in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere',7,'http://dummyimage.com/158x100.png/dddddd/000000','Georgian','in eleifend',7,4,9,5),('076139067-7','Mothra (Mosura)','Extra Strength Pain Relief Therapy',595,'posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non',2,'http://dummyimage.com/232x100.png/5fa2dd/ffffff','Hiri Motu','lobortis convallis tortor risus',4,5,6,2),('081143720-5','Act of Violence','Lorazepam',705,'id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia',1,'http://dummyimage.com/134x100.png/5fa2dd/ffffff','Thai','nascetur ridiculus',10,8,9,3),('081471091-3','Room Service','MIDAZOLAM',670,'elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis',6,'http://dummyimage.com/172x100.png/5fa2dd/ffffff','Bosnian','placerat ante nulla',5,4,6,1),('082067589-X','Carnival in Flanders','Amlodipine Besylate',685,'ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero',2,'http://dummyimage.com/238x100.png/dddddd/000000','Korean','nunc donec quis orci eget',5,9,4,1),('093136424-8','Fury','Cimetidine',357,'vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper',10,'http://dummyimage.com/112x100.png/cc0000/ffffff','Arabic','sapien cum sociis natoque',7,9,6,4),('100084500-1','The Ghosts in Our Machine','Loratadine',411,'pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse',10,'http://dummyimage.com/121x100.png/cc0000/ffffff','Belarusian','magna bibendum imperdiet',9,7,6,5),('106000244-2','Wimbledon','Vinotinto Hand Sanitizer',735,'donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum',4,'http://dummyimage.com/155x100.png/dddddd/000000','Bengali','tellus in sagittis dui vel',4,6,6,1),('111231463-6','Man on Wire','Ultram',559,'consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi',1,'http://dummyimage.com/221x100.png/cc0000/ffffff','Japanese','ligula suspendisse',6,9,8,5),('119479645-1','Tropical Malady ','Valium',301,'donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed',8,'http://dummyimage.com/244x100.png/5fa2dd/ffffff','Dhivehi','curae mauris viverra diam',6,10,5,2),('122129388-5','Tanner Hall','Acetaminophen',309,'id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros',8,'http://dummyimage.com/111x100.png/ff4444/ffffff','Dari','nullam sit amet turpis elementum',1,5,4,1),('125948139-5','Zulu Dawn','Levocetirizine Dihydrochloride',675,'pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in',3,'http://dummyimage.com/244x100.png/5fa2dd/ffffff','Thai','blandit ultrices enim lorem',10,3,1,1),('132141420-X','In Secret','Ear Inflammation Plus',567,'lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in',8,'http://dummyimage.com/169x100.png/5fa2dd/ffffff','French','leo maecenas pulvinar lobortis est',10,6,1,4),('141780279-0','Daisy','Smart Sense Childrens Nighttime Cold and Cough',275,'orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet',1,'http://dummyimage.com/195x100.png/ff4444/ffffff','Tswana','odio elementum',2,4,6,2),('149070964-9','Purple Gang, The','FENOFIBRATE',293,'ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio',4,'http://dummyimage.com/101x100.png/dddddd/000000','Marathi','sit amet nunc viverra dapibus',7,1,4,1),('151813419-X','I ll See You in My Dreams','ATOMY SUN CREAM SPF 50 PA',264,'mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in',8,'http://dummyimage.com/205x100.png/ff4444/ffffff','Persian','sodales scelerisque',10,2,9,1),('166585190-2','Sunchaser, The','Diethylpropion HydrochlorideER',746,'justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla',7,'http://dummyimage.com/117x100.png/dddddd/000000','Bislama','lacus morbi',4,5,9,1),('168380046-X','Searching for Bobby Fischer','Nighttime Cold and Flu',300,'potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum',6,'http://dummyimage.com/241x100.png/dddddd/000000','Malay','amet sem fusce consequat nulla',8,8,7,5),('182493179-4','I Don t Want to Be a Man ','Molds, Rusts and Smuts, Epidermophyton floccosum',628,'magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede',3,'http://dummyimage.com/178x100.png/cc0000/ffffff','Gujarati','hac habitasse platea',3,6,1,1),('186794611-4','Babysitter Wanted','Mycophenolate Mofetil',431,'aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo',1,'http://dummyimage.com/145x100.png/ff4444/ffffff','Montenegrin','odio cras mi',6,3,5,3),('195996972-2','Canyon Passage','EPICOCCUM NIGRUM',745,'pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam',10,'http://dummyimage.com/225x100.png/dddddd/000000','Irish Gaelic','interdum in ante',2,2,6,5),('198265541-0','Peacock','Baclofen',723,'hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis',6,'http://dummyimage.com/159x100.png/cc0000/ffffff','Lithuanian','enim in',7,1,5,1),('199490187-X','Police Story 2 (Ging chaat goo si juk jaap)','LBEL HYDRATESS',516,'elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien',7,'http://dummyimage.com/171x100.png/5fa2dd/ffffff','Telugu','pulvinar sed nisl',9,2,10,2),('201251567-3','D-Day','Kogenate FS',554,'quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu',1,'http://dummyimage.com/161x100.png/dddddd/000000','Afrikaans','ligula vehicula consequat',5,8,4,1),('214383447-0','Against The Sun','Treatment Set TS345381',567,'ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac',7,'http://dummyimage.com/176x100.png/cc0000/ffffff','Guaraní','blandit nam nulla integer pede',8,5,6,1),('228742729-5','Swept Away','Ibuprofen',534,'non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere',3,'http://dummyimage.com/108x100.png/5fa2dd/ffffff','Tetum','duis ac nibh fusce',8,1,1,2),('246489932-1','Zandalee','Fludrocortisone Acetate',312,'nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed',2,'http://dummyimage.com/109x100.png/5fa2dd/ffffff','Khmer','quis odio',4,2,3,4),('250233255-9','Birdman','Antispetic',468,'primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec',4,'http://dummyimage.com/135x100.png/5fa2dd/ffffff','Azeri','lacinia aenean sit',3,9,4,2),('250295392-8','Skipped Parts','Day Time',720,'lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa',2,'http://dummyimage.com/176x100.png/ff4444/ffffff','Czech','a libero nam dui proin',7,7,3,3),('257249462-0','Broadcast News','SMARTH',392,'nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium',1,'http://dummyimage.com/134x100.png/cc0000/ffffff','Bengali','ut erat curabitur',2,5,8,4),('287721822-8','Yellow Sea, The (a.k.a. The Murderer) (Hwanghae)','Methylphenidate',763,'vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a',1,'http://dummyimage.com/193x100.png/ff4444/ffffff','Chinese','imperdiet sapien urna pretium',8,6,5,2),('291469644-2','Theremin: An Electronic Odyssey','Rizatriptan Benzoate',500,'eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede',2,'http://dummyimage.com/123x100.png/cc0000/ffffff','Oriya','congue vivamus metus arcu adipiscing',8,4,7,2),('311467988-9','Tai Chi Zero','TRIBIOTICLC LC',685,'eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam',6,'http://dummyimage.com/122x100.png/dddddd/000000','Arabic','sapien arcu sed',1,5,3,5),('314688084-9','The Island','DIGOX',454,'convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet',6,'http://dummyimage.com/248x100.png/dddddd/000000','Maltese','nunc proin at turpis',6,4,4,4),('319574956-4','Welcome to Mooseport','Molton Brown',492,'vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla',1,'http://dummyimage.com/170x100.png/cc0000/ffffff','Tamil','amet consectetuer adipiscing',1,4,3,2),('357880719-2','Fanfan la Tulipe ','Rapid Repair Balm',393,'curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac',9,'http://dummyimage.com/222x100.png/ff4444/ffffff','Chinese','at dolor quis odio consequat',7,8,5,4),('361387901-8','Shag','NITROGEN',641,'nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa',6,'http://dummyimage.com/152x100.png/5fa2dd/ffffff','Spanish','lacinia nisi',9,10,4,3),('361586133-7','See No Evil','Agaricus e pl. tota 4 Special Order',251,'dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel',7,'http://dummyimage.com/204x100.png/cc0000/ffffff','Zulu','erat nulla tempus vivamus in',3,4,5,4),('363782887-1','Killshot','Pleo Pin',281,'diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem',3,'http://dummyimage.com/200x100.png/ff4444/ffffff','Oriya','nulla facilisi cras non velit',2,4,3,1),('365393214-9','Inbetweeners Movie, The','X Out ',541,'sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero',2,'http://dummyimage.com/114x100.png/cc0000/ffffff','Afrikaans','integer ac neque duis bibendum',1,5,7,1),('365955916-4','I Will Fight No More Forever','Guaifenesin and Codeine Phosphate',721,'vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl',7,'http://dummyimage.com/201x100.png/dddddd/000000','Tswana','eleifend luctus ultricies',10,4,7,2),('370939279-9','Romancing the Stone','Guaifenesin',593,'nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius',1,'http://dummyimage.com/119x100.png/cc0000/ffffff','Hungarian','ac leo pellentesque ultrices',5,6,4,5),('374810360-3','Out at the Wedding','Betadine',751,'neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac',6,'http://dummyimage.com/189x100.png/5fa2dd/ffffff','Marathi','nisl venenatis',8,3,5,2),('376060112-X','Laggies','Leader Nite Time Cold Flu Relief',605,'faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis',9,'http://dummyimage.com/212x100.png/ff4444/ffffff','Indonesian','cursus id',5,3,1,2),('385822452-9','Watch Out for the Automobile (Beregis avtomobilya)','MediAc',742,'tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus',7,'http://dummyimage.com/220x100.png/5fa2dd/ffffff','Hiri Motu','pede malesuada in imperdiet',5,10,6,1),('396802058-8','Quadrophenia','Velphoro',440,'pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in',2,'http://dummyimage.com/185x100.png/cc0000/ffffff','Aymara','et ultrices posuere',2,6,9,3),('398871562-X','Umberto D.','Levothyroxine sodium',447,'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est',5,'http://dummyimage.com/125x100.png/cc0000/ffffff','Mongolian','lectus suspendisse',6,4,1,1),('399961405-6','Woman in the Moon ','Klor-Con',275,'elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim',5,'http://dummyimage.com/161x100.png/ff4444/ffffff','Oriya','platea dictumst aliquam',7,10,2,3),('401224474-4','Monster Walks, The','OXYGEN',746,'penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa',10,'http://dummyimage.com/106x100.png/dddddd/000000','Luxembourgish','ac est lacinia nisi venenatis',1,1,2,5),('419089712-4','My Science Project','CX DAILY EYE PROTECTOR',274,'vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum',7,'http://dummyimage.com/184x100.png/ff4444/ffffff','Macedonian','sit amet sem fusce',7,10,8,4),('431206102-5','Ultimate Warrior, The','Prednisone',744,'ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat',3,'http://dummyimage.com/181x100.png/dddddd/000000','Bislama','tincidunt eget',7,9,8,4),('453022965-3','Another Nine & a Half Weeks)','INSTANT HAND SANITIZER',325,'vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla',1,'http://dummyimage.com/213x100.png/dddddd/000000','Dzongkha','auctor sed tristique',10,5,1,1),('463676858-2','Romeo Is Bleeding','Headache - Migraine',370,'cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus',7,'http://dummyimage.com/169x100.png/ff4444/ffffff','Tajik','massa id nisl venenatis',4,5,3,1),('463906752-6','Clapham Junction','all day relief',325,'nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla',5,'http://dummyimage.com/173x100.png/dddddd/000000','Catalan','nec sem',4,8,3,3),('488587439-4','Taira Clan Saga, The (Shin heike monogatari)','Dairy Allergy Relief',332,'ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis',2,'http://dummyimage.com/217x100.png/ff4444/ffffff','Marathi','ante vel ipsum praesent blandit',9,10,8,3),('497423628-8','Suddenly, Last Winter','DIPHENDYDRAMINE HYDROCHLORIDE',302,'iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt',4,'http://dummyimage.com/184x100.png/ff4444/ffffff','Tamil','blandit non',5,7,4,1),('512649955-6','Funny Ha Ha','Pioglitazone Hydrochloride',626,'eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante',9,'http://dummyimage.com/184x100.png/5fa2dd/ffffff','Italian','sit amet sem',10,10,4,5),('514959887-9','Town & Country','Albuterol Sulfate',651,'leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac',1,'http://dummyimage.com/139x100.png/cc0000/ffffff','Zulu','non sodales',2,5,6,3),('537370116-5','Knockin  on Heaven s Door','Acetaminophen Extended Release',580,'ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante',1,'http://dummyimage.com/159x100.png/ff4444/ffffff','Greek','nulla integer pede',1,6,2,3),('539931091-0','Time Out ','Covergirl Outlast Stay Fabulous 3in1 Foundation',668,'pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue',6,'http://dummyimage.com/160x100.png/ff4444/ffffff','Latvian','risus dapibus augue',3,5,1,2),('543304002-X','Valentine Road','Divalproex Sodium',263,'ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet',7,'http://dummyimage.com/205x100.png/ff4444/ffffff','Spanish','pellentesque volutpat dui maecenas',2,9,3,4),('548886946-8','Gnome-Mobile, The','Soothe and Cool INZO Barrier',448,'donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies',4,'http://dummyimage.com/156x100.png/ff4444/ffffff','Moldovan','pulvinar nulla',8,2,9,5),('590992211-4','Gone Nutty','Kids-EEZE',549,'aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo',6,'http://dummyimage.com/154x100.png/ff4444/ffffff','Icelandic','dignissim vestibulum vestibulum ante ipsum',4,4,6,2),('608435358-4','Candy','Losartan Potassium',600,'aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis',1,'http://dummyimage.com/247x100.png/ff4444/ffffff','French','magna bibendum imperdiet nullam orci',9,7,5,2),('615928570-X','No God, No Master','Glucotrol',713,'dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet',3,'http://dummyimage.com/139x100.png/ff4444/ffffff','Italian','nec sem duis',8,9,9,2),('617184627-9','Tyler Perry s I Can Do Bad All by Myself','Absorica',288,'malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer',8,'http://dummyimage.com/222x100.png/cc0000/ffffff','Nepali','nulla tellus in sagittis',10,10,5,2),('619226621-2','Carrie','bacitracin zinc',282,'lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi',2,'http://dummyimage.com/183x100.png/ff4444/ffffff','Korean','ac leo pellentesque ultrices',4,5,7,4),('641472074-7','Dinosaur','Cough and Cold Real Relief',331,'pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti',8,'http://dummyimage.com/242x100.png/ff4444/ffffff','Macedonian','fringilla rhoncus',3,7,9,3),('642530477-4','James Gandolfini: Tribute to a Friend','Risperidone',301,'luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend',5,'http://dummyimage.com/177x100.png/cc0000/ffffff','Quechua','ut mauris eget massa',5,4,4,2),('645068151-9','Actor s Revenge, An (Yukinojô henge)','Cetirizine Hydrochloride',349,'odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus',7,'http://dummyimage.com/102x100.png/cc0000/ffffff','Hindi','ante ipsum primis in faucibus',8,9,7,3),('648314470-9','Tom & Viv','Acetaminophen',777,'ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget',9,'http://dummyimage.com/203x100.png/dddddd/000000','Nepali','morbi ut odio cras mi',5,1,1,3),('657154694-9','Prince and the Showgirl, The','Terazosin',642,'a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis',5,'http://dummyimage.com/206x100.png/dddddd/000000','Kyrgyz','nam ultrices',4,9,5,1),('658631078-4','Legal Deceit','Doxycycline Hyclate',472,'odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit',5,'http://dummyimage.com/107x100.png/ff4444/ffffff','Estonian','id nulla ultrices',1,9,5,1),('659961744-1','Girl From Paris)','Betaxolol',695,'sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis',4,'http://dummyimage.com/118x100.png/dddddd/000000','Estonian','cursus id turpis',8,1,7,1),('680500806-9','Executioners from Shaolin','Quartz 60 Special Order',764,'sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis',8,'http://dummyimage.com/105x100.png/dddddd/000000','Kannada','blandit lacinia erat vestibulum',8,4,3,5),('697465398-0','Four Flies on Grey Velvet','Sweet Vernal Grass, Standardized',618,'felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus',4,'http://dummyimage.com/176x100.png/ff4444/ffffff','Gujarati','quis turpis',1,2,5,3),('712049678-6','Chaos','Head and Shoulders',561,'turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer',6,'http://dummyimage.com/130x100.png/ff4444/ffffff','Indonesian','nulla nisl nunc nisl duis',6,2,5,4),('733528309-4','Ocean Heaven ','Weight Loss Solution',682,'ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis',2,'http://dummyimage.com/135x100.png/cc0000/ffffff','Icelandic','lorem id',8,10,7,3),('750719337-3','Career Opportunities','Alprazolam',362,'vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam nam tristique tortor eu pede',10,'http://dummyimage.com/205x100.png/ff4444/ffffff','New Zealand Sign Language','at turpis a pede posuere',6,2,7,4),('764400937-X','It','QT SUN BLOCK',342,'interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel',8,'http://dummyimage.com/108x100.png/5fa2dd/ffffff','Dzongkha','ullamcorper augue a suscipit',8,6,4,4),('769801659-5','Punksters & Youngsters','Low Dose Aspirin',592,'eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis',4,'http://dummyimage.com/212x100.png/cc0000/ffffff','Gagauz','primis in faucibus orci',8,1,9,1),('773955020-5','Whistling in Dixie','Acetylcysteine',250,'at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem',2,'http://dummyimage.com/216x100.png/cc0000/ffffff','Lao','non quam nec dui luctus',5,4,2,1),('779191301-1','Bad Boy Bubby','Invigorate Male Remedy No. 22',664,'etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris',2,'http://dummyimage.com/155x100.png/cc0000/ffffff','Portuguese','magna bibendum imperdiet nullam',10,1,4,2),('785838146-6','Devil s Advocate, The','Astringent',464,'ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate',4,'http://dummyimage.com/245x100.png/dddddd/000000','Gagauz','magna ac consequat metus',1,6,4,5),('813111322-1','Fiddle-de-dee','Ondansetron Hydrochloride',501,'in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in',1,'http://dummyimage.com/202x100.png/cc0000/ffffff','Ndebele','dapibus dolor vel est',4,5,1,3),('816268195-7','Memories of Me','Indomethacin',414,'magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue',4,'http://dummyimage.com/137x100.png/ff4444/ffffff','Polish','adipiscing elit proin',5,3,7,1),('816326603-1','Virus X','Simply Numb Endure',577,'vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam',4,'http://dummyimage.com/179x100.png/cc0000/ffffff','German','augue luctus tincidunt',3,6,9,3),('819821322-8','Lili','Maximum',342,'non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh',1,'http://dummyimage.com/214x100.png/dddddd/000000','Indonesian','non lectus aliquam sit',2,5,3,3),('822418417-X','Ugly American, The','EXTENDED PHENYTOIN SODIUM',322,'volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse',6,'http://dummyimage.com/240x100.png/cc0000/ffffff','Guaraní','donec dapibus duis at',3,1,1,3),('835003876-4','Executioner, The','Acetaminophen PM',433,'porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce',5,'http://dummyimage.com/139x100.png/dddddd/000000','Quechua','pede justo',3,1,9,1),('848203730-7','Garfield s Pet Force','Rifadin IV',379,'ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo',1,'http://dummyimage.com/198x100.png/cc0000/ffffff','Somali','placerat ante nulla justo',8,3,2,4),('852956061-2','Looking for Lenny ','Nighttime',511,'cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae',9,'http://dummyimage.com/143x100.png/cc0000/ffffff','Afrikaans','ut massa quis augue',2,9,1,5),('876322583-2','Friday After Next','Welchol',590,'sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus',9,'http://dummyimage.com/237x100.png/dddddd/000000','Hindi','rhoncus dui vel sem sed',6,6,7,2),('890021515-9','Organization, The','Gas-X',349,'ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi',2,'http://dummyimage.com/238x100.png/5fa2dd/ffffff','Kannada','et ultrices posuere cubilia',6,4,7,4),('890360913-1','L.A. Zombie','Promethazine Hydrochloride',769,'justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec',4,'http://dummyimage.com/113x100.png/5fa2dd/ffffff','Tajik','odio elementum eu interdum eu',8,9,1,5),('897904342-2','Blonde and Blonder','Gerbil Epithelium',342,'est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci',8,'http://dummyimage.com/105x100.png/cc0000/ffffff','Afrikaans','lacinia sapien quis',1,7,3,3),('897953329-2','Miracle Mile','Lamotrigine',555,'cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut',10,'http://dummyimage.com/171x100.png/cc0000/ffffff','Bosnian','sed nisl nunc',9,2,10,5),('916859527-1','Set-Up, The','CVS',647,'a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius',4,'http://dummyimage.com/172x100.png/ff4444/ffffff','Tswana','diam in',7,8,6,4),('918375802-X','In Old Arizona','Throat Complex',690,'orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis',8,'http://dummyimage.com/143x100.png/cc0000/ffffff','Indonesian','risus praesent lectus',7,3,8,5),('922528486-1','Ultrasuede: In Search of Halston','Pollens',675,'suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus',10,'http://dummyimage.com/166x100.png/dddddd/000000','Dzongkha','hendrerit at vulputate vitae nisl',9,3,10,3),('934963542-9','Tyler Perry s Madea s Family Reunion','Orris Root',483,'a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet',8,'http://dummyimage.com/221x100.png/5fa2dd/ffffff','Polish','mauris eget',2,10,6,1),('941179520-X','They Bite','ONDANSETRON HYDROCHLORIDE',444,'erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat',2,'http://dummyimage.com/122x100.png/cc0000/ffffff','Fijian','sapien ut nunc vestibulum ante',9,6,10,3),('946554247-4','Amazing Journey: The Story of The Who','Childrens Allegra Allergy',253,'quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti',1,'http://dummyimage.com/108x100.png/ff4444/ffffff','West Frisian','lorem id ligula suspendisse ornare',8,7,9,1),('957917712-0','Chalk Garden, The','Kleenex Clear Antibacterial Skin Cleanser',677,'ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie',3,'http://dummyimage.com/204x100.png/5fa2dd/ffffff','Bengali','aliquam convallis nunc proin',8,9,6,4),('966694353-0','Sol ','Magnesium Oxide',547,'pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis',7,'http://dummyimage.com/187x100.png/5fa2dd/ffffff','Greek','magna ac consequat metus sapien',9,2,8,2),('988997779-6','Shaolin Temple ','Chlordiazepoxide Hydrochloride',731,'nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque',3,'http://dummyimage.com/216x100.png/ff4444/ffffff','Persian','sed tincidunt eu',4,4,3,4),('993781174-0','Marnie','Coppertone',568,'suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis',3,'http://dummyimage.com/108x100.png/dddddd/000000','Assamese','ante vestibulum ante ipsum',1,9,10,1),('996242802-5','Possession, The','RX200 Foaming Instant Hand Sanitizer',261,'nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor',3,'http://dummyimage.com/193x100.png/cc0000/ffffff','Spanish','tellus nulla ut',4,2,3,1),('996340112-0','Within Limits (Liikkumavara)','Dove',537,'convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus',7,'http://dummyimage.com/100x100.png/dddddd/000000','Fijian','sit amet diam in',4,7,3,3),('997134666-4','Lives of a Bengal Lancer, The','carboplatin',298,'platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat',9,'http://dummyimage.com/188x100.png/dddddd/000000','Irish Gaelic','nibh in lectus pellentesque',1,6,2,4);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrow`
--

DROP TABLE IF EXISTS `borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrow` (
  `borrow_id` int NOT NULL AUTO_INCREMENT,
  `borrowing_date` date NOT NULL,
  `returning_date` date NOT NULL,
  `user_id` int NOT NULL,
  `isbn` varchar(50) NOT NULL,
  `operator_id` int NOT NULL,
  PRIMARY KEY (`borrow_id`),
  KEY `operator_id` (`operator_id`),
  KEY `user_id` (`user_id`),
  KEY `isbn` (`isbn`),
  CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`operator_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `borrow_ibfk_3` FOREIGN KEY (`isbn`) REFERENCES `book` (`isbn`) ON DELETE CASCADE,
  CONSTRAINT `chk_borrow_dates` CHECK ((`returning_date` > `borrowing_date`))
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow`
--

LOCK TABLES `borrow` WRITE;
/*!40000 ALTER TABLE `borrow` DISABLE KEYS */;
INSERT INTO `borrow` VALUES (1,'2023-04-18','2023-04-25',46,'897953329-2',1),(2,'2023-05-14','2023-05-21',25,'066558704-X',11),(3,'2023-04-22','2023-04-29',16,'198265541-0',11),(4,'2023-05-22','2023-05-29',41,'250295392-8',19),(5,'2023-05-02','2023-05-09',43,'399961405-6',19),(6,'2023-04-15','2023-04-22',31,'996242802-5',11),(7,'2023-05-11','2023-05-18',46,'852956061-2',1),(8,'2023-04-12','2023-04-19',13,'166585190-2',11),(9,'2023-05-12','2023-05-19',24,'074923923-9',1),(10,'2023-05-31','2023-06-07',21,'463676858-2',11),(11,'2023-04-13','2023-04-20',50,'182493179-4',11),(12,'2023-04-12','2023-04-19',2,'357880719-2',12),(13,'2023-04-30','2023-05-07',29,'365393214-9',11),(14,'2023-05-25','2023-06-01',8,'642530477-4',20),(15,'2023-04-21','2023-04-28',19,'941179520-X',19),(16,'2023-04-23','2023-04-30',38,'957917712-0',12),(17,'2023-05-22','2023-05-29',18,'132141420-X',12),(18,'2023-06-01','2023-06-08',38,'916859527-1',12),(19,'2023-05-04','2023-05-11',7,'363782887-1',11),(20,'2023-04-15','2023-04-22',50,'082067589-X',11),(21,'2023-04-26','2023-05-03',9,'997134666-4',12),(22,'2023-05-16','2023-05-23',31,'835003876-4',11),(23,'2023-05-07','2023-05-14',17,'512649955-6',1),(24,'2023-04-26','2023-05-03',45,'141780279-0',20),(25,'2023-05-08','2023-05-15',28,'361387901-8',19),(26,'2023-05-08','2023-05-15',27,'011566924-8',20),(27,'2023-05-15','2023-05-22',31,'773955020-5',11),(28,'2023-04-12','2023-04-19',47,'543304002-X',12),(29,'2023-05-14','2023-05-21',48,'401224474-4',1),(30,'2023-05-28','2023-06-04',28,'537370116-5',19),(31,'2023-05-22','2023-05-29',8,'250233255-9',20),(32,'2023-04-17','2023-04-24',15,'769801659-5',11),(33,'2023-05-20','2023-05-27',35,'657154694-9',11),(34,'2023-05-31','2023-06-07',41,'463906752-6',19),(35,'2023-05-22','2023-05-29',6,'081471091-3',11),(36,'2023-05-25','2023-06-01',10,'615928570-X',20),(37,'2023-04-11','2023-04-18',32,'641472074-7',19),(38,'2023-05-06','2023-05-13',50,'658631078-4',11),(39,'2023-06-01','2023-06-08',45,'779191301-1',20),(40,'2023-04-17','2023-04-24',18,'047315667-9',12),(41,'2023-05-03','2023-05-10',43,'054567213-9',19),(42,'2023-05-17','2023-05-24',50,'053828033-6',11),(43,'2023-04-29','2023-05-06',32,'514959887-9',19),(44,'2023-05-05','2023-05-12',37,'361586133-7',12),(45,'2023-05-08','2023-05-15',50,'125948139-5',11),(46,'2023-04-28','2023-05-05',47,'619226621-2',12),(47,'2023-04-16','2023-04-23',39,'396802058-8',19),(48,'2023-05-23','2023-05-30',25,'214383447-0',11),(49,'2023-04-27','2023-05-04',5,'712049678-6',12),(50,'2023-05-29','2023-06-05',7,'201251567-3',11);
/*!40000 ALTER TABLE `borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Romance'),(2,'Mystery'),(3,'Horror'),(4,'Thriller'),(5,'Science_Fiction'),(6,'Sports'),(7,'Self-Development'),(8,'Education'),(9,'Biography'),(10,'Religion');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `operators_comparison`
--

DROP TABLE IF EXISTS `operators_comparison`;
/*!50001 DROP VIEW IF EXISTS `operators_comparison`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `operators_comparison` AS SELECT 
 1 AS `author_name`,
 1 AS `loan_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservation_id` int NOT NULL AUTO_INCREMENT,
  `reservation_date` date NOT NULL,
  `expiration_date` date NOT NULL,
  `user_id` int NOT NULL,
  `isbn` varchar(50) NOT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `user_id` (`user_id`),
  KEY `isbn` (`isbn`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`isbn`) REFERENCES `book` (`isbn`) ON DELETE CASCADE,
  CONSTRAINT `chk_reservation_dates` CHECK ((`expiration_date` > `reservation_date`))
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'2023-04-28','2023-05-05',4,'816268195-7'),(2,'2023-04-13','2023-04-20',42,'319574956-4'),(3,'2023-06-01','2023-06-08',15,'385822452-9'),(4,'2023-05-10','2023-05-17',23,'645068151-9'),(5,'2023-04-20','2023-04-27',23,'813111322-1'),(6,'2023-05-24','2023-05-31',33,'419089712-4'),(7,'2023-05-05','2023-05-12',1,'680500806-9'),(8,'2023-04-19','2023-04-26',27,'199490187-X'),(9,'2023-04-21','2023-04-28',20,'291469644-2'),(10,'2023-05-11','2023-05-18',1,'785838146-6'),(11,'2023-05-23','2023-05-30',27,'876322583-2'),(12,'2023-05-21','2023-05-28',3,'548886946-8'),(13,'2023-05-13','2023-05-20',6,'122129388-5'),(14,'2023-05-25','2023-06-01',4,'398871562-X'),(15,'2023-05-24','2023-05-31',4,'946554247-4'),(16,'2023-05-18','2023-05-25',1,'918375802-X'),(17,'2023-05-02','2023-05-09',38,'848203730-7'),(18,'2023-04-27','2023-05-04',9,'764400937-X'),(19,'2023-05-01','2023-05-08',11,'934963542-9'),(20,'2023-05-11','2023-05-18',2,'890021515-9'),(21,'2023-05-27','2023-06-03',10,'374810360-3'),(22,'2023-04-15','2023-04-22',23,'922528486-1'),(23,'2023-05-04','2023-05-11',34,'659961744-1'),(24,'2023-04-21','2023-04-28',23,'996340112-0'),(25,'2023-05-03','2023-05-10',39,'648314470-9'),(26,'2023-06-02','2023-06-09',41,'822418417-X'),(27,'2023-05-05','2023-05-12',8,'617184627-9'),(28,'2023-04-22','2023-04-29',4,'149070964-9'),(29,'2023-05-07','2023-05-14',43,'697465398-0'),(30,'2023-05-16','2023-05-23',28,'488587439-4'),(31,'2023-04-22','2023-04-29',42,'026564100-4'),(32,'2023-05-11','2023-05-18',25,'106000244-2'),(33,'2023-04-25','2023-05-02',45,'076139067-7'),(34,'2023-04-27','2023-05-04',1,'311467988-9'),(35,'2023-04-25','2023-05-02',33,'431206102-5'),(36,'2023-05-10','2023-05-17',42,'228742729-5'),(37,'2023-04-26','2023-05-03',39,'186794611-4'),(38,'2023-05-19','2023-05-26',37,'314688084-9'),(39,'2023-05-08','2023-05-15',15,'151813419-X'),(40,'2023-05-06','2023-05-13',24,'065416790-7'),(41,'2023-05-10','2023-05-17',20,'966694353-0'),(42,'2023-05-11','2023-05-18',48,'370939279-9'),(43,'2023-05-26','2023-06-02',13,'497423628-8'),(44,'2023-05-27','2023-06-03',45,'376060112-X'),(45,'2023-06-01','2023-06-08',21,'014108164-3'),(46,'2023-05-09','2023-05-16',45,'063303873-3'),(47,'2023-05-18','2023-05-25',42,'287721822-8'),(48,'2023-05-16','2023-05-23',5,'257249462-0'),(49,'2023-04-20','2023-04-27',28,'897904342-2'),(50,'2023-06-01','2023-06-08',24,'195996972-2');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `review_text` text,
  `rating` decimal(2,1) NOT NULL,
  `user_id` int NOT NULL,
  `isbn` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`review_id`),
  KEY `user_id` (`user_id`),
  KEY `isbn` (`isbn`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`isbn`) REFERENCES `book` (`isbn`) ON DELETE CASCADE,
  CONSTRAINT `review_chk_1` CHECK (((`rating` >= 0.0) and (`rating` <= 5.0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school` (
  `school_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `director_name` varchar(50) NOT NULL,
  `library_operator_name` varchar(50) NOT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` VALUES (1,'Parker-Kiehn','PO Box 13084','Pandan Niog','hgoldston0@ox.ac.uk','961-946-4370','Web Esson','Adelaida Redwall'),(2,'Lakin-Kunde','Suite 7','Dunlewy','dburmaster1@dell.com','693-429-0510','Cherin Navarre','Colas Rebbeck'),(3,'Kilback, Jacobi and Kertzmann','Room 1113','Yerofey Pavlovich','tdi2@behance.net','635-584-5088','Donni McInally','Wakefield Womack'),(4,'Moen, Zulauf and Deckow','PO Box 37732','Raas','sbareford3@webmd.com','987-355-7357','Cris Freer','Barrett Carnegie'),(5,'Goyette, Carter and Terry','Suite 50','Aktau','lkimmerling4@addtoany.com','898-338-9584','Elsbeth Duffit','Merell Hurkett');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `user_type` enum('administrator','library_operator','student','professor') NOT NULL,
  `school_id` int NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `age` int NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'mhurkett0','39q0xHZAos','Merell','Hurkett','mhurkett0@hp.com','library_operator',5,1,46),(2,'jsemered1','VVWsu5nCoR','Jaquenetta','Semered','jsemered1@state.tx.us','student',4,1,16),(3,'rdoig2','3Jc3Vn','Raychel','Doig','rdoig2@bbb.org','professor',5,1,53),(4,'zforrestall3','bEFDabzgz4z','Zahara','Forrestall','zforrestall3@umich.edu','student',1,1,13),(5,'ojeskin4','NO8Eplqsy','Opaline','Jeskin','ojeskin4@wikispaces.com','student',4,1,14),(6,'boolahan5','8F2tmgoWIVBU','Bone','Oolahan','boolahan5@usnews.com','administrator',1,1,59),(7,'wambler6','rG7BDuKzUBNJ','Waneta','Ambler','wambler6@addtoany.com','student',1,1,13),(8,'dbynold7','LMsaZ87A3rMz','Dareen','Bynold','dbynold7@geocities.com','student',2,1,13),(9,'sansell8','NPnx9FluLmP','Scarface','Ansell','sansell8@nifty.com','student',4,1,17),(10,'mtumelty9','8dcimd','Myra','Tumelty','mtumelty9@reverbnation.com','professor',2,1,38),(11,'aredwalla','Y4JY5ZBX','Adelaida','Redwall','aredwalla@desdev.cn','library_operator',1,1,40),(12,'bcarnegieb','3tDOUhU','Barrett','Carnegie','bcarnegieb@nydailynews.com','library_operator',4,1,35),(13,'croddc','pBmX7kjjKwuj','Curry','Rodd','croddc@cargocollective.com','professor',1,1,32),(14,'klountd','X4AOma','Kaylyn','Lount','klountd@friendfeed.com','professor',4,1,51),(15,'mkaygille','dxrObifZv5','Marybeth','Kaygill','mkaygille@angelfire.com','professor',1,1,37),(16,'ghulettf','Y03dSXbudqVJ','Granny','Hulett','ghulettf@census.gov','professor',1,1,42),(17,'dtrimbyg','LrMrUaa4Jb5c','Dolf','Trimby','dtrimbyg@nhs.uk','professor',5,1,54),(18,'mminnetteh','IxvlUWKB4h','Morgan','Minnette','mminnetteh@apple.com','student',4,1,12),(19,'wwomacki','iaLNg7YZAUew','Wakefield','Womack','wwomacki@apache.org','library_operator',3,1,50),(20,'crebbeckj','KL7RNw9Lsd','Colas','Rebbeck','crebbeckj@ebay.co.uk','library_operator',2,1,44),(21,'rkielyk','3x1dqU','Reuven','Kiely','rkielyk@reference.com','student',1,1,17),(22,'cshemeltl','3q9jjD4MzmKJ','Cass','Shemelt','cshemeltl@blog.com','student',1,1,13),(23,'cfaulderm','UWeakD','Chauncey','Faulder','cfaulderm@accuweather.com','professor',3,1,39),(24,'lilyinykhn','MbhM8kwu','Latrina','Ilyinykh','lilyinykhn@wordpress.org','student',5,1,15),(25,'btreskeo','nmUWz8BZ6Ok5','Berton','Treske','btreskeo@sphinn.com','student',1,1,13),(26,'cdemep','kIfKpDotR','Cyndie','Deme','cdemep@cpanel.net','student',1,1,13),(27,'mriddickq','9aKvETb3a3','Marcelo','Riddick','mriddickq@princeton.edu','professor',2,1,49),(28,'hewdaler','fF7JM9YFASk','Hedy','Ewdale','hewdaler@vistaprint.com','student',3,1,14),(29,'bdecourcys','DOPRaCOVhg','Benyamin','Decourcy','bdecourcys@sitemeter.com','student',1,1,14),(30,'gfinicjt','twS33H','Goran','Finicj','gfinicjt@myspace.com','student',3,1,14),(31,'zscimoniu','igf13KQXz5t','Zackariah','Scimoni','zscimoniu@discovery.com','student',1,1,17),(32,'jpirouetv','Ah2BVebXO','Jaquelin','Pirouet','jpirouetv@linkedin.com','student',3,1,14),(33,'bballeinew','LOpxU2','Bertina','Balleine','bballeinew@cdbaby.com','student',4,1,15),(34,'dbadseyx','9q6U6j3','Danette','Badsey','dbadseyx@goodreads.com','student',1,1,18),(35,'dtittay','7fnoAt','Dodie','Titta','dtittay@eepurl.com','professor',1,1,35),(36,'hravenz','TONLrQt','Hill','Raven','hravenz@usa.gov','student',1,1,13),(37,'ckonert10','ty5urQ','Calypso','Konert','ckonert10@europa.eu','student',4,1,13),(38,'okasper11','AtKRn6N','Olivette','Kasper','okasper11@bluehost.com','student',4,1,16),(39,'mocahill12','hBzoQvD7','Marv','O Cahill','mocahill12@bluehost.com','student',3,1,17),(40,'sitzkin13','gDSt9GNBFyHa','Seamus','Itzkin','sitzkin13@ow.ly','student',1,1,15),(41,'jfarish14','cTfOlCZ','Jacob','Farish','jfarish14@admin.ch','student',3,1,13),(42,'fmathiasen15','cjKxPA','Ferdinand','Mathiasen','fmathiasen15@dailymail.co.uk','professor',2,1,42),(43,'sessam16','BOmEy6hcRuZ','Saul','Essam','sessam16@diigo.com','student',3,1,12),(44,'ngavrielli17','8j74JKF','Nada','Gavrielli','ngavrielli17@adobe.com','student',1,1,12),(45,'capthorpe18','mY03PswnjrrH','Calley','Apthorpe','capthorpe18@hao123.com','student',2,1,14),(46,'achasle19','xpR5Kb9e','Andromache','Chasle','achasle19@apple.com','student',5,1,13),(47,'gdando1a','ta06pPuPoR','Grannie','Dando','gdando1a@fotki.com','student',4,1,13),(48,'valdam1b','nCnu87sT','Vincenz','Aldam','valdam1b@unc.edu','professor',5,1,33),(49,'dprimarolo1c','pjZ8Zw','Daveta','Primarolo','dprimarolo1c@accuweather.com','student',1,1,12),(50,'wsedgebeer1d','Bn5ExsL','Winnifred','Sedgebeer','wsedgebeer1d@google.pl','student',1,1,15),(51,'gerald2','rtewtwr42','Gerald','lavoin','geralav@mail.com','student',2,0,15);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `authors_and_professors`
--

/*!50001 DROP VIEW IF EXISTS `authors_and_professors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `authors_and_professors` AS select distinct concat(`a`.`first_name`,' ',`a`.`last_name`) AS `author_name` from ((`book` `b` join `author` `a` on((`a`.`author_id` = `b`.`author_id`))) join `category` `c` on((`c`.`category_id` = `b`.`category_id`))) where (`c`.`name` = '%search_term%') union select distinct concat(`u`.`first_name`,' ',`u`.`last_name`) AS `user_name` from (((`borrow` `br` join `user` `u` on((`u`.`user_id` = `br`.`user_id`))) join `book` `b` on((`b`.`isbn` = `br`.`isbn`))) join `category` `c` on((`c`.`category_id` = `b`.`category_id`))) where ((`c`.`name` = '%search_term%') and (`u`.`user_type` = 'Professor') and (`br`.`borrowing_date` >= (curdate() - interval 12 month))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `operators_comparison`
--

/*!50001 DROP VIEW IF EXISTS `operators_comparison`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `operators_comparison` AS select concat(`u`.`first_name`,' ',`u`.`last_name`) AS `author_name`,count(0) AS `loan_count` from (`borrow` `b` join `user` `u` on((`b`.`operator_id` = `u`.`user_id`))) where (`b`.`borrowing_date` >= (curdate() - interval 12 month)) group by `b`.`operator_id` having ((`loan_count` > 20) and (`loan_count` = (select count(0) AS `same_loan_count` from `borrow` where (`borrow`.`borrowing_date` >= (curdate() - interval 12 month)) group by `borrow`.`operator_id` having (`borrow`.`operator_id` = `b`.`operator_id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-03 19:08:44
