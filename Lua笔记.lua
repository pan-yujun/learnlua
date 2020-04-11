Lua笔记
-- 只读表
function readOnly(t)
    local proxy = {}
    local mt = {
        __index = t,
        __newindex = function(t, k, v)
            error('attempt to update a read-only table', 2)
        end
    }
    setmetatable(proxy, mt)
    return proxy
end
 
days = readOnly{'Sun', 'Mon', 'Tues', 'Wed', 'Thur', 'Fri', 'Sat'}
print(days[1])
days[2] = 'Noday' --> stdin:1: attempt to update a read-only table

--[[--
   只读表
]]
function TableLib.lock_write(t)
    local mt = getmetatable(t) or {};
    mt.__newindex = function(t,k,v)
        error(string.format("can't write [%s] into table",k))
    end;
    if not getmetatable(t) then
        setmetatable(t, mt);
    end
end

-- table表判空
function table_is_empty(t)
    return _G.next( t ) == nil
end

--[[--
    判断table是否为空
]]
function TableLib.is_empty(t)
    if t and type(t)=="table" then --FIXME 此句可以判空，为何还要循环表内元素？
        return next(t)==nil;
    end
    return true;
end