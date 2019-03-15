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


That rectangle and points what we need to calclurate for is like fig.2


![fig2](https://user-images.githubusercontent.com/44053042/54431213-29352e00-4769-11e9-9f6d-7f1e4037a9d5.png)


* The two red points are "pointA" and "pointB" (start and end of this line). 
* The black rectangle is the "line" that we want to draw instead of line. 
* The two blue points and the two green points are the corner points of this rectangle. 

We need to calculate the four points (blue and green).


## Calculate points
It is easy to calculate these four points. Let's calculate the pointC in fig.2.

To calculate pointC, we need calculate the value of "delta". So we solve this...

![fig3](https://user-images.githubusercontent.com/44053042/54433363-03ab2300-476f-11e9-8300-cae2408dba0b.png)


This y = g(x) is the function that 

* through the pointA
* f(x) is orthogonal to g(x)

So we calculate the function g(x) like this...

![fig4](https://user-images.githubusercontent.com/44053042/54434405-88973c00-4771-11e9-846a-ee2a707e9111.png)


Now, we know the value of "delta" and the function g(x), we can calculate the pointC and pointD. And we can calculate the pointE and pointF in the same way.


Unfortunately, we cannot draw the rectangle by using this idea in all situations. When the gradient of f(x) is zero, we cannot calculate the function g(x). In this situation, we can draw the rectangle by using this... 
