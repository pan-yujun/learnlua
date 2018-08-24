local a = {}
setmetatable(a, {
    __newindex = function(table, key, value) 
	print(table)
    print(key)
    print(value)
    end
})
a.a = 10
a.w = "fsfs"
--会打印出 a 10