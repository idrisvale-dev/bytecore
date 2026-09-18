local Players=game:GetService("Players")
local UIS=game:GetService("UserInputService")
local LP=Players.LocalPlayer

local C={
	bg0=Color3.fromRGB(10,10,15),
	bg1=Color3.fromRGB(13,13,20),
	bg2=Color3.fromRGB(15,15,22),
	bg3=Color3.fromRGB(12,12,18),
	entry=Color3.fromRGB(12,12,22),
	border=Color3.fromRGB(26,26,40),
	text=Color3.fromRGB(192,192,224),
	dim=Color3.fromRGB(74,74,106),
	muted=Color3.fromRGB(37,37,53),
	acc_out=Color3.fromRGB(123,140,222),
	acc_in=Color3.fromRGB(224,123,140),
	acc_inv=Color3.fromRGB(176,123,222),
	acc_blk=Color3.fromRGB(224,123,123),
	acc_grn=Color3.fromRGB(58,224,123),
	label=Color3.fromRGB(160,160,200),
}

local MAX_ENTRIES=300
local entryFrames={}
local frameData={}
local entryCount=0
local fireTotal=0
local remoteCount={}
local blocked={}
local spoofed={}
local hooked=true
local filterStr=""
local activePanel="log"
local scriptStore={}
local oldNamecall
local statusCountLabel
local scroll
local blockedList,spoofedList,scriptList

local WATCH={FireServer=true,InvokeServer=true,FireAllClients=true,FireClient=true}

local pathCache=setmetatable({},{__mode="k"})
local function getPath(obj)
	if typeof(obj)~="Instance" then return tostring(obj) end
	if pathCache[obj] then return pathCache[obj] end
	local parts={}
	local cur=obj
	while cur and cur~=game do
		table.insert(parts,1,cur.Name)
		cur=cur.Parent
	end
	local p=table.concat(parts,".")
	pathCache[obj]=p
	return p
end

local function serArg(a,depth,seen)
	depth=depth or 0
	seen=seen or {}
	local t=typeof(a)
	if t=="nil" then return "nil"
	elseif t=="boolean" then return tostring(a)
	elseif t=="number" then return string.format("%.4g",a)
	elseif t=="string" then return string.format("%q",a)
	elseif t=="Instance" then return string.format("<%s> %s",a.ClassName,getPath(a))
	elseif t=="Vector3" then return string.format("Vector3(%.2f,%.2f,%.2f)",a.X,a.Y,a.Z)
	elseif t=="CFrame" then
		local p=a.Position
		local rx,ry,rz=a:ToEulerAnglesXYZ()
		return string.format("CFrame(%.2f,%.2f,%.2f|%.1f,%.1f,%.1f)",p.X,p.Y,p.Z,math.deg(rx),math.deg(ry),math.deg(rz))
	elseif t=="Color3" then return string.format("Color3(%.2f,%.2f,%.2f)",a.R,a.G,a.B)
	elseif t=="Vector2" then return string.format("Vector2(%.2f,%.2f)",a.X,a.Y)
	elseif t=="UDim2" then return string.format("UDim2(%.2f,%d,%.2f,%d)",a.X.Scale,a.X.Offset,a.Y.Scale,a.Y.Offset)
	elseif t=="BrickColor" then return string.format("BrickColor(%q)",tostring(a))
	elseif t=="EnumItem" then return tostring(a)
	elseif t=="Ray" then
		local o,d=a.Origin,a.Direction
		return string.format("Ray(%.2f,%.2f,%.2f→%.2f,%.2f,%.2f)",o.X,o.Y,o.Z,d.X,d.Y,d.Z)
	elseif t=="table" then
		if depth>4 then return "{...}" end
		if seen[a] then return "[circular]" end
		seen[a]=true
		local items={}
		for k,v in pairs(a) do
			local key=type(k)=="string" and k or ("["..tostring(k).."]")
			table.insert(items,key.."="..serArg(v,depth+1,seen))
		end
		seen[a]=nil
		return "{"..table.concat(items,",").."}"
	elseif t=="function" then return "[function]"
	else return string.format("[%s]",t)
	end
end

local function serArgs(args)
	local parts={}
	for i=1,#args do parts[i]=serArg(args[i]) end
	return table.concat(parts,",  ")
end

