<!-- Tumble
======

A physics Engine built from scratch

To see a demonstration of the code, visit: http://jsfiddle.net/Mohamed_Abo_El_Soud/FqMz9/223/ -->

# tumble [![Build Status](https://img.shields.io/badge/tumble-passing-brightgreen.svg)](https://travis-ci.org/Mohamed-Abo-El-Soud/tumble) [![Build status](https://ci.appveyor.com/api/projects/status/vtx65w9eg511tgo4)](https://ci.appveyor.com/project/Mohamed-Abo-El-Soud/tumble)

A physics Engine built from scratch.  
Can be used on Windows, OSX, Linux and mobile phones.

To see a demonstration of the code, visit: http://jsfiddle.net/Mohamed_Abo_El_Soud/FqMz9/223/

## Usage
Fork the repo with: `git clone https://github.com/Mohamed-Abo-El-Soud/tumble.git`.
Then install with `npm install && bower install`.
Then all you have to do is run locally with gulp: `gulp serve`.

## Similar Projects

Other great libraries to check out are:

* [PhysicsJS](https://github.com/wellcaffeinated/PhysicsJS)
* [matter-js](https://github.com/liabru/matter-js)

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style.
Add unit tests for any new or changed functionality. Lint and test your code
using [grunt](http://gruntjs.com/).

To build you must first install [node.js](http://nodejs.org/) and [gulp](http://gulpjs.com/), then run
`npm install && bower install`
as previously mentioned, which will install the required dependencies. The run gulp using
`gulp serve`
which is a task that builds the tumble.js file, spawns a connect and watch server, then opens app/index.html in your browser. Any changes you make to the source will automatically rebuild tumble.js and reload your browser for quick and easy testing.

Contributions are welcome, please ensure they follow the same style and architecture as the rest of the code. You should run gulp test to ensure eslint gives no errors. Please do not include any changes to the files in the build directory.

If you'd like to contribute but not sure what to work on, feel free to shoot me a message and I'll help you out with that!

## Release History

* **version 3.0.3 - Wed May 18, 2016:** created a webapp from a yeoman generator. Fixed front end styling issues. And made the engine running properly on mobile and desktop.

* **version 3.0.2 - Wed May 17, 2016:** more es-lint issues. Added JsDocs for all functions.

* **version 3.0.1 - Wed May 16, 2016:** installed es-lint, fixed es-lint issues.

* **version 3.0.0 - Wed May 16, 2016:** changed coffee-script code into javascript.

* **version 2.2.1 - Fri Oct 31, 2014:** forgot to deactivate the slowing down of the dragging, oops!...

* **version 2.2.0 - Fri Oct 31, 2014:** I just tested the compound shapes, and they worked perfectly (after numerous fixes of course). I have added 3 functions to the vector class. The first of which is the get signed area of a polygon, which essentially returns the positive area of polygon if the verticies are in clockwise and negative if counter-clockwise (i think it might be the other way around). Another function is the get centroid, which uses the signed area to get the centroid. Third one also gets the centroid, but if the points are lined up in a straight line. Speaking of centroids, I made a function that finds the composite's centroid out of individual centroids of its shape. I did a ton of other fixes but I can't even remember them. Now, I get to work on the very last thing in the physics engine, Integration...

* **version 2.1.4 - Fri Oct 31, 2014:** I just modified the collision detection algorithm to test shapes of each body separately, then apply the forces on a bigger body structure. I still have to test and create a compound body to see if it works...

* **version 2.0.9 - Thurs Oct 30, 2014:** Just tried making the new body class work, and it did very well. Future plans involve taking advantage of the body class by having multiple shapes stuck to one another...

* **version 2.0.8 - Thurs Oct 30, 2014:** Just finished making a new Body class, a new Shape class, a Rectangle and a Circle class. I have attached '2' to the name of each class to avoid confusion. The Body class allows for the ability to have several shapes to move together in unison, as if they are attached to one another (not sure how to implement that in collision detection). I still have to test and see if it works...

* **version 2.0.0 - Wed Oct 29, 2014:** I just tried to make the collision detection/resolution run everytime the engine does an iteration. The results of which yielded impressive results to the stability and efficiency of the engine. I will further look into the timestepping algorithm...

* **version 1.9.6 - Wed Oct 29, 2014:** just tried the impulse witht eh clipping functions, they work great. However, they dont work with the GJK functions. Future plans include working with the timestepping algorithm...

* **version 1.9.2 - Mon Oct 27, 2014:** just made a clipping function that creates contact points. I am very happy with it, and it works so far so well tracking and showing points. I have yet to try it with impulse and see how it works...

* **version 1.8.9 - Sun Oct 26, 2014:** made an optimised SAT algorithm. however it only returns a vector of separation (with its length). I have yet to add the algorithm to add contact points...

* **version 1.8.7 - Sun Oct 26, 2014:** finished altering the GJK algorithm to accomodate circles. Now the behaviour can detect collisions between two circles, two rectangles and a circle and a rectangle. Future plans involve optimising the SAT algorithm...

* **version 1.8.3 - Fri Oct 24, 2014:** touch events were a faliure due to the poor touch events in browsers. I started working on a GJK algorithm for polygon detection (and it works). I also implemented an SAT behaviour as well as a impulse resolution behaviour. Future plans involve making the circle collision detection for SAT and GJK as well as resolution...

* **version 1.4.8 - Wed Oct 15, 2014:** Just fixed the refreshing of the buttons. Now I will officially start implementing touch events...

* **version 1.4.6 - Tues Oct 14, 2014:** the new button design has been fully designed and almost fully implemented. what is left is to change the state of the buttons upon refreshing and the buttons would be done. Future plans also include adding touch events....

 * **version 1.4.0 - Mon Oct 6, 2014:** more small updates. Created a canvas adjustment behaviour, future plans involve looking into the interface, making it phone friendly and creating jquery touch events...

* **version 1.3.8 - Mon Oct 6, 2014:** more small updates. Created a mouse behaviour, future plans involve creating a canvas adjustment behaviour...

* **version 1.3.6 - Fri Oct 3, 2014:** small update. Just fixed all the button stuff mentioned earlier (suprisingly fast), now I will work on the clicking behaviour...

* **version 1.3.5 - Fri Oct 3, 2014:** minor update. I made the functionality of the buttons to allow an "alter" function, that allows manipulation of buttons without triggering listeners, though i was not able to implement it. I was also able to consolidate most of the active demo stuff into one class, for the sake of modularity. Future plans involve refining the controls to the buttons, so that when the refresh button is clicked and the string and gravity behaviours are deactivated, the buttons "un-click" themselves. Also I am considering creating another behaviour to control clicking in order to further modularize the engine...

* **version 1.3.1 - Thur Oct 2,2014:** was able to refine all behaviours, make them inheritive. They all work perfectly fine now. Future plans involve fixing the buttons or replacing them altogether...

* **version 1.1.2 - Tue Sep 30,2014:** was able to streamline most of the engine class by getting rid of all constraints and button related code. I was also able to refine and optimise all of the behaviours to work without the engine class, operating separately, using the the pubsub implementation, which proved to be very useful. Future plans involve creating a structure, behaviour class that all other behaviours inherit from. Other future plans also include fixing the buttons or replacing them altogether...

* **version 1.0.0 - Mon Sep 29,2014:** was able to set a FPS indicator at the top of the page. was able to isolate most of the behaviours from the engine class through the PUB/SUB pattern (publisher/subscriber). Was also able to create behaviours for play and pause, refresh and string using pubsub. future plans involve isolating the addShape behaviour from the engine class.

* **version 0.8.9 - Mon Sep 22,2014:** briefly created a button for both playing and strings. Both work as expected. future plans involve setting the fps and the string behaviour

* **version 0.8.8 - Mon Sep 22,2014:** in class engine, function presets, created a module that loads presets from the user and displays them appropriately. Future plans involve creating a behaviour for strings and two buttons: play/pause and string buttons.

* **version 0.8.0 - Sat Sep 20,2014:** in class addShape, was able to fix the function and make it somewhat operational. Future plans involve fixing the presets...

* **version 0.7.7 - Fri Sep 19,2014:** in class button, was able to make a whole class system of buttons. However integration remains a very challenging task as I have to understand JQuery events inside and out for the interface to operate smoothly.

* **version 0.6.7 - Thur Sep 18,2014:** in class Shape, function applyForce: was able to inegrate the applyForce into the applyImpulse function in the class Physics. Also I have branched out all the rope behaviour out of the Shape class to add more flexibility and accessibility. Future plans include implementation of the "G" button as well as the operation of the last behaviour, possibly optimising the shape creation model...

* **version 0.6.0 - Wed Sep 17,2014:** in class Body, function applyForce: was able to optimise the behaviour of the drage capability. Now, the dragging seems smooth and natural. It looks really good!

* **version 0.4.3 - Sun Sep 14,2014:** in class Integrator & Body, finished writing a replacement for the item and shape functions. has not been implemented quite yet...

* **version 0.4.2 - Sun Sep 14,2014:** in class Behaviour & Constraints, finished writing Behaviour and behaviours classes (e.g: Gravity,Drag) however code has been written on implementation and troubleshooting. New code implements new techniques of modular code and some theoretical ideas. Increased troubleshooting is expected. Implementation requires the overhall and organisation of the engine class, hence future plans involve changing the class's code...

* **version 0.3.5 - Wed Sep 10,2014:** in class physics, function calculateImpulse4: fixed the friction mechanism as much as possible, future plans involve optimising performance...

* **version 0.3.2 - Mon Sep 8,2014:** in class engine, function checkDrag: was able to fix the dragging in hopes to do some experimentation with friction. possible game idea is also found...

* **version 0.3.0 - Sun Sep 7,2014:** in class physics, function calculateImpulse4: was able to create a new function that is stable. Friction part of the function is yet to be analyzed...

* **version 0.2.9 - Mon Sep 6,2014:** in class physics, function impulseResolution: experimenting on to fix a problem where the object acts differently if it is the first shape or second in the queue...

* **version 0.2.2 - Mon Sep 1,2014:** overhauled the interface across all fronts. Html,css and javascript have changed

*  **version 0.2.0 - Sun Aug 24, 2014:** in class string, queue and engine, finished developing the string and queue class, fully functioning now. there are notable improvements in performance though not optimal. future plans involve overhauling the interface...

*  **version 0.1.9 - Sat Aug 23, 2014:** in class engine, started developing a queue for the strings, got rid of the need for jcan, no function needs it anymore...

*  **version 0.1.6 - Thurs Aug 21, 2014:** in class physics, function recFindNorm4 and SATDifferent function completed, fully operational...

*  **version 0.0.6 - Thurs Aug 21, 2014:** in class physics, function recFindNorm4 and SATDifferent, started developing the function...

*  **version 0.0.5 - Thurs Aug 21, 2014:** in class rectangle, function makeEdges, 6th line, changed code to become simpler and more efficient. (PS: updated code: `i2 = corner[(i1+1)%@shape.verticies.length]`)

*  **version 0.0.1 - Thurs Aug 20, 2014:** migrate old code.

## License
Copyright (c) 2016 Mohamed Abo El Soud
Licensed under the MIT license.
