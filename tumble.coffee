###
    NOTICE:
        i renounce this version to be the latest version of the tumble physics engine.

    THINGS TO DO:
        1. Make the FPS interactive
        2. Fix the html and css to be modular simple, less finicky and doesnt cause as much hassle
        3. make the collision Detection to be based on gjk algorithm
        4. implement touch events
        5. make the code more phone friendly
        6. try to make the code in the engine class more modular and less dependent
        7. remove functions that cause clutter (like line, item,most functions inside the circle and rectangle classes)
        8. enhance the drawing mechanism in the engine class, allowing objects to draw but not exists in the physical world. (aka imaginary objects)
        9. revamp the body class and remove the item class
        10. make several integrators
        11. try to make the addShape behaviour more straightforward
        12. the current timestepping scheme


    UPDATES:
        Fri Oct 31, 2014: version 221, forgot to deactivate the slowing down of the dragging, oops!...

        Fri Oct 31, 2014: version 220, I just tested the compound shapes, and they worked perfectly (after numerous fixes of course). I have added 3 functions to the vector class. The first of which is the get signed area of a polygon, which essentially returns the positive area of polygon if the verticies are in clockwise and negative if counter-clockwise (i think it might be the other way around). Another function is the get centroid, which uses the signed area to get the centroid. Third one also gets the centroid, but if the points are lined up in a straight line. Speaking of centroids, I made a function that finds the composite's centroid out of individual centroids of its shape. I did a ton of other fixes but I can't even remember them. Now, I get to work on the very last thing in the physics engine, Integration...

        Fri Oct 31, 2014: version 214, I just modified the collision detection algorithm to test shapes of each body separately, then apply the forces on a bigger body structure. I still have to test and create a compound body to see if it works...

        Thurs Oct 30, 2014: version 209, Just tried making the new body class work, and it did very well. Future plans involve taking advantage of the body class by having multiple shapes stuck to one another...

        Thurs Oct 30, 2014: version 208, Just finished making a new Body class, a new Shape class, a Rectangle and a Circle class. I have attached '2' to the name of each class to avoid confusion. The Body class allows for the ability to have several shapes to move together in unison, as if they are attached to one another (not sure how to implement that in collision detection). I still have to test and see if it works...

        Wed Oct 29, 2014: version 200, I just tried to make the collision detection/resolution run everytime the engine does an iteration. The results of which yielded impressive results to the stability and efficiency of the engine. I will further look into the timestepping algorithm...

        Wed Oct 29, 2014: version 196, just tried the impulse witht eh clipping functions, they work great. However, they dont work with the GJK functions. Future plans include working with the timestepping algorithm...

        Mon Oct 27, 2014: version 192, just made a clipping function that creates contact points. I am very happy with it, and it works so far so well tracking and showing points. I have yet to try it with impulse and see how it works...

        Sun Oct 26, 2014: version 189, made an optimised SAT algorithm. however it only returns a vector of separation (with its length). I have yet to add the algorithm to add contact points...

        Sun Oct 26, 2014: version 187, finished altering the GJK algorithm to accomodate circles. Now the behaviour can detect collisions between two circles, two rectangles and a circle and a rectangle. Future plans involve optimising the SAT algorithm...

        Fri Oct 24, 2014: version 183, touch events were a faliure due to the poor touch events in browsers. I started working on a GJK algorithm for polygon detection (and it works). I also implemented an SAT behaviour as well as a impulse resolution behaviour. Future plans involve making the circle collision detection for SAT and GJK as well as resolution...

        Wed Oct 15, 2014: version 148, Just fixed the refreshing of the buttons. Now I will officially start implementing touch events...

        Tues Oct 14, 2014: version 146, the new button design has been fully designed and almost fully implemented. what is left is to change the state of the buttons upon refreshing and the buttons would be done. Future plans also include adding touch events....

         Mon Oct 6, 2014: version 140, more small updates. Created a canvas adjustment behaviour, future plans involve looking into the interface, making it phone friendly and creating jquery touch events...

        Mon Oct 6, 2014: version 138, more small updates. Created a mouse behaviour, future plans involve creating a canvas adjustment behaviour...

        Fri Oct 3, 2014: version 136, small update. Just fixed all the button stuff mentioned earlier (suprisingly fast), now I will work on the clicking behaviour...

        Fri Oct 3, 2014: version 135, minor update. I made the functionality of the buttons to allow an "alter" function, that allows manipulation of buttons without triggering listeners, though i was not able to implement it. I was also able to consolidate most of the active demo stuff into one class, for the sake of modularity. Future plans involve refining the controls to the buttons, so that when the refresh button is clicked and the string and gravity behaviours are deactivated, the buttons "un-click" themselves. Also I am considering creating another behaviour to control clicking in order to further modularize the engine...

        Thur Oct 2,2014: version 131, was able to refine all behaviours, make them inheritive. They all work perfectly fine now. Future plans involve fixing the buttons or replacing them altogether...

        Tue Sep 30,2014: version 112, was able to streamline most of the engine class by getting rid of all constraints and button related code. I was also able to refine and optimise all of the behaviours to work without the engine class, operating separately, using the the pubsub implementation, which proved to be very useful. Future plans involve creating a structure, behaviour class that all other behaviours inherit from. Other future plans also include fixing the buttons or replacing them altogether...

        Mon Sep 29,2014: version 100, was able to set a FPS indicator at the top of the page. was able to isolate most of the behaviours from the engine class through the PUB/SUB pattern (publisher/subscriber). Was also able to create behaviours for play and pause, refresh and string using pubsub. future plans involve isolating the addShape behaviour from the engine class.

        Mon Sep 22,2014: version 89, briefly created a button for both playing and strings. Both work as expected. future plans involve setting the fps and the string behaviour

        Mon Sep 22,2014: version 88, in class engine, function presets, created a module that loads presets from the user and displays them appropriately. Future plans involve creating a behaviour for strings and two buttons: play/pause and string buttons.

        Sat Sep 20,2014: version 80, in class addShape, was able to fix the function and make it somewhat operational. Future plans involve fixing the presets...

        Fri Sep 19,2014: version 77, in class button, was able to make a whole class system of buttons. However integration remains a very challenging task as I have to understand JQuery events inside and out for the interface to operate smoothly.

        Thur Sep 18,2014: version 67, in class Shape, function applyForce: was able to inegrate the applyForce into the applyImpulse function in the class Physics. Also I have branched out all the rope behaviour out of the Shape class to add more flexibility and accessibility. Future plans include implementation of the "G" button as well as the operation of the last behaviour, possibly optimising the shape creation model...

        Wed Sep 17,2014: version 60, in class Body, function applyForce: was able to optimise the behaviour of the drage capability. Now, the dragging seems smooth and natural. It looks really good!

        Sun Sep 14,2014: version 43, in class Integrator & Body, finished writing a replacement for the item and shape functions. has not been implemented quite yet...

        Sun Sep 14,2014: version 42, in class Behaviour & Constraints, finished writing Behaviour and behaviours classes (e.g: Gravity,Drag) however code has been written on implementation and troubleshooting. New code implements new techniques of modular code and some theoretical ideas. Increased troubleshooting is expected. Implementation requires the overhall and organisation of the engine class, hence future plans involve changing the class's code...

        Wed Sep 10,2014: version 35, in class physics, function calculateImpulse4: fixed the friction mechanism as much as possible, future plans involve optimising performance...

        Mon Sep 8,2014: version 32, in class engine, function checkDrag: was able to fix the dragging in hopes to do some experimentation with friction. possible game idea is also found...

        Sun Sep 7,2014: version 30, in class physics, function calculateImpulse4: was able to create a new function that is stable. Friction part of the function is yet to be analyzed...

        Mon Sep 6,2014: version 29, in class physics, function impulseResolution: experimenting on to fix a problem where the object acts differently if it is the first shape or second in the queue...

        Mon Sep 1,2014: version 22, overhauled the interface across all fronts. Html,css and javascript have changed

        Sun Aug 24, 2014 : version 20, in class string, queue and engine, finished developing the string and queue class, fully functioning now. there are notable improvements in performance though not optimal. future plans involve overhauling the interface...

        Sat Aug 23, 2014 : version 19, in class engine, started developing a queue for the strings, got rid of the need for jcan, no function needs it anymore...

        Thurs Aug 21, 2014 : version 16, in class physics, function recFindNorm4 and SATDifferent function completed, fully operational...

        Thurs Aug 21, 2014 : version 6, in class physics, function recFindNorm4 and SATDifferent, started developing the function...

        Thurs Aug 21, 2014 : in class rectangle, function makeEdges, 6th line, changed code to become simpler and more efficient...
        updated code:"i2 = corner[(i1+1)%@shape.verticies.length]"
###


###
    Copyright (c) 2014 Mohamed Abo El Soud https://github.com/Mohamed-Abo-El-Soud

    This software is provided 'as-is', without any express or implied
    warranty. In no event will the authors be held liable for any damages
    arising from the use of this software.

    Permission is granted to anyone to use this software for any purpose,
    including commercial applications, and to alter it and redistribute it
    freely, subject to the following restrictions:
      1. The origin of this software must not be misrepresented; you must not
         claim that you wrote the original software. If you use this software
         in a product, an acknowledgment in the product documentation would be
         appreciated but is not required.
      2. Altered source versions must be plainly marked as such, and must not be
         misrepresented as being the original software.
      3. This notice may not be removed or altered from any source distribution.
###

##############################  TOOLS ##############################


# mathimatical constants...
sin = (val) ->Math.sin val
cos = (val) ->Math.cos val
abs = (val) ->Math.abs val
pow = (val,exp) ->Math.pow val , exp
sqrt = (val) ->Math.sqrt val
sqr = (val)-> pow(val,2)
atan = (val) ->Math.atan val
tan = (val) ->Math.tan val
getMin = (val,val2) ->Math.min val,val2
getMax = (val,val2) ->Math.max val,val2
atan2 = (valy,valx) ->Math.atan2 valy,valx
floor = (num)->Math.floor num
ceil = (num)->Math.ceil num
round = (num) ->Math.round num
pi = Math.PI
isEven = (value) -> return if value % 2 is 0 then true else false
solve_Quadratic = (a,b,c)->
    if k = pow(b,2) - 4 * a * c < 0 then return false
    x1=(-b + Math.sqrt(pow(b,2) - 4 * a * c))/(2 * a)
    x2=(-b - Math.sqrt(pow(b,2) - 4 * a * c))/(2 * a)
    return [x1,x2]
getRandomInt = (min, max) ->Math.floor(Math.random() * (max - min + 1)) + min



##### buttons selectors


info = $("#info")
info2 = $("#info2")
info3 = $("#info3")
info4 = $("#info4")

##### console selectors ...
jcan = $("canvas")
can = document.getElementById("canvas1")
ctxx = can.getContext("2d")
win = $(window)
jcan.attr "width", (win.width() - 24)
jcan.attr "height", (win.height() - 20)


requestAnimationFrame = window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimationFrame || window.msRequestAnimationFrame
cancelAnimationFrame = window.cancelAnimationFrame || window.webkitCancelRequestAnimationFrame || window.webkitCancelAnimationFrame || window.mozCancelRequestAnimationFrame || window.mozCancelAnimationFrame || window.oCancelRequestAnimationFrame || window.oCancelAnimationFrame || window.msCancelRequestAnimationFrame || window.msCancelAnimationFrame


####### helper functions ...
ctr = ->
    @x = jcan.width() / 2
    @y = jcan.height() / 2


customChangePrototype = (obj) ->
    for prop of obj
      this[prop] = obj[prop]  if obj.hasOwnProperty(prop)
    return

#plotting stuff...
# html: <div id="placeholder" style="width:600px;height:300px;position:fixed;background:rgba(255, 0, 0, 0.1);z-index:-1;"></div>
#link: http://people.iola.dk/olau/flot/jquery.flot.js
plotItinerary = []
plotting = (number)->
    plotItinerary.push [plotItinerary.length,number]
    #console.log plotItinerary.length
    if plotItinerary.length > 100
        plotItinerary.shift()
        for i in plotItinerary
            i[0]--
    $.plot($("#placeholder"), [plotItinerary],{yaxis:{max:1,min:-1}})

    #[[0, 12], [7, 12], null, [7, 2.5], [12, 2.5]]

makeid = ->
  text = ""
  possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
  for [0...5]
    text += possible.charAt floor Math.random() * possible.length
  text


######### credits to Zato for the following function #########
Array::compare = (array) ->
# if the other array is a falsy value, return
    return false  unless array
# compare lengths - can save a lot of time
    return false  unless @length is array.length
    i = 0
    l = @length
    while i < l
    # Check if we have nested arrays
        if this[i] instanceof Array and array[i] instanceof Array
    # recurse into the nested arrays
            return false  unless this[i].compare(array[i])
    # Warning - two different object instances will never be equal: {x:20} != {x:20}
        else return false  unless this[i] is array[i]
        i++
    true
Array::copy = ()->
    k = []
    for i in @
        k.push i
    return k

generateRandomColor = (transparency=getRandomInt(50,100)/100)->
    color = 'rgba('
    for [1..3]
        color += getRandomInt(50,255)
        color += ','
    #color += getRandomInt(50,255)
    color += transparency
    color +=')'
    return color

#################### BUTTON ####################

