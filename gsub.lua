-- �����滻
x = string.gsub("hello world", "(%w+)", "lua")
print("\n",x)

-- ����ƥ��ĵ�һ����*2���滻
x = string.gsub("hello world", "(%w+)", "%1 %1")
print("\n",x)

-- ��ƥ�������ɴ�*2���滻��һ��ƥ��Ľ��
x = string.gsub("hello world", "%w+", "%0 %0", 1)
print("\n",x)

-- ʹ��һ������ƥ���һ��ƥ��ĵڶ��������滻
x = string.gsub("hello world from c to lua", "(%w+) (%a+)", "%0 %2")
print("\n",x)

-- ����ϵͳ�������滻
x = string.gsub("os = $OS, pathext = $PATHEXT", "%$(%w+)", os.getenv)
print("\n",x)

-- �����Զ��庯��
x = string.gsub("4 + 5 = $return 4+5$", "%$(.-)%$", function (s)
      return loadstring(s)()
    end)
print("\n",x)

-- ���ñ����滻
local t = {name="lua", version="5.1"}
x = string.gsub("$name-$version.tar.gz", "%$(%w+)", t)
print("\n",x)