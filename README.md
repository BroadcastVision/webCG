# webCG
WebCG (https://mz.unic.ac.cy/webcg/) is a framework capable of generating dynamic HTML templates for CasparCG.

Overview

WebCG is an open source framework capable of generating dynamic HTML templates for CasparCG. It provides all functionalities to add your own code: CSS, HTML, PHP and Javascript. It allows the user to control dynamically specific elements in the HTML template by inserting them values while the graphics are On-Air.

Also, PHP and Javascript code can be executed allowing the implementation of elements like: live news scroller from XML feed, local weather, etc. The current download comes with the following examples: HD Color Bars with tone, Logo, Animation Example, Lower third, News scroller, News ticker and Time feed, Elections, Lower third, Weather (forecast.io API), Credits, Twitter Feed.

The Rundown page provides ease of access to various functionalities as seen on the image above. A command-log provides visual representation of the actual commands sent to CasparCG server.

WebCG was designed to be efficient and fast. From the config.php file you can edit the channel resolution (default HD 1920×1080), database settings, CaspasrCG server parameters, etc.

# Dynamic Fields

To activate the dynamic fields in the HTML template, add div with the following format: <div id=”f0″></div> in the layer HTML + PHP Code section. Only f0, f1, f2, etc. are accepted for dynamic fields name.

Once you save the layer you will notice that on the Rundown, under the layer name, a group of inputs are generated in order to assign values. Once you add a text hit Update.

#Installation
1.Make sure you are running a web server (recommend WAMP Server).
2.Unzip the contents of the download file into www folder.
3.Inside folder database, you will find the database file, called cg.sql
4.Open phpMyAdmin (http://127.0.0.1/phpmyadmin). The default username is root and password is empty (leave it blank).
5.Create a new database. Call it cg.
6.Import cg.sql into cg database.
7.Access WebCG from http://127.0.0.1/webcg (always access WebCG from the IP of your machine and not from localhost)

Resources/Tips
*CasparCG Forum topic
*Install webCG on a diffrent computer and proper setup of the web server. Read more here
*Slow loading times? Make sure you disable your Antivirus and Firewall.
*Smooth font edges issue? Try working with SVG fonts. Read more here
*Enable gzip on your web server for faster loading times of your HTML templates.