local function genScript(path,method,argStr)
	local segs={}
	for seg in path:gmatch("[^%.]+") do table.insert(segs,seg) end
	local rpath='game:GetService("'..segs[1]..'")'
	for i=2,#segs do rpath=rpath..'["'..segs[i]..'"]' end
	if method=="InvokeServer" then
		return string.format("local r=%s\nlocal result=r:InvokeServer(%s)\nprint(result)",rpath,argStr)
	end
	return string.format("local r=%s\nr:%s(%s)",rpath,method,argStr)
end

local function corner(p,r)
	local c=Instance.new("UICorner")
	c.CornerRadius=UDim.new(0,r or 4)
	c.Parent=p
end

local function pad(p,l,r,t,b)
	local x=Instance.new("UIPadding")
	x.PaddingLeft=UDim.new(0,l or 0)
	x.PaddingRight=UDim.new(0,r or 0)
	x.PaddingTop=UDim.new(0,t or 0)
	x.PaddingBottom=UDim.new(0,b or 0)
	x.Parent=p
end

local function lbl(parent,text,size,color,font,xa)
	local l=Instance.new("TextLabel")
	l.BackgroundTransparency=1
	l.Text=text
	l.TextSize=size or 10
	l.TextColor3=color or C.text
	l.Font=font or Enum.Font.Code
	l.TextXAlignment=xa or Enum.TextXAlignment.Left
	l.TextYAlignment=Enum.TextYAlignment.Center
	l.TextTruncate=Enum.TextTruncate.AtEnd
	l.Size=UDim2.new(1,0,1,0)
	l.Parent=parent
	return l
end

local function btn(parent,text,bg,tc,sz,pos)
	local b=Instance.new("TextButton")
	b.Size=sz or UDim2.new(0,44,0,16)
	b.Position=pos or UDim2.new(0,0,0,0)
	b.BackgroundColor3=bg or C.bg2
	b.Text=text
	b.TextColor3=tc or C.label
	b.TextSize=8
	b.Font=Enum.Font.GothamBold
	b.BorderSizePixel=0
	b.AutoButtonColor=false
	b.Parent=parent
	corner(b,3)
	return b
end

local function updateStatus()
	if not statusCountLabel then return end
	local rc=0
	for _ in pairs(remoteCount) do rc=rc+1 end
	statusCountLabel.Text=rc.." remotes · "..fireTotal.." fires"
end

local function rebuildBlocked()
	for _,c in ipairs(blockedList:GetChildren()) do
		if not c:IsA("UIListLayout") then c:Destroy() end
	end
	local any=false
	for path in pairs(blocked) do
		any=true
		local f=Instance.new("Frame")
		f.Size=UDim2.new(1,0,0,34)
		f.BackgroundColor3=C.bg2
		f.BorderSizePixel=0
		f.Parent=blockedList
		corner(f)
		pad(f,8,8,4,4)
		local pl=Instance.new("TextLabel")
		pl.Size=UDim2.new(1,-58,0,14)
		pl.BackgroundTransparency=1
		pl.Text=path
		pl.TextSize=8
		pl.TextColor3=C.acc_blk
		pl.Font=Enum.Font.Code
		pl.TextXAlignment=Enum.TextXAlignment.Left
		pl.TextTruncate=Enum.TextTruncate.AtEnd
		pl.Parent=f
		local ub=btn(f,"Unblock",Color3.fromRGB(28,10,10),C.acc_blk,UDim2.new(0,50,0,14),UDim2.new(1,-52,0,0))
		ub.MouseButton1Click:Connect(function()
			blocked[path]=nil
			rebuildBlocked()
		end)
	end
	if not any then
		local nl=lbl(blockedList,"no blocked remotes",9,C.muted,Enum.Font.Gotham,Enum.TextXAlignment.Center)
		nl.Size=UDim2.new(1,0,0,28)
	end
end

