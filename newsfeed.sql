

CREATE TABLE IF NOT EXISTS `about` (
  `id` integer primary key autoincrement,
  `about` longtext NOT NULL) ;

INSERT INTO `about` ( `about`) VALUES
('<p>&nbsp;A trend-setter in its space, Network18 Media and Investments Ltd is one of the largest media conglomerates with diversified but synergistic interests in Television with its bouquet of fifty channels in India and thirteen international channels, besides filmed entertainment, digital content, magazines, digital commerce and allied businesses. Network18 is promoted by Independent Media Trust of which Reliance Industries is the sole beneficiary.&nbsp;<strong><strong>TV18 Broadcast ltd</strong>, a subsidiary of Network18</strong>&nbsp;manages its primary business of broadcasting. TV18 runs the largest news network in India, spanning business news, general news and regional news channels.</p>\r\n\r\n<blockquote>\r\n<ol>\r\n	<li>\r\n	<h3 style=\"color:#aaaaaa; font-style:italic\"><small>Network18 has built successful strategic alliances with globally reputed media players such as Viacom, CNBC, CNN, A+E Networks and Forbes</small></h3>\r\n	</li>\r\n	<li>\r\n	<h3 style=\"color:#aaaaaa; font-style:italic\"><small>Steered by a professional and experienced team of editors, news tellers and entertainers, Network18 constantly seeds new ideas of programming and triggers thought processes</small></h3>\r\n	</li>\r\n	<li>\r\n	<h3 style=\"color:#aaaaaa; font-style:italic\"><small>At Network18, the focus is on driving the highest standards of creative excellence by fostering a culture of innovation to build new content formats thereby creating strong brands across diverse media</small></h3>\r\n	</li>\r\n	<li>\r\n	<h3 style=\"color:#aaaaaa; font-style:italic\"><small>Through its continued investments in regional and digital platforms, Network18 claims unparalleled reach</small></h3>\r\n	</li>\r\n</ol>\r\n</blockquote>\r\n');

CREATE TABLE IF NOT EXISTS `admin` (
  `id` integer primary key autoincrement,
  `name` varchar(50) NOT NULL,
  `username` varchar(30) NOT NULL UNIQUE,
  `email` varchar(24) NOT NULL,
  `password` text  NOT NULL
);

INSERT INTO `admin` ( `name`, `username`, `email`, `password`) VALUES
('Administrator', 'admin', 'admin@gmail.com', '$pbkdf2-sha256$29000$ljJmDKFUCsG4d66VsvZeqw$ao47Dor9x/uDQahO5N1fZJzmS9dGyo7LPS7SEkWeVVo');

CREATE TABLE IF NOT EXISTS `category` (
  `cid` integer primary key autoincrement,
  `cname` varchar(30) NOT NULL
);

INSERT INTO `category` ( `cname`) VALUES
( 'entertainment'),
( 'sports'),
( 'politics'),
( 'business');

CREATE TABLE IF NOT EXISTS `contact` (
  `id` integer primary key autoincrement,
  `address` varchar(200) NOT NULL,
  `phone` varchar(15)  NOT NULL,
  `email` varchar(55) NOT NULL,
  `fax` varchar(15) NOT NULL
);

INSERT INTO `contact` ( `address`, `phone`, `email`, `fax`) VALUES
('Computer Science Departmenet, University of Balochistan', '923058477002', 'Iscobaloch@gmail.org', '92812633881');

CREATE TABLE IF NOT EXISTS `posts` (
  `pid` integer primary key autoincrement,
  `pheading` mediumtext NOT NULL,
  `pdescription` mediumtext NOT NULL,
  `pthumbnail` varchar(100) NOT NULL,
  `catid` integer NOT NULL,
  `pdetails` longtext,
  `ptime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pubid` varchar(40) NOT NULL, 
  FOREIGN KEY('catid') REFERENCES category('cid')
);


CREATE TABLE IF NOT EXISTS `user` (
  `id` integer primary key autoincrement,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL UNIQUE,
  `email` varchar(24) NOT NULL,
  `password` varchar(300) 
  NOT NULL
);

INSERT INTO `user` ( `name`, `username`, `email`, `password`) VALUES
('Wali Baloch', 'wali', 'wali@gmail.com', '$pbkdf2-sha256$29000$vFfKGcPYe0/pnTOGcG6tNQ$WRuiWOFVS7ShWntrK6fRn1qgBgQVj0TgmKFCyU8GOTk'),
('Hamza Rajput', 'hamza', 'hamza@gmail.com', '$pbkdf2-sha256$29000$CyEkROjdu1cKAcA4p1QKAQ$qJYXpm/IsIb8o4SgbR83lFuKMLIa9KZFu5yySdYyApQ');



