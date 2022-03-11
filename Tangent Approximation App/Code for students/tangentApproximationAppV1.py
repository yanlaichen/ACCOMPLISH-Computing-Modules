#!/Users/ahausknecht/opt/anaconda3/bin/python python3
# -*- coding: utf-8 -*-%
#Created on Mon Jul 26 00:54:49 2021
#
# @author: ahausknecht#


from enum import Enum
from matplotlib import pyplot as plt
from matplotlib.widgets import Button, CheckButtons, RadioButtons, TextBox
import numpy as np
from scipy.misc import derivative as scipyD
import sys
from tangentApproxLib import plotTheFunction, secantline, nextH
from tangentApproxLib import generateLeftOrRightSecantSlopeAndPts
from tangentApproxLib import generateCentralSecantSlopeAndPts


class DifferentiationMode(Enum):
    LeftEndpt = 1
    RightEndpt = 2
    LeftAndRightEndpt = 3
    CentralDifference = 4

class TangentApprox:
    def __init__(self,func = None, dfdx=None, xMin= -5.0, xMax=5, labelStr=''):
        self.mainCanvas = self.generateSecantsAndTangentLine()
        self.ending = False
        # Direct the needed events to Tangent's __call__ function
        self.cid = self.mainCanvas.mpl_connect('button_press_event', self)
        self.cidrelease = self.mainCanvas.mpl_connect(
                               'button_release_event', self)
        self.cidclose=self.mainCanvas.mpl_connect('close_event', self)
        
        # Used to determine when h is zero
        self.zeroTol = 1e-6
        # The numerical differentiation mode 
        self.derivativeMode = DifferentiationMode.LeftEndpt
        
    
        # The differentiation point selected by the user
        self.x0 = None; self.y0 = None
        self.x0Entered = False
        self.hL = None; self.hR = None
    
        # A list used to keep track of the x-values used to
        # approximate the tangent at (x0,y0)
        self.steps = []
        # A flag inticate whether or not the exact or a good
        # approximation to the tangent line at (x0,y0) should be displayed
        self.showTangentLine = False
    
        # Generate the app's GUI, plot func, and display the app
        self.plot(func, dfdx, xMin, xMax, labelStr)
        
        
         
    def plot(self, func, dfdx, xMin:float, xMax:float, labelStr: str):
        """'plot'...is called by the user to plot the function 'func' over 
                    the domain [xMin ,xMax]. If 'None' is passed y = sin(3x)+x
                    is used.
              
           'dfx'...is its derivative of 'func'. If 'None' is passed then 
                   either f' derivative or scipy's numerical derivative 
                   function is used instead.
                     
            'labelStr'...is used to label the plot.   
        """
        self.xMin = xMin; self.xMax = xMax
        
        self.usingScipyD = False
        if func == None:
            func = lambda x: (10-x**2)/2
            dfdx = lambda x: -x
            xMin = -5; xMax = 5
            labelStr = '$y = (10-x^2)/2$'
        self.func = func
        
        if dfdx == None:
            dfdx = lambda x : scipyD(self.func, x, dx=1e-6, order=3)
            self.usingScipyD = True
        self.dfdx = dfdx
       
        
        self.generateGUI()
          
        ax = self.mainAxes
        yMin, yMax = plotTheFunction(ax,func, xMin, xMax, labelStr)
        self.mainCanvas.draw()
        ax.legend()
        ax.set_aspect('equal')
        ax.grid(True, which='both')
        ax.axhline(y=0, color='black')
        ax.axvline(x=0, color='black')
        ax.axis([xMin-1, xMax+1, yMin-1, yMax+1])
        plt.axes(self.mainAxes)
        plt.title("Click To Start")
        plt.subplots_adjust(left=0.4)
        
        self.doReset(True) 
        plt.show()
        
        
    def generateSecantsAndTangentLine(self):
        # Font is now globally set to 12. If changed then the
        # GUI element positions and dimensions will need to be changed.
        plt.rcParams['font.size']= '12'
        plt.rcParams["figure.figsize"] = (9,6)
        fig, ax = plt.subplots()
        self.fig = fig; self.mainAxes = ax
        fig.canvas.mpl_disconnect(fig.canvas.manager.key_press_handler_id)
           
        secant0, = ax.plot([], [], color='cyan',linewidth=2.0)  
        secant1, = ax.plot([], [], color='magenta',linewidth=2.0) 
        secant2, = ax.plot([], [], color='lime',linewidth=2.0) 
        self.secants = {'left':secant0,'right':secant1, 'central': secant2}
       
        secantP0Marker, = ax.plot([],[], 'o', color='black', markersize=10)
        secantLeftMarker, = ax.plot([],[],'o', color='cyan')
        secantRightMarker, = ax.plot([],[],'o', color='magenta')
        self.secantMarkers = {'left':secantLeftMarker, 
                              'p0': secantP0Marker,
                              'right':secantRightMarker}
        
        self.tangentLine, = ax.plot([], [], color='black',  linestyle='dashed')
        self.fig.suptitle('The Tangent Approximation App', fontsize=14,fontstyle='oblique')
        
        return fig.canvas
        
      
    def generateGUI(self):
        self.reseting = False
        panelColor = 'lightgoldenrodyellow'
        # The restart the secant button
        left = 0.05; bottom = 0.65; width = 0.0833; height = 0.05
        axes = plt.axes([left, bottom, width, height])
        self.stepReset_axes = axes
        self.stepResetButton = Button(axes, '$|\u25C0$', color='pink', 
                                      hovercolor='red')
    
        # The previous secant(s) step button
        left += 0.0833
        axes = plt.axes([left , bottom, width, height])
        self.stepBackward_axes = axes
        self.stepBackwardButton = Button(axes, '$\u25C0$', color='lime',
                                         hovercolor='green')
        
        # The next secant(s) step button
        left += 0.0833
        axes = plt.axes([left , bottom, width, height])
        self.stepForward_axes = axes
        self.stepForwadButton = Button(axes, '$\u25B6$', color='lime', 
                                       hovercolor='green')
            
        # The secant approximation mode buttons
        axes = plt.axes([0.05, 0.44, 0.25, 0.21], facecolor=panelColor)
        self.modeRadioButton_axes = axes
        self.modeRadioButtons = RadioButtons(axes, ('Left', 'Right',
                                                    'Left-Right', 'Central'))
        
        self.modeTextToModes = {'Left':     DifferentiationMode.LeftEndpt, 
                        'Right': DifferentiationMode.RightEndpt,
                        'Left-Right':DifferentiationMode.LeftAndRightEndpt,  
                        'Central': DifferentiationMode.CentralDifference}    
        
        # The display the exact (or Scipy calculated) tangent line checkbox
        axes = plt.axes([0.05, 0.2, 0.25, 0.15], facecolor=panelColor) 
        self.tangentLineCB_axes = axes
        if self.usingScipyD:
            cbStr = 'Show Scipy\nTangent Line'
        else:
            cbStr = 'Show Exact\nTangent Line'
        self.tangentLineCheckBox = CheckButtons(axes, [cbStr],[False])
        
        # The reset button
        axes = plt.axes([0.05, 0.12, 0.25, 0.05])
        self.resetButton_axes = axes
        self.resetButton = Button(axes, 'Reset', color='red', 
                                  hovercolor='green')
                                  
        axes = plt.axes([0.1, 0.01, 0.15, 0.05])
        self.quitButton_axes = axes
        self.quitButton = Button(axes, 'Quit', color='white', 
                                  hovercolor='green')
        
        #Text Boxes:
        #Used to enter value of x0 instead of by clicking
        axes = plt.axes([0.05, 0.84, 0.25, 0.06])
        self.enter_x0_TextBox_axes = axes
        self.enter_x0_TextBox = TextBox(axes, '$x_0$', "Enter x0")
        self.enter_x0_TextBox.on_submit(self.submitX0)
        
        # Display's the current selected tangent point
        axes = plt.axes([0.05, 0.76, 0.25, 0.06])
        self.output_pt0_TextBox_axes = axes
        self.output_pt0_TextBox = TextBox(axes, '$p_0$', '(x0,y0)?',
                                          color=panelColor)
        self.output_pt0_TextBox.set_active(False)
        
        # Display's the derivative at x0
        axes = plt.axes([0.05, .35, 0.25, 0.06])
        self.output_dfdx_TextBox_axes = axes
        self.output_dfdx_TextBox = TextBox(axes, '$\\frac{df}{dx}$ ', '?',
                                           color=panelColor)
        self.output_dfdx_TextBox.set_active(False)
        
              
    
    def doDrawLeftOrRightSecant(self, leftOrRight:str, x0:float, y0: float, 
                                      next_h:float):
        """Draws a right or left secant and returns its slope m"""
        
        (m, x, y, xVals, yVals) = generateLeftOrRightSecantSlopeAndPts(
                       self.func, x0, y0, next_h, self.xMin, self.xMax)
        # Replace the existing left or right secant's x,y-values with the generated values
        self.secants[leftOrRight].set_data(xVals, yVals)
        # Set the dot marking the secant's other defining point (next_x, next_y) and draws it
        self.secantMarkers[leftOrRight].set_data([x], [y])
        # redraw the secants and markers and set restore the main axes.
        self.mainCanvas.draw() 
        plt.axes(self.mainAxes)
        return m
    
          
    def doDrawCentralSecant(self, next_h): 
        """Draws a central secant and returns its slope m"""
        (m, xL, yL, xR, yR, xVals, yVals) = generateCentralSecantSlopeAndPts(
                            self.func, self.x0, next_h, self.xMin, self.xMax)
        
        # Replaces the existing central secant's x,y-values with the generated values 
        self.secants['central'].set_data(xVals, yVals) 
        # Sets the marking dots to the central secant's two defining pts 
        self.secantMarkers['left'].set_data([xL], [yL])
        self.secantMarkers['right'].set_data([xR], [yR])
        # redraw the secants and markers and set restore the main axes.
        self.mainCanvas.draw() 
        plt.axes(self.mainAxes)
        return m
    
      
    def drawSecant(self, hL:float, hR:float):
        """ Change xL or xR to be closer to x0 and draw the secant(s)
            determined by the current differentiation approximation mode.   
           """
        if not self.x0Entered: return 
        x0 = self.x0; y0 = self.y0
        mode = self.derivativeMode
        if mode == DifferentiationMode.LeftEndpt:
                m = self.doDrawLeftOrRightSecant('left', x0, y0, hL)
                title = "$L:m=${:.3g}, $h=${:.3g}".format(m, hL)
                plt.title(title, color='cyan')
        elif mode == DifferentiationMode.RightEndpt:
                m = self.doDrawLeftOrRightSecant('right', x0, y0, hR)
                title = "$R:m=${:.3g}, $h=${:.3g}".format(m, hR)
                plt.title("\n", loc='left', color='white')
                plt.title("\n", loc='right', color='magenta')
                plt.title(title, color='magenta')
        elif mode == DifferentiationMode.LeftAndRightEndpt:
                mL = self.doDrawLeftOrRightSecant('left',  x0, y0, hL)
                mR = self.doDrawLeftOrRightSecant('right', x0, y0, hR)
                m= (mL+mR)/2
    
                titleL = "$m_L=${:.3g}, $h_L=${:.3g}\n".format(mL,hL)
                titleR = "$m_R=${:.3g}, $h_R=${:.3g}\n".format(mR,hR)
                titleM = "$\\Rightarrow m_{AVE} \\approx $"+ "{:.3g}".format(m)  
                plt.title(titleL, loc='left', color='cyan')
                plt.title(titleM, loc='center', color='black')
                plt.title(titleR, loc='right',color='magenta')
        elif mode == DifferentiationMode.CentralDifference:
                h = min(abs(hL), abs(hR)) # Select the smaller change.
                # For Central Difference, x1 = x0-h < x0 < x0+h = x1
                m = self.doDrawCentralSecant(h)
                title = "$C:m=${:.3g}, $h =\pm$ {:.3g}".format(m, h)
                plt.title("\n", loc='left', color='white')
                plt.title("\n", loc='right', color='white')
                plt.title(title, color='lime')  
        else:
            print("Not yet implemented")
            
            
    def constrainX(self, x):
        """Constrains x to the function's domain"""
        if x < self.xMin: 
            x = self.xMin
        elif x > self.xMax:
            x = self.xMax
        return x
    
    
    def generateTangentLine(self, x0:float, y0:float):
        """Uses either the derivative passed by the user or scipy's 
           derivative algorithm to find the approximate derivative at x0
           and then plots the tangent line through (x0,y0)"""
        m = self.dfdx(x0)
    
        try:   
            self.output_dfdx_TextBox.set_val("{:.3g}".format(m))
            xT = np.linspace(self.xMin, self.xMax, 3)
            yT = secantline(xT, m, x0, y0)
            self.tangentLine.set_data(xT,yT)
        except RuntimeError:
            print("Error: The tangent is undefined at x0={:g}".format(x0))
    
        
    def doShowHideTangentLine(self):
        """Shows or hides the tangent line at (x0,y0)."""
        self.showTangentLine = self.tangentLineCheckBox.get_status()[0]
        if self.showTangentLine and self.x0Entered:
            self.generateTangentLine(self.x0, self.y0)
        else:
            self.tangentLine.set_data([],[])
        self.mainCanvas.draw()
                                      
                        
    def isTooSmall(self, h):
        return abs(h)<self.zeroTol
    
    
    def doNextStep(self):
        if not self.x0Entered:return
        if self.derivativeMode == DifferentiationMode.LeftEndpt:
            self.steps.append(self.hL)
            h = nextH(self.hL)
            if self.isTooSmall(h): return
            self.drawSecant(h, None)
            self.hL = h
        elif self.derivativeMode == DifferentiationMode.RightEndpt:
            self.steps.append(self.hR)
            h = nextH( self.hR)
            if self.isTooSmall(h): return
            self.drawSecant(None, h)
            self.hR = h
        else: # LeftAndRight or # Centeral Difference
            self.steps.append((self.hL, self.hR))
            h1 = nextH(self.hL); h2 = nextH(self.hR)
            if self.isTooSmall(h1) or self.isTooSmall(h2): return
            self.drawSecant(h1, h2)
            self.hL=h1; self.hR = h2
            
                                          
    def doPreviousStep(self):
        if self.x0Entered and len(self.steps) > 0:
            if self.derivativeMode == DifferentiationMode.LeftEndpt:
                self.hL = self.steps.pop()
                self.drawSecant(self.hL, None)
            elif self.derivativeMode == DifferentiationMode.RightEndpt:
                self.hR = self.steps.pop()
                self.drawSecant(None, self.hR)  
            else: # LeftAndRight or # Centeral Difference x = (x0+hL, x0+hR)
                self.hL, self.hR = self.steps.pop() 
                self.drawSecant(self.hL, self.hR)
        
                      
    def doStepReset(self):
        if self.x0Entered:
            self.steps.clear()
            x0=self.x0
            self.hL = self.xMin-x0;  self.hR = self.xMax-x0
            if self.derivativeMode == DifferentiationMode.LeftEndpt:
                self.drawSecant(self.hL, None)
            elif self.derivativeMode == DifferentiationMode.RightEndpt:
                self.drawSecant(None, self.hR)
            else: # LeftAndRight or # Centeral Difference
                self.drawSecant(self.hL, self.hR)
              
                    
    def doReset(self,resetPrompts:bool):
        if self.ending: return
        self.secants['left'].set_data([], [])
        self.secants['right'].set_data([], [])
        self.secants['central'].set_data([], [])
        self.secantMarkers['left'].set_data([],[])
        self.secantMarkers['p0'].set_data([],[])
        self.secantMarkers['right'].set_data([],[])
        self.tangentLine.set_data([],[])
        
        self.x0=None; self.y0=None
        self.hL=None; self.hR=None
        self.x1=self.xMin; self.y1=self.func(self.x1)
        self.x2=self.xMax; self.y2=self.func(self.x2)
        self.x0Entered = False
        self.steps.clear()
        plt.axes(self.mainAxes)
        if resetPrompts: 
            self.reseting = True
            self.enter_x0_TextBox.set_val("Enter x0")
            self.output_pt0_TextBox.set_val("(x0,y0)?")
            self.output_dfdx_TextBox.set_val("?")
            plt.title("Click To Start", color='black')
            self.reseting = False
        else:
            plt.title("\n", loc='left', color='white')
            plt.title("\n", loc='right', color='white')
            plt.title("")
        self.mainCanvas.draw()
        
    
    def drawX0(self, x0:float):
        x0 = self.constrainX(x0)
        y0 = self.func(x0)
        self.x0 = x0; self.y0 = y0
        self.hL = self.xMin-x0; self.hR = self.xMax-x0
        self.output_pt0_TextBox.set_val("$({:.3g},{:.3g})$".format(x0,y0))
        self.secantMarkers['p0'].set_data([x0],[y0])
        self.mainCanvas.draw()
        

    def doEnterX0(self, x0):
        if self.x0Entered: self.doReset(False)
        self.x0Entered = True
        self.enter_x0_TextBox.set_val("{:.6g}".format(x0))
        self.drawX0(x0)
        self.doShowHideTangentLine()
        if self.derivativeMode == DifferentiationMode.LeftEndpt:
            self.drawSecant(self.hL, None) 
        elif self.derivativeMode == DifferentiationMode.RightEndpt:
            self.drawSecant(None, self.hR) 
        else: # LeftAndRight or # Centeral Difference
             self.drawSecant(self.hL, self.hR)
             
             
    def doClose(self):
        self.ending = True
        self.fig.canvas.mpl_disconnect(self.cid)
        self.fig.canvas.mpl_disconnect(self.cidrelease)
        self.fig.canvas.mpl_disconnect(self.cidclose)
        print('Tangent Approximation App ending! Bye-Bye...')
        plt.close()
        sys.exit(0)
             
    def __call__(self, event):
        # Handle GUI events
        if event.name == 'close_event':
            self.doClose()
        elif event.inaxes == self.quitButton_axes:
            if event.name=='button_press_event':
                  self.doClose()
        elif event.inaxes == self.resetButton_axes:
            if event.name=='button_press_event':
                  self.doReset(True)  
            elif event.name == 'axes_enter_event':
                  self.resetButton.figure.canvas.draw()
        elif event.inaxes == self.tangentLineCB_axes:
            if event.name=='button_release_event':
                self.doShowHideTangentLine()
        elif event.inaxes == self.stepForward_axes:
            if event.name=='button_press_event':
                  self.doNextStep()  
        elif event.inaxes == self.stepBackward_axes:
            if event.name=='button_press_event':
                self.doPreviousStep()
        elif event.inaxes == self.stepReset_axes :
            if event.name=='button_press_event':
                self.doStepReset()
        elif event.inaxes == self.modeRadioButton_axes:
            if event.name=='button_release_event':
                modeText = self.modeRadioButtons.value_selected
                self.derivativeMode = self.modeTextToModes[modeText]
                self.doReset(False)      
        elif event.inaxes==self.mainAxes:
            if event.name=='button_press_event': 
                self.doEnterX0(event.xdata)
                

        
        
    def submitX0(self, resultStr):
        try:
            self.doEnterX0( float(resultStr) )
        except ValueError:
            if not self.reseting:
                self.enter_x0_TextBox.set_val("Number!")

          
   
if __name__ == '__main__':
    TangentApprox()
    