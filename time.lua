local curTime = os.tiome()
local endTime= curTime + 183
local leftTime = os.difftime(EndTime,curTime)
print("leftTime == ", leftTime)
local mins = leftTime/60
print("mins == ", mins)