local function rebuildSpoofed()
	for _,c in ipairs(spoofedList:GetChildren()) do
		if not c:IsA("UIListLayout") then c:Destroy() end
	end
	local any=false
	for path,cfg in pairs(spoofed) do
		any=true
		local f=Instance.new("Frame")
		f.Size=UDim2.new(1,0,0,42)
		f.BackgroundColor3=C.bg2
		f.BorderSizePixel=0
		f.Parent=spoofedList
		corner(f)
		pad(f,8,8,4,4)
		local pl=Instance.new("TextLabel")
		pl.Size=UDim2.new(1,-58,0,14)
		pl.BackgroundTransparency=1
		pl.Text=path
		pl.TextSize=8
		pl.TextColor3=C.acc_inv
		pl.Font=Enum.Font.Code
		pl.TextXAlignment=Enum.TextXAlignment.Left
		pl.TextTruncate=Enum.TextTruncate.AtEnd
		pl.Parent=f
		local vl=Instance.new("TextLabel")
		vl.Size=UDim2.new(1,0,0,12)
		vl.Position=UDim2.new(0,0,0,16)
		vl.BackgroundTransparency=1
		vl.Text="arg["..cfg.index.."] → "..tostring(cfg.value)
		vl.TextSize=7
		vl.TextColor3=C.dim
		vl.Font=Enum.Font.Code
		vl.TextXAlignment=Enum.TextXAlignment.Left
		vl.Parent=f
		local rb=btn(f,"Remove",Color3.fromRGB(20,10,20),C.acc_inv,UDim2.new(0,50,0,14),UDim2.new(1,-52,0,0))
		rb.MouseButton1Click:Connect(function()
			spoofed[path]=nil
			rebuildSpoofed()
		end)
	end
	if not any then
		local nl=lbl(spoofedList,"no spoofed remotes",9,C.muted,Enum.Font.Gotham,Enum.TextXAlignment.Center)
		nl.Size=UDim2.new(1,0,0,28)
	end
end

local function rebuildScript()
	for _,c in ipairs(scriptList:GetChildren()) do
		if not c:IsA("UIListLayout") then c:Destroy() end
	end
	if #scriptStore==0 then
		local nl=lbl(scriptList,"click → Script on any log entry",9,C.muted,Enum.Font.Gotham,Enum.TextXAlignment.Center)
		nl.Size=UDim2.new(1,0,0,28)
		return
	end
	for i=#scriptStore,1,-1 do
		local s=scriptStore[i]
		local f=Instance.new("Frame")
		f.Size=UDim2.new(1,0,0,68)
		f.BackgroundColor3=C.bg2
		f.BorderSizePixel=0
		f.Parent=scriptList
		corner(f)
		pad(f,8,8,4,4)
		local pl=Instance.new("TextLabel")
		pl.Size=UDim2.new(1,0,0,12)
		pl.BackgroundTransparency=1
		pl.Text=s.path
		pl.TextSize=8
		pl.TextColor3=C.acc_out
		pl.Font=Enum.Font.Code
		pl.TextXAlignment=Enum.TextXAlignment.Left
		pl.TextTruncate=Enum.TextTruncate.AtEnd
		pl.Parent=f
		local cl=Instance.new("TextLabel")
		cl.Size=UDim2.new(1,0,0,32)
		cl.Position=UDim2.new(0,0,0,14)
		cl.BackgroundTransparency=1
		cl.Text=s.code
		cl.TextSize=7
		cl.TextColor3=C.dim
		cl.Font=Enum.Font.Code
		cl.TextXAlignment=Enum.TextXAlignment.Left
		cl.TextWrapped=true
		cl.TextTruncate=Enum.TextTruncate.None
		cl.Parent=f
		local cb=btn(f,"Copy",Color3.fromRGB(12,12,22),C.acc_out,UDim2.new(0,36,0,14),UDim2.new(0,0,1,-16))
		cb.MouseButton1Click:Connect(function()
			if setclipboard then setclipboard(s.code) end
			cb.Text="✓"
			task.delay(1.2,function() cb.Text="Copy" end)
		end)
	end
end

local function applyFilter()
	for i,ef in ipairs(entryFrames) do
		local d=frameData[i]
		if d then
			ef.Visible=filterStr=="" or d.path:lower():find(filterStr,1,true)~=nil
		end
	end
end

