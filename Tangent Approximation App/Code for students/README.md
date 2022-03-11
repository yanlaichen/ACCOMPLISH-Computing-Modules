```
from matplotlib import pyplot as plt
import numpy as np
# Set the domain
xMin = -np.pi; xMax = np.pi
# Use numpy to generate 200 x-value
x = np.linspace(-np.pi, np.pi, 200)
# Generate the function's values
y = x + np.sin(3*x)
# Generate the derivative's values
dydx = 1+ 3*np.cos(3*x)
# Determine the range minimum and maximum
yMin = np.min([y, dydx]); yMax = np.max([y, dydx])
# Begin the plot
fig, ax = plt.subplots()
# Plot the function's derivative with a LaTeX label
ax.plot(x, dydx, color='red', linewidth=1, 
        label= "$\\frac{dy}{dx}=1+3\cos(3x)$")
# Plot the function with a LaTeX label
ax.plot(x, y, color='black', linewidth=2, 
        label= "$y=x+\sin(3x)$")
# Show the legend
ax.legend()
# Set graph's x-axis and y-axis limits
ax.axis([xMin, xMax, yMin, yMax])
# Make the axes scaling equal
ax.set_aspect('equal')
ax.grid(True, which='both')
# Highlight the x-axis and y-axis
ax.axhline(y=0, color='black')
ax.axvline(x=0, color='black')
# Add a title to the plot
ax.set_title("An Example Matplotlib Plot", fontsize=16,
              color='magenta')
# Show the plot
plt.show()
```
