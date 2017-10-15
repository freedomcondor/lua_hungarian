Hungarian = require("Hungarian")

costMat = {	{1,2,3},
			{4,5,6},
			{4,5,6},
			}

hun = Hungarian:create{costMat = costMat
					  }

print("hun.costMat=",hun.costMat[1][1])
print("hun.N=",hun.N)
for i,v in ipairs(hun.lx) do
	print("hun.lx[",i,"]=",v)
end
