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

jcan = $("canvas")
win = $(window)
jcan.attr "width", (win.width() - 24)
jcan.attr "height", (win.height() - 20)
shapes = []
sin = (val) ->Math.sin val
cos = (val) ->Math.cos val
abs = (val) ->Math.abs val
pow = (val,exp) ->Math.pow val , exp
sqrt = (val) ->Math.sqrt val
sqr = (val)-> pow(val,2)
atan = (val) ->Math.atan val
tan = (val) ->Math.tan val
getMin = (val) ->Math.min val
getMax = (val) ->Math.max val
atan2 = (valy,valx) ->Math.atan2 valy,valx
floor = (num)->Math.floor num
round = (num) ->Math.round num
pi = Math.PI

requestAnimationFrame = window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimationFrame || window.msRequestAnimationFrame
cancelAnimationFrame = window.cancelAnimationFrame || window.webkitCancelRequestAnimationFrame || window.webkitCancelAnimationFrame || window.mozCancelRequestAnimationFrame || window.mozCancelAnimationFrame || window.oCancelRequestAnimationFrame || window.oCancelAnimationFrame || window.msCancelRequestAnimationFrame || window.msCancelAnimationFrame

pause = $(".pause")
reset = $(".reset")
stop = $(".stop")
info = $("#info")
info2 = $("#info2")
info3 = $("#info3")
info4 = $("#info4")
requestingFrame = true
ultimateCount = 0

ctr = ->
    @x = jcan.width() / 2
    @y = jcan.height() / 2

getRandomInt = (min, max) ->Math.floor(Math.random() * (max - min + 1)) + min
    
    
customChangePrototype = (obj) ->
    for prop of obj
      this[prop] = obj[prop]  if obj.hasOwnProperty(prop)
    return

solve_Quadratic = (a,b,c)->
    if k = pow(b,2) - 4 * a * c < 0 then return false
    x1=(-b + Math.sqrt(pow(b,2) - 4 * a * c))/(2 * a)
    x2=(-b - Math.sqrt(pow(b,2) - 4 * a * c))/(2 * a)
    return [x1,x2]
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


#################### CLASSES ####################
#################### Physics ####################

###
Physics class made to resolve collisions

###

class Physics
    ###
    the inside function does a bounding box check as a broad phase collision detection

###
    
    inside:(shape1,shape2)->
        b1 = shape1.shape.bounding
        b2 = shape2.shape.bounding
        if b2[1].x <= b1[0].x <= b2[0].x or b1[1].x <= b2[0].x <= b1[0].x
            if b2[1].y <= b1[0].y <= b2[0].y or b2[1].y <= b1[0].y <= b2[0].y
                return true
        return no
    ###
    the collide function does 2 things:
    1. excecutes the broad phase collsion detection function (called inside)
    2. determines the type of each shape (whether it is a rectangle or circle) and does the appropriate narrow phase collision detection algorithm