#### class Button: used to identify and properly use css buttons in the interface
####
#### class Button: used to identify and properly use css buttons in the interface
####
class Button
    constructor:(@name,selector,selector2)->
        throw "Error: Button doesn't have a proper name" if not @name
        # the selector variable is a Jquery selector, which allows
        # the use of JQuery listeners and events in the button class
        @selector = []
        # the type variable is mainly used for error checking
        @type = null
        # gives the option to set the selector for faster initialization
        @setSelector selector,selector2 if selector

        # this is an array of strings that represents the listener JQuery events
        @core = {
                 activates:{}
                 deactivates:{}
                 }

        @activated = false
        #returning itself allows the function to be chainable
        return @

    #### fn getType: returns the type of the object
    #    example:
    #    SampleButton new Toggle()
    #    getType(SampleButton);
    #    // returns "toggle"
    ####
    getType:->
        return @type

    # private
    #### fn makeSelector: creates a (JQuery) selector
    #    val: a css selector in a string format
    ####
    makeSelector:(val)->
        selectionError = "Error: missing or invalid Selector"
        throw selectionError if not val
        throw selectionError if typeof(val) isnt "string"
        return $(val)

    #### fn setSelector: sets the selector property to a jQuery selector, an extension of makeSelector
    #    val: a css selector in a string format
    ####
    setSelector:(val,val2)->
        @selector.push @makeSelector(val) if not @selector[0]
        val2 = val2 or val
        @selector.push @makeSelector(val2) if not @selector[1]
        #returning itself allows the function to be chainable
        return @

    findListener:(group,listener)->
        if arguments.length is 1
            return k if (k=@findListener(@core.activates,listener))>0
            return @findListener(@core.deactivates,listener)
        for i,index of group
            return index if i is listener
        return -1

    #### fn setListener: sets a jQuery event that triggers a certain function
    #    listener: a string represents the JQuery event name (e.g: "click","hover" etc...)
    #    data: the data to be carried into the event handler
    ####
    setListener:(listener,data,activation,deactivation)->
        # makes sure a selector has been set before setting a listener
        return unless @selector.length
        #error checking...
        invalidationError = "Error: invalid"
        throw invalidationError + " listener" if not listener or typeof(listener) isnt "string"
        throw invalidationError + " data assignment"  if typeof(data) isnt "object" and typeof(data) isnt null
        invalidationfn = invalidationError + " function assignment"
        throw invalidationfn if (activation is null and deactivation is null )
        throw invalidationfn if (typeof(activation) isnt "function" and typeof(deactivation) isnt "function" )
        # application...

        @assignActivation(listener,data,activation) if activation
        @assignDeactivation(listener,data,deactivation) if deactivation

        #returning itself allows the function to be chainable
        return @

    #### fn removeListener: removes the jQuery event that triggers the function
    ####
    removeListener:(listener)->
        if @findListener(@core.activates,listener) isnt -1
            @selector[0].off listener
            delete @core.activates[listener]
        if @findListener(@core.deactivates,listener) isnt -1
            @selector[1].off listener
            delete @core.deactivates[listener]
        #returning itself allows the function to be chainable
        return @

    assignActivation:(listener,data,original)->
        # make a copy of the function in the arguments
        #, so as to not tamper with the original
        fn = original.bind null if original
        fn.data = data if fn and data
        if @findListener(@core.activates,listener) is -1
            @core.activates[listener] = []
            @selector[0].on listener,data,(e)=>
                @activation(listener,e)
        @core.activates[listener].push fn if fn
        #returning itself allows the function to be chainable
        return @

    assignDeactivation:(listener,data,original)->
        # make a copy of the function in the arguments
        #, so as to not tamper with the original
        fn = original.bind null if original
        fn.data = data if data
        if @findListener(@core.deactivates,listener) is -1
            @core.deactivates[listener] = []
            @selector[1].on listener,data,(e)=>
                @deactivation(listener,e)
        @core.deactivates[listener].push fn if fn
        #returning itself allows the function to be chainable
        return @

    activation:(listener,e)->
        return @activate(listener,e)
    deactivation:(listener,e)->
        return @deactivate(listener,e)

    activate:(listener,e)->
        return if @activated
        if not listener
            return (for i of @core.activates
                @activate i,e
                @activated = false
            @activated = true
            @)
        for fn in @core.activates[listener]
            eCopy = Object.create e or null
            eCopy.data = fn.data if fn.data
            fn.call this,eCopy
        @activated = true
        #returning itself allows the function to be chainable
        return @

    deactivate:(listener,e)->
        return unless @activated
        if not listener
            return (for i of @core.deactivates
                @deactivate i,e
                @activated = true
            @activated = false
            @)
        for fn in @core.deactivates[listener]
            eCopy = Object.create e or null
            eCopy.data = fn.data if fn.data
            fn.call this,eCopy
        @activated = false
        #returning itself allows the function to be chainable
        return @

#### class Action: a type of button that fires of an action once it is clicked
####
class Action extends Button
    constructor:()->
        super
        @type = "action"
        #returning itself allows the function to be chainable
        return @

    fire:(listener,e)->
        @activation listener,e
        #returning itself allows the function to be chainable
        return @

    activation:(listener,e)->
        @activate(listener,e)
        return @deactivation(null,e)

#### class Toggle: a type of button when clicked once, activates, and when clicked again, deactivates
####
class Toggle extends Button
    constructor:->
        super
        @type = "toggle"
        #returning itself allows the function to be chainable
        return @

    setListener:(listener,data,activation,deactivation)->
        deactivation = deactivation or ()->return null;
        activation = activation or ()->return null;
        super(listener,data,activation,deactivation)

    toggle:(listener,e)->
        @activation listener,e
        #returning itself allows the function to be chainable
        return @

    activation:(listener,e)->
        return if @activated then @deactivate(listener,e) else @activate(listener,e)

    deactivation:(listener,e)->
        #returning itself allows the function to be chainable
        return @

    assignDeactivation:(listener,data,fn)->
        super
        @assignActivation(listener,data,null)

    assignActivation:(listener,data,fn)->
        super
        if @findListener(@core.deactivates,listener) is -1
            @core.deactivates[listener] = []

#### class RadioOption: an instance of a radio option button, mean to be used within an instance of a radio object
####
class RadioOption extends Button
    constructor:->
        super
        @type = "radio option"
        #returning itself allows the function to be chainable
        return @

    #### fn select: selects the radio option
    #    warning: if the object is one of the options of a radio object,
    #    applying this function externally may break its functionality!
    ####
    select:(listener,e)->
        @activate(listener,e)

    #### fn deselect: deselects the radio option
    #    warning: if the object is one of the options of a radio object,
    #    applying this function externally may break its functionality!
    ####
    deselect:(listener,e)->
        return @deactivate(listener,e)

#### class Radio: is an interface type that has sub options to click at. Once a single option has been activated,
#    the remaining options are deactivated as a result, making sure only one option is selected at all times.
####
class Radio extends Button
    constructor:->
        # initializing the options property before the super
        # because the super is going to use it...
        @options = []
        super
        @type = "radio"

    setSelector:(val)->
        selector = @makeSelector(val)
        for i in [0...selector.length]
            className = selector.eq(i).attr "class"
            idName = selector.eq(i).attr "id"
            name = idName or className
            prefix = if idName then "#" else "."
            @add(new RadioOption(name,(prefix+name)))
        #returning itself allows the function to be chainable
        return @

    setListener:(listener,data,activation,deactivation)->
      # not implemented
        return

    #### fn add: adds an option to the roster of possible options to choos in radio buttons
    #    option: a RadioOption object (might be changed)
    ####
    add:(option)->
        # this makes sure we are not adding a duplicate button or adding two buttons of the same name
        return if @findOption option
        throw "Error: invalid option to add" if not option.type or (option.type isnt "radio option")
        # the index property is used in the removal process
        option.index = @options.length
        # the id property is also used in removal
        option.id = makeid()
        @options.push option
        # makes sure it is deactivated before it is put into the radio buttons roster
        # the line of code below is no longer needed (for now...)
        option.deselect()
        # aking sure activating the button selects it in the radio
        originalFn = option.assignActivation
        option.assignActivation = (listener,data,fn)=>
            if option.findListener(option.core.activates,listener) is -1
                option.selector[0].on listener+".adioInternal",data,(e)=>
                    @selectOption option
            originalFn.apply option,arguments

        originalFn2 = option.removeListener
        option.removeListener = (listener)=>
            if option.findListener(option.core.deactivates,listener) isnt -1
                option.selector[0].off listener+".adioInternal"
            originalFn2.apply option,arguments

    remove:(option)->
        # checks that we dont remove a button that doesn't exists
        foundOption = @findOption option
        missingError = "Error: option is missing or not found"
        throw missingError unless foundOption
        index = foundOption.index
        throw missingError if index > @options.length-1
        option = @options[index]

        # removes the button
        @options.splice index,1
        return true

    #### fn selectOption: selects one of the options in the radio buttons roster
    ####
    selectOption:(option)->
        # checks that we dont select a button that doesn't exist
        foundOption = @findOption option
        throw "Error: option is missing or not found" unless foundOption

        for i in @options
            i.deselect()
        # we assume that the option will be selected automatically
        # (see add function for more details)

        #returning itself allows the function to be chainable
        return @

    #### fn getOption: returns the options option object from a specified index
    ####
    getOption:(index)->
        throw "Error: index is not valid" if not index? or index<0 or index > @options.length
        return k if k = @options[index]
        return false

    #### fn getLength: returns the number of options present
    ####
    getLength:()->
        return @options.length

    clicked:()->
        for i,index in @options
            return index if i.activated
        return false

    #### fn findOption: finds an option from the roster of radio buttons
    ####
    findOption:(obj)->
        invalidOption = "Error: input is not a valid option"
        throw invalidOption unless obj
        id = if obj.id? then obj.id else null
        name = if obj.name? then obj.name else null
        tag = if name? then "name" else "id"
        throw invalidOption if not tag?
        for i in @options
            return i if i[tag] is obj[tag]
        return false



#################### QUEUE ####################
class Queue
    constructor:->
        @storage = []
        @size_ = 0
    queue:(item)->
        return false if not item
        @size_++
        @storage.push item
        return true
    peek:->
        return false if not @size_
        return @storage[@size_-1]
    search:(key)->
        for i in @storage
            return i if i.compare key
        return false
    get:(index)->
        return if @storage[index] then @storage[index] else null
    size:-> return @size_
    clear:->
        @size_ = 0
        @storage = []
    dequeue:->
        return false if not @size_
        @size_--
        return @storage.pop()

class Rope
    constructor:(@shape1 = null,@shape2 = null)->
        @color = "grey"
    line:->
        return new Line(@shape1.physical.position,@shape2.physical.position)
    compare:(S1,S2)->
        if ((S1 is @shape1) and (S2 is @shape2)) or ((S2 is @shape1) and (S1 is @shape2))
            return true
        return false
    draw:(width=1,color)->
        m = new Line(@shape1.physical.position,@shape2.physical.position)
        m.draw(width,color or @color)
#################### END OF TOOLS ####################
#################### CLASSES ####################

#################### Engine ####################

class Engine
    constructor:()->
        @request =
            frame: true
            animation: false
        @count = 0
        @shapes = []
        @lastLoop = new Date()
        @thisLoop = null
        @leftOverTime = 0
        @accumulator = 0
        @ITERATIONS = 8*2
        @fpsCount = 1#1 / 10
        @dt = 1/@fpsCount
        @fpsNum = null
        @pageX=0
        @pageY=0
        @fps()
        @update()

    #### PUBSUB

    topics = {}
    emit:(topic,info)->
        if not topics[topic] or not topics[topic].queue.length
            return
        for i in topics[topic].queue
            continue unless i.fn
            i.fn.apply i.scope,[topic,info]
            if i.fn.one
                tempArr = tempArr or []
                i.fn.one = null
                tempArr.push i
        if tempArr
            for i in tempArr
                @off({topic:topic,fn:i.fn})

    on:(topic,fn,scope,name)->
        if not topics[topic]
            topics[topic] = {queue:[]}
        fn.id = makeid() if not fn.id
        throw "duplicates" if @find(topic,fn.id)
        index = topics[topic].queue.push({fn:fn,scope:(scope or null),name:name})-1
        return

    findByTopic:(topic,id)->
        for obj,index in topics[topic].queue
            return {index:index,obj:obj} if obj.fn.id is id
        return false

    find:(topic,id)->
        if topic is true
            for i of topics
                return k if k=@findByTopic(i,id)
            return false
        return @findByTopic(topic,id)

    off:(obj)->
        #### obj = {
        #             topic*: the topic
        #             id: the id
        #             fn: the function
        #         }
        if not topics[obj.topic] or not topics[obj.topic].queue.length
            return
        id_ = if obj.fn then obj.fn.id else obj.id
        return result unless result = @find obj.topic,id_
        return topics[obj.topic].queue.splice result.index,1

    one:(topic,fn,scope,name)->
        fn.one = true
        @on.apply @,arguments
    #### PUBSUB

    setupInput:(type)->
        @input = {
                  type: type
                  }
    resetInput:()->
        @input = null
    fps:->
        @thisLoop = new Date().getTime()
        #this accumulator builds up so since im not using it, ill turn it off
        @accumulator += @thisLoop - @lastLoop
        @elapsedTime = @thisLoop-@lastLoop
        @lastLoop = @thisLoop
        @fpsNum = 1000/@accumulator#@elapsedTime
        $("#fps").html(ceil @fpsNum)
    implement:(item)->
        @shapes.push item
        @emit("implement",{shape:item,index:@shapes.length-1,shapes:@shapes,engine:@})
    checkWall:(shape)->
        vel = shape.get("v")
        bound = shape.get("bounding")
        constant = 1.8
        if bound[0].x > jcan.width()
            if (product = vel.dot(base = new Vector(1,0))) > 0
                vel.move base.scale(-product*constant)
                #shape.move new Vector(-1,0).scale 0.1
        if bound[1].x < 0
            if (product = vel.dot(base = new Vector(-1,0))) > 0
                vel.move base.scale(-product*constant)
                #shape.move new Vector(1,0).scale 0.2
        if bound[0].y > jcan.height()
            if (product = vel.dot(base = new Vector(0,1))) > 0
                vel.move base.scale(-product*constant)
                #shape.move new Vector(0,-1).scale 0.2
        if bound[1].y < 0
            if (product = vel.dot(base = new Vector(0,-1))) > 0
                vel.move base.scale(-product*constant)
                #shape.move new Vector(0,1).scale 0.2
    animate:->
        @emit("animate",{timestep:@dt,cursor:new Vector(@pageX,@pageY),engine:@})
        for [0...@ITERATIONS]
            null
            @emit("iterate",{timestep:@dt,cursor:new Vector(@pageX,@pageY),engine:@})
            for i,i1 in @shapes
                i.integrate @dt
        for i in @shapes
            null
            @checkWall i
    draw:->
        ctxx.clearRect(0,0,jcan.width(),jcan.height())
        for i in @shapes
            i.draw(ctxx)
    update:()->
        that = if that? then that else @
        that.fps()
        @draw()
        if @accumulator > @dt*1.2
            @accumulator= @dt*1.2
        while @accumulator > @dt
            @emit("update",{timestep:@dt,cursor:new Vector(@pageX,@pageY),engine:@})
            @accumulator -= @dt
        setTimeout ->
            requestAnimationFrame(() ->
                that.update()
            ) if that.request.frame is true
        ,0#1000/120
