require("lfs")
local path = "D:/Code/learnlua"
for file in lfs.dir(path) do
    print(file)
end