# webCG
WebCG is a framework capable of generating dynamic HTML templates for CasparCG.

![webCG](https://raw.githubusercontent.com/BroadcastVision/webCG/master/screenshot/dashboard.png)

# Overview

WebCG is an open source framework capable of generating dynamic HTML templates for CasparCG. It provides all functionalities to add your own code: CSS, HTML, PHP and Javascript. It allows the user to control dynamically specific elements in the HTML template by inserting them values while the graphics are On-Air.

Also, PHP and Javascript code can be executed allowing the implementation of elements like: live news scroller from XML feed, local weather, etc. The current download comes with the following examples: HD Color Bars with tone, Logo, Animation Example, Lower third, News scroller, News ticker and Time feed, Elections, Lower third, Weather (forecast.io API), Credits, Twitter Feed.

The Rundown page provides ease of access to various functionalities as seen on the image above. A command-log provides visual representation of the actual commands sent to CasparCG server.

WebCG was designed to be efficient and fast. From the config.php file you can edit the channel resolution (default HD 1920×1080), database settings, CaspasrCG server parameters, etc.

# Dynamic Fields

To activate the dynamic fields in the HTML template, add div with the following format: ```<div id="f0"></div>``` in the layer HTML + PHP Code section. Only f0, f1, f2, etc. are accepted for dynamic fields name.

Once you save the layer you will notice that on the Rundown, under the layer name, a group of inputs are generated in order to assign values. Once you add a text hit Update.

# Installation
1. Make sure you are running a web server (recommended WAMP Server).
2. Unzip the contents of the download file into www folder.
3. Inside folder database, you will find the database file, called cg.sql
4. Open phpMyAdmin (http://127.0.0.1/phpmyadmin). The default username is root and password is empty (leave it blank).
5. Create a new database. Call it cg.
6. Import cg.sql into cg database.
7. Access WebCG from http://127.0.0.1/webcg (always access WebCG from the IP of your machine and not from localhost)

# Resources/Tips
* [CasparCG Forum topic](http://casparcg.com/forum/viewtopic.php?f=9&t=3938)
* Install webCG on a diffrent computer and proper setup of the web server. [Read more here](http://casparcg.com/forum/viewtopic.php?f=9&t=3938#p27194)
* Slow loading times? Make sure you disable your Antivirus and Firewall.
* Smooth font edges issue? Try working with SVG fonts. [Read more here](http://nimbupani.com/about-fonts-in-svg.html)
* Enable [gzip](https://www.gnu.org/software/gzip/) on your web server for faster loading times of your HTML templates.

# ChangeLog
* **v1.8 (21/03/2018):**
* Added 2 soccer templated: score bug and timer.
* Added KILL Server button.
* Improve the presentation of dynamic fields on the dashboard.
* Improve template generation, stability fixes.
* GUI Improvments.
* **v1.7 (12/04/2017):**
* On dynamic field update (invoke) the values get save permanently in the layer settings for re-use.
* Added keyboard shortcut [F10] for Clear Channel.
* Improve template generation, stability fixes.
* GUI Improvments.
* **v1.6 (09/01/2017):**
* FIX: Update Jquery.
* **v1.5 (29/12/2016):**
* Layer icons from Font Awesome.
* **v1.4 (26/12/2016):**
* Generation of HTML files instead of plain php for faster and more stable playback.
* Update of various .js scripts.
* Folder restructuring and visual updates.
* **v1.3 (07/09/2016):**
* New layers: Elections, Lower third, Weather (forecast.io API), Credits, Twitter Feed.
* Rundown dynamic fields inputs, display a placeholder for more info.
* **v1.2 (30/08/2016):**
* Bug fix: dynamic field JavaScript function.
* **v1.1 (25/08/2016):**
* Improvement in the control function (INVOKE) of the dynamic fields.
* Option to make layers visible (active) or not in the rundown.
* Option to Clone a layer.
* Improvements in the loading speed of templates.
* **v1.0 (01/08/2016):**
* Initial release.
