-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: clg
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp` (
  `name` varchar(20) DEFAULT NULL,
  `roll` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` VALUES ('chikiitha',20);
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` text,
  `city` varchar(100) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `status` enum('upcoming','completed','cancelled') DEFAULT NULL,
  `organizer_id` int DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `organizer_id` (`organizer_id`),
  CONSTRAINT `events_ibfk_1` FOREIGN KEY (`organizer_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Tech Innovators Meetup','A meetup for tech enthusiasts.','New York','2025-06-10 10:00:00','2025-06-10 16:00:00','upcoming',1),(2,'AI & ML Conference','Conference on AI and ML advancements.','Chicago','2025-05-15 09:00:00','2025-05-15 17:00:00','completed',3),(3,'Frontend Development Bootcamp','Hands-on training on frontend tech.','Los Angeles','2025-07-01 10:00:00','2025-07-03 16:00:00','upcoming',2);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `event_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `comments` text,
  `feedback_date` date NOT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `user_id` (`user_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`),
  CONSTRAINT `feedback_chk_1` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,3,2,4,'Great insights!','2025-05-16'),(2,4,2,5,'Very informative.','2025-05-16'),(3,2,1,3,'Could be better.','2025-06-11');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrations`
--

DROP TABLE IF EXISTS `registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrations` (
  `registration_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `event_id` int DEFAULT NULL,
  `registration_date` date NOT NULL,
  PRIMARY KEY (`registration_id`),
  KEY `user_id` (`user_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `registrations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `registrations_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrations`
--

LOCK TABLES `registrations` WRITE;
/*!40000 ALTER TABLE `registrations` DISABLE KEYS */;
INSERT INTO `registrations` VALUES (1,1,1,'2025-05-01'),(2,2,1,'2025-05-02'),(3,3,2,'2025-04-30'),(4,4,2,'2025-04-28'),(5,5,3,'2025-06-15');
/*!40000 ALTER TABLE `registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resources` (
  `resource_id` int NOT NULL AUTO_INCREMENT,
  `event_id` int DEFAULT NULL,
  `resource_type` enum('pdf','image','link') DEFAULT NULL,
  `resource_url` varchar(255) NOT NULL,
  `uploaded_at` datetime NOT NULL,
  PRIMARY KEY (`resource_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `resources_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (1,1,'pdf','https://portal.com/resources/tech_meetup_agenda.pdf','2025-05-01 10:00:00'),(2,2,'image','https://portal.com/resources/ai_poster.jpg','2025-04-20 09:00:00'),(3,3,'link','https://portal.com/resources/html5_docs','2025-06-25 15:00:00');
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `event_id` int DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `speaker_name` varchar(100) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,1,'Opening Keynote','Dr. Tech','2025-06-10 10:00:00','2025-06-10 11:00:00'),(2,1,'Future of Web Dev','Alice Johnson','2025-06-10 11:15:00','2025-06-10 12:30:00'),(3,2,'AI in Healthcare','Charlie Lee','2025-05-15 09:30:00','2025-05-15 11:00:00'),(4,3,'Intro to HTML5','Bob Smith','2025-07-01 10:00:00','2025-07-01 12:00:00');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `registration_date` date DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Alice Johnson','alice@example.com','New York','2024-12-01'),(2,'Bob Smith','bob@example.com','Los Angeles','2024-12-05'),(3,'Charlie Lee','charlie@example.com','Chicago','2024-12-10'),(4,'Diana King','diana@example.com','New York','2025-01-15'),(5,'Ethan Hunt','ethan@example.com','Los Angeles','2025-02-01'),(6,'chikiitha','chik@example.com','hyd','2026-05-22');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-29 15:31:34



Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 13
Server version: 8.0.46 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> select * from users
    -> ;
ERROR 1046 (3D000): No database selected
mysql> use clg;
Database changed
mysql> select * from users;
+---------+---------------+---------------------+-------------+-------------------+
| user_id | full_name     | email               | city        | registration_date |
+---------+---------------+---------------------+-------------+-------------------+
|       1 | Alice Johnson | alice@example.com   | New York    | 2024-12-01        |
|       2 | Bob Smith     | bob@example.com     | Los Angeles | 2024-12-05        |
|       3 | Charlie Lee   | charlie@example.com | Chicago     | 2024-12-10        |
|       4 | Diana King    | diana@example.com   | New York    | 2025-01-15        |
|       5 | Ethan Hunt    | ethan@example.com   | Los Angeles | 2025-02-01        |
+---------+---------------+---------------------+-------------+-------------------+
5 rows in set (0.00 sec)

mysql> select * from users where registration_date between '2026-05-01' and '2026-05-30';
Empty set (0.01 sec)

mysql> select * from users where registration_date >=now() interval 30 days;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'interval 30 days' at line 1
mysql> select * from users where registration_date >=now() -interval 30 days;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'days' at line 1
mysql> select * from users where registration_date >=now() - interval 30 days;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'days' at line 1
mysql> select * from users where registration_date >=now() - interval 30 day;
Empty set (0.01 sec)

mysql> insert into users values(6,'chikiitha','chik@example.com','hyd','2026-05-22';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> insert into users values(6,'chikiitha','chik@example.com','hyd','2026-05-22');
Query OK, 1 row affected (0.01 sec)

mysql> select * from users where registration_date >=now() - interval 30 day;
+---------+-----------+------------------+------+-------------------+
| user_id | full_name | email            | city | registration_date |
+---------+-----------+------------------+------+-------------------+
|       6 | chikiitha | chik@example.com | hyd  | 2026-05-22        |
+---------+-----------+------------------+------+-------------------+
1 row in set (0.00 sec)

mysql> select * from order  by registration_date;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'order  by registration_date' at line 1
mysql> select * from order by registration_date;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'order by registration_date' at line 1
mysql> select * from users order by registration_date;
+---------+---------------+---------------------+-------------+-------------------+
| user_id | full_name     | email               | city        | registration_date |
+---------+---------------+---------------------+-------------+-------------------+
|       1 | Alice Johnson | alice@example.com   | New York    | 2024-12-01        |
|       2 | Bob Smith     | bob@example.com     | Los Angeles | 2024-12-05        |
|       3 | Charlie Lee   | charlie@example.com | Chicago     | 2024-12-10        |
|       4 | Diana King    | diana@example.com   | New York    | 2025-01-15        |
|       5 | Ethan Hunt    | ethan@example.com   | Los Angeles | 2025-02-01        |
|       6 | chikiitha     | chik@example.com    | hyd         | 2026-05-22        |
+---------+---------------+---------------------+-------------+-------------------+
6 rows in set (0.00 sec)

mysql> select * from users order by registration_date desc;
+---------+---------------+---------------------+-------------+-------------------+
| user_id | full_name     | email               | city        | registration_date |
+---------+---------------+---------------------+-------------+-------------------+
|       6 | chikiitha     | chik@example.com    | hyd         | 2026-05-22        |
|       5 | Ethan Hunt    | ethan@example.com   | Los Angeles | 2025-02-01        |
|       4 | Diana King    | diana@example.com   | New York    | 2025-01-15        |
|       3 | Charlie Lee   | charlie@example.com | Chicago     | 2024-12-10        |
|       2 | Bob Smith     | bob@example.com     | Los Angeles | 2024-12-05        |
|       1 | Alice Johnson | alice@example.com   | New York    | 2024-12-01        |
+---------+---------------+---------------------+-------------+-------------------+
6 rows in set (0.00 sec)

mysql> select count(city) from users group by city;
+-------------+
| count(city) |
+-------------+
|           2 |
|           2 |
|           1 |
|           1 |
+-------------+
4 rows in set (0.01 sec)

mysql> select count(city),city from users group by city;
+-------------+-------------+
| count(city) | city        |
+-------------+-------------+
|           2 | New York    |
|           2 | Los Angeles |
|           1 | Chicago     |
|           1 | hyd         |
+-------------+-------------+
4 rows in set (0.00 sec)

mysql> select city from users like 'n%';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'like 'n%'' at line 1
mysql> select city from users where city like 'n%';
+----------+
| city     |
+----------+
| New York |
| New York |
+----------+
2 rows in set (0.00 sec)

mysql> select city from users where count(city)>5;
ERROR 1111 (HY000): Invalid use of group function
mysql> select * from users;
+---------+---------------+---------------------+-------------+-------------------+
| user_id | full_name     | email               | city        | registration_date |
+---------+---------------+---------------------+-------------+-------------------+
|       1 | Alice Johnson | alice@example.com   | New York    | 2024-12-01        |
|       2 | Bob Smith     | bob@example.com     | Los Angeles | 2024-12-05        |
|       3 | Charlie Lee   | charlie@example.com | Chicago     | 2024-12-10        |
|       4 | Diana King    | diana@example.com   | New York    | 2025-01-15        |
|       5 | Ethan Hunt    | ethan@example.com   | Los Angeles | 2025-02-01        |
|       6 | chikiitha     | chik@example.com    | hyd         | 2026-05-22        |
+---------+---------------+---------------------+-------------+-------------------+
6 rows in set (0.00 sec)

mysql> select city from users where count(*)>5;
ERROR 1111 (HY000): Invalid use of group function
mysql> select city from users group by city having count(*).5;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '.5' at line 1
mysql> select city from users group by city having count(*)>5;
Empty set (0.00 sec)

mysql> select city from users group by city having count(*)>=2;
+-------------+
| city        |
+-------------+
| New York    |
| Los Angeles |
+-------------+
2 rows in set (0.00 sec)

mysql> select full_name from users where full_name like 'a%';
+---------------+
| full_name     |
+---------------+
| Alice Johnson |
+---------------+
1 row in set (0.00 sec)

mysql> select city from users where city not unique;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'unique' at line 1
mysql> select city from users group by city having count(*)=1;
+---------+
| city    |
+---------+
| Chicago |
| hyd     |
+---------+
2 rows in set (0.00 sec)

mysql> select * from users order by registation_date desc limit 1;
ERROR 1054 (42S22): Unknown column 'registation_date' in 'order clause'
mysql> select * from users order by registration_date limit 1;
+---------+---------------+-------------------+----------+-------------------+
| user_id | full_name     | email             | city     | registration_date |
+---------+---------------+-------------------+----------+-------------------+
|       1 | Alice Johnson | alice@example.com | New York | 2024-12-01        |
+---------+---------------+-------------------+----------+-------------------+
1 row in set (0.01 sec)

mysql> select * from users group by registation_date order by month;
ERROR 1054 (42S22): Unknown column 'registation_date' in 'group statement'
mysql> select * from users group by registration_date order by month;
ERROR 1054 (42S22): Unknown column 'month' in 'order clause'
mysql> SELECT MONTH(registration_date) AS month,
    ->        COUNT(*) AS user_count
    -> FROM users
    -> GROUP BY MONTH(registration_date)
    -> ORDER BY month;
+-------+------------+
| month | user_count |
+-------+------------+
|     1 |          1 |
|     2 |          1 |
|     5 |          1 |
|    12 |          3 |
+-------+------------+
4 rows in set (0.00 sec)

mysql> select * from users group by registration_date order by month;
ERROR 1054 (42S22): Unknown column 'month' in 'order clause'
mysql> select u.users_id,u.full_name,e.event_id,e.title from users u join events e on u.user_id=e.organizer_id where e.status='upcoming' ,u.city=e.city order by e.start_date;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',u.city=e.city order by e.start_date' at line 1
mysql> select u.users_id,u.full_name,e.event_id,e.title from users u join events e on u.user_id=e.organizer_id where e.status='upcoming' and u.city=e.city order by e.start_date;
ERROR 1054 (42S22): Unknown column 'u.users_id' in 'field list'
mysql> select u.user_id,u.full_name,e.event_id,e.title from users u join events e on u.user_id=e.organizer_id where e.status='upcoming' and u.city=e.city order by e.start_date;
+---------+---------------+----------+-------------------------------+
| user_id | full_name     | event_id | title                         |
+---------+---------------+----------+-------------------------------+
|       1 | Alice Johnson |        1 | Tech Innovators Meetup        |
|       2 | Bob Smith     |        3 | Frontend Development Bootcamp |
+---------+---------------+----------+-------------------------------+
2 rows in set (0.00 sec)

mysql> SELECT u.user_id,
    ->        u.full_name,
    ->        e.event_id,
    ->        e.title,
    ->        e.start_date
    -> FROM Users u
    -> JOIN Registrations r ON u.user_id = r.user_id
    -> JOIN Events e ON r.event_id = e.event_id
    -> WHERE e.status = 'upcoming'
    ->   AND u.city = e.city
    -> ORDER BY e.start_date;
+---------+---------------+----------+-------------------------------+---------------------+
| user_id | full_name     | event_id | title                         | start_date          |
+---------+---------------+----------+-------------------------------+---------------------+
|       1 | Alice Johnson |        1 | Tech Innovators Meetup        | 2025-06-10 10:00:00 |
|       5 | Ethan Hunt    |        3 | Frontend Development Bootcamp | 2025-07-01 10:00:00 |
+---------+---------------+----------+-------------------------------+---------------------+
2 rows in set (0.00 sec)

mysql> select e.event_id,e.description ,f.feedback from events e join feedback f where f.rating=max(f.rating) and count(feedback_id)>=10;
ERROR 1054 (42S22): Unknown column 'f.feedback' in 'field list'
mysql> select e.event_id,e.description ,f.rating from events e join feedback f where f.rating=max(f.rating) and count(feedback_id)>=10;
ERROR 1111 (HY000): Invalid use of group function
mysql> SELECT
    ->     e.event_id,
    ->     e.description,
    ->     AVG(f.rating) AS avg_rating,
    ->     COUNT(f.feedback_id) AS total_feedbacks
    -> FROM Events e
    -> JOIN Feedback f
    ->     ON e.event_id = f.event_id
    -> GROUP BY e.event_id, e.description
    -> HAVING COUNT(f.feedback_id) >= 10
    ->
    -> ;
Empty set (0.01 sec)

mysql> select e.event_id from events e join feedback f on e.events_id=f.event^Z^Z^C
mysql> select * from events e left join sessions s on e.event_id=s.event_id where session_id null;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'null' at line 1
mysql> select * from events e left join sessions s on e.event_id=s.event_id where session_id is null;
Empty set (0.04 sec)

mysql> SELECT
    ->     e.event_id,
    ->     e.title,
    ->     AVG(TIMESTAMPDIFF(MINUTE, s.start_time, s.end_time)) AS avg_session_duration_minutes
    -> FROM Events e
    -> JOIN Sessions s
    ->     ON e.event_id = s.event_id
    -> GROUP BY e.event_id, e.title;
+----------+-------------------------------+------------------------------+
| event_id | title                         | avg_session_duration_minutes |
+----------+-------------------------------+------------------------------+
|        1 | Tech Innovators Meetup        |                      67.5000 |
|        2 | AI & ML Conference            |                      90.0000 |
|        3 | Frontend Development Bootcamp |                     120.0000 |
+----------+-------------------------------+------------------------------+
3 rows in set (0.03 sec)

mysql> select user_id from registration group by user_id having count(*)>=1;
ERROR 1146 (42S02): Table 'clg.registration' doesn't exist
mysql> SELECT
    ->     user_id,
    ->     event_id,
    ->     COUNT(*) AS registration_count
    -> FROM Registrations
    -> GROUP BY user_id, event_id
    -> ;
+---------+----------+--------------------+
| user_id | event_id | registration_count |
+---------+----------+--------------------+
|       1 |        1 |                  1 |
|       2 |        1 |                  1 |
|       3 |        2 |                  1 |
|       4 |        2 |                  1 |
|       5 |        3 |                  1 |
+---------+----------+--------------------+
5 rows in set (0.00 sec)

mysql> SELECT user_id from registrations group by user_id having count(*)>1;
Empty set (0.00 sec)

mysql> ^A     
