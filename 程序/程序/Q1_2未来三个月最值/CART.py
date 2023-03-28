from sklearn import tree#决策树模型
from sklearn.model_selection import train_test_split#划分测试训练集
from sklearn.model_selection import GridSearchCV#用于找到最优模型参数
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
hb=pd.read_csv('123.csv')
#特征属性选择
weather_type=hb['天气状况']
max_temp=hb['最高温度']
min_temp=hb['最低温度']
day_wind=hb['白天风力风向']
night_wind=hb['夜晚风力风向']
add01=hb['一年第几天']
add02=hb['一年第几周']
add03=hb['时间段']
add04=hb['小时']
add05=hb['天']
add06=hb['weekday']
#选择自变量与因变量
X=pd.concat([weather_type,max_temp,min_temp,day_wind,night_wind,add01,add02,add03,add04,add05,add06],axis=1)
Y=hb['总有功功率（kw）']
print(len(weather_type))
print(len(X))
print(len(Y))
#划分训练集测试集
Xtrain,Xtest,Ytrain,Ytest=train_test_split(X,Y,test_size=0.7,random_state=420)
dtr=tree.DecisionTreeRegressor(criterion='squared_error',max_depth=9)#建立决策树
dtr.fit(Xtrain,Ytrain)#训练决策树
pred=dtr.predict(Xtest)#预测结果
fig=plt.figure(figsize=(15.6,7.2))
ax=fig.add_subplot(111)
s1=ax.scatter(range(len(pred)),pred,facecolors='red',label="yuce")
s1=ax.scatter(range(len(Ytest)),Ytest,facecolors='blue',label="shiji")
plt.ylabel('power',frontsize=15)
plt.xlabel('number',frontsize=15)
plt.legend()
np.savetxt('future3y',(pred))
future3yue=np.loadtxt('future3y')
from sklearn import metrics
def evalmape(pred, Ytest):
    err = abs((Ytest-pred)/Ytest)
    err[(Ytest==0)] = 0
    err = np.mean(err)*100
    return err
def evalsmape(pred, Ytest):
    err = abs(Ytest-pred)/(abs(Ytest+pred)/2)
    err[(Ytest==0)] = 0
    err = np.mean(err)*100
    return err
print('MSE: %6.2f' % metrics.mean_squared_error(Ytest,pred,multioutput='uniform_average'))
print('RMSE: %6.2f' % np.sqrt(metrics.mean_squared_error(Ytest,pred,multioutput='uniform_average')))
print('MAE: %6.2f' % metrics.mean_absolute_error(Ytest,pred))
print('MAPE: %.2f%%' % (evalmape(pred, Ytest)))
print('SMAPE: %.2f%%' % (evalsmape(pred, Ytest)))