###
        
    collide:(shape1,shape2)-> 
        #checks for intersections in the bounding boxes
        return false unless @inside(shape1,shape2) or @inside(shape2,shape1)
        con1 = shape1.constructor.name
        con2 = shape2.constructor.name
        switch
            # checks the type of shape and excecutes the proper function
            when con1 is "Rectangle" and con2 is "Rectangle"
            then @rectanglesCollide shape1,shape2
            when con1 is "Circle" and con2 is "Circle"
            then @circlesCollide shape1,shape2
            when con1 is "Circle"
            then @polyArcCollide shape2,shape1
            when k = @polyArcCollide(shape1,shape2)
                
            then {manifold:k.manifold,vector:k.vector.scale -1}
            else no
        ### return of any narrow phase collsion detection algorithm is an object.
                the object contains:
                1. manifold: an array of points that serve as the points of contanct
                             between two shapes.
                2. vector: acts as the vector to properly displace two objects in order
                            to separate them.

                ###
    ###
        projections is a semi-broad phase 
    ###
    projections:(shape1,shape2)->
        position2 = shape2.shape.position
        position1 = shape1.shape.position
        a1 = shape1.nearest(position2).subtract position1
        a2 = shape2.nearest(position1).subtract position2
        m = new Line(position1,position2).vector()
        m.getLength()
        m = m.unit()
        v = @SAT shape1,shape2,m
        #v.draw(null,0) if v
        return v
    projectionsLite:(shape1,shape2)->
        position2 = shape2.shape.position
        position1 = shape1.shape.position
        a1 = shape1.nearest(position2).subtract position1
        a2 = shape2.nearest(position1).subtract position2
        #new Line(position1,position2).draw()
        m = new Line(position1,position2).vector()
        if (k = (sqr(m.x)+sqr(m.y)- (a1.dot(m)) + a2.dot(m))) < 0
            return k
        return false
    
    rectanglesCollide:(shape1,shape2)->
        return false unless @projectionsLite(shape1,shape2)
        k = (shape1.intersects i for i in shape2.shape.edges)
        v1 = @recFindNorm shape1,shape2,k
        return v1
     
    recFindNorm2:(shape1,shape2,intMatrix)->
        resolutions1 = []
        resolutions2 = []
        contactManifold = []
        collision = {}
        k = intMatrix
        for i,i1 in k
            bool = false
            for n,n1 in i
                if n
                    #shape1.shape.edges[n1].draw(1)
                    bool = true
                    #n.draw 0,0
                    collision.manifold.push n
                    norm = shape1.shape.norms[n1]
                    resolutions1.push @SAT shape1,shape2,norm
            if bool
                #shape2.shape.edges[i1].draw(1)
                norm2 = shape2.shape.norms[i1] 
                resolutions2.push @SAT shape2,shape1,norm2
        totalManifold = new Vector() 
        minimum  = Infinity
        minvec = null
        for i in resolutions1
            if (k1 = i.length) < minimum
                minimum = k1
                minvec = i
        minvec = minvec.scale(-1) if minvec
        #minvec.draw(null,0) if minvec
        for i in resolutions2
            if (k1 = i.length) < minimum
                minimum = k1
                minvec = i
        #minvec.scale(-1).draw(null,0) if minvec
        minvec = minvec.scale(-1) if minvec
        return false unless minvec
        collision.vector = minvec
        return collision
    
    polyArcCollide:(poly,arc)->
        return false unless @projectionsLite poly,arc
        k = (arc.intersects i for i in poly.shape.edges)
        resolutions = []
        intEdge = []
        corners = []
        contactManifold = []
        collision = {}
        collision.manifold = []
        middleEdge = []
        count = 0
        for i,i1 in k
            if i
                count++
                intEdge.push i1
                collision.manifold.push if i.constructor.name is "Line" then i.middle() else i
                norm = poly.shape.norms[i1]
                k3 = @SAT poly,arc,norm
                resolutions.push k3 if k3
        totalManifold = new Vector()
        if count > 1
            for i,i1 in intEdge
                in1 = intEdge[i1]
                in2 = intEdge[i1-1]
                if (k3 = poly.findCorner in1,in2) isnt "none"
                    null
                    corners.push k3
                if (k3 = poly.findEdge in1,in2,arc.shape.position) isnt "none"
                    null
                    middleEdge.push k3
        for i in corners
            null
            corner = poly.shape.verticies[i]
            norm = new Line(arc.shape.position,corner).vector()
            norm.getLength()
            norm = norm.unit()
            v1 = @SAT poly,arc,norm
            resolutions.push v1 if v1
        for i in middleEdge
            null
            edge = poly.shape.edges[i]
            #edge.draw()
            norm = poly.shape.norms[i]
            v1 = @SAT poly,arc,norm
            resolutions.push v1
        minimum = Infinity
        minvec = null
        for i in resolutions
            if (k1 = i.length) < minimum
                minimum = k1
                minvec = i
        minvec = minvec.scale(-1) if minvec
        #minvec.draw(null,0) if minvec
        return false unless minvec
        collision.vector = minvec
        return collision
    findCorners:(shape1,shape1Edges,tempManifold,manifold)->
        if shape1Edges.length is 2 and shape1Edges[0] isnt shape1Edges[1]
            test = shape1.findCorner shape1Edges[0],shape1Edges[1]
            if test isnt "none"
                manifold.push shape1.shape.verticies[test]
                #shape1.shape.verticies[test].draw 0,0
            else
                middleEdge = shape1.findEdge shape1Edges[0],shape1Edges[1],tempManifold[0]
                #tempManifold.draw 0,0
                if middleEdge isnt "none"
                    manifold.push shape1.shape.verticies[test2] if (test2 = shape1.findCorner middleEdge,shape1Edges[0]) isnt "none" 
                    #shape1.shape.verticies[test2].draw 0,0 if (test2 = shape1.findCorner middleEdge,shape1Edges[0]) isnt "none" 
                    manifold.push shape1.shape.verticies[test3] if (test3 = shape1.findCorner middleEdge,shape1Edges[1]) isnt "none";
                    #shape1.shape.verticies[test3].draw 0,0 if (test3 = shape1.findCorner middleEdge,shape1Edges[1]) isnt "none";
        return
    recFindNorm:(shape1,shape2,intMatrix)->
        resolutions1 = []
        resolutions2 = []
        collision = {}
        tempManifold = []
        collision.manifold = []
        axisVec1 = new Line(shape1.shape.position,shape2.shape.position).vector()
        axisVec2 = axisVec1.scale -1
        k = intMatrix
        shape1Edges = []
        shape2Edges = []
        for i,i1 in k
            bool = false
            for n,n1 in i
                if n
                    bool = true
                    tempManifold.push n
                    shape1Edges.push n1
                    norm = shape1.shape.norms[n1]
                    resolutions1.push @SATLite shape1,shape2,norm,axisVec1
            if bool
                shape2Edges.push i1
                norm2 = shape2.shape.norms[i1]
                resolutions2.push @SATLite shape2,shape1,norm2,axisVec2
         
        minimum  = Infinity
        minvec = null
        for i in tempManifold
            null
            #collision.manifold.push i
        @findCorners shape1,shape1Edges,tempManifold,collision.manifold
        @findCorners shape2,shape2Edges,tempManifold,collision.manifold
        
        for i in resolutions1
            if (k1 = i.length) < minimum
                minimum = k1
                minvec = i
        minvec = minvec.scale(-1) if minvec
        for i in resolutions2
            if (k1 = i.length) < minimum 
                minimum = k1
                minvec = i
        minvec = minvec.scale(-1) if minvec
        return false unless tempManifold.length is 2
        return false unless minvec
        collision.vector = minvec
        return collision
    SATLite:(shape1,shape2,inputAxisVector,axisVec)->
        #this assumes inputAxisVector has a length of 1
        axis = inputAxisVector.scale axisVec.dot inputAxisVector
        axisLine = axis.line().add(shape1.shape.position)
        axisLine2 = axis.scale(-1).line().add(shape2.shape.position)
        support1 = shape1.nearest axisLine.p2
        support2 = shape2.nearest axisLine2.p2
        a1 = support1.subtract shape1.shape.position
        a2 = support2.subtract shape2.shape.position
        b1 = inputAxisVector.scale a1.dot inputAxisVector
        b2 = inputAxisVector.scale a2.dot inputAxisVector
        return false unless (length = axis.length - b1.length - b2.length) < 0
        return inputAxisVector.scale(length)
    SAT:(shape1,shape2,inputAxisVector)->
        ####### temp initialization #######
        AxisVector = inputAxisVector
        ####### end of temp initialization #######
        pos1 = shape1.shape.position
        pos2 = shape2.shape.position
        Dist = new Line(pos1,pos2).vector()
        Axis = Dist.projection AxisVector
        Axis.getLength()
        AxisVector = Axis.unit()
        Axis = Axis.line().add(pos1)
        #AxisVector.copy().scale(10).draw(null,0)
        #norm = AxisVector.unit().normal().scale 0
        
        
        ####### display stuff #######
        displayAxis = (Line,Vector,width=3,color="black")->
            norm = AxisVector.unit().normal().scale 0
            display = Line.copy().add norm
            display.draw(width,color)
        ####### end of display stuff #######
        
        
        #displayAxis Axis,AxisVector,0.5,"lightgrey"
        
        obj1 = @SATcomponent(shape1,AxisVector,Axis)
        
        
        Axis2 = Axis.vector().scale -1
        Axis2.getLength()
        AxisVector2 = Axis2.unit()
        Axis2 = Axis2.line().add(pos2)
        obj2 = @SATcomponent(shape2,AxisVector2,Axis2)
        obj2.line = obj2.vector.line().add Axis.p2
        
        
        v1 = obj1.vector
        v2 = obj2.vector
        
        avec = Axis.vector().subtract(v1).add(v2)
        
        #v2.draw(null,0,"red")
        #v1.draw(null,0,"blue")
        
        
        
        #displayAxis Axis2,AxisVector2,0.5,"lightgrey"
        #displayAxis obj1.line,obj1.vector,4,"rgba(0, 0, 153, 0.5)"
        #displayAxis obj2.line,obj2.vector,4,"rgba(0, 0, 153, 0.5)"
        #console.log avec
        if (Axis.vector().x / avec.x < 0) or (Axis.vector().y / avec.y < 0)
            avec.getLength()
            return avec
        return false
    
    SATcomponent:(shape,AxisVector,Axis)->
        ####### finding the verticies ######
        i = shape.nearest(Axis.p2)
        if not i
            console.log i
            throw ""
        #i.draw(0,0)
        a1 = new Line(shape.shape.position,i).vector()
        a1 = a1.projection AxisVector
        a1Line = a1.line().add(Axis.p1)
        obj = 
            line:a1Line
            vector:a1
        return obj 
    circlesCollide:(shape1,shape2)-> 
        return false unless k3 = @projections(shape1,shape2)
        collision = {}
        collision.vector = k3
        collision.manifold = [new Line(shape1.shape.position,shape2.shape.position).middle()]
        return collision
    positionalCorrection:(percentages,mainShape,otherShape,penetrationDepth,invMasses)->
        percentage = percentages or 0.4
        if (k = penetrationDepth.length)<0.05 then percentage = 0  
        throw "" unless penetrationDepth.length?
        correction = penetrationDepth.scale(percentage/invMasses)
        mainShape.move correction.scale(mainShape.shape.invM)
        otherShape.move correction.scale(-otherShape.shape.invM)
    
    calculateImpulse3:(A,B,CollisionV,normal,e)->

        invMassA = A.shape.invM
        invMassB = B.shape.invM
        invMoiA = A.shape.invI
        invMoiB = B.shape.invI
        n = normal.scale(-1)
        perp = n.normal()
        mr = A.shape.restitution
        Or = B.shape.restitution
        e = mr * Or
        sf = A.shape.sf * B.shape.sf
        df = A.shape.df * B.shape.df
        rv = B.shape.item.v.subtract(A.shape.item.v)
        contactVel = rv.dot( n )
        return false if contactVel >= 0

        invMassSum = invMassA + invMassB
         
        
        impulse = contactVel*(-(1 + e))
        impulse /= invMassSum
        #impulse *= 2 if invMassA * invMassB
        B.shape.item.changeVelocity (n.scale( impulse * invMassB) )
        A.shape.item.changeVelocity (n.scale(-impulse * invMassA) )
        return impulse
        rv = B.shape.item.v.subtract(A.shape.item.v)
        t = rv.projection(normal.normal())
        t = t.unit()
        invMassSum = invMassA + invMassB
        jt = -rv.dot t
        jt/= invMassSum
        return false if abs(jt) < 0.01
        sf = df = 1
        tangentImpulse = if abs(jt) < impulse * sf then t.scale(jt) else t.scale(-impulse * df)
        B.shape.item.v = B.shape.item.v.add(tangentImpulse.scale( invMassB) )
        
        A.shape.item.v = A.shape.item.v.subtract(tangentImpulse.scale(invMassA))
        
        
        
    calculateImpulse2:(A,B,contact,contactsLength,CollisionV,normal,boolFric,impulseL)-> 
        rA = contact.subtract(A.shape.position)
        rB = contact.subtract(B.shape.position)
        angVelA = A.shape.item.rv
        angVelB = B.shape.item.rv
        invMassA = A.shape.invM
        invMassB = B.shape.invM
        invMoiA = A.shape.invI
        invMoiB = B.shape.invI
        n = normal.scale(-1)
        perp = n.normal()
        mr = A.shape.restitution
        Or = B.shape.restitution
        e = mr * Or
        sf = A.shape.sf * B.shape.sf
        df = A.shape.df * B.shape.df
        if boolFric
            rv = B.shape.item.v.add(rB.scaleCross(-angVelB))
            .subtract(A.shape.item.v).subtract(rA.scaleCross(-angVelA))
            
            contactVel = rv.dot( n )
            return false if contactVel >= 0
            
            raCrossN = -rA.cross n
            rbCrossN = -rB.cross n
            
            rA.getLength()
            rB.getLength()
            rA = rA.scale -1
            rB = rB.scale -1
            rAproj = rA.unit().dot( n )
            rBproj = rB.unit().dot( n ) 
            
            invMassSum = invMassA + invMassB + sqr(raCrossN)*invMoiA + sqr(rbCrossN) * invMoiB
            impulse = contactVel*(-(1 + e))
            impulse /= invMassSum
            impulse /= contactsLength
            B.shape.item.v = B.shape.item.v.add(n.scale(1 *impulse * invMassB) )
            B.shape.item.rv -= invMoiB * impulse* rbCrossN
            A.shape.item.v = A.shape.item.v.add(n.scale(1*-impulse * invMassA) )
            A.shape.item.rv += invMoiA * impulse * raCrossN
    
        angVelA = A.shape.item.rv
        angVelB = B.shape.item.rv
        rv = B.shape.item.v.add(rB.scaleCross(angVelB))
        .subtract(A.shape.item.v).subtract(rA.scaleCross(angVelA))
        t = rv.projection(normal.normal())
        t = t.unit()
        raDotN = rA.dot n
        rbDotN = rB.dot n
        invMassSum = invMassA + invMassB + sqr(raDotN)*invMoiA + sqr(rbDotN) * invMoiB
        jt = -rv.dot t
        jt/= invMassSum
        #jt/= contactsLength
        return false if abs(jt) < 0.01
        sf = df = 1
        impulse = impulse or impulseL
        tangentImpulse = if abs(jt) < impulse * sf then t.scale(jt) else t.scale(-impulse * df)
        B.shape.item.v = B.shape.item.v.add(tangentImpulse.scale( invMassB) )
        B.shape.item.rv += invMoiB * tangentImpulse.cross(rB)
        A.shape.item.v = A.shape.item.v.subtract(tangentImpulse.scale(invMassA))
        A.shape.item.rv -= invMoiA * tangentImpulse.cross(rA)
    impulseResolution:(A,B,Collision,bool)->
        return new Vector() unless (invMasses = A.shape.invM + B.shape.invM)
        CollisionV = Collision.vector
        normal = CollisionV.unit()
        contacts = Collision.manifold
        correction = @positionalCorrection null,A,B,CollisionV,invMasses
        excecution = []
        results = []
        results2 = null
        boolFric = true
        impulseL = 0
        if contacts.length is 2
            r1 = contacts[0].subtract B.shape.position
            r2 = contacts[1].subtract B.shape.position 
            impulseL = @calculateImpulse3(A,B,CollisionV,normal) if r1.cross(normal)*r2.cross(normal) < 0
            boolFric = false if r1.cross(normal)*r2.cross(normal) < 0
        for i,i1 in contacts
            @calculateImpulse2(A,B,i,contacts.length,CollisionV,normal,boolFric,impulseL)
        #throw ''# if A.shape.invM * B.shape.invM
