RepData_PeerAssessment1
========================================================

##Loading and preprocessing the data

```r
data<-read.csv("activity.csv")
```

```
## Warning: cannot open file 'activity.csv': No such file or directory
```

```
## Error: cannot open the connection
```

##The total number of steps taken per day

```r
total_steps<-aggregate(steps~date, data=data, na.rm=T)
```

```
## Error: cannot coerce class ""function"" to a data.frame
```

```r
hist(total_steps$steps)
```

```
## Error: object 'total_steps' not found
```

##The mean and median total number of steps

```r
mean_steps<-mean(total_steps$steps)
```

```
## Error: object 'total_steps' not found
```

```r
median_steps<-median(total_steps$steps)
```

```
## Error: object 'total_steps' not found
```


##The average daily activity pattern

```r
aver_pattern<-aggregate(steps~interval, data=data, FUN=mean)
```

```
## Error: cannot coerce class ""function"" to a data.frame
```

```r
plot(aver_pattern, type="l",main="Average Daily Activity Pattern", xlab="5 Mins Intervals Daily", ylab="Average Steps All Days")
```

```
## Error: object 'aver_pattern' not found
```

##Imputing missing values
###Total number of missing values

```r
missing_total<-sum(is.na(data))
```

```
## Warning: is.na() applied to non-(list or vector) of type 'closure'
```

###Create a vector store steps with NAs

```r
imputed_steps<-numeric()
for(i in 1:nrow(data)){
x<-data[i,]
if (is.na(x$steps)){
y<-sbuset(aver_pattern,interval==x$interval)$steps
}
else
{
y<-x$steps
}
imputed_steps<-c(imputed_steps,y)
}
```

```
## Error: argument of length 0
```

###Create a new dataset equal to the original dataset with the missing data

```r
imputed_data<-data
imputed_data$steps<-imputed_steps
```

```
## Error: object of type 'closure' is not subsettable
```

```r
imputed_steps_perday<-aggregate(steps~date, data=imputed_data, FUN=sum)
```

```
## Error: cannot coerce class ""function"" to a data.frame
```


```r
hist(imputed_steps_perday$steps, breaks=nrow(imputed_steps_perday),main="Total Steps Per Day with Imputed",xlan="Steps perday",col="red")
```

```
## Error: object 'imputed_steps_perday' not found
```

###Mean median total number of steps per day

```r
mean_imputed_steps<-mean(imputed_steps_perday$steps)
```

```
## Error: object 'imputed_steps_perday' not found
```

```r
median_imputed_steps<-median(imputed_steps_perday$steps)
```

```
## Error: object 'imputed_steps_perday' not found
```

##Differences in activity patterns between weekdays and weekends

```r
imputed_data$date<-as.date(imputed_data$date)
```

```
## Error: could not find function "as.date"
```

```r
weekend<-c("Sat","Sun")
imputed_data$daytype<-as.factor(sapply(imputed_data$date,function(x) ifelse(weekdays(x) %in% weekend,"weekend","weekday")))
```

```
## Error: object of type 'closure' is not subsettable
```


```r
require(plyr)
```

```
## Loading required package: plyr
```

```r
average_steps<-ddply(imputed_Data,.(interval,daytype), summarize,  steps=mean(steps))
```

```
## Error: object 'imputed_Data' not found
```

```r
require(lattice)
```

```
## Loading required package: lattice
```

```r
xyplot(steps~interval | daytype, data=average_steps, layout=c(1,2),type="l",xlanb="5 mins intervals over day", ylab="Number of steps", main="Activity Patterns on weekdays and weekends")
```

```
## Error: object 'average_steps' not found
```