local function addEntry(remotePath,method,argStr,remote,args)
	entryCount=entryCount+1
	fireTotal=fireTotal+1
	remoteCount[remotePath]=(remoteCount[remotePath] or 0)+1

	if #entryFrames>=MAX_ENTRIES then
		local old=table.remove(entryFrames,1)
		table.remove(frameData,1)
		if old then old:Destroy() end
	end

	local isIn=method=="OnClientEvent" or method=="OnServerEvent"
	local isInv=method=="InvokeServer" or method=="InvokeClient"
	local ac=isIn and C.acc_in or (isInv and C.acc_inv or C.acc_out)
	local dirTxt=isIn and "← IN" or (isInv and "⇄ INV" or "→ OUT")
	local show=filterStr=="" or remotePath:lower():find(filterStr,1,true)~=nil

	local f=Instance.new("Frame")
	f.Size=UDim2.new(1,0,0,60)
	f.BackgroundColor3=C.entry
	f.BorderSizePixel=0
	f.LayoutOrder=entryCount
	f.Visible=show
	f.Parent=scroll
	corner(f)

	local acBar=Instance.new("Frame")
	acBar.Size=UDim2.new(0,2,1,-6)
	acBar.Position=UDim2.new(0,0,0,3)
	acBar.BackgroundColor3=ac
	acBar.BorderSizePixel=0
	acBar.Parent=f
	corner(acBar,2)

	local inner=Instance.new("Frame")
	inner.Size=UDim2.new(1,-10,1,0)
	inner.Position=UDim2.new(0,8,0,0)
	inner.BackgroundTransparency=1
	inner.Parent=f

	local top=Instance.new("Frame")
	top.Size=UDim2.new(1,0,0,18)
	top.Position=UDim2.new(0,0,0,4)
	top.BackgroundTransparency=1
	top.Parent=inner

	local dirB=Instance.new("TextLabel")
	dirB.Size=UDim2.new(0,34,0,13)
	dirB.Position=UDim2.new(0,0,0,2)
	dirB.BackgroundColor3=Color3.fromRGB(12,12,20)
	dirB.Text=dirTxt
	dirB.TextSize=6
	dirB.TextColor3=ac
	dirB.Font=Enum.Font.GothamBold
	dirB.BorderSizePixel=0
	dirB.Parent=top
	corner(dirB,3)

	local mTag=Instance.new("TextLabel")
	mTag.Size=UDim2.new(0,68,0,13)
	mTag.Position=UDim2.new(0,38,0,2)
	mTag.BackgroundTransparency=1
	mTag.Text=method
	mTag.TextSize=7
	mTag.TextColor3=C.dim
	mTag.Font=Enum.Font.Code
	mTag.TextXAlignment=Enum.TextXAlignment.Left
	mTag.Parent=top

	local pathL=Instance.new("TextLabel")
	pathL.Size=UDim2.new(1,-148,0,13)
	pathL.Position=UDim2.new(0,110,0,2)
	pathL.BackgroundTransparency=1
	pathL.Text=remotePath
	pathL.TextSize=8
	pathL.TextColor3=C.label
	pathL.Font=Enum.Font.Code
	pathL.TextXAlignment=Enum.TextXAlignment.Left
	pathL.TextTruncate=Enum.TextTruncate.AtEnd
	pathL.Parent=top

	local cntL=Instance.new("TextLabel")
	cntL.Size=UDim2.new(0,24,0,13)
	cntL.Position=UDim2.new(1,-48,0,2)
	cntL.BackgroundColor3=Color3.fromRGB(14,14,22)
	cntL.Text="×"..remoteCount[remotePath]
	cntL.TextSize=6
	cntL.TextColor3=C.dim
	cntL.Font=Enum.Font.GothamBold
	cntL.BorderSizePixel=0
	cntL.Parent=top
	corner(cntL,3)

	local timeL=Instance.new("TextLabel")
	timeL.Size=UDim2.new(0,22,0,13)
	timeL.Position=UDim2.new(1,-24,0,2)
	timeL.BackgroundTransparency=1
	timeL.Text=string.format("%.1fs",os.clock()%60)
	timeL.TextSize=6
	timeL.TextColor3=C.muted
	timeL.Font=Enum.Font.Code
	timeL.TextXAlignment=Enum.TextXAlignment.Right
	timeL.Parent=top

	local argsL=Instance.new("TextLabel")
	argsL.Size=UDim2.new(1,0,0,12)
	argsL.Position=UDim2.new(0,0,0,23)
	argsL.BackgroundTransparency=1
	argsL.Text=argStr=="" and "(no args)" or argStr
	argsL.TextSize=7
	argsL.TextColor3=C.dim
	argsL.Font=Enum.Font.Code
	argsL.TextXAlignment=Enum.TextXAlignment.Left
	argsL.TextTruncate=Enum.TextTruncate.AtEnd
	argsL.Parent=inner

	local actRow=Instance.new("Frame")
	actRow.Size=UDim2.new(1,0,0,14)
	actRow.Position=UDim2.new(0,0,0,40)
	actRow.BackgroundTransparency=1
	actRow.Parent=inner

	local al=Instance.new("UIListLayout")
	al.FillDirection=Enum.FillDirection.Horizontal
	al.SortOrder=Enum.SortOrder.LayoutOrder
	al.Padding=UDim.new(0,3)
	al.Parent=actRow

	local function actBtn(label,bg,tc,order)
		local b=btn(actRow,label,bg,tc,UDim2.new(0,0,0,14))
		b.LayoutOrder=order
		b.AutomaticSize=Enum.AutomaticSize.X
		pad(b,4,4,0,0)
		return b
	end

	if not isIn then
		local blkB=actBtn(blocked[remotePath] and "Unblock" or "Block",Color3.fromRGB(28,10,10),C.acc_blk,1)
		blkB.MouseButton1Click:Connect(function()
			blocked[remotePath]=not blocked[remotePath]
			blkB.Text=blocked[remotePath] and "Unblock" or "Block"
			rebuildBlocked()
		end)
		local spfB=actBtn("Spoof",Color3.fromRGB(10,14,28),C.acc_out,2)
		spfB.MouseButton1Click:Connect(function()
			spoofed[remotePath]={index=1,value="nil"}
			rebuildSpoofed()
			spfB.Text="✓"
			task.delay(1,function() spfB.Text="Spoof" end)
		end)
		local repB=actBtn("Repeat",Color3.fromRGB(10,22,14),C.acc_grn,3)
		repB.MouseButton1Click:Connect(function()
			if remote and remote:IsA("RemoteEvent") then
				pcall(function() remote:FireServer(table.unpack(args)) end)
			end
			repB.Text="✓"
			task.delay(0.8,function() repB.Text="Repeat" end)
		end)
	end

	local cpB=actBtn("Copy",Color3.fromRGB(14,14,22),C.label,4)
	cpB.MouseButton1Click:Connect(function()
		if setclipboard then setclipboard(remotePath) end
		cpB.Text="✓"
		task.delay(1,function() cpB.Text="Copy" end)
	end)

	local scB=actBtn("→Script",Color3.fromRGB(16,16,26),C.acc_inv,5)
	scB.MouseButton1Click:Connect(function()
		local code=genScript(remotePath,method,argStr)
		table.insert(scriptStore,{path=remotePath,method=method,code=code,args=argStr})
		rebuildScript()
		scB.Text="✓"
		task.delay(1,function() scB.Text="→Script" end)
	end)

	table.insert(entryFrames,f)
	table.insert(frameData,{path=remotePath,method=method,args=argStr})

	task.defer(function()
		scroll.CanvasPosition=Vector2.new(0,scroll.AbsoluteCanvasSize.Y)
		updateStatus()
	end)
