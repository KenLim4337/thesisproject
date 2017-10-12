-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2017 at 11:50 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.5.35

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
(1, 4, 'System', 'Ready?', 'SYS', '0000-00-00 00:00:00');

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
(1, 'ITs Alive', 'IT', 'GUI', 0, 0, 0),
(3, 'Psyght for Sore Eyes', 'PSY', 'SOL', 0, 0, 0),
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
  MODIFY `lid` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `qid` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `questionlog`
--
ALTER TABLE `questionlog`
  MODIFY `qlid` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `solvelog`
--
ALTER TABLE `solvelog`
  MODIFY `sid` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
