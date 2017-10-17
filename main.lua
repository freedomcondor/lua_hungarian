Hungarian = require("hungarian")

--[[
costMat = {	{1,2,3},
			{4,5,6},
			{4,5,6},
			}
--]]
--[[
costMat = {	{1,4,5},
			{5,7,6},
			{5,8,8},
			}
--]]
--[[
costMat = {	{1,4,5,1},
			{5,7,6,5.6},
			{5,8,8,1.2},
			{5,8,8,1.2},
			}
--]]
--[[
costMat = {	{1,4,5,1,28},
			{5,7,6,5.6,0.1},
			{5,8,8,1.2,7},
			{5,8,8,1.2,4},
			{5,7,6,5.6,0.1},
			}
--]]
---[[
costMat = {	{90,75,75,80},
			{35,85,55,65},
			{125,95,90,105},
			{45,110,95,-115},
			}
--]]
hun = Hungarian:create{	costMat = costMat,
						--MAXorMIN = "MIN"
					  }


hun:aug()

print("match table X")
for x = 1,hun.N do
	print(x,hun.match_of_X[x])
end
--[[
print("match table Y")
for y = 1,hun.N do
	print(hun.match_of_Y[y])
end
--]]
