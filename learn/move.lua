-----测试lua的取余和整除------
print(4%2)
print(4/2)
print(10/3)
print(6.0/3)
print(6/3.0)
------删偶方法一------
local a = {1,2,3,4,5,6}
local b = {}
for k,v in pairs(a) do
	if v%2 == 0 then
	
	else
		table.insert(b,v)
	end
end
for k,v in pairs(b) do
	print(k,v)
end
------删偶方法二------
local c = {1,2,3,4,5,6,2}
for i= #c-1,1,-1 do
	if c[i]%2 == 0 then
	    --此处删除键或者值都可以
		table.remove(c,i)
		--table.remove(c,c[i])
	end
end
for k,v in pairs(c) do
	print(k,v)
end