#################### Engine ####################

class Engine
    constructor:()->
        @request =
            frame: true
            animation: false
        @count = 0
        @count2 = 0
        @shapes = []
        @physics = new Physics()
        @lastLoop = new Date()
        @thisLoop = null
        @leftOverTime = 0
        @accumulator = 0
        @ITERATIONS = 2
        @fpsCount = 1/10#800/7
        @dt = 1/@fpsCount
        @fpsNum = null
        @pageX=null
        @pageY=null
        @geomouse()
        @fps()
        @adjust()
        @interface()
        @update()
    fps:->
        @thisLoop = new Date().getTime()
        @accumulator += @thisLoop - @lastLoop
        @elapsedTime = @thisLoop-@lastLoop
        @lastLoop = @thisLoop
        @fpsNum = 1000/@elapsedTime 
    ctr: ->
            obj = new Object()
            obj.x = jcan.width() / 2
            obj.y = jcan.height() / 2
            return obj
    adjust:()->
        jcan.attr "width", (win.width() - 24)
        jcan.attr "height", (win.height() - 20)
        jcan.scaleCanvas
            x: @ctr().x
            y: @ctr().y
            scaleY: -1
    initializeCanvas:()->
        jcan.attr "width", (win.width() - 24)
        jcan.attr "height", (win.height() - 20)
        ctx.setTransform(1,0,0,1,0,jcan.height());
        jcan.scaleCanvas
            x: @ctr().x
            y: @ctr().y
            scaleY: -1
    implement:(item)->
        @shapes.push item
    viewLoc:->
        console.log "#{@pageX}#{@pageY}"
    geomouse:->
        that = @
        jcan.mousemove (e)->
            that.pageX = e.pageX - 10
            that.pageY = jcan.height() - e.pageY + 9
    dragShape:(shape)->
        loc = new Vector(@pageX,@pageY).subtract shape.shape.position
        loc.getLength() 
        shape.shape.force = shape.shape.force.add loc
        #shape.shape.force.draw null,0
        k = shape.shape.item.v 
        if loc.length < 30
            null
            shape.shape.item.v = k.scale 0.9
        shape.shape.item.v = k.scale(0.999)
        shape.integrate @dt
    checkDrag:(shape)->
        if shape.shape.drag
            @dragShape(shape)
            return true
        shape.integrate @dt
        #shape.move()
        return false
    checkWall:(shape)->
        change = shape.shape.item
        vel = shape.shape.item.v
        bound = shape.shape.bounding
        if bound[0].x > jcan.width()
            if (product = vel.dot(base = new Vector(1,0))) > 0
                change.changeVelocity base.scale(-product*1.8)
                #shape.move new Vector(-1,0).scale 0.1
        if bound[1].x < 0
            if (product = vel.dot(base = new Vector(-1,0))) > 0
                change.changeVelocity base.scale(-product*1.8)
                #shape.move new Vector(1,0).scale 0.2
        if bound[0].y > jcan.height()
            if (product = vel.dot(base = new Vector(0,1))) > 0
                change.changeVelocity base.scale(-product*1.8)
                #shape.move new Vector(0,-1).scale 0.2
        if bound[1].y < 0
            if (product = vel.dot(base = new Vector(0,-1))) > 0
                change.changeVelocity base.scale(-product*1.8)
                #console.log ultimateCount
                #throw ""
                #shape.move new Vector(0,1).scale 0.2
    checkColl:->
        for i,i1 in @shapes
            for n,n1 in @shapes
                continue if n1 <= i1
                continue if not (n.shape.invM or i.shape.invM)
                continue if not (collision = @physics.collide i,n)
                impulse = @physics.impulseResolution i,n,collision,@dt 
    animate:->
        @draw()
        return unless @request.animation
        if @request.animation
            for [0...@ITERATIONS]
                @checkColl()
                ultimateCount++
                for i in @shapes
                    null
                    @checkDrag i
                    @checkWall i
    draw:->
        jcan.clearCanvas()
        for i in @shapes
            i.draw()
    pause: ->
        @request.animation = false
    stopping: ->
        @pause()
        @request.frame = false
    start: ->
        @request =
            frame: true
            animation: true
    resetting: ->
        @shapes = []
        @pause()
    interface:->
        that = if that? then that else @
        win.resize () ->
            that.adjust()
        pause.click () ->
            if that.request.animation is true then that.pause() else that.start()
            pause.text if that.request.animation is true then "PAUSE" else "PLAY"
        reset.click () ->
            that.resetting()
        stop.click () ->
            that.stopping()
    update:()->
        that = if that? then that else @ 
        #info.text that.count
        #info2.text that.request.animation
        that.count++
        that.fps() 
        that.animate()
        #if that.accumulator > 0.8
        #    that.accumulator = 0.8
        #while that.accumulator > that.dt
        #    that.animate()    
        #    that.accumulator-= that.dt
        if that.count > 100
            that.count = 0
        setTimeout -> 
            requestAnimationFrame(() ->
                info4.text that.fpsNum if that.request.animation
                that.update()
            ) if that.request.frame is true
        ,0#1000/1000
        
