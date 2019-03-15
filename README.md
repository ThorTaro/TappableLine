# Swift: The idea how to exend the area that recognize the line tapped

## Overview
If you draw the line from pointA to pointB simply by using UIBezierPath in Swift, you maybe use

    let path = UIBezierPath()
    path.move(to:pointA)
    path.addline(to:pointB)
    path.close()
    path.lineWidth = 10.0
    path.stroke()
    
However, if you want to rocognize tap this line, it is hard to do it. 


This is because that the width of "the true line from pointA to pointB" will not be changed even though you change `path.linewidth`.


You can imagine like fig.1


![fig1](https://user-images.githubusercontent.com/44053042/54431282-597ccc80-4769-11e9-8790-cb9351e751d4.png)


To extend the tappable area, I propose the idea that draw the long and thin rectangle instead.


## Idea and what we need
To realize this idea, we need to draw the long, thin and slanted rectangle. And we need 4 points in addition to "pointA" and "pointB".


That rectangle and points what we need to calclurate for is like fig.2...


![fig2](https://user-images.githubusercontent.com/44053042/54431213-29352e00-4769-11e9-9f6d-7f1e4037a9d5.png)


* The two red points are "pointA" and "pointB" (start and end of this line). 
* The black rectangle is the "line" that we want to draw instead of line. 
* The two blue points and the two green points are the corner points of this rectangle. 

We need to calculate the four points (blue and green).


## Calculate points
It is easy to calculate these four points. 