#################### Behaviour ####################

#### class Behaviour: adds different behaviours upon user interaction with the engine
#    set: set its parameters in which the behaviour is going to function
#    update: affects the world for the behaviour to be achieved
#    active: boolean - displays whether the behaviour is running
#    activate: activates the behaviour
#    deactivate: deactivates the behaviour
####
class Behaviour
    constructor:()->
        @active = false
        # this variable is made to know if the behaviour has been set or otherwise
        @isSet = false
        #this gives the option to set the behaviour as it is initialized
        args = arguments[0]
        #gives the option to set the behaviour as it is initialized
        #@set.apply @,args if args.length
    activate:(@engine,@trigger,@action="apply")->
        @engine.on @trigger,@[@action],@
        return @active = true
    deactivate:()->
        @reset(true,{engine:@engine})
        @engine.off {topic:@trigger,fn:@[@action]}
        return @active = false

    isActivated:()-> return @active
    set:(mode)->
        #checks if the functions have parameters
        throw "Error: Undefined Mode or required parameter" if not mode
        #asserts that the behaviour has been properly set
        @isSet = true unless @isSet

    apply:(event,info)->
        engine = info.engine
        throw "not set" unless @isSet
        for key,value of @updates
            engine.on(key,value[0],value[1],key)
         for key,value of @resets
            engine.one(key,value[0],value[1],key)

    #### reset: restores this behaviour instance to its initial state.
    ####
    reset:(event,info)->
        engine = info.engine
        for key,value of @updates
            engine.off {topic:key,fn:value[0]}
        for key,value of @resets
            continue if key is event
            engine.off {topic:key,fn:value[0]}

    #### getType: returns the type of shape provided
    ####
    getType:(shape)->
        name = shape.type
        throw "name not available" if not name or
            (name isnt "Rectangle" and name isnt "Circle" and name isnt "Shape")
        return shape.type

#### class Collision: a template for other collision detectors/solvers
####

class Collision extends Behaviour
    constructor:(checks)->
        super
        @updates = {}
        for i in checks
            @updates[i] = [@update,@]
        @set(true)
    activate:(engine)->
        @apply(null,{engine:engine})
        return @active = true
    deactivate:()->
        @reset(true,{engine:@engine})
        return @active = false
    update:()->
        return

#### class CollisionControl: checks if objects collided
####

class CollisionControl extends Behaviour
    constructor: ->
        super
    activate:(engine)->
        @apply(engine)
    deactivate:()->
        super
    apply:(engine)->
        engine.on "iterate",()->
            for i,i1 in engine.shapes
                for n,n1 in engine.shapes
                    continue if n1 <= i1
                    continue if not (n.get("invM") or i.get("invM"))
                    engine.emit ("checkColl: " + @getType(i) +
                        " - " + @getType(n))
                        ,{
                          ,A:i
                          ,B:n
                          ,engine:engine
                          }
        ,@

#### class AABB: checks if shapes are inside one another
####

class AABB extends Collision
    constructor: ->
        super(["checkColl: Rectangle - Circle"
               ,"checkColl: Circle - Rectangle"
               ,"checkColl: Rectangle - Rectangle"
               ,"checkColl: Circle - Circle"])

    update:(event,data)->
        a = data.A
        b = data.B
        engine = data.engine
        return unless @inside(a,b) or @inside b,a
        for i in a.shapes
            for n in b.shapes
                engine.emit ("AABB: " + @getType(i) + " - " + @getType(n))
                                ,{
                                  ,A:i#a
                                  ,B:n#b
                                  ,engine:engine
                                  }

    inside:(shape1,shape2)->
        b1 = shape1.get "bounding"
        b2 = shape2.get "bounding"
        if b2[1].x <= b1[0].x <= b2[0].x or b1[1].x <= b2[0].x <= b1[0].x
            if b2[1].y <= b1[0].y <= b2[0].y or b2[1].y <= b1[0].y <= b2[0].y
                return true
        return false

#### class GJK: Uses the GJK algorithm to find the collision between two polygons
####

class GJK extends Collision
    ###
        "AABB: Rectangle - Circle"
        "AABB: Circle - Rectangle"
        "AABB: Rectangle - Rectangle"
        "AABB: Circle - Circle"
    ###
    constructor: ->
        super([
                "AABB: Shape - Shape"
               ])

    simplex:(shape1,shape2)->
        simplexPoints = []
        safeguard = 0
        supportFn = @doSupport.bind @,shape1,shape2
        getLatestPt = ()-> return simplexPoints[simplexPoints.length-1]
        # choose an initial direction
        direction = shape1.get("position").subtract(
            shape2.get("position"))
        direction = direction.add(direction.normal().scale(0.5))
        # get the first simplex point
        simplexPoints.push supportFn(direction)
        # reverse directions...
        direction = direction.scale(-1)
        # start loop
        while (safeguard++ < 10)
            # quick error check
            return false if safeguard >= 10
            #throw "too many iterations" if safeguard >= 10
            # add another simplex point
            simplexPoints.push supportFn(direction)
            # if a support point is the zero vector (by sheer luck)
            if abs(getLatestPt().x) < 0.1 and abs(getLatestPt().y) < 0.1
                return false
            # (Easy out case) if the dot product of the direction
            # and the latest point is < 0 then the origin isnt in the simplex
            if direction.dot(getLatestPt())<=0
                return false
            # else check if the origin is in the simplex
            if @containsOrigin simplexPoints,direction
                # if it is in the simplex, return true
                return separation(simplexPoints,supportFn)
            # else we dont know if the origin is
            # in the simplex, so change directions and repeat the loop...
        return false

    containsOrigin:(points,direction)->
        if points.length is 3
            a = points[2]
            b = points[1]
            c = points[0]
            ab = b.subtract a
            ac = c.subtract a
            ao = a.scale -1
            abPerp = tripleCross ac,ab,ab
            acPerp = tripleCross ab,ac,ac
            if abPerp.dot(ao) > 0
                points.splice(0,1)
            else if acPerp.dot(ao) > 0
                points.splice(1,1)
            else
                return true
        if points.length is 2
            a = points[1]
            b = points[0]
            ab = b.subtract a
            ao = a.scale -1
            result = tripleCross ab,ao,ab
            direction.equal result
            return false

    separation=(points,supportFn)->
        safeguard = 0
        first = {p1 : null,p2 : null,normal : null,length : null,ratio: null}
        second = {p1 : null,p2 : null,normal : null,length : null,ratio: null}
        third = {p1 : null,p2 : null,normal : null,length : null,ratio: null}
        rankingQueue = [first,second,third]
        firstPlaces = []
        # initialization...
        for i,i1 in points
            n1 = (if i1+1 is points.length then 0 else i1+1)
            n = points[n1]
            temp = new edgePoints(i,n,points)
            ranking(temp,rankingQueue)
        # opening...
        while (safeguard++ < 10)
            # quick error check
            throw "are you sure?" if safeguard > 10
            firstPlace = rankingQueue[0]
            p1 = firstPlace.p1
            p2 = firstPlace.p2
            direction = firstPlace.normal
            newPoint = supportFn(direction) if supportFn
            if abs(direction.dot(newPoint) - direction.dot(p1)) < 0.1 or
             abs(direction.dot(newPoint) - direction.dot(p2)) < 0.1
                return firstPlace
            rankingQueue.splice 0,1
            rankingQueue.push third
            ranking(new edgePoints(p1,newPoint,points),rankingQueue)
            ranking(new edgePoints(newPoint,p2,points),rankingQueue)
        return false

    ranking = (edgePoint,rankings)->
        item = edgePoint
        for rank,index in rankings
            if rank.normal is null
                rankings[index] = item
                break
            if edgePoint.length < rank.length
                temp = rankings[index]
                rankings[index] = item
                item = temp
                continue
        return rankings

    edgePoints = (@p1,@p2,@simplex)->
        a = @p1
        b = @p2
        ab = b.subtract a
        ao = a.scale -1
        abDotAb = ab.dot(ab)
        if abDotAb is 0
            console.log @
            throw "it is a zero!"
        @ratio = ao.dot(ab)/abDotAb
        @normal = tripleCross(ao,ab,ab).scale(1/abDotAb)
        if @ratio < 0
            @normal = a
        if @ratio > 1
            @normal = b

        @length = @normal.dot(@normal)

        @

    tripleCross=(a,b,c)->
        return b.scale(c.dot(a)).subtract(a.scale(c.dot(b)))

    simplexPoint = (k1,k2)->
        vector = k1.subtract k2
        vector.p1 = k1
        vector.p2 = k2
        return vector

    doSupport:(a,b,dir)->
        return simplexPoint(a.support(dir),b.support(dir.scale(-1)))

    getManifolds:(mtv,initial)->
        return unless not(mtv.p1.p1 is mtv.p2.p1) and
            not(mtv.p1.p2 is mtv.p2.p2)
        max = -Infinity
        maxVec = null
        min = Infinity
        minVec = null
        edgeVec = mtv.p1.p1.subtract mtv.p2.p1
        stack = initial or [mtv.p1.p1,mtv.p2.p1,mtv.p1.p2,mtv.p2.p2]
        for i,index in stack
            temp = i.dot(edgeVec)
            if temp > max
                max = temp
                maxVec = index
            if temp < min
                min = temp
                minVec = index
        stack.splice(getMax(maxVec,minVec),1)
        stack.splice(getMin(maxVec,minVec),1)
        return stack

    getNormals:(normals,vec)->
        max = -Infinity
        maxVec = null
        for i,index in normals
            temp = i.dot(vec)
            if temp > max
                max = temp
                maxVec = index
        return normals[maxVec] if maxVec?
        return false


    update:(event,data)->
        a = data.A
        b = data.B
        engine = data.engine
        mtv = @simplex(a,b)
        return unless mtv
        manifoldation = []
        norm = null
        vec = mtv.normal.scale(-1)
        aP = mtv.p1
        bP = mtv.p2
        s1 = "p2"
        s2 = "p1"
        lambda2 = mtv.ratio
        lambda1 = 1 - lambda2
        if lambda1 < 0
            closestA = bP.p1
            closestB = bP.p2
        else if lambda2 < 0
            closestA = aP.p1
            closestB = aP.p2
        closestA = aP[s1].scale(lambda1).add(bP[s1].scale(lambda2))
        closestB = aP[s2].scale(lambda1).add(bP[s2].scale(lambda2))
        manifoldation.push new Line(closestA,closestB).middle()
        temp = {}
        temp.norm = @getNormals(a.get("norms").concat(b.get("norms")),vec)
        #temp.norm = @getNormals(a.shapes[0].get("norms").concat(b.shapes[0].get("norms")),vec)
        temp.manifold = @getManifolds(mtv)
        norm = temp.norm if temp.norm
        norm = vec.unit() if not norm
        manifoldation = temp.manifold if temp.manifold
        obj = {vector:[],normal:norm.copy(),manifold:manifoldation}
        for i in manifoldation
            obj.vector.push vec
        engine.emit "collided: " + @getType(a) + " - " + @getType(b)
                ,{cursor:new Vector(engine.pageX,engine.pageY)
                  ,a:a
                  ,b:b
                  ,engine:@engine
                  ,collision:obj}#{vector:vec,normal:norm.copy(),manifold:manifoldation}}
        return


