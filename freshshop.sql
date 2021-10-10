-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2021 at 10:17 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `freshshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `anketa`
--

CREATE TABLE `anketa` (
  `id_anketa` int(11) NOT NULL,
  `naziv` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `anketa_odgovor`
--

CREATE TABLE `anketa_odgovor` (
  `id_anketa_odgovor` int(11) NOT NULL,
  `anketa_id` int(11) NOT NULL,
  `tekst_odgovora` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `artikal`
--

CREATE TABLE `artikal` (
  `id_artikal` int(11) NOT NULL,
  `naziv` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `opis` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cena` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `promocije` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `brojcano_stanje` smallint(11) NOT NULL,
  `kategorija_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `artikal`
--

INSERT INTO `artikal` (`id_artikal`, `naziv`, `opis`, `cena`, `promocije`, `brojcano_stanje`, `kategorija_id`) VALUES
(35, 'Hilman Sweatshirt', 'Warm hilman sweatshirt', '33', '', 17, 4),
(33, 'Black-green Jacket', 'Two colored Jacket', '67', '', 5, 3),
(32, 'Gucci Sweatshirt', 'Gucci is gooddd', '38', 'new', 21, 4),
(36, 'Blue Pants', 'Pants blue color', '49', 'sale', 12, 2),
(37, 'Funny t-shirt', 'Funny one', '58', 'new', 45, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kategorija`
--

