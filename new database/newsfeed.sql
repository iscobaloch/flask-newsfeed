-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 08, 2021 at 04:34 PM
-- Server version: 8.0.26-0ubuntu0.20.04.2
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: newsfeed
--
CREATE DATABASE IF NOT EXISTS newsfeed DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE newsfeed;

-- --------------------------------------------------------

--
-- Table structure for table about
--

DROP TABLE IF EXISTS about;
CREATE TABLE IF NOT EXISTS about (
  id int NOT NULL AUTO_INCREMENT,
  about longtext NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table about
--

INSERT INTO about (id, about) VALUES
(9, '<p>&nbsp;A trend-setter in its space, Network18 Media and Investments Ltd is one of the largest media conglomerates with diversified but synergistic interests in Television with its bouquet of fifty channels in India and thirteen international channels, besides filmed entertainment, digital content, magazines, digital commerce and allied businesses. Network18 is promoted by Independent Media Trust of which Reliance Industries is the sole beneficiary.&nbsp;<strong><strong>TV18 Broadcast ltd</strong>, a subsidiary of Network18</strong>&nbsp;manages its primary business of broadcasting. TV18 runs the largest news network in India, spanning business news, general news and regional news channels.</p>\r\n\r\n<blockquote>\r\n<ol>\r\n	<li>\r\n	<h3 style=\"color:#aaaaaa; font-style:italic\"><small>Network18 has built successful strategic alliances with globally reputed media players such as Viacom, CNBC, CNN, A+E Networks and Forbes</small></h3>\r\n	</li>\r\n	<li>\r\n	<h3 style=\"color:#aaaaaa; font-style:italic\"><small>Steered by a professional and experienced team of editors, news tellers and entertainers, Network18 constantly seeds new ideas of programming and triggers thought processes</small></h3>\r\n	</li>\r\n	<li>\r\n	<h3 style=\"color:#aaaaaa; font-style:italic\"><small>At Network18, the focus is on driving the highest standards of creative excellence by fostering a culture of innovation to build new content formats thereby creating strong brands across diverse media</small></h3>\r\n	</li>\r\n	<li>\r\n	<h3 style=\"color:#aaaaaa; font-style:italic\"><small>Through its continued investments in regional and digital platforms, Network18 claims unparalleled reach</small></h3>\r\n	</li>\r\n</ol>\r\n</blockquote>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table admin
--

DROP TABLE IF EXISTS admin;
CREATE TABLE IF NOT EXISTS `admin` (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  username varchar(30) NOT NULL,
  email varchar(24) NOT NULL,
  password text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table admin
--

INSERT INTO admin (id, `name`, username, email, `password`) VALUES
(2, 'Administrator', 'admin', 'admin@gmail.com', '$pbkdf2-sha256$29000$RghhrJWSknLuPWcsZaxVKg$iclKG/LWMkkSQpge1lY41LlMpfxC5y/X9dHfOvkE1RM');

-- --------------------------------------------------------

--
-- Table structure for table category
--

DROP TABLE IF EXISTS category;
CREATE TABLE IF NOT EXISTS category (
  cid int NOT NULL AUTO_INCREMENT,
  cname varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (cid)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table category
--

INSERT INTO category (cid, cname) VALUES
(1, 'politics'),
(2, 'entertainment'),
(3, 'business'),
(4, 'technology'),
(7, 'sports');

-- --------------------------------------------------------

--
-- Table structure for table contact
--

DROP TABLE IF EXISTS contact;
CREATE TABLE IF NOT EXISTS contact (
  id int NOT NULL AUTO_INCREMENT,
  address varchar(200) NOT NULL,
  phone varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  email varchar(55) NOT NULL,
  fax varchar(15) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table contact
--

INSERT INTO contact (id, address, phone, email, fax) VALUES
(11, 'Computer Science Departmenet, University of Balochistan', '923058477002', 'Iscobaloch@gmail.org', '92812633881');

-- --------------------------------------------------------

--
-- Table structure for table posts
--

DROP TABLE IF EXISTS posts;
CREATE TABLE IF NOT EXISTS posts (
  pid int NOT NULL AUTO_INCREMENT,
  pheading mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  pdescription mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  pthumbnail varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  catid int NOT NULL,
  pdetails longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  ptime datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  pubid varchar(40) NOT NULL,
  PRIMARY KEY (pid)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table posts
--

INSERT INTO posts (pid, pheading, pdescription, pthumbnail, catid, pdetails, ptime, pubid) VALUES
(6, 'Flawed policies produce trade deficit', 'The PTI government inherited the highest ever merchandise trade deficit of our history — $37.6 billion in 2017-18 (with the import bill at $60.8bn and export earnings at $23.2bn). It had no option but to opt for tariff barriers to contain this huge deficit. And it did the same.', 'hmR45X9h6gty6d5jCxATeyFz4qo.jpg', 3, 'Goods’ trade deficit fell to $31.8bn in 2018-19 and then to $23.2bn in 2019-20 but it shot up again to $31.1bn in 2020-21. And, in two months of this fiscal year (July-August), the deficit has skyrocketed to about $7.5bn due to a phenomenal rise in imports. Our policymakers are coming up with incentive packages for exports and have asked the relevant officials to begin forecasting foreign trade on a monthly basis. The tariff barriers introduced in the first year of the PTI government were withdrawn later and have so far not been reintroduced.\r\n\r\nPakistan’s foreign trade model has some structural flaws that make it difficult to sustain export gains over a long time. And, it also has flaws that make it difficult to keep imports’ growth aligned with export development and GDP growth.\r\n\r\nAs a result, every now and then we see imports growing too fast and export growing too slow or remaining stagnant. When trade deficit expands policymakers try to find some quick-fix solutions. But in the long run, structural issues compound. Uncertainty persists. And, after every few years, the economy has to pay the price of a sudden rise in the trade deficit.\r\n\r\nDuring the last three years of the Gen Musharraf era, Pakistan attracted $15bn in foreign direct investment. That investment expanded the stock of capital goods, led to higher industrial outputs and facilitated exports’ growth in coming years — particularly in 2008-9, 2009-10 and 2010-11. Musharraf’s advisers should have foreseen that the gushing foreign direct investment (FDI) inflow that came in, partly due to his pro-West policies, would eventually come to a halt. And, they should have leveraged FDI inflows to increase domestic investment in industries. But that did not happen. Local investment grew but not to the extent to support a pro-export foreign trade model after an eventual drying up of FDI inflows.\r\n\r\nThe PPP government that came in after Musharraf did little to promote domestic investment. It rather tried to push exports including food exports through subsidies. Policymakers of the Zardari era did not foresee the eventual outcome of their strategy — a jump in the fiscal deficit and consequent reduction in subsidies. Exports’ growth in 2009-09, 2009-10 and 2010-11 fell in 2011-12, bounced back briefly in 2012-13 but then saw little or no growth in next four years.\r\n\r\nIt was only during the last year of the PML-N government in 2017-18 that exports strongly bounced back mostly due to energy and other input subsidies offered to food, textiles and some other export sectors. Policymakers of the Nawaz era failed to anticipate correctly the kind of phenomenal growth in imports that was bound to occur after the launch of the China-Pakistan Economic Corridor (CPEC). It resulted in skyrocketing imports, creating an unmanageable foreign trade deficit in 2017-18, in the absence of a matching growth in exports.\r\n\r\nThe current PTI regime inherited a large trade deficit and tried to fix it by containing imports and allegedly by going slow on CPEC projects. Little did they do in their first three years to prepare exporters for operating efficiently after the withdrawal of energy subsidies. Nor did they take any major initiative to prepare them to learn to leverage increased imports after the accelerated implementation of CPEC projects for boosting exports.\r\n\r\nWe are again back to square one: goods’ trade deficit continues to expand, making the rupee weaker, prompting imported inflation and depreciating PTI’s political capital.\r\n\r\nOne key reason why Pakistan failed in developing a sustainable foreign trade model in the past two decades is that the country has not wholeheartedly acknowledged a key fact: there is no escape from enhancing GDP growth more via increased foreign trade and less via domestic economy.\r\n\r\nThe share of global trade in the global economy that stood at 45.5 per cent in 1999 gradually shot up to 58.2pc in 2019, according to the World Bank’s latest stats. But Pakistan’s share of foreign trade in its GDP is far lesser — about 26pc, according to 2020 stats.\r\n\r\nBefore developing a sustainable foreign trade model, it is necessary to acknowledge the growing importance of foreign trade in economic growth. This means, instead of containing imports unwisely, policymakers should focus on enabling industries to absorb increased imports for producing value-added exportable items.\r\n\r\nA blanket upward tariff revision of thousands of categories of items only suppresses their demand in local markets temporarily. This pent-up demand emerges after a while. Besides, unilateral tariff hikes prompt reprisals from foreign trade partners. And when we are under an International Monetary Fund programme —as we are now — the Fund officials object to such tariff hikes and the government of the day has to reverse them.\r\n\r\nAnother structural problem with Pakistan’s foreign trade model is that our industrial base is shallow and we do not produce lots of consumer goods that can be produced domestically with some investment in technology and skills development. The country has recently been able to manufacture and export mobile phones. This could have been done much earlier and could have helped boost merchandise exports. Pakistan’s export model should have been designed to facilitate indigenisation of technology with foreign collaboration.\r\n\r\nPublished in Dawn, The Business and Finance Weekly, September 20th, 2021', '2021-09-22 08:52:15', 'admin'),
(7, 'Paapam seeks release of sales tax refunds for tractor industry', 'KARACHI: The auto-parts vending industry has closed down partially due to the non-payment of over six billion rupees in sales tax (ST) refunds to the tractor industry. Majority of the units are running on a single shift while vendors say they are moving towards complete shutdown.', 'JaS3uVHHgVSx2YmmirH9YAlFMwo.jpg', 3, 'In a letter addressed to Prime Minister Imran Khan and Finance Minister Shaukat Tarin, Pakistan Automotive Association of Parts and Accessories Manufacturers (Paapam) Chairman Abdul Rehman Aizaz reiterated the demand that the government must clear over Rs6bn in ST refunds of the tractor industry which have been held up for more than 20 months. He pleaded that the closure of tractor-vending industry was dangerous — especially for agro economy which is the lifeline of farm mechanisation — at a time when the country was facing a severe deficit of foodgrain and a sharp increase in the import bill.\r\n\r\n“Tractor manufacturers and their vending industry are inter-connected and the delay in release of ST refunds to tractor assemblers has put vendors in cash flow blockage. This has led to the possibility of forced closure of parts manufacturers within a few days,” the Paapam chief said. He added that this closure would leave millions of direct and indirect workers jobless.\r\n\r\n“Pakistan’s food import bill has widened by over 50 per cent to $1.47 billion in 2MFY22 year to bridge the gap in food production, thus triggering trade deficit that may cause uneasiness on the external side for the government,” he said.\r\n\r\nPakistan had spent over a billion dollars on the import of edible items in FY21, while the import bill would further go up in coming months following the government’s decision to import another 0.6 million tonnes of sugar and 4m tonnes of wheat to build strategic reserves, he added.\r\n\r\nThe Paapam letter noted that the import bill of all food items posted growth in value and quantity, indicating a shortage in domestic production which can be met only through increase in per acre yield through farm mechanisation.\r\n\r\nThe present closure of tractor and its vending industry would affect the current rice harvesting season and sowing of potatoes, maize and wheat, resulting into further shortage of food, he said.\r\n\r\nPublished in Dawn, September 21st, 2021', '2021-09-22 08:56:10', 'admin'),
(8, 'Bike riders become essential part of Covid-era economy', 'KARACHI: Most of us constantly come into contact with riders, sometimes daily. Most seldom give them a second glance.', '14.jpg', 3, 'When 25-year-old Imran asked for water while delivering a parcel to a house during an extremely hot day, the person he asked was taken aback. “It was almost as I was not seen as a human,” he laughed. “I felt weird but it was very hot and I didn’t have any water. I usually keep my contact minimum.”\r\n\r\nImran, who has been working as a rider for a company for a couple of years, didn’t mind the reaction. He is aware that he is invisible to most people but he knows how important his job is. “It’s just like other people working in essential services — most of us are invisible but important. Like the people at a petrol station, how many of us even look at them. They are just voices and shadows in your lives, but if they are not there, it will be difficult to function.”\r\n\r\nRecently, riders like Imran have become even more important for the economy as it has shaped over the past year or so with many businesses going online.\r\n\r\nPakistan has seen a rise in demand for businesses over the last year or so, especially since the Covid pandemic has restricted mass movement. Online shopping and delivery have become a big part of our lives, especially the younger generation.\r\n\r\nThere are so many issues that have to be addressed about motorcycle transport in Pakistan, which is rising rapidly. Planning and appraisal of the policies are needed but this can only be done if proper research is done on this topic.\r\n\r\nOne person who is aware of the importance of riders is Engineer Murtaza Asad. Asad who is a member of the PSQCA for road safety, road traffic safety management systems, is conducting an important research on bike riders in Pakistan.\r\n\r\nCommenting on his research, Engineer Asad said that the employment opportunities created for bike riders are phenomenal and are an improvement on the services that were already being provided by people like electricians, milkmen, and others.\r\n\r\n“In this research, we are studying how the unemployment online is tackled by employing bike riders and what are their basic needs such as health, road safety, and maintenance.\r\n\r\nAsad has been involved in different projects from which riders will benefit like getting a basic degree, learning new skills, and adding value to their skills to help them in building a professional profile. This is important for the rider and the industry as a whole.\r\n\r\n“Our research will help a rider to find out his niches in the industry and improve on them. And for the first time, he will get a letter of experience which will highlight his positives and strengths — for example, what are his interests and where will these interests and skills be better used. If he is good at delivery, customer service, or paperwork. This research will provide data to help companies understand the type of riders’ services they can have,” he said.\r\n\r\nEngineer Asad and his team are working on research that has not been done anywhere else. “Our research extends across Pakistan and work is still being done but slowly. The main reason for this is lack of funds for the project. It seems no one wants to invest in this industry, even though it is fast-growing employment — everyone who has a bike can join with small or no investment and earn.”\r\n\r\nHe said: “We still have to study more than 3.5 million bikes across Pakistan but the funds are the biggest hurdle for this and we are not being supported by anyone. [A private university] had shown interest and was going to sign with us, but it didn’t work. The government is not interested in this project for some reason. The National Transport Research Center (NTRC), Sir Syed University (SSUET) and Transport Engineering Services (TES) all supported the endeavour.\"\r\n\r\nLifeline for overseas Pakistanis\r\n\r\nRiders are also important for another section of society, the parents and families of Pakistanis living abroad who need someone to trust to step in to help to do chores, etc.\r\n\r\nThis is where Yasir Shirazi comes into the picture. He lives in the US and was constantly thinking of ways to alleviate the burden from his parents’ shoulders, getting things done for them through someone he could trust.\r\n\r\nAnd so he set up InstaKin in 2019 as its founder and CEO and this is his story: “InstaKin’s story is my own story. Almost every migrant I have spoken to can relate to it. I have been an overseas Pakistani for the last 12 years. Like many others, I still need to get tasks accomplished in Pakistan (paying bills, etc). Over the years, I noticed that most overseas Pakistanis specifically (and overall migrant communities in general) would always complain that they are always dependent on busy friends or extended family to manage tasks on their behalf. This causes time-sensitive delays (unfortunately, sometimes there is also misuse of remittance funds).”\r\n\r\nThrough Shirazi and his team have helped thousands of migrants by providing services like hiring a rider via Instakin for getting medicines delivered to parents in Pakistan (through a service for it known as InstaRunner); getting educational and legal documents attested from back home; sending gifts to loved ones on special occasions; ordering consumer electronics and appliances that can be delivered to family back in Pakistan; hiring an event planner for a family celebration and maybe the most important, paying bills for family back home.\r\n\r\nThe InstaRunner will help generate new employment opportunities in the country and they estimate that more than 3,000 new jobs will be created directly and via the vendor network over the next two years.\r\n\r\nPublished in Dawn, August 24th, 2021', '2021-09-22 08:59:32', 'admin'),
(9, 'Does Pakistan need electric vehicles?', 'Electric Vehicles (EVs) have already caught the interest of large populations of the developed countries and the Pakistani public as well awaits with excitement. Tesla has surpassed all international car manufacturing companies in terms of market capitalisation. The financial incentive in the form of hard cash given by the western governments to the consumers has been the key factor in the rapid adoption of EVs.', 'oUvfzHzP80gvlcx1BKPy1dCb8UE.jpg', 3, 'Despite these incentives, the road to achieving full conversion to EVs from conventional petrol-based vehicles is going to be a long one. The main limitations of EVs are their high cost and limited range (distance travelled between charges). As Pakistan considers the adoption of EVs on a large scale, there is a need to learn some useful lessons from the experience of other countries.\r\n\r\nWhen Tesla came out with its first series of EVs, its success was largely due to a lucrative cash subsidy that the governments of the USA and Canada directly gave to the consumer which made a very expensive car more affordable for the buyer. The attraction for EVs is also due to the awareness about global warming the effects of which have already started becoming visible.\r\n\r\nAnother factor is cheap electricity due to a sharp drop in the price of solar and wind turbines. Tesla built its own free-of-cost charging stations in many locations making its products even more attractive. Probably none of these factors is on the mind of Pakistani consumer, which is mainly interested in EVs because it is the latest trend.\r\n\r\nBefore riding the EV wave in a big way, Pakistan must consider all the factors because due to their high-cost EVs will be a big burden on the country’s import bill.\r\n\r\nBy replacing the conventional vehicles with EVs, Pakistan’s fuel import bill will be reduced as most of the finished petroleum products used in transport are imported. Homes equipped with solar roof-tops can charge their EVs with clean energy virtually for free as long as the sun is shining.\r\n\r\nHowever, it will not contribute much to a reduction in global Greenhouse Gases (GHGs) because Pakistan has a negligible GHG footprint. Furthermore, EVs will not cause a major reduction in GHGs if they are charged with grid-based power because most of our electricity generation continues to be based on fossil fuels. To have any meaningful GHG reduction, commercial charging stations will need to be fully based on their own solar/wind power sources.\r\n\r\nThe EVs can be charged in two ways: slow charging using a typical power outlet at homes and fast charging at a commercial charging station. Charging them at home is a slow process while fast charging stations too, if available, can take up to an hour. Further, such charging stations will need to be widely available on urban roads and highways for which the nation will have to pay a heavy price.\r\n\r\nThe more common mode of charging that the Pakistani EV owners will use will be their 220-volt electric outlets. As vehicles are in use during the day and parked at night when they would normally be recharging, they cannot benefit from the home-based solar roof-top system. The alternative would be to install a battery storage system to store the energy produced by the solar cells during the daytime and use it to charge the vehicles at night which is highly cost-prohibitive and inefficient.\r\n\r\nThe future of the transportation world indeed lies in EVs and the question is how Pakistan can best prepare for that future. As the technology will take many years to fully mature, Pakistan should make a gradual, phase-wise entry into the EV space.\r\n\r\nAs a first step, small-utility vehicles such as auto-rickshaws and motorcycles can be replaced with those that run on electricity and for this, the government should be ready to give the necessary subsidies as they will benefit the lower-income population. Electric auto-rickshaws, besides removing noise pollution, will improve the income of their owners by replacing expensive liquid fuels with a relatively cheaper electricity source although a full economic comparison with liquid fuels is not available.\r\n\r\nThe motor-cycle owners too, belonging to the low-income class, would benefit from any financial incentive, especially those who use their bikes to make a living. Next, smaller size compact passenger EVs will make sense for Pakistan’s situation as they offer the advantage of replacing oversized, old passenger cars and cause lesser traffic congestion on the roads.\r\n\r\nThese types of vehicles use relatively smaller batteries and their charging will not be as cumbersome as large passenger vehicles. New business activities, eg stations where fully charged batteries can be swapped with depleted batteries must be actively promoted. Such battery-swapping “on-the-go” would be especially convenient for two- and three-wheelers and small passenger cars due to their smaller sizes.\r\n\r\nIn terms of investment opportunities, Pakistan can build an indigenous manufacturing base of small EVs and their related industries, namely batteries and charging stations. Due to a larger market of such vehicles, it would be financially viable to develop an indigenous production capability that can be later on geared towards export sales.\r\n\r\nMeanwhile, the import of EV passenger vehicles should not be encouraged as they require a substantial foreign exchange due to their high cost. There is a need to carefully tread on the path to the wide-scale adoption of EVs as the storage technology is still evolving and it is possible that Lithium-ion will be replaced by some other technology.\r\n\r\nHowever, as an interim measure, until domestic manufacturing capability is created, the import of batteries for small-size vehicles may be encouraged. A focused and carefully formulated strategy will ensure that EVs bring maximum economic benefit, including investment and employment to Pakistan.\r\n\r\nThe author is an energy sector professional\r\n\r\nPublished in Dawn, The Business and Finance Weekly, August 23rd, 2021', '2021-09-22 09:01:39', 'admin'),
(10, 'Corporates may switch over to digital tax payments in 40 days', 'ISLAMABAD: The Federal Board of Revenue (FBR) is considering allowing the corporate taxpayers a grace period of 40 days to switch over to the digital mode of payments effective from Nov 1.', '19.jpg', 3, 'An official announcement on Monday said that in the intervening period corporate taxpayers may use the traditional banking transaction methods including cross cheques, cross-bank draft, cross pay orders, or any other crossed banking instrument showing transfer of amount from the business bank account of the taxpayer in addition to digital mode of payment as long as those are compliant with the law.\r\n\r\nThe amendments were introduced under the Tax Laws (3rd Amendment) Ordinance, 2021. The FBR has introduced significant changes to the Income Tax ordinance, 2001, with a view to documenting the economy, capturing the supply chains and broadening the tax base.\r\n\r\nUnder the new measures, the scope of payments is restricted via traditional banking channels on account of expenditures exceeding Rs250,000 to taxpayers other than companies. Consequently, it is now mandatory for companies to make payments on expenditures exceeding Rs250,000 through digital mode only.\r\n\r\nHowever, expenditures on account of utility bills, freight charges, travel fair, and payment of taxes and fines would continue to be admissible either paid in cash or traditional banking instruments.\r\n\r\nPublished in Dawn, September 21st, 2021', '2021-09-22 09:20:25', 'admin'),
(11, 'Saudi group mulls ‘options’ for Samba Bank', 'KARACHI: The parent company of Samba Bank is looking for “strategic options” regarding its shareholding in the locally listed bank, a regulatory filing said on Tuesday.', '12.jpg', 3, 'The language of the stock notice doesn’t clarify whether the parent company of the bank — which is the fourth smallest among all listed lenders in terms of the total value of shares — wants to sell its shareholding or acquire another bank to expand its footprint in the Pakistani market.\r\n\r\n“SNB (Saudi National Bank) is considering all its strategic options in relation to its shareholding in Samba Pakistan, including potential mergers, acquisitions, divestment and/or restructuring,” the notice on the stock exchange said.\r\n\r\nSpeaking to Dawn, Head of Research at JS Global Amreen Soorani said the country’s banking sector is in a phase of consolidation. “Samba Bank forms an insignificant part of its parent group’s worldwide assets,” she said, adding that SNB is likely to take the divestment route.\r\n\r\n“It seems to me that some potential buyers have approached the parent company of Samba Bank,” she said.\r\n\r\nHowever, another banking sector analyst told Dawn that SNB appeared more inclined to stay on in the Pakistani market and acquire an already established lender to grow its business.\r\n\r\n“Parent groups of at least three banks have indicated their Pakistan operations are up for grabs. What would SNB gain by advertising its intent to divest when bigger and better banks are already available for sale?” said the analyst while requesting that he not be named.\r\n\r\nAnother reason that he cited to support his understanding of the regulatory notice was the recent change in the parent company of Samba Bank.\r\n\r\nIts previous majority owner, Samba Financial Group, merged with National Commercial Bank to become SNB early this year. “Samba Bank operated in Pakistan with a certain view. But that may have changed now because of the change in its parent group,” he added.\r\n\r\nThe share price of Samba Bank dropped 0.28 per cent on Tuesday to Rs10.62 apiece. However, it’s risen by as much as 72.4pc since the beginning of September. Its net profit amounted to Rs457.1 million in April-June, registering little change from the same quarter a year ago.\r\n\r\nPublished in Dawn, September 22nd, 2021', '2021-09-22 09:21:50', 'admin'),
(12, 'Public offering regulations amended for SPAC framework', 'KARACHI: The Sec­urities and Exchange Commission of Pakistan (SECP) on Tuesday anno­unced the amended Public Offering Regulations 2017 to introduce a regulatory framework for Special Purpose Acquisition Companies (SPAC).', 'rg_yVHaH87NWk1zSkfWvnlIGgU0.jpg', 3, 'An SPAC is a company with no commercial operation that is formed strictly to raise capital through an initial public offering (IPO) for the purpose of merger/acquisition transactions. The concept of SPAC exists in many developed countries like the United States, Canada and Malaysia.\r\n\r\nThe introduction of SPAC in Pakistan’s market is expected to give a boost to the primary market, encourage new listings and help companies tap capital for large-scale merger/acquisition transactions, a press release said on Tuesday.\r\n\r\nIt would also enable investors/public to co-invest with sophisticated, highly experienced managers and benefit from the appreciation in the share value of acquired units.\r\n\r\nUnder the proposed regulatory framework, an SPAC will be a public limited company having paid-up capital of not less than Rs10 million.\r\n\r\nPublished in Dawn, September 22nd, 2021', '2021-09-22 09:23:19', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS user;
CREATE TABLE IF NOT EXISTS `user` (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  username varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  email varchar(24) NOT NULL,
  password varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (id, `name`, username, email, `password`) VALUES
(11, 'Wali Baloch', 'wali', 'wali@gmail.com', '$pbkdf2-sha256$29000$7703BkBISQlh7B2jdM7Zuw$Zu0OZCP5AOMbI4bf3zQvrUJO89RYESuV5ImhadDMfbw'),
(12, 'Hamza Rajput', 'hamza', 'hamza@gmail.com', '$pbkdf2-sha256$29000$CyEkROjdu1cKAcA4p1QKAQ$qJYXpm/IsIb8o4SgbR83lFuKMLIa9KZFu5yySdYyApQ');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