class SATColl extends Collision
    ###
        "AABB: Rectangle - Circle"
        "AABB: Circle - Rectangle"
        "AABB: Rectangle - Rectangle"
        "AABB: Circle - Circle"
    ###
    constructor: ->
        super([
                "AABB: Shape - Shape"
               ])

    getShapeType:(shape)->
        return shape.shapeType

    getAxies:(a,b)->
        #typeA = @getType a
        #typeB = @getType b
        typeA = @getShapeType a
        typeB = @getShapeType b

        result = []
        if typeA is "Circle"
            temp = @circleAxis(a,b)
            result = result.concat(temp) if temp.length
        if typeB is "Circle"
            temp = @circleAxis(b,a)
            result = result.concat(temp) if temp.length

        result.push i for i in a.get("norms")
        result.push i for i in b.get("norms")
        #result.push i for i in a.shapes[0].get("norms")
        #result.push i for i in b.shapes[0].get("norms")

        return result

    circleAxis:(circ,nonCirc)->
        if @getShapeType(nonCirc) is "Circle"
        #if @getType(nonCirc) is "Circle"
            k = circ.get("position").subtract(
                nonCirc.get("position"))
            k.getLength()
            return [k.unit()]
        pos = circ.get("position")
        result = []
        for i in nonCirc.get("verticies")
        #for i in nonCirc.shapes[0].get("verticies")
            vec = pos.subtract(i)
            vec.getLength()
            result.push vec.unit()
        return result

    removeDuplicateAxis:(axises)->
        removals = []
        for i,i1 in axises
            booli = false
            for n,n1 in axises
                continue if n1 <= i1
                continue if booli
                if abs(abs(i.dot(n))-1) < 0.0000001
                    booli = true
            if not booli
                removals.push i
        return removals

    projectShape:(shape,axis,booli)->
        throw "no booli" if not booli?
        # this is important...
        support = shape.support axis
        dot = support.subtract(shape.get("position")).dot axis
        return dot if booli
        return axis.scale dot

    optimizedSAT:(shape1,shape2)->
        # get a vector from one shape to another (will be used later)
        relation = shape2.get("position").subtract shape1.get("position")
        # get all possible axises to test
        totalAxises = @getAxies(shape1,shape2)
        # remove duplicate axises or reflected axises
        totalAxises = @removeDuplicateAxis(totalAxises)
        # get the index of the axis that symbolizes
        # the shortest separating distance
        minIndex = null
        minLength = Infinity
        # start loop...
        for axis,index in totalAxises
            # makes sure all axises are unit vectors
            throw "not unit vector" if axis.length isnt 1
            # get the dot product of the relation
            # vector and the axis
            projectAxis = relation.dot(axis)

            if projectAxis < 0
                projectAxis *= -1
                axis = totalAxises[index] = axis.scale -1
            # get the dot product of the shape's
            # projection and the axis
            proj1 = @projectShape(shape1,axis,true)
            proj2 = @projectShape(shape2,axis.scale(-1),true)
            # get the distance squared, separating
            # the shapes from each other
            dist = (proj1+proj2) - projectAxis
            # quick exit: if the lengths of the projections
            # are shorter than the length of projection axis,
            # then they are not colliding...
            if dist < 0
                return false
            # if if they are, we have to do more work
            if dist < minLength
                minLength = dist
                minIndex = index

        # after we determined the axis of minimum separation,
        # now we have to create the vector
        # quick error check...
        throw "no index!" if not minIndex?
        minAxis = totalAxises[minIndex]
        # get the projection of the relation vector
        # in the direction of the axis
        projectAxis = relation.projection(minAxis)
        # get the projection of the shapes
        # in the direction of the axis
        proj1 = @projectShape(shape1,minAxis,false)
        proj2 = @projectShape(shape2,minAxis.scale(-1),false)
        # quick error checks to make sure
        # everything is in the right direction
        throw "projections arent opposite" if proj1.dot(proj2) > 0
        if proj1.dot(projectAxis) < 0
            projectAxis = projectAxis.scale -1
        # return the minimum separation vector
        result = projectAxis.subtract(proj1).add(proj2)
        result.length = abs minAxis.dot result
        return result

    closestEdge:(shape,dir)->
        point = shape.support dir
        if not point.edge1 or not point.edge2
            return {type:"vector",edge:point}
        edge1 = point.edge1
        edge2 = point.edge2
        if abs(edge1.vector().unit().dot(dir)) <= abs(edge2.vector().unit().dot(dir))
            otherPoint = if edge1.p1 is point then edge1.p2 else edge1.p1
            result = new Line(point,otherPoint)
            result.length = edge1.length
            return {type:"edge",edge:result,support: point}

        otherPoint = if edge2.p1 is point then edge2.p2 else edge2.p1
        result = new Line(point,otherPoint)
        result.length = edge2.length
        return {type:"edge",edge:result,support: point}

    getManifold:(a,b,normal)->
        # get the closest edge of both shapes
        edgeA = @closestEdge(a,normal)
        edgeB = @closestEdge(b,normal.scale(-1))
        # if the edge returned is a point (like in a circle)
        if edgeA.type is "vector"
            return {points:[edgeA.edge],flip:false}
        if edgeB.type is "vector"
            return {points:[edgeB.edge],flip:false}
        flip = false
        # find the edge most perpendicular to the normal
        # and make that the reference edge
        if abs(edgeA.edge.vector().unit().dot(normal)) <=
        abs(edgeB.edge.vector().unit().dot(normal))
            ref = edgeA
            inc = edgeB
        else
            ref = edgeB
            inc = edgeA
            # set a flag to indicate that we
            # are flipping the normal later
            flip = true

        p1 = inc.edge.p1
        p2 = inc.edge.p2
        refVec = ref.edge.vector().unit()
        o = refVec.dot(ref.edge.p1)
        cp =  @clippling(p1,p2,refVec,o)
        return false if cp.length < 2
        refVec = refVec.scale -1
        o = refVec.dot(ref.edge.p2)
        cp =  @clippling(cp[0],cp[1],refVec,o)
        return false if cp.length < 2
        normal = normal.scale(-1)
        normal = normal.scale(-1) if flip
        max = normal.dot(ref.support)
        cp[0].depth = normal.dot(cp[0]) - max
        cp[1].depth = normal.dot(cp[1]) - max
        cp.splice 1,1 if cp[1].depth < 0
        cp.splice 0,1 if cp[0].depth < 0
        #throw "no points!" unless cp.length
        return {points:cp,flip:flip}


    clippling:(p1,p2,ref,o)->
        # create a container to store the clipped points
        cp = []
        # find if p1 and p2 are past the of ref edge
        d1 = p1.dot(ref) - o
        d2 = p2.dot(ref) - o
        # if they are add them to clipped points
        cp.push(p1) if d1 >= 0
        cp.push(p2) if d2 >= 0
        # if p1 and p2 are opposite sides of the ref edge
        if (d1 * d2) < 0
            # create a vector representing the incident edge
            e = p2.subtract p1
            # find the location along e
            u = d1 / (d1-d2)
            cp.push e.scale(u).add p1
        return cp


    update:(event,data)->
        a = data.A
        b = data.B
        engine = data.engine
        mtv = @optimizedSAT(a,b)
        return unless mtv
        collision = {normal:mtv.unit()}
        manifoldation = @getManifold(b,a,collision.normal)
        return unless manifoldation.points
        collision.manifold = manifoldation.points
        collision.vector = [mtv,mtv]
        for i in collision.manifold
            collision.vector.push collision.normal.scale(i.depth)
            collision.vector.splice(0,1)
        engine.emit "collided: " + @getType(a) + " - " + @getType(b)
            ,{cursor:new Vector(engine.pageX,engine.pageY)
              ,a:a
              ,b:b
              ,engine:@engine
              ,collision:collision}

class impulseResolution extends Collision
    constructor: ->
        super([
               "collided: Rectangle - Circle"
               #,
               "collided: Circle - Rectangle"
               #,
               "collided: Rectangle - Rectangle"
               #,
               "collided: Circle - Circle"
               "collided: Circle - Shape"
               "collided: Shape - Circle"
               "collided: Shape - Shape"
               "collided: Shape - Rectangle"
               "collided: Rectangle - Shape"
               ])

    calculateImpulse4:(A,B,contact,contactsLength,CollisionV,normal)->
        rA = contact.subtract(A.get("position"))
        rB = contact.subtract(B.get("position"))
        angVelA = A.get("rv")
        angVelB = B.get("rv")
        invMassA = A.get("invM")
        invMassB = B.get("invM")
        invMoiA = A.get("invI")
        invMoiB = B.get("invI")
        n = normal.scale(-1)
        perp = n.normal()
        mr = A.get("restitution")
        Or = B.get("restitution")
        e = mr * Or
        sf = A.get("sf") * B.get("sf")
        df = A.get("df") * B.get("df")
        rv = B.get("v").add(rB.scaleCross(-angVelB))
            .subtract(A.get("v")).subtract(rA.scaleCross(-angVelA))
        ###
        rv = rv.add B.get("force").add(rB.scaleCross(-B.get("torque")))
            .subtract(A.get("force")).subtract(rA.scaleCross(-A.get("torque")))
        ####

        contactVel = rv.dot( n )
        return false if contactVel >= 0

        raCrossN = -rA.cross n
        rbCrossN = -rB.cross n

        invMassSum = invMassA + invMassB + sqr(raCrossN)*invMoiA + sqr(rbCrossN) * invMoiB

        impulse = contactVel*(-(1 + e))
        impulse /= invMassSum
        impulse /= contactsLength

        B.applyForce n.scale(impulse),rB.add B.get("position")
        A.applyForce n.scale(-impulse),rA.add A.get("position")

        t = perp
        raCrossT = -rA.cross t
        rbCrossT = -rB.cross t

        invMassSum = invMassA + invMassB + sqr(raCrossT)*invMoiA + sqr(rbCrossT) * invMoiB

        jt = -rv.dot t
        jt/= invMassSum
        sign = if rv.dot(t) < 0 then -1 else 1

        impulse *= sign
        tangentImpulse = if abs(jt) < impulse * sf then t.scale(jt) else t.scale(-impulse * df)


        B.applyForce tangentImpulse,rB.add B.get("position")
        A.applyForce tangentImpulse.scale(-1),rA.add A.get("position")



    positionalCorrection:(percentages,mainShape,otherShape,penetrationDepth,invMasses)->
        percentage = percentages or 0.4
        if (k = penetrationDepth.length)<0.5 then percentage = 0
        throw "" unless penetrationDepth.length?
        correction = penetrationDepth.scale(percentage/invMasses)
        mainShape.move correction.scale(mainShape.get("invM"))
        otherShape.move correction.scale(-otherShape.get("invM"))

    impulseResolve:(A,B,Collision)->
        return new Vector() unless (invMasses = A.get("invM") + B.get("invM"))
        CollisionV = Collision.vector[0]
        normal = Collision.normal or CollisionV.unit()
        contacts = Collision.manifold
        correction = @positionalCorrection null,A,B,CollisionV,invMasses
        for i,i1 in contacts
            #i.draw 0,0
            #@positionalCorrection null,A,B,CollisionV.scale(1/contacts.length),invMasses
            @calculateImpulse4 A,B,i,contacts.length,Collision.vector[i1],normal
            #@calculateImpulse4 A,B,i,12,CollisionV,normal

    update:(event,data)->
        a = data.a
        b = data.b
        a = a.body if @getType(a) is "Shape"
        b = b.body if @getType(b) is "Shape"
        collision = data.collision
        engine = data.engine
        return unless (a.get("invM") or b.get("invM"))
        @impulseResolve(a,b,collision)

#### class Mouse: relays all information on the mouse
#    1. provides the engine with the cartesian coordinates of the input (in this case the mouse)
#    2. notifies the engine of an input interaction (e.g:click of a mouse)
####
class Mouse extends Behaviour
    constructor:(@selector,type,@forbiddenElement)->
        #make sure there is a selector to perform jquery functions
        throw "selector undefined" if not @selector
        #this serves as a reminder that this simulation is dependent on jquery
        throw "undefined type" if type isnt "Jquery" and type isnt "jquery"
        #inputType is used to identify the instance of the class
        # i.e: one would know that this is an input behaviour for a mouse
        @inputType = "mouse"
    activate:(@engine)->
        #error checking...
        throw "engine not defined" if not @engine
        throw "input already exists" if @engine.input
        #registers the behaviour in the engine
        @engine.setupInput(@inputType,@getMouseCoord)
        @mouseClick()
    deactivate:()->
        #unregisters the behaviour in the engine
        @engine.resetInput()
        #stops tracking mouse actions
        @mouseReset()
    emitMouseDown:(event)=>
        # relays mouse info to the engine
        @engine.emit "mousedown",{cursor:new Vector(@engine.pageX,@engine.pageY),engine:@engine}
    emitMouseUp:(event)=>
        # relays mouse info to the engine
        @engine.emit "mouseup",{cursor:new Vector(@engine.pageX,@engine.pageY),engine:@engine}
    emitMouseMove:(event)=>
        # relays mouse info to the engine
        @engine.pageX = event.pageX-10
        @engine.pageY = @selector.height() - event.pageY+6
    mouseClick:()->
        #mouseClick is a funciton that initiates other subfunctions
        @selector.on "mousemove.mouseInput",@mouseChecker.bind null,@emitMouseMove
        @selector.on "mousedown.mouseInput",@mouseChecker.bind null,@emitMouseDown
        @selector.on "mouseup.mouseInput",@mouseChecker.bind null,@emitMouseUp
    mouseReset:()->
        #mouseReset is a funciton that initiates other subfunctions
        # noticed i commented out the functions cause i altered the original functions
        @selector.off "mousemove.mouseInput"#,@emitMouseMove
        @selector.off "mousedown.mouseInput"#,@emitMouseDown
        @selector.off "mouseup.mouseInput"#,@emitMouseUp
    mouseChecker:(fn,e)=>
        if @forbiddenElement
            return if $.contains(@forbiddenElement[0],e.target)
        fn(e)


class CanvasControl extends Behaviour
    constructor:(@selector,@context,@window,type)->
        #make sure there is a selector to perform jquery functions
        throw "selector undefined" if not @selector
        #make sure there is a canvas context to adjust
        throw "context undefined" if not @context
        #make sure there is a canvas context to adjust
        throw "window undefined" if not @window
        #this serves as a reminder that this simulation is dependent on jquery
        throw "undefined type" if type isnt "Jquery" and type isnt "jquery"
        @adjustment()
    activate:(@engine)->
        #error checking...
        throw "engine not defined" if not @engine
        @adjusting()
    deactivate:()->
        #stops adjusting the canvas
        @resetting()
    adjustment:(event)=>
        @selector.attr "width", (@window.width() - 24)
        @selector.attr "height", (@window.height() - 20)
        center = new ctr()
        @context.translate( center.x, center.y )
        @context.scale(1,-1)
        @context.translate( -center.x, -center.y )
    adjusting:()->
        #adjusting is a funciton that initiates other subfunctions
        @window.on "resize.behaviour",@adjustment
    resetting:()->
        #resetting is a funciton that initiates other subfunctions
        @window.off "resize.behaviour",@adjustment
