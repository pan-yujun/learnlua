-- 常规替换
x = string.gsub("hello world", "(%w+)", "lua")
print("\n",x)

-- 都用匹配的第一个串*2来替换
x = string.gsub("hello world", "(%w+)", "%1 %1")
print("\n",x)

-- 用匹配出的完成串*2来替换第一次匹配的结果
x = string.gsub("hello world", "%w+", "%0 %0", 1)
print("\n",x)

-- 使用一个完整匹配和一个匹配的第二个串来替换
x = string.gsub("hello world from c to lua", "(%w+) (%a+)", "%0 %2")
print("\n",x)

-- 调用系统函数来替换
x = string.gsub("os = $OS, pathext = $PATHEXT", "%$(%w+)", os.getenv)
print("\n",x)

-- 调用自定义函数
x = string.gsub("4 + 5 = $return 4+5$", "%$(.-)%$", function (s)
      return loadstring(s)()
    end)
print("\n",x)

-- 调用表来替换
local t = {name="lua", version="5.1"}
x = string.gsub("$name-$version.tar.gz", "%$(%w+)", t)
print("\n",x)