#################### Item ####################           
                    
class Item
    constructor:(k)->
        @v = if k.v? then k.v.scale 1/1 else new Vector()
        @a = if k.a? then k.a.scale 1/1 else new Vector()
        @rv = if k.rv? then k.rv else 0
        @ra = 0
    move:(vec)->
        return vec.add @v
    integrate:(point,ts)->
        return point.add @v.scale(ts)#.add(@a.scale(1*ts*ts/2))
    integrateAcc:(ts)->
        #@rv += @ra*ts
        @orientation +=@rv*ts# + @ra *ts*ts/2
        return @v = @v.add @a#.scale 2#ts#*ts/2
    integrateRotate:(axis,point,ts)->
        #info4.text @rv
        return point.rotate axis,@rv*ts#*0.5*0.44
    rotate:(axis,point)->
        #if @rv > 2*pi
        #    @rv -= 2*pi
        #if @rv < -2*pi
        #    @rv += 2*pi
        return point.rotate axis,@rv
    changeVelocity:(change)->
        @v = @v.add change
    accelerate:->
        @changeVelocity @a
        
#################### Vector ####################
class Vector
    constructor:(@x=0,@y=0)->
    copy:(temp,temp2)->
        k = new Vector(@x,@y)
        k.length = @length
        return k
    move:(x=0,y=0,temp)->
        return new Vector(@x+x,@y+y)
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
    draw:(bool,bool2,bool3)->
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
        
    draw2:(bool,bool2,bool3)->
        
        start = if bool? then {x:0,y:0} else new ctr() 
        end = {@x,@y}
        end.x+=start.x
        end.y+=start.y
        ctx.beginPath()
        ctx.fillStyle = "black"
        ctx.arc(end.x, end.y, 3, 0, 2*pi)
        ctx.fill()
        return if not bool2?
        ctx.beginPath()
        ctx.strokeStyle= if bool3? then bool3 else "black"
        ctx.lineWidth= bool2 or 0.5
        ctx.moveTo(start.x,start.y)
        ctx.lineTo(end.x, end.y)
        ctx.stroke()
        
        
