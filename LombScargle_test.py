
# coding: utf-8

# In[1]:


import numpy as np
rand = np.random.RandomState(42)
t = 100 * rand.rand(100)
y = np.sin(2 * np.pi * t) + 0.1 * rand.randn(100)


# In[2]:


from astropy.stats import LombScargle


# In[3]:


frequency, power = LombScargle(t, y).autopower()


# In[4]:


import matplotlib.pyplot as plt  


# In[5]:


plt.plot(frequency, power)  


# In[6]:


dy = 0.1
frequency, power = LombScargle(t, y, dy).autopower()


# In[7]:


dy = 0.1 * (1 + rand.rand(100))


# In[8]:


dy = 0.1 * (1 + rand.rand(100))
y = np.sin(2 * np.pi * t) + dy * rand.randn(100)
frequency, power = LombScargle(t, y, dy).autopower()


# In[9]:


import astropy.units as u
t_days = t * u.day
y_mags = y * u.mag
dy_mags = y * u.mag
frequency, power = LombScargle(t_days, y_mags, dy_mags).autopower()
frequency.unit
power.unit


# In[10]:


frequency


# In[11]:


power


# In[12]:


frequency, power = LombScargle(t, y, dy).autopower(nyquist_factor=2)


# In[13]:


len(frequency), frequency.min(), frequency.max() 


# In[14]:


frequency, power = LombScargle(t, y, dy).autopower(nyquist_factor=10)
len(frequency), frequency.min(), frequency.max() 


# In[15]:


frequency = np.linspace(0.5, 1.5, 1000)


# In[16]:


power = LombScargle(t, y, dy).power(frequency)


# In[17]:


frequency = np.linspace(0.1, 1.9, 100)
power = LombScargle(t, y, dy).power(frequency)
plt.plot(frequency, power) 


# In[18]:


frequency, power = LombScargle(t, y, dy).autopower(minimum_frequency=0.1,
                                                   maximum_frequency=1.9)


# In[19]:


len(frequency)


# In[20]:


plt.plot(frequency, power) 


# In[21]:


len(frequency)


# In[22]:


best_frequency = frequency[np.argmax(power)]


# In[23]:


t_fit = np.linspace(0, 1)


# In[24]:


y_fit = LombScargle(t, y, dy).model(t_fit, best_frequency)


# In[25]:


plt.plot(t_fit, y_fit)


# In[26]:


ls = LombScargle(t_days, y_mags, normalization='psd')


# In[ ]:


def fourier_periodogram(t, y):
    N = len(t)
    frequency = np.fft.fftfreq(N, t[1] - t[0])
    y_fft = np.fft.fft(y.value) * y.unit
    positive = (frequency > 0)
    return frequency[positive], (1. / N) * abs(y_fft[positive]) ** 2


# In[ ]:


t_days = np.arange(100) * u.day
y_mags = rand.randn(100) * u.mag
frequency, PSD_fourier = fourier_periodogram(t_days, y_mags)


# In[ ]:


ls = LombScargle(t_days, y_mags, normalization= 'psd')


# In[ ]:


ls.false_alarm_probability(power.max(), method='baluev')  

