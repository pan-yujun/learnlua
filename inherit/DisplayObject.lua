local Object = require(".Object")
local class_id = 0
DisplayObject = Object:new()

-- 现在为止，DisplayObject只是Object的一个实例，注意以下代码
-- function DisplayObject:setClassId(num)
-- 	self.class_id = num
-- end
-- 类方法
function DisplayObject:setClassName(str)
	self.class_name = str
end

D1 = DisplayObject:new()
D1:setClassName("xiaoming")

D2 = DisplayObject:new()
D2:setClassName("hanmeimei")

D3 = DisplayObject:new()
D3:setClassName("lilei")

print(D1.class_id,"D1.ID = ")
print(D1.class_name,"D1.Name = ")
print(D2.class_id,"D2.ID = ")
print(D2.class_name,"D2.Name = ")
print(D3.class_id,"D3.ID = ")
print(D3.class_name,"D3.Name = ")
-- DisplayObject从Object继承了new方法，当new执行的时候，self参数指向DisplayObject。
-- 所以，D的metatable是DisplayObject，__index 也是DisplayObject。这样，D继承了DisplayObject，后者继承了Object。

---在Lua中面向对象有趣的一个方面是你不需要创建一个新类去指定一个新的行为。