CREATE TABLE `kategorija` (
  `id_kategorija` int(11) NOT NULL,
  `naziv` varchar(55) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kategorija`
--

INSERT INTO `kategorija` (`id_kategorija`, `naziv`) VALUES
(1, 'T-shirts'),
(2, 'Pants'),
(3, 'Jackets'),
(4, 'Sweatshirts'),
(5, 'Shoes'),
(7, 'Test category');

-- --------------------------------------------------------

--
-- Table structure for table `kontakt`
--

CREATE TABLE `kontakt` (
  `id` int(11) NOT NULL,
  `ime_prezime` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `naslov` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `poruka` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kontakt`
--

INSERT INTO `kontakt` (`id`, `ime_prezime`, `email`, `naslov`, `poruka`) VALUES
(6, 'Pera', 'pera@gmail.com', 'Test', 'Test message'),
(7, 'Novitest', 'novitest@gmail.com', 'Test', 'Test message'),
(8, 'Vladimir', 'vlada@gmail.com', 'Subject', 'Poruka adminu stranice!'),
(9, 'Fedja', 'fedja@gmail.com', 'Gremlin', 'Da li imate crnu jaknu na stanju?\r\nPozdrav!'),
(11, 'Fedja', 'fedja@gmail.com', 'Imam jedno pitanje', 'Koje sve majice imate u radnji na Novom Beogradu?');

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id_korisnik` int(11) NOT NULL,
  `ime` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `prezime` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `email_token` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '123',
  `isVerified` tinyint(1) NOT NULL DEFAULT 2,
  `datum` datetime(6) DEFAULT NULL,
  `uloga_id` int(11) NOT NULL DEFAULT 2
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id_korisnik`, `ime`, `prezime`, `email`, `password`, `email_token`, `isVerified`, `datum`, `uloga_id`) VALUES
(37, 'Vlada', 'Mijajlovic', 'dovla92@gmail.com', '$2y$10$R3ZGo3O0YQg4tZaExBbWE.lLJDveRbkuiOgVF0G/mWi70qYjifDkq', '123', 2, '2021-09-26 03:36:07.000000', 1),
(28, 'Vladimir', 'Mijajlovic', 'vladamijaj@gmail.com', '$2y$10$4/O.1U9hGxf0GII6qheCRu6HhCDsmS3WAeYOVSxel9ZxZcAbaBMtS', '123', 2, '2021-03-12 08:11:51.000000', 0),
(22, 'Noviii', 'Korisnik', 'novikorisnik@gmail.com', '$2y$10$cXKB/nJVA8LDmX7jXeESuOcd6XTdWuwmtiaNzDi0.Lzv6g42uBAiu', '4MC7D913VJI0ENL8FKOUXWT65PGHQZY2BSA', 2, '2021-09-25 04:25:15.000000', 1),
(29, 'Test', 'Account', 'test@gmail.com', '$2y$10$yKYTMc76nsWinvmXBlB1KujUJ/LQ3YTxINc3rmeJ4pDcwyXJfOxFq', '123', 2, '2021-03-12 08:22:23.000000', 1),
(24, 'Mikic', 'Mile', 'mile@gmail.com', '$2y$10$SHJNjx/sp.HbT1n5tQ.4Dek0RMKqXKVrs80r0q0TgNRY3EleTl1ka', '57CKGO4JXUHDQ92ISRBVTNAPEW8MLZY0F36', 2, '2021-03-07 20:18:38.000000', 2),
(25, 'Vladimir', 'Mijajlovic', 'vlada@gmail.com', '$2y$10$Y3ldqfu9Zi23IgUJ7LYSL.TrVoNdBVa0yHVzD649moOE080S6WEcO', 'HZJYBGNF5UCMS73OV21WDI0XLQT6E49KA8R', 1, '2021-03-12 08:26:20.000000', 1),
(30, 'User', 'Account', 'user@gmail.com', '$2y$10$f.BX12NxZDutx.AHspfQSucqajkBFcP7l4t/lSs8VpqVSSa7v8xE.', '123', 2, '2021-03-12 08:29:22.000000', 2),
(32, 'Milica', 'Pavlovic', 'milicap@gmail.com', '$2y$10$bD/HbVWNzozxwAb1ek7sAOc2yMvtUoRltuyxVB5w4wuy8fVWnWFn.', '123', 2, '2021-03-12 14:24:57.000000', 2),
(33, 'Pera', 'Gremlin', 'peragremlin@gmail.com', '$2y$10$uTEwJWoC7zv/2klyUNrlD.1xwXZ6Duw1.zV1Rp8wr755j9q1XZp4O', '123', 2, '2021-03-12 14:43:39.000000', 2),
(35, 'Fedja', 'Milic', 'fedja@gmail.com', '$2y$10$cRFKaC4Rseh0ki.7jzrv7OYnS6WKKmGZ8ZElyXDeE72I9.b2pYuQ.', '123', 2, '2021-09-25 04:51:05.000000', 1),
(39, 'Admin', 'Admin', 'admin@gmail.com', '$2y$10$atiT0ANISB.GkZnY5JRVt.aLdy.W03PHb1A7DChelk4qsJHIrTtEu', '123', 2, '2021-10-10 21:51:34.000000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `korisnik_odgovor`
--

CREATE TABLE `korisnik_odgovor` (
  `id_korisnik_odgovor` int(11) NOT NULL,
  `korisnik_id` int(11) NOT NULL,
  `anketa_odgovor_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `korpa`
--

CREATE TABLE `korpa` (
  `id_korpa` int(11) NOT NULL,
  `korisnik_id` int(11) NOT NULL,
  `artikal_id` int(11) NOT NULL,
  `kolicina` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `datum` datetime(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `navigacija`
--

CREATE TABLE `navigacija` (
  `id_nav` int(11) NOT NULL,
  `naziv` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `href` varchar(55) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `navigacija`
--

INSERT INTO `navigacija` (`id_nav`, `naziv`, `href`) VALUES
(1, 'Home', 'page=home'),
(3, 'Shop', 'page=shop'),
(9, 'Contact Us', 'page=contact_us');

-- --------------------------------------------------------

--
-- Table structure for table `porudzbina`
--

CREATE TABLE `porudzbina` (
  `id_porudzbina` int(11) NOT NULL,
  `vreme` datetime NOT NULL,
  `korisnik_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id_slider` int(11) NOT NULL,
  `src` varchar(55) NOT NULL,
  `alt` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id_slider`, `src`, `alt`) VALUES
(1, 'slider-01.jpg', 'slider-01.jpg'),
(2, 'slider-02.jpg', 'slider-02.jpg'),
(3, 'slider-03.jpg', 'slider-03.jpg'),
(4, 'slider-04.jpg', 'slider-04.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `slika`
--

CREATE TABLE `slika` (
  `id_slika` int(11) NOT NULL,
  `putanja` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `alt` varchar(55) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slika`
--

INSERT INTO `slika` (`id_slika`, `putanja`, `alt`) VALUES
(26, 'sweatshirt2.jpg', 'sweatshirt2.jpg'),
(24, 'jacket1.jpg', 'jacket1.jpg'),
(23, 'sweatshirt3.jpg', 'sweatshirt3.jpg'),
(27, 'pants1.jpg', 'pants1.jpg'),
(28, 'tshirt3.jpg', 'tshirt3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `slika_artikal`
--

CREATE TABLE `slika_artikal` (
  `id_slika_artikal` int(11) NOT NULL,
  `artikal_id` int(11) NOT NULL,
  `slika_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slika_artikal`
--

INSERT INTO `slika_artikal` (`id_slika_artikal`, `artikal_id`, `slika_id`) VALUES
(28, 37, 28),
(27, 36, 27),
(26, 35, 26),
(24, 33, 24),
(23, 32, 23);

-- --------------------------------------------------------

--
-- Table structure for table `stavka_porudzbina`
--

CREATE TABLE `stavka_porudzbina` (
  `id_stavka_porudzbina` int(11) NOT NULL,
  `porudzbina_id` int(11) NOT NULL,
  `naziv` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `kolicina` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `cena` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uloga`
--

CREATE TABLE `uloga` (
  `id_uloga` int(11) NOT NULL,
  `naziv` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `uloga`
--

INSERT INTO `uloga` (`id_uloga`, `naziv`) VALUES
(1, 'Admin'),
(2, 'User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anketa`
--
ALTER TABLE `anketa`
  ADD PRIMARY KEY (`id_anketa`);

--
-- Indexes for table `anketa_odgovor`
--
ALTER TABLE `anketa_odgovor`
  ADD PRIMARY KEY (`id_anketa_odgovor`),
  ADD KEY `anketa_id` (`anketa_id`);

--
-- Indexes for table `artikal`
--
ALTER TABLE `artikal`
  ADD PRIMARY KEY (`id_artikal`),
  ADD KEY `kategorija_id` (`kategorija_id`);

--
-- Indexes for table `kategorija`
--
ALTER TABLE `kategorija`
  ADD PRIMARY KEY (`id_kategorija`);

--
-- Indexes for table `kontakt`
--
ALTER TABLE `kontakt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id_korisnik`),
  ADD KEY `uloga_id` (`uloga_id`);

--
-- Indexes for table `korisnik_odgovor`
--
ALTER TABLE `korisnik_odgovor`
  ADD PRIMARY KEY (`id_korisnik_odgovor`),
  ADD KEY `korisnik_id` (`korisnik_id`),
  ADD KEY `anketa_odgovor_id` (`anketa_odgovor_id`);

--
-- Indexes for table `korpa`
--
ALTER TABLE `korpa`
  ADD PRIMARY KEY (`id_korpa`),
  ADD KEY `korisnik_id` (`korisnik_id`),
  ADD KEY `artikal_id` (`artikal_id`);

--
-- Indexes for table `navigacija`
--
ALTER TABLE `navigacija`
  ADD PRIMARY KEY (`id_nav`);

--
-- Indexes for table `porudzbina`
--
ALTER TABLE `porudzbina`
  ADD PRIMARY KEY (`id_porudzbina`),
  ADD KEY `korisnik_id` (`korisnik_id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id_slider`);

--
-- Indexes for table `slika`
--
ALTER TABLE `slika`
  ADD PRIMARY KEY (`id_slika`);

--
-- Indexes for table `slika_artikal`
--
ALTER TABLE `slika_artikal`
  ADD PRIMARY KEY (`id_slika_artikal`),
  ADD KEY `artikal_id` (`artikal_id`),
  ADD KEY `slika_id` (`slika_id`);

--
-- Indexes for table `stavka_porudzbina`
--
ALTER TABLE `stavka_porudzbina`
  ADD PRIMARY KEY (`id_stavka_porudzbina`),
  ADD KEY `porudzbina_id` (`porudzbina_id`);

--
-- Indexes for table `uloga`
--
ALTER TABLE `uloga`
  ADD PRIMARY KEY (`id_uloga`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anketa`
--
ALTER TABLE `anketa`
  MODIFY `id_anketa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anketa_odgovor`
--
ALTER TABLE `anketa_odgovor`
  MODIFY `id_anketa_odgovor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `artikal`
--
ALTER TABLE `artikal`
  MODIFY `id_artikal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `kategorija`
--
ALTER TABLE `kategorija`
  MODIFY `id_kategorija` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kontakt`
--
ALTER TABLE `kontakt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id_korisnik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `korisnik_odgovor`
--
ALTER TABLE `korisnik_odgovor`
  MODIFY `id_korisnik_odgovor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `korpa`
--
ALTER TABLE `korpa`
  MODIFY `id_korpa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `navigacija`
--
ALTER TABLE `navigacija`
  MODIFY `id_nav` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `porudzbina`
--
ALTER TABLE `porudzbina`
  MODIFY `id_porudzbina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id_slider` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `slika`
--
ALTER TABLE `slika`
  MODIFY `id_slika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `slika_artikal`
--
ALTER TABLE `slika_artikal`
  MODIFY `id_slika_artikal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `stavka_porudzbina`
--
ALTER TABLE `stavka_porudzbina`
  MODIFY `id_stavka_porudzbina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uloga`
--
ALTER TABLE `uloga`
  MODIFY `id_uloga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