#### class PlayPause: plays and pauses the simulation
####
class PlayPause extends Behaviour
    constructor:()->
        @resets = {"pause":[@reset,@]}

    activate:(engine)->
        super engine,"play","apply"
        @updates = {"update":[engine.animate,engine]}
    deactivate:()->
        super

    #### updates the behaviour
    ####
    # i know this is redundant, but i have to keep this.
    # this is because every function is imprinted with a unique id
    apply:(event,info)->
        return super

    #### fn reset: resets the environment to its original conditions
    ####

    # i know this is redundant, but i have to keep this.
    # this is because every function is imprinted with a unique id
    reset:(event,info)->
        return super

#### class Refresh: resets the simulation to its original state
####
class Refresh extends Behaviour
    constructor:()->

    activate:(engine)->
        super engine,"refresh","update"
    deactivate:()->
        super

    #### updates the behaviour
    ####
    update:(event,info)->
        engine = info.engine
        throw "not set" unless @isSet
        engine.emit("pause",{cursor:new Vector(engine.pageX,engine.pageY),engine:engine})
        engine.shapes = []

#### class String: binds all shapes together with a string that pulls them all together
####
class String extends Behaviour
    constructor:()->
        @strings = new Queue()
        @updatingString = []
        @updates = {"animate":[@update,@],"implement":[@singleString,@]}
        @resets = {"destringify":[@reset,@],"refresh":[@reset,@]}

    set:(obj={all:true,massOnly:false,maxLength:100})->
        ####     Options & Defaults:
        # obj = {
        #         all(deactivated): true  - specifies if all shapes are affected
        #         massOnly: false - specifies if non mass shapes are affected
        #         maxLength: 100 - specifies the maximum length of the string
        #         before force is applied
        #       }
        ####
        #@all = if obj.all? then obj.all else true
        @massOnly = if obj.massOnly? then obj.massOnly else false
        @maxLength = if obj.maxLength? then obj.maxLength else 100
        @isSet = true


    activate:(engine)->
        super engine,"stringify","apply"
    deactivate:()->
        super

    #### fn apply: sets all the information and proper procudure once the behaviour
    #     is activated.
    # event: the name that is called (see pubsub implementation in engine class)
    # info: packaged info in an object form
    ####
    apply:(event,info)->
        super
        engine = info.engine
        @createStrings(engine)

    #### fn reset: resets the environment to its original conditions
    ####
    reset:(event,info)->
        engine = info.engine
        @strings.clear()
        super
        return

    createStrings:(engine)->
        shapes = engine.shapes
        for i,i1 in shapes
            @singleString null,{shape:i,index:i1,shapes:shapes}

    singleString:(event,info)->
        shape = info.shape
        index = info.index
        shapes = info.shapes
        for n,n1 in shapes
                continue if n1 >= index
                continue if not (n.get("invM") or shape.get("invM"))
                if @massOnly
                    continue if not (n.get("invM") and shape.get("invM"))
                @strings.queue [shape,n]

    moveString:(arr)->
        A = arr[0]
        B = arr[1]
        invMassA = A.get("invM")
        invMassB = B.get("invM")
        string = new Line A.get("position"),B.get("position")
        moveVec = string.vector()
        moveVec.getLength()
        color = if moveVec.length < 200 then "grey" else "red"
        n = moveVec.unit()
        rv = B.get("v").subtract(A.get("v"))
        contactVel = rv.dot( n )
        contactVel= if contactVel <=0 then 0 else contactVel
        invMassSum = invMassA + invMassB
        impulse = contactVel*(-1) / invMassSum *0.01
        impulse = -abs(1/invMassSum*0.001)
        B.applyForce n.scale(impulse) if invMassA
        A.applyForce n.scale(-impulse) if invMassB

        string.draw(0.4,color)

    #### fn update: updates the gravitational pull on all shapes
    # event: the name that is called (see pubsub implementation in engine class)
    # info: packaged info in an object form
    ####
    update:(event,info)->
        engine = info.engine
        shapes = engine.shapes
        throw "Error: no 'shapes' array present" if not shapes
        for i in @strings.storage
            @moveString i

#### class Gravity: applies a constant force upon all weighted shapes to a specific direction
####
class Gravity extends Behaviour
    constructor:()->
        #private variable: represents the gravitational force applied
        @a = new Vector()
        @updates = {"animate":[@update,@]}
        @resets = {"degravitate":[@reset,@],"refresh":[@reset,@]}

    #### fn set: sets the pull and the gravitational force applied
    # mag: a scalar representing the magnitude of the gravitational force
    # dir: a unit vector directing the gravitational force
    ####
    set:(mag,dir)->
        incorrectDir = "Error: Missing or Incorrect assignment of direction vector.\n
            Make sure the input direction vector is a unit vector and has a length property (of 1)"
        throw incorrectDir if not dir
        dir.getLength() if not dir.length
        # checks if there is a direction vector and its a unit vector
        throw incorrectDir if not ( abs(dir.length - 1) < 0.1 )
        @a = dir.scale(mag)
        @isSet = true

    activate:(engine)->
        super engine,"gravitate","apply"
    deactivate:()->
        super


    #### fn apply: sets all the information and proper procudure once the behaviour
    #     is activated.
    # event: the name that is called (see pubsub implementation in engine class)
    # info: packaged info in an object form
    ####
    # i know this is redundant, but i have to keep this.
    # this is because every function is imprinted with a unique id
    apply:(event,info)->
        return super

    #### fn reset: resets the environment to its original conditions
    ####

    # i know this is redundant, but i have to keep this.
    # this is because every function is imprinted with a unique id
    reset:(event,info)->
        return super

    #### fn update: updates the gravitational pull on all shapes
    # event: the name that is called (see pubsub implementation in engine class)
    # info: packaged info in an object form
    ####
    update:(event,info)->
        engine = info.engine
        shapes = engine.shapes
        throw "Error: no 'shapes' array present" if not shapes
        for shape in shapes
            shape.applyForce @a.scale(1/shape.get("invM")) if shape.get("invM")

#### class Drag: allows the user to apply a force on any shape in
#    any direction by clicking and dragging.
####
class Drag extends Behaviour

    constructor:()->
        #one vector representing the velocity of the mouse
        @velocity = new Vector()
        @updates = {"animate":[@update,@]}
        @resets = {"mouseup":[@reset,@],"refresh":[@reset,@]}

    activate:(engine)->
        super engine,"mousedown","apply"
    deactivate:()->
        super


    #### fn apply: sets all the information and proper procudure once the behaviour
    #     is activated.
    # event: the name that is called (see pubsub implementation in engine class)
    # info: packaged info in an object form
    ####
    apply:(event,info)->
        engine = info.engine
        throw "not set" unless @isSet

        @mouseLoc = info.cursor
        @shape = @findShape(engine)
        return unless @shape
        @refLoc = @addPoint @mouseLoc.copy(),@shape

        return super

    #### reset: restores this behaviour instance to its initial state. designed to prevent the dragging process from occurring
    ####
    reset:(event,info)->
        @deletePoint @refLoc,@shape if @shape
        @refLoc = null
        @shape = null
        @mouseLoc = null
        return super


    #### fn set: activated on the click of the mouse
    #    pull: the magnitude of the pull that the cursor has on the shape (0 to 1 as percentage of the
    #    pull of the mouse)
    #    speed: the speed of the shape when following the cursor (0 to 1 as percentage of the
    #    velocity of the mouse)
    ####
    set: ( @speed=0.01,@pull=0.71,@torqueDamp=800)->
        @isSet = true
        #super(@speed,@pull)

    #### firstClicked: this function fires off as soon as the mouse is pressed
    #    aims to do 3 things
    #    make sure the behaviour does not initiate the pulling untill it finds a shape to pull
    #    finds the appropriate shape to pull
    #    assigns a point to be attached to the shape to serve as a basis for the torque generated in the pull
    ####
    firstClicked:(event,info)->
        engine = info.engine
        @mouseLoc = info.cursor
        @shape = @findShape(engine)
        return unless @shape
        @refLoc = @addPoint @mouseLoc.copy(),@shape
        @clicking = engine.on("animate",@update,@)
        engine.on("mouseup",@reset,@)


    #### updates the behaviour
    ####
    update:(event,info)->
        throw "not set" unless @isSet
        @mouseLoc = info.cursor
        engine = info.engine
        return @reset(null,info) unless @shape
        # create a velocity out of the mouse's displacement from the shape
        @velocity = @mouseLoc.subtract @refLoc
        @ropePull @shape,@velocity,@refLoc



    #### Points: Points are essentially vectors that are stored within the shape object and are classified with a unique id so they can be retrieved easily. There are three functions that manage such a behaviour:
    #addPoint: adds a point onto the shape, gives it a unique id. the shape should be able to move and rotate the point as the shape itself moves and rotates
    #findPoint: finds the point from the shape's selection of points. this makes sure that the shape in scope is indeed the shape that is being dragged
    #deletePoint: removes the point from existance. This proces is done to get rid of unwanted operations and memory
    ####
    addPoint:(point,shape)->
        #make sure we are not adding unnecessary points
        check = @findPoint(point,shape)
        return check if check
        points = shape.shapes[0].get("points")
        #else add a point and generate a random code for it
        point.index = points.length
        point.id = makeid()
        points.push point
        return point
    findPoint:(point,shape)->
        for i in shape.shapes[0].get("points")
            return i if i.id is point.id
        return false
    deletePoint:(point,shape)->
        return unless @refLoc
        throw "Error: cannot find Point" if not foundPoint = @findPoint(point,shape)
        index = foundPoint.index
        shape.shapes[0].get("points").splice(index,1)

    #### fn findShape: finds the shape clicked on, returns shape object or false
    ####
    findShape:(engine)->
        shapes = engine.shapes
        throw "Error: no 'shapes' array present" if not shapes
        for shape in shapes
            return shape if shape.inside @mouseLoc
        return false


    #### ropePull: an ad-hoc function that extends upon the functionality of the applyForce function in the shape class
    #    it sets the physical behaviour and displays the rope in order to give it a more physical appeal
    ####
    ropePull:(shape,force,contact,friction=0.03,pull,length = 100,color="lightgrey",width=1.5,secondaryColor="red")->
        throw "Error: missing force. Please define a force as a parameter for the function to operate" if not force
        color_ = color
        force.getLength() if not force.length
        funit = force.unit()
        fnorm = funit.normal()
        vel = shape.get("v")
        dot = funit.dot vel
        #vel.equal vel.scale(0.9)
        #shape.set("rv",shape.get("rv")*0.9)
        if dot < 0 and force.length > length
            difference = force.length - length
            vProj = vel.projection funit
            fProj = vel.projection(fnorm).scale -1
            shape.applyForce(vProj.scale(-1),contact)
            shape.move(funit.scale(difference*0.01*shape.get("invM")))
            shape.applyForce fProj.scale(friction),contact
        if force.length > length*1.5
            color_ = secondaryColor
            weight = shape.get("invM") / 10000
            shape.applyForce force.scale(weight),contact
        new Line(contact,contact.add force).draw(width,color_) if contact

