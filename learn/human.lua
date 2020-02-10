---------------测试模拟对象----------------------
require(".object")
local Human = class()
Human.ctor = function(self)
	self.m_type = "human"
	print("Human's type")
end
Human.dtor = function(self)
	print("deleted")
end
Human.speak = function(self)
	print("I am a " .. self.m_type)
end

local Man = class(Human, true)
Man.ctor = function(self, name)  --会覆盖父类的构造函数，解决方法：删除掉class类的__newindex关键字(__newindex用于更新table中的数据)
	self.m_sex = "m"
	self.m_name = name
	print("Man's sex")
end
local xiaoming = new(Man,true)
xiaoming:speak()