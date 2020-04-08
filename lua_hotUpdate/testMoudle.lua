--[[--ldoc desc
@module testMoudle
@author PomeloPan
]]
-- moudle用法：https://blog.csdn.net/ykr168age/article/details/77164187
module(..., package.seeall)

function func(a, b)
    return a * b -- 改为 a + b 再次调用
end