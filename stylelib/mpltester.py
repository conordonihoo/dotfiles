import matplotlib.pyplot as plt
import numpy as np

# plotting function
def plotfuncs(style):
    plt.style.use(style)
    x = np.linspace(0,10,101)
    for i in range(10):
        y = 0.5*(i + 1)*np.exp(i/10 + x)
        plt.plot(x,y,label=r'$y_{' + str(i) + r'}: \alpha = ' + str(0.5*(i + 1)) + r', \beta = ' + str(i/10) + r'$')
    stylename = ''
    for i,s in enumerate(style):
        if (i > 0):
            stylename += '-'
        stylename += s
    plt.title('Testing: ' + stylename)
    plt.xlabel(r'$x$')
    plt.ylabel(r'$y = \alpha e^{(\beta + x)}$')
    plt.legend()
    plt.show()

# light style
plotfuncs(['background_light'])
# dark style
plotfuncs(['background_dark'])
# solar-light style
plotfuncs(['color_solar', 'background_light'])
# solar-dark style
plotfuncs(['color_solar', 'background_dark'])