#### class AddShape: allows the user to specify which shape gets added to
#    the simulation using a set of predetermined presets.
####
class AddShape extends Behaviour
    constructor:(engine)->

        @count = 0
        #setting up the mouse location
        @mouseLoc = new Vector()
        @locs = []
        @callBack = null

    activate:(engine)->
        super engine,"mousedown","update"
    deactivate:()->
        super
    ###
    apply:(event,info)->
        return @update.apply @,arguments
    ###
    setVelocity:(initialLoc,finalLoc,shape)->
        shape.v = finalLoc.subtract(initialLoc).scale(0.003)
        return shape
    setLocation:(loc,shape)->
        shape.x = loc.x
        shape.y = loc.y
        return shape

    firstOperation:(locations,cursor)->
        locations.push new Vector cursor.x,cursor.y
        if locations.length isnt 2
            return false
        @setLocation(locations[0],@shape) if @shape.setLoc
        @setVelocity(locations[0],locations[1],@shape) if @shape.setVel
        return @shape

    update:(event,info)->
        #makes sure the behaviour has already been set
        return unless @isSet
        #get engine
        engine = info.engine
        #get location of cursor
        @mouseLoc = info.cursor
        #makes sure the location clicked is not being occupied by another shape
        return if @findShape(engine)
        #finds out how many shapes are currently present
        @count = engine.shapes.length
        #makes sure there is a shape in the itinerary
        throw "Error: Shapes are not defined" unless @shape1
        #set which shape is being released
        @setShape(engine)
        #sets the velocity of the shapes
        return unless @firstOperation(@locs,@mouseLoc)
        @locs = []
        @createdShape = @createShape @shape
        engine.implement @createdShape
        @callBack(engine) if @callBack

    ##### fn set: sets the shape you want to spawn
    #     shape1: first shape coming up
    #     shape2: second shape
    #     mode: the a choice of 3 presets of spawning things
    #         container: spawn a container in the middle of the screen and shapes of a certain kind to occupy the container (shape1)
    #         random: span a random choice between two types of shapes (shape1 and shape2) randomly
    #         target: span one of one type of shape (shape1) and an infinite amount of a second type of shape (shape2)
    #####
    set:(@shape1=null,@shape2=null,mode)->
        typesOfModes = ["container","random","target","compound"]
        throw "Error: spawnMode unidentified" if typesOfModes.indexOf(mode) < 0
        @setShape = (eval("this."+mode))
        @isSet = true

    createShape:(props)->
        construct = props.type
        throw "Error: invalid or missing type" if not construct or typeof(construct) isnt "string" or not eval construct
        return new (eval(construct))(props)

    ##### fn container: sets the container required for the set function
    #
    #####
    container:(engine)->
        return @shape = @shape1 if @count isnt 0
        engine.implement @createShape
                        type: "Rectangle"
                        x:jcan.width()/2,
                        y:35,
                        width:700,
                        height:70,
                        invM:0,
                        sf: 0.5,
                        df: 0.4,
                        restitution: 0.0
        engine.implement @createShape
                        type: "Rectangle"
                        x:jcan.width() - 20,
                        y:70+400/2,
                        width:20,
                        height:400,
                        invM:0,
                        sf: 0.3,
                        df: 0.2,
                        restitution: 0.0
        engine.implement @createShape
                        type: "Rectangle"
                        x:20,
                        y:70+400/2,
                        width:20,
                        height:400,
                        invM:0,
                        sf: 0.3,
                        df: 0.2,
                        restitution: 0.0
        return @shape = @shape1

    ##### fn random: sets the randomness for the random spawn mode
    #
    #####
    random:->

        # this gives the option for shape1 parameter to be an array of shapes that spawn randomly
        # however this option is only possible in the random mode
        length = if typeof @shape1 is "Array" then @shape1.length else 1

        array_ = if typeof @shape1 is "Array" then @shape1 else [@shape1,@shape2]

        @shape = array_[getRandomInt(0,length)]

    ##### fn target: sets the target shape and the other shapes for the target spawn mode
    #
    #####
    target:->

        @shape = switch @count
            when 1
                @shape1
            else
                @shape2

    ##### fn compound: creates a compound shape out of the set of shapes created
    #
    ####
    compound:(engine)->
        @callBack = @compound_CALLBACK if not @callBack
        # this gives the option for shape1 parameter to be an array of shapes that spawn randomly
        # however this option is only possible in the random mode
        length = if typeof @shape1 is "Array" then @shape1.length else 1

        array_ = if typeof @shape1 is "Array" then @shape1 else [@shape1,@shape2]

        @shape = array_[getRandomInt(0,length)]

    #### fn compound_CALLBACK: this attaches all newly created shapes to the first shape created
    #
    ####
    compound_CALLBACK:(engine)->
        if not @initialComp
            @initialComp = @createdShape
            engine.one "refresh",(()-> @initialComp=null),@
        else
            for i in @createdShape.shapes
                #console.log @initialComp
                @initialComp.addShape i
            #@initialComp.physical.position.draw 0,0
            #@createdShape
            ###
            test4 = new Rectangle {
                                   invM:1/1.5
                                   orient:0
                                   sf: 0.8
                                   df: 0.5
                                   restitution: 0
                                   v:new Vector(-0.1,-0.1)
                                   x:300
                                   y:200
                                   width:50
                                   height: 89
                                   }
            ####
            #@initialComp.addShape test4.shapes[0]
            engine.shapes.pop()


    #### fn findShape: finds the shape clicked on, returns shape object or false
    ####
    findShape:(engine)->
        shapes = engine.shapes
        throw "Error: no 'shapes' array present" if not shapes
        for shape in shapes
            return shape if shape.inside @mouseLoc
        return false

    #### fn setVelFn: creates a small functionality where the velocity of the object can be set
    ####
    setVelFn:(shape)->
        if not @initCount
            @initLoc = new Vector shape.x,shape.y
            @initCount = true
            return false
        @initCount = null
        @initVel = null
        shape.v = new Vector(shape.x,shape.y).subtract(@initLoc).scale(0.003)

#### class Presets: is a set of different instances of behaviours that
#    can be activated or deactivated.
####
class Presets
    constructor:()->
        @storage = []
        @pickedIndex = -1
        @isSet = false

    activate:(engine)->
        return unless @isSet
        @engine = @engine or engine
        @storage[@pickedIndex].activate(@engine)

    deactivate:()->
        return unless @isSet
        @storage[@pickedIndex].deactivate()

    add:(choice,construct)->
        @pickedIndex = if @pickedIndex < 0 then 0 else @pickedIndex
        @isSet = @isSet or true
        addFn = @storage[@storage.push(new construct()) - 1]
        addFn.set.apply addFn,choice

    choose:(index)->
        throw "invalid index" if index < 0 or index > @storage.length-1
        @deactivate()
        @pickedIndex = index
        @activate(@engine)

#################### Vector ####################
class Vector
    constructor:(@x=0,@y=0)->
    copy:(temp,temp2)->
        k = new Vector(@x,@y)
        k.length = @length
        return k
    move:(other)->
       @x+=other.x
       @y+=other.y
       @length = @a = undefined
    equal:(other)->
        @x = other.x
        @y = other.y
        @length = other.length
        @a = other.a
    scale:(s,temp)->
        if abs s is Infinity then throw "infinity alert!"
        k = new Vector(@x*s,@y*s)
        k.length = @length * abs s
        return k
    subtract:(other)->
        return new Vector(@x-other.x,@y-other.y)
    add:(other)->
        return new Vector(@x+other.x,@y+other.y)
    scaleAdd:(s)->
        return new Vector(@x+s,@y+s)
    getLength:->
        @length = sqrt sqr(@x)+sqr(@y)
    getAngle:->
        @a = atan2 @y,@x
    angle:(other)->
        k = @a-other.a
        if k < 0
            return 2*pi + k
        if k > 2*pi
            return k-2*pi
        return k
    dot:(other)->
        @x*other.x+@y*other.y
    cross:(other)->
        @dot other.normal().scale(-1)#new Vector other.y,-other.x
    scaleCross:(s)->
        return @normal().scale(-s)#new Vector(s*@y,-s*@x)
    unit:()->
        if not (@x or @y)
            k = new Vector()
            k.length = 0
            return k
        k = new Vector(@x/@length,@y/@length)
        k.length = 1
        return k
    projection:(other)->
        temp2 = other.unit()
        temp = @dot temp2
        temp2 = temp2.scale temp
        temp2
    line:->
        new Line new Vector(),@copy()
    normal:->
        k = new Vector -@y,@x
        k.length = @length
        k.a +=pi/2
        return k
    farther:(a,otherPoint)->
        if otherPoint[a] > @[a]
            return true
        return false
    farthest:(a,otherPoint)->
        if @farther a,otherPoint
            return otherPoint
        return @
    nearest:(a,otherPoint)->
        if not @farther a,otherPoint
            return otherPoint
        return @
    rotate:(axis,angle)->
        if axis.constructor.name isnt "Vector" then throw axis
        if typeof angle isnt "number" then throw angle
        #if angle is pi/2 then return @normal().add axis
        cosA = cos angle
        sinA = sin angle
        cx = ((@x - axis.x) * cosA) - ((@y - axis.y) * sinA) + axis.x
        cy = ((@x - axis.x) * sinA) + ((@y - axis.y) * cosA) + axis.y
        k = new Vector cx,cy
        k.length = @length
        k.a = @a + angle
        return k
    draw2:(bool,bool2,bool3)->
        temp2 = if bool? then {x:0,y:0} else new ctr()
        temp =
            type: "arc"
            fillStyle: "black"
            radius: 3
            x: temp3 = @x+temp2.x
            y: temp4 = @y+temp2.y
        jcan.draw temp
        if not bool2? then return
        temp =
            type: "line"
            strokeWidth: bool2 or 0.5
            strokeStyle: if bool3? then bool3 else "black"
            x1: temp2.x
            y1: temp2.y
            x2: temp3
            y2: temp4
        jcan.draw temp

    draw:(bool,bool2,bool3)->

        start = if bool? then {x:0,y:0} else new ctr()
        end = {@x,@y}
        end.x+=start.x
        end.y+=start.y
        ctxx.beginPath()
        ctxx.fillStyle = "black"
        ctxx.arc(end.x, end.y, 3, 0, 2*pi)
        ctxx.fill()
        return if not bool2?
        ctxx.beginPath()
        ctxx.strokeStyle= if bool3? then bool3 else "black"
        ctxx.lineWidth= bool2 or 0.5
        ctxx.moveTo(start.x,start.y)
        ctxx.lineTo(end.x, end.y)
        ctxx.stroke()

    # extension function to deal with polygons...
    centroid:(points)->
        area = @sArea(points)
        return @centroidStraight(points) unless area
        len = points.length
        # the copy below is very important!!!
        return points[0].copy() if len is 1
        return new Vector((points[0].x+points[1].x)/2
        ,(points[0].y+points[1].y)/2) if len is 2
        end = points[len-1]
        result = new Vector()
        for i in points
            temp = end.cross i
            result.move end.add(i).scale temp
            end = i
        temp = 1/((6*@sArea(points)) or 1)
        return result.scale temp

    centroidStraight:(points)->
        len = points.length
        result = new Vector()
        for i in points
            result.x += i.x
            result.y += i.y
        result.x /= len
        result.y /= len
        return result

    # extension function to deal with polygons...
    sArea:(points)->
        ret = 0
        end = points[points.length-1]
        for i in points
            ret += end.cross i
            end = i
        return ret/2

    invMOI:(invMass,points)->
        len = points.length
        return 0 if len is 1
        if len is 2
            vec = points[1].subtract points[0]
            return vec.dot(vec)/12
        ret = 0
        total = 0
        #end = points[len-1]
        end = points[0]
        for i,i1 in points
            continue if i1 is 0
            tmp = abs i.cross end
            ret += tmp * (i.dot(i) + i.dot(end) + end.dot(end))
            total += tmp
            end = i
        #return ret/(6*total)
        return (6*total*invMass)/ret if ret
        return 0

#################### Line ####################

class Line
    constructor:(@p1,@p2)->
    copy:(temp,temp2) ->
        new Line @p1.copy(),@p2.copy()
    move:(other)->
        @p1.move other
        @p2.move other
    getLength:->
        k = @vector()
        @length = k.getLength()
    add:(other)->
        new Line @p1.add(other),@p2.add(other)
    middle:->
        new Vector (@p1.x+@p2.x)/2,(@p1.y+@p2.y)/2
    normal:->
        k = @vector()
        k = k.normal()
        mid = @middle()
        k = k.line().add mid
        k.length = @length
        return k
    vector:()->
        k = @p2.subtract @p1
        k.length = @length
        k
    dot:(other)->
        vector1 = @vector()
        vector2 = other.vector()
        return vector1.dot vector2
    rotate:(axis,angle)->
        @p1 = @p1.rotate axis,angle
        @p2 = @p2.rotate axis,angle
    closest:(point)->
        k = new Line point,@p1
        normal = @normal().vector()
        normal.getLength()
        b = k.vector().projection normal
        return b.add point
    intersects:(other)->
        initial = @vector()
        otherInitial = other.vector()
        k = otherInitial.cross initial
        #return false unless if k isnt 0
        deltaInitial = @p1.subtract other.p1
        c = deltaInitial.cross(initial)/k
        d = deltaInitial.cross(otherInitial)/k
        if 0 < (c) <= 1 and 0 < (d) <= 1
            return @p1.subtract initial.scale(-d)
        return no
    draw2:(width,style)->
        temp =
            type: "line"
            strokeWidth: if width? then width else 3
            strokeStyle: style or "black"
            x1: @p1.x
            y1: @p1.y
            x2: @p2.x
            y2: @p2.y
        jcan.draw temp

    draw:(width,style)->
        ctxx.beginPath()
        ctxx.strokeStyle= style or "black"
        ctxx.lineWidth= if width? then width else 3
        ctxx.moveTo(@p1.x,@p1.y)
        ctxx.lineTo(@p2.x,@p2.y)
        ctxx.stroke()



#################### Body ####################

