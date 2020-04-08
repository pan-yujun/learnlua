--  main.lua
function reload_module(module_name)
    local old_module = _G[module_name]

    package.loaded[module_name] = nil
    require (module_name)

    local new_module = _G[module_name]
    for k, v in pairs(new_module) do
        old_module[k] = v
    end

    package.loaded[module_name] = old_module
end

function reload()
    local ms = {"testMoudle"}
    for k, v in pairs(ms) do
        reload_module(v)
    end
end

-- 测试
function sleep(t)
	local now_time = os.clock()
	while true do
		if os.clock() - now_time > t then
	    	reload()
	    	return 
		end
	end
end

require "testMoudle"
function mainloop()
    local ret = testMoudle.func(10, 10)
    print ("ret = ",ret)
end
print("start runing")
while true do
	mainloop()
	sleep(3)
end