import numpy as np
from astropy.stats import LombScargle
import csv
import scipy.io as sio
import matplotlib.pyplot as plt  

mat_contents = sio.loadmat('/home/aldo/Documents/Projects/Avtivemeter/Data/code_cruze_paper/Re actimetry/data_acti_4days.mat')

t = mat_contents['tt_4']
y = mat_contents['yy_4']

t = t.flatten()
y = y.flatten()
dy = 0.1

ls = LombScargle(t, y, dy)
freq, power = ls.autopower()
print(power.max()) 
print(ls.false_alarm_probability(power.max()))

plt.plot(freq, power)

best_frequency = frequency[np.argmax(power)]
t_fit = np.linspace(0, 1)
y_fit = LombScargle(t, y, dy).model(t_fit, best_frequency)

print("Now using fastchi2")
frequency, power = LombScargle(t, y).autopower(method='fastchi2')

print(power.max())
print(ls.false_alarm_probability(power.max()))
