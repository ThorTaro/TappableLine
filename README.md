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


This is because that the width of "the true line from pointA to pointB" will not be changed even though you change the `path.linewidth`.


You can imagine like this...


![fig1](https://user-images.githubusercontent.com/44053042/54430222-3b619d00-4766-11e9-910a-4bda0b709b98.png)


To extend the tappable area, I propose the idea that draw the long and thin rectangle instead.


## Idea and what we need to calculate
To realize this idea, we need to draw the long, thin and slanted rectangle. And we need 4 points in addition to "pointA" and "pointB".
