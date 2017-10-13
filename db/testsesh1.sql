-- phpMyAdmin SQL Dump
-- version 4.6.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 13, 2017 at 03:58 PM
-- Server version: 5.6.28
-- PHP Version: 5.5.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thesis`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `aid` int(3) NOT NULL,
  `qid` int(11) NOT NULL,
  `text` varchar(50000) NOT NULL,
  `correct` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`aid`, `qid`, `text`, `correct`) VALUES
(1, 2, 'stay the same', 0),
(2, 2, 'decrease', 0),
(3, 2, 'increase about as often as it would decrease', 1),
(4, 2, 'become more similar to the standard deviation of the population', 0),
(5, 2, 'be calculated using different formulae depending on how small the sample size is', 0),
(6, 3, '&lt;!doctype html&gt;', 0),
(7, 3, '&lt;link&gt;', 1),
(8, 3, '&lt;body&gt;', 0),
(9, 3, '&lt;title&gt;', 0),
(10, 4, 'display', 0),
(11, 4, 'position', 1),
(12, 4, 'overflow', 0),
(13, 4, 'float', 0),
(14, 5, '&#46;mainNav &#123;color&#58; red&#59;&#125;', 0),
(15, 5, '&#35;mainNav &#123;color&#58; red&#59;&#125;', 1),
(16, 5, 'id &gt; mainNav &#123;color&#58; red&#59;&#125;', 0),
(17, 5, '&#43;mainNav &#123;color&#58; red&#59;&#125;', 0),
(18, 6, 'Block-level elements are rendered on a new line.', 0),
(19, 6, 'Block-level elements will expand to take up the full width of their parent container.', 0),
(20, 6, 'Block-level elements cannot contain inline elements.', 1),
(21, 6, 'The height of block-level elements will expand automatically to fit its child elements.', 0),
(22, 7, '&#36;&#40;&#39;&lt;img&gt;&#39;&#41;', 0),
(23, 7, '&#36;&#40;&#39;img&#39;&#41;', 1),
(24, 7, 'document.getElementByTagname&#40;&#39;img&#39;&#41;', 0),
(25, 7, '&#36;&#40;img&#41;', 0),
(26, 8, 'y &#61; x&#91;5&#58;8&#93;', 0),
(27, 8, 'y &#61; x&#91;5&#58;9&#93;', 0),
(28, 8, 'y &#61; x&#91;6&#58;9&#93;', 0),
(29, 8, 'y &#61; x&#91;6&#58;10&#93;', 1),
(30, 8, 'None of the above are correct.', 0),
(31, 9, 'Demonstrations used to help other understand ambiguous words', 0),
(32, 9, 'Nonverbal behaviours that aid or compliment the clarification of word meaning', 1),
(33, 9, 'Gestures that replace spoken language', 0),
(34, 9, 'A pictorial representation of words', 0),
(35, 10, 'Low-balling', 0),
(36, 10, 'Door-in-the-face technique', 0),
(37, 10, 'Foot-in-the-door technique ', 1),
(38, 10, 'Reciprocal concessions', 0),
(39, 11, 'Type I error', 0),
(40, 11, 'Type II error', 0),
(41, 11, 'Type III error', 0),
(42, 11, 'correct decision', 1),
(43, 11, 'none of the above', 0),
(44, 12, 'Genetic link to aggression and innate structures (for example, the amygdale)', 0),
(45, 12, 'Maladaptive thinking patterns and misperceptions', 0),
(46, 12, 'Observational learning or modelling', 1),
(47, 12, 'Innate tendencies', 0),
(48, 13, 'Paranoid delusion', 0),
(49, 13, 'Thought disorder', 0),
(50, 13, 'Tactile hallucination', 1),
(51, 13, 'Visual hallucination', 0);

-- --------------------------------------------------------

--
-- Table structure for table `chatlog`
--

CREATE TABLE `chatlog` (
  `lid` int(3) NOT NULL,
  `uid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `message` varchar(50000) NOT NULL,
  `role` char(3) NOT NULL,
  `dtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chatlog`
--

