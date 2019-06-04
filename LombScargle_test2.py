import numpy as np
from astropy.stats import LombScargle

rand = np.random.RandomState(42)
t = 100 * rand.rand(60)
dy = 1.0
y = np.sin(2 * np.pi * t) + dy * rand.randn(60)
ls = LombScargle(t, y, dy)
freq, power = ls.autopower()
print(power.max()) 
print(ls.false_alarm_probability(power.max()))
probabilities = [0.1, 0.05, 0.01]
print(ls.false_alarm_level(probabilities))
#print(ls.false_alarm_probability(power.max(), method='bootstrap'))

frequency, power = LombScargle(t, y).autopower(method='fastchi2')

print(power)

