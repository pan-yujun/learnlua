--元表	
other = { foo = 5 } 
t = setmetatable({}, { __index = other }) 
print(t.foo)
--原方法
mytable = setmetatable({key1 = "value1"}, {
  __index = function(mytable, key)
    if key == "key2" then
      return "value2 in metatable"
    else
      return nil
    end
  end
})
print(mytable.key1,mytable.key2)
