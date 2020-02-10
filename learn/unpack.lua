local info={1,2,3,nil,"w",p=6,q=8,7}
local a,b,c,d,e,f=unpack(info)
print(a,b,c,d,e,f)
--print(unpack(info,3))  --遇到key不为数字则跳过，nil不跳过
------------unpack具体实现-------------
print(#info)  -- key不为number的不计算在里面
for i =1,#info do 
   print(info[i])
end