home = "hubei";
print(home);
print(_G.home);-- 全局变量存放在_G中
print(_G["home"]);

--私有函数
local function myPrivateFunction()
  print("this is a private function!")
end
--共有接口
function Vprint()
  myPrivateFunction()
  print("this is a public function!")
  print("This is a required package!")
end
Vprint()
--标识类名 创建一个类　
complex = {Vprint = Vprint}