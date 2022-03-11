import numpy as np

def secantline(x:float, m:float, x0:float, y0:float)->float:
    """For x, the correspoding y-value of the secant line passing through 
       (x0, y0) of slope m is calculated and returned."""
       
     #Add code here!  
    return # The y-value corresponding to x
    
def nextH(h:float)->float:
    """The next value of h = ∆x is 60% of its previous value."""
    
    #Add your code here!
    return # the next value of h

def generateLeftOrRightSecantSlopeAndPts(func, x0:float, y0:float,
                            h:float, xMin:float, xMax:float)->tuple:
    """Using the test function func, x0, y0, and h = ∆x, the values of x1, y1
       and the slope m of the secant line through (x0,y0) and (x1,y1) are 
       calculated. Using func, m, x0 and y0, the xValues array and yValues 
       array needed to plot the the secant are also generated. The results  
       are returned as the tuple (m, x1, y1, xValues, yValues)."""
      
     #Add your code here!
    return #(m, x1, y1, xValues, yValues)
    
    
def generateCentralSecantSlopeAndPts(func, x0: float, 
                    h:float, xMin:float, xMax:float)->tuple:
    """Using the test function func, x0, and h = ∆x, the left (xL,yL)
       and right (xR,yR) central-secant points are calculated. The slope
       m of the central-secant throught these points is also found. Using
       m and the points, the xValues array and yValues array needed to plot 
       the central-secant are also generated. The results are returned  
       as the tuple (m, xL, yL, xR, yR, xValues, yValues)."""
        
    #Add your code here!
    return #(m, xL, yL, xR, yR, xValues, yValues)
 
     
def plotTheFunction(axes, func, xMin:float, xMax:float, labelStr:str)-> tuple:
    """Use the axes to plot the function func over the domain [xMin, xMax]. 
       To do this, 300 x-values and y-values must be generated for the 
       plot. The labelStr is used to label the plot."""
    
    #Add your code here!
    return # the minimum and the maximum of the calculated y-values	

