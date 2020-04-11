require ("object")
local A = class()  
A.m_value = 1  
A.test = function ( self )  
	print("A->",self)  
	print("aaaa"..self.m_value)   
end   

local B = class(A)
B.m_value = 2
B.test = function ( self )
	print("B->",self)
	A.test(self)
	print("bbbb"..self.m_value)
end

local C = class(B, true)
C.m_value = 3
C.test = function ( self )
	print("C->",self)
	B.test(self)
	print("ccc"..self.m_value)
end

local c = new(C)
print("****",c)
print("###########")
c:test()