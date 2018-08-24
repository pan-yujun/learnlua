-- 打印协程1和协程2的状态
function status()
    print("co1's status :"..coroutine.status(co1).." ,co2's status: "..coroutine.status(co2))
end
 
-- 协程1
co1 = coroutine.create(function ( a )
    print("co1 arg is :"..a)
    status()
 
	-- 唤醒协程2
	local stat,rere = coroutine.resume(co2,"2")		--返回数据为bool，yield返回的数据
    print("111 co2 resume's return is "..rere)
    status()
 
	-- 再次唤醒协程2
	local stat2,rere2 = coroutine.resume(co2,"4")
    print("222 co2 resume's return is "..rere2)
    local arg = coroutine.yield("6")
end)
 
-- 协程2
co2 = coroutine.create(function ( a )
    print("co2 arg is :"..a)
    status()
    local rey = coroutine.yield("3")
    print("co2 yeild's return is " .. rey)
    status()
    coroutine.yield("5")
end)
 
--主线程执行协程co1,传入字符串“main thread arg”
stat,mainre = coroutine.resume(co1,"main thread arg")
status()
print("last return is "..mainre)


--[[输出
co1 arg is :main thread arg							-- 开始执行协程1，第8行
co1's status :running ,co2's status: suspended		-- 协程1中，第9行，调用了status()函数
co2 arg is :2										-- 协程1中，第12行，调用了resume()，唤醒协程2，调用到24行
co1's status :normal ,co2's status: running			-- 注意：此时协程1处于normal状态，协程2处于running状态
111 co2 resume's return is 3						-- 由于26行，协程2执行了yiled(),协程挂起，参数“3”被返回到协程1，赋值给了12行中resume()的第二个参数，在13行进行此打印
co1's status :running ,co2's status: suspended		-- 此时协程1被唤醒，处于running状态，协程2处于挂起状态
co2 yeild's return is 4					            -- 由于17行，协程2被再次唤醒，由于不是第一次调用resume()，参数“4”被赋值给上次26行的yiled()的返回值，打印出来，此时是27行的
co1's status :normal ,co2's status: running			-- 同第一次，此时协程1处于normal状态，协程2处于running状态
222 co2 resume's return is 5						-- 由于第29行执行yield完毕，参数5作为17行的resume()的返回值，在18行进行了打印，注意此时协程2仍未结束，处于挂起状态
co1's status :suspended ,co2's status: suspended	-- 由于第19行，执行了yield()，参数“6”被返回给33行的mainre，注意：此时协程1挂起，同样也未执行完
last return is 6									-- 最终35行进行了打印，mainre的值，也就是resume()的第二个返回值其实就是yidld()的参数
]]--