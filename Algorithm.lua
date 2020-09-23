--[[--ldoc desc
@module Scene1Scene
@author KayWang
]]

local dump = import("bos.utils").dump

-- 交换
local function swap(m,n,t)
	if not type(m) == "number" or not type(n) == "number" or not type(t) == "table" then return end
	local temp = t[m]
	t[m] = t[n]
	t[n] = temp
end
-- 冒泡
local function MaopaoSort(a)
    if not type(a) == "table" then return end
    local b = {}
    for k,v in pairs(a) do
        if type(v) == "number" then
        	table.insert(b,v)
        end
    end
    
    for i = #b,2,-1 do
        for i = 2,i do
			if (b[i]<b[i-1]) then
				swap(i,i-1,b)
			end
		end
    end
    dump(b,"MaopaoSort b == ")
end


local function parttion(left,right,a)
    local povit = left
    local index = left + 1
    for i = index,right do
        if(a[i]<a[povit]) then
        	swap(index,i,a)
            index = index + 1
        end
        --dump(index,"index == ")
    end
    swap(povit,index-1,a)
    return index - 1
end
local function QuickSort(left,right,a)
    if not type(a) == "table" then return end
    if not (left < right) then return end
    local index = parttion(left,right,a)
    if index>1 and index < #a then
		QuickSort(1,index - 1,a)
		QuickSort(index + 1,#a,a)
    end
    dump(a,"QuickSort a == ")
end

--运行
function main()
    local a = {2,5,8,1,3,9,0}
    --MaopaoSort(a)
    QuickSort(1,#a,a)
end
main()
