# -LSTM-
基于 LSTM 循环神经网络的电力系统负荷预测分析。
建立 CART 回归树以及 LSTM 模型对该地区未来 10 天间隔 15 分钟负荷以及未来 3 个月负荷最大最小值进行预测。
将行业数据分为大工业用电最大值、大工业用电最小 值；非普工业最大值、非普工业最小值；普通工业最大值、普通工业最小值； 
商业最大值、商业最小值八个数据集分别进行研究，采用设定阈值的方法得出 每个行业最大值和最小值负荷突变点;
根据每个突变点的时间和量级都做了原因分析。
分别采用了 CART 回归树、LSTM 模型以及 KNN 算法对八个数据集进行负荷预测，对比三个模 型的预测精度发现 LSTM 模型效果最佳。
