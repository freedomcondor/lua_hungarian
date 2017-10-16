Hungarian = require("hungarian")

--[[
costMat = {	{1,2,3},
			{4,5,6},
			{4,5,6},
			}
--]]
costMat = {	{1,4,5},
			{5,7,6},
			{5,8,8},
			}

hun = Hungarian:create{costMat = costMat
					  }


hun:aug()

print("match table X")
for x = 1,hun.N do
	print(hun.match_of_X[x])
end
print("match table Y")
for y = 1,hun.N do
	print(hun.match_of_Y[y])
end