class Body
    ###   FORMAT: for body
        shapes: [a,b,c,d,...] - the shapes included in the body
                setLoc: true - setting the location of the shape using an input
                setVel: true - setting the velocity using input
                invM:1/1.5, - setting the mass by setting its inverse,
                              the mass of this object is 1.5 units
                invI:1/1.5, - setting the moment of inertia by setting
                            its inverse, it will be the same as mass
                            if one isnt chosen
                orient:0, - the initial orientation of the shape
                sf: 0.8, - the coefficient of static friction of the object
                df: 0.5, - the coefficient of dynamic friction of the object
                restitution: 0 - the coefficient of restitution of the object
                v:new Vector(-1,-0.5) - the intitial velocity, if not set
                x:400, - setting the location, if it isnt set, it will be
                y:200, - set automatically from the centers of its shapes
    ####
    constructor:(input)->
        @physical = {domains:[]}
        # components are the essential pieces that make up the body
        @components = [@physical]
        return unless input
        # create shapes...
        @shapes = input.shapes or []
        for i,i1 in @shapes
            throw "if you want more shapes, add them using the addShape function!" if i1 >= 1
            @shapes[i1] = new Shape i
            @shapes[i1].body = @

        @setPhysical(input)
        # setting the default integration mechanism
        @integrator = @DEFAULT_Integrator

    # this function sets all the physical aspects of the body
    setPhysical:(input)->
        # domains is used for the get & set functions,
        # it is used mainly to get properties of the shape or body
        @physical.domains = @physical.domains.concat [
                             "v"
                             "rv"
                             "force"
                             "torque"
                             "sf"
                             "df"
                             "invM"
                             "invI"
                             "position"
                             "bounding"
                             "restitution"
                             ]
        # initialize physical properties...
        @physical.force = new Vector()
        @physical.torque = 0
        @physical.rv = 0
        return unless input
        @physical.v = if input.v then input.v.copy() else new Vector()
        @physical.sf = input.sf or 0
        @physical.df = input.df or 0
        @physical.restitution = input.restitution or 0
        @physical.invM = input.invM or 0
        @physical.invI = input.invI or @physical.invM / 100
        @physical.position = if (input.x? and input.y?)
        then new Vector(input.x,input.y) else new Vector()
        @determineCenter()
        @physical.bounding = [new Vector(),new Vector()]
        @generateBounds()
        @determineinvMOI()

    addShape:(shape)->
        shape.body = @
        @shapes.push shape
        @determineCenter()
        @generateBounds()
        return unless @physical.invM
        pieceMass = (1/@physical.invM)/ (@shapes.length-1)
        vec = @physical.position.subtract(shape.physical.position)
        Iadd = vec.dot(vec)
        Itot = 1/(shape.determineinvMOI()) + Iadd
        Itot *= pieceMass
        @physical.invI = 1/((1/@physical.invI) + Itot)
        @physical.invM = 1/(pieceMass*(@shapes.length))

    determineCenter:()->
        positions = []
        totArea = 0
        initCent = new Vector()
        for i in @shapes
            i.calcArea() if not i.physical.area
            area = i.physical.area
            totArea +=area
            initCent.move i.physical.position.scale(area)
            #positions.push i.physical.position
        @physical.position = initCent.scale(1/totArea) if totArea
        #@physical.position = @physical.position.centroid(positions)

    determineinvMOI:()->
        totI = 0
        for i in @shapes
            totI += 1/i.determineinvMOI()
        return @physical.invI = @physical.invM * 1/totI

    # this function is used to retireve properties of the body
    get:(item)->
        for component in @components
            for domain in component.domains
                if item is domain
                    return component[item]
    # this function is used to set properties of the body
    set:(item,val)->
        for component in @components
            for domain in component.domains
                if item is domain
                    component[item] = val
                    return true
        return false
    # this function is used to retrieve shapes from the body
    getShape:(index)->
        if index >= @shapes.length or index < 0
            return null
        return @shapes[index]
    # this function is used to set shapes in the body
    setShape:(index,shape)->
        if index >= @shapes.length or index < 0
            return null
        return @shapes[index] = shape

    inside:(point)->
        for i in @shapes
            return true if i.inside point
        return false

    generateBounds:()->
        maxX = -Infinity
        maxY = -Infinity
        minX = Infinity
        minY = Infinity
        for i in @shapes
            i.generateBounds()
            maxX = temp if (temp = i.physical.bounding[0].x) > maxX
            maxY = temp if (temp = i.physical.bounding[0].y) > maxY
            minX = temp if (temp = i.physical.bounding[1].x) < minX
            minY = temp if (temp = i.physical.bounding[1].y) < minY
        @physical.bounding[0].x = maxX
        @physical.bounding[0].y = maxY
        @physical.bounding[1].x = minX
        @physical.bounding[1].y = minY

    draw:(ctx)->
        for shape in @shapes
            shape.draw ctx
            #shape.physical.position.draw 0,0

        #@physical.position.draw 0,0
    integrate:(ts)->
        return @integrator(ts)

    DEFAULT_Integrator:(ts)->

        @physical.rv += @physical.torque
        @physical.v.move @physical.force

        @physical.position.move @physical.v.scale(ts)
        for n,n1 in @shapes
            n.physical.position.move @physical.v.scale(ts)
            #i.move @physical.v.scale(ts) for i in n.physical.bounding
            i.move @physical.v.scale(ts) for i in n.physical.verticies
            i.move @physical.v.scale(ts) for i in n.physical.points

            n.physical.position.equal n.physical.position.rotate @physical.position,@physical.rv*ts
            i.equal i.rotate @physical.position,@physical.rv*ts for i in n.physical.verticies
            i.equal i.rotate @physical.position,@physical.rv*ts for i in n.physical.points
            i.equal i.rotate new Vector(),@physical.rv*ts for i in n.physical.norms

        @generateBounds()
        @physical.force.x = 0
        @physical.force.y = 0
        @physical.torque = 0

    support:(direction)->
        max = -Infinity
        maxVec = null
        index = null
        for i in @shapes
            support = i.support(direction)
            tempMax = direction.dot support.subtract(@physical.position)
            if tempMax > max
                max = tempMax
                maxVec = support
        return maxVec

    move:(obj)->
        if obj?
            @physical.position.move obj
        for i in @shapes
            i.move obj

    applyForce:(force,contact)->
        @physical.force.move force.scale @physical.invM
        #console.log contact
        #contact.draw 0,0
        return unless contact
        contact_ = contact.subtract @physical.position
        conCrossF = contact_.cross force.scale @physical.invI
        @physical.torque += conCrossF
        conCrossF
        #console.log @physical.force
        #@physical.force.scale(100).draw null,0

class Shape
    constructor:(input)->
        @type = "Shape"
        @physical = {domains:[]}
        @appearance = {domains:[]}
        @components = [@physical,@appearance]
        @setPhysical(input)
        @setAppearance(input)
        ###     FORMAT: for Shape
                x:400, - setting the location
                y:200, - setting the location
                points: [
                            [3,2]  - these are setting the verticies
                            [3,1]    of the shape. However, not all
                            [4,1]    shapes have verticies, special
                            [2,4]    cases do exist like circles
                        ]
                fill: "blue" - the color of the object, if one isnt
                             assigned, a random color will be chosen
                stroke: [1,"grey"] - the trim of the shape, if one isnt
                             assigned, there wont be any
        ####

    setPhysical:(input)->
        @physical.domains = @physical.domains.concat [
                             "edges"
                             "norms"
                             "verticies"
                             "points"
                             "position"
                             "bounding"
                             "area"
                             ]
        return unless input
        @physical.position = if (input.x? and input.y?)
        then new Vector(input.x,input.y) else new Vector()
        @physical.points = []
        @setVerticies(input.points) if input.points?
        @determineCenter()
        @setEdges() if @physical.verticies?
        @physical.bounding = [new Vector(),new Vector()]
        @generateBounds() if @physical.verticies?
        @calcArea()
    setVerticies:(points)->
        throw "no physical" unless @physical
        @physical.verticies = []
        for point in points
            @physical.verticies.push new Vector(point[0],point[1])
    setEdges:()->
        throw "no physical" unless @physical
        @physical.edges = []
        @physical.norms = []
        for i,i1 in @physical.verticies
            n1 = if (i1+1) < @physical.verticies.length then (i1+1) else 0
            n = @physical.verticies[n1]
            @physical.edges.push new Line(i,n)
            edge = @physical.edges[i1]
            i.edge1 = i.edge1 or edge
            n.edge2 = n.edge2 or edge
            edge.getLength()
            @physical.norms.push edge.normal().vector().unit()

    setAppearance:(input)->
        @appearance.domains = @appearance.domains.concat [
                             "fill"
                             "strokeWidth"
                             "strokeStyle"
                             ]
        return unless input
        @appearance.fill = if input.fill?
        then input.fill else generateRandomColor()
        @appearance.strokeWidth = if input.stroke?
        then input.stroke[0] else null
        @appearance.strokeStyle = if input.stroke?
        then input.stroke[1] else null

    # this function is used to retrieve properties from the shape
    get:(item)->
        for component in @components
            for domain in component.domains
                if item is domain
                    return component[item]

    # this function is used to set properties of the shape
    set:(item,val)->
        for component in @components
            for domain in component.domains
                if item is domain
                    component[item] = val
                    return true
        return false

    generateBounds:()->
        throw "no verticies" unless @physical.verticies
        maxX = -Infinity
        maxY = -Infinity
        minX = Infinity
        minY = Infinity
        for i in @physical.verticies
            maxX = temp if (temp = i.x) > maxX
            maxY = temp if (temp = i.y) > maxY
            minX = temp if (temp = i.x) < minX
            minY = temp if (temp = i.y) < minY

        @physical.bounding[0].x = maxX + 10
        @physical.bounding[0].y = maxY + 10
        @physical.bounding[1].x = minX - 10
        @physical.bounding[1].y = minY - 10


    determineCenter:()->
        @physical.position = @physical.position.centroid(@physical.verticies)

    determineinvMOI:()->
        points = @physical.verticies.concat([])
        for i,i1 in points
            points[i1] = i.subtract @physical.position
        return @physical.position.invMOI 1,points

    calcArea:()->
        return @physical.area = abs @physical.position.sArea(@physical.verticies)

    inside:(point)->
        for i,i1 in @physical.norms
            edge = @physical.edges[i1]
            vec = point.subtract edge.p1
            return false if vec.dot(i) > 0
        return true

    support:(direction)->
        max = -Infinity
        maxVec = null
        index = null
        for i in @physical.verticies
            tempMax = i.subtract(@physical.position)
            tempMax = direction.dot(tempMax)
            if tempMax > max
                max = tempMax
                maxVec = i
        return maxVec

    move:(obj)->
        if obj?
            @physical.position.move obj
            i.move obj for i in @physical.bounding
            i.move obj for i in @physical.verticies
            i.move obj for i in @physical.points

    # this function is used to set properties of the body
    draw:(ctx)->
        ctx.beginPath()
        ctx.fillStyle = @appearance.fill
        ctx.strokeStyle= @appearance.strokeStyle
        ctx.lineWidth= @appearance.strokeWidth
        ctx.moveTo(@physical.verticies[0].x,@physical.verticies[0].y)
        for i,i1 in @physical.verticies
            continue if not i1
            ctx.lineTo(i.x, i.y)
        #ctx.moveTo(@physical.verticies[0].x,@physical.verticies[0].y)
        ctx.fill()
        ctx.stroke() if @appearance.strokeWidth
        #@physical.position.draw 0,0

class Rectangle extends Body
    ###   FORMAT: for Rectangle
                width: 323 - setting the width of the rectangle
                height: 123 - setting the height of the rectangle
                invM:1/1.5, - setting the mass by setting its inverse,
                              the mass of this object is 1.5 units
                the moment of inertia is calculated automatically
                fill: "blue" - the color of the object, if one isnt
                             assigned, a random color will be chosen
                stroke: [1,"grey"] - the trim of the shape, if one isnt
                             assigned, there wont be any

                setLoc: true - setting the location of the shape using an input
                setVel: true - setting the velocity using input
                orient:0, - the initial orientation of the shape
                sf: 0.8, - the coefficient of static friction of the object
                df: 0.5, - the coefficient of dynamic friction of the object
                restitution: 0 - the coefficient of restitution of the object
                v:new Vector(-1,-0.5) - the intitial velocity, if not set
                x:400, - setting the location, if it isnt set, it will be
                y:200, - set automatically from the centers of its shapes
    ####
    constructor:(input)->
        temp = Object.create input
        throw "no position coords" unless temp.x? and temp.y?
        throw "no width and height" unless temp.width and temp.height
        throw "no mass" unless temp.invM?
        temp.invI = (12*temp.invM)/(sqr(temp.height) + sqr(temp.width))
        temp.shapes = []
        first = temp.shapes[0] = {
                                  fill: temp.fill
                                  stroke: temp.stroke
                                  x: temp.x
                                  y: temp.y
                                  }
        pos = new Vector temp.x,temp.y
        dimX = temp.width/2
        dimY = temp.height/2
        points = [
                  [pos.x + dimX,pos.y + dimY]
                  [pos.x + dimX,pos.y - dimY]
                  [pos.x - dimX,pos.y - dimY]
                  [pos.x - dimX,pos.y + dimY]
                  ]
        first.points = points
        super(temp)
        @physical.invI = @physical.invM * @shapes[0].determineinvMOI()
        for i in @shapes
            i.shapeType = "Rectangle"
        @type = "Rectangle"

#################### Circle ####################

class Circle extends Body
    ###   FORMAT: for Circle
                radus: 323 - setting the radius of the circle
                invM:1/1.5, - setting the mass by setting its inverse,
                              the mass of this object is 1.5 units
                the moment of inertia is calculated automatically
                fill: "blue" - the color of the object, if one isnt
                             assigned, a random color will be chosen
                stroke: [1,"grey"] - the trim of the shape, if one isnt
                             assigned, there wont be any

                setLoc: true - setting the location of the shape using an input
                setVel: true - setting the velocity using input
                orient:0, - the initial orientation of the shape
                sf: 0.8, - the coefficient of static friction of the object
                df: 0.5, - the coefficient of dynamic friction of the object
                restitution: 0 - the coefficient of restitution of the object
                v:new Vector(-1,-0.5) - the intitial velocity, if not set
                x:400, - setting the location, if it isnt set, it will be
                y:200, - set automatically from the centers of its shapes
    ####
    constructor:(input)->
        temp = Object.create input
        throw "no position coords" unless temp.x? and temp.y?
        throw "no radius" unless temp.radius
        throw "no mass" unless temp.invM?
        temp.invI = (2*temp.invM)/(sqr(temp.radius))
        temp.shapes = []
        first = temp.shapes[0] = {
                                  fill: temp.fill
                                  stroke: temp.stroke
                                  x: temp.x
                                  y: temp.y
                                  radius: temp.radius
                                  }
        points = [
                  [first.x,first.y+temp.radius]
                  ]
        first.points = points
        super(temp)
        for i in @shapes
            i.shapeType = "Circle"
        @shapes[0].physical.norms = []
        @type = "Circle"
        @shapes[0].physical.position = new Vector(first.x,first.y)
        @physical.position = new Vector(first.x,first.y)
        @shapes[0].edges = []
        @shapes[0].physical.domains.push "radius"
        @shapes[0].physical.radius = temp.radius
        ctre = @physical.position

        @shapes[0].determineinvMOI = ()->
            return 2/(sqr(temp.radius))

        @shapes[0].draw = (ctx)->
            ctx.beginPath()
            ctx.fillStyle = @appearance.fill
            ctx.strokeStyle= @appearance.strokeStyle
            ctx.lineWidth= @appearance.strokeWidth
            ctx.arc(@physical.position.x, @physical.position.y, @physical.radius, 0, 2*pi)
            ctx.fill()
            ctx.stroke() if @appearance.strokeWidth
            new Line(@physical.position,@physical.verticies[0]).draw 1,"grey"

        @shapes[0].generateBounds=()->
            @physical.bounding[0].x = @physical.position.x + @physical.radius + 10
            @physical.bounding[0].y = @physical.position.y + @physical.radius + 10
            @physical.bounding[1].x = @physical.position.x - @physical.radius - 10
            @physical.bounding[1].y = @physical.position.y - @physical.radius - 10

        @shapes[0].support=(direction)->
            direction.getLength() if not direction.length
            return direction.unit().scale(@physical.radius).add @physical.position

        @shapes[0].inside=(point)->
            return (point.subtract(@physical.position).getLength()) < @physical.radius

        @shapes[0].calcArea=()-> return @physical.area = pi * sqr @physical.radius

        @shapes[0].determineCenter=()->
            return @physical.position

        @determineinvMOI()
        @determineCenter()
        @generateBounds()
