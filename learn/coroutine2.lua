function foo(a)
	print("foo", a)
	return coroutine.yield(2 * a)
end
 
co = coroutine.create(function ( a, b )
	print("co-body", a, b)						--第一次唤醒
	local r = foo(a + 1)                    	--第一次唤醒挂起
	print("co-body2", r)						--第二次唤醒
	local r, s = coroutine.yield(a + b, a - b)	--第二次唤醒挂起
	print("co-body3", r, s)
	return b, "end"
end)
 
print("main", coroutine.resume(co, 1, 10))  --传入的参数为协程和该协程运行所需参数，返回值为bool和yield传入的参数
print("main2", coroutine.resume(co, "r"))
print("main3", coroutine.resume(co, "x", "y"))--协程运行结束
print("main4", coroutine.resume(co, "x", "y"))

--[[
co-body	1	10								-- 协程co的第7行，此时resume()传入的参数是赋值给了函数的
foo	2										-- 在第8行里面调用了函数foo()，执行到第2行的打印
main	true	4							-- 由于函数foo()的第3行yield()执行后挂起，参数是4，作为第15行的resume()的第二个返回值，最终打印了出来，到此，第15行执行完毕
co-body2	r								-- 第16行resume()再次唤醒协程co，接着上次yield()的地方继续执行，参数“r"被赋值给上次yield()的返回值，在第9行打印出来
main2	true	11	-9						-- 在第10行yiled()后再次挂起协程co，并返回，此时参数a和b还是第一次resume()时的参数，1，10，所以yield()两个参数分别为11，-9，作为resum()的第二个返回值，最终被打印出来，到此，第16行执行完毕
co-body3	x	y							-- 第17行resume()再次唤醒协程co,传入的参数“x”，“y”被赋值给上次的yield()函数的返回值，即赋值给第10行的r,s,在第11行被打印出来
main3	true	10	end						-- 协程co在第12行返回，注意此时参数b仍然是第一次resume()时的参数2，值为10，至此协程co执行结束，变为dead状态，最终在第17行打印出来
main4	false	cannot resume dead coroutine-- 第18行尝试再次resume()协程co，由于协程co已经为dead状态，所以直接返回并报错
]]--