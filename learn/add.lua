--两表相连  字符串记得打上双引号
local cjson = import("babe/encoding/json")
function table_maxn(t)
    local mn = 0
    for k, v in pairs(t) do
        if mn < k then
            mn = k
        end
    end
    return mn
end
-- 两表相加操作
mytable2 = setmetatable({ 111, "sd", 333 }, {
  __add = function(mytable2, newtable)
    for i = 1, table_maxn(newtable) do
      table.insert(mytable2, table_maxn(mytable2)+1,newtable[i])
    end
    return mytable2
  end
})
secondtable = {1,"fsd",3}
mytable2 = mytable2 + secondtable
for k,v in ipairs(mytable2) do
	print(k,v)
end