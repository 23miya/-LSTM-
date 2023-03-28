tb= as.data.frame(matrix(ncol=4));#创建一个dataframe用于存储结果
names(tb)=c('突变时间','突变绝对量','突变相对量','突变符号');
data <- read_csv("C:/Users/hdw/Desktop/tidy/R/tb/shang04_min.csv")
power_diff_previous=data[1:(nrow(data)-1),2];
power_diff_present=data[2:nrow(data),2];
change=power_diff_present-power_diff_previous;
change_sign=matrix(nrow=nrow(change),ncol=1);
for(i in 1:nrow(change)){
  if(change[i,1]>0){
    change_sign[i,1]=1;
  }
  else{
    change_sign[i,1]=-1;
    }
}
limit=0.75;
loc=matrix(nrow=1);
n=0;
change_relative=abs(change)/power_diff_previous;
for(i in 1:(nrow(data)-1)){
  if(change_relative[i,1]>limit){
    n=n+1;
    tb[n,1]=data$数据时间[i+1];
    tb[n,2]=abs(change[i,1]);
    tb[n,3]=change_relative[i,1];
    tb[n,4]=change_sign[i,1];
  }
}
tb
write.table (tb, file ="C:/Users/hdw/Desktop/tidy/R/tb/tbshang04_min.csv", sep =",")