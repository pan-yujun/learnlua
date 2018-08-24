--package.path = package.path .. ";?.lua"     --模板式的路径 ?的地方由require函数中获得
local requiredpackage = require("G")  --这行是必须得要的　
for k,v in pairs(package.loaded) do
	package.loaded[k] = nil
end
package.loaded.G = nil
function Vprint()
	print("main print!")
end
Vprint()
local requirecomplex = {}  --声明一个对象
requirecomplex = complex   --创建该对象
requirecomplex.Vprint()