#################### Line ####################
        
class Line
    constructor:(@p1,@p2)->
    copy:(temp,temp2) ->
        new Line @p1.copy(),@p2.copy()
    move:(x,y)->
        new Line @p1.move(x,y),@p2.move(x,y)
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
    draw:(width,style)->
        temp =
            type: "line"
            strokeWidth: if width? then width else 3
            strokeStyle: style or "black"
            x1: @p1.x
            y1: @p1.y
            x2: @p2.x
            y2: @p2.y
        jcan.draw temp
        
    draw2:(width,style)->
        ctx.beginPath()
        ctx.strokeStyle= style or "black"
        ctx.lineWidth= if width? then width else 3
        ctx.moveTo(@p1.x,@p1.y)
        ctx.lineTo(@p2.x,@p2.y)
        ctx.stroke()
       

#################### Shape ####################     
class Shape
    constructor:(k)->
        if not k? then k = {}
        @fillStyle = if k.fillStyle? then k.fillStyle else generateRandomColor()#"black"
        @strokeStyle = k.strokeStyle or "black"
        @strokeWidth = k.strokeWidth or null
        @item = new Item({v:k.v,a:k.a,rv:k.rv,ra:k.ra})
        @position = new Vector k.x,k.y
        @orientation = if k.orient? then k.orient else 0
        @verticies = []
        @restitution = if k.restitution? then k.restitution else 0
        @sf = if k.sf? then k.sf else 0
        @df = if k.df? then k.df else 0
        @invM = if k.invM? then k.invM else 1
        @invI = @invM / 100
        @angularVelocity = 0
        @finalVelocity = new Vector()
        @force = (if @invM then @item.a.scale 1/@invM else new Vector())
        @torque = 0
        @gravity = @force.copy()
        @item.a = new Vector()
        @edges=[]
        @norms=[]
        @bounding = []
        @drag = if k.drag? then k.drag else false
    integrate:(ts)-> 
        @item.a = if @invM then @force.scale @invM else @force.copy()
        @item.rv += @torque*@invI 
        @item.v = @item.v.add @finalVelocity
        @position = @item.integrate @position,ts
        #if (kv = abs(@item.rv)) > 1 then @item.rv *= 1/kv
        i.equal @item.integrate i,ts for i in @bounding
        i.equal @item.integrate i,ts for i in @verticies
        i.equal @item.integrateRotate @position,i,ts for i in @verticies
        i.equal @item.integrateRotate new Vector(),i,ts for i in @norms
        @item.integrateAcc ts
        @torque = 0
        @finalVelocity = new Vector()
        @force = new Vector()
        @force = @force.add @gravity
    rotate:(obj)->
        if obj
            if typeof obj isnt "number" then throw "isnt a number!"
            i.equal i.rotate @position,obj for i in @verticies
            i.equal i.rotate new Vector(),obj for i in @norms
        else
            return false if not @item.rv
            i.equal @item.rotate @position,i for i in @verticies
            i.equal @item.rotate new Vector(),i for i in @norms
    move:(obj)->
        if obj?
            @position = @position.add obj
            i.equal i.add obj for i in @bounding
            i.equal i.add obj for i in @verticies
        else
            @position = @item.move @position
            i.equal @item.move i for i in @bounding
            i.equal @item.move i for i in @verticies
            @item.accelerate()
    applyTorque:(impulseVec,contactVec,rest=1,scalar=0.1)->
        return
        contactVec.getLength()
        dist = scalar* 1000 *contactVec.cross impulseVec
        radius = contactVec.length
        @torque += dist/radius
    applyImpulse:(impulseVec,contactVec,rest)->
        @item.changeVelocity impulseVec.scale(@invM)
        @applyTorque impulseVec,contactVec if contactVec 
       
