--[[
xpcall(
	function(i) 
		print(i) 
		error('error..') 
	end, 
	function() 
		print(debug.traceback()) 
	end, 
33)
]]--

f=function(...) error(...) end  -- 被包装函数抛出错误信息
print(pcall(f, 123))            -- pcall包装f()函数,返回bool，错误信息
print("-------------------------------------")
xpcall(f, 
	function(e)                 --错误处理函数，打印调用栈信息
		print(debug.traceback()) 
		return e 
	end, 
123)