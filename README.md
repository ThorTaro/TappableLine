# Idea: How to enable recognize tap line easily (extension recognize tap area)

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


![fig1](https://user-images.githubusercontent.com/44053042/54430114-da39c980-4765-11e9-8db5-df72e3f761f9.png)


To extend the tappable area, I propose the idea that draw the long and thin rectangle 
