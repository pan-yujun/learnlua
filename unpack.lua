local info={1,2,3,nil,5,p=6,7}
local a,b,c,d,e,f=unpack(info)
print(a,b,c,d,e,f)
print(unpack(info,3))  --遇到key不为数字则跳过，nil不跳过