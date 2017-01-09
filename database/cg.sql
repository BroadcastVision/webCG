-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2017 at 08:33 AM
-- Server version: 5.7.11
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cg`
--

-- --------------------------------------------------------

--
-- Table structure for table `directions`
--

CREATE TABLE `directions` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `directions`
--

INSERT INTO `directions` (`id`, `name`) VALUES
(1, 'RIGHT'),
(2, 'LEFT');

-- --------------------------------------------------------

--
-- Table structure for table `layers`
--

CREATE TABLE `layers` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `icon` text COLLATE utf8_unicode_ci,
  `video_layer` int(11) NOT NULL DEFAULT '10',
  `transition` int(11) NOT NULL DEFAULT '1',
  `duration` int(11) NOT NULL DEFAULT '1',
  `direction` int(11) NOT NULL DEFAULT '1',
  `css` text COLLATE utf8_unicode_ci,
  `html_php` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `visible` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `layers`
--

INSERT INTO `layers` (`id`, `name`, `icon`, `video_layer`, `transition`, `duration`, `direction`, `css`, `html_php`, `js`, `visible`) VALUES
(21, 'NewsCG', 'fa-newspaper-o', 12, 1, 1, 1, '#lowerthird{\r\n	position:absolute;\r\n	bottom: 80px;\r\n	width:100%;\r\n	text-align: left;\r\n	font-Family: arial;\r\n}			\r\n#bg{\r\n	background-color: rgba(255, 255, 255, 0.9);\r\n	color: #444444;\r\n	padding: 4px 10px 4px 330px;\r\n	text-align: left;\r\n	font-size: 50px;\r\n	text-transform: uppercase;\r\n	height:125px;\r\n}			\r\n#f0{\r\n	font-weight: bold;\r\n}\r\n#clock{\r\n	background:#9A0D02;\r\n	color:#FFFFFF;\r\n	text-transform:uppercase;\r\n	width:540px;\r\n	text-align:right;\r\n	padding:4px 10px;\r\n	font-size:20px;\r\n	font-weight:bold;			\r\n}\r\n#feed{\r\n	background:#555;\r\n	color:#FFFFFF;\r\n	text-transform:uppercase;\r\n	text-align:right;\r\n	padding:4px 10px;\r\n	font-size:20px;\r\n}\r\n.marquee {\r\n  overflow: hidden;\r\n}\r\n#ticker{\r\n    width:100%;\r\n	background:#222;\r\n	color:#fff;\r\n	text-transform:uppercase;\r\n	text-align:left;\r\n	padding: 4px 10px 4px 334px;\r\n	font-size:20px;\r\n}\r\n#ticker div {\r\n    display: inline-block;\r\n    word-wrap: break-word;\r\n}', '<div id="lowerthird">\r\n    <div id="bg">\r\n    	<div id="f0" placeholder="Main Title">Dynamic Field f0</div>\r\n    	<div id="f1" placeholder="Secondary Title">Dynamic Field f1</div>\r\n    </div>\r\n    <div id="feed">\r\n        <div class=\'marquee\'>\r\n            <strong>Latest News:</strong>\r\n            Japan\'s Emperor Akihito hints at wish to abdicate.\r\n            Delta flights grounded after systems outage.\r\n            Prince\'s estate denies planning to sell his Paisley Park home.\r\n            Android bug fear in 900 million phones.</div>\r\n    </div>\r\n    <div id="ticker">\r\n        <strong>Latest News:</strong>\r\n        <ul>\r\n            <li>Japan\'s Emperor Akihito hints at wish to abdicate.</li>\r\n            <li>Delta flights grounded after systems outage.</li>\r\n            <li>Prince\'s estate denies planning to sell his Paisley Park home.</li>\r\n        </ul>\r\n    </div>\r\n    <div id="clock">\r\n        <?php echo "New York"; ?> <span id="time-part"></span>\r\n    </div>\r\n</div>', '<script src="layers-assets/newscg/moment.js"></script>\r\n<script src="layers-assets/newscg/jquery.marquee.min.js"></script>\r\n<script src="layers-assets/newscg/jquery.ticker.min.js"></script>\r\n<script>\r\n$(document).ready(function() {\r\n	var interval = setInterval(function() {\r\n		var momentNow = moment();\r\n		$("#time-part").html(momentNow.format("HH:mm:ss"));\r\n	}, 100);\r\n});\r\n\r\n$(".marquee").marquee({\r\n    duration: 15000,\r\n    gap: 50,\r\n    delayBeforeStart: 0,\r\n    direction: "left",\r\n    duplicated: true\r\n});\r\n\r\n$("#ticker").ticker();\r\n</script>', 1),
(22, 'Animation Example', '', 20, 1, 1, 1, '.sea {\r\n  margin: 40px auto 0 auto;\r\n  overflow: hidden;\r\n}\r\n.sea .bubble {\r\n  position: absolute;\r\n  width: 7px;\r\n  height: 7px;\r\n  border-radius: 50%;\r\n  background-color: #6bafca;\r\n  opacity: 0.9;\r\n  -webkit-animation: bubble1-h-movement 1s ease-in infinite, bubble1-v-movement 300ms ease-in-out infinite alternate, bubble-scale-movement 300ms ease-in-out infinite alternate;\r\n          animation: bubble1-h-movement 1s ease-in infinite, bubble1-v-movement 300ms ease-in-out infinite alternate, bubble-scale-movement 300ms ease-in-out infinite alternate;\r\n}\r\n.sea .bubble:after {\r\n  position: absolute;\r\n  content: "";\r\n  width: 7px;\r\n  height: 7px;\r\n  border-radius: 50%;\r\n  background-color: #6bafca;\r\n  opacity: 0.9;\r\n}\r\n.sea .bubble:after {\r\n  top: -20;\r\n  left: 100px;\r\n  width: 9px;\r\n  height: 9px;\r\n}\r\n.sea .circle-wrapper {\r\n  position: relative;\r\n  background: -webkit-linear-gradient(#2c647a, #204858);\r\n  background: linear-gradient(#2c647a, #204858);\r\n  width: 300px;\r\n  height: 300px;\r\n  margin: 10px auto 0 auto;\r\n  overflow: hidden;\r\n  z-index: 0;\r\n  border-radius: 50%;\r\n  padding: 0 50px 0 50px;\r\n  border: 6px solid #3e8caa;\r\n}\r\n.sea .submarine-wrapper {\r\n  height: 300px;\r\n  width: 300px;\r\n  padding: 30px 50px 30px 150px;\r\n  margin: 0 auto 0 auto;\r\n  -webkit-animation: diving 3s ease-in-out infinite, diving-rotate 3s ease-in-out infinite;\r\n          animation: diving 3s ease-in-out infinite, diving-rotate 3s ease-in-out infinite;\r\n}\r\n.sea .submarine-wrapper .submarine-body {\r\n  width: 150px;\r\n  height: 80px;\r\n  position: absolute;\r\n  margin-top: 50px;\r\n  left: 25px;\r\n  background-color: #D93A54;\r\n  border-radius: 40px;\r\n  background: -webkit-linear-gradient(#D93A54, #bc243d);\r\n  background: linear-gradient(#D93A54, #bc243d);\r\n}\r\n.sea .submarine-wrapper .submarine-body .light {\r\n  position: absolute;\r\n  width: 0;\r\n  height: 0;\r\n  border-style: solid;\r\n  border-width: 0 40px 150px 40px;\r\n  border-color: transparent transparent #377c98 transparent;\r\n  -webkit-transform: rotate(-50deg);\r\n          transform: rotate(-50deg);\r\n  top: 40px;\r\n  left: 99%;\r\n}\r\n.sea .submarine-wrapper .submarine-body .light:after {\r\n  content: "";\r\n  position: absolute;\r\n  width: 20px;\r\n  height: 13px;\r\n  border-radius: 5px;\r\n  background-color: #d12844;\r\n  margin-left: -10px;\r\n}\r\n.sea .submarine-wrapper .submarine-body .window {\r\n  width: 37px;\r\n  height: 37px;\r\n  position: absolute;\r\n  margin-top: 23px;\r\n  right: 18px;\r\n  background: -webkit-linear-gradient(#1e4554, #183642);\r\n  background: linear-gradient(#1e4554, #183642);\r\n  border-radius: 50%;\r\n  border: 3px solid #D93A54;\r\n}\r\n.sea .submarine-wrapper .submarine-body .window:after {\r\n  content: "";\r\n  position: absolute;\r\n  margin-top: 3px;\r\n  margin-left: 3px;\r\n  width: 25px;\r\n  height: 25px;\r\n  border-radius: 50%;\r\n  background-color: transparent;\r\n  opacity: 0.8;\r\n  border-top: 3px solid white;\r\n  -webkit-transform: rotate(-45deg);\r\n          transform: rotate(-45deg);\r\n}\r\n.sea .submarine-wrapper .submarine-body .engine {\r\n  width: 30px;\r\n  height: 30px;\r\n  position: absolute;\r\n  margin-top: 32px;\r\n  left: 53px;\r\n  background-color: #bc243d;\r\n  border-radius: 50%;\r\n  border: 5px solid #D93A54;\r\n}\r\n.sea .submarine-wrapper .submarine-body .engine:after, .sea .submarine-wrapper .submarine-body .engine:before {\r\n  position: absolute;\r\n  content: "";\r\n  border-radius: 2px;\r\n  background-color: white;\r\n  -webkit-animation: spin 900ms linear infinite;\r\n          animation: spin 900ms linear infinite;\r\n  opacity: 0.8;\r\n}\r\n.sea .submarine-wrapper .submarine-body .engine:after {\r\n  top: 8px;\r\n  width: 20px;\r\n  height: 4px;\r\n}\r\n.sea .submarine-wrapper .submarine-body .engine:before {\r\n  left: 8px;\r\n  width: 4px;\r\n  height: 20px;\r\n}\r\n.sea .submarine-wrapper .helix {\r\n  width: 30px;\r\n  height: 70px;\r\n  position: absolute;\r\n  margin-top: 55px;\r\n  left: 0;\r\n  background-color: #D93A54;\r\n  border-radius: 7px;\r\n  background: -webkit-linear-gradient(#D93A54, #bc243d);\r\n  background: linear-gradient(#D93A54, #bc243d);\r\n}\r\n.sea .submarine-wrapper .helix:after {\r\n  content: "";\r\n  position: absolute;\r\n  margin-top: 5px;\r\n  margin-left: 7px;\r\n  width: 17px;\r\n  height: 60px;\r\n  border-radius: 3px;\r\n  background-color: transparent;\r\n  opacity: 0.8;\r\n  background: -webkit-linear-gradient(top, #D93A54, #D93A54 50%, #e57a8c 50%, #e57a8c);\r\n  background: linear-gradient(to bottom, #D93A54, #D93A54 50%, #e57a8c 50%, #e57a8c);\r\n  background-size: 100% 20px;\r\n  -webkit-animation: helix-movement 110ms linear infinite;\r\n          animation: helix-movement 110ms linear infinite;\r\n}\r\n.sea .submarine-wrapper .hat {\r\n  width: 65px;\r\n  height: 25px;\r\n  position: absolute;\r\n  margin-top: 26px;\r\n  left: 70px;\r\n  background-color: #D93A54;\r\n  border-radius: 10px 10px 0 0;\r\n  background: -webkit-linear-gradient(#D93A54, #d72d49);\r\n  background: linear-gradient(#D93A54, #d72d49);\r\n}\r\n.sea .submarine-wrapper .hat .periscope {\r\n  position: absolute;\r\n  width: 7px;\r\n  height: 20px;\r\n  background-color: #D93A54;\r\n  margin-top: -27px;\r\n  margin-left: 32px;\r\n  border-radius: 5px 5px 0 0;\r\n}\r\n.sea .submarine-wrapper .hat .periscope:after, .sea .submarine-wrapper .hat .periscope:before {\r\n  content: "";\r\n  position: absolute;\r\n  width: 15px;\r\n  height: 7px;\r\n  border-radius: 5px;\r\n  background-color: #D93A54;\r\n}\r\n.sea .submarine-wrapper .hat .leds-wrapper {\r\n  width: 53px;\r\n  height: 13px;\r\n  position: relative;\r\n  top: 7px;\r\n  left: 7px;\r\n  background-color: #D93A54;\r\n  border-radius: 10px;\r\n  background: -webkit-linear-gradient(#b3233a, #a21f35);\r\n  background: linear-gradient(#b3233a, #a21f35);\r\n}\r\n.sea .submarine-wrapper .hat .leds-wrapper .leds {\r\n  position: absolute;\r\n  margin-top: 4px;\r\n  margin-left: 7px;\r\n  width: 5px;\r\n  height: 5px;\r\n  border-radius: 50%;\r\n  background-color: white;\r\n  -webkit-animation: leds-off 500ms linear infinite;\r\n          animation: leds-off 500ms linear infinite;\r\n}\r\n.sea .submarine-wrapper .hat .leds-wrapper .leds:after, .sea .submarine-wrapper .hat .leds-wrapper .leds:before {\r\n  content: "";\r\n  position: absolute;\r\n  width: 5px;\r\n  height: 5px;\r\n  border-radius: 50%;\r\n  background-color: white;\r\n}\r\n.sea .submarine-wrapper .hat .leds-wrapper .leds:after {\r\n  margin-top: 0px;\r\n  margin-left: 17px;\r\n}\r\n.sea .submarine-wrapper .hat .leds-wrapper .leds:before {\r\n  margin-top: 0px;\r\n  margin-left: 34px;\r\n}\r\n\r\n@-webkit-keyframes spin {\r\n  100% {\r\n    -webkit-transform: rotate(360deg);\r\n            transform: rotate(360deg);\r\n  }\r\n}\r\n\r\n@keyframes spin {\r\n  100% {\r\n    -webkit-transform: rotate(360deg);\r\n            transform: rotate(360deg);\r\n  }\r\n}\r\n@-webkit-keyframes leds-off {\r\n  100% {\r\n    opacity: 0.3;\r\n  }\r\n}\r\n@keyframes leds-off {\r\n  100% {\r\n    opacity: 0.3;\r\n  }\r\n}\r\n@-webkit-keyframes helix-movement {\r\n  100% {\r\n    background: -webkit-linear-gradient(top, #e57a8c 50%, #e57a8c, #D93A54, #D93A54 50%);\r\n    background: linear-gradient(to bottom, #e57a8c 50%, #e57a8c, #D93A54, #D93A54 50%);\r\n    background-size: 100% 20px;\r\n  }\r\n}\r\n@keyframes helix-movement {\r\n  100% {\r\n    background: -webkit-linear-gradient(top, #e57a8c 50%, #e57a8c, #D93A54, #D93A54 50%);\r\n    background: linear-gradient(to bottom, #e57a8c 50%, #e57a8c, #D93A54, #D93A54 50%);\r\n    background-size: 100% 20px;\r\n  }\r\n}\r\n@-webkit-keyframes diving {\r\n  0% {\r\n    margin-top: 5px;\r\n  }\r\n  50% {\r\n    margin-top: 15px;\r\n  }\r\n  100% {\r\n    margin-top: 5px;\r\n  }\r\n}\r\n@keyframes diving {\r\n  0% {\r\n    margin-top: 5px;\r\n  }\r\n  50% {\r\n    margin-top: 15px;\r\n  }\r\n  100% {\r\n    margin-top: 5px;\r\n  }\r\n}\r\n@-webkit-keyframes diving-rotate {\r\n  0% {\r\n    -webkit-transform: rotate(0deg);\r\n            transform: rotate(0deg);\r\n  }\r\n  50% {\r\n    -webkit-transform: rotate(3deg);\r\n            transform: rotate(3deg);\r\n  }\r\n  75% {\r\n    -webkit-transform: rotate(-2deg);\r\n            transform: rotate(-2deg);\r\n  }\r\n  100% {\r\n    -webkit-transform: rotate(0deg);\r\n            transform: rotate(0deg);\r\n  }\r\n}\r\n@keyframes diving-rotate {\r\n  0% {\r\n    -webkit-transform: rotate(0deg);\r\n            transform: rotate(0deg);\r\n  }\r\n  50% {\r\n    -webkit-transform: rotate(3deg);\r\n            transform: rotate(3deg);\r\n  }\r\n  75% {\r\n    -webkit-transform: rotate(-2deg);\r\n            transform: rotate(-2deg);\r\n  }\r\n  100% {\r\n    -webkit-transform: rotate(0deg);\r\n            transform: rotate(0deg);\r\n  }\r\n}\r\n@-webkit-keyframes bubble1-h-movement {\r\n  0% {\r\n    margin-left: 80%;\r\n  }\r\n  100% {\r\n    margin-left: -100%;\r\n  }\r\n}\r\n@keyframes bubble1-h-movement {\r\n  0% {\r\n    margin-left: 80%;\r\n  }\r\n  100% {\r\n    margin-left: -100%;\r\n  }\r\n}\r\n@-webkit-keyframes bubble2-h-movement {\r\n  0% {\r\n    margin-left: 65%;\r\n  }\r\n  100% {\r\n    margin-left: -5%;\r\n  }\r\n}\r\n@keyframes bubble2-h-movement {\r\n  0% {\r\n    margin-left: 65%;\r\n  }\r\n  100% {\r\n    margin-left: -5%;\r\n  }\r\n}\r\n@-webkit-keyframes bubble1-v-movement {\r\n  0% {\r\n    margin-top: 115px;\r\n  }\r\n  100% {\r\n    margin-top: 160px;\r\n  }\r\n}\r\n@keyframes bubble1-v-movement {\r\n  0% {\r\n    margin-top: 115px;\r\n  }\r\n  100% {\r\n    margin-top: 160px;\r\n  }\r\n}\r\n@-webkit-keyframes bubble2-v-movement {\r\n  0% {\r\n    margin-top: 115px;\r\n  }\r\n  100% {\r\n    margin-top: 90px;\r\n  }\r\n}\r\n@keyframes bubble2-v-movement {\r\n  0% {\r\n    margin-top: 115px;\r\n  }\r\n  100% {\r\n    margin-top: 90px;\r\n  }\r\n}\r\n@-webkit-keyframes bubble-scale-movement {\r\n  0% {\r\n    -webkit-transform: scale(1.4);\r\n            transform: scale(1.4);\r\n  }\r\n  100% {\r\n    -webkit-transform: scale(0.9);\r\n            transform: scale(0.9);\r\n  }\r\n}\r\n@keyframes bubble-scale-movement {\r\n  0% {\r\n    -webkit-transform: scale(1.4);\r\n            transform: scale(1.4);\r\n  }\r\n  100% {\r\n    -webkit-transform: scale(0.9);\r\n            transform: scale(0.9);\r\n  }\r\n}\r\n@-webkit-keyframes light-movement {\r\n  0% {\r\n    -webkit-transform: rotate(-40deg);\r\n            transform: rotate(-40deg);\r\n  }\r\n  50% {\r\n    -webkit-transform: rotate(-70deg);\r\n            transform: rotate(-70deg);\r\n  }\r\n  100% {\r\n    -webkit-transform: rotate(-40deg);\r\n            transform: rotate(-40deg);\r\n  }\r\n}\r\n@keyframes light-movement {\r\n  0% {\r\n    -webkit-transform: rotate(-40deg);\r\n            transform: rotate(-40deg);\r\n  }\r\n  50% {\r\n    -webkit-transform: rotate(-70deg);\r\n            transform: rotate(-70deg);\r\n  }\r\n  100% {\r\n    -webkit-transform: rotate(-40deg);\r\n            transform: rotate(-40deg);\r\n  }\r\n}\r\n\r\n#credits{\r\n    color:yellow;\r\n    font-family:arial;\r\n    font-size:20px;\r\n    text-align:center;\r\n    padding-top:50px;\r\n}', '<div class="sea">\r\n    <div class="circle-wrapper">\r\n        <div class="bubble"></div>\r\n        <div class="submarine-wrapper">\r\n            <div class="submarine-body">\r\n                <div class="window"></div>\r\n                <div class="engine"></div>\r\n                <div class="light"></div>\r\n            </div>\r\n            <div class="helix"></div>\r\n            <div class="hat">\r\n              <div class="leds-wrapper">\r\n                  <div class="periscope"></div>\r\n                  <div class="leds"></div>\r\n              </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n<div id="credits"><strong>Source:</strong> http://codepen.io/ajerez/pen/EaEEOW/</div>', '', 0),
(24, 'FHD Color Bars (1kHz)', '', 5, 1, 1, 1, 'body{\r\n    background:url("layers-assets/color_bars_hd/HD_ColorBars.svg");\r\n}\r\n\r\n#f0{\r\n    font-family: "Courier";\r\n    text-transform: uppercase;\r\n    text-align: center;\r\n    color:#000;\r\n	font-weight:bold;\r\n	font-size:45px;\r\n	margin-top:650px;\r\n}', '<div id="container">\r\n    <div id="f0" placeholder="Title">Dynamic Field f0</div>\r\n</div>\r\n<audio src="layers-assets/color_bars_hd/HD_ColorBars.mp3" autoplay loop>', '', 1),
(26, 'Election Poll (face to face)', 'fa-users', 10, 1, 1, 1, 'body{\r\n    background: url("layers-assets/elections/bg.jpg");\r\n    padding:100px;\r\n    font-family:arial;\r\n    text-transform: uppercase;\r\n    text-align: left;\r\n    color:#fff;\r\n	font-weight:bold;\r\n}\r\n\r\n#poll{\r\n    height:880px;\r\n    background-color: rgba(255, 255, 255, 0.9);\r\n    border: 5px solid transparent;\r\n    border-image: linear-gradient(to bottom, #fff 0%, #999 100%);\r\n    border-image-slice: 1;\r\n}\r\n\r\n#source{\r\n    background:#555;\r\n    text-align: left;\r\n	font-size: 15px;\r\n	padding:10px 30px;\r\n}\r\n\r\n#title{\r\n    background:#00356B;\r\n	font-size: 70px;\r\n	padding:10px 30px;\r\n	text-shadow: 2px 2px #000;\r\n}\r\n\r\n#candidates{\r\n    width: 950px;\r\n    margin: 0 auto;\r\n    margin-top:60px;\r\n    text-align:center;\r\n}\r\n\r\n#candidates img{\r\n    margin:0;\r\n    padding:0;\r\n    border:0;\r\n}\r\n\r\n.name{\r\n    font-size: 40px;\r\n	padding:10px 30px;\r\n	text-shadow: 2px 2px #000;\r\n	background-color: #00356B;\r\n}\r\n\r\n.count{\r\n    font-size: 120px;\r\n	text-shadow: 2px 2px #ccc;\r\n	color:#333;\r\n}\r\n\r\n#candidate1{\r\n    width: 400px;\r\n    float: left;\r\n    position: relative;\r\n    -webkit-animation-name: candidate1;\r\n    -webkit-animation-duration: 3s;\r\n    -webkit-animation-fill-mode: forwards;\r\n    -webkit-animation-delay: 2s;\r\n}\r\n\r\n@-webkit-keyframes candidate1 {\r\n    0% {left:0;}\r\n    100% {left:-50px;}\r\n}\r\n\r\n#candidate2{\r\n    width: 400px;\r\n    float: left;\r\n    margin-left:150px;\r\n    position: relative;\r\n    -webkit-animation-name: candidate2;\r\n    -webkit-animation-duration: 3s;\r\n    -webkit-animation-fill-mode: forwards;\r\n    -webkit-animation-delay: 2s;\r\n}\r\n\r\n@-webkit-keyframes candidate2 {\r\n    0% {left:0;}\r\n    100% {left:50px;}\r\n}', '<div id="poll">\r\n    <div id="source">Source: Bananna Network</div>\r\n    <div id="title">Presidential Elections 2016</div>\r\n    <div id="candidates">\r\n      <div id="candidate1">\r\n          <div class="name">CLINTON</div>\r\n          <img src="layers-assets/elections/clinton.jpg" width="400" height="400">\r\n          <div class="count"><span class="count-value">50</span>%</div>\r\n      </div>\r\n      <div id="candidate2">\r\n          <div class="name">TRUMP</div>\r\n          <img src="layers-assets/elections/trump.jpg" width="400" height="400">\r\n          <div class="count"><span class="count-value">50</span>%</div>\r\n      </div>\r\n    </div>\r\n</div>', '<script>\r\n$(\'.count-value\').each(function () {\r\n      var $this = $(this);\r\n      jQuery({ Counter: 0 }).animate({ Counter: $this.text() }, {\r\n        duration: 2500,\r\n        step: function () {\r\n          $this.text(Math.ceil(this.Counter));\r\n        }\r\n      });\r\n    });\r\n</script>', 0),
(27, 'Weather (forecast.io API)', 'fa-thermometer-full', 10, 1, 1, 1, 'body{\r\n    background: url("layers-assets/weather/bg.jpg");\r\n    padding:100px;\r\n    font-family:arial;\r\n    text-transform: uppercase;\r\n    text-align: left;\r\n    color:#fff;\r\n	font-weight:bold;\r\n}\r\n\r\n#weather{\r\n    height:880px;\r\n    background-color: rgba(255, 255, 255, 0.9);\r\n    border: 5px solid transparent;\r\n    border-image: linear-gradient(to bottom, #fff 0%, #999 100%);\r\n    border-image-slice: 1;\r\n}\r\n\r\n#source{\r\n    background:#555;\r\n    text-align: left;\r\n	font-size: 15px;\r\n	padding:10px 30px;\r\n}\r\n\r\n#title{\r\n    background:#800000;\r\n	font-size: 70px;\r\n	padding:10px 30px;\r\n	text-shadow: 2px 2px #000;\r\n}\r\n\r\n#temperature{\r\n    width: 950px;\r\n    margin: 0 auto;\r\n    margin-top:100px;\r\n    text-align:center;\r\n    font-size:100px;\r\n    color:black;\r\n}', '<div id="weather">\r\n    <div id="source">Source: Forecast.io</div>\r\n    <div id="title">London Live Weather</div>\r\n    <div id="temperature">\r\n      <canvas id="icon" width="200" height="200"></canvas><br><span id="temp"></span>\r\n    </div>\r\n</div>', '<script type="text/javascript"  src="layers-assets/weather/skycons.js"></script>\r\n<script>\r\nfunction weather()\r\n	{\r\n	$(function() {\r\n		var apiKey = "ADD YOUR API CODE HERE";\r\n		var url = "https://api.forecast.io/forecast/";\r\n		var lati = 51.5171;\r\n		var longi = -0.1062;\r\n		var data;\r\n\r\n		$.getJSON(url + apiKey + "/" + lati + "," + longi + "?units=uk&callback=?", function(data) {\r\n		  var temp = data.currently.temperature;\r\n		  var icon = data.currently.icon;\r\n		  $("#temp").html(temp + "&deg;C");\r\n\r\n		  var skycons = new Skycons({"color": "black"});\r\n		  skycons.add("icon", icon);\r\n		  skycons.play();\r\n		});\r\n	});\r\n}\r\n\r\nweather(); // Get weather instantly at load.\r\nsetInterval( weather, 60000 ); // Get weather every 2 min.\r\n</script>', 0),
(28, 'Credits', 'fa-cc', 10, 5, 25, 2, 'body{\r\n    font-family:arial;\r\n    text-align: left;\r\n    color:#fff;\r\n	font-size:45px;\r\n	text-transform: uppercase;\r\n}\r\n\r\n#credits{\r\n    background:rgba(0, 0, 0, 0.9);\r\n    padding:100px;\r\n    width:50%;\r\n    height:100%;\r\n    float:right;\r\n}\r\n\r\nul{\r\n    list-style-type:none;\r\n}\r\n\r\nli{\r\n    margin-bottom:40px;\r\n}\r\n\r\n#slide1, #slide2, #slide3{\r\n    display:none;\r\n}', '<div id="credits">\r\n    <ul id="slide1">\r\n        <li>Title 1<br><strong>Name Surname</strong></li>\r\n        <li>Title 2<br><strong>Name Surname</strong></li>\r\n        <li>Title 3<br><strong>Name Surname</strong></li>\r\n        <li>Title 4<br><strong>Name Surname</strong></li>\r\n        <li>Title 5<br><strong>Name Surname</strong></li>\r\n        <li>Title 6<br><strong>Name Surname</strong></li>\r\n    </ul>\r\n    <ul id="slide2">\r\n        <li>Title 7<br><strong>Name Surname</strong></li>\r\n        <li>Title 8<br><strong>Name Surname</strong></li>\r\n        <li>Title 9<br><strong>Name Surname</strong></li>\r\n        <li>Title 10<br><strong>Name Surname</strong></li>\r\n        <li>Title 11<br><strong>Name Surname</strong></li>\r\n        <li>Title 12<br><strong>Name Surname</strong></li>\r\n    </ul>\r\n    <ul id="slide3">\r\n        <li><img src="layers/credits/logo.png"></li>\r\n         <li><strong>WebCG. This is a PHP generated date <?php echo date(\'Y\'); ?>©</strong></li>\r\n    </ul>\r\n</div>', '<script>\r\n    $("#slide1").delay(1000).fadeIn().delay(3000).fadeOut(400);\r\n    $("#slide2").delay(5000).fadeIn().delay(3000).fadeOut(400);\r\n    $("#slide3").delay(9000).fadeIn();\r\n    $("#credits").delay(15000).fadeOut(200);\r\n</script>', 1),
(29, 'Twitter (visual only)', 'fa-twitter', 15, 5, 30, 2, '#twitter{\r\n    background:#1da1f2 url("layers-assets/twitter/twitter.svg");\r\n    background-repeat: no-repeat;\r\n    background-position: 20px; \r\n    width:1000px;\r\n    height:140px;\r\n    bottom:200px;\r\n    right:0;\r\n    position:absolute;\r\n    border-radius: 10px 0 0 10px;\r\n    box-shadow: 4px 4px 2px #14171a;\r\n    \r\n    font-family:arial;\r\n    text-align: left;\r\n    color:#fff;\r\n	font-size:28px;\r\n	text-transform: uppercase;\r\n\r\n	padding:20px 30px 20px 160px;\r\n}\r\n\r\n#twitter span{\r\n    font-weight:bold;\r\n    font-style: italic;\r\n}\r\n\r\nul{\r\n    list-style-type:none;\r\n    padding:0;\r\n    margin:0;\r\n}', '<div id=twitter>\r\n    <ul>\r\n        <li>You’re never too old to splash around. Well, unless your phone isn’t water-resistant. #GalaxyNote7 <span>@SamsungMobileUS</span></li>\r\n    </ul>\r\n</div>', '<script>\r\n    $("#twitter").delay(6000).fadeOut(500);\r\n</script>', 0),
(30, 'Lower Third', 'fa-address-card-o', 10, 5, 25, 1, '#lowerthird{\r\n    position:absolute;\r\n    bottom: 250px;\r\n    left:300px;\r\n    font-family:verdana;\r\n    text-align: left;\r\n	text-transform: uppercase;\r\n}\r\n\r\n#name{\r\n    background-color: rgba(0, 0, 0, 0.2);\r\n    color:#666;\r\n    font-size:70px;\r\n    color:#fff;\r\n    text-shadow:2px 2px #666;\r\n    font-weight:bold;\r\n    padding:0 20px;\r\n}\r\n\r\n#title{\r\n    background-color: rgba(255, 255, 255, 0.9);\r\n    color:#666;\r\n    font-size:40px;\r\n    font-weight:bold;\r\n    padding:0 20px;\r\n    display:inline-block;\r\n}\r\n\r\n', '<div id="lowerthird">\r\n    <div id="name">Name Surname</div>\r\n    <div id="title">Producer</div>\r\n</div>', '<script>\r\n    $("#lowerthird").delay(3000).fadeOut(500);\r\n</script>', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transitions`
--

CREATE TABLE `transitions` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transitions`
--

INSERT INTO `transitions` (`id`, `name`) VALUES
(1, 'CUT'),
(2, 'MIX'),
(3, 'WIPE'),
(4, 'PUSH'),
(5, 'SLIDE');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `directions`
--
ALTER TABLE `directions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `layers`
--
ALTER TABLE `layers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transition` (`transition`),
  ADD KEY `direction` (`direction`);

--
-- Indexes for table `transitions`
--
ALTER TABLE `transitions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `directions`
--
ALTER TABLE `directions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `layers`
--
ALTER TABLE `layers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `transitions`
--
ALTER TABLE `transitions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `layers`
--
ALTER TABLE `layers`
  ADD CONSTRAINT `layers_ibfk_1` FOREIGN KEY (`transition`) REFERENCES `transitions` (`id`),
  ADD CONSTRAINT `layers_ibfk_2` FOREIGN KEY (`direction`) REFERENCES `directions` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