########################## Demo ##########################

class Demo
    constructor:(@engine,@selector,@context,@window)->
        throw "Error: no engine" if not @engine
        throw "Error: no canvas" if not @selector
        throw "Error: no context" if not @context
        throw "Error: no window" if not @window
        throw "Error: no jquery" if not $
        @listeners = {}
        @buttons = {}
        @behaviours = {}
    init:()->
        @setBehaviours()
        @setPresets()
        @setListeners()
        @setButtonViews()
        @setButtons()
    setBehaviours:()->
        for i in ["Drag","Gravity","PlayPause","Refresh"
                  ,"String","AddShape","Presets"]
            throw "Error: missing "+i if not eval i
        #### CANVAS CONTROL ####
        cnc = new CanvasControl(@selector,@context,@window,"Jquery")
        cnc.activate(@engine)
        #### CANVAS CONTROL ####
        #### MOUSE ####
        mouse = new Mouse($("#canvasArea"),"Jquery",$(".navigation"))
        mouse.activate(@engine)
        #### MOUSE ####
        #### DRAG ####
        @behaviours.drag = new Drag()
        @behaviours.drag.set()
        @behaviours.drag.activate(@engine)
        #### DRAG ####
        #### PLAYPAUSE ####
        @behaviours.playPause = new PlayPause()
        @behaviours.playPause.set(true)
        @behaviours.playPause.activate(@engine)
        #### PLAYPAUSE ####
        #### GRAVITY ####
        @behaviours.gravity = new Gravity()
        @behaviours.gravity.set(0.008,new Vector(0,-1))
        @behaviours.gravity.activate(@engine)
        #### GRAVITY ####
        #### REFRESH ####
        @behaviours.refresh = new Refresh()
        @behaviours.refresh.set(true)
        @behaviours.refresh.activate(@engine)
        #### REFRESH ####
        #### STRING ####
        @behaviours.string = new String()
        @behaviours.string.set({all:true,massOnly:true,maxLength:100})
        @behaviours.string.activate(@engine)
        #### STRING ####
    setPresets:()->
        rect1_ =
                type:"Rectangle"
                setLoc: true
                setVel: true
                x:400,
                y:200,
                width:200,
                height:30,
                invM:1/1.5,
                orient:0,
                sf: 0.8,
                df: 0.5,
                restitution: 0
                ,v:new Vector(-1,-0.5)

        rect2_ =
                type:"Rectangle"
                x:300,
                y:200,
                setLoc: true
                width:50,
                height:50,
                invM:1/1,
                orient: -0.01,
                sf: 0.6,
                df: 0.4,
                restitution: 0
                v:new Vector(0,0.2)

        rect3_ =
                type:"Rectangle"
                x:300,
                y:200,
                setLoc: true
                width:40,
                height:50,
                invM:1/1,
                orient: -0.01,
                sf: 0.6,
                df: 0.4,
                restitution: 0
                v:new Vector(0,0.2)

        circ1_ =
                type:"Circle"
                radius:getRandomInt(30,35),
                setLoc: true
                x:400,
                y:200,
                #v:new Vector(-1,-0.5),
                restitution: 0,
                sf: 0.6,
                df: 0.4,
                invM:1/1

        circ2_ =
            type:"Circle"
            radius:getRandomInt(5,50),
            setLoc: true
            x:400,
            y:200,
            restitution: 0,
            sf: 0.6,
            df: 0.4,
            invM:1/2,


        pr1 = [circ1_,rect1_,"random"]
        pr2 = [rect1_,circ2_,"target"]
        pr3 = [rect1_,rect2_,"container"]
        #pr4 = [circ1_,rect2_,"random"]
        pr4 = [rect2_,rect2_,"compound"]
        #pr4 = [rect2_,rect3_,"random"]
        #pr4 = [circ2_,circ2_,"random"]
        pr5 = [circ1_,circ2_,"container"]
        pr6 = [rect2_,rect1_,"target"]

        @behaviours.presets = new Presets()
        @behaviours.presets.add pr6,AddShape
        @behaviours.presets.add pr4,AddShape
        @behaviours.presets.add pr3,AddShape
        @behaviours.presets.add pr2,AddShape
        @behaviours.presets.activate(@engine)

        #### adding a platform at the begining of every simulation (warning: prevents container
        #### setup from initializing).

        addingShape = new AddShape()

        barrier =
            type:"Rectangle"
            x:47,
            y:100,
            width:900,
            height:50,
            invM:0,
            orient: 0.0,
            sf: 0.8,
            df: 0.7
            restitution: 0

        ####          REMOVE THE HASHTAGS BESIDE (AND BELOW IT)!!!
        setup = ()=>
            @engine.implement addingShape.createShape barrier
        @engine.on("refresh",setup,@)
        setup()
        ####
    setListeners:()->
        #### PLAYPAUSE ####
        @listeners.play = (event)->
            engine = event.data.engine
            button = event.data.button
            engine.emit("play",{cursor:new Vector(engine.pageX,engine.pageY),engine:engine})
        @listeners.pause = (event)->
            engine = event.data.engine
            button = event.data.button
            engine.emit("pause",{cursor:new Vector(engine.pageX,engine.pageY),engine:engine})
        ###
        @engine.on "play",()->
            if not @buttons.play.isChecked()
                @buttons.play.alter true
        ,@
        @engine.on "pause",()->
            if not @buttons.pause.isChecked()
                @buttons.pause.alter true
        ,@
        ###
        #### PLAYPAUSE ####
        #### GRAVITY ####
        @listeners.gravitate = (event)->
            engine = event.data.engine
            button = event.data.button
            engine.emit("gravitate",{cursor:new Vector(engine.pageX,engine.pageY),engine:engine})

        @listeners.degravitate = (event)->
            engine = event.data.engine
            button = event.data.button
            engine.emit("degravitate",{cursor:new Vector(engine.pageX,engine.pageY),engine:engine})

        ###
        @engine.on "refresh",()->
            if @buttons.gravity.isChecked()
                @buttons.gravity.alter false
            if @buttons.string.isChecked()
                @buttons.string.alter false
        ,@
        ###
        #### GRAVITY ####
        #### REFRESH ####
        @listeners.refresh = (event)->
            engine = event.data.engine
            engine.emit("refresh",{cursor:new Vector(engine.pageX,engine.pageY),engine:engine})
        #### REFRESH ####
        #### STRING ####
        @listeners.stringify =(event)->
            engine = event.data.engine
            button = event.data.button
            engine.emit("stringify",{cursor:new Vector(engine.pageX,engine.pageY),engine:engine})

        @listeners.destringify =(event)->
            engine = event.data.engine
            button = event.data.button
            engine.emit("destringify",{cursor:new Vector(engine.pageX,engine.pageY),engine:engine})

        #### STRING ####
        #### PRESETS ####
        @listeners.presets = (event)->
            engine = event.data.engine
            button = event.data.button
            behaviour = event.data.behaviour
            engine.emit "refresh",{cursor:new Vector(engine.pageX,engine.pageY),engine:engine}
            index = button.index
            behaviour.choose(index)
        #### PRESETS ####

    setButtonViews:()->
        ################### APPLYING & REMOVING #########################
        applyingClass = (selector,classToApply,e)->
            selector.addClass classToApply

        removingClass = (selector,classToApply,e)->
            selector.removeClass classToApply

        #### REFRESH ####
        @buttons.refresh = new Action("refresh","#refresh")
        @engine.on "refresh",()->
            for i in [@buttons.gravity,@buttons.string,@buttons.play]
                if i.activated
                    removingClass.bind(null,i.selector[1],"applied")()
                    i.activated = false
        ,@
        #### REFRESH ####

        #### PLAYPAUSE ####
        @buttons.play = new Toggle("playPause","#play")
        @buttons.play.setListener "click",null,applyingClass.bind(null,@buttons.play.selector[0],"applied")
            ,removingClass.bind(null,@buttons.play.selector[1],"applied")
        #### PLAYPAUSE ####

        #### GRAVITY ####
        @buttons.gravity = new Toggle("gravity","#gravity")
        @buttons.gravity.setListener "click",null,applyingClass.bind(null,@buttons.gravity.selector[0],"applied")
            ,removingClass.bind(null,@buttons.gravity.selector[1],"applied")
        #### GRAVITY ####
        #### STRING ####
        @buttons.string = new Toggle("string","#string")
        @buttons.string.setListener "click",null,applyingClass.bind(null,@buttons.string.selector[0],"applied")
            ,removingClass.bind(null,@buttons.string.selector[1],"applied")
        #### STRING ####

        #### PRESETS ####
        @buttons.presets = new Radio("presets",".presets")
        for i in @buttons.presets.options
            null
            i.setListener "click",null,applyingClass.bind(null,i.selector[0],"applied")
            i.setListener "internal",null,null,removingClass.bind(null,i.selector[1],"applied")
        #### PRESETS ####

        #### OPTIONS ####
        @buttons.hideOptions = new Toggle("hideOptions","#options1")
        hideStuff = (selectors,classToApply,fn,typeOfHidden,e)->
            for i,index in selectors
                selector = selectors.eq(index)
                fn(selector,typeOfHidden)
        @buttons.hideOptions.setListener "click",null,hideStuff.bind(null,$(".options1"),"applied",applyingClass,"sideHidden")
            ,hideStuff.bind(null,$(".options1"),"applied",removingClass,"sideHidden")
        @buttons.hideOptions.setListener "click",null,removingClass.bind(null,@buttons.hideOptions.selector[0],"optioned")
            ,applyingClass.bind(null,@buttons.hideOptions.selector[1],"optioned")
        #### OPTIONS ####

        #### PRESETSVIEW1 ####
        ###
        @buttons.presetView1 = new Toggle("presetView1","#presetHead")
        hideStuff2 = (selectors,classToApply,fn,typeOfHidden,e)->
            for i,index in selectors
                selector = selectors.eq(index)
                fn selector,typeOfHidden
        @buttons.presetView1.setListener "click",null,hideStuff2.bind(null,$(".presets"),"applied",applyingClass,"topHidden")
            ,hideStuff2.bind(null,$(".presets"),"applied",removingClass,"topHidden")
        ###
        #### PRESETSVIEW1 ####

        #### PRESETSVIEW2 ####

        @buttons.presetView2 = new Button("presetView2",".dropdown")
        hideStuff3 = (selectors,classToApply,fn,typeOfHidden,e)->
            for i,index in selectors
                selector = selectors.eq(index)
                fn selector,typeOfHidden
        @buttons.presetView2.setListener "mouseenter",null,hideStuff3.bind(null,$(".presets"),"applied",removingClass,"topHidden")
        @buttons.presetView2.assignDeactivation "mouseleave",null,hideStuff3.bind(null,$(".presets"),"applied",applyingClass,"topHidden")
        #### PRESETSVIEW2 ####

    setButtons:()->
        #### PLAYPAUSE ####
        @buttons.play.setListener "click"
            ,{engine:@engine,button:@buttons.play}
            ,@listeners.play
            ,@listeners.pause
        #### PLAYPAUSE ####
        #### GRAVITY ####
        @buttons.gravity.setListener "click"
            ,{engine:@engine,button:@buttons.gravity}
            ,@listeners.gravitate
            ,@listeners.degravitate
        #### GRAVITY ####
        #### REFRESH ####
        @buttons.refresh.setListener "click"
            ,{engine:@engine,button:@buttons.refresh}
            ,@listeners.refresh
        #### REFRESH ####
        #### STRING ####
        @buttons.string.setListener "click"
            ,{engine:@engine,button:@buttons.string}
            ,@listeners.stringify
            ,@listeners.destringify
        #### STRING ####
        #### PRESETS ####
        for i in @buttons.presets.options
            i.setListener "click"
                ,{engine:@engine
                  ,button:i
                  ,behaviour:@behaviours.presets
                  }
                ,@listeners.presets
        #### PRESETS ####

########################## Demo ##########################
#################### END OF CLASSES ####################

#################### START ####################

# Note: it is implied that the code below will run as soon as the page loads
window.world = new Engine()

demo = new Demo(world,jcan,ctxx,win)
demo.init()

new CollisionControl().activate(world)
new AABB().activate(world)
#new GJK().activate(world)
new SATColl().activate(world)
new impulseResolution().activate(world)


test3 = new Rectangle {
    invM:1/1.5
    orient:0
    sf: 0.8
    df: 0.5
    restitution: 0
    v:new Vector(-0.1,-0.1)
    x:300
    y:200
    width:54
    height: 175
}

test2 = new Rectangle {
    invM:1/1.5
    orient:0
    sf: 0.8
    df: 0.5
    restitution: 0
    v:new Vector(-0.1,-0.1)
    x:200
    y:200
    width:50
    height: 89
}
test4 = new Rectangle {
    invM:1/1.5
    orient:0
    sf: 0.8
    df: 0.5
    restitution: 0
    v:new Vector(-0.1,-0.1)
    x:300
    y:200
    width:50
    height: 89
}
test1 = new Circle {
    invM:1/1.5
    orient:0
    sf: 0.8
    df: 0.5
    restitution: 0
    v:new Vector(-0.1,-0.1)
    x:600
    y:200
    radius:40
}

shape2 = test2.shapes[0]
shape3 = test3.shapes[0]
shape1 = test1.shapes[0]
test4.addShape shape1
#test4.addShape shape3
test4.addShape shape2

#world.implement test4
#world.implement test2
#world.implement test3
