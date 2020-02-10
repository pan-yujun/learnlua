-- 元表的回溯寻找
local a = {}
local b = {q = "111"}
local c = {w = "222"}
setmetatable(a, {__index = b})
setmetatable(b, {__index = c})
print(a.q,a.w)
setmetatable(a, {
    __newindex = function(table, key, value) --此方法可以新建表a中没有的键值
    print(key)
    print(value)
    end
})
a.e= "333" -- 这条会去执行表a的__newindex方法