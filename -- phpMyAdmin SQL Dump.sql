-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 05, 2021 at 05:29 PM
-- Server version: 5.7.32
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `generation_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `autore`
--

CREATE TABLE `autore` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `cognome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `autore`
--

INSERT INTO `autore` (`id`, `nome`, `cognome`) VALUES
(1, 'John Ronald Reuel', 'Tolkien'),
(2, 'Dan', 'Brown'),
(3, 'Paulo', 'Coelho'),
(4, 'J. D.', 'Salinger'),
(5, 'Agatha', 'Christie'),
(6, 'J. K.', 'Rowling'),
(7, 'Tsao', 'Chan'),
(8, 'E. L.', 'James'),
(9, 'Antoine', 'de Saint-Exup?ry'),
(10, 'Charles', 'Dickens'),
(11, 'Miguel', 'de Cervantes'),
(12, 'Clive Staples', 'Lewis'),
(13, 'Tse-tung', 'Mao'),
(14, 'Michele', 'Rech, Zerocalcare'),
(15, 'Andrea', 'Camilleri'),
(16, 'Ken', 'Follett'),
(17, 'Kazuo', 'Ishiguro'),
(18, 'Carlo', 'Fruttero'),
(19, 'Franco', 'Lucentini'),
(20, 'Italo', 'Calvino'),
(21, 'Stephen', 'King'),
(22, 'Isabel', 'Allende');

-- --------------------------------------------------------

--
-- Table structure for table `autore_libro`
--

CREATE TABLE `autore_libro` (
  `id` int(11) NOT NULL,
  `libro_id` int(11) DEFAULT NULL,
  `autore_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `autore_libro`
--

INSERT INTO `autore_libro` (`id`, `libro_id`, `autore_id`) VALUES
(1, 1, 3),
(2, 2, 8),
(4, 4, 11),
(5, 5, 6),
(7, 7, 4),
(9, 9, 13),
(11, 11, 1),
(12, 12, 7),
(16, 15, 1),
(19, 18, 17),
(20, 19, 15),
(21, 20, 10),
(22, 21, 20),
(23, 22, 21);

-- --------------------------------------------------------

--
-- Stand-in structure for view `catalogo`
-- (See below for the actual view)
--
CREATE TABLE `catalogo` (
`titolo` varchar(255)
,`Editore` varchar(50)
,`Autore` varchar(101)
,`Prezzo` decimal(8,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `editore`
--

CREATE TABLE `editore` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `editore`
--

INSERT INTO `editore` (`id`, `nome`) VALUES
(7, 'Sellerio'),
(8, 'BUR'),
(9, 'Sperling & Kupfer'),
(11, 'Adelphi'),
(12, 'Bompiani'),
(14, 'ciaoadadsad'),
(15, 'aaaaa'),
(16, 'Prova Editore'),
(18, 'superman'),
(19, 'maria');

-- --------------------------------------------------------

--
-- Table structure for table `libro`
--

CREATE TABLE `libro` (
  `id` int(11) NOT NULL,
  `titolo` varchar(255) DEFAULT NULL,
  `prezzo` decimal(6,2) DEFAULT NULL,
  `p_iva` decimal(6,2) DEFAULT NULL,
  `pagine` smallint(6) DEFAULT NULL,
  `editore_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `libro`
--

INSERT INTO `libro` (`id`, `titolo`, `prezzo`, `p_iva`, `pagine`, `editore_id`) VALUES
(1, 'Alchimista (L\')', '12.00', '13.20', 10, 3),
(2, 'Cinquanta sfumature di grigio', '10.20', '11.22', 560, 3),
(4, 'Don Chisciotte della Mancha', '20.40', '22.44', 300, 3),
(5, 'Harry Potter e la Pietra Filosofale', '8.50', '9.35', 302, 4),
(7, 'Il giovane Holden', '10.20', '11.22', 251, 3),
(9, 'Il libretto rosso', '7.22', '7.94', 160, 5),
(11, 'Il Signore degli Anelli: La compagnia dell\'anello. Le due torri. Il ritorno del re', '25.00', '27.50', 1255, 12),
(12, 'Il sogno della camera rossa. Romanzo cinese del XVIII secolo', '15.30', '16.83', 721, 3),
(15, 'Lo Hobbit', '9.35', '10.29', 417, 12),
(16, 'Macerie prime', '14.45', '15.90', 192, 6),
(18, 'Quel che resta del giorno', '12.00', '13.20', 276, 3),
(19, 'Un mese con Montalbano', '12.75', '14.03', 512, 7),
(20, 'Una storia tra due citt?', '9.77', '10.75', 600, 12),
(21, 'Marcovaldo', '10.00', '11.00', 120, 7),
(22, 'IT', '25.00', '27.50', 550, 9),
(24, 'La Divina Commedia', '10.50', '11.55', 154, 3),
(25, 'Radadasd', '12.00', '14.00', 111, 9),
(27, 'Ciao ', '12.00', '14.00', 111, 9),
(28, NULL, '0.00', '0.00', 0, 0);

-- --------------------------------------------------------

--
-- Structure for view `catalogo`
--
DROP TABLE IF EXISTS `catalogo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `catalogo`  AS SELECT `l`.`titolo` AS `titolo`, `e`.`nome` AS `Editore`, concat(`a`.`cognome`,' ',`a`.`nome`) AS `Autore`, round((`l`.`prezzo` * 1.22),2) AS `Prezzo` FROM (((`libro` `l` join `editore` `e` on((`l`.`editore_id` = `e`.`id`))) join `autore_libro` `la` on((`l`.`id` = `la`.`libro_id`))) join `autore` `a` on((`a`.`id` = `la`.`autore_id`))) ORDER BY `l`.`titolo` ASC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autore`
--
ALTER TABLE `autore`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `autore_libro`
--
ALTER TABLE `autore_libro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_al_autore` (`autore_id`),
  ADD KEY `fk_al_libro` (`libro_id`);

--
-- Indexes for table `editore`
--
ALTER TABLE `editore`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_libro_editore` (`editore_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `autore`
--
ALTER TABLE `autore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `autore_libro`
--
ALTER TABLE `autore_libro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `editore`
--
ALTER TABLE `editore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `libro`
--
ALTER TABLE `libro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `autore_libro`
--
ALTER TABLE `autore_libro`
  ADD CONSTRAINT `fk_al_autore` FOREIGN KEY (`autore_id`) REFERENCES `autore` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_al_libro` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
