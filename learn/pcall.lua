local n = nil
function fun()
	error({error = "****"}) -- 被包装函数抛出错误信息
end
--[[
local isRun,errorMsg = pcall(fun)--pcall包装fun()函数,返回bool，错误信息
if (isRun) then
	print(isRun)
else
	print(isRun,errorMsg.error)
end
]]--
function fun1()   --错误处理函数，打印调用栈信息
	print(debug.track())
end
local isRun = xpcall(fun,fun1)
print(xpcall(fun,fun1))


