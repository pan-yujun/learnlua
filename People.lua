-- 面向对象与继承
local People = {
    name = ''
}

function People:say()
    print('people '  .. self.name)
end

function People:new(name)
    local o = {name = name}
    setmetatable(o, {__index = self})

    return o
end

local Teacher = {
}
function Teacher:sayup()
    print('teacher ' .. self.name)
end
setmetatable(Teacher, {__index = People})

local xiaohua = People:new('xiaohua')
xiaohua:say() 
local xiaoming = Teacher:new('xiaoming')
xiaoming:say() 
xiaoming:sayup() --打印出 teacher xiaoming