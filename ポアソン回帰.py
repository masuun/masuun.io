from turtle import color
import numpy as np
from scipy import stats

import pandas as pd
import matplotlib.pyplot as plt
from sklearn import linear_model



def linear_inv(w, x):
    return np.exp(w[0] + w[1] * x)
w = [0.5, 0.2]
#w = [0.5, 0.5]
# サンプルデータ
np.random.seed(42)
size= 200
x_min, x_max = 3, 10
X = np.random.uniform(x_min, x_max, size)
y_cond=1
while y_cond:
    y = np.random.poisson(linear_inv(w, X), size)
    y_cond = np.any(y==0)
    print(sum((y==0)))

# 作ったサンプルデータと真の関数を可視化する
x = np.linspace(x_min, x_max, 100)
lam = linear_inv(w, x)
plt.plot(x, lam, color='red',  label='TrueFunction')
plt.plot(x, lam+np.sqrt(lam), color='red', label='TrueFunction')
plt.plot(x, lam-np.sqrt(lam), color='red', label='TrueFunction')
plt.scatter(X, y, color='blue', alpha=0.5, label='ToyData')
#plt.legend()
plt.show()

df = pd.DataFrame([X, y]).T.rename({0:'x',1:'y'},axis=1)
# df['x_round']=df['x'].apply(lambda x:np.round(x,1))
# for i in range(x_min, x_max):
#     plt.hist( df[df['x_round']==i]['y'])
#     plt.title(np.exp(w[0]+w[1]*i))
#     plt.show()


lr = linear_model.LinearRegression()
df['logy']=  np.log(df['y'])
lr.fit(df[['x']],df['logy'])
print([lr.intercept_,lr.coef_[0]])
pr = linear_model.PoissonRegressor(alpha=0,  fit_intercept=True,   max_iter=300)
pr.fit(df[['x']],df['y'])
print([pr.intercept_,pr.coef_[0]])

plt.scatter(X, y, color='blue', alpha=0.5)
plt.plot(x, lam, color='red',  label='True')
plt.plot(x, lam+np.sqrt(lam), color='red', label='True+sd',  linestyle='dashed')
plt.plot(x, lam-np.sqrt(lam), color='red', label='True-sd',  linestyle='dashed')
plt.scatter(X, np.exp(lr.predict(df[['x']])), color='green',label='RMSE')
plt.scatter(X, pr.predict(df[['x']]), color='yellow',label='Likely')
plt.legend()
plt.show()