INSERT INTO `chatlog` (`lid`, `uid`, `name`, `message`, `role`, `dtime`) VALUES
(1, 4, 'System', 'Ready?', 'SYS', '0000-00-00 00:00:00'),
(22, 3, 'Psyght for Sore Eyes', 'o.o', 'SOL', '2017-10-13 01:06:55'),
(23, 3, 'Psyght for Sore Eyes', '\nQuestion 1: What is the correct jQuery selector for targeting all image elements in a HTML document?', 'SOL', '2017-10-13 01:07:46'),
(24, 3, 'Psyght for Sore Eyes', 'What is a jQuery?', 'SOL', '2017-10-13 01:09:18'),
(25, 1, 'ITs Alive', 'jQuery is a library for JavaScript (a web design language)', 'GUI', '2017-10-13 01:10:00'),
(26, 1, 'ITs Alive', '\nit is generally used for animations, and building in functionality into the website', 'GUI', '2017-10-13 01:10:25'),
(27, 3, 'Psyght for Sore Eyes', '\nOk', 'SOL', '2017-10-13 01:11:18'),
(28, 1, 'ITs Alive', 'so an image element is shown in html (another language that builds the structure of the website).as <img>.  ', 'GUI', '2017-10-13 01:12:29'),
(29, 1, 'ITs Alive', 'however within jQuery if you want to select something that contains the tag \'<>\' you exclude them from the syntax. The selecting command is the $.', 'GUI', '2017-10-13 01:15:09'),
(30, 3, 'Psyght for Sore Eyes', '\nso then the answer would be $(\'img\') ?', 'SOL', '2017-10-13 01:16:06'),
(31, 1, 'ITs Alive', 'yes\n', 'GUI', '2017-10-13 01:16:15'),
(32, 1, 'ITs Alive', '\ni mean hopefully ', 'GUI', '2017-10-13 01:16:24'),
(33, 3, 'Psyght for Sore Eyes', '\nlooks like it XD', 'SOL', '2017-10-13 01:16:33'),
(34, 3, 'Psyght for Sore Eyes', '\nSo what is CSS?', 'SOL', '2017-10-13 01:17:04'),
(35, 1, 'ITs Alive', '\nso previously we said html is the structure of the website. CSS is basically the language used to add style to the structure ', 'GUI', '2017-10-13 01:18:08'),
(36, 1, 'ITs Alive', 'Just to make it look pretty', 'GUI', '2017-10-13 01:18:32'),
(37, 3, 'Psyght for Sore Eyes', '\nso position or display?', 'SOL', '2017-10-13 01:19:04'),
(38, 1, 'ITs Alive', 'yeah one of them\n', 'GUI', '2017-10-13 01:24:16'),
(39, 3, 'Psyght for Sore Eyes', '\ncool ', 'SOL', '2017-10-13 01:24:24'),
(40, 3, 'Psyght for Sore Eyes', '\nnarrows it down at least?\\', 'SOL', '2017-10-13 01:24:36'),
(41, 3, 'Psyght for Sore Eyes', 'it was position\n', 'SOL', '2017-10-13 01:24:53'),
(42, 3, 'Psyght for Sore Eyes', '\nfirst thought is the one with the ! in it because wtf', 'SOL', '2017-10-13 01:25:36'),
(43, 3, 'Psyght for Sore Eyes', '\nwhy is there an ! mark there', 'SOL', '2017-10-13 01:25:43'),
(44, 1, 'ITs Alive', 'so an HTML document is structured like this:', 'GUI', '2017-10-13 01:26:05'),
(45, 1, 'ITs Alive', '\n', 'GUI', '2017-10-13 01:26:06'),
(46, 1, 'ITs Alive', '\n<!doctype html>', 'GUI', '2017-10-13 01:26:12'),
(47, 1, 'ITs Alive', '<!Doctype>\n', 'GUI', '2017-10-13 01:26:44'),
(48, 3, 'Psyght for Sore Eyes', '\nexplain plez', 'SOL', '2017-10-13 01:26:55'),
(49, 1, 'ITs Alive', '\nso in html you first define the document type, which is doctype html. Then you have a head - were you link different CSS and JavaScript files, and the title - and then have the body', 'GUI', '2017-10-13 01:27:46'),
(50, 1, 'ITs Alive', '\nyou can have an html doc that is not linked to css or javascript', 'GUI', '2017-10-13 01:28:28'),
(51, 3, 'Psyght for Sore Eyes', '\nwhat is linking tho?', 'SOL', '2017-10-13 01:28:43'),
(52, 3, 'Psyght for Sore Eyes', '\nDo u need a command for it?', 'SOL', '2017-10-13 01:28:49'),
(53, 3, 'Psyght for Sore Eyes', '\n', 'SOL', '2017-10-13 01:28:55'),
(54, 1, 'ITs Alive', 'The tags given above are all relevant tags', 'GUI', '2017-10-13 01:29:10'),
(55, 3, 'Psyght for Sore Eyes', '\nlike is \'link\' an element', 'SOL', '2017-10-13 01:29:12'),
(56, 3, 'Psyght for Sore Eyes', '\noh ok', 'SOL', '2017-10-13 01:29:18'),
(57, 3, 'Psyght for Sore Eyes', 'why is there an exclamation mark in one but not the others?\n', 'SOL', '2017-10-13 01:30:21'),
(58, 1, 'ITs Alive', 'its just how websites read html', 'GUI', '2017-10-13 01:30:38'),
(59, 3, 'Psyght for Sore Eyes', '\nohk', 'SOL', '2017-10-13 01:30:45'),
(60, 3, 'Psyght for Sore Eyes', '\nnot confusing at all', 'SOL', '2017-10-13 01:30:49'),
(61, 1, 'ITs Alive', '\njust to make sure its not reading something else', 'GUI', '2017-10-13 01:30:51'),
(62, 1, 'ITs Alive', 'that sounds pretty low to me', 'SOL', '2017-10-13 01:34:27'),
(63, 3, 'Psyght for Sore Eyes', 'so basically she is asking a small favor then using that to lead onto a larger favor', 'GUI', '2017-10-13 01:34:58'),
(64, 1, 'ITs Alive', '\nso it sounds like she has a \'foot\' in the door, and then inviting herself in.. metaphorically spesaking', 'SOL', '2017-10-13 01:35:36'),
(65, 3, 'Psyght for Sore Eyes', 'pretty much', 'GUI', '2017-10-13 01:35:42'),
(66, 1, 'ITs Alive', '\n', 'SOL', '2017-10-13 01:35:48'),
(67, 1, 'ITs Alive', 'could you explain', 'SOL', '2017-10-13 01:36:34'),
(68, 3, 'Psyght for Sore Eyes', '\nso an illustrator is a type of nonverbal communication in the form of hand gestures', 'GUI', '2017-10-13 01:36:50'),
(69, 3, 'Psyght for Sore Eyes', '\nit is often used to further \'illustrate\' ur point ', 'GUI', '2017-10-13 01:37:15'),
(70, 3, 'Psyght for Sore Eyes', '\nas an addition to spoken language', 'GUI', '2017-10-13 01:37:28'),
(71, 3, 'Psyght for Sore Eyes', '\ncool', 'GUI', '2017-10-13 01:37:30'),
(72, 3, 'Psyght for Sore Eyes', '\ngood job', 'GUI', '2017-10-13 01:37:32'),
(73, 1, 'ITs Alive', '\nthanks', 'SOL', '2017-10-13 01:37:38'),
(74, 3, 'Psyght for Sore Eyes', 'So the larger ur sample, the closer it is to the population', 'GUI', '2017-10-13 01:38:20'),
(75, 3, 'Psyght for Sore Eyes', '\nThe closer to the population the less error there will be in your calculations', 'GUI', '2017-10-13 01:38:35'),
(76, 3, 'Psyght for Sore Eyes', '\nso if the sample decreases the error should increase', 'GUI', '2017-10-13 01:38:47'),
(77, 3, 'Psyght for Sore Eyes', '\nbecause you are prone to more bias', 'GUI', '2017-10-13 01:39:01'),
(78, 1, 'ITs Alive', 'cool\n', 'SOL', '2017-10-13 01:39:28'),
(79, 1, 'ITs Alive', '\n\'we dont get this one at all', 'SOL', '2017-10-13 01:39:32'),
(80, 1, 'ITs Alive', '\nis it correct decision? because from what i remember of statistics researchers try to prove the Ho false ', 'SOL', '2017-10-13 01:40:12'),
(81, 1, 'ITs Alive', '\nbecause they cant prove Ha', 'SOL', '2017-10-13 01:40:19'),
(82, 3, 'Psyght for Sore Eyes', 'Null hypothesis is saying there won\'t be a relationship ', 'GUI', '2017-10-13 01:41:00'),
(83, 3, 'Psyght for Sore Eyes', '\nin order to provide evidence for your hypothesis (H1) u need to prove the HO (Null) to be false', 'GUI', '2017-10-13 01:41:33'),
(84, 3, 'Psyght for Sore Eyes', '\nso if it is false', 'GUI', '2017-10-13 01:41:45'),
(85, 3, 'Psyght for Sore Eyes', '\nthere is probably evidence for the relationship', 'GUI', '2017-10-13 01:41:54'),
(86, 1, 'ITs Alive', '\nthe the researcher was correct', 'SOL', '2017-10-13 01:41:55'),
(87, 1, 'ITs Alive', '\ncool', 'SOL', '2017-10-13 01:41:58');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `qid` int(3) NOT NULL,
  `text` varchar(50000) NOT NULL,
  `disc` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`qid`, `text`, `disc`) VALUES
