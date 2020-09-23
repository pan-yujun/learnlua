function sleep( n )
    local t0 = os.clock()
    while(os.clock() - t0 < n) do
    end
    return 
end

local function send(p)
    print("product send : ", p)
    coroutine.yield(p)
end
local product = coroutine.create(function()
    local i = 0
    while(true) do
        sleep( 1 )
        i = i + 1
        local p = i--io.read()
        send(p)

        -- 判断生产停止条件
        if  i >= 5  then
            coroutine.yield()
            break
        end
    end
end)
local function receive(co)
    local ok, res = coroutine.resume(co)
    if ok then
        print("consumer received : ", res)
    else
        print("consumer receive failed : ", res)
    end
    return ok
end
local function consumer(co)
    while (true) do
        local ok = receive(co)
        if not ok then
            print("消费失败退出循环")
            break
        end
    end
end
consumer(product)