df = as.data.frame(matrix(nrow=91,ncol=5)) #创建一个dataframe用于存储结果
names(df)=c('date','yhat_max','yhat_max_time','yhat_min','yhat_min_time')
for(i in 1:91){
  temp=max_min[((i-1)*96+1):(i*96),];
  #real_max=max(temp$power);
  #real_min=min(temp$power);
  #得到原始序列的最大最小值
  pre_max=max(temp$power);
  pre_max_loc=which.max(temp$power);
  pre_max_time=temp$time[pre_max_loc];
  #预测序列最大值
  pre_min=min(temp$power);
  pre_min_loc=which.min(temp$power);
  pre_min_time=temp$time[pre_min_loc];
  #预测序列最小值
  df[i,1]=max_min[96*i,1];
  #df[i,2]=real_max;
  #df[i,3]=real_min;
  df[i,2]=pre_max;
  df[i,3]=pre_max_time;
  df[i,4]=pre_min;
  df[i,5]=pre_min_time;
}

#precesion=as.data.frame(matrix(nrow=2,ncol=2));
#names(precesion)=c('RMSE','MAPE');
#创建一个用于存储预测精度的dataframe

#MSE_max=sum(df$yhat_max-df$y_max)^2/nrow(df);
#RMSE_max=sqrt(MSE_max);
#计算最大值的RMSE

#MSE_min=sum(df$yhat_min-df$y_min)^2/nrow(df);
#RMSE_min=sqrt(MSE_min);
#计算最小值的RMSE

#MAPE_max=sum(abs((df$yhat_max-df$y_max)/df$y_max))/nrow(df);
#计算最大值的MAPE

#MAPE_min=sum(abs((df$yhat_min-df$y_min)/df$y_min))/nrow(df);
#计算最小值的MAPE

##precesion[1,2]=MAPE_max;
#precesion[2,1]=RMSE_min;
#precesion[2,2]=MAPE_min;

write.table (df, file ="91daysmax_min.csv", sep =",")
