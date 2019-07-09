-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2019 at 01:40 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parkbulvardb`
--

-- --------------------------------------------------------

--
-- Table structure for table `aboutuspagedictionaries`
--

CREATE TABLE `aboutuspagedictionaries` (
  `Id` int(11) NOT NULL,
  `Title` mediumtext COLLATE utf8_general_mysql500_ci,
  `Text` mediumtext COLLATE utf8_general_mysql500_ci,
  `AboutUspageId` int(11) NOT NULL,
  `LanguageId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `aboutuspagedictionaries`
--

INSERT INTO `aboutuspagedictionaries` (`Id`, `Title`, `Text`, `AboutUspageId`, `LanguageId`) VALUES
(1, 'Why do we use it?', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ‘Content here, content here’, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ‘lorem ipsum’ will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes', 1, 1),
(2, 'Why do we use it?', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ‘Content here, content here’, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ‘lorem ipsum’ will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes', 1, 2),
(3, 'Why do we use it?', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ‘Content here, content here’, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ‘lorem ipsum’ will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `aboutuspages`
--

CREATE TABLE `aboutuspages` (
  `Id` int(11) NOT NULL,
  `Image` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `aboutuspages`
--

INSERT INTO `aboutuspages` (`Id`, `Image`) VALUES
(1, '84073ddef8ff460e9dcbc49f11d13499.png');

-- --------------------------------------------------------

--
-- Table structure for table `admnconfig`
--

CREATE TABLE `admnconfig` (
  `Id` int(11) NOT NULL,
  `Username` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `Password` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `Role` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `admnconfig`
--

INSERT INTO `admnconfig` (`Id`, `Username`, `Password`, `Role`) VALUES
(1, 'admin', '123', 'Admin'),
(2, 'admin', '123', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `compaigndictionaries`
--

CREATE TABLE `compaigndictionaries` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `Duration` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `LanguageId` int(11) NOT NULL,
  `CompaignId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Table structure for table `compaigns`
--

CREATE TABLE `compaigns` (
  `Id` int(11) NOT NULL,
  `Image` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `Type` tinyint(4) NOT NULL,
  `IsCompleted` tinyint(4) NOT NULL,
  `Queue` int(11) NOT NULL,
  `ShopId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `Id` int(11) NOT NULL,
  `Email` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleryimages`
--

CREATE TABLE `galleryimages` (
  `Id` int(11) NOT NULL,
  `Image` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `Queue` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `galleryimages`
--

INSERT INTO `galleryimages` (`Id`, `Image`, `Queue`) VALUES
(1, '03c6e351f20848a29abf801d4a654fbb.png', 0),
(2, '3d8b1600acf64c45ba8cdc336c0c5698.png', 0),
(3, '24e1308fcb7d41c5a13172022913c909.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `generalinfos`
--

CREATE TABLE `generalinfos` (
  `Id` int(11) NOT NULL,
  `Phone` varchar(30) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `WorkHours` varchar(30) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `HowToGo` mediumtext COLLATE utf8_general_mysql500_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Table structure for table `homeslideritems`
--

CREATE TABLE `homeslideritems` (
  `Id` int(11) NOT NULL,
  `Image` mediumtext COLLATE utf8_general_mysql500_ci,
  `Queue` int(11) NOT NULL,
  `Link` text COLLATE utf8_general_mysql500_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `homeslideritems`
--

INSERT INTO `homeslideritems` (`Id`, `Image`, `Queue`, `Link`) VALUES
(1, 'f642568704e84e0d9e5b5e9376cbefaf.png', 0, NULL),
(2, '0b05b5aa783b4310a642c959a9710168.png', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `Code` varchar(20) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `Queue` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`Id`, `Name`, `Code`, `Queue`) VALUES
(1, 'Az', 'az-Latn', 0),
(2, 'En', 'en-Us', 0),
(3, 'Ru', 'ru-Ru', 0);

-- --------------------------------------------------------

--
-- Table structure for table `metatags`
--

CREATE TABLE `metatags` (
  `Id` int(11) NOT NULL,
  `TagName` mediumtext COLLATE utf8_general_mysql500_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `Id` int(11) NOT NULL,
  `TitleImage` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `dateTime` datetime NOT NULL,
  `Queue` int(11) NOT NULL,
  `Type` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsdictionaries`
--

CREATE TABLE `newsdictionaries` (
  `Id` int(11) NOT NULL,
  `Title` mediumtext COLLATE utf8_general_mysql500_ci,
  `Text` mediumtext COLLATE utf8_general_mysql500_ci,
  `LanguageId` int(11) NOT NULL,
  `NewsId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsimages`
--

CREATE TABLE `newsimages` (
  `Id` int(11) NOT NULL,
  `Image` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `NewsId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newspagedictionaries`
--

CREATE TABLE `newspagedictionaries` (
  `Id` int(11) NOT NULL,
  `Title` mediumtext COLLATE utf8_general_mysql500_ci,
  `Text` mediumtext COLLATE utf8_general_mysql500_ci,
  `NewsPageId` int(11) NOT NULL,
  `LanguageId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newspages`
--

CREATE TABLE `newspages` (
  `Id` int(11) NOT NULL,
  `Image` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seodescriptions`
--

CREATE TABLE `seodescriptions` (
  `Id` int(11) NOT NULL,
  `Word` mediumtext COLLATE utf8_general_mysql500_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seokeywords`
--

CREATE TABLE `seokeywords` (
  `Id` int(11) NOT NULL,
  `Word` mediumtext COLLATE utf8_general_mysql500_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shopcategories`
--

CREATE TABLE `shopcategories` (
  `Id` int(11) NOT NULL,
  `CoverImage` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `Logo` mediumtext COLLATE utf8_general_mysql500_ci,
  `Queue` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `shopcategories`
--

INSERT INTO `shopcategories` (`Id`, `CoverImage`, `Logo`, `Queue`) VALUES
(3, 'a55cf06905344111bd5dfbdf0ee55504.png', '3d98658531014d2db9bd977629c2be0a.svg', 0),
(4, 'ff6ba2a6b7b24ae8b660dbdeeb82b079.jpeg', '591f322f09754a319930e2cd2ebf5eba.svg', 1),
(5, '57f836a0e8e24b4788c963833fee8f94.jpeg', '7673263b842f4b5c9cf9af2da0a8b1cc.svg', 2),
(6, '9e988e3294ac429db237361c223b7b7a.jpeg', 'a48c022f232c433dbae279dc06737f15.svg', 3),
(7, '6a5c412612d5407eb757275f61530ffe.jpeg', '40b9d11cccee4628b43b07d5a1caab47.svg', 4),
(8, '4e1b624ac6734a00b0f0f7d13eef6009.jpeg', 'fa7fc0234b7b4e81807dc5283cdaa026.svg', 5),
(9, '6b77cfd431934819a4895d92162f00af.jpeg', 'ca9757b1ced8470c8d1b883bdffcf523.png', 6),
(10, '038e5505f6e7411f8c1364ec4894e003.jpeg', '595e7c2aa8884b1d9eea39ce02619948.svg', 7),
(11, '4d5d4e9c8da34be8b9d5f7e76eedcb45.jpeg', '12d711e171f54bcd91b62edc75c6e87c.svg', 9),
(12, 'c4849ce199b74699bd9a964df2a8272b.jpeg', '1d0373ac6bd246af9ab166b117acac79.svg', 11),
(13, '316ac8cadbf44a3cb96596b09ec42920.jpeg', '0dfdfde478ff4bf89234abc37feaf191.svg', 10),
(14, 'a7dc5db365b14756a5ec1d55f2cb771c.jpeg', '561841e4879b4695ac5451869d1d0717.svg', 8);

-- --------------------------------------------------------

--
-- Table structure for table `shopcategorydictionaries`
--

CREATE TABLE `shopcategorydictionaries` (
  `Id` int(11) NOT NULL,
  `Name` mediumtext COLLATE utf8_general_mysql500_ci,
  `ShopCategoryId` int(11) NOT NULL,
  `LanguageId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `shopcategorydictionaries`
--

INSERT INTO `shopcategorydictionaries` (`Id`, `Name`, `ShopCategoryId`, `LanguageId`) VALUES
(7, 'Qadın', 3, 1),
(8, 'Supermarket', 3, 2),
(9, 'Supermarket', 3, 3),
(10, 'Kişi', 4, 1),
(11, NULL, 4, 2),
(12, NULL, 4, 3),
(13, 'Uşaq', 5, 1),
(14, NULL, 5, 2),
(15, NULL, 5, 3),
(16, 'Restoran', 6, 1),
(17, NULL, 6, 2),
(18, NULL, 6, 3),
(19, 'Əyləncə', 7, 1),
(20, NULL, 7, 2),
(21, NULL, 7, 3),
(22, 'Sinema', 8, 1),
(23, NULL, 8, 2),
(24, NULL, 8, 3),
(25, 'Market', 9, 1),
(26, NULL, 9, 2),
(27, NULL, 9, 3),
(28, 'Ev əşyaları', 10, 1),
(29, NULL, 10, 2),
(30, NULL, 10, 3),
(31, 'Elektronika', 11, 1),
(32, NULL, 11, 2),
(33, NULL, 11, 3),
(34, 'Xidmət', 12, 1),
(35, NULL, 12, 2),
(36, NULL, 12, 3),
(37, 'Məktəb və kitab ləvazimatları', 13, 1),
(38, NULL, 13, 2),
(39, NULL, 13, 3),
(40, 'Bilet', 14, 1),
(41, 'Bilet', 14, 2),
(42, 'Bilet', 14, 3);

-- --------------------------------------------------------

--
-- Table structure for table `shopdictionaries`
--

CREATE TABLE `shopdictionaries` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `AboutText` mediumtext COLLATE utf8_general_mysql500_ci,
  `WorkHours` mediumtext COLLATE utf8_general_mysql500_ci,
  `ShopId` int(11) NOT NULL,
  `LanguageId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `shopdictionaries`
--

INSERT INTO `shopdictionaries` (`Id`, `Name`, `AboutText`, `WorkHours`, `ShopId`, `LanguageId`) VALUES
(10, 'Mango', '<p>İspaniyanın məşhur Mango brendi qadınlar &uuml;&ccedil;&uuml;n dəbli geyim, ayaqqabı və aksessuarlar təqdim edir. Mango-nun uğuru mağazada təqdim olunan &uuml;slubların fərqliliyindədir.&nbsp;Burda Siz istənilən səbəb &uuml;&ccedil;&uuml;n geyim tapa bilərsiniz: g&uuml;ndəlik casual geyimlər, yarıidman modellər, axşam libasları və s.</p>\r\n', NULL, 4, 1),
(11, 'Mango', '<p>İspaniyanın məşhur Mango brendi qadınlar &uuml;&ccedil;&uuml;n dəbli geyim, ayaqqabı və aksessuarlar təqdim edir. Mango-nun uğuru mağazada təqdim olunan &uuml;slubların fərqliliyindədir.&nbsp;Burda Siz istənilən səbəb &uuml;&ccedil;&uuml;n geyim tapa bilərsiniz: g&uuml;ndəlik casual geyimlər, yarıidman modellər, axşam libasları və s.</p>\r\n', NULL, 4, 2),
(12, 'Mango', '<p>İspaniyanın məşhur Mango brendi qadınlar &uuml;&ccedil;&uuml;n dəbli geyim, ayaqqabı və aksessuarlar təqdim edir. Mango-nun uğuru mağazada təqdim olunan &uuml;slubların fərqliliyindədir.&nbsp;Burda Siz istənilən səbəb &uuml;&ccedil;&uuml;n geyim tapa bilərsiniz: g&uuml;ndəlik casual geyimlər, yarıidman modellər, axşam libasları və s.</p>\r\n', NULL, 4, 3),
(13, 'Ali Nino', '<p>Ali&amp;Nino Mağazalar şəbəkəsi geniş &ccedil;eşiddə Azərbaycan, T&uuml;rk, Rus və İngilis dillərində bədii və elmi ədəbiyyat, uşaq ədəbiyyatı, həm&ccedil;inin b&ouml;y&uuml;k &ccedil;eşiddə oyuncaq, məktəb ləvazimatı, uşaqlarınızın zehni inkişafını hədəf alan oyun və m&uuml;xtəlif təlim kitabları və s. təklif edir. Bestsellerləri, ən son nəşrləri d&ouml;rd dildə burda tapmaq m&uuml;mk&uuml;nd&uuml;r.&nbsp;Həm&ccedil;inin, əlfəcinlər və m&uuml;xtəlif kitab aksesuarları əsl kitab həvəskarlarını sevindirəcəkdir.&nbsp;</p>\r\n', NULL, 5, 1),
(14, 'Ali Nino', '<p>Ali&amp;Nino Mağazalar şəbəkəsi geniş &ccedil;eşiddə Azərbaycan, T&uuml;rk, Rus və İngilis dillərində bədii və elmi ədəbiyyat, uşaq ədəbiyyatı, həm&ccedil;inin b&ouml;y&uuml;k &ccedil;eşiddə oyuncaq, məktəb ləvazimatı, uşaqlarınızın zehni inkişafını hədəf alan oyun və m&uuml;xtəlif təlim kitabları və s. təklif edir. Bestsellerləri, ən son nəşrləri d&ouml;rd dildə burda tapmaq m&uuml;mk&uuml;nd&uuml;r.&nbsp;Həm&ccedil;inin, əlfəcinlər və m&uuml;xtəlif kitab aksesuarları əsl kitab həvəskarlarını sevindirəcəkdir.&nbsp;</p>\r\n', NULL, 5, 2),
(15, 'Ali Nino', '<p>Ali&amp;Nino Mağazalar şəbəkəsi geniş &ccedil;eşiddə Azərbaycan, T&uuml;rk, Rus və İngilis dillərində bədii və elmi ədəbiyyat, uşaq ədəbiyyatı, həm&ccedil;inin b&ouml;y&uuml;k &ccedil;eşiddə oyuncaq, məktəb ləvazimatı, uşaqlarınızın zehni inkişafını hədəf alan oyun və m&uuml;xtəlif təlim kitabları və s. təklif edir. Bestsellerləri, ən son nəşrləri d&ouml;rd dildə burda tapmaq m&uuml;mk&uuml;nd&uuml;r.&nbsp;Həm&ccedil;inin, əlfəcinlər və m&uuml;xtəlif kitab aksesuarları əsl kitab həvəskarlarını sevindirəcəkdir.&nbsp;</p>\r\n', NULL, 5, 3),
(16, 'Silver Style', '<p>Silver Style- mağazalar şəbəkəsi zərgərlik, ticarəti sahəsində geniş təcr&uuml;bəsi&nbsp; olan peşəkar menecerlər tərəfindən&nbsp; 2010-cu ildə təsis edilib. Bizim 7 illik &nbsp; formalaşma və inkişafımız uğurla ke&ccedil;ib.<br />\r\nBiz q&uuml;rurla qeyd edə bilərik ki,&nbsp; Silver Style Azərbaycanda zərgərlik bazarı&nbsp; iştirak&ccedil;ıları arasında ən qabaqcıl yerlərdən birini tutur.&nbsp;</p>\r\n\r\n<p><em>Park Bulvar 1-ci mərtəbə, Bakı. (+994) 12-</em>498 80 88,&nbsp;</p>\r\n', NULL, 6, 1),
(17, 'Silver Style', NULL, NULL, 6, 2),
(18, 'Silver Style', NULL, NULL, 6, 3),
(19, 'Africa in Baku', '<p>AFRICA İN BAKU &ouml;z ekskl&uuml;ziv məhsulları ilə hər zaman m&uuml;ştərilərin diqqətini &ccedil;əkir. Uyğun qiymətə bənzərsiz əşyalar əldə etmək imkanını qa&ccedil;ırmayın. Həyatınıza bir az Afrika havası qatın!</p>\r\n', NULL, 7, 1),
(20, 'Africa in Baku', NULL, NULL, 7, 2),
(21, 'Africa in Baku', NULL, NULL, 7, 3),
(22, 'La Vie', '<p>&ldquo;Eau de Parfum&rdquo; standartı il istehsal olunaraq d&uuml;nya standartlarına cavab verən, La Vie a&ccedil;ıq parfum<strong>u </strong>təqdim olunduğu &ouml;lkələrdə Milli serfitikatlaşdırma Sistemində Qeydiyyata alınıb. Məhsulların keyfiyyət və orjinallığına tam zəmanət verən&nbsp;La Vie həm&ccedil;inin m&uuml;ştərilərinin məhsul se&ccedil;imi zamanı və satış sonrası yardımcı ola biləcək &ccedil;ox səmimi və peşəkar komandaya sahibdir.</p>\r\n', NULL, 8, 1),
(23, 'La Vie', '<p>&ldquo;Eau de Parfum&rdquo; standartı il istehsal olunaraq d&uuml;nya standartlarına cavab verən, La Vie a&ccedil;ıq parfum<strong>u </strong>təqdim olunduğu &ouml;lkələrdə Milli serfitikatlaşdırma Sistemində Qeydiyyata alınıb. Məhsulların keyfiyyət və orjinallığına tam zəmanət verən&nbsp;La Vie həm&ccedil;inin m&uuml;ştərilərinin məhsul se&ccedil;imi zamanı və satış sonrası yardımcı ola biləcək &ccedil;ox səmimi və peşəkar komandaya sahibdir.</p>\r\n', NULL, 8, 2),
(24, 'La Vie', '<p>&ldquo;Eau de Parfum&rdquo; standartı il istehsal olunaraq d&uuml;nya standartlarına cavab verən, La Vie a&ccedil;ıq parfum<strong>u </strong>təqdim olunduğu &ouml;lkələrdə Milli serfitikatlaşdırma Sistemində Qeydiyyata alınıb. Məhsulların keyfiyyət və orjinallığına tam zəmanət verən&nbsp;La Vie həm&ccedil;inin m&uuml;ştərilərinin məhsul se&ccedil;imi zamanı və satış sonrası yardımcı ola biləcək &ccedil;ox səmimi və peşəkar komandaya sahibdir.</p>\r\n', NULL, 8, 3),
(25, 'Azerbaijan Kelagayi və Butalı Azerbaijan Jewelry', '<p>Qədim vaxtlarda Azərbaycan qadınları qızları milli arnamentli, rəngarənğ baş &ouml;rt&uuml;s&uuml;ndən istifadə edirdilər. Əvvəlcə adət-ənənəyə h&ouml;rmət əlaməti olaraq, sonradan isə x&uuml;susi hallarda istifadə olunan kəlağayı artıq istənilən geyimi b&uuml;t&ouml;vləşdriən, tərz yaradan bir aksesuardır. M&uuml;asir Azərbaycan xanımı ənənəyə sadiqlik n&uuml;mayiş etdirən tərzini Butalı Azerbaijan Jewelry zinnət&nbsp; əşyaları ilə tamamlayır.</p>\r\n', NULL, 9, 1),
(26, 'Azerbaijan Kelagayi və Butalı Azerbaijan Jewelry', '<p>Qədim vaxtlarda Azərbaycan qadınları qızları milli arnamentli, rəngarənğ baş &ouml;rt&uuml;s&uuml;ndən istifadə edirdilər. Əvvəlcə adət-ənənəyə h&ouml;rmət əlaməti olaraq, sonradan isə x&uuml;susi hallarda istifadə olunan kəlağayı artıq istənilən geyimi b&uuml;t&ouml;vləşdriən, tərz yaradan bir aksesuardır. M&uuml;asir Azərbaycan xanımı ənənəyə sadiqlik n&uuml;mayiş etdirən tərzini Butalı Azerbaijan Jewelry zinnət&nbsp; əşyaları ilə tamamlayır.</p>\r\n', NULL, 9, 2),
(27, 'Azerbaijan Kelagayi və Butalı Azerbaijan Jewelry', '<p>Qədim vaxtlarda Azərbaycan qadınları qızları milli arnamentli, rəngarənğ baş &ouml;rt&uuml;s&uuml;ndən istifadə edirdilər. Əvvəlcə adət-ənənəyə h&ouml;rmət əlaməti olaraq, sonradan isə x&uuml;susi hallarda istifadə olunan kəlağayı artıq istənilən geyimi b&uuml;t&ouml;vləşdriən, tərz yaradan bir aksesuardır. M&uuml;asir Azərbaycan xanımı ənənəyə sadiqlik n&uuml;mayiş etdirən tərzini Butalı Azerbaijan Jewelry zinnət&nbsp; əşyaları ilə tamamlayır.</p>\r\n', NULL, 9, 3),
(28, 'LIFE SPORT', '<p>Life - sport.az&nbsp; təmsil etdiyi&nbsp; Olimp Sport Nutrition, Weider, Olimp Labs, Nutrend, GNC Live Well, USN Sport brendlərinin Azərbaycanda rəsmi təmsil&ccedil;isi (ekskluziv distributor ) olduğu &uuml;&ccedil;&uuml;n məhsulları birbaşa qeyd olunan istehsal&ccedil;ılardan m&uuml;ştəriyə &ccedil;atdırır. İstehsal&ccedil;ı şirkətlərlə razılaşdırılan qiymətlər alıcılara ən m&uuml;nasib formada təqdim olunur. Life Sport-un &uuml;st&uuml;nl&uuml;klərindən biri də istehsal&ccedil;ı şirkətlərin təklif etdiyi endirim kampaniyalarını vaxtında Azərbaycan m&uuml;ştərisinə təqdim etməkdir.</p>\r\n', NULL, 10, 1),
(29, 'LIFE SPORT', NULL, NULL, 10, 2),
(30, 'LIFE SPORT', NULL, NULL, 10, 3),
(31, 'NETWORK', '<p>Xanımlar və bəylər &uuml;&ccedil;&uuml;n nəzərdə tutulan dəbli, z&ouml;vql&uuml; və keyfiyyətli geyimlər İtaliyanın məşhur&nbsp;Network&nbsp;brendində sadəlik, ciddilik, &ouml;z&uuml;nəməxsus tərz ən əsası keyfiyyət adı altında birləşir.</p>\r\n', NULL, 11, 1),
(32, NULL, '<p>Xanımlar və bəylər &uuml;&ccedil;&uuml;n nəzərdə tutulan dəbli, z&ouml;vql&uuml; və keyfiyyətli geyimlər İtaliyanın məşhur&nbsp;Network&nbsp;brendində sadəlik, ciddilik, &ouml;z&uuml;nəməxsus tərz ən əsası keyfiyyət adı altında birləşir.</p>\r\n', NULL, 11, 2),
(33, NULL, '<p>Xanımlar və bəylər &uuml;&ccedil;&uuml;n nəzərdə tutulan dəbli, z&ouml;vql&uuml; və keyfiyyətli geyimlər İtaliyanın məşhur&nbsp;Network&nbsp;brendində sadəlik, ciddilik, &ouml;z&uuml;nəməxsus tərz ən əsası keyfiyyət adı altında birləşir.</p>\r\n', NULL, 11, 3),
(34, 'Karen Millen', '<p>Karen Millen-in dizayn komandası m&uuml;asir, dəbli və uğurlu qadın obrazını geyimlərində hər zaman əks etdirir!&nbsp;Brend hər m&ouml;vs&uuml;m yeni, &ouml;z&uuml;nəməxsus k&uuml;bar g&ouml;r&uuml;n&uuml;ş&uuml; ilə se&ccedil;ilən m&ouml;htəşəm geyimlər təklif edir.</p>\r\n', NULL, 12, 1),
(35, 'Karen Millen', '<p>Karen Millen-in dizayn komandası m&uuml;asir, dəbli və uğurlu qadın obrazını geyimlərində hər zaman əks etdirir!&nbsp;Brend hər m&ouml;vs&uuml;m yeni, &ouml;z&uuml;nəməxsus k&uuml;bar g&ouml;r&uuml;n&uuml;ş&uuml; ilə se&ccedil;ilən m&ouml;htəşəm geyimlər təklif edir.</p>\r\n', NULL, 12, 2),
(36, 'Karen Millen', '<p>Karen Millen-in dizayn komandası m&uuml;asir, dəbli və uğurlu qadın obrazını geyimlərində hər zaman əks etdirir!&nbsp;Brend hər m&ouml;vs&uuml;m yeni, &ouml;z&uuml;nəməxsus k&uuml;bar g&ouml;r&uuml;n&uuml;ş&uuml; ilə se&ccedil;ilən m&ouml;htəşəm geyimlər təklif edir.</p>\r\n', NULL, 12, 3),
(37, 'Elle', '<p>Y&uuml;zlərlə m&uuml;xtəlif &uuml;slub və onlarla m&uuml;xtəlif rəngli ayaqqabı təklif edən Elle Shoes modanı yaxından təqib edərək, ən g&ouml;zəl məhsullar təqdim etməyə davam edir. Qadınlarla yanaşı kişilərin də&nbsp;sevilən markası olan Elle Shoes mağazasında m&uuml;xtəlif n&ouml;v kişi ayaqqabıları da m&uuml;ştərilərə təklif olunur.</p>\r\n', NULL, 13, 1),
(38, 'Elle', '<p>Y&uuml;zlərlə m&uuml;xtəlif &uuml;slub və onlarla m&uuml;xtəlif rəngli ayaqqabı təklif edən Elle Shoes modanı yaxından təqib edərək, ən g&ouml;zəl məhsullar təqdim etməyə davam edir. Qadınlarla yanaşı kişilərin də&nbsp;sevilən markası olan Elle Shoes mağazasında m&uuml;xtəlif n&ouml;v kişi ayaqqabıları da m&uuml;ştərilərə təklif olunur.</p>\r\n', NULL, 13, 2),
(39, 'Elle', '<p>Y&uuml;zlərlə m&uuml;xtəlif &uuml;slub və onlarla m&uuml;xtəlif rəngli ayaqqabı təklif edən Elle Shoes modanı yaxından təqib edərək, ən g&ouml;zəl məhsullar təqdim etməyə davam edir. Qadınlarla yanaşı kişilərin də&nbsp;sevilən markası olan Elle Shoes mağazasında m&uuml;xtəlif n&ouml;v kişi ayaqqabıları da m&uuml;ştərilərə təklif olunur.</p>\r\n', NULL, 13, 3),
(40, 'NEW BALANCE', '<p>New Balance-mərkəzli beynəlxalq Amerika şirkətidir. 1906-cı ildə <em>New Balance Arch Support Company </em>adı ilə qurulan şirkət, g&uuml;n&uuml;m&uuml;z&uuml;n &ouml;ndə gedən idman ayaqqabısı istehsal&ccedil;ılarından biridir. New Balance markası &ldquo;MZ GROUP AZƏRBAYCAN MMC&rdquo; nin lisenzyası ilə 2015-ci ildə Park Bulvar alış veriş mərkəzində fəaliyyətə başlayıb.</p>\r\n', NULL, 14, 1),
(41, 'NEW BALANCE', '<p>New Balance-mərkəzli beynəlxalq Amerika şirkətidir. 1906-cı ildə <em>New Balance Arch Support Company </em>adı ilə qurulan şirkət, g&uuml;n&uuml;m&uuml;z&uuml;n &ouml;ndə gedən idman ayaqqabısı istehsal&ccedil;ılarından biridir. New Balance markası &ldquo;MZ GROUP AZƏRBAYCAN MMC&rdquo; nin lisenzyası ilə 2015-ci ildə Park Bulvar alış veriş mərkəzində fəaliyyətə başlayıb.</p>\r\n', NULL, 14, 2),
(42, 'NEW BALANCE', '<p>New Balance-mərkəzli beynəlxalq Amerika şirkətidir. 1906-cı ildə <em>New Balance Arch Support Company </em>adı ilə qurulan şirkət, g&uuml;n&uuml;m&uuml;z&uuml;n &ouml;ndə gedən idman ayaqqabısı istehsal&ccedil;ılarından biridir. New Balance markası &ldquo;MZ GROUP AZƏRBAYCAN MMC&rdquo; nin lisenzyası ilə 2015-ci ildə Park Bulvar alış veriş mərkəzində fəaliyyətə başlayıb.</p>\r\n', NULL, 14, 3),
(43, 'Pablosky', '<p>Pablosky uşaq&nbsp; və yeniyetmələr &uuml;&ccedil;&uuml;n ayaqqabı istehsal edən İspan brendidir. Brend 1969-cu ildə Juan Pablo Martin-Caro tərəfindən yaradılıb. Brend yalnız uşaq və yeniyetmələr &uuml;&ccedil;&uuml;n ayaqqabbı istehsal etdiyi, plaskostopiyanın qarşısını almaq &uuml;&ccedil;&uuml;n b&uuml;t&uuml;n ortopedik normaları nəzərə aldığı, istehsal zamanı istifadə olunan materialların ekoloji təmiz dəri və antibacterial par&ccedil;alardan olduğu, uşaqların aktivliyini nəzərə alaraq ayaqqabıların alt hissəsinin &nbsp;s&uuml;r&uuml;şməyən materialdan hazırlanması həm&ccedil;inin b&uuml;t&uuml;n ayaqqabıların əl ilə tikilməsinə g&ouml;rə digər ayaqqabı istehsal&ccedil;ılarından fərqlənir.&nbsp;</p>\r\n', NULL, 15, 1),
(44, 'Pablosky', '<p>Pablosky uşaq&nbsp; və yeniyetmələr &uuml;&ccedil;&uuml;n ayaqqabı istehsal edən İspan brendidir. Brend 1969-cu ildə Juan Pablo Martin-Caro tərəfindən yaradılıb. Brend yalnız uşaq və yeniyetmələr &uuml;&ccedil;&uuml;n ayaqqabbı istehsal etdiyi, plaskostopiyanın qarşısını almaq &uuml;&ccedil;&uuml;n b&uuml;t&uuml;n ortopedik normaları nəzərə aldığı, istehsal zamanı istifadə olunan materialların ekoloji təmiz dəri və antibacterial par&ccedil;alardan olduğu, uşaqların aktivliyini nəzərə alaraq ayaqqabıların alt hissəsinin &nbsp;s&uuml;r&uuml;şməyən materialdan hazırlanması həm&ccedil;inin b&uuml;t&uuml;n ayaqqabıların əl ilə tikilməsinə g&ouml;rə digər ayaqqabı istehsal&ccedil;ılarından fərqlənir.&nbsp;</p>\r\n', NULL, 15, 2),
(45, 'Pablosky', '<p>Pablosky uşaq&nbsp; və yeniyetmələr &uuml;&ccedil;&uuml;n ayaqqabı istehsal edən İspan brendidir. Brend 1969-cu ildə Juan Pablo Martin-Caro tərəfindən yaradılıb. Brend yalnız uşaq və yeniyetmələr &uuml;&ccedil;&uuml;n ayaqqabbı istehsal etdiyi, plaskostopiyanın qarşısını almaq &uuml;&ccedil;&uuml;n b&uuml;t&uuml;n ortopedik normaları nəzərə aldığı, istehsal zamanı istifadə olunan materialların ekoloji təmiz dəri və antibacterial par&ccedil;alardan olduğu, uşaqların aktivliyini nəzərə alaraq ayaqqabıların alt hissəsinin &nbsp;s&uuml;r&uuml;şməyən materialdan hazırlanması həm&ccedil;inin b&uuml;t&uuml;n ayaqqabıların əl ilə tikilməsinə g&ouml;rə digər ayaqqabı istehsal&ccedil;ılarından fərqlənir.&nbsp;</p>\r\n', NULL, 15, 3),
(46, ' İpekyol', '<p>Aktivlik və yeni trendləri izləyərək keyfiyyəti də y&uuml;ksək dəyərləndirən və ən nəhayət həyatdan z&ouml;vq almağı bacaranlar İpekyol mağazasında şıltaq istəklərini qane edə bilərlər.<em> </em></p>\r\n', NULL, 16, 1),
(47, ' İpekyol', '<p>Aktivlik və yeni trendləri izləyərək keyfiyyəti də y&uuml;ksək dəyərləndirən və ən nəhayət həyatdan z&ouml;vq almağı bacaranlar İpekyol mağazasında şıltaq istəklərini qane edə bilərlər.<em> </em></p>\r\n', NULL, 16, 2),
(48, ' İpekyol', '<p>Aktivlik və yeni trendləri izləyərək keyfiyyəti də y&uuml;ksək dəyərləndirən və ən nəhayət həyatdan z&ouml;vq almağı bacaranlar İpekyol mağazasında şıltaq istəklərini qane edə bilərlər.<em> </em></p>\r\n', NULL, 16, 3),
(49, 'HUMMEL', '<p>Danimarkanın idman geyimləri markası olan Hummel futbol, həntbol, basketbol və voleybol &uuml;&ccedil;&uuml;n geyim və aksesuar istehsal edir. M&uuml;ştərilərinə eyni zamanda futbol və həntbol &uuml;&ccedil;&uuml;n ayaqqabı təqdime dən Hummel markası &ldquo;MZ GROUP AZƏRBAYCAN MMC&rdquo; nin lisenzyası ilə 2017 &ndash; ci ildə Park Bulvar alış veriş mərkəzində fəaliyyətə başlayıb.</p>\r\n', NULL, 17, 1),
(50, 'HUMMEL', '<p>Danimarkanın idman geyimləri markası olan Hummel futbol, həntbol, basketbol və voleybol &uuml;&ccedil;&uuml;n geyim və aksesuar istehsal edir. M&uuml;ştərilərinə eyni zamanda futbol və həntbol &uuml;&ccedil;&uuml;n ayaqqabı təqdime dən Hummel markası &ldquo;MZ GROUP AZƏRBAYCAN MMC&rdquo; nin lisenzyası ilə 2017 &ndash; ci ildə Park Bulvar alış veriş mərkəzində fəaliyyətə başlayıb.</p>\r\n', NULL, 17, 2),
(51, 'HUMMEL', '<p>Danimarkanın idman geyimləri markası olan Hummel futbol, həntbol, basketbol və voleybol &uuml;&ccedil;&uuml;n geyim və aksesuar istehsal edir. M&uuml;ştərilərinə eyni zamanda futbol və həntbol &uuml;&ccedil;&uuml;n ayaqqabı təqdime dən Hummel markası &ldquo;MZ GROUP AZƏRBAYCAN MMC&rdquo; nin lisenzyası ilə 2017-ci ildə Park Bulvar alış veriş mərkəzində fəaliyyətə başlayıb.</p>\r\n', NULL, 17, 3),
(52, 'İDEAL', '<p>Alıcılara məşhur kosmetika və parf&uuml;meriya brendlərinin məhsullarını təqdim edən İDEAL xanımların ən sevdiyi mağazalardan biridir. İdeal mağazasında parf&uuml;m, dekorativ kosmetika, sa&ccedil;lara və dəriyə qulluq vasitələri, şəxsi gigiyena məhsullarının geniş se&ccedil;imi təqdim olunub.</p>\r\n', NULL, 18, 1),
(53, 'İDEAL', '<p>Alıcılara məşhur kosmetika və parf&uuml;meriya brendlərinin məhsullarını təqdim edən İDEAL xanımların ən sevdiyi mağazalardan biridir. İdeal mağazasında parf&uuml;m, dekorativ kosmetika, sa&ccedil;lara və dəriyə qulluq vasitələri, şəxsi gigiyena məhsullarının geniş se&ccedil;imi təqdim olunub.</p>\r\n', NULL, 18, 2),
(54, 'İDEAL', '<p>Alıcılara məşhur kosmetika və parf&uuml;meriya brendlərinin məhsullarını təqdim edən İDEAL xanımların ən sevdiyi mağazalardan biridir. İdeal mağazasında parf&uuml;m, dekorativ kosmetika, sa&ccedil;lara və dəriyə qulluq vasitələri, şəxsi gigiyena məhsullarının geniş se&ccedil;imi təqdim olunub.</p>\r\n', NULL, 18, 3),
(55, 'Alma Store', '<p>Alma Store- Azərbaycan Respublikasında Apple Premium Reseller statuslu yeqanə salondur. Mağazalarımız Mac komp&uuml;terlərinin, iPhone smarfonlarının, iPad planşetlərinin və iPod pleyerlərinin b&uuml;t&uuml;n &ccedil;eşidlərini, aksessuarlarının və proqram təminatının b&uuml;t&uuml;n n&ouml;vlərini təklif edir.&nbsp;Alma Store&nbsp;Azərbaycanda Apple səlahiyətlərinin mərkəzidir. Siz istədiyiniz zaman yaxınlaşıb, sizi maraqlandıran suallara cavab və peşəkar məsləhət ala bilərsiniz.&nbsp;</p>\r\n', NULL, 19, 1),
(56, 'Alma Store', '<p>Alma Store- Azərbaycan Respublikasında Apple Premium Reseller statuslu yeqanə salondur. Mağazalarımız Mac komp&uuml;terlərinin, iPhone smarfonlarının, iPad planşetlərinin və iPod pleyerlərinin b&uuml;t&uuml;n &ccedil;eşidlərini, aksessuarlarının və proqram təminatının b&uuml;t&uuml;n n&ouml;vlərini təklif edir.&nbsp;Alma Store&nbsp;Azərbaycanda Apple səlahiyətlərinin mərkəzidir. Siz istədiyiniz zaman yaxınlaşıb, sizi maraqlandıran suallara cavab və peşəkar məsləhət ala bilərsiniz.&nbsp;</p>\r\n', NULL, 19, 2),
(57, 'Alma Store', '<p>Alma Store- Azərbaycan Respublikasında Apple Premium Reseller statuslu yeqanə salondur. Mağazalarımız Mac komp&uuml;terlərinin, iPhone smarfonlarının, iPad planşetlərinin və iPod pleyerlərinin b&uuml;t&uuml;n &ccedil;eşidlərini, aksessuarlarının və proqram təminatının b&uuml;t&uuml;n n&ouml;vlərini təklif edir.&nbsp;Alma Store&nbsp;Azərbaycanda Apple səlahiyətlərinin mərkəzidir. Siz istədiyiniz zaman yaxınlaşıb, sizi maraqlandıran suallara cavab və peşəkar məsləhət ala bilərsiniz.&nbsp;</p>\r\n', NULL, 19, 3),
(58, 'Liu Jo', '<p>X&uuml;susi par&ccedil;alardan son dəbə uyğun geyim hazırlayan İtaliyan pret-a-porter brendi olan&nbsp;Liu Jo brendinin kolleksiyalarına qiymətli daşlarla bəzədilmiş&nbsp; aksesuar, &ccedil;anta, ayaqqabı istehsalı daxildir. 2013-c&uuml; ildən Macron brendi ilə m&uuml;qavilə imzalayan Liu Jo x&uuml;susi dizaynla eynəklər də istehsal edir. Brendin Azərbaycan təmsil&ccedil;isi&nbsp;NOVCO GROUP OF COMPANIES şirkətidir.<em> </em></p>\r\n', NULL, 20, 1),
(59, 'Liu Jo', '<p>X&uuml;susi par&ccedil;alardan son dəbə uyğun geyim hazırlayan İtaliyan pret-a-porter brendi olan&nbsp;Liu Jo brendinin kolleksiyalarına qiymətli daşlarla bəzədilmiş&nbsp; aksesuar, &ccedil;anta, ayaqqabı istehsalı daxildir. 2013-c&uuml; ildən Macron brendi ilə m&uuml;qavilə imzalayan Liu Jo x&uuml;susi dizaynla eynəklər də istehsal edir. Brendin Azərbaycan təmsil&ccedil;isi&nbsp;NOVCO GROUP OF COMPANIES şirkətidir.<em> </em></p>\r\n', NULL, 20, 2),
(60, 'Liu Jo', '<p>X&uuml;susi par&ccedil;alardan son dəbə uyğun geyim hazırlayan İtaliyan pret-a-porter brendi olan&nbsp;Liu Jo brendinin kolleksiyalarına qiymətli daşlarla bəzədilmiş&nbsp; aksesuar, &ccedil;anta, ayaqqabı istehsalı daxildir. 2013-c&uuml; ildən Macron brendi ilə m&uuml;qavilə imzalayan Liu Jo x&uuml;susi dizaynla eynəklər də istehsal edir. Brendin Azərbaycan təmsil&ccedil;isi&nbsp;NOVCO GROUP OF COMPANIES şirkətidir.<em> </em></p>\r\n', NULL, 20, 3),
(61, 'United Colors of Benetton', '<p>İtaliya brendi United Colors Of Benetton&nbsp; kişi, qadın, uşaq geyimləri və aksesuarları istehsal edir. Brend 1965 &ndash;ci ildə Lu&ccedil;ano Benetton tərəfindən İtaliyanın Trevizio şəhərində yaradılıb. Hazırda brendin 120 &ouml;lkədə 6000-dən &ccedil;ox mağazası fəaliyyət g&ouml;stərir. Brendin Azərbaycan təmsil&ccedil;isi&nbsp;NOVCO GROUP OF COMPANIES şirkətidir.<em> </em></p>\r\n', NULL, 21, 1),
(62, 'United Colors of Benetton', '<p>İtaliya brendi United Colors Of Benetton&nbsp; kişi, qadın, uşaq geyimləri və aksesuarları istehsal edir. Brend 1965 &ndash;ci ildə Lu&ccedil;ano Benetton tərəfindən İtaliyanın Trevizio şəhərində yaradılıb. Hazırda brendin 120 &ouml;lkədə 6000-dən &ccedil;ox mağazası fəaliyyət g&ouml;stərir. Brendin Azərbaycan təmsil&ccedil;isi&nbsp;NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 21, 2),
(63, 'United Colors of Benetton', '<p>İtaliya brendi United Colors Of Benetton&nbsp; kişi, qadın, uşaq geyimləri və aksesuarları istehsal edir. Brend 1965 &ndash;ci ildə Lu&ccedil;ano Benetton tərəfindən İtaliyanın Trevizio şəhərində yaradılıb. Hazırda brendin 120 &ouml;lkədə 6000-dən &ccedil;ox mağazası fəaliyyət g&ouml;stərir. Brendin Azərbaycan təmsil&ccedil;isi&nbsp;NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 21, 3),
(64, 'L\'OCCITANE', '<p>Təbii inqridiyentlərə &uuml;st&uuml;nl&uuml;k verən L&#39;OCCITANE sizə &ouml;z&uuml;n&uuml;z&uuml; yaxşı hiss etdirəcək, estetik və həssas, y&uuml;ksək keyfiyyətli kosmetik və parf&uuml;meriya məhsullarını təklif edir. Aralıq dənizi sahillərində ke&ccedil;ən həyatdan ilhamlanmış L&#39;OCCITANE-nın ətirləri və tərkibləri fitoterapiya və aromaterapiya qaydalarına əsasən hazırlanır. Bu, onlardan istifadə zamanı optimal keyfiyyəti, y&uuml;ksək effektivliyi və sərhədsiz ləzzəti təmin edir.</p>\r\n', NULL, 22, 1),
(65, 'L\'OCCITANE', NULL, NULL, 22, 2),
(66, 'L\'OCCITANE', NULL, NULL, 22, 3),
(67, 'Adidas', '<p>Adidas AG&nbsp;&mdash;&nbsp;Almaniyanın sənaye şirkətidir.&nbsp;İdman ayaqqabıları, g&uuml;ndəlik və idman geyimləri, digər idman inventarının istehsalı &uuml;zrə ixtisaslaşmışdır. Brend 1924-c&uuml; ildə Adolf və Rudolf Dassler qardaşları tərəfindən &ldquo;Dassler qardaşlarının ayaqqabı fabriki&rdquo; kimi yaradılıb. 1948-ci ildə qardaşlar m&uuml;əssisəni ayırmaq qərarına gəlir. Beləliklə, Adi Dassler Adidası təsis edir. Şirkətin geyimlərində eyni rəngdə &uuml;&ccedil; paralel xətt vardır. Bu motiv onun loqosunda da əksini tapıb. Brend futbol, qolf və digər idman n&ouml;vlərində bir &ccedil;ox d&uuml;nya &ccedil;empionatlarına sponsorluq edir. Brendin Azərbaycan təmsil&ccedil;isi&nbsp; NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 23, 1),
(68, 'Adidas', '<p>Adidas AG&nbsp;&mdash;&nbsp;Almaniyanın sənaye şirkətidir.&nbsp;İdman ayaqqabıları, g&uuml;ndəlik və idman geyimləri, digər idman inventarının istehsalı &uuml;zrə ixtisaslaşmışdır. Brend 1924-c&uuml; ildə Adolf və Rudolf Dassler qardaşları tərəfindən &ldquo;Dassler qardaşlarının ayaqqabı fabriki&rdquo; kimi yaradılıb. 1948-ci ildə qardaşlar m&uuml;əssisəni ayırmaq qərarına gəlir. Beləliklə, Adi Dassler Adidası təsis edir. Şirkətin geyimlərində eyni rəngdə &uuml;&ccedil; paralel xətt vardır. Bu motiv onun loqosunda da əksini tapıb. Brend futbol, qolf və digər idman n&ouml;vlərində bir &ccedil;ox d&uuml;nya &ccedil;empionatlarına sponsorluq edir. Brendin Azərbaycan təmsil&ccedil;isi&nbsp; NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 23, 2),
(69, 'Adidas', '<p>Adidas AG&nbsp;&mdash;&nbsp;Almaniyanın sənaye şirkətidir.&nbsp;İdman ayaqqabıları, g&uuml;ndəlik və idman geyimləri, digər idman inventarının istehsalı &uuml;zrə ixtisaslaşmışdır. Brend 1924-c&uuml; ildə Adolf və Rudolf Dassler qardaşları tərəfindən &ldquo;Dassler qardaşlarının ayaqqabı fabriki&rdquo; kimi yaradılıb. 1948-ci ildə qardaşlar m&uuml;əssisəni ayırmaq qərarına gəlir. Beləliklə, Adi Dassler Adidası təsis edir. Şirkətin geyimlərində eyni rəngdə &uuml;&ccedil; paralel xətt vardır. Bu motiv onun loqosunda da əksini tapıb. Brend futbol, qolf və digər idman n&ouml;vlərində bir &ccedil;ox d&uuml;nya &ccedil;empionatlarına sponsorluq edir. Brendin Azərbaycan təmsil&ccedil;isi&nbsp; NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 23, 3),
(70, 'Coast', '<p>İngiltərə brendi olan&nbsp;Coast qadınlar &uuml;&ccedil;&uuml;n geyim və aksesuar istehsal edir.&nbsp;D&uuml;nyanın bir &ccedil;ox &ouml;lkəsində mağazaları ilə təmsil olunan brend, əsasən ingilis zədagan &uuml;slubunda g&uuml;ndəlik və ziyafət geyimləri təqdim edir. Brendin Azərbaycan təmsil&ccedil;isi&nbsp;NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 24, 1),
(71, 'Coast', '<p>İngiltərə brendi olan&nbsp;Coast qadınlar &uuml;&ccedil;&uuml;n geyim və aksesuar istehsal edir.&nbsp;D&uuml;nyanın bir &ccedil;ox &ouml;lkəsində mağazaları ilə təmsil olunan brend, əsasən ingilis zədagan &uuml;slubunda g&uuml;ndəlik və ziyafət geyimləri təqdim edir. Brendin Azərbaycan təmsil&ccedil;isi&nbsp;NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 24, 2),
(72, 'Coast', '<p>İngiltərə brendi olan&nbsp;Coast qadınlar &uuml;&ccedil;&uuml;n geyim və aksesuar istehsal edir.&nbsp;D&uuml;nyanın bir &ccedil;ox &ouml;lkəsində mağazaları ilə təmsil olunan brend, əsasən ingilis zədagan &uuml;slubunda g&uuml;ndəlik və ziyafət geyimləri təqdim edir. Brendin Azərbaycan təmsil&ccedil;isi&nbsp;NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 24, 3),
(73, 'Azərbaycan Sənayə Bankı', '<p>Mərkəzi Bankın 28 sentyabr 1996-cı il tarixli 241 saylı lisenziyasına əsasən fəaliyyətə başlayıb. ASC-nin strategiyaları: M&uuml;ştərilərə keyfiyyətli xidmət vermək bu sahədə &ouml;lkənin bank sektorunda ilk sıralara daxil olmaq; &Ouml;lkə iqtisadiyyatının və bank sektorunun inkişafına dəstək vermək &ndash; iqtisadi və sənaye layihələrini maliyyələşdirməklə &ouml;lkə iqtisadiyyatının inkişafında aktiv rol oynamaq; Yeni bank məhsulları ilə bank sektorunun inkişafına dəstək vermək; Etibarlı və stabil bank olmaq- sabit və tarazlı inkişaf edərək etibarlı və sabit bank olmaq və bu inamı artırmaq.</p>\r\n', NULL, 25, 1),
(74, 'Azərbaycan Sənayə Bankı', '<p>Mərkəzi Bankın 28 sentyabr 1996-cı il tarixli 241 saylı lisenziyasına əsasən fəaliyyətə başlayıb. ASC-nin strategiyaları: M&uuml;ştərilərə keyfiyyətli xidmət vermək bu sahədə &ouml;lkənin bank sektorunda ilk sıralara daxil olmaq; &Ouml;lkə iqtisadiyyatının və bank sektorunun inkişafına dəstək vermək &ndash; iqtisadi və sənaye layihələrini maliyyələşdirməklə &ouml;lkə iqtisadiyyatının inkişafında aktiv rol oynamaq; Yeni bank məhsulları ilə bank sektorunun inkişafına dəstək vermək; Etibarlı və stabil bank olmaq- sabit və tarazlı inkişaf edərək etibarlı və sabit bank olmaq və bu inamı artırmaq.</p>\r\n', NULL, 25, 2),
(75, 'Azərbaycan Sənayə Bankı', '<p>Mərkəzi Bankın 28 sentyabr 1996-cı il tarixli 241 saylı lisenziyasına əsasən fəaliyyətə başlayıb. ASC-nin strategiyaları: M&uuml;ştərilərə keyfiyyətli xidmət vermək bu sahədə &ouml;lkənin bank sektorunda ilk sıralara daxil olmaq; &Ouml;lkə iqtisadiyyatının və bank sektorunun inkişafına dəstək vermək &ndash; iqtisadi və sənaye layihələrini maliyyələşdirməklə &ouml;lkə iqtisadiyyatının inkişafında aktiv rol oynamaq; Yeni bank məhsulları ilə bank sektorunun inkişafına dəstək vermək; Etibarlı və stabil bank olmaq- sabit və tarazlı inkişaf edərək etibarlı və sabit bank olmaq və bu inamı artırmaq.</p>\r\n', NULL, 25, 3),
(76, 'Tommy Hilfiger', '<p>Amerika brendi Tommy Hilfiger geyim və aksesuar istehsal edir. B rend 1985-ci ildə dizayner Tommy Hilfiger tərəfindən yaradılıb.&nbsp; Kişilər &uuml;&ccedil;&uuml;n dəbli&nbsp; geyimlərin istehsalı ilə d&uuml;nyada daha &ccedil;ox tanınan&nbsp; brend, son illər həm də qadınlar &uuml;&ccedil;&uuml;n tanınmış ulduzlarla x&uuml;susi kolleksiyaların hazırlanması ilə də məşhurlaşıb. Hazırda Hilfiger premium seqmentdə uğurla irəliləyən brendlərin siyahısında yer alır. 2001-ci ildən brend ayaqqabı istehsal edir. Brendin Azərbaycan təmsil&ccedil;isi&nbsp; NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 26, 1),
(77, 'Tommy Hilfiger', '<p>Amerika brendi Tommy Hilfiger geyim və aksesuar istehsal edir. B rend 1985-ci ildə dizayner Tommy Hilfiger tərəfindən yaradılıb.&nbsp; Kişilər &uuml;&ccedil;&uuml;n dəbli&nbsp; geyimlərin istehsalı ilə d&uuml;nyada daha &ccedil;ox tanınan&nbsp; brend, son illər həm də qadınlar &uuml;&ccedil;&uuml;n tanınmış ulduzlarla x&uuml;susi kolleksiyaların hazırlanması ilə də məşhurlaşıb. Hazırda Hilfiger premium seqmentdə uğurla irəliləyən brendlərin siyahısında yer alır. 2001-ci ildən brend ayaqqabı istehsal edir. Brendin Azərbaycan təmsil&ccedil;isi&nbsp; NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 26, 2),
(78, 'Tommy Hilfiger', '<p>Amerika brendi Tommy Hilfiger geyim və aksesuar istehsal edir. B rend 1985-ci ildə dizayner Tommy Hilfiger tərəfindən yaradılıb.&nbsp; Kişilər &uuml;&ccedil;&uuml;n dəbli&nbsp; geyimlərin istehsalı ilə d&uuml;nyada daha &ccedil;ox tanınan&nbsp; brend, son illər həm də qadınlar &uuml;&ccedil;&uuml;n tanınmış ulduzlarla x&uuml;susi kolleksiyaların hazırlanması ilə də məşhurlaşıb. Hazırda Hilfiger premium seqmentdə uğurla irəliləyən brendlərin siyahısında yer alır. 2001-ci ildən brend ayaqqabı istehsal edir. Brendin Azərbaycan təmsil&ccedil;isi&nbsp; NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 26, 3),
(79, 'Lacoste', '<p>Fransa brendi olan Lacoste geyim və aksesuar istehsal edir. Brend 1933-c&uuml; ildə&nbsp;Ren&eacute; Lacoste&nbsp;tərəfindən yaradılıb. O zamanların ən tanınmış tenis&ccedil;ılərindən &nbsp;olan Lacoste,&nbsp;Davis Cup&nbsp;tenis turnirini qazanan və&nbsp; Amerikalı olmayan ilk tenis&ccedil;idir. Rene Lacoste tenis ma&ccedil;larında tərləməyi &ouml;nləyən, rahat hərəkətə imkan yaradan&nbsp;bir dizayn hazırlayaraq bug&uuml;nk&uuml; Lacoste Polo Tiş&ouml;rt&uuml; yaratmışdır. Timsahı t-shirt&#39;&uuml;n sol tərəfinə yerləşdirən Lacoste, bu şəkildə d&uuml;nyada ilk dəfə bir geyimin&nbsp; g&ouml;r&uuml;nən &uuml;z&uuml;ndə simvol istifadə edən brend&nbsp; olmuşdur. Brendin Azərbaycan təmsil&ccedil;isi&nbsp; NOVCO GROUP OF COMPANİES şirkətidir.<em> </em><em> </em></p>\r\n', NULL, 27, 1),
(80, NULL, '<p>Fransa brendi olan Lacoste geyim və aksesuar istehsal edir. Brend 1933-c&uuml; ildə&nbsp;Ren&eacute; Lacoste&nbsp;tərəfindən yaradılıb. O zamanların ən tanınmış tenis&ccedil;ılərindən &nbsp;olan Lacoste,&nbsp;Davis Cup&nbsp;tenis turnirini qazanan və&nbsp; Amerikalı olmayan ilk tenis&ccedil;idir. Rene Lacoste tenis ma&ccedil;larında tərləməyi &ouml;nləyən, rahat hərəkətə imkan yaradan&nbsp;bir dizayn hazırlayaraq bug&uuml;nk&uuml; Lacoste Polo Tiş&ouml;rt&uuml; yaratmışdır. Timsahı t-shirt&#39;&uuml;n sol tərəfinə yerləşdirən Lacoste, bu şəkildə d&uuml;nyada ilk dəfə bir geyimin&nbsp; g&ouml;r&uuml;nən &uuml;z&uuml;ndə simvol istifadə edən brend&nbsp; olmuşdur. Brendin Azərbaycan təmsil&ccedil;isi&nbsp; NOVCO GROUP OF COMPANİES şirkətidir.</p>\r\n', NULL, 27, 2),
(81, NULL, '<p>Fransa brendi olan Lacoste geyim və aksesuar istehsal edir. Brend 1933-c&uuml; ildə&nbsp;Ren&eacute; Lacoste&nbsp;tərəfindən yaradılıb. O zamanların ən tanınmış tenis&ccedil;ılərindən &nbsp;olan Lacoste,&nbsp;Davis Cup&nbsp;tenis turnirini qazanan və&nbsp; Amerikalı olmayan ilk tenis&ccedil;idir. Rene Lacoste tenis ma&ccedil;larında tərləməyi &ouml;nləyən, rahat hərəkətə imkan yaradan&nbsp;bir dizayn hazırlayaraq bug&uuml;nk&uuml; Lacoste Polo Tiş&ouml;rt&uuml; yaratmışdır. Timsahı t-shirt&#39;&uuml;n sol tərəfinə yerləşdirən Lacoste, bu şəkildə d&uuml;nyada ilk dəfə bir geyimin&nbsp; g&ouml;r&uuml;nən &uuml;z&uuml;ndə simvol istifadə edən brend&nbsp; olmuşdur. Brendin Azərbaycan təmsil&ccedil;isi&nbsp; NOVCO GROUP OF COMPANİES şirkətidir.</p>\r\n', NULL, 27, 3),
(82, 'Sisley', '<p>İtaliya brendi olan Sisley Benetton Group-a daxildir. Brend kişi, qadın, uşaq geyimləri və aksesuarları istehsal edir. United Colors of Benetton brendinin daha fashion y&ouml;n&uuml;ml&uuml; geyimlər qrupuna uyğun x&uuml;susi yaradılmış brenddir. Brendin Azərbaycan təmsil&ccedil;isi&nbsp; NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 28, 1),
(83, 'Sisley', '<p>İtaliya brendi olan Sisley Benetton Group-a daxildir. Brend kişi, qadın, uşaq geyimləri və aksesuarları istehsal edir. United Colors of Benetton brendinin daha fashion y&ouml;n&uuml;ml&uuml; geyimlər qrupuna uyğun x&uuml;susi yaradılmış brenddir. Brendin Azərbaycan təmsil&ccedil;isi&nbsp; NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 28, 2),
(84, 'Sisley', '<p>İtaliya brendi olan Sisley Benetton Group-a daxildir. Brend kişi, qadın, uşaq geyimləri və aksesuarları istehsal edir. United Colors of Benetton brendinin daha fashion y&ouml;n&uuml;ml&uuml; geyimlər qrupuna uyğun x&uuml;susi yaradılmış brenddir. Brendin Azərbaycan təmsil&ccedil;isi&nbsp; NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 28, 3),
(85, 'Tara Jarmon', '<p>İşadamı David Jarmon və gənc Kanadalı tələbə Tara istedadlarını birləşdirib bir layihə yaradırlar. Belə 1986-cı ildə TARA JARMON yaranır. Tara Jarmon brendinin 500-dən &ccedil;ox x&uuml;susi satış butikləri var. Brendin Azərbaycan təmsil&ccedil;isi&nbsp; NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 29, 1),
(86, 'Tara Jarmon', '<p>İşadamı David Jarmon və gənc Kanadalı tələbə Tara istedadlarını birləşdirib bir layihə yaradırlar. Belə 1986-cı ildə TARA JARMON yaranır. Tara Jarmon brendinin 500-dən &ccedil;ox x&uuml;susi satış butikləri var. Brendin Azərbaycan təmsil&ccedil;isi&nbsp; NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 29, 2),
(87, 'Tara Jarmon', '<p>İşadamı David Jarmon və gənc Kanadalı tələbə Tara istedadlarını birləşdirib bir layihə yaradırlar. Belə 1986-cı ildə TARA JARMON yaranır. Tara Jarmon brendinin 500-dən &ccedil;ox x&uuml;susi satış butikləri var. Brendin Azərbaycan təmsil&ccedil;isi&nbsp; NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 29, 3),
(88, 'BEBE', '<p>BEBE brendi m&uuml;asir dəbin &uuml;nvanıdır. &Ouml;z&uuml;nə əmin, m&uuml;asir qadınlar &uuml;&ccedil;&uuml;n nəzərdə tutulmuş BEBE dəbdəbəli həyat tərzini təcəss&uuml;m etdirən qlobal birbrenddir. Təsis&ccedil;isi Manny Mashouf 1976-cı ildə San Fransiskoda ilk BEBE butikini a&ccedil;dı.40 ildən &ccedil;ox sonra da BEBE d&uuml;nyanın ən yaxşı moda pərakəndə&ccedil;ilərindən biri olaraq adını d&uuml;nyaya tanıdıb.&nbsp; Brendin Azərbaycan təmsil&ccedil;isi&nbsp; NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 30, 1),
(89, 'BEBE', '<p>BEBE brendi m&uuml;asir dəbin &uuml;nvanıdır. &Ouml;z&uuml;nə əmin, m&uuml;asir qadınlar &uuml;&ccedil;&uuml;n nəzərdə tutulmuş BEBE dəbdəbəli həyat tərzini təcəss&uuml;m etdirən qlobal birbrenddir. Təsis&ccedil;isi Manny Mashouf 1976-cı ildə San Fransiskoda ilk BEBE butikini a&ccedil;dı.40 ildən &ccedil;ox sonra da BEBE d&uuml;nyanın ən yaxşı moda pərakəndə&ccedil;ilərindən biri olaraq adını d&uuml;nyaya tanıdıb.&nbsp; Brendin Azərbaycan təmsil&ccedil;isi&nbsp; NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 30, 2),
(90, 'BEBE', '<p>BEBE brendi m&uuml;asir dəbin &uuml;nvanıdır. &Ouml;z&uuml;nə əmin, m&uuml;asir qadınlar &uuml;&ccedil;&uuml;n nəzərdə tutulmuş BEBE dəbdəbəli həyat tərzini təcəss&uuml;m etdirən qlobal birbrenddir. Təsis&ccedil;isi Manny Mashouf 1976-cı ildə San Fransiskoda ilk BEBE butikini a&ccedil;dı.40 ildən &ccedil;ox sonra da BEBE d&uuml;nyanın ən yaxşı moda pərakəndə&ccedil;ilərindən biri olaraq adını d&uuml;nyaya tanıdıb.&nbsp; Brendin Azərbaycan təmsil&ccedil;isi&nbsp; NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 30, 3),
(91, 'SIX', '<p>SIX brendi hərkəs &uuml;&ccedil;&uuml;n əlverişli qiymətə son trendlərə uyğun aksesuarlar təqdim edir. Bu konsepsiya ilə, SIX tez bir zamanda moda zərgərlik, aksesuarlar və g&uuml;nəş eynəklərində bazar liderlərindən birinə &ccedil;evrildi.&nbsp;M&uuml;xtəlif kolleksiyalara sırğalar, &uuml;z&uuml;klər, boyunbağılar, bilərziklər, tekstil aksesuarları və real g&uuml;m&uuml;ş zərgərliklərinin b&ouml;y&uuml;k bir se&ccedil;imi daxildir. SIX 2000-ci ildə qurulub və bir &ccedil;ox &ouml;lkədə təmsil olunanmaqdadır. Brendin Azərbaycan təmsil&ccedil;isi&nbsp; NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 31, 1),
(92, 'SIX', '<p>SIX brendi hərkəs &uuml;&ccedil;&uuml;n əlverişli qiymətə son trendlərə uyğun aksesuarlar təqdim edir. Bu konsepsiya ilə, SIX tez bir zamanda moda zərgərlik, aksesuarlar və g&uuml;nəş eynəklərində bazar liderlərindən birinə &ccedil;evrildi.&nbsp;M&uuml;xtəlif kolleksiyalara sırğalar, &uuml;z&uuml;klər, boyunbağılar, bilərziklər, tekstil aksesuarları və real g&uuml;m&uuml;ş zərgərliklərinin b&ouml;y&uuml;k bir se&ccedil;imi daxildir. SIX 2000-ci ildə qurulub və bir &ccedil;ox &ouml;lkədə təmsil olunanmaqdadır. Brendin Azərbaycan təmsil&ccedil;isi&nbsp; NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 31, 2),
(93, 'SIX', '<p>SIX brendi hərkəs &uuml;&ccedil;&uuml;n əlverişli qiymətə son trendlərə uyğun aksesuarlar təqdim edir. Bu konsepsiya ilə, SIX tez bir zamanda moda zərgərlik, aksesuarlar və g&uuml;nəş eynəklərində bazar liderlərindən birinə &ccedil;evrildi.&nbsp;M&uuml;xtəlif kolleksiyalara sırğalar, &uuml;z&uuml;klər, boyunbağılar, bilərziklər, tekstil aksesuarları və real g&uuml;m&uuml;ş zərgərliklərinin b&ouml;y&uuml;k bir se&ccedil;imi daxildir. SIX 2000-ci ildə qurulub və bir &ccedil;ox &ouml;lkədə təmsil olunanmaqdadır. Brendin Azərbaycan təmsil&ccedil;isi&nbsp; NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 31, 3),
(94, 'Coccinelle', '<p>Coccinelle brendi 1978-ci ildə İtaliyada Parma əyalətində yaradılan bir markadır və bu g&uuml;n də b&uuml;t&uuml;n d&uuml;nyada məşhurdur. M&uuml;asir qadınları əks etdirən &ccedil;antalar və aksessuarlar: dinamik, glamur və dəbli. COCCINELLE brendinin x&uuml;susiyyətləri onun tərzi və istehsal keyfiyyəti, yenilik və trendləri birləşdirməsidir.</p>\r\n', NULL, 32, 1),
(95, 'Coccinelle', '<p>Coccinelle brendi 1978-ci ildə İtaliyada Parma əyalətində yaradılan bir markadır və bu g&uuml;n də b&uuml;t&uuml;n d&uuml;nyada məşhurdur. M&uuml;asir qadınları əks etdirən &ccedil;antalar və aksessuarlar: dinamik, glamur və dəbli. COCCINELLE brendinin x&uuml;susiyyətləri onun tərzi və istehsal keyfiyyəti, yenilik və trendləri birləşdirməsidir.</p>\r\n', NULL, 32, 2),
(96, 'Coccinelle', '<p>Coccinelle brendi 1978-ci ildə İtaliyada Parma əyalətində yaradılan bir markadır və bu g&uuml;n də b&uuml;t&uuml;n d&uuml;nyada məşhurdur. M&uuml;asir qadınları əks etdirən &ccedil;antalar və aksessuarlar: dinamik, glamur və dəbli. COCCINELLE brendinin x&uuml;susiyyətləri onun tərzi və istehsal keyfiyyəti, yenilik və trendləri birləşdirməsidir.</p>\r\n', NULL, 32, 3),
(97, 'ADL', '<p>ADL qadınlar &uuml;&ccedil;&uuml;n geyim və aksesuar istehsal edir. T&uuml;rk moda d&uuml;nyasında b&ouml;y&uuml;k işbirliyi kimi dəyərləndirilən ADL və &Ccedil;engiz Abazoğlu birliyi brendə x&uuml;susi status gətirib. Hazırda tanınmış stilst Mert Aslanla da &ccedil;alışan brend, d&uuml;nya dəbinin son trendinə uyğun geyimlərin se&ccedil;imini təklif edir. Brendin Azərbaycan təmsil&ccedil;isi&nbsp; NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 33, 1),
(98, 'ADL', '<p>ADL qadınlar &uuml;&ccedil;&uuml;n geyim və aksesuar istehsal edir. T&uuml;rk moda d&uuml;nyasında b&ouml;y&uuml;k işbirliyi kimi dəyərləndirilən ADL və &Ccedil;engiz Abazoğlu birliyi brendə x&uuml;susi status gətirib. Hazırda tanınmış stilst Mert Aslanla da &ccedil;alışan brend, d&uuml;nya dəbinin son trendinə uyğun geyimlərin se&ccedil;imini təklif edir. Brendin Azərbaycan təmsil&ccedil;isi&nbsp; NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 33, 2),
(99, 'ADL', '<p>ADL qadınlar &uuml;&ccedil;&uuml;n geyim və aksesuar istehsal edir. T&uuml;rk moda d&uuml;nyasında b&ouml;y&uuml;k işbirliyi kimi dəyərləndirilən ADL və &Ccedil;engiz Abazoğlu birliyi brendə x&uuml;susi status gətirib. Hazırda tanınmış stilst Mert Aslanla da &ccedil;alışan brend, d&uuml;nya dəbinin son trendinə uyğun geyimlərin se&ccedil;imini təklif edir. Brendin Azərbaycan təmsil&ccedil;isi&nbsp; NOVCO GROUP OF COMPANIES şirkətidir.</p>\r\n', NULL, 33, 3),
(100, 'Intimissimi', '<p>&ldquo;Intimissimi&rdquo; qadın və kişi alt geyimi sahəsində fəaliyyət g&ouml;stərən d&uuml;nyaca məşhur İtalyan brendidir. Gecə geyimi, alt geyimi, parf&uuml;m-kosmetika məhsulları istehsal edən &ldquo;İntimissimi&rdquo; nin &nbsp;d&uuml;nyada 1000-dən &ccedil;ox mağazası var.</p>\r\n', NULL, 34, 1),
(101, 'Intimissimi', '<p>&ldquo;Intimissimi&rdquo; qadın və kişi alt geyimi sahəsində fəaliyyət g&ouml;stərən d&uuml;nyaca məşhur İtalyan brendidir. Gecə geyimi, alt geyimi, parf&uuml;m-kosmetika məhsulları istehsal edən &ldquo;İntimissimi&rdquo; nin &nbsp;d&uuml;nyada 1000-dən &ccedil;ox mağazası var.</p>\r\n', NULL, 34, 2),
(102, 'Intimissimi', '<p>&ldquo;Intimissimi&rdquo; qadın və kişi alt geyimi sahəsində fəaliyyət g&ouml;stərən d&uuml;nyaca məşhur İtalyan brendidir. Gecə geyimi, alt geyimi, parf&uuml;m-kosmetika məhsulları istehsal edən &ldquo;İntimissimi&rdquo; nin d&uuml;nyada 1000-dən &ccedil;ox mağazası var.</p>\r\n', NULL, 34, 3),
(103, 'Calzedonia', '<p>Calzedonia brendi bug&uuml;n d&uuml;nyada tanınır. Brendin tarixi 1987-ci ildən başlayır. Calze-corab, donna-qadın (ital.) deməkdir. Calzedonia brendi tək corab-kolqot istehsalı ilə tanınmır, həm&ccedil;inin &ccedil;imərlik geyimləri əldə etmək olar.</p>\r\n', NULL, 35, 1),
(104, 'Calzedonia', '<p>Calzedonia brendi bug&uuml;n d&uuml;nyada tanınır. Brendin tarixi 1987-ci ildən başlayır. Calze-corab, donna-qadın (ital.) deməkdir. Calzedonia brendi tək corab-kolqot istehsalı ilə tanınmır, həm&ccedil;inin &ccedil;imərlik geyimləri əldə etmək olar.</p>\r\n', NULL, 35, 2),
(105, 'Calzedonia', '<p>Calzedonia brendi bug&uuml;n d&uuml;nyada tanınır. Brendin tarixi 1987-ci ildən başlayır. Calze-corab, donna-qadın (ital.) deməkdir. Calzedonia brendi tək corab-kolqot istehsalı ilə tanınmır, həm&ccedil;inin &ccedil;imərlik geyimləri əldə etmək olar.</p>\r\n', NULL, 35, 3);

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `Id` int(11) NOT NULL,
  `Image` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `Logo` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `Queue` int(11) NOT NULL,
  `day1` varchar(30) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `day2` varchar(30) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `day3` varchar(30) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `day4` varchar(30) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `day5` varchar(30) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `day6` varchar(30) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `day7` varchar(30) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `Number` varchar(30) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `Floor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`Id`, `Image`, `Logo`, `Queue`, `day1`, `day2`, `day3`, `day4`, `day5`, `day6`, `day7`, `Number`, `Floor`) VALUES
(4, '3a31ec7b5d274ba9ab5d4fd6c66f643c.jpeg', 'c692ce6daf1749bcb5d060ba505d1cd2.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 12 598 73 48', 1),
(5, '127e488b86dc45e19727db68a76cf9bf.jpeg', '615e8838549b4480b5444bd12e98188e.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 12 598 71 56', 1),
(6, 'f46d051b6c7947e0b015e7c340e3f29f.png', '5fc1b2ee27f54870afc54c862f009104.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 55 596 50 60', 1),
(7, '4b57ee89dc084d31844996e490473ab6.png', '02518516c7e04e6ab59251d081ccfc54.png', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 55 442 90 46 ', 1),
(8, '0fd8a2f1eec14d4589b873564387bfba.png', '2c32f55f2f324c4bbe0a7561df54a0cf.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', ' (+994) 51 291 31 31', 1),
(9, '4f5cef19f093453b85e320d25f39a9b2.png', '8c51ba31734b454494d592f1f1ca9ab8.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '+994) 50 218 07 03', 1),
(10, 'c1073e7204ee40a38c0511422b5392d9.png', '437cb1a337054fa28c7d835552663f9a.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(994) 051 291 31 31', 1),
(11, '4a69dbea47fa474191da1df90af27e8b.jpeg', 'a80399e4cfaf475a9258fd3164507a54.png', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 12 598 75 01', 1),
(12, 'c4006409e14a4661857a073a3a241b5a.jpeg', 'a5b86b3d28dc4f6f8a55bc8bb4895f28.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 12 598 71 51', 1),
(13, 'bb075ddc0df746a7a0a12d6ce1c79da3.jpeg', '5f24ecab202d4221ba84b2a0b28a16b0.gif', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 12 598 74 80', 1),
(14, '16ecfd86c9104d15a2fec39e44696d12.png', '6a556ddf01d043cfb86e57820b25505f.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+ 994) 12 598 72 80', 1),
(15, '95d52e096c59439aa018082cc727d15b.png', '47d5efa843554138874b789f4316bffe.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 12 598 71 35', 1),
(16, 'bdca90bd4179459e906c657f6af59ae4.jpeg', 'fefd71f1bcce43a882ec50d6708a8ec9.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 12 404 31 27', 1),
(17, 'e03e53506fc54ffd91701754bcf76067.jpeg', '563a5db55faf4e12845e475bc86efea0.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+ 994) 12 598 71 60', 1),
(18, '67899f495e77476c9f750ec752f0de6e.jpeg', '3393d92758ba482f8c151e07dc379958.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '+994) 12 598 77 70', 1),
(19, 'e1dd10f73d074764a9a31bac934d1155.png', '66ea3a753ba74278a596f2ed283ac0e2.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 12 598 73 20', 3),
(20, 'dd7cc499f6f5441db53dd6cd5e1d07ca.jpeg', '003695e5bf7f4bd1aec19afe4af2a121.png', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 12 598 71 40', 1),
(21, 'df8357f68d13408fa24a76664f160f7d.jpeg', '210922082b444832ae83c03467a7cdd1.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 12 598 71 43', 1),
(22, '4a6cb879b83b4a05956926e8c30ba6ee.jpeg', 'c808cb8632cc4f34923ad0ee956593f4.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 12 598 71 71', 1),
(23, '902d091c09c74e8da4f3ec6212ef8d06.jpeg', 'a3bb2e0c5172494abebbb2c1de092eb5.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 12  598 71 45', 1),
(24, '81ee657c3dc949be9dd145ab4c83f083.png', '9ae2dc20b3464066aa806681821de001.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 12 598 71 46', 1),
(25, '86fb73ff239a4f55867504322800bbf0.jpeg', '451ade751c0f4322800f8613311d4bab.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 12 598 71 66', 1),
(26, '214030d2e0154d16b779399c09e8186d.jpeg', 'f0dbc2ba0ce640a787ac46a41e3ac8fd.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 12 598 73 62', 1),
(27, 'cc886754596b4535967eb7341073d81e.jpeg', '3db6e47b6fc34de992605547e74e7cb4.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 12 598 73 86', 1),
(28, '8511f0a12ca744b29146e1454e0da004.jpeg', 'cdcf429d419244189fea75da6cfc960c.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 12 598 71 52', 1),
(29, '50bec3a029374a489ac07f079657a252.jpeg', '6270a725a7584886b7ed91cfaa38e5c6.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 12 598 73 62', 1),
(30, '1704fd5bb0d84c41b73c63e5f9fef3d6.jpeg', '9542e7a50ec340ea9fe45e7f9fca209c.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '+994) 12 598 71 50', 1),
(31, 'd688cc35ef834a8b8538ec6c98b01769.png', '5e04666d580240de954dcbd3dcbafc71.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 12 598 71 64', 1),
(32, 'd820606975274bc19277cac9f6d00b94.jpeg', '25020a482cb44dbf85711f412d809574.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 12 598 71 65', 1),
(33, '8d7b0b27387d4be9bb4c1ad2f992afe8.jpeg', '629455881d184442958ce8fbfa7b7252.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 12 404 28 92', 1),
(34, 'e290d35aab2d4fbc8da8186d41076134.jpeg', '31a0722d090e4a30bc0e1a2912e51844.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 12 598 71 54', 1),
(35, 'b1d0bd2f4abb4d4597c3cd907ed00a9f.jpeg', '12f06024c93a48959532e0027c39f13f.svg', 0, '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '10:00 18:00', '(+994) 12 598 71 54', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shoptocategories`
--

CREATE TABLE `shoptocategories` (
  `Id` int(11) NOT NULL,
  `ShopId` int(11) NOT NULL,
  `ShopCategoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `shoptocategories`
--

INSERT INTO `shoptocategories` (`Id`, `ShopId`, `ShopCategoryId`) VALUES
(6, 4, 3),
(7, 5, 13),
(8, 6, 3),
(9, 6, 4),
(10, 7, 3),
(11, 7, 4),
(12, 8, 3),
(13, 8, 4),
(14, 9, 3),
(15, 10, 4),
(16, 11, 4),
(17, 11, 3),
(18, 12, 3),
(19, 13, 3),
(20, 13, 4),
(21, 14, 3),
(22, 14, 4),
(23, 14, 5),
(24, 15, 5),
(25, 16, 3),
(26, 17, 3),
(27, 17, 4),
(28, 18, 3),
(29, 18, 4),
(30, 20, 3),
(31, 21, 3),
(32, 21, 4),
(33, 21, 5),
(34, 22, 3),
(35, 23, 3),
(36, 23, 4),
(37, 23, 5),
(38, 24, 3),
(39, 25, 12),
(40, 26, 3),
(41, 26, 4),
(42, 27, 3),
(43, 27, 4),
(44, 27, 5),
(45, 28, 3),
(46, 28, 4),
(47, 29, 3),
(48, 30, 3),
(49, 31, 3),
(50, 32, 3),
(51, 33, 3),
(52, 34, 3),
(53, 34, 4),
(54, 35, 3),
(55, 35, 4);

-- --------------------------------------------------------

--
-- Table structure for table `shoptosubcategories`
--

CREATE TABLE `shoptosubcategories` (
  `Id` int(11) NOT NULL,
  `ShopId` int(11) NOT NULL,
  `SubShopCategoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `shoptosubcategories`
--

INSERT INTO `shoptosubcategories` (`Id`, `ShopId`, `SubShopCategoryId`) VALUES
(4, 4, 4),
(5, 6, 7),
(6, 6, 12),
(7, 6, 9),
(8, 6, 13),
(9, 7, 7),
(10, 7, 12),
(11, 8, 8),
(12, 9, 7),
(13, 10, 10),
(14, 11, 4),
(15, 11, 10),
(16, 12, 4),
(17, 12, 6),
(18, 12, 7),
(19, 13, 6),
(20, 13, 11),
(21, 14, 6),
(22, 14, 11),
(23, 14, 15),
(24, 14, 14),
(25, 15, 14),
(26, 16, 4),
(27, 16, 6),
(28, 16, 7),
(29, 17, 4),
(30, 17, 6),
(31, 17, 11),
(32, 17, 6),
(33, 18, 8),
(34, 18, 17),
(35, 20, 4),
(36, 20, 7),
(37, 20, 6),
(38, 21, 4),
(39, 21, 10),
(40, 21, 14),
(41, 21, 7),
(42, 21, 12),
(43, 22, 8),
(44, 23, 4),
(45, 23, 6),
(46, 23, 7),
(47, 23, 10),
(48, 23, 11),
(49, 23, 12),
(50, 23, 14),
(51, 23, 15),
(52, 24, 4),
(53, 26, 4),
(54, 26, 6),
(55, 26, 10),
(56, 26, 11),
(57, 26, 7),
(58, 26, 12),
(59, 27, 4),
(60, 27, 10),
(61, 27, 6),
(62, 27, 11),
(63, 27, 12),
(64, 27, 7),
(65, 27, 14),
(66, 28, 4),
(67, 28, 10),
(68, 28, 6),
(69, 28, 11),
(70, 28, 7),
(71, 28, 12),
(72, 29, 4),
(73, 29, 6),
(74, 30, 4),
(75, 30, 6),
(76, 30, 7),
(77, 31, 7),
(78, 32, 7),
(79, 33, 4),
(80, 33, 6),
(81, 33, 7),
(82, 34, 4),
(83, 34, 10),
(84, 35, 4),
(85, 35, 10),
(86, 35, 12),
(87, 35, 7);

-- --------------------------------------------------------

--
-- Table structure for table `sociallinks`
--

CREATE TABLE `sociallinks` (
  `Id` int(11) NOT NULL,
  `Link` mediumtext COLLATE utf8_general_mysql500_ci,
  `Icon` mediumtext COLLATE utf8_general_mysql500_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subshopcategories`
--

CREATE TABLE `subshopcategories` (
  `Id` int(11) NOT NULL,
  `Queue` int(11) NOT NULL,
  `ShopCategoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `subshopcategories`
--

INSERT INTO `subshopcategories` (`Id`, `Queue`, `ShopCategoryId`) VALUES
(4, 1, 3),
(6, 2, 3),
(7, 3, 3),
(8, 4, 3),
(9, 5, 3),
(10, 0, 4),
(11, 0, 4),
(12, 0, 4),
(13, 0, 4),
(14, 0, 5),
(15, 0, 5),
(16, 0, 5),
(17, 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `subshopcategorydictionaries`
--

CREATE TABLE `subshopcategorydictionaries` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `SubShopCategoryId` int(11) NOT NULL,
  `LanguageId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `subshopcategorydictionaries`
--

INSERT INTO `subshopcategorydictionaries` (`Id`, `Name`, `SubShopCategoryId`, `LanguageId`) VALUES
(10, ' Qadın Geyimləri', 4, 1),
(11, NULL, 4, 2),
(12, NULL, 4, 3),
(16, 'Qadın Ayaqqabı', 6, 1),
(17, NULL, 6, 2),
(18, NULL, 6, 3),
(19, 'Aksessuar & Çantalar ', 7, 1),
(20, NULL, 7, 2),
(21, NULL, 7, 3),
(22, 'Parfumeriya & Kosmetika', 8, 1),
(23, NULL, 8, 2),
(24, NULL, 8, 3),
(25, 'Saat & Zinət Əşyaları', 9, 1),
(26, NULL, 9, 2),
(27, NULL, 9, 3),
(28, 'Kişi Geyimləri', 10, 1),
(29, NULL, 10, 2),
(30, NULL, 10, 3),
(31, 'Kişi Ayaqqabı', 11, 1),
(32, NULL, 11, 2),
(33, NULL, 11, 3),
(34, 'Aksessuar & Çantalar ', 12, 1),
(35, NULL, 12, 2),
(36, NULL, 12, 3),
(37, 'Saat & Zinət Əşyaları', 13, 1),
(38, NULL, 13, 2),
(39, NULL, 13, 3),
(40, 'Uşaq Geyimləri', 14, 1),
(41, NULL, 14, 2),
(42, NULL, 14, 3),
(43, 'Uşaq Ayaqqabı', 15, 1),
(44, NULL, 15, 2),
(45, NULL, 15, 3),
(46, 'Oyuncaq', 16, 1),
(47, NULL, 16, 2),
(48, NULL, 16, 3),
(49, 'Parfumeriya & Kosmetika', 17, 1),
(50, 'Parfumeriya & Kosmetika', 17, 2),
(51, 'Parfumeriya & Kosmetika', 17, 3);

-- --------------------------------------------------------

--
-- Table structure for table `__efmigrationshistory`
--

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL,
  `ProductVersion` varchar(32) COLLATE utf8_general_mysql500_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20190704075854_initial_v1', '2.2.4-servicing-10062'),
('20190705103819_initial_v2', '2.2.4-servicing-10062');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aboutuspagedictionaries`
--
ALTER TABLE `aboutuspagedictionaries`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_aboutUsPageDictionaries_AboutUspageId` (`AboutUspageId`),
  ADD KEY `IX_aboutUsPageDictionaries_LanguageId` (`LanguageId`);

--
-- Indexes for table `aboutuspages`
--
ALTER TABLE `aboutuspages`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `admnconfig`
--
ALTER TABLE `admnconfig`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `compaigndictionaries`
--
ALTER TABLE `compaigndictionaries`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_compaignDictionaries_CompaignId` (`CompaignId`),
  ADD KEY `IX_compaignDictionaries_LanguageId` (`LanguageId`);

--
-- Indexes for table `compaigns`
--
ALTER TABLE `compaigns`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_compaigns_ShopId` (`ShopId`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `galleryimages`
--
ALTER TABLE `galleryimages`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `generalinfos`
--
ALTER TABLE `generalinfos`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `homeslideritems`
--
ALTER TABLE `homeslideritems`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `metatags`
--
ALTER TABLE `metatags`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `newsdictionaries`
--
ALTER TABLE `newsdictionaries`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_newsDictionaries_LanguageId` (`LanguageId`),
  ADD KEY `IX_newsDictionaries_NewsId` (`NewsId`);

--
-- Indexes for table `newsimages`
--
ALTER TABLE `newsimages`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_newsImages_NewsId` (`NewsId`);

--
-- Indexes for table `newspagedictionaries`
--
ALTER TABLE `newspagedictionaries`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_newsPageDictionaries_LanguageId` (`LanguageId`),
  ADD KEY `IX_newsPageDictionaries_NewsPageId` (`NewsPageId`);

--
-- Indexes for table `newspages`
--
ALTER TABLE `newspages`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `seodescriptions`
--
ALTER TABLE `seodescriptions`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `seokeywords`
--
ALTER TABLE `seokeywords`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `shopcategories`
--
ALTER TABLE `shopcategories`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `shopcategorydictionaries`
--
ALTER TABLE `shopcategorydictionaries`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_shopCategoryDictionaries_LanguageId` (`LanguageId`),
  ADD KEY `IX_shopCategoryDictionaries_ShopCategoryId` (`ShopCategoryId`);

--
-- Indexes for table `shopdictionaries`
--
ALTER TABLE `shopdictionaries`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_shopDictionaries_LanguageId` (`LanguageId`),
  ADD KEY `IX_shopDictionaries_ShopId` (`ShopId`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `shoptocategories`
--
ALTER TABLE `shoptocategories`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_ShopToCategories_ShopCategoryId` (`ShopCategoryId`),
  ADD KEY `IX_ShopToCategories_ShopId` (`ShopId`);

--
-- Indexes for table `shoptosubcategories`
--
ALTER TABLE `shoptosubcategories`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_ShopToSubCategories_ShopId` (`ShopId`),
  ADD KEY `IX_ShopToSubCategories_SubShopCategoryId` (`SubShopCategoryId`);

--
-- Indexes for table `sociallinks`
--
ALTER TABLE `sociallinks`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `subshopcategories`
--
ALTER TABLE `subshopcategories`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_subShopCategories_ShopCategoryId` (`ShopCategoryId`);

--
-- Indexes for table `subshopcategorydictionaries`
--
ALTER TABLE `subshopcategorydictionaries`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_subShopCategoryDictionaries_LanguageId` (`LanguageId`),
  ADD KEY `IX_subShopCategoryDictionaries_SubShopCategoryId` (`SubShopCategoryId`);

--
-- Indexes for table `__efmigrationshistory`
--
ALTER TABLE `__efmigrationshistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aboutuspagedictionaries`
--
ALTER TABLE `aboutuspagedictionaries`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `aboutuspages`
--
ALTER TABLE `aboutuspages`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admnconfig`
--
ALTER TABLE `admnconfig`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `compaigndictionaries`
--
ALTER TABLE `compaigndictionaries`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compaigns`
--
ALTER TABLE `compaigns`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galleryimages`
--
ALTER TABLE `galleryimages`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `generalinfos`
--
ALTER TABLE `generalinfos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `homeslideritems`
--
ALTER TABLE `homeslideritems`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `metatags`
--
ALTER TABLE `metatags`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newsdictionaries`
--
ALTER TABLE `newsdictionaries`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newsimages`
--
ALTER TABLE `newsimages`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newspagedictionaries`
--
ALTER TABLE `newspagedictionaries`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newspages`
--
ALTER TABLE `newspages`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seodescriptions`
--
ALTER TABLE `seodescriptions`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seokeywords`
--
ALTER TABLE `seokeywords`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shopcategories`
--
ALTER TABLE `shopcategories`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `shopcategorydictionaries`
--
ALTER TABLE `shopcategorydictionaries`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `shopdictionaries`
--
ALTER TABLE `shopdictionaries`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `shoptocategories`
--
ALTER TABLE `shoptocategories`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `shoptosubcategories`
--
ALTER TABLE `shoptosubcategories`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `sociallinks`
--
ALTER TABLE `sociallinks`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subshopcategories`
--
ALTER TABLE `subshopcategories`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `subshopcategorydictionaries`
--
ALTER TABLE `subshopcategorydictionaries`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aboutuspagedictionaries`
--
ALTER TABLE `aboutuspagedictionaries`
  ADD CONSTRAINT `FK_aboutUsPageDictionaries_aboutUsPages_AboutUspageId` FOREIGN KEY (`AboutUspageId`) REFERENCES `aboutuspages` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_aboutUsPageDictionaries_languages_LanguageId` FOREIGN KEY (`LanguageId`) REFERENCES `languages` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `compaigndictionaries`
--
ALTER TABLE `compaigndictionaries`
  ADD CONSTRAINT `FK_compaignDictionaries_compaigns_CompaignId` FOREIGN KEY (`CompaignId`) REFERENCES `compaigns` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_compaignDictionaries_languages_LanguageId` FOREIGN KEY (`LanguageId`) REFERENCES `languages` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `compaigns`
--
ALTER TABLE `compaigns`
  ADD CONSTRAINT `FK_compaigns_shops_ShopId` FOREIGN KEY (`ShopId`) REFERENCES `shops` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `newsdictionaries`
--
ALTER TABLE `newsdictionaries`
  ADD CONSTRAINT `FK_newsDictionaries_languages_LanguageId` FOREIGN KEY (`LanguageId`) REFERENCES `languages` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_newsDictionaries_news_NewsId` FOREIGN KEY (`NewsId`) REFERENCES `news` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `newsimages`
--
ALTER TABLE `newsimages`
  ADD CONSTRAINT `FK_newsImages_news_NewsId` FOREIGN KEY (`NewsId`) REFERENCES `news` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `newspagedictionaries`
--
ALTER TABLE `newspagedictionaries`
  ADD CONSTRAINT `FK_newsPageDictionaries_languages_LanguageId` FOREIGN KEY (`LanguageId`) REFERENCES `languages` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_newsPageDictionaries_newsPages_NewsPageId` FOREIGN KEY (`NewsPageId`) REFERENCES `newspages` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `shopcategorydictionaries`
--
ALTER TABLE `shopcategorydictionaries`
  ADD CONSTRAINT `FK_shopCategoryDictionaries_languages_LanguageId` FOREIGN KEY (`LanguageId`) REFERENCES `languages` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_shopCategoryDictionaries_shopCategories_ShopCategoryId` FOREIGN KEY (`ShopCategoryId`) REFERENCES `shopcategories` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `shopdictionaries`
--
ALTER TABLE `shopdictionaries`
  ADD CONSTRAINT `FK_shopDictionaries_languages_LanguageId` FOREIGN KEY (`LanguageId`) REFERENCES `languages` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_shopDictionaries_shops_ShopId` FOREIGN KEY (`ShopId`) REFERENCES `shops` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `shoptocategories`
--
ALTER TABLE `shoptocategories`
  ADD CONSTRAINT `FK_ShopToCategories_shopCategories_ShopCategoryId` FOREIGN KEY (`ShopCategoryId`) REFERENCES `shopcategories` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_ShopToCategories_shops_ShopId` FOREIGN KEY (`ShopId`) REFERENCES `shops` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `shoptosubcategories`
--
ALTER TABLE `shoptosubcategories`
  ADD CONSTRAINT `FK_ShopToSubCategories_shops_ShopId` FOREIGN KEY (`ShopId`) REFERENCES `shops` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_ShopToSubCategories_subShopCategories_SubShopCategoryId` FOREIGN KEY (`SubShopCategoryId`) REFERENCES `subshopcategories` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `subshopcategories`
--
ALTER TABLE `subshopcategories`
  ADD CONSTRAINT `FK_subShopCategories_shopCategories_ShopCategoryId` FOREIGN KEY (`ShopCategoryId`) REFERENCES `shopcategories` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `subshopcategorydictionaries`
--
ALTER TABLE `subshopcategorydictionaries`
  ADD CONSTRAINT `FK_suategoryId` FOREIGN KEY (`SubShopCategoryId`) REFERENCES `subshopcategories` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_subShopCategoryDictionaries_languages_LanguageId` FOREIGN KEY (`LanguageId`) REFERENCES `languages` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