end

local function buildGUI()
	local guiParent=(gethui and gethui()) or LP:FindFirstChild("PlayerGui") or LP.PlayerGui

	local gui=Instance.new("ScreenGui")
	gui.Name="NevaHexSpy"
	gui.ResetOnSpawn=false
	gui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
	gui.IgnoreGuiInset=true
	gui.Parent=guiParent

	local main=Instance.new("Frame")
	main.Name="Main"
	main.Size=UDim2.new(0,320,0,410)
	main.Position=UDim2.new(0.5,-160,0.5,-205)
	main.BackgroundColor3=C.bg0
	main.BorderSizePixel=0
	main.Active=true
	main.Draggable=true
	main.Parent=gui
	corner(main,8)

	local titleBar=Instance.new("Frame")
	titleBar.Size=UDim2.new(1,0,0,32)
	titleBar.BackgroundColor3=C.bg3
	titleBar.BorderSizePixel=0
	titleBar.Parent=main
	corner(titleBar,8)

	for i,col in ipairs({C.acc_blk,Color3.fromRGB(254,188,46),C.acc_grn}) do
		local d=Instance.new("Frame")
		d.Size=UDim2.new(0,7,0,7)
		d.Position=UDim2.new(0,6+(i-1)*12,0.5,-3)
		d.BackgroundColor3=col
		d.BorderSizePixel=0
		d.Parent=titleBar
		corner(d,4)
	end

	local titleL=Instance.new("TextLabel")
	titleL.Size=UDim2.new(1,-80,1,0)
	titleL.Position=UDim2.new(0,46,0,0)
	titleL.BackgroundTransparency=1
	titleL.Text="NevaHex Spy"
	titleL.TextSize=10
	titleL.TextColor3=C.dim
	titleL.Font=Enum.Font.GothamBold
	titleL.TextXAlignment=Enum.TextXAlignment.Left
	titleL.LetterSpacing=2
	titleL.Parent=titleBar

	local statusDot=Instance.new("Frame")
	statusDot.Size=UDim2.new(0,5,0,5)
	statusDot.Position=UDim2.new(1,-52,0.5,-2)
	statusDot.BackgroundColor3=C.acc_grn
	statusDot.BorderSizePixel=0
	statusDot.Parent=titleBar
	corner(statusDot,4)

	local pauseL=Instance.new("TextLabel")
	pauseL.Size=UDim2.new(0,24,1,0)
	pauseL.Position=UDim2.new(1,-47,0,0)
	pauseL.BackgroundTransparency=1
	pauseL.Text="LIVE"
	pauseL.TextSize=6
	pauseL.TextColor3=C.acc_grn
	pauseL.Font=Enum.Font.GothamBold
	pauseL.TextXAlignment=Enum.TextXAlignment.Left
	pauseL.Parent=titleBar

	local closeB=btn(titleBar,"✕",Color3.fromRGB(180,50,50),Color3.new(1,1,1),UDim2.new(0,22,0,22),UDim2.new(1,-26,0.5,-11))
	closeB.TextSize=9
	closeB.MouseButton1Click:Connect(function() gui:Destroy() end)

	local tabBar=Instance.new("Frame")
	tabBar.Size=UDim2.new(1,0,0,26)
	tabBar.Position=UDim2.new(0,0,0,32)
	tabBar.BackgroundColor3=C.bg1
	tabBar.BorderSizePixel=0
	tabBar.Parent=main

	local tl=Instance.new("UIListLayout")
	tl.FillDirection=Enum.FillDirection.Horizontal
	tl.SortOrder=Enum.SortOrder.LayoutOrder
	tl.Parent=tabBar

	local tabNames={"Log","Blocked","Spoofed","Script","Export"}
	local tabBtns={}
	local panels={}

	local function switchPanel(name)
		local key=name:lower()
		activePanel=key
		for _,p in pairs(panels) do p.Visible=false end
		if panels[key] then panels[key].Visible=true end
		for _,tb in pairs(tabBtns) do
			tb.TextColor3=C.muted
			tb.BackgroundColor3=C.bg1
		end
		if tabBtns[key] then
			tabBtns[key].TextColor3=C.acc_out
			tabBtns[key].BackgroundColor3=C.bg2
		end
		if key=="blocked" then rebuildBlocked()
		elseif key=="spoofed" then rebuildSpoofed()
		elseif key=="script" then rebuildScript()
		end
	end

	for i,name in ipairs(tabNames) do
		local tb=Instance.new("TextButton")
		tb.Size=UDim2.new(0,64,1,0)
		tb.BackgroundColor3=C.bg1
		tb.Text=name
		tb.TextSize=8
		tb.TextColor3=C.muted
		tb.Font=Enum.Font.GothamBold
		tb.BorderSizePixel=0
		tb.AutoButtonColor=false
		tb.LayoutOrder=i
		tb.Parent=tabBar
		tabBtns[name:lower()]=tb
		tb.MouseButton1Click:Connect(function() switchPanel(name) end)
	end

	local filterBar=Instance.new("Frame")
	filterBar.Size=UDim2.new(1,-14,0,22)
	filterBar.Position=UDim2.new(0,7,0,60)
	filterBar.BackgroundColor3=C.bg1
	filterBar.BorderSizePixel=0
	filterBar.Parent=main
	corner(filterBar,4)
	pad(filterBar,8,8,0,0)

	local filterIcon=Instance.new("TextLabel")
	filterIcon.Size=UDim2.new(0,12,1,0)
	filterIcon.BackgroundTransparency=1
	filterIcon.Text="⌕"
	filterIcon.TextSize=10
	filterIcon.TextColor3=C.muted
	filterIcon.Font=Enum.Font.Code
	filterIcon.Parent=filterBar

	local filterIn=Instance.new("TextBox")
	filterIn.Size=UDim2.new(1,-16,1,0)
	filterIn.Position=UDim2.new(0,16,0,0)
	filterIn.BackgroundTransparency=1
	filterIn.PlaceholderText="filter remote path..."
	filterIn.PlaceholderColor3=C.muted
	filterIn.Text=""
	filterIn.TextColor3=C.label
	filterIn.TextSize=8
	filterIn.Font=Enum.Font.Code
	filterIn.ClearTextOnFocus=false
	filterIn.Parent=filterBar

	filterIn:GetPropertyChangedSignal("Text"):Connect(function()
		filterStr=filterIn.Text:lower()
		applyFilter()
	end)

	local function makePanel()
		local p=Instance.new("Frame")
		p.Size=UDim2.new(1,-14,1,-108)
		p.Position=UDim2.new(0,7,0,88)
		p.BackgroundTransparency=1
		p.Visible=false
		p.Parent=main
		return p
	end

	local logPanel=makePanel()
	logPanel.Visible=true
	panels["log"]=logPanel

	scroll=Instance.new("ScrollingFrame")
	scroll.Size=UDim2.new(1,0,1,0)
	scroll.BackgroundTransparency=1
	scroll.BorderSizePixel=0
	scroll.ScrollBarThickness=3
	scroll.ScrollBarImageColor3=C.acc_out
	scroll.AutomaticCanvasSize=Enum.AutomaticSize.Y
	scroll.CanvasSize=UDim2.new(0,0,0,0)
	scroll.Parent=logPanel

	local sll=Instance.new("UIListLayout")
	sll.SortOrder=Enum.SortOrder.LayoutOrder
	sll.Padding=UDim.new(0,2)
	sll.Parent=scroll

	local function scrollPanel(key)
		local p=makePanel()
		panels[key]=p
		local sf=Instance.new("ScrollingFrame")
		sf.Size=UDim2.new(1,0,1,0)
		sf.BackgroundTransparency=1
		sf.BorderSizePixel=0
		sf.ScrollBarThickness=3
		sf.ScrollBarImageColor3=C.dim
		sf.AutomaticCanvasSize=Enum.AutomaticSize.Y
		sf.CanvasSize=UDim2.new(0,0,0,0)
		sf.Parent=p
		local ll=Instance.new("UIListLayout")
		ll.SortOrder=Enum.SortOrder.LayoutOrder
		ll.Padding=UDim.new(0,3)
		ll.Parent=sf
		return sf
	end

	blockedList=scrollPanel("blocked")
	spoofedList=scrollPanel("spoofed")
	scriptList=scrollPanel("script")

	local expPanel=makePanel()
	panels["export"]=expPanel
	pad(expPanel,0,0,6,0)

	local expTitle=lbl(expPanel,"Session Export",9,C.dim,Enum.Font.GothamBold,Enum.TextXAlignment.Left)
	expTitle.Size=UDim2.new(1,0,0,18)
	expTitle.LetterSpacing=1

	local function expBtn(label,bg,tc,ypos,action)
		local b=btn(expPanel,label,bg,tc,UDim2.new(1,0,0,30),UDim2.new(0,0,0,ypos))
		b.TextSize=9
		b.MouseButton1Click:Connect(action)
		return b
	end

	expBtn("Copy JSON to Clipboard",Color3.fromRGB(12,14,24),C.acc_out,24,function()
		local rows={}
		for i,d in ipairs(frameData) do
			table.insert(rows,string.format('{"path":"%s","method":"%s","args":"%s"}',d.path,d.method,(d.args or ""):gsub('"','\\"')))
		end
		if setclipboard then setclipboard("[\n"..table.concat(rows,",\n").."\n]") end
	end)

	expBtn("Save to spy_session.txt",Color3.fromRGB(10,20,14),C.acc_grn,60,function()
		local lines={}
		for _,d in ipairs(frameData) do
			table.insert(lines,d.method.." | "..d.path.." | "..(d.args or ""))
		end
		if writefile then writefile("spy_session.txt",table.concat(lines,"\n")) end
	end)

	expBtn("Clear All",Color3.fromRGB(24,10,10),C.acc_blk,96,function()
		for _,ef in ipairs(entryFrames) do ef:Destroy() end
		entryFrames={}
		frameData={}
		entryCount=0
		fireTotal=0
		remoteCount={}
		updateStatus()
	end)

	local statBar=Instance.new("Frame")
	statBar.Size=UDim2.new(1,0,0,20)
	statBar.Position=UDim2.new(0,0,1,-20)
	statBar.BackgroundColor3=Color3.fromRGB(8,8,13)
	statBar.BorderSizePixel=0
	statBar.Parent=main
	pad(statBar,8,8,0,0)

	local sl=Instance.new("UIListLayout")
	sl.FillDirection=Enum.FillDirection.Horizontal
	sl.VerticalAlignment=Enum.VerticalAlignment.Center
	sl.Padding=UDim.new(0,6)
	sl.Parent=statBar

	local sd=Instance.new("Frame")
	sd.Size=UDim2.new(0,5,0,5)
	sd.BackgroundColor3=C.acc_grn
	sd.BorderSizePixel=0
	sd.LayoutOrder=1
	sd.Parent=statBar
	corner(sd,4)

	local function hookBadge(t,order)
		local b=Instance.new("TextLabel")
		b.Size=UDim2.new(0,52,0,13)
		b.BackgroundColor3=Color3.fromRGB(10,22,14)
		b.Text=t
		b.TextSize=6
		b.TextColor3=C.acc_grn
		b.Font=Enum.Font.GothamBold
		b.BorderSizePixel=0
		b.LayoutOrder=order
		b.Parent=statBar
		corner(b,3)
	end
	hookBadge("__namecall",2)
	hookBadge("hookfn",3)
	hookBadge("__index",4)

	statusCountLabel=Instance.new("TextLabel")
	statusCountLabel.Size=UDim2.new(0,90,1,0)
	statusCountLabel.BackgroundTransparency=1
	statusCountLabel.Text="0 remotes · 0 fires"
	statusCountLabel.TextSize=6
	statusCountLabel.TextColor3=C.muted
	statusCountLabel.Font=Enum.Font.Code
	statusCountLabel.TextXAlignment=Enum.TextXAlignment.Right
	statusCountLabel.LayoutOrder=5
	statusCountLabel.Parent=statBar

	tabBtns["log"].TextColor3=C.acc_out
	tabBtns["log"].BackgroundColor3=C.bg2

	UIS.InputBegan:Connect(function(input,gp)
		if gp then return end
		if input.KeyCode==Enum.KeyCode.RightShift then
			main.Visible=not main.Visible
		elseif input.KeyCode==Enum.KeyCode.Delete then
			for _,ef in ipairs(entryFrames) do ef:Destroy() end
			entryFrames={}
			frameData={}
			entryCount=0
			fireTotal=0
			remoteCount={}
			updateStatus()
		elseif input.KeyCode==Enum.KeyCode.End then
			hooked=not hooked
			sd.BackgroundColor3=hooked and C.acc_grn or C.acc_blk
			pauseL.Text=hooked and "LIVE" or "PAUSED"
			pauseL.TextColor3=hooked and C.acc_grn or C.acc_blk
		end
	end)
