
function formatnumberthousands(num)
	local function checknumber(value)
		return tonumber(value) or 0
	end
	local formatted = tostring(checknumber(num))
	local k
	while true do
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
		print(formatted,k)
		if k == 0 then 
			break end
		end
	return formatted
end
local num = 123456789
local str = formatnumberthousands(num)
print(str)