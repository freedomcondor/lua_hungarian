-- table tool functions
----------------------------------------------------------------
local function deepcopy(orig)
	local orig_type = type(orig)
	local copy
	if orig_type == 'table' then
		copy = {}
		for orig_key, orig_value in next, orig, nil do
			copy[deepcopy(orig_key)] = deepcopy(orig_value)
		end
		setmetatable(copy, deepcopy(getmetatable(orig)))
	else -- number, string, boolean, etc
		copy = orig
	end
	return copy
end

local function getNM_Mat(Mat)
	--[[
	find the size of a Mat
	i.e.
		  M=4
		* * * *
	N=3	* * * *
		* * * *

	return 3,4
	--]]

	--Asserts
		--checked in for
		--presume Mat is like {{a,a},{a,a,a},{a,a}}

	local maxM = 0
	for ii,v in ipairs(Mat) do
		i = ii
		if type(v) ~= "table" then return -1,-1 else
			for jj,t in ipairs(v) do j=jj end
			if j>maxM then maxM = j end
		end
	end
	return i,maxM
end

----------------------------------------------------------------
-- Hungarian starts
	-- for the algorithm, please refer: https://www.topcoder.com/community/data-science/data-science-tutorials/assignment-problem-and-hungarian-algorithm/

local Hungarian = 
{
	---[[
	-- for users:
	costMat = {},
	N = 0,
	-- M = 0
		-- no M currently

	maxMatch = 0,
	match_of_X = nil,
	match_of_Y = nil,
		-- a Hungarian should have these data
	--]]

	-- for algorithm
}
Hungarian.__index = Hungarian

function Hungarian:create(configuration)
	--Inherite
	local instance = {}
	setmetatable(instance,self)
	self.__index = self
		--the metatable of instance would be whoever owns this create
		--so you can :  a = State:create();  b = a:create();  grandfather-father-son

	--Asserts
		-- to be filled
		-- check in the following body
		-- maybe not square
		-- maybe the square lacks a corner (this may not matter)
	
	-- Set costMat and size N
	instance.costMat = deepcopy(configuration.costMat)
	local n,m = getNM_Mat(instance.costMat)

	-- check and get N
	if n == -1 or m == -1 then
		print("invalid costMat")
		return nil
	end
	if n ~= m then
		print("non square")
		-- to be filled
		return nil
			-- temporarily
	end
	instance.N = n

	-- Set labels and maxMatch
	--local i,j -- maybe in lua this is not necessary, the i in for is local to for
	instance.maxMatch = 0
	instance.lx = {}; instance.ly = {}
	for i = 1,n do instance.lx[i] = 0 end
	for i = 1,n do instance.ly[i] = 0 end
	for i = 1,n do 
		for j = 1,n do
			if instance.lx[i] < instance.costMat[i][j] then
				instance.lx[i] = instance.costMat[i][j]
			end
		end
	end
	--print("i = ",i) -- proof that i is local to for

	return instance
end

function Hungarian:aug()
	--[[
		for someone not be matched in X:
			1. try to find all his augmenting tree, 
				if a path is found, goto the end, change the match and recur aug() 
			2. if all the augmenting tree is set and no path found, update label
			3. keep finding ??
	--]]

	-- OK already?
	if (self.maxMatch == self.N) then return 0 end
	local N = self.N
		-- write self.N everything could be annoying, use N directly

	---------------------------------------------------------------------
	-- Start to Build tree ----------------------------------------------
		-- using S,T,
		-- and a queue ?? 
			--the use of the queue is xxxxx
		-- a slack for find the min delta quickly
	
	------------------------Init everything--------
	-- Init everything
	local S = {}
	local T = {}
	local parent_table = {}
	--local queue = {}
	local root

	-- find a single x
	for x = 1,N do
		if self.match_of_X[x] == nil then
			--queue.add(x)
			root = x
			parent_table[x] = -2
			S[x] = true
			break
		end
	end
		--must find a single x, or function should have returned checking maxMatch
	
	-- init slack
		-- slack is used for store the mini delta for each y
		-- slackx is used for store to which x this mini delta is achieved
	slack = {} slackx = {}
	for y = 1,N do slack[y] = 
		self.lx[root] + self.ly[root] - self.cost[root][y] end
	for y = 1,N do slackx[y] = root end

	-----------------------------------------------
end

return Hungarian