end

local function hookIncoming(remote)
	remote.OnClientEvent:Connect(function(...)
		if not hooked then return end
		local path=getPath(remote)
		local args={...}
		local argStr=serArgs(args)
		task.defer(function()
			addEntry(path,"OnClientEvent",argStr,remote,args)
		end)
	end)
end

local function installHooks()
	oldNamecall=hookmetamethod(game,"__namecall",function(self,...)
		local method=getnamecallmethod()
		if hooked and WATCH[method] and (self:IsA("RemoteEvent") or self:IsA("RemoteFunction")) then
			local path=getPath(self)
			if blocked[path] then return nil end
			local rawArgs={...}
			local finalArgs=rawArgs
			if spoofed[path] then
				finalArgs=table.clone(rawArgs)
				local sc=spoofed[path]
				if sc.index<=#finalArgs then finalArgs[sc.index]=sc.value end
			end
			local argStr=serArgs(rawArgs)
			task.defer(function()
				addEntry(path,method,argStr,self,rawArgs)
			end)
			if spoofed[path] then
				return oldNamecall(self,table.unpack(finalArgs))
			end
		end
		return oldNamecall(self,...)
	end)

	for _,d in ipairs(workspace:GetDescendants()) do
		if d:IsA("RemoteEvent") then hookIncoming(d) end
	end
	workspace.DescendantAdded:Connect(function(d)
		if d:IsA("RemoteEvent") then hookIncoming(d) end
	end)
end

buildGUI()
installHooks()
print("[NevaHex Spy] loaded | RightShift=toggle | Delete=clear | End=pause")