#################### Circle ####################     
           
class Circle
    constructor:(k)->
        @shape = new Shape k
        if not k? then k = {}
        @shape.radius = k.radius or 30
        @AABB()
        @shape.verticies = [new Vector(@shape.position.x,@shape.position.y+@shape.radius)]
    AABB:->
        @shape.bounding[0] = new Vector @shape.position.x+@shape.radius,@shape.position.y+@shape.radius
        @shape.bounding[1] = new Vector @shape.position.x-@shape.radius,@shape.position.y-@shape.radius
    nearest:(point)->
        k = point.subtract(@shape.position)
        k.getLength()
        k = k.unit().scale(@shape.radius).add @shape.position
    intersects:(line)->
        h = @shape.position.x
        k = @shape.position.y
        u = line.vector()
        x1 = line.p1.x
        y1 = line.p1.y
        r = @shape.radius
        v = u.y
        u = u.x
        a = sqr(u)+sqr(v)
        b = 2*(u*(x1-h)+v*(y1-k))
        c = sqr(x1-h)+sqr(y1-k)-sqr(r)
        return false unless k = solve_Quadratic a,b,c
        ans = false
        ans2 = []
        ans3 = []
        (ans2.push n if 0<=n<=1) for n in k
        for n in ans2
            l = new Vector u,v
            l = l.scale n
            l = l.add line.p1
            ans3.push l.copy()
        if ans3.length is 2
            #new Line(ans3[0],ans3[1]).draw()
            return new Line ans3[0],ans3[1]
        else if ans3.length is 1
            #ans3[0].draw(0,0)
            return ans3[0]
        return false
    intersectsLite:(line)->
        pos = @shape.position
        rad = @shape.radius
        rsq = sqr rad
        m = line
        #m.draw()
        mvec = m.vector()
        conn1 = pos.copy().subtract m.p1,"no length"
        conn2 = pos.copy().subtract m.p2,"no length"
        #conn1.line().copy().add(m.p1).draw()
        #conn2.line().copy().add(m.p2).draw()
        d1 = conn1.dot mvec
        d2 = conn2.dot mvec
        conn3 = conn1.projection m.normal().vector()
        return conn3.length-rad if (abs(conn3.length)<rad) and ((d1*d2)<0)
        if ((sqr(conn1.x)+sqr(conn1.y))<=rsq) or ((sqr(conn2.x)+sqr(conn2.y))<=rsq)
            return conn3.length-rad #yes
        return no
    move:(obj)->
        @shape.move obj
    integrate:(ts)->
        @shape.integrate ts
    rotate:(val)->
        return
        bool = @shape.rotate val
        #throw "rotate called"
        @generateBounds()
    findCorner:()->
        return "none"
    findEdge:()->
        return "none"
    draw:->
        temp =
            type: "arc"
            fillStyle: @shape.fillStyle
            radius: @shape.radius
            x: @shape.position.x
            y: @shape.position.y
        jcan.draw temp
        #i.draw(0) for i in @shape.bounding
        new Line(@shape.position,@shape.verticies[0]).draw 1,"grey"
        #i.draw(0,0) for i in @shape.verticies
        #@shape.fillStyle = "black"
        
        
    draw2:(ctx)->
        ctx.beginPath()
        ctx.fillStyle = @shape.fillStyle
        ctx.strokeStyle= @shape.strokeStyle
        ctx.lineWidth= @shape.strokeWidth
        ctx.arc(@shape.position.x, @shape.position.y, @shape.radius, 0, 2*pi)
        ctx.fill()
        ctx.stroke()

        
