local a = {}
a.asd = "ddd"
function a:new(b)
        b = b or {}
        return setmetatable(b, {
                __index = self         --将__index原方法设为自己，则自己可以被看成对象
        })
end
function a.fuck()
        print("hehe,just a joke")
end
--c = a.new(a)
local c = a:new()--两种写法都行，: 调用相当于传入了自己
c.fuck()
c.fuck = "jjjj"
print(c.fuck)
a.fuck()