(2, 'As sample size decreases, the standard error of the mean would:', 'IT'),
(3, 'Which of the following HTML elements is NOT required in the basic HTML page \nstructure?', 'PSY'),
(4, 'Which of the following CSS properties defines where an HTML element will be rendered in the browser window?', 'PSY'),
(5, 'Which of the following CSS rules will apply styling to the HTML element  &lt;nav id&#61;&quot;mainNav&quot;&gt;... &lt;&#47;nav&gt;?', 'PSY'),
(6, 'Which of the following does NOT apply to block-level elements? ', 'PSY'),
(7, 'What is the correct jQuery selector for targeting all image elements in a HTML document?', 'PSY'),
(8, 'After the assignment x &#61; &#39;Very Naughty Boy&#39;, which of the following assigns &#39;augh&#39; to the variable y?', 'PSY'),
(9, 'What does the term illustrators refer to?', 'IT'),
(10, 'Grace and Alex are course mates and Alex has a car. After class on Friday, Grace asked Alex if he could drive her home.  Alex agreed. When they were almost at Grace&#39s house, she mentioned that she needed to collect her flat-pack bookshelves from Ikea and asked Alex if he would mind helping her by transporting the furniture. What persuasion technique was Grace using?', 'IT'),
(11, 'If the null hypothesis is false and the researcher declares a relationship in the data to be statistically significant in the same direction to the direction in the population, which of the following has occurred?', 'IT'),
(12, 'According to social cognitive explanations, why are people so aggressive?', 'IT'),
(13, 'Lucas is currently in an active phase of Schizophrenia. He feels like there are spiders crawling all over him.  Which statement best describes his reported symptom?', 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `questionlog`
--

CREATE TABLE `questionlog` (
  `qlid` int(3) NOT NULL,
  `qid` int(3) NOT NULL,
  `dtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questionlog`
--

INSERT INTO `questionlog` (`qlid`, `qid`, `dtime`) VALUES
(2, 3, '2017-10-13 00:36:01'),
(3, 6, '2017-10-13 00:44:11'),
(4, 7, '2017-10-13 00:50:13'),
(5, 8, '2017-10-13 00:50:44'),
(6, 3, '2017-10-13 00:50:45'),
(7, 4, '2017-10-13 00:51:02'),
(8, 3, '2017-10-13 00:51:03'),
(9, 7, '2017-10-13 00:51:47'),
(10, 6, '2017-10-13 00:52:01'),
(11, 7, '2017-10-13 00:52:15'),
(12, 8, '2017-10-13 00:52:28'),
(13, 7, '2017-10-13 01:06:38'),
(14, 4, '2017-10-13 01:16:22'),
(15, 3, '2017-10-13 01:24:41'),
(16, 6, '2017-10-13 01:31:21'),
(17, 11, '2017-10-13 01:32:29'),
(18, 10, '2017-10-13 01:33:21'),
(19, 9, '2017-10-13 01:35:51'),
(20, 2, '2017-10-13 01:37:28'),
(21, 11, '2017-10-13 01:39:12'),
(22, 13, '2017-10-13 01:42:02');

-- --------------------------------------------------------

--
-- Table structure for table `solvelog`
--

CREATE TABLE `solvelog` (
  `sid` int(3) NOT NULL,
  `uid` int(3) NOT NULL,
  `qid` int(3) NOT NULL,
  `attempts` int(3) NOT NULL,
  `timetaken` int(10) NOT NULL,
  `disc` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `solvelog`
--

INSERT INTO `solvelog` (`sid`, `uid`, `qid`, `attempts`, `timetaken`, `disc`) VALUES
(90, 3, 7, 1, 583, 'PSY'),
(91, 3, 4, 1, 499, 'PSY'),
(92, 3, 3, 1, 399, 'PSY'),
(93, 1, 10, 1, 150, 'IT'),
(94, 1, 9, 1, 96, 'IT'),
(95, 1, 2, 1, 104, 'IT'),
(96, 1, 11, 1, 169, 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  `disc` varchar(3) NOT NULL,
  `role` varchar(3) NOT NULL,
  `posts` int(3) NOT NULL,
  `solved` int(3) NOT NULL,
  `guided` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `disc`, `role`, `posts`, `solved`, `guided`) VALUES
(1, 'ITs Alive', 'IT', 'SOL', 0, 0, 0),
(3, 'Psyght for Sore Eyes', 'PSY', 'GUI', 0, 0, 0),
(4, 'System', 'SYS', 'SYS', 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `chatlog`
--
ALTER TABLE `chatlog`
  ADD PRIMARY KEY (`lid`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `questionlog`
--
ALTER TABLE `questionlog`
  ADD PRIMARY KEY (`qlid`);

--
-- Indexes for table `solvelog`
--
ALTER TABLE `solvelog`
  ADD PRIMARY KEY (`sid`),
  ADD UNIQUE KEY `qid` (`qid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `aid` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `chatlog`
--
ALTER TABLE `chatlog`
  MODIFY `lid` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `qid` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `questionlog`
--
ALTER TABLE `questionlog`
  MODIFY `qlid` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `solvelog`
--
ALTER TABLE `solvelog`
  MODIFY `sid` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