#################### Rectangle ####################
class Rectangle
    constructor:(k)->
        @shape = new Shape k
        if not k? then k = {}
        width = k.width or 10
        height = k.height or 10
        @makeVerticies(width,height)
        @makeEdges()
        @AABB()
        @rotate @shape.orientation if @shape.orientation
    AABB:->
        if not @shape.verticies[0] then throw "you messed up!"
        @shape.bounding[0] = @shape.verticies[0].copy()
        @shape.bounding[1] = @shape.verticies[2].copy()
        @shape.bounding[0] = @shape.bounding[0].move 1,1
        @shape.bounding[1] = @shape.bounding[1].move -1,-1
    generateBounds:->
        farthestPtx = @findFarthest("x","farthest")
        farthestPty = @findFarthest("y","farthest")
        closestPtx = @findFarthest("x","nearest")
        closestPty = @findFarthest("y","nearest")
        @shape.bounding = [new Vector(farthestPtx.x,farthestPty.y),new Vector(closestPtx.x,closestPty.y)]
    findFarthest:(xOrY,nearOrFar)->
        xOrY = xOrY
        nearOrFar = nearOrFar
        farthestPtx =  @shape.verticies[0]
        for i,i1 in @shape.verticies
            continue if i1 is 0
            farthestPtx = farthestPtx[nearOrFar] xOrY,i
        return farthestPtx
    makeVerticies:(width,height)->
        w = width
        h = height
        ref = @shape.verticies
        pos = @shape.position
        ref[0] = pos.move w/2,h/2
        ref[1] = ref[0].move -w
        ref[2] = ref[1].move 0,-h
        ref[3] = ref[2].move w
    makeEdges:->
        lim = @shape.verticies.length-1
        edge = @shape.edges
        corner = @shape.verticies
        norm = @shape.norms
        for i,i1 in corner
            continue if i1 is lim
            i2 = corner[i1+1]
            edge[i1] = new Line i,i2
            edge[i1].getLength()
            norm[i1] = edge[i1].normal().vector().scale(-1).unit()
        edge[lim] = new Line corner[lim],corner[0]
        edge[lim].getLength()
        norm[lim] = edge[lim].normal().vector().scale(-1).unit()
        #console.log i for i in norm
    nearest:(point)->
        max = 0
        maxNum = 0
        pos = @shape.position
        for i,n in @shape.verticies
            if (k = i.subtract(pos).dot point.subtract(pos)) > max
                max = k
                maxNum = n
        return @shape.verticies[maxNum]
    intersects:(line)->
        return (i.intersects line for i in @shape.edges)
    rotate:(val)->
        bool = @shape.rotate val
        @generateBounds()
    move:(obj)->
        @shape.move obj
        @rotate() if not obj
    integrate:(ts)->
        @shape.integrate ts
        @generateBounds() if @shape.item.rv
    findCorner:(edge1,edge2)->
        if (edge1 is @shape.edges.length-1) or (edge2 is @shape.edges.length-1)
            if edge1 is 0 or edge2 is 0
                return 0
        return "none" unless abs(edge1-edge2) is 1
        return if edge1 > edge2 then edge1 else edge2
    findEdge:(edge1,edge2,point)->
        point = point or new Vector()
        k1 = null
        k2 = null
        k3 = null
        count = 0
        if (edge1 is @shape.edges.length-1) or (edge2 is @shape.edges.length-1)
            if edge1 is 1 or edge2 is 1
                k1 = 0
                count++
        if (edge1 is @shape.edges.length-2) or (edge2 is @shape.edges.length-2)
            if edge1 is 0 or edge2 is 0
                k2 = @shape.edges.length-1
                count++
        if abs(edge1-edge2) is 2
            k3 = 0.5 * (edge1+edge2)
            count++
        min = Infinity
        minSide = "none"
        if count > 0
            sides = [k1,k2,k3]
            for i in sides
                if i?
                    m = new Line(@shape.edges[i].middle(),point).vector()
                    m.getLength()
                    if m.length < min
                        min = m.length
                        minSide = i
            return minSide
        return "none"
    draw:->
        temp =
            type: "line"
            strokeWidth: 0
            fillStyle: @shape.fillStyle
        for i,n in @shape.verticies
            temp["x#{n+1}"] = i.x
            temp["y#{n+1}"] = i.y
        temp["x#{@shape.verticies.length+1}"] = @shape.verticies[0].x
        temp["y#{@shape.verticies.length+1}"] = @shape.verticies[0].y
        
        sw = @shape.strokeWidth
        ss = @shape.strokeStyle
        #i.draw(sw,ss) for i in @shape.edges
        jcan.draw temp
        #i.draw(null,0) for i in @shape.norms
        #i.draw(0,0) for i in @shape.verticies
        #i.draw(0) for i in @shape.bounding
        #@shape.fillStyle = "black"
    draw2:(ctx)->
        ctx.beginPath()
        ctx.fillStyle = @shape.fillStyle
        ctx.strokeStyle= @shape.strokeStyle
        ctx.lineWidth= @shape.strokeWidth
        ctx.moveTo(@shape.verticies[0].x,@shape.verticies[0].y)
        for i,i1 in @shape.verticies
            continue if not i1
            ctx.lineTo(i.x, i.y)
        ctx.fill()
        ctx.stroke()
        
        
             
        
