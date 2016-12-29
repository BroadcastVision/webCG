# webCG
WebCG is a framework capable of generating dynamic HTML templates for CasparCG.
Project page: https://mz.unic.ac.cy/webcg/

# webCG
WebCG is an open source framework capable of generating dynamic HTML templates for CasparCG. It provides all functionalities to add your own code: CSS, HTML, PHP and Javascript. It allows the user to control dynamically specific elements in the HTML template by inserting them values while the graphics are On-Air.

Also, PHP and Javascript code can be executed allowing the implementation of elements like: live news scroller from XML feed, local weather, etc. The current download comes with the following examples: HD Color Bars with tone, Logo, Animation Example, Lower third, News scroller, News ticker and Time feed, Elections, Lower third, Weather (forecast.io API), Credits, Twitter Feed.

The Rundown page provides ease of access to various functionalities as seen on the image above. A command-log provides visual representation of the actual commands sent to CasparCG server.

WebCG was designed to be efficient and fast. From the config.php file you can edit the channel resolution (default HD 1920×1080), database settings, CaspasrCG server parameters, etc.

# Dynamic Fields
To activate the dynamic fields in the HTML template, add div with the following format: <div id=”f0″></div> in the layer HTML + PHP Code section. Only f0, f1, f2, etc. are accepted for dynamic fields name.

Once you save the layer you will notice that on the Rundown, under the layer name, a group of inputs are generated in order to assign values. Once you add a text hit Update.

# Installation
Make sure you are running a web server (recommend WAMP Server).
Unzip the contents of the download file into www folder.
Inside folder database, you will find the database file, called cg.sql
Open phpMyAdmin (http://127.0.0.1/phpmyadmin). The default username is root and password is empty (leave it blank).
Create a new database. Call it cg.
Import cg.sql into cg database.
Access WebCG from http://127.0.0.1/webcg (always access WebCG from the IP of your machine and not from localhost)
