Object = {class_id = 0,class_name = ""}
function Object:new(o)
    o = o or {}
    setmetatable(o,self) -- 对象o调用不存在的成员时都会去self中查找，而这里的self指的就是Object
    self.__index = self
	return o
end
function Object:setClassId(num)
	self.class_id = num
end

return Object