#################### END OF CLASSES ####################     

#################### START ####################     
world = new Engine()
x = null
y = null
p1 = null
p2 = null
count = 0

mkdrg=(k)-> k.shape.drag = true;return k

shapeSelection = []
shapeSelection[0] = (() ->
    bs = getRandomInt(1,100)
    new Rectangle({x:p1.x,
    y:p1.y,
    width:bs,
    height:bs,
    invM:1/bs,#(getRandomInt(1,100)),
    friction:0.1,
    rv:0*0.01,
    v:p2.subtract(p1).scale(0.001),
    #a:new Vector(0,-0.1),    
    restitution:0.0})
)

shapeSelection[1] = (() ->
    new Rectangle({x:p1.x,#138
    y:p1.y,#84
    width:200,
    height:70,
    invM:0#1/1000000,
    invI:0,
    sf: 0.5,
    df: 0.4,
    restitution: 0.0})
)

shapeSelection[8] = (() ->
    new Rectangle({x:p1.x,
    y:p1.y,
    width:20,
    height:400,
    invM:0,
    sf: 0.3,
    df: 0.2,
    restitution: 0})
)

shapeSelection[2] = (() ->
    new Rectangle({x:p1.x,#250,
    y:p1.y,#166,
    width:50,
    height:50,
    invM:1/1000,
    orient:0#-pi/4,
    #rv:3.5#0.1,
    sf: 0.6,
    df: 0.4,
    v:p2.subtract(p1).scale(0.005),
    a:new Vector(0,-0.0004),
    restitution: 0.0})
)

shapeSelection[3] = (() ->
    new Rectangle({x:p1.x,
    y:p1.y,
    width:50,
    height:70,
    v:p2.subtract(p1).scale(0.1)}
    )
)

shapeSelection[4] = (() ->
    new Rectangle({x:p1.x,
    y:p1.y,
    width:400,
    height:20,
    invM:0,
    friction:0.003})
)

shapeSelection[5] = (() ->
    new Circle({radius:getRandomInt(30,35),
    x:p1.x,
    y:p1.y,#300
    a:new Vector(0,-0.0004),
    v:p2.subtract(p1).scale(0.005),
    restitution: 0,
    sf: 0.6,
    df: 0.4,
    invM:1/10000000,
    friction:0.01})
)

shapeSelection[6] = (() ->
    new Circle({radius:70,
    x:p1.x,
    y:p1.y,
    v:p2.subtract(p1).scale(0.01),
    invM:1/100,
    a:new Vector(0,-0.1),
    restitution: 0})
)

shapeSelection[7] = (() ->
    new Circle({x:p1.x,
    y:p1.y,
    invM:0})
)

containerSetup = (item,count,mkd)->        
    if count.shapes.length < 1
        count.implement shapeSelection[1]() 
        p1 = p1.move(100,235)
        count.implement shapeSelection[8]()
        p1 = p1.move(-200,0)
        count.implement shapeSelection[8]()
    else
        if mkd
            count.implement mkdrg shapeSelection[item]()
        else
            count.implement shapeSelection[item]()

freeFloatSetup = (item,item2,count,mkd)->
    switch
        when count.shapes.length < 1 and mkd
        then count.implement mkdrg shapeSelection[item]()
        when count.shapes.length < 1
        then count.implement shapeSelection[item]()
        when count.shapes.length >= 1
        then count.implement shapeSelection[item2]()
        
containerDemo = ()->
    center = new ctr()
    p1.x = center.x
    p1.y = 0
    world.implement shapeSelection[1]() 
    p1 = p1.move(100,235)
    world.implement shapeSelection[8]()
    p1 = p1.move(-200,0)
    world.implement shapeSelection[8]()
    for [0...6]
        p1.x = getRandomInt(center.x-80,center.x+80)
        p1.y = getRandomInt(50,center.y+200)
        p2 = p1
        world.implement shapeSelection[2]()

initializing_Mouse=(e)->
    x = e.pageX - 10
    y = jcan.height() - e.pageY + 9

jcan.mousemove (e)-> info3.text "x: #{e.pageX - 10} y: #{jcan.height() - e.pageY + 9}"
p1 = new Vector x,y
#containerDemo()
jcan.mousedown (e) ->
    initializing_Mouse(e)
    if count is 1
        p2 = new Vector x,y
        count = 0
        #k = containerSetup(5,world,0)
        #k = containerSetup(2,world,0)
        k = freeFloatSetup(1,2,world,0)
        #k = freeFloatSetup(2,2,world,0)
        #k = freeFloatSetup(0,0,world,0)
        #k = freeFloatSetup(5,5,world,1)
        #k = freeFloatSetup(1,5,world,0)
        #world.shapes[0].rotate 0.1 if world.shapes[1]
    else count++
    p1 = new Vector x,y
