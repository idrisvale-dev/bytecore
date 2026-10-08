-- By DevAurora Code
-- Detected obfuscation: Luraph v15
-- Local names are inferred from use (the original names are not in the bytecode)

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
game:GetService("TextService")
local color = Color3.fromRGB(16, 18, 19)
local color2 = Color3.fromRGB(64, 70, 82)
local color3 = Color3.fromRGB(59, 130, 246)
local color4 = Color3.fromRGB(255, 255, 255)
local n = 0.95
local n2 = 0.45
local n3 = 0.07
local n4 = 0.2
local n5 = 0.5
local n6 = 0.62
local str = "rbxassetid://8992230903"
local str2 = "rbxassetid://1316045217"

local tbl = {
	info = { tint = Color3.fromRGB(59, 130, 246), art = "rbxassetid://124560466474914" },
	good = { tint = Color3.fromRGB(52, 199, 123), art = "rbxassetid://85262178816537" },
	warn = { tint = Color3.fromRGB(245, 158, 11), art = "rbxassetid://125920361880643" },
	bad = { tint = Color3.fromRGB(244, 63, 94), art = "rbxassetid://76821953846248" },
}

local function fn(arg)
	return Font.fromName("BuilderSans", arg or Enum.FontWeight.Regular)
end

local function fn2(arg, arg2, parent)
	local instance = Instance.new(arg)

	for k, v in pairs(arg2) do
		if k ~= "Parent" then
			instance[k] = v
		end
	end

	instance.Parent = parent
	return instance
end

local function fn3(arg, arg2)
	return fn2("UICorner", { CornerRadius = UDim.new(0, arg2 or 8) }, arg)
end

local function fn4(arg, arg2, arg3)
	return fn2("UIStroke", {
		Color = arg2 or color2,
		Thickness = 1,
		Transparency = arg3 or 0,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	}, arg)
end

local function fn5(arg, arg2, arg3, arg4, arg5)
	return fn2("UIPadding", {
		PaddingTop = UDim.new(0, arg2),
		PaddingRight = UDim.new(0, arg3 or arg2),
		PaddingBottom = UDim.new(0, arg4 or arg2),
		PaddingLeft = UDim.new(0, arg5 or arg3 or arg2),
	}, arg)
end

local function fn6(arg, arg2, arg3)
	return fn2("UIListLayout", {
		Padding = UDim.new(0, arg2 or 6),
		FillDirection = arg3 or Enum.FillDirection.Vertical,
		SortOrder = Enum.SortOrder.LayoutOrder,
	}, arg)
end

local function fn7(arg, arg2)
	arg.BackgroundTransparency = 1
	arg.TextColor3 = arg.TextColor3 or color4
	arg.FontFace = arg.FontFace or fn()
	arg.TextXAlignment = arg.TextXAlignment or Enum.TextXAlignment.Left
	return fn2("TextLabel", arg, arg2)
end

local function fn8(arg, arg2)
	return fn2("TextButton", {
		Name = "Hit",
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		Text = "",
		ZIndex = arg2 or 5,
	}, arg)
end

local tbl2 = {
	["a-arrow-down"] = "rbxassetid://92867583610071",
	["a-arrow-up"] = "rbxassetid://132318504999733",
	["a-large-small"] = "rbxassetid://111491496660216",
	accessibility = "rbxassetid://114029945302017",
	activity = "rbxassetid://94212016861936",
	["air-vent"] = "rbxassetid://81517226012329",
	airplay = "rbxassetid://115020759309179",
	["alarm-clock-check"] = "rbxassetid://76437352099157",
	["alarm-clock-minus"] = "rbxassetid://77364179863205",
	["alarm-clock-off"] = "rbxassetid://97904885874823",
	["alarm-clock-plus"] = "rbxassetid://80468822979214",
	["alarm-clock"] = "rbxassetid://126259032907535",
	["alarm-smoke"] = "rbxassetid://96965448419685",
	album = "rbxassetid://127358331163602",
	["align-center-horizontal"] = "rbxassetid://81570549209434",
	["align-center-vertical"] = "rbxassetid://118470463752466",
	["align-end-horizontal"] = "rbxassetid://139502909745427",
	["align-end-vertical"] = "rbxassetid://96528869059554",
	["align-horizontal-distribute-center"] = "rbxassetid://97220086126656",
	["align-horizontal-distribute-end"] = "rbxassetid://106128590702022",
	["align-horizontal-distribute-start"] = "rbxassetid://76074660002997",
	["align-horizontal-justify-center"] = "rbxassetid://75732302772427",
	["align-horizontal-justify-end"] = "rbxassetid://129167626402283",
	["align-horizontal-justify-start"] = "rbxassetid://130161830325281",
	["align-horizontal-space-around"] = "rbxassetid://91646106782950",
	["align-horizontal-space-between"] = "rbxassetid://103886093046990",
	["align-start-horizontal"] = "rbxassetid://125674804697729",
	["align-start-vertical"] = "rbxassetid://105020230154823",
	["align-vertical-distribute-center"] = "rbxassetid://93791183635525",
	["align-vertical-distribute-end"] = "rbxassetid://139354223511433",
	["align-vertical-distribute-start"] = "rbxassetid://74961997822126",
	["align-vertical-justify-center"] = "rbxassetid://134754696166569",
	["align-vertical-justify-end"] = "rbxassetid://92569381441969",
	["align-vertical-justify-start"] = "rbxassetid://99692844572718",
	["align-vertical-space-around"] = "rbxassetid://96206012459190",
	["align-vertical-space-between"] = "rbxassetid://124998077349706",
	ambulance = "rbxassetid://78599995190651",
	ampersand = "rbxassetid://75272915739209",
	ampersands = "rbxassetid://126947193455996",
	amphora = "rbxassetid://137370389604364",
	anchor = "rbxassetid://92181172123618",
	angry = "rbxassetid://74237056000103",
	annoyed = "rbxassetid://80064369052011",
	antenna = "rbxassetid://99628923540956",
	anvil = "rbxassetid://100203029845919",
	aperture = "rbxassetid://83396154449972",
	["app-window-mac"] = "rbxassetid://79587216113811",
	["app-window"] = "rbxassetid://93142176757189",
	apple = "rbxassetid://104349242902442",
	["archive-restore"] = "rbxassetid://78956681942188",
	["archive-x"] = "rbxassetid://75830115088395",
	archive = "rbxassetid://122180020814574",
	armchair = "rbxassetid://105384358373973",
	["arrow-big-down-dash"] = "rbxassetid://137987229582002",
	["arrow-big-down"] = "rbxassetid://81081164158885",
	["arrow-big-left-dash"] = "rbxassetid://97827621354677",
	["arrow-big-left"] = "rbxassetid://85973092492641",
	["arrow-big-right-dash"] = "rbxassetid://117825834972403",
	["arrow-big-right"] = "rbxassetid://82960676755590",
	["arrow-big-up-dash"] = "rbxassetid://99260194327483",
	["arrow-big-up"] = "rbxassetid://93136954756149",
	["arrow-down-0-1"] = "rbxassetid://120961896217875",
	["arrow-down-1-0"] = "rbxassetid://93474255891850",
	["arrow-down-a-z"] = "rbxassetid://99554596207900",
	["arrow-down-from-line"] = "rbxassetid://132045845807798",
	["arrow-down-left"] = "rbxassetid://102899325237364",
	["arrow-down-narrow-wide"] = "rbxassetid://129105261655061",
	["arrow-down-right"] = "rbxassetid://123109928624974",
	["arrow-down-to-dot"] = "rbxassetid://101675355931221",
	["arrow-down-to-line"] = "rbxassetid://87050478931254",
	["arrow-down-up"] = "rbxassetid://85780258549577",
	["arrow-down-wide-narrow"] = "rbxassetid://88461733425991",
	["arrow-down-z-a"] = "rbxassetid://76115279362232",
	["arrow-down"] = "rbxassetid://98764963621439",
	["arrow-left-from-line"] = "rbxassetid://87857914437603",
	["arrow-left-right"] = "rbxassetid://131324733048447",
	["arrow-left-to-line"] = "rbxassetid://118645136026970",
	["arrow-left"] = "rbxassetid://102531941843733",
	["arrow-right-from-line"] = "rbxassetid://74073639809355",
	["arrow-right-left"] = "rbxassetid://77015754304300",
	["arrow-right-to-line"] = "rbxassetid://78632510329852",
	["arrow-right"] = "rbxassetid://113692007244654",
	["arrow-up-0-1"] = "rbxassetid://105257823943016",
	["arrow-up-1-0"] = "rbxassetid://134175521693798",
	["arrow-up-a-z"] = "rbxassetid://77763416595160",
	["arrow-up-down"] = "rbxassetid://81019887641527",
	["arrow-up-from-dot"] = "rbxassetid://124408496673275",
	["arrow-up-from-line"] = "rbxassetid://95777664626453",
	["arrow-up-left"] = "rbxassetid://123490598231261",
	["arrow-up-narrow-wide"] = "rbxassetid://73006024672636",
	["arrow-up-right"] = "rbxassetid://129280608535523",
	["arrow-up-to-line"] = "rbxassetid://108818207813537",
	["arrow-up-wide-narrow"] = "rbxassetid://87437426951568",
	["arrow-up-z-a"] = "rbxassetid://107546173611884",
	["arrow-up"] = "rbxassetid://89282378235317",
	["arrows-up-from-line"] = "rbxassetid://133710016938621",
	asterisk = "rbxassetid://88552752106723",
	["at-sign"] = "rbxassetid://79059152889146",
	atom = "rbxassetid://73167696981648",
	["audio-lines"] = "rbxassetid://70930641819242",
	["audio-waveform"] = "rbxassetid://86462036665209",
	award = "rbxassetid://132740088158419",
	axe = "rbxassetid://132405197863294",
	["axis-3d"] = "rbxassetid://122438676546804",
	baby = "rbxassetid://93472926933440",
	backpack = "rbxassetid://140420225386018",
	["badge-alert"] = "rbxassetid://101829200081951",
	["badge-cent"] = "rbxassetid://133345018873154",
	["badge-check"] = "rbxassetid://76078495178149",
	["badge-dollar-sign"] = "rbxassetid://127139803581141",
	["badge-euro"] = "rbxassetid://120016477674659",
	["badge-indian-rupee"] = "rbxassetid://75659682309981",
	["badge-info"] = "rbxassetid://131995373201472",
	["badge-japanese-yen"] = "rbxassetid://99081574588615",
	["badge-minus"] = "rbxassetid://140321561183881",
	["badge-percent"] = "rbxassetid://121359224294885",
	["badge-plus"] = "rbxassetid://100325578561866",
	["badge-pound-sterling"] = "rbxassetid://119688217279444",
	["badge-question-mark"] = "rbxassetid://121464963737502",
	["badge-russian-ruble"] = "rbxassetid://108839463659864",
	["badge-swiss-franc"] = "rbxassetid://91447608372740",
	["badge-turkish-lira"] = "rbxassetid://137839965873529",
	["badge-x"] = "rbxassetid://122931434733842",
	badge = "rbxassetid://116620312917084",
	["baggage-claim"] = "rbxassetid://86922213051957",
	ban = "rbxassetid://90767043015246",
	banana = "rbxassetid://140713420056179",
	bandage = "rbxassetid://129660129590770",
	["banknote-arrow-down"] = "rbxassetid://139366449345199",
	["banknote-arrow-up"] = "rbxassetid://133758343082529",
	["banknote-x"] = "rbxassetid://95348701438065",
	banknote = "rbxassetid://104840231536668",
	barcode = "rbxassetid://118473018143689",
	barrel = "rbxassetid://130647115622774",
	baseline = "rbxassetid://124677132511270",
	bath = "rbxassetid://76031400297942",
	["battery-charging"] = "rbxassetid://80139357470047",
	["battery-full"] = "rbxassetid://70906718268972",
	["battery-low"] = "rbxassetid://139659256984314",
	["battery-medium"] = "rbxassetid://105934079398915",
	["battery-plus"] = "rbxassetid://91931341486966",
	["battery-warning"] = "rbxassetid://115230083817257",
	battery = "rbxassetid://70765800346189",
	beaker = "rbxassetid://80902539995520",
	["bean-off"] = "rbxassetid://98164436608714",
	bean = "rbxassetid://89491967076869",
	["bed-double"] = "rbxassetid://73820193212911",
	["bed-single"] = "rbxassetid://113423940880634",
	bed = "rbxassetid://97726529032925",
	beef = "rbxassetid://105850162318915",
	["beer-off"] = "rbxassetid://120333134736361",
	beer = "rbxassetid://116404978807744",
	["bell-dot"] = "rbxassetid://93161277118810",
	["bell-electric"] = "rbxassetid://100277767266983",
	["bell-minus"] = "rbxassetid://126334890449727",
	["bell-off"] = "rbxassetid://78560046118930",
	["bell-plus"] = "rbxassetid://77014333795836",
	["bell-ring"] = "rbxassetid://94612128913941",
	bell = "rbxassetid://97392696311902",
	["between-horizontal-end"] = "rbxassetid://81602774794322",
	["between-horizontal-start"] = "rbxassetid://76112384929846",
	["between-vertical-end"] = "rbxassetid://72817612571631",
	["between-vertical-start"] = "rbxassetid://85278312190301",
	["biceps-flexed"] = "rbxassetid://82004462003936",
	bike = "rbxassetid://102930322246035",
	binary = "rbxassetid://91751953950088",
	binoculars = "rbxassetid://101460003267896",
	biohazard = "rbxassetid://95956532900432",
	bird = "rbxassetid://132284145117371",
	birdhouse = "rbxassetid://83999157401433",
	bitcoin = "rbxassetid://95459240442938",
	blend = "rbxassetid://111679612185257",
	blinds = "rbxassetid://71164165283925",
	blocks = "rbxassetid://72212693357737",
	["bluetooth-connected"] = "rbxassetid://96315134002985",
	["bluetooth-off"] = "rbxassetid://80600044218117",
	["bluetooth-searching"] = "rbxassetid://100673019606426",
	bluetooth = "rbxassetid://90506573139443",
	bold = "rbxassetid://116141470019166",
	bolt = "rbxassetid://102881251417484",
	bomb = "rbxassetid://139223800924636",
	bone = "rbxassetid://111242153474115",
	["book-a"] = "rbxassetid://104067275658465",
	["book-alert"] = "rbxassetid://124159928044853",
	["book-audio"] = "rbxassetid://109208148317037",
	["book-check"] = "rbxassetid://115999656081696",
	["book-copy"] = "rbxassetid://108543407492005",
	["book-dashed"] = "rbxassetid://127430784795958",
	["book-down"] = "rbxassetid://101011730128222",
	["book-headphones"] = "rbxassetid://108670200799574",
	["book-heart"] = "rbxassetid://112788845135284",
	["book-image"] = "rbxassetid://80808285757226",
	["book-key"] = "rbxassetid://116024426170705",
	["book-lock"] = "rbxassetid://118765061220571",
	["book-marked"] = "rbxassetid://73211024251780",
	["book-minus"] = "rbxassetid://112724962046282",
	["book-open-check"] = "rbxassetid://130848362492667",
	["book-open-text"] = "rbxassetid://100629528672195",
	["book-open"] = "rbxassetid://129845326810392",
	["book-plus"] = "rbxassetid://140267785051233",
	["book-text"] = "rbxassetid://94011772484232",
	["book-type"] = "rbxassetid://97817304725443",
	["book-up-2"] = "rbxassetid://130161620853665",
	["book-up"] = "rbxassetid://98640174079190",
	["book-user"] = "rbxassetid://128489189240523",
	["book-x"] = "rbxassetid://118754548186537",
	book = "rbxassetid://125383279695672",
	["bookmark-check"] = "rbxassetid://93940443347986",
	["bookmark-minus"] = "rbxassetid://96807096039910",
	["bookmark-plus"] = "rbxassetid://121469724491615",
	["bookmark-x"] = "rbxassetid://112272342584706",
	bookmark = "rbxassetid://121093149326239",
	["boom-box"] = "rbxassetid://99901322535868",
	["bot-message-square"] = "rbxassetid://96145330292478",
	["bot-off"] = "rbxassetid://140417690560013",
	bot = "rbxassetid://80451686744860",
	["bottle-wine"] = "rbxassetid://131675403196921",
	["bow-arrow"] = "rbxassetid://124089655150375",
	box = "rbxassetid://101768155599700",
	boxes = "rbxassetid://136372617578355",
	braces = "rbxassetid://117761094704041",
	brackets = "rbxassetid://74368995728099",
	["brain-circuit"] = "rbxassetid://70547962410202",
	["brain-cog"] = "rbxassetid://132039205501538",
	brain = "rbxassetid://92424107303177",
	["brick-wall-fire"] = "rbxassetid://92980588705520",
	["brick-wall-shield"] = "rbxassetid://75954432775071",
	["brick-wall"] = "rbxassetid://112878522258821",
	["briefcase-business"] = "rbxassetid://129135125207283",
	["briefcase-conveyor-belt"] = "rbxassetid://108665725653714",
	["briefcase-medical"] = "rbxassetid://119917756334087",
	briefcase = "rbxassetid://96754188164225",
	["bring-to-front"] = "rbxassetid://132975903553748",
	["brush-cleaning"] = "rbxassetid://71728977448805",
	brush = "rbxassetid://127035535799640",
	bubbles = "rbxassetid://106183424168227",
	["bug-off"] = "rbxassetid://88020025049245",
	["bug-play"] = "rbxassetid://80107955888092",
	bug = "rbxassetid://83626408925438",
	["building-2"] = "rbxassetid://77873775611951",
	building = "rbxassetid://110616258983082",
	["bus-front"] = "rbxassetid://89863432456045",
	bus = "rbxassetid://133798469717463",
	["cable-car"] = "rbxassetid://128643682205596",
	cable = "rbxassetid://128449944504901",
	["cake-slice"] = "rbxassetid://136769828413242",
	cake = "rbxassetid://103131590503275",
	calculator = "rbxassetid://74915716529646",
	["calendar-1"] = "rbxassetid://98458364171044",
	["calendar-arrow-down"] = "rbxassetid://108415736543437",
	["calendar-arrow-up"] = "rbxassetid://70574654109118",
	["calendar-check-2"] = "rbxassetid://120231170248276",
	["calendar-check"] = "rbxassetid://71551019465748",
	["calendar-clock"] = "rbxassetid://119132152594595",
	["calendar-cog"] = "rbxassetid://122402172360287",
	["calendar-days"] = "rbxassetid://99072017568595",
	["calendar-fold"] = "rbxassetid://117368871270394",
	["calendar-heart"] = "rbxassetid://88839008103676",
	["calendar-minus-2"] = "rbxassetid://98846170279891",
	["calendar-minus"] = "rbxassetid://137354318924383",
	["calendar-off"] = "rbxassetid://109726151749217",
	["calendar-plus-2"] = "rbxassetid://112264562093883",
	["calendar-plus"] = "rbxassetid://125266115249843",
	["calendar-range"] = "rbxassetid://103641849247576",
	["calendar-search"] = "rbxassetid://92010083223634",
	["calendar-sync"] = "rbxassetid://78082218499697",
	["calendar-x-2"] = "rbxassetid://107518051061147",
	["calendar-x"] = "rbxassetid://106703374806500",
	calendar = "rbxassetid://114792700814035",
	["camera-off"] = "rbxassetid://81057636835256",
	camera = "rbxassetid://79950339943067",
	["candy-cane"] = "rbxassetid://71689468772492",
	["candy-off"] = "rbxassetid://110232752314832",
	candy = "rbxassetid://107812129154678",
	cannabis = "rbxassetid://98792006538601",
	["captions-off"] = "rbxassetid://105223545364193",
	captions = "rbxassetid://104960225031445",
	["car-front"] = "rbxassetid://87380942739063",
	["car-taxi-front"] = "rbxassetid://122455403384057",
	car = "rbxassetid://121065933462582",
	caravan = "rbxassetid://120070979471783",
	["card-sim"] = "rbxassetid://134490550095771",
	carrot = "rbxassetid://119118221444304",
	["case-lower"] = "rbxassetid://129303130603241",
	["case-sensitive"] = "rbxassetid://125410273293056",
	["case-upper"] = "rbxassetid://111633433531325",
	["cassette-tape"] = "rbxassetid://137065788934157",
	cast = "rbxassetid://98202245922071",
	castle = "rbxassetid://119275077187784",
	cat = "rbxassetid://124252153404931",
	cctv = "rbxassetid://99979894766624",
	["chart-area"] = "rbxassetid://123446436762366",
	["chart-bar-big"] = "rbxassetid://72336824986044",
	["chart-bar-decreasing"] = "rbxassetid://107217459044963",
	["chart-bar-increasing"] = "rbxassetid://88268905998571",
	["chart-bar-stacked"] = "rbxassetid://98478751113024",
	["chart-bar"] = "rbxassetid://105389816384108",
	["chart-candlestick"] = "rbxassetid://125676898615697",
	["chart-column-big"] = "rbxassetid://98598733210787",
	["chart-column-decreasing"] = "rbxassetid://73586137373563",
	["chart-column-increasing"] = "rbxassetid://120421615068601",
	["chart-column-stacked"] = "rbxassetid://86031449675105",
	["chart-column"] = "rbxassetid://97915995538580",
	["chart-gantt"] = "rbxassetid://88811660555940",
	["chart-line"] = "rbxassetid://101833156055618",
	["chart-network"] = "rbxassetid://104027882693561",
	["chart-no-axes-column-decreasing"] = "rbxassetid://123371717192542",
	["chart-no-axes-column-increasing"] = "rbxassetid://140383830943049",
	["chart-no-axes-column"] = "rbxassetid://94078751170351",
	["chart-no-axes-combined"] = "rbxassetid://121424233161912",
	["chart-no-axes-gantt"] = "rbxassetid://131936541106368",
	["chart-pie"] = "rbxassetid://113412261630136",
	["chart-scatter"] = "rbxassetid://108217585014571",
	["chart-spline"] = "rbxassetid://90307460742494",
	["check-check"] = "rbxassetid://95183312173858",
	["check-line"] = "rbxassetid://115122343485290",
	check = "rbxassetid://93898873302694",
	["chef-hat"] = "rbxassetid://121744015002573",
	cherry = "rbxassetid://139519182403183",
	["chess-bishop"] = "rbxassetid://121701705580238",
	["chess-king"] = "rbxassetid://90885687223462",
	["chess-knight"] = "rbxassetid://96467707042169",
	["chess-pawn"] = "rbxassetid://111318574652751",
	["chess-queen"] = "rbxassetid://98304702099749",
	["chess-rook"] = "rbxassetid://76223925830262",
	["chevron-down"] = "rbxassetid://134243273101015",
	["chevron-first"] = "rbxassetid://105243363790238",
	["chevron-last"] = "rbxassetid://89268452603731",
	["chevron-left"] = "rbxassetid://73780377692148",
	["chevron-right"] = "rbxassetid://92473583511724",
	["chevron-up"] = "rbxassetid://122444883127455",
	["chevrons-down-up"] = "rbxassetid://139404716013205",
	["chevrons-down"] = "rbxassetid://100524612205956",
	["chevrons-left-right-ellipsis"] = "rbxassetid://125035817741526",
	["chevrons-left-right"] = "rbxassetid://87910685945204",
	["chevrons-left"] = "rbxassetid://82617201744347",
	["chevrons-right-left"] = "rbxassetid://87149546686569",
	["chevrons-right"] = "rbxassetid://139121276490483",
	["chevrons-up-down"] = "rbxassetid://131833120209646",
	["chevrons-up"] = "rbxassetid://100467452364672",
	chromium = "rbxassetid://128165143739006",
	church = "rbxassetid://113714744350666",
	["cigarette-off"] = "rbxassetid://77797883078452",
	["circle-alert"] = "rbxassetid://83898160590116",
	["circle-arrow-down"] = "rbxassetid://95901860261344",
	["circle-arrow-left"] = "rbxassetid://102148876968988",
	["circle-arrow-out-down-left"] = "rbxassetid://140598097856694",
	["circle-arrow-out-down-right"] = "rbxassetid://119952801379305",
	["circle-arrow-out-up-left"] = "rbxassetid://132858212688303",
	["circle-arrow-out-up-right"] = "rbxassetid://81783743753173",
	["circle-arrow-right"] = "rbxassetid://70786767999559",
	["circle-arrow-up"] = "rbxassetid://84395128546494",
	["circle-check-big"] = "rbxassetid://93202927221730",
	["circle-check"] = "rbxassetid://85262178816537",
	["circle-chevron-down"] = "rbxassetid://137069490345718",
	["circle-chevron-left"] = "rbxassetid://130250009740827",
	["circle-chevron-right"] = "rbxassetid://125943696958495",
	["circle-chevron-up"] = "rbxassetid://111223574026321",
	["circle-dashed"] = "rbxassetid://126799443883746",
	["circle-divide"] = "rbxassetid://106398997754208",
	["circle-dollar-sign"] = "rbxassetid://91106238890387",
	["circle-dot-dashed"] = "rbxassetid://111451232827180",
	["circle-dot"] = "rbxassetid://82947033619201",
	["circle-ellipsis"] = "rbxassetid://91687150884779",
	["circle-equal"] = "rbxassetid://95133963751438",
	["circle-fading-arrow-up"] = "rbxassetid://104648212910336",
	["circle-fading-plus"] = "rbxassetid://91847890443490",
	["circle-gauge"] = "rbxassetid://108157549473765",
	["circle-minus"] = "rbxassetid://133556159576809",
	["circle-off"] = "rbxassetid://97923456918886",
	["circle-parking-off"] = "rbxassetid://128369410981252",
	["circle-parking"] = "rbxassetid://124034962915196",
	["circle-pause"] = "rbxassetid://139337739700879",
	["circle-percent"] = "rbxassetid://133311912860256",
	["circle-play"] = "rbxassetid://120408917249739",
	["circle-plus"] = "rbxassetid://113157136350384",
	["circle-pound-sterling"] = "rbxassetid://105476153083828",
	["circle-power"] = "rbxassetid://140676030155098",
	["circle-question-mark"] = "rbxassetid://97516698664325",
	["circle-slash-2"] = "rbxassetid://136766902186549",
	["circle-slash"] = "rbxassetid://125206439913049",
	["circle-small"] = "rbxassetid://73685402843600",
	["circle-star"] = "rbxassetid://120318414957104",
	["circle-stop"] = "rbxassetid://87400503942659",
	["circle-user-round"] = "rbxassetid://95489465399880",
	["circle-user"] = "rbxassetid://136220511671311",
	["circle-x"] = "rbxassetid://76821953846248",
	circle = "rbxassetid://130359823580534",
	["circuit-board"] = "rbxassetid://107695264369312",
	citrus = "rbxassetid://139018222976433",
	clapperboard = "rbxassetid://132660667070200",
	["clipboard-check"] = "rbxassetid://92649798577170",
	["clipboard-clock"] = "rbxassetid://123957515687745",
	["clipboard-copy"] = "rbxassetid://125851897718493",
	["clipboard-list"] = "rbxassetid://96460215958908",
	["clipboard-minus"] = "rbxassetid://107968008485671",
	["clipboard-paste"] = "rbxassetid://74382068849983",
	["clipboard-pen-line"] = "rbxassetid://77711589791615",
	["clipboard-pen"] = "rbxassetid://75290966822953",
	["clipboard-plus"] = "rbxassetid://134285318675662",
	["clipboard-type"] = "rbxassetid://89949374318028",
	["clipboard-x"] = "rbxassetid://102222456890103",
	clipboard = "rbxassetid://89601995828423",
	["clock-1"] = "rbxassetid://129363225422045",
	["clock-10"] = "rbxassetid://104332695855541",
	["clock-11"] = "rbxassetid://119023205186105",
	["clock-12"] = "rbxassetid://117789618723068",
	["clock-2"] = "rbxassetid://134710777209413",
	["clock-3"] = "rbxassetid://136385631189327",
	["clock-4"] = "rbxassetid://121808839832144",
	["clock-5"] = "rbxassetid://85082019959457",
	["clock-6"] = "rbxassetid://71009733505593",
	["clock-7"] = "rbxassetid://103111188546225",
	["clock-8"] = "rbxassetid://110059272125337",
	["clock-9"] = "rbxassetid://77610027126437",
	["clock-alert"] = "rbxassetid://97157344465162",
	["clock-arrow-down"] = "rbxassetid://92349314416042",
	["clock-arrow-up"] = "rbxassetid://111484286332629",
	["clock-check"] = "rbxassetid://85231630218857",
	["clock-fading"] = "rbxassetid://93205297285245",
	["clock-plus"] = "rbxassetid://93367709263150",
	clock = "rbxassetid://121808839832144",
	["closed-caption"] = "rbxassetid://99832644030788",
	["cloud-alert"] = "rbxassetid://91967273658626",
	["cloud-check"] = "rbxassetid://97318598202432",
	["cloud-cog"] = "rbxassetid://96497764065749",
	["cloud-download"] = "rbxassetid://121435581993566",
	["cloud-drizzle"] = "rbxassetid://139525315752605",
	["cloud-fog"] = "rbxassetid://76650233148776",
	["cloud-hail"] = "rbxassetid://72320462748242",
	["cloud-lightning"] = "rbxassetid://133517088924849",
	["cloud-moon-rain"] = "rbxassetid://127667837827018",
	["cloud-moon"] = "rbxassetid://71938114737914",
	["cloud-off"] = "rbxassetid://131907154501444",
	["cloud-rain-wind"] = "rbxassetid://107414583736721",
	["cloud-rain"] = "rbxassetid://105547081967408",
	["cloud-snow"] = "rbxassetid://72307126270226",
	["cloud-sun-rain"] = "rbxassetid://99041604425705",
	["cloud-sun"] = "rbxassetid://86114208148727",
	["cloud-upload"] = "rbxassetid://93307473217005",
	cloud = "rbxassetid://121226497050352",
	cloudy = "rbxassetid://105360479023346",
	clover = "rbxassetid://74925550436750",
	club = "rbxassetid://108490365816628",
	["code-xml"] = "rbxassetid://130150477351734",
	code = "rbxassetid://107380207681249",
	codepen = "rbxassetid://135643965971885",
	codesandbox = "rbxassetid://106911852964823",
	coffee = "rbxassetid://106864403231093",
	cog = "rbxassetid://116544501716299",
	coins = "rbxassetid://116510979641930",
	["columns-2"] = "rbxassetid://113004100221850",
	["columns-3-cog"] = "rbxassetid://121589691981064",
	["columns-3"] = "rbxassetid://115223357399375",
	["columns-4"] = "rbxassetid://130807991968419",
	combine = "rbxassetid://79908476334048",
	command = "rbxassetid://93648221906330",
	compass = "rbxassetid://115123411028382",
	component = "rbxassetid://110027788875080",
	computer = "rbxassetid://77480056459407",
	["concierge-bell"] = "rbxassetid://140384259310436",
	cone = "rbxassetid://97759550688437",
	construction = "rbxassetid://106539489968173",
	["contact-round"] = "rbxassetid://71907624112229",
	contact = "rbxassetid://75868297719012",
	container = "rbxassetid://91507237573499",
	contrast = "rbxassetid://112796643981497",
	cookie = "rbxassetid://73159504540002",
	["cooking-pot"] = "rbxassetid://94959783129799",
	["copy-check"] = "rbxassetid://91177247988892",
	["copy-minus"] = "rbxassetid://109524509933035",
	["copy-plus"] = "rbxassetid://113618379616952",
	["copy-slash"] = "rbxassetid://93805787810390",
	["copy-x"] = "rbxassetid://106557557978061",
	copy = "rbxassetid://78979572434545",
	copyleft = "rbxassetid://78559055698593",
	copyright = "rbxassetid://129433635747111",
	["corner-down-left"] = "rbxassetid://90473561177832",
	["corner-down-right"] = "rbxassetid://86512767702085",
	["corner-left-down"] = "rbxassetid://139876989150630",
	["corner-left-up"] = "rbxassetid://126228268096099",
	["corner-right-down"] = "rbxassetid://89237035551302",
	["corner-right-up"] = "rbxassetid://112851237026705",
	["corner-up-left"] = "rbxassetid://84669279763024",
	["corner-up-right"] = "rbxassetid://115099889693145",
	cpu = "rbxassetid://77549309870247",
	["creative-commons"] = "rbxassetid://90408210735312",
	["credit-card"] = "rbxassetid://99163352872346",
	croissant = "rbxassetid://130710485559420",
	crop = "rbxassetid://116344601101413",
	cross = "rbxassetid://101833377863588",
	crosshair = "rbxassetid://134242818164054",
	crown = "rbxassetid://127843403295538",
	cuboid = "rbxassetid://75618807946111",
	["cup-soda"] = "rbxassetid://121098640829562",
	currency = "rbxassetid://90551250119972",
	cylinder = "rbxassetid://90569677179169",
	dam = "rbxassetid://76874486231393",
	["database-backup"] = "rbxassetid://103403210984699",
	["database-zap"] = "rbxassetid://131199921258418",
	database = "rbxassetid://126791525623846",
	["decimals-arrow-left"] = "rbxassetid://120198500638749",
	["decimals-arrow-right"] = "rbxassetid://118263047146797",
	delete = "rbxassetid://126279426372342",
	dessert = "rbxassetid://71508133278830",
	diameter = "rbxassetid://97429051503783",
	["diamond-minus"] = "rbxassetid://128989071438290",
	["diamond-percent"] = "rbxassetid://107717860105959",
	["diamond-plus"] = "rbxassetid://134701163723675",
	diamond = "rbxassetid://105846996304890",
	["dice-1"] = "rbxassetid://112650149591038",
	["dice-2"] = "rbxassetid://112278274566793",
	["dice-3"] = "rbxassetid://118526270626312",
	["dice-4"] = "rbxassetid://113365650364004",
	["dice-5"] = "rbxassetid://72768312430593",
	["dice-6"] = "rbxassetid://85376239182543",
	dices = "rbxassetid://81268120302865",
	diff = "rbxassetid://135052708609715",
	["disc-2"] = "rbxassetid://91419420404185",
	["disc-3"] = "rbxassetid://135470554736048",
	["disc-album"] = "rbxassetid://74693460404344",
	disc = "rbxassetid://101908120120777",
	divide = "rbxassetid://136678191878278",
	["dna-off"] = "rbxassetid://89612426361540",
	dna = "rbxassetid://74007982981741",
	dock = "rbxassetid://121997427160252",
	dog = "rbxassetid://71920105558570",
	["dollar-sign"] = "rbxassetid://127320961224019",
	donut = "rbxassetid://72204922742657",
	["door-closed-locked"] = "rbxassetid://74027613267551",
	["door-closed"] = "rbxassetid://136249099949073",
	["door-open"] = "rbxassetid://91306356501736",
	dot = "rbxassetid://137321056643916",
	download = "rbxassetid://134814648082393",
	["drafting-compass"] = "rbxassetid://99701976182841",
	drama = "rbxassetid://110297795801577",
	dribbble = "rbxassetid://80231809663849",
	drill = "rbxassetid://108644821412796",
	drone = "rbxassetid://117299095794783",
	["droplet-off"] = "rbxassetid://119365002225172",
	droplet = "rbxassetid://100597455015098",
	droplets = "rbxassetid://140111846025180",
	drum = "rbxassetid://136979060344890",
	drumstick = "rbxassetid://104662462521709",
	dumbbell = "rbxassetid://80277236776212",
	["ear-off"] = "rbxassetid://87421916192807",
	ear = "rbxassetid://121894949934209",
	["earth-lock"] = "rbxassetid://88814147073745",
	earth = "rbxassetid://76231597751076",
	eclipse = "rbxassetid://114829622118222",
	["egg-fried"] = "rbxassetid://90622538210545",
	["egg-off"] = "rbxassetid://92288321309285",
	egg = "rbxassetid://117851493400222",
	["ellipsis-vertical"] = "rbxassetid://117978708573781",
	ellipsis = "rbxassetid://140019550645825",
	["equal-approximately"] = "rbxassetid://105382689698323",
	["equal-not"] = "rbxassetid://76864449458032",
	equal = "rbxassetid://123467780715624",
	eraser = "rbxassetid://133957773112410",
	["ethernet-port"] = "rbxassetid://75391715149314",
	euro = "rbxassetid://72229646524456",
	["ev-charger"] = "rbxassetid://97906158859623",
	expand = "rbxassetid://137492887754537",
	["external-link"] = "rbxassetid://129331830773832",
	["eye-closed"] = "rbxassetid://111063268625789",
	["eye-off"] = "rbxassetid://135928786788378",
	eye = "rbxassetid://100033680381365",
	facebook = "rbxassetid://72098528632192",
	factory = "rbxassetid://102170024318039",
	fan = "rbxassetid://78391400440696",
	["fast-forward"] = "rbxassetid://121615540167909",
	feather = "rbxassetid://91872927606406",
	fence = "rbxassetid://123451565578029",
	["ferris-wheel"] = "rbxassetid://79729205796176",
	figma = "rbxassetid://134182122852301",
	["file-archive"] = "rbxassetid://77018106869967",
	["file-axis-3d"] = "rbxassetid://133912328009885",
	["file-badge"] = "rbxassetid://74564895394477",
	["file-box"] = "rbxassetid://119264004071690",
	["file-braces-corner"] = "rbxassetid://77253337986109",
	["file-braces"] = "rbxassetid://95314128621234",
	["file-chart-column-increasing"] = "rbxassetid://134449481172067",
	["file-chart-column"] = "rbxassetid://82048481252560",
	["file-chart-line"] = "rbxassetid://71954360551345",
	["file-chart-pie"] = "rbxassetid://81072193564497",
	["file-check-corner"] = "rbxassetid://76295552859171",
	["file-check"] = "rbxassetid://82604001452455",
	["file-clock"] = "rbxassetid://102325208830990",
	["file-code-corner"] = "rbxassetid://78293841184371",
	["file-code"] = "rbxassetid://130978036895504",
	["file-cog"] = "rbxassetid://101385347151368",
	["file-diff"] = "rbxassetid://96147216772241",
	["file-digit"] = "rbxassetid://89220220354580",
	["file-down"] = "rbxassetid://120650154178290",
	["file-exclamation-point"] = "rbxassetid://102821865889635",
	["file-headphone"] = "rbxassetid://100533735901986",
	["file-heart"] = "rbxassetid://132214916401696",
	["file-image"] = "rbxassetid://123334057511782",
	["file-input"] = "rbxassetid://124728604166044",
	["file-key"] = "rbxassetid://118790255921100",
	["file-lock"] = "rbxassetid://72170228691242",
	["file-minus-corner"] = "rbxassetid://119263271735124",
	["file-minus"] = "rbxassetid://111014798459222",
	["file-music"] = "rbxassetid://134948051536671",
	["file-output"] = "rbxassetid://92146832572911",
	["file-pen-line"] = "rbxassetid://104622936345006",
	["file-pen"] = "rbxassetid://79556179730240",
	["file-play"] = "rbxassetid://89006821567838",
	["file-plus-corner"] = "rbxassetid://76544604043974",
	["file-plus"] = "rbxassetid://78881710800060",
	["file-question-mark"] = "rbxassetid://127617422859576",
	["file-scan"] = "rbxassetid://129480105228213",
	["file-search-corner"] = "rbxassetid://90974165234008",
	["file-search"] = "rbxassetid://97780235974933",
	["file-signal"] = "rbxassetid://122070252538165",
	["file-sliders"] = "rbxassetid://85787771732439",
	["file-spreadsheet"] = "rbxassetid://134501869359270",
	["file-stack"] = "rbxassetid://138929929862605",
	["file-symlink"] = "rbxassetid://91865722036510",
	["file-terminal"] = "rbxassetid://116757454755476",
	["file-text"] = "rbxassetid://90496405707281",
	["file-type-corner"] = "rbxassetid://124902230275209",
	["file-type"] = "rbxassetid://115272552799361",
	["file-up"] = "rbxassetid://131173039312748",
	["file-user"] = "rbxassetid://99552018455009",
	["file-video-camera"] = "rbxassetid://81719056173960",
	["file-volume"] = "rbxassetid://111264764438958",
	["file-x-corner"] = "rbxassetid://87554136773609",
	["file-x"] = "rbxassetid://107333775515154",
	file = "rbxassetid://74748492079329",
	files = "rbxassetid://102806336233202",
	film = "rbxassetid://120978945609706",
	fingerprint = "rbxassetid://112173305232811",
	["fire-extinguisher"] = "rbxassetid://111643493006960",
	["fish-off"] = "rbxassetid://89756724887508",
	["fish-symbol"] = "rbxassetid://118475177681618",
	fish = "rbxassetid://124360663785796",
	["flag-off"] = "rbxassetid://112944528856799",
	["flag-triangle-left"] = "rbxassetid://88045221285272",
	["flag-triangle-right"] = "rbxassetid://108292480304566",
	flag = "rbxassetid://78183383236196",
	["flame-kindling"] = "rbxassetid://139728976917928",
	flame = "rbxassetid://98218034436456",
	["flashlight-off"] = "rbxassetid://79780362871740",
	flashlight = "rbxassetid://100286985600444",
	["flask-conical-off"] = "rbxassetid://112597970025298",
	["flask-conical"] = "rbxassetid://128406680901165",
	["flask-round"] = "rbxassetid://127508287324940",
	["flip-horizontal-2"] = "rbxassetid://103726993598186",
	["flip-horizontal"] = "rbxassetid://122937530107837",
	["flip-vertical-2"] = "rbxassetid://103836358956328",
	["flip-vertical"] = "rbxassetid://108003917346888",
	["flower-2"] = "rbxassetid://72934574245145",
	flower = "rbxassetid://86129438272762",
	focus = "rbxassetid://87493973153317",
	["fold-horizontal"] = "rbxassetid://92835712442240",
	["fold-vertical"] = "rbxassetid://108873727253656",
	["folder-archive"] = "rbxassetid://97312009460206",
	["folder-check"] = "rbxassetid://128492920904557",
	["folder-clock"] = "rbxassetid://111964836738545",
	["folder-closed"] = "rbxassetid://118286209350843",
	["folder-code"] = "rbxassetid://70624096349370",
	["folder-cog"] = "rbxassetid://85299519462846",
	["folder-dot"] = "rbxassetid://138687772725278",
	["folder-down"] = "rbxassetid://118044108459225",
	["folder-git-2"] = "rbxassetid://101394054141166",
	["folder-git"] = "rbxassetid://121885778095158",
	["folder-heart"] = "rbxassetid://79104747211105",
	["folder-input"] = "rbxassetid://90699920697871",
	["folder-kanban"] = "rbxassetid://78313285104072",
	["folder-key"] = "rbxassetid://85270407596791",
	["folder-lock"] = "rbxassetid://119201572260567",
	["folder-minus"] = "rbxassetid://85648718999010",
	["folder-open-dot"] = "rbxassetid://74741494767354",
	["folder-open"] = "rbxassetid://76018996254888",
	["folder-output"] = "rbxassetid://101532447937612",
	["folder-pen"] = "rbxassetid://112770491173911",
	["folder-plus"] = "rbxassetid://91865663406119",
	["folder-root"] = "rbxassetid://103333751154693",
	["folder-search-2"] = "rbxassetid://71276453442655",
	["folder-search"] = "rbxassetid://110568075123861",
	["folder-symlink"] = "rbxassetid://127485747227189",
	["folder-sync"] = "rbxassetid://91544602659796",
	["folder-tree"] = "rbxassetid://85577554337861",
	["folder-up"] = "rbxassetid://72008269765857",
	["folder-x"] = "rbxassetid://91699618247635",
	folder = "rbxassetid://80846616596607",
	folders = "rbxassetid://110351216219061",
	footprints = "rbxassetid://139192589041315",
	forklift = "rbxassetid://72030930983101",
	forward = "rbxassetid://97545944739523",
	frame = "rbxassetid://109080612832751",
	framer = "rbxassetid://108384807262391",
	frown = "rbxassetid://124407301067982",
	fuel = "rbxassetid://106447647274511",
	fullscreen = "rbxassetid://77793665526178",
	["funnel-plus"] = "rbxassetid://100780233821928",
	["funnel-x"] = "rbxassetid://70984385812555",
	funnel = "rbxassetid://108829540827529",
	["gallery-horizontal-end"] = "rbxassetid://74672430161161",
	["gallery-horizontal"] = "rbxassetid://80004001442122",
	["gallery-thumbnails"] = "rbxassetid://136219289862706",
	["gallery-vertical-end"] = "rbxassetid://106461402088317",
	["gallery-vertical"] = "rbxassetid://119299431466725",
	["gamepad-2"] = "rbxassetid://92483947987410",
	["gamepad-directional"] = "rbxassetid://84342305212226",
	gamepad = "rbxassetid://121607283959010",
	gauge = "rbxassetid://110273524101447",
	gavel = "rbxassetid://78952298198456",
	gem = "rbxassetid://112904952151156",
	["georgian-lari"] = "rbxassetid://98084432591687",
	ghost = "rbxassetid://113822048130017",
	gift = "rbxassetid://109855212076373",
	["git-branch-minus"] = "rbxassetid://97385010649411",
	["git-branch-plus"] = "rbxassetid://125944221134316",
	["git-branch"] = "rbxassetid://90490195516649",
	["git-commit-horizontal"] = "rbxassetid://133646041800147",
	["git-commit-vertical"] = "rbxassetid://122098032990350",
	["git-compare-arrows"] = "rbxassetid://84874426520216",
	["git-compare"] = "rbxassetid://91945124438792",
	["git-fork"] = "rbxassetid://89954992404765",
	["git-graph"] = "rbxassetid://86166832019304",
	["git-merge"] = "rbxassetid://131833355158059",
	["git-pull-request-arrow"] = "rbxassetid://94507974577439",
	["git-pull-request-closed"] = "rbxassetid://78070600389091",
	["git-pull-request-create-arrow"] = "rbxassetid://127422677061091",
	["git-pull-request-create"] = "rbxassetid://105929577383926",
	["git-pull-request-draft"] = "rbxassetid://76173459869943",
	["git-pull-request"] = "rbxassetid://138463010991471",
	github = "rbxassetid://120349554354380",
	gitlab = "rbxassetid://114054627192933",
	["glass-water"] = "rbxassetid://115526102400988",
	glasses = "rbxassetid://87936407455373",
	["globe-lock"] = "rbxassetid://134065526704402",
	globe = "rbxassetid://114238209622913",
	goal = "rbxassetid://120517954878160",
	gpu = "rbxassetid://95577823614219",
	["graduation-cap"] = "rbxassetid://93771896340220",
	grape = "rbxassetid://134760640415561",
	["grid-2x2-check"] = "rbxassetid://138468840220821",
	["grid-2x2-plus"] = "rbxassetid://91811610580247",
	["grid-2x2-x"] = "rbxassetid://72407303981388",
	["grid-2x2"] = "rbxassetid://99050491897640",
	["grid-3x2"] = "rbxassetid://95528684210010",
	["grid-3x3"] = "rbxassetid://70419024781206",
	["grip-horizontal"] = "rbxassetid://136255899715930",
	["grip-vertical"] = "rbxassetid://137183678565296",
	grip = "rbxassetid://109058783556768",
	group = "rbxassetid://107643418926671",
	guitar = "rbxassetid://75915531867926",
	ham = "rbxassetid://74465607934635",
	hamburger = "rbxassetid://93086916815495",
	hammer = "rbxassetid://83545120140895",
	["hand-coins"] = "rbxassetid://126990543175462",
	["hand-fist"] = "rbxassetid://83341608917591",
	["hand-grab"] = "rbxassetid://88867162163985",
	["hand-heart"] = "rbxassetid://117507367668412",
	["hand-helping"] = "rbxassetid://89897738419446",
	["hand-metal"] = "rbxassetid://113619498548713",
	["hand-platter"] = "rbxassetid://88594727743168",
	hand = "rbxassetid://130703864968637",
	handbag = "rbxassetid://135675846264061",
	handshake = "rbxassetid://78442115255814",
	["hard-drive-download"] = "rbxassetid://73913801230614",
	["hard-drive-upload"] = "rbxassetid://85762133615118",
	["hard-drive"] = "rbxassetid://88183305858463",
	["hard-hat"] = "rbxassetid://128050846767382",
	hash = "rbxassetid://82890331678520",
	["hat-glasses"] = "rbxassetid://101165538224815",
	haze = "rbxassetid://108857561768901",
	["hdmi-port"] = "rbxassetid://103693661037020",
	["heading-1"] = "rbxassetid://118129315662110",
	["heading-2"] = "rbxassetid://110209069670094",
	["heading-3"] = "rbxassetid://90267885237062",
	["heading-4"] = "rbxassetid://129625620307602",
	["heading-5"] = "rbxassetid://120386663181267",
	["heading-6"] = "rbxassetid://90959079775093",
	heading = "rbxassetid://129254312067735",
	["headphone-off"] = "rbxassetid://85038251615641",
	headphones = "rbxassetid://118833729589183",
	headset = "rbxassetid://129269236787694",
	["heart-crack"] = "rbxassetid://110987638564119",
	["heart-handshake"] = "rbxassetid://111483078692002",
	["heart-minus"] = "rbxassetid://96827380163326",
	["heart-off"] = "rbxassetid://89748414415617",
	["heart-plus"] = "rbxassetid://94877796283249",
	["heart-pulse"] = "rbxassetid://129352925579546",
	heart = "rbxassetid://116559368303288",
	heater = "rbxassetid://140478466880916",
	helicopter = "rbxassetid://111557171735930",
	hexagon = "rbxassetid://127592089339199",
	highlighter = "rbxassetid://77411555641113",
	history = "rbxassetid://123980022019922",
	["hop-off"] = "rbxassetid://103386036934034",
	hop = "rbxassetid://82778923997672",
	hospital = "rbxassetid://105868763850707",
	hotel = "rbxassetid://132283390859718",
	hourglass = "rbxassetid://86160434939203",
	["house-heart"] = "rbxassetid://136054771868597",
	["house-plug"] = "rbxassetid://71438263712075",
	["house-plus"] = "rbxassetid://118495165208309",
	["house-wifi"] = "rbxassetid://126495519725698",
	house = "rbxassetid://98755624629571",
	["ice-cream-bowl"] = "rbxassetid://124867218454386",
	["ice-cream-cone"] = "rbxassetid://90751397288639",
	["id-card-lanyard"] = "rbxassetid://90761480469224",
	["id-card"] = "rbxassetid://75354294622640",
	["image-down"] = "rbxassetid://78972295741235",
	["image-minus"] = "rbxassetid://101066016918565",
	["image-off"] = "rbxassetid://81934811700938",
	["image-play"] = "rbxassetid://129501806784210",
	["image-plus"] = "rbxassetid://70391970623917",
	["image-up"] = "rbxassetid://126610009605241",
	["image-upscale"] = "rbxassetid://106963545024679",
	images = "rbxassetid://79350649395557",
	import = "rbxassetid://116545008906029",
	inbox = "rbxassetid://112591360302868",
	["indian-rupee"] = "rbxassetid://113038778381805",
	infinity = "rbxassetid://98083086936965",
	info = "rbxassetid://124560466474914",
	["inspection-panel"] = "rbxassetid://70905313146088",
	instagram = "rbxassetid://119864798614855",
	italic = "rbxassetid://96220378864282",
	["iteration-ccw"] = "rbxassetid://140221832794083",
	["iteration-cw"] = "rbxassetid://95534489554662",
	["japanese-yen"] = "rbxassetid://106362863465813",
	joystick = "rbxassetid://99416790224739",
	kanban = "rbxassetid://125934100055431",
	kayak = "rbxassetid://136107544609389",
	["key-round"] = "rbxassetid://83619031955390",
	["key-square"] = "rbxassetid://94621420033649",
	key = "rbxassetid://96510194465420",
	["keyboard-music"] = "rbxassetid://121058541758636",
	["keyboard-off"] = "rbxassetid://92466375369772",
	keyboard = "rbxassetid://121474456068237",
	["lamp-ceiling"] = "rbxassetid://80032758469141",
	["lamp-desk"] = "rbxassetid://85290686983238",
	["lamp-floor"] = "rbxassetid://104585881375892",
	["lamp-wall-down"] = "rbxassetid://91271394132073",
	["lamp-wall-up"] = "rbxassetid://132141464337445",
	lamp = "rbxassetid://110730830653382",
	["land-plot"] = "rbxassetid://96449039620294",
	landmark = "rbxassetid://76885079756393",
	languages = "rbxassetid://90816903776498",
	["laptop-minimal-check"] = "rbxassetid://114352019833865",
	["laptop-minimal"] = "rbxassetid://136705765566068",
	laptop = "rbxassetid://111387063244975",
	["lasso-select"] = "rbxassetid://105609719912753",
	lasso = "rbxassetid://121072936884007",
	laugh = "rbxassetid://104491311361166",
	["layers-2"] = "rbxassetid://70536710516357",
	layers = "rbxassetid://81973586053257",
	["layout-dashboard"] = "rbxassetid://139929981863901",
	["layout-grid"] = "rbxassetid://81344910161871",
	["layout-list"] = "rbxassetid://87462136296578",
	["layout-panel-left"] = "rbxassetid://125092469751491",
	["layout-panel-top"] = "rbxassetid://91943941515944",
	["layout-template"] = "rbxassetid://115564446417985",
	leaf = "rbxassetid://119951075637174",
	["leafy-green"] = "rbxassetid://105146290493154",
	lectern = "rbxassetid://106166425183862",
	["library-big"] = "rbxassetid://106794530191412",
	library = "rbxassetid://114334671982047",
	["life-buoy"] = "rbxassetid://81168450671956",
	ligature = "rbxassetid://111397873269411",
	["lightbulb-off"] = "rbxassetid://83795722296178",
	lightbulb = "rbxassetid://103871245626488",
	["line-squiggle"] = "rbxassetid://109555164424447",
	["link-2-off"] = "rbxassetid://76885956296867",
	["link-2"] = "rbxassetid://86072351557466",
	link = "rbxassetid://131607023382430",
	linkedin = "rbxassetid://132842789255788",
	["list-check"] = "rbxassetid://72374358471156",
	["list-checks"] = "rbxassetid://99809353635593",
	["list-chevrons-down-up"] = "rbxassetid://137409641500711",
	["list-chevrons-up-down"] = "rbxassetid://81825351389084",
	["list-collapse"] = "rbxassetid://124505247702401",
	["list-end"] = "rbxassetid://77650610048119",
	["list-filter-plus"] = "rbxassetid://96385120752336",
	["list-filter"] = "rbxassetid://103321376129527",
	["list-indent-decrease"] = "rbxassetid://137879979228193",
	["list-indent-increase"] = "rbxassetid://79051053161201",
	["list-minus"] = "rbxassetid://138507965142671",
	["list-music"] = "rbxassetid://126380635781840",
	["list-ordered"] = "rbxassetid://83212528113913",
	["list-plus"] = "rbxassetid://112384738137814",
	["list-restart"] = "rbxassetid://91703153577421",
	["list-start"] = "rbxassetid://84828348299727",
	["list-todo"] = "rbxassetid://132980603752108",
	["list-tree"] = "rbxassetid://97685396239010",
	["list-video"] = "rbxassetid://93648525452489",
	["list-x"] = "rbxassetid://113025303988861",
	list = "rbxassetid://113179976918783",
	["loader-circle"] = "rbxassetid://116535712789945",
	["loader-pinwheel"] = "rbxassetid://108513357940900",
	loader = "rbxassetid://78408734580845",
	["locate-fixed"] = "rbxassetid://137367361548433",
	["locate-off"] = "rbxassetid://73729216338137",
	locate = "rbxassetid://84467676590391",
	["lock-keyhole-open"] = "rbxassetid://110863509313073",
	["lock-keyhole"] = "rbxassetid://78672912777756",
	["lock-open"] = "rbxassetid://93597915325122",
	lock = "rbxassetid://134724289526879",
	["log-in"] = "rbxassetid://103768533135201",
	["log-out"] = "rbxassetid://84895399304975",
	logs = "rbxassetid://89772091251787",
	lollipop = "rbxassetid://84681611583044",
	luggage = "rbxassetid://76619236486400",
	magnet = "rbxassetid://135162361226972",
	["mail-check"] = "rbxassetid://86921536259917",
	["mail-minus"] = "rbxassetid://81989813236553",
	["mail-open"] = "rbxassetid://122785416858638",
	["mail-plus"] = "rbxassetid://104886401588341",
	["mail-question-mark"] = "rbxassetid://126540170949819",
	["mail-search"] = "rbxassetid://135616173775287",
	["mail-warning"] = "rbxassetid://81495303676089",
	["mail-x"] = "rbxassetid://74607841705644",
	mail = "rbxassetid://103945161245599",
	mailbox = "rbxassetid://82765503320335",
	mails = "rbxassetid://90673453450080",
	["map-minus"] = "rbxassetid://129525760577747",
	["map-pin-check-inside"] = "rbxassetid://107130529843809",
	["map-pin-check"] = "rbxassetid://118110914690154",
	["map-pin-house"] = "rbxassetid://80546885029816",
	["map-pin-minus-inside"] = "rbxassetid://79005529692964",
	["map-pin-minus"] = "rbxassetid://74518762643623",
	["map-pin-off"] = "rbxassetid://82474689391020",
	["map-pin-pen"] = "rbxassetid://113515395277504",
	["map-pin-plus-inside"] = "rbxassetid://134639656514430",
	["map-pin-plus"] = "rbxassetid://91875228967029",
	["map-pin-x-inside"] = "rbxassetid://126235934252379",
	["map-pin-x"] = "rbxassetid://101085273547316",
	["map-pin"] = "rbxassetid://84279202219901",
	["map-pinned"] = "rbxassetid://103963788475034",
	["map-plus"] = "rbxassetid://129388826743495",
	map = "rbxassetid://95107167260947",
	["mars-stroke"] = "rbxassetid://131973193186828",
	mars = "rbxassetid://111287112372511",
	martini = "rbxassetid://82977695401058",
	["maximize-2"] = "rbxassetid://73085922906397",
	maximize = "rbxassetid://76045941763188",
	medal = "rbxassetid://79016002264450",
	["megaphone-off"] = "rbxassetid://124280774193935",
	megaphone = "rbxassetid://118759541854879",
	meh = "rbxassetid://132197867028557",
	["memory-stick"] = "rbxassetid://93212591343119",
	menu = "rbxassetid://77021539815611",
	merge = "rbxassetid://126201866476775",
	["message-circle-code"] = "rbxassetid://112865244991651",
	["message-circle-dashed"] = "rbxassetid://81525157881897",
	["message-circle-heart"] = "rbxassetid://101990756073677",
	["message-circle-more"] = "rbxassetid://92856823884663",
	["message-circle-off"] = "rbxassetid://134955643890328",
	["message-circle-plus"] = "rbxassetid://106562979649273",
	["message-circle-question-mark"] = "rbxassetid://107700302759934",
	["message-circle-reply"] = "rbxassetid://137071749508334",
	["message-circle-warning"] = "rbxassetid://119020096067894",
	["message-circle-x"] = "rbxassetid://126843387725536",
	["message-circle"] = "rbxassetid://127255077587058",
	["message-square-code"] = "rbxassetid://110968863152123",
	["message-square-dashed"] = "rbxassetid://107653455516238",
	["message-square-diff"] = "rbxassetid://75472190472625",
	["message-square-dot"] = "rbxassetid://127806382463916",
	["message-square-heart"] = "rbxassetid://75612811742074",
	["message-square-lock"] = "rbxassetid://81268215619563",
	["message-square-more"] = "rbxassetid://120139782405970",
	["message-square-off"] = "rbxassetid://99961019005789",
	["message-square-plus"] = "rbxassetid://76934450256199",
	["message-square-quote"] = "rbxassetid://116670768629340",
	["message-square-reply"] = "rbxassetid://130985622754637",
	["message-square-share"] = "rbxassetid://131017005324026",
	["message-square-text"] = "rbxassetid://94899503194205",
	["message-square-warning"] = "rbxassetid://138432903962261",
	["message-square-x"] = "rbxassetid://137285463279462",
	["message-square"] = "rbxassetid://83881670383280",
	["messages-square"] = "rbxassetid://97532166733358",
	["mic-off"] = "rbxassetid://82123034444822",
	["mic-vocal"] = "rbxassetid://99082286164362",
	mic = "rbxassetid://89640799126523",
	microchip = "rbxassetid://73937907669903",
	microscope = "rbxassetid://116875530102782",
	microwave = "rbxassetid://108411735353008",
	milestone = "rbxassetid://101618292325920",
	["milk-off"] = "rbxassetid://72388480962742",
	milk = "rbxassetid://96221903896918",
	["minimize-2"] = "rbxassetid://116269596042539",
	minimize = "rbxassetid://121304296213645",
	minus = "rbxassetid://118026365011536",
	["monitor-check"] = "rbxassetid://86651948439229",
	["monitor-cloud"] = "rbxassetid://85931096038318",
	["monitor-cog"] = "rbxassetid://94345128715799",
	["monitor-dot"] = "rbxassetid://130394010063680",
	["monitor-down"] = "rbxassetid://97466933743423",
	["monitor-off"] = "rbxassetid://74395526657953",
	["monitor-pause"] = "rbxassetid://76002184067562",
	["monitor-play"] = "rbxassetid://133018824306217",
	["monitor-smartphone"] = "rbxassetid://84335680433378",
	["monitor-speaker"] = "rbxassetid://81744810060380",
	["monitor-stop"] = "rbxassetid://98708958984757",
	["monitor-up"] = "rbxassetid://96035360858377",
	["monitor-x"] = "rbxassetid://126265210441423",
	monitor = "rbxassetid://72664649203050",
	["moon-star"] = "rbxassetid://82782200506348",
	moon = "rbxassetid://83380517901735",
	motorbike = "rbxassetid://94580787368233",
	["mountain-snow"] = "rbxassetid://105315495740588",
	mountain = "rbxassetid://73269957566415",
	["mouse-off"] = "rbxassetid://75267871697595",
	["mouse-pointer-2-off"] = "rbxassetid://104701076865632",
	["mouse-pointer-2"] = "rbxassetid://117093892862228",
	["mouse-pointer-ban"] = "rbxassetid://106849413057133",
	["mouse-pointer-click"] = "rbxassetid://107150227368485",
	["mouse-pointer"] = "rbxassetid://72322454962935",
	mouse = "rbxassetid://73096068864710",
	["move-3d"] = "rbxassetid://103365982054003",
	["move-diagonal-2"] = "rbxassetid://117298577948096",
	["move-diagonal"] = "rbxassetid://101433481954184",
	["move-down-left"] = "rbxassetid://102819433534567",
	["move-down-right"] = "rbxassetid://101479760041877",
	["move-down"] = "rbxassetid://70510115135583",
	["move-horizontal"] = "rbxassetid://88513523439149",
	["move-left"] = "rbxassetid://137614740247980",
	["move-right"] = "rbxassetid://132455779472989",
	["move-up-left"] = "rbxassetid://139079815540148",
	["move-up-right"] = "rbxassetid://105885140592646",
	["move-up"] = "rbxassetid://84505444262658",
	["move-vertical"] = "rbxassetid://86234730730899",
	move = "rbxassetid://116138709011735",
	["music-2"] = "rbxassetid://134397426600888",
	["music-3"] = "rbxassetid://94466120066498",
	["music-4"] = "rbxassetid://132459323665838",
	music = "rbxassetid://113343203848535",
	["navigation-2-off"] = "rbxassetid://116569611780763",
	["navigation-2"] = "rbxassetid://81889066747907",
	["navigation-off"] = "rbxassetid://87003270290777",
	navigation = "rbxassetid://79308213542922",
	network = "rbxassetid://127410729922644",
	newspaper = "rbxassetid://123479530460544",
	nfc = "rbxassetid://76822396542242",
	["non-binary"] = "rbxassetid://78442360386235",
	["notebook-pen"] = "rbxassetid://140380614761023",
	["notebook-tabs"] = "rbxassetid://127371085570083",
	["notebook-text"] = "rbxassetid://93061585217270",
	notebook = "rbxassetid://136132108664987",
	["notepad-text-dashed"] = "rbxassetid://135793446376219",
	["notepad-text"] = "rbxassetid://93404682958966",
	["nut-off"] = "rbxassetid://78795397311573",
	nut = "rbxassetid://127146410705656",
	["octagon-alert"] = "rbxassetid://140438367956051",
	["octagon-minus"] = "rbxassetid://74720436795421",
	["octagon-pause"] = "rbxassetid://103161463909039",
	["octagon-x"] = "rbxassetid://90498161006311",
	octagon = "rbxassetid://120803515514852",
	omega = "rbxassetid://70414080018786",
	option = "rbxassetid://100776883894054",
	orbit = "rbxassetid://108926136860562",
	origami = "rbxassetid://136020626667101",
	["package-2"] = "rbxassetid://70394974762575",
	["package-check"] = "rbxassetid://102374216055130",
	["package-minus"] = "rbxassetid://114492858789692",
	["package-open"] = "rbxassetid://132890233237818",
	["package-plus"] = "rbxassetid://129261988138366",
	["package-search"] = "rbxassetid://95465120894145",
	["package-x"] = "rbxassetid://70818501607442",
	package = "rbxassetid://97261141732706",
	["paint-bucket"] = "rbxassetid://124275586663284",
	["paint-roller"] = "rbxassetid://115248074358348",
	["paintbrush-vertical"] = "rbxassetid://105151296591292",
	paintbrush = "rbxassetid://125572663700289",
	palette = "rbxassetid://86350350950064",
	panda = "rbxassetid://132509022802512",
	["panel-bottom-close"] = "rbxassetid://74287004071159",
	["panel-bottom-dashed"] = "rbxassetid://131084651621603",
	["panel-bottom-open"] = "rbxassetid://107768659586540",
	["panel-bottom"] = "rbxassetid://132127145048511",
	["panel-left-close"] = "rbxassetid://126579818823552",
	["panel-left-dashed"] = "rbxassetid://75536606374585",
	["panel-left-open"] = "rbxassetid://111075816195767",
	["panel-left-right-dashed"] = "rbxassetid://110100707973959",
	["panel-left"] = "rbxassetid://97419752870313",
	["panel-right-close"] = "rbxassetid://139528655524132",
	["panel-right-dashed"] = "rbxassetid://94959793877311",
	["panel-right-open"] = "rbxassetid://118114419142794",
	["panel-right"] = "rbxassetid://116365035443156",
	["panel-top-bottom-dashed"] = "rbxassetid://134737235653344",
	["panel-top-close"] = "rbxassetid://83578325777808",
	["panel-top-dashed"] = "rbxassetid://70522913169237",
	["panel-top-open"] = "rbxassetid://137959875507454",
	["panel-top"] = "rbxassetid://75838479462875",
	["panels-left-bottom"] = "rbxassetid://72996856149149",
	["panels-right-bottom"] = "rbxassetid://90659068960726",
	["panels-top-left"] = "rbxassetid://79858853850600",
	paperclip = "rbxassetid://92088291163453",
	parentheses = "rbxassetid://78950955173096",
	["parking-meter"] = "rbxassetid://84652733960568",
	["party-popper"] = "rbxassetid://111626795712193",
	pause = "rbxassetid://74873705394436",
	["paw-print"] = "rbxassetid://112218825427601",
	["pc-case"] = "rbxassetid://122978648019101",
	["pen-line"] = "rbxassetid://109108135755303",
	["pen-off"] = "rbxassetid://84807123119438",
	["pen-tool"] = "rbxassetid://106145404953445",
	pen = "rbxassetid://72037878096321",
	["pencil-line"] = "rbxassetid://88392917053533",
	["pencil-off"] = "rbxassetid://103330927652832",
	["pencil-ruler"] = "rbxassetid://110120288284597",
	pencil = "rbxassetid://137986121120732",
	pentagon = "rbxassetid://79184802179890",
	percent = "rbxassetid://130155041032013",
	["person-standing"] = "rbxassetid://125020872044147",
	["philippine-peso"] = "rbxassetid://91173798254675",
	["phone-call"] = "rbxassetid://70555587592860",
	["phone-forwarded"] = "rbxassetid://113269614319737",
	["phone-incoming"] = "rbxassetid://82863576359288",
	["phone-missed"] = "rbxassetid://130156165198376",
	["phone-off"] = "rbxassetid://133318623553383",
	["phone-outgoing"] = "rbxassetid://104576478735825",
	phone = "rbxassetid://128804946640049",
	pi = "rbxassetid://74936036243146",
	piano = "rbxassetid://85008880789520",
	pickaxe = "rbxassetid://105888023317688",
	["picture-in-picture-2"] = "rbxassetid://112803319544468",
	["picture-in-picture"] = "rbxassetid://80579597835123",
	["piggy-bank"] = "rbxassetid://79498575790721",
	["pilcrow-left"] = "rbxassetid://103803000849583",
	["pilcrow-right"] = "rbxassetid://104881733911870",
	pilcrow = "rbxassetid://139512780392871",
	["pill-bottle"] = "rbxassetid://118394692404597",
	pill = "rbxassetid://73280534813448",
	["pin-off"] = "rbxassetid://127696372451750",
	pin = "rbxassetid://120978111007514",
	pipette = "rbxassetid://133167932934404",
	pizza = "rbxassetid://126964453193501",
	["plane-landing"] = "rbxassetid://122555692211889",
	["plane-takeoff"] = "rbxassetid://117179478829575",
	plane = "rbxassetid://126985561580989",
	play = "rbxassetid://135609604299893",
	["plug-2"] = "rbxassetid://97912386476366",
	["plug-zap"] = "rbxassetid://74506269884055",
	plug = "rbxassetid://99782373064495",
	plus = "rbxassetid://111774323017047",
	["pocket-knife"] = "rbxassetid://134075428063965",
	pocket = "rbxassetid://136686762542964",
	podcast = "rbxassetid://109577075549215",
	["pointer-off"] = "rbxassetid://95488389312794",
	pointer = "rbxassetid://92615117311099",
	popcorn = "rbxassetid://139446511232750",
	popsicle = "rbxassetid://112696318077073",
	["pound-sterling"] = "rbxassetid://127482649469130",
	["power-off"] = "rbxassetid://118768311012214",
	power = "rbxassetid://96479131758775",
	presentation = "rbxassetid://106134583757890",
	["printer-check"] = "rbxassetid://130273549443689",
	printer = "rbxassetid://76080649734247",
	projector = "rbxassetid://103281856385283",
	proportions = "rbxassetid://130046855997237",
	puzzle = "rbxassetid://136837798892463",
	pyramid = "rbxassetid://107811442374127",
	["qr-code"] = "rbxassetid://105329945723350",
	quote = "rbxassetid://103271711590001",
	rabbit = "rbxassetid://98580518804206",
	radar = "rbxassetid://138528222906635",
	radiation = "rbxassetid://104499586848433",
	radical = "rbxassetid://132758286926047",
	["radio-receiver"] = "rbxassetid://129598303378835",
	["radio-tower"] = "rbxassetid://93958663130054",
	radio = "rbxassetid://85611589536956",
	radius = "rbxassetid://89814505307129",
	["rail-symbol"] = "rbxassetid://134295386306962",
	rainbow = "rbxassetid://132488862841895",
	rat = "rbxassetid://127400975953159",
	ratio = "rbxassetid://126369423897295",
	["receipt-cent"] = "rbxassetid://91557573925201",
	["receipt-euro"] = "rbxassetid://94015722210295",
	["receipt-indian-rupee"] = "rbxassetid://89718170439990",
	["receipt-japanese-yen"] = "rbxassetid://132472560758851",
	["receipt-pound-sterling"] = "rbxassetid://73934967569625",
	["receipt-russian-ruble"] = "rbxassetid://105164576936853",
	["receipt-swiss-franc"] = "rbxassetid://72503668620116",
	["receipt-text"] = "rbxassetid://138483536013737",
	["receipt-turkish-lira"] = "rbxassetid://91950765836342",
	receipt = "rbxassetid://77877895901792",
	["rectangle-circle"] = "rbxassetid://100642423153903",
	["rectangle-ellipsis"] = "rbxassetid://112919953980965",
	["rectangle-goggles"] = "rbxassetid://98605436666727",
	["rectangle-horizontal"] = "rbxassetid://90224199814966",
	["rectangle-vertical"] = "rbxassetid://117277050590967",
	recycle = "rbxassetid://140417023381961",
	["redo-2"] = "rbxassetid://70451039017914",
	["redo-dot"] = "rbxassetid://94252981719732",
	redo = "rbxassetid://116150342119054",
	["refresh-ccw-dot"] = "rbxassetid://106702246753270",
	["refresh-ccw"] = "rbxassetid://117913330389477",
	["refresh-cw-off"] = "rbxassetid://140179498843054",
	["refresh-cw"] = "rbxassetid://138133190015277",
	refrigerator = "rbxassetid://102614042652753",
	regex = "rbxassetid://100727200791841",
	["remove-formatting"] = "rbxassetid://112833162022628",
	["repeat-1"] = "rbxassetid://130144534857095",
	["repeat-2"] = "rbxassetid://85927537182704",
	["repeat"] = "rbxassetid://121886242955173",
	["replace-all"] = "rbxassetid://127862728198635",
	replace = "rbxassetid://128404082279430",
	["reply-all"] = "rbxassetid://71723137343562",
	reply = "rbxassetid://109788633497028",
	rewind = "rbxassetid://95205297521988",
	ribbon = "rbxassetid://94265331526851",
	rocket = "rbxassetid://87412317685854",
	["rocking-chair"] = "rbxassetid://110420269495360",
	["roller-coaster"] = "rbxassetid://112426178972099",
	rose = "rbxassetid://126336840238769",
	["rotate-3d"] = "rbxassetid://76300551576392",
	["rotate-ccw-key"] = "rbxassetid://74976035240976",
	["rotate-ccw-square"] = "rbxassetid://90515853170424",
	["rotate-ccw"] = "rbxassetid://110116685948665",
	["rotate-cw-square"] = "rbxassetid://77095448159303",
	["rotate-cw"] = "rbxassetid://84183336178654",
	["route-off"] = "rbxassetid://106350402024079",
	route = "rbxassetid://89968303228953",
	router = "rbxassetid://102130331994471",
	["rows-2"] = "rbxassetid://112556185960101",
	["rows-3"] = "rbxassetid://117215586961375",
	["rows-4"] = "rbxassetid://125646021959055",
	rss = "rbxassetid://131789058984793",
	["ruler-dimension-line"] = "rbxassetid://70673861371412",
	ruler = "rbxassetid://81432445547423",
	["russian-ruble"] = "rbxassetid://126357936542156",
	sailboat = "rbxassetid://87110567187540",
	salad = "rbxassetid://128864507821603",
	sandwich = "rbxassetid://104573187458917",
	["satellite-dish"] = "rbxassetid://136742443888305",
	satellite = "rbxassetid://134967053164645",
	["saudi-riyal"] = "rbxassetid://102282769104635",
	["save-all"] = "rbxassetid://116946975799440",
	["save-off"] = "rbxassetid://87085435778560",
	save = "rbxassetid://126116963775616",
	["scale-3d"] = "rbxassetid://72414199620352",
	scale = "rbxassetid://108203682317477",
	scaling = "rbxassetid://122360365318466",
	["scan-barcode"] = "rbxassetid://96889457154761",
	["scan-eye"] = "rbxassetid://99244790601968",
	["scan-face"] = "rbxassetid://109959345069668",
	["scan-heart"] = "rbxassetid://106280819776142",
	["scan-line"] = "rbxassetid://126544908146540",
	["scan-qr-code"] = "rbxassetid://105409149549927",
	["scan-search"] = "rbxassetid://80009010551347",
	["scan-text"] = "rbxassetid://73702396787766",
	scan = "rbxassetid://123104789658180",
	school = "rbxassetid://76351530290068",
	["scissors-line-dashed"] = "rbxassetid://122237447974173",
	scissors = "rbxassetid://118665510911274",
	["screen-share-off"] = "rbxassetid://107677572669805",
	["screen-share"] = "rbxassetid://85137895705653",
	["scroll-text"] = "rbxassetid://97321022666868",
	scroll = "rbxassetid://74072101474951",
	["search-check"] = "rbxassetid://75442076191356",
	["search-code"] = "rbxassetid://117114794592802",
	["search-slash"] = "rbxassetid://96483932261041",
	["search-x"] = "rbxassetid://137319957522951",
	search = "rbxassetid://121018724060431",
	section = "rbxassetid://91732188298948",
	["send-horizontal"] = "rbxassetid://111734392411664",
	["send-to-back"] = "rbxassetid://75340312862253",
	send = "rbxassetid://127751956873796",
	["separator-horizontal"] = "rbxassetid://84864453699927",
	["separator-vertical"] = "rbxassetid://84031801478581",
	["server-cog"] = "rbxassetid://138470287250966",
	["server-crash"] = "rbxassetid://132810618000212",
	["server-off"] = "rbxassetid://114048751507723",
	server = "rbxassetid://92188766517878",
	["settings-2"] = "rbxassetid://135684703553372",
	settings = "rbxassetid://80758916183665",
	shapes = "rbxassetid://129989433311409",
	["share-2"] = "rbxassetid://71210767962065",
	share = "rbxassetid://87340985053299",
	sheet = "rbxassetid://134902122480171",
	shell = "rbxassetid://140212943563599",
	["shield-alert"] = "rbxassetid://114995877719925",
	["shield-ban"] = "rbxassetid://108765041044649",
	["shield-check"] = "rbxassetid://87354736164608",
	["shield-ellipsis"] = "rbxassetid://114794739892123",
	["shield-half"] = "rbxassetid://117842634172647",
	["shield-minus"] = "rbxassetid://89965059528921",
	["shield-off"] = "rbxassetid://133426959132690",
	["shield-plus"] = "rbxassetid://100664857995498",
	["shield-question-mark"] = "rbxassetid://135722075265150",
	["shield-user"] = "rbxassetid://124832775645347",
	["shield-x"] = "rbxassetid://73370117343811",
	shield = "rbxassetid://110987169760162",
	["ship-wheel"] = "rbxassetid://130797795829448",
	ship = "rbxassetid://83995100553930",
	shirt = "rbxassetid://106579555405966",
	["shopping-bag"] = "rbxassetid://71885477293226",
	["shopping-basket"] = "rbxassetid://138646411956433",
	["shopping-cart"] = "rbxassetid://128420521375441",
	shovel = "rbxassetid://102465000512056",
	["shower-head"] = "rbxassetid://75884944024117",
	shredder = "rbxassetid://122125164414463",
	shrimp = "rbxassetid://102625900815307",
	shrink = "rbxassetid://90953687918880",
	shrub = "rbxassetid://127326280714343",
	shuffle = "rbxassetid://132382786975101",
	sigma = "rbxassetid://126884244870899",
	["signal-high"] = "rbxassetid://130436670012270",
	["signal-low"] = "rbxassetid://73674683500458",
	["signal-medium"] = "rbxassetid://125003021367019",
	["signal-zero"] = "rbxassetid://130045332414754",
	signal = "rbxassetid://78424889355261",
	signature = "rbxassetid://114402748013000",
	["signpost-big"] = "rbxassetid://115780185675001",
	signpost = "rbxassetid://106584743791433",
	siren = "rbxassetid://134210267818039",
	["skip-back"] = "rbxassetid://70466132711334",
	["skip-forward"] = "rbxassetid://124844823753990",
	skull = "rbxassetid://137726256442333",
	slack = "rbxassetid://96089719516736",
	slash = "rbxassetid://117792185664263",
	slice = "rbxassetid://95810504278179",
	["sliders-horizontal"] = "rbxassetid://85538382643347",
	["sliders-vertical"] = "rbxassetid://101190569086853",
	["smartphone-charging"] = "rbxassetid://102837532613995",
	["smartphone-nfc"] = "rbxassetid://82326425754446",
	smartphone = "rbxassetid://96623008834511",
	["smile-plus"] = "rbxassetid://131981881472144",
	smile = "rbxassetid://105880397565283",
	snail = "rbxassetid://70904536548363",
	snowflake = "rbxassetid://101235206534566",
	["soap-dispenser-droplet"] = "rbxassetid://77258480479465",
	sofa = "rbxassetid://114427687218324",
	["solar-panel"] = "rbxassetid://132448188047921",
	soup = "rbxassetid://115092551871618",
	space = "rbxassetid://87072088914178",
	spade = "rbxassetid://131444449466462",
	sparkle = "rbxassetid://111044800239623",
	sparkles = "rbxassetid://138635884129147",
	speaker = "rbxassetid://96227183003618",
	speech = "rbxassetid://87013139446349",
	["spell-check-2"] = "rbxassetid://81556731785534",
	["spell-check"] = "rbxassetid://91913483031334",
	["spline-pointer"] = "rbxassetid://84842840956804",
	spline = "rbxassetid://129406685807412",
	split = "rbxassetid://105112438805988",
	spool = "rbxassetid://124541981347743",
	spotlight = "rbxassetid://77571742539344",
	["spray-can"] = "rbxassetid://128372039366326",
	sprout = "rbxassetid://100091687832508",
	["square-activity"] = "rbxassetid://89496630185293",
	["square-arrow-down-left"] = "rbxassetid://108194680296901",
	["square-arrow-down-right"] = "rbxassetid://99403846801050",
	["square-arrow-down"] = "rbxassetid://135962519626588",
	["square-arrow-left"] = "rbxassetid://111671474549238",
	["square-arrow-out-down-left"] = "rbxassetid://125714881756353",
	["square-arrow-out-down-right"] = "rbxassetid://89971003001390",
	["square-arrow-out-up-left"] = "rbxassetid://103759986579087",
	["square-arrow-out-up-right"] = "rbxassetid://91221896066807",
	["square-arrow-right"] = "rbxassetid://113920471701361",
	["square-arrow-up-left"] = "rbxassetid://112424670290693",
	["square-arrow-up-right"] = "rbxassetid://76602291406940",
	["square-arrow-up"] = "rbxassetid://106998604646718",
	["square-asterisk"] = "rbxassetid://89186832353625",
	["square-bottom-dashed-scissors"] = "rbxassetid://79076980104803",
	["square-chart-gantt"] = "rbxassetid://104034017316411",
	["square-check-big"] = "rbxassetid://115320390907184",
	["square-check"] = "rbxassetid://134682053539509",
	["square-chevron-down"] = "rbxassetid://91032307924592",
	["square-chevron-left"] = "rbxassetid://73143404829510",
	["square-chevron-right"] = "rbxassetid://90612077729930",
	["square-chevron-up"] = "rbxassetid://85565910197337",
	["square-code"] = "rbxassetid://81604576616881",
	["square-dashed-bottom-code"] = "rbxassetid://100354801563230",
	["square-dashed-bottom"] = "rbxassetid://101102319625624",
	["square-dashed-kanban"] = "rbxassetid://90388067649847",
	["square-dashed-mouse-pointer"] = "rbxassetid://121016142178467",
	["square-dashed-top-solid"] = "rbxassetid://117157577548540",
	["square-dashed"] = "rbxassetid://136905537847606",
	["square-divide"] = "rbxassetid://99894657101970",
	["square-dot"] = "rbxassetid://116613421354866",
	["square-equal"] = "rbxassetid://110283363706707",
	["square-function"] = "rbxassetid://86075219551088",
	["square-kanban"] = "rbxassetid://114537101260131",
	["square-library"] = "rbxassetid://73810931222081",
	["square-m"] = "rbxassetid://117662700410577",
	["square-menu"] = "rbxassetid://104067089444415",
	["square-minus"] = "rbxassetid://116764432015770",
	["square-mouse-pointer"] = "rbxassetid://76141850603920",
	["square-parking-off"] = "rbxassetid://100857293535141",
	["square-parking"] = "rbxassetid://133116656122387",
	["square-pause"] = "rbxassetid://86608552787615",
	["square-pen"] = "rbxassetid://120239476110475",
	["square-percent"] = "rbxassetid://87111930314567",
	["square-pi"] = "rbxassetid://75383328781618",
	["square-pilcrow"] = "rbxassetid://131854284699367",
	["square-play"] = "rbxassetid://108186325238481",
	["square-plus"] = "rbxassetid://114713264461873",
	["square-power"] = "rbxassetid://129240437805187",
	["square-radical"] = "rbxassetid://132645931868292",
	["square-round-corner"] = "rbxassetid://104592745113567",
	["square-scissors"] = "rbxassetid://110601255612411",
	["square-sigma"] = "rbxassetid://113231244246816",
	["square-slash"] = "rbxassetid://105477013908757",
	["square-split-horizontal"] = "rbxassetid://76095370148660",
	["square-split-vertical"] = "rbxassetid://88589192032058",
	["square-square"] = "rbxassetid://136555087357875",
	["square-stack"] = "rbxassetid://100463396619394",
	["square-star"] = "rbxassetid://94506958703720",
	["square-stop"] = "rbxassetid://80018708472943",
	["square-terminal"] = "rbxassetid://83969264476798",
	["square-user-round"] = "rbxassetid://86484997229302",
	["square-user"] = "rbxassetid://70771214183445",
	["square-x"] = "rbxassetid://125136183850190",
	square = "rbxassetid://86304921356806",
	["squares-exclude"] = "rbxassetid://102345385822324",
	["squares-intersect"] = "rbxassetid://120869602570119",
	["squares-subtract"] = "rbxassetid://131484650948795",
	["squares-unite"] = "rbxassetid://96673080107843",
	["squircle-dashed"] = "rbxassetid://129936702532522",
	squircle = "rbxassetid://82426632573807",
	squirrel = "rbxassetid://112864252085343",
	stamp = "rbxassetid://92370779813368",
	["star-half"] = "rbxassetid://117449275562979",
	["star-off"] = "rbxassetid://75742832732503",
	star = "rbxassetid://136141469398409",
	["step-back"] = "rbxassetid://108672750005121",
	["step-forward"] = "rbxassetid://126131872136145",
	stethoscope = "rbxassetid://122331031702148",
	sticker = "rbxassetid://79938203791608",
	["sticky-note"] = "rbxassetid://111894074643919",
	store = "rbxassetid://90338129673705",
	["stretch-horizontal"] = "rbxassetid://87665042192343",
	["stretch-vertical"] = "rbxassetid://95265463417122",
	strikethrough = "rbxassetid://103417324549613",
	subscript = "rbxassetid://74553514785183",
	["sun-dim"] = "rbxassetid://129141645592715",
	["sun-medium"] = "rbxassetid://130278807964710",
	["sun-moon"] = "rbxassetid://75752898854559",
	["sun-snow"] = "rbxassetid://112791898014579",
	sun = "rbxassetid://110150589884127",
	sunrise = "rbxassetid://134705665494098",
	sunset = "rbxassetid://75904872203588",
	superscript = "rbxassetid://96887696590118",
	["swatch-book"] = "rbxassetid://126786244872453",
	["swiss-franc"] = "rbxassetid://113497920041625",
	["switch-camera"] = "rbxassetid://76841154349737",
	sword = "rbxassetid://124448418211665",
	swords = "rbxassetid://81872698913435",
	syringe = "rbxassetid://123891270479254",
	["table-2"] = "rbxassetid://95751552281545",
	["table-cells-merge"] = "rbxassetid://95363715175258",
	["table-cells-split"] = "rbxassetid://114799086088649",
	["table-columns-split"] = "rbxassetid://111011625447949",
	["table-of-contents"] = "rbxassetid://135044763275414",
	["table-properties"] = "rbxassetid://125062886015372",
	["table-rows-split"] = "rbxassetid://96443733673997",
	table = "rbxassetid://109109148250737",
	["tablet-smartphone"] = "rbxassetid://133680859813404",
	tablet = "rbxassetid://128403991264386",
	tablets = "rbxassetid://80835787970735",
	tag = "rbxassetid://129104970103940",
	tags = "rbxassetid://107179263080798",
	["tally-1"] = "rbxassetid://115301298241643",
	["tally-2"] = "rbxassetid://110363186864027",
	["tally-3"] = "rbxassetid://97655344572540",
	["tally-4"] = "rbxassetid://102633494371890",
	["tally-5"] = "rbxassetid://88031817475886",
	tangent = "rbxassetid://123263132981724",
	target = "rbxassetid://87563802520297",
	telescope = "rbxassetid://91755049143647",
	["tent-tree"] = "rbxassetid://76698322463977",
	tent = "rbxassetid://109779587826330",
	terminal = "rbxassetid://106783148545356",
	["test-tube-diagonal"] = "rbxassetid://75662704378840",
	["test-tube"] = "rbxassetid://98801015650164",
	["test-tubes"] = "rbxassetid://92555361447433",
	["text-align-center"] = "rbxassetid://84051028246390",
	["text-align-end"] = "rbxassetid://130041738343555",
	["text-align-justify"] = "rbxassetid://80279880143030",
	["text-align-start"] = "rbxassetid://134489585487649",
	["text-cursor-input"] = "rbxassetid://107551944047171",
	["text-cursor"] = "rbxassetid://115984654447300",
	["text-initial"] = "rbxassetid://129458097472087",
	["text-quote"] = "rbxassetid://139278366448736",
	["text-search"] = "rbxassetid://92345384671606",
	["text-select"] = "rbxassetid://117087320884956",
	["text-wrap"] = "rbxassetid://114804318314018",
	theater = "rbxassetid://108558145549163",
	["thermometer-snowflake"] = "rbxassetid://121876188028425",
	["thermometer-sun"] = "rbxassetid://106693240074310",
	thermometer = "rbxassetid://106546011492311",
	["thumbs-down"] = "rbxassetid://87794009914015",
	["thumbs-up"] = "rbxassetid://111137070767020",
	["ticket-check"] = "rbxassetid://105428777212507",
	["ticket-minus"] = "rbxassetid://78966299769328",
	["ticket-percent"] = "rbxassetid://80834774406405",
	["ticket-plus"] = "rbxassetid://110086734392189",
	["ticket-slash"] = "rbxassetid://89045681172265",
	["ticket-x"] = "rbxassetid://88674114109926",
	ticket = "rbxassetid://126527071492145",
	["tickets-plane"] = "rbxassetid://100367018248695",
	tickets = "rbxassetid://135268612687833",
	["timer-off"] = "rbxassetid://110916370767271",
	["timer-reset"] = "rbxassetid://110052125369932",
	timer = "rbxassetid://85473888890506",
	["toggle-left"] = "rbxassetid://85887872573050",
	["toggle-right"] = "rbxassetid://90411952142550",
	toilet = "rbxassetid://80930782432931",
	["tool-case"] = "rbxassetid://87533537832522",
	tornado = "rbxassetid://88358291515768",
	torus = "rbxassetid://70855707283051",
	["touchpad-off"] = "rbxassetid://78784008075456",
	touchpad = "rbxassetid://74882354908014",
	["tower-control"] = "rbxassetid://95937619060532",
	["toy-brick"] = "rbxassetid://86293483924633",
	tractor = "rbxassetid://103376704722051",
	["traffic-cone"] = "rbxassetid://74110220470369",
	["train-front-tunnel"] = "rbxassetid://105194827005114",
	["train-front"] = "rbxassetid://125237934215370",
	["train-track"] = "rbxassetid://77451032453723",
	["tram-front"] = "rbxassetid://93315182364998",
	transgender = "rbxassetid://135530817673639",
	["trash-2"] = "rbxassetid://109843431391323",
	trash = "rbxassetid://106723740584310",
	["tree-deciduous"] = "rbxassetid://123124389219004",
	["tree-palm"] = "rbxassetid://103846705893963",
	["tree-pine"] = "rbxassetid://124662547202594",
	trees = "rbxassetid://121203841375919",
	trello = "rbxassetid://130987241149527",
	["trending-down"] = "rbxassetid://139309232226438",
	["trending-up-down"] = "rbxassetid://85083293981691",
	["trending-up"] = "rbxassetid://81819858538839",
	["triangle-alert"] = "rbxassetid://125920361880643",
	["triangle-dashed"] = "rbxassetid://124324079103935",
	["triangle-right"] = "rbxassetid://116930791412791",
	triangle = "rbxassetid://126330486745540",
	trophy = "rbxassetid://131545003268773",
	["truck-electric"] = "rbxassetid://111873446387359",
	truck = "rbxassetid://86662707764771",
	["turkish-lira"] = "rbxassetid://114589876174070",
	turntable = "rbxassetid://129870346487856",
	turtle = "rbxassetid://118295081560334",
	["tv-minimal-play"] = "rbxassetid://99201833426972",
	["tv-minimal"] = "rbxassetid://100382201729427",
	tv = "rbxassetid://135687724791776",
	twitch = "rbxassetid://71383308134888",
	twitter = "rbxassetid://88791703276842",
	["type-outline"] = "rbxassetid://80108627791690",
	type = "rbxassetid://133543553793564",
	["umbrella-off"] = "rbxassetid://72395143739955",
	umbrella = "rbxassetid://127502210274589",
	underline = "rbxassetid://123709229216544",
	["undo-2"] = "rbxassetid://113885292059932",
	["undo-dot"] = "rbxassetid://132055277744844",
	undo = "rbxassetid://111258459077271",
	["unfold-horizontal"] = "rbxassetid://117128358526398",
	["unfold-vertical"] = "rbxassetid://116593025265499",
	ungroup = "rbxassetid://106674800451003",
	university = "rbxassetid://84652528263642",
	["unlink-2"] = "rbxassetid://128131898892572",
	unlink = "rbxassetid://139835795227752",
	unplug = "rbxassetid://90171381619874",
	upload = "rbxassetid://138212042425501",
	usb = "rbxassetid://117230058949613",
	["user-check"] = "rbxassetid://81775205032725",
	["user-cog"] = "rbxassetid://92795491530865",
	["user-lock"] = "rbxassetid://78892639693821",
	["user-minus"] = "rbxassetid://126976941957511",
	["user-pen"] = "rbxassetid://87445472574836",
	["user-plus"] = "rbxassetid://118514469915884",
	["user-round-check"] = "rbxassetid://118794737621941",
	["user-round-cog"] = "rbxassetid://78239503290053",
	["user-round-minus"] = "rbxassetid://98944176636447",
	["user-round-pen"] = "rbxassetid://108155244324878",
	["user-round-plus"] = "rbxassetid://113301899567470",
	["user-round-search"] = "rbxassetid://71565774381870",
	["user-round-x"] = "rbxassetid://122367980560930",
	["user-round"] = "rbxassetid://136485052187963",
	["user-search"] = "rbxassetid://101335649828115",
	["user-star"] = "rbxassetid://98777846316000",
	["user-x"] = "rbxassetid://139748155894754",
	user = "rbxassetid://81589895647169",
	["users-round"] = "rbxassetid://103005444008339",
	users = "rbxassetid://115398113982385",
	["utensils-crossed"] = "rbxassetid://109520762270383",
	utensils = "rbxassetid://139952569804235",
	["utility-pole"] = "rbxassetid://101965541238242",
	variable = "rbxassetid://104743088438151",
	vault = "rbxassetid://108049164599845",
	["vector-square"] = "rbxassetid://86713728565344",
	vegan = "rbxassetid://119489190688082",
	["venetian-mask"] = "rbxassetid://102636443033920",
	["venus-and-mars"] = "rbxassetid://120227752103771",
	venus = "rbxassetid://82891342220859",
	["vibrate-off"] = "rbxassetid://113446447326246",
	vibrate = "rbxassetid://108330910738733",
	["video-off"] = "rbxassetid://132239189859305",
	video = "rbxassetid://107587444636945",
	videotape = "rbxassetid://114816894323398",
	view = "rbxassetid://118717253976805",
	voicemail = "rbxassetid://134313454010227",
	volleyball = "rbxassetid://83889351124153",
	["volume-1"] = "rbxassetid://98514588731639",
	["volume-2"] = "rbxassetid://89344380902620",
	["volume-off"] = "rbxassetid://103047478058767",
	["volume-x"] = "rbxassetid://139252359189540",
	volume = "rbxassetid://103236289817396",
	vote = "rbxassetid://89409762851246",
	["wallet-cards"] = "rbxassetid://129728715308337",
	["wallet-minimal"] = "rbxassetid://137800448816116",
	wallet = "rbxassetid://132331555762628",
	wallpaper = "rbxassetid://74682121235494",
	["wand-sparkles"] = "rbxassetid://82546429942392",
	wand = "rbxassetid://114580617777835",
	warehouse = "rbxassetid://78388887451080",
	["washing-machine"] = "rbxassetid://104194127573858",
	watch = "rbxassetid://130544621618405",
	["waves-ladder"] = "rbxassetid://101808619355514",
	waves = "rbxassetid://96340135183647",
	waypoints = "rbxassetid://102450133666017",
	webcam = "rbxassetid://104148487911129",
	["webhook-off"] = "rbxassetid://96370548093471",
	webhook = "rbxassetid://112812457747322",
	weight = "rbxassetid://103860559844854",
	["wheat-off"] = "rbxassetid://133294844612307",
	wheat = "rbxassetid://85261952080359",
	["whole-word"] = "rbxassetid://90111083954485",
	["wifi-cog"] = "rbxassetid://110500263326209",
	["wifi-high"] = "rbxassetid://81954601342139",
	["wifi-low"] = "rbxassetid://138217335635913",
	["wifi-off"] = "rbxassetid://74113634330106",
	["wifi-pen"] = "rbxassetid://91290205064712",
	["wifi-sync"] = "rbxassetid://84043971055177",
	["wifi-zero"] = "rbxassetid://124286465246123",
	wifi = "rbxassetid://104669375183960",
	["wind-arrow-down"] = "rbxassetid://127753987414870",
	wind = "rbxassetid://114551690399915",
	["wine-off"] = "rbxassetid://108294164302317",
	wine = "rbxassetid://115743721332829",
	workflow = "rbxassetid://99186544029189",
	worm = "rbxassetid://115752311548091",
	wrench = "rbxassetid://112148279212860",
	x = "rbxassetid://110786993356448",
	youtube = "rbxassetid://123663668456341",
	["zap-off"] = "rbxassetid://81385483183652",
	zap = "rbxassetid://130551565616516",
	["zoom-in"] = "rbxassetid://127956924984803",
	["zoom-out"] = "rbxassetid://108334162607319",
	balloon = "rbxassetid://97489111621526",
	["beef-off"] = "rbxassetid://99869959725200",
	["book-search"] = "rbxassetid://132585409504950",
	calendars = "rbxassetid://130944763042289",
	["cannabis-off"] = "rbxassetid://101938500363812",
	["cctv-off"] = "rbxassetid://75925370187295",
	cigarette = "rbxassetid://137149549886852",
	["circle-pile"] = "rbxassetid://116353155251541",
	["cloud-backup"] = "rbxassetid://111649579696132",
	["cloud-sync"] = "rbxassetid://79393911188593",
	["database-search"] = "rbxassetid://92017137080138",
	ellipse = "rbxassetid://71559658267482",
	["fingerprint-pattern"] = "rbxassetid://80934710831288",
	["fishing-hook"] = "rbxassetid://121038780855899",
	["fishing-rod"] = "rbxassetid://71754848048049",
	form = "rbxassetid://72999643971000",
	["git-merge-conflict"] = "rbxassetid://85677801675703",
	["globe-off"] = "rbxassetid://77775243585824",
	["globe-x"] = "rbxassetid://109268097029296",
	hd = "rbxassetid://71682790698278",
	image = "rbxassetid://112751259236831",
	["layers-plus"] = "rbxassetid://77587765623057",
	["lens-concave"] = "rbxassetid://94819631937027",
	["lens-convex"] = "rbxassetid://74736504195474",
	["line-dot-right-horizontal"] = "rbxassetid://104718593155221",
	["line-style"] = "rbxassetid://90176717785772",
	["map-pin-search"] = "rbxassetid://89065012915078",
	["message-circle-check"] = "rbxassetid://132772297689418",
	["message-square-check"] = "rbxassetid://125789987055668",
	metronome = "rbxassetid://101991829345965",
	["mirror-rectangular"] = "rbxassetid://109046769760336",
	["mirror-round"] = "rbxassetid://121534049429097",
	["mouse-left"] = "rbxassetid://99144293708743",
	["mouse-right"] = "rbxassetid://88331710212594",
	["printer-x"] = "rbxassetid://103002721801548",
	["radio-off"] = "rbxassetid://80359258046586",
	road = "rbxassetid://120251329173530",
	scooter = "rbxassetid://100035452787934",
	["search-alert"] = "rbxassetid://127597984617505",
	["shelving-unit"] = "rbxassetid://80116568514793",
	["shield-cog-corner"] = "rbxassetid://111694066132698",
	["shield-cog"] = "rbxassetid://129235695057857",
	["sport-shoe"] = "rbxassetid://120495992692630",
	["square-arrow-right-enter"] = "rbxassetid://138867831495334",
	["square-arrow-right-exit"] = "rbxassetid://133688575845430",
	["square-centerline-dashed-horizontal"] = "rbxassetid://77780104374341",
	["square-centerline-dashed-vertical"] = "rbxassetid://107878435803525",
	stone = "rbxassetid://135161057497830",
	toolbox = "rbxassetid://85341033903792",
	["towel-rack"] = "rbxassetid://125223915620991",
	["user-key"] = "rbxassetid://105403041782190",
	["user-round-key"] = "rbxassetid://124547549008939",
	van = "rbxassetid://122066377022942",
	["waves-arrow-down"] = "rbxassetid://129215220911792",
	["waves-arrow-up"] = "rbxassetid://102314705716217",
	["weight-tilde"] = "rbxassetid://112081212176951",
	["x-line-top"] = "rbxassetid://140592656289509",
	["zodiac-aquarius"] = "rbxassetid://74560047770362",
	["zodiac-aries"] = "rbxassetid://73255859670234",
	["zodiac-cancer"] = "rbxassetid://131985162532947",
	["zodiac-capricorn"] = "rbxassetid://97859568140652",
	["zodiac-gemini"] = "rbxassetid://80997588122992",
	["zodiac-leo"] = "rbxassetid://75509406718106",
	["zodiac-libra"] = "rbxassetid://113222735060218",
	["zodiac-ophiuchus"] = "rbxassetid://129180108892480",
	["zodiac-pisces"] = "rbxassetid://95845819440327",
	["zodiac-sagittarius"] = "rbxassetid://82651026742181",
	["zodiac-scorpio"] = "rbxassetid://113640924054631",
	["zodiac-taurus"] = "rbxassetid://123053219704400",
	["zodiac-virgo"] = "rbxassetid://99462994613661",
}

local obj = setmetatable({
	component = tbl2.component,
	dashed = tbl2["square-dashed"],
	caret = tbl2["chevron-down"],
	close = tbl2.x,
	minus = tbl2.minus,
	square = tbl2.square,
	search = tbl2.search,
	crown = tbl2.crown,
	user = tbl2.user,
	click = tbl2["mouse-pointer-click"],
	sliders = tbl2["sliders-horizontal"],
	eye = tbl2.eye,
	command = tbl2.command,
	toggle = tbl2["toggle-left"],
	keyboard = tbl2.keyboard,
	pipette = tbl2.pipette,
	textField = tbl2["text-cursor-input"],
	columns2 = tbl2["columns-2"],
	columns3 = tbl2["columns-3"],
	quote = tbl2.quote,
	bell = tbl2.bell,
	check = tbl2.check,
	play = tbl2.play,
	pen = tbl2["square-pen"],
}, { __index = tbl2 })

local function fn9()
	local RunService2 = game:GetService("RunService")
	local n7 = 0.0008
	local tbl3 = {}
	local connection = nil

	local tbl4 = {
		number = {
			open = function(arg)
				return arg[1]
			end,
			pack = function(arg)
				return { arg }
			end,
		},
		UDim = {
			open = function(arg)
				return UDim.new(arg[1], arg[2])
			end,
			pack = function(arg)
				return { arg.Scale, arg.Offset }
			end,
		},
		UDim2 = {
			open = function(arg)
				return UDim2.new(arg[1], arg[2], arg[3], arg[4])
			end,
			pack = function(arg)
				return { arg.X.Scale, arg.X.Offset, arg.Y.Scale, arg.Y.Offset }
			end,
		},
		Vector2 = {
			open = function(arg)
				return Vector2.new(arg[1], arg[2])
			end,
			pack = function(arg)
				return { arg.X, arg.Y }
			end,
		},
		Color3 = {
			open = function(arg)
				local clamp = math.clamp
				local v = arg[3]
				return Color3.new(math.clamp(arg[1], 0, 1), math.clamp(arg[2], 0, 1), clamp(v, 0, 1))
			end,
			pack = function(arg)
				return { arg.R, arg.G, arg.B }
			end,
		},
	}

	local function fn10(arg)
		local kind = typeof(arg)
		if kind == "number" then
			return tbl4.number
		end
		return tbl4[kind]
	end

	local tbl5 = { curve = function(arg, arg2, arg3, arg4)
		local function fn11(arg5, arg6, arg7)
			return (((1 - 3 * arg7 + 3 * arg6) * arg5 + 3 * arg7 - 6 * arg6) * arg5 + 3 * arg6) * arg5
		end

		local function fn12(arg5, arg6, arg7)
			return 3 * (1 - 3 * arg7 + 3 * arg6) * arg5 * arg5 + 2 * (3 * arg7 - 6 * arg6) * arg5 + 3 * arg6
		end

		return function(arg5)
			if arg5 <= 0 then
				return 0
			end

			if arg5 >= 1 then
				return 1
			end
			local v = arg5

			for i = 1, 8 do
				local n8 = fn11(v, arg, arg3) - arg5

				if not (math.abs(n8) < 1e-05) then
					local v2 = fn12(v, arg, arg3)
					if not (math.abs(v2) < 1e-06) then
						v -= n8 / v2
						continue
					end
				end

				break
			end

			return fn11(v, arg2, arg4)
		end
	end }

	local function fn11(arg)
		return function(arg2)
			local n8 = arg2 - 1
			return 1 + (arg + 1) * n8 * n8 * n8 + arg * n8 * n8
		end
	end

	local function fn12(arg)
		return function(arg2)
			return (arg + 1) * arg2 * arg2 * arg2 - arg * arg2 * arg2
		end
	end

	tbl5.ease = {
		linear = function(arg)
			return arg
		end,
		inOut = tbl5.curve(0.4, 0, 0.2, 1),
		out = tbl5.curve(0.16, 1, 0.3, 1),
		outSoft = tbl5.curve(0.25, 0.8, 0.25, 1),
		outSnap = tbl5.curve(0.05, 0.9, 0.1, 1),
		back = fn11(1.36),
		backSoft = fn11(0.9),
		backIn = fn12(1.1),
	}

	tbl5.preset = {
		snappy = { spring = true, stiff = 320, damp = 1 },
		soft = { spring = true, stiff = 170, damp = 1 },
		tight = { spring = true, stiff = 600, damp = 1 },
		bouncy = { spring = true, stiff = 320, damp = 0.62 },
		lazy = { spring = true, stiff = 95, damp = 1 },
		pop = { spring = true, stiff = 420, damp = 1 },
	}

	local function fn13(arg, arg2, arg3, arg4, arg5, arg6)
		local v = math.sqrt(arg4)
		local n8 = arg - arg3

		if arg5 < 1 then
			local n9 = v * math.sqrt(1 - arg5 * arg5)
			local v2 = math.exp(-arg5 * v * arg6)
			local n10 = (arg2 + arg5 * v * n8) / n9
			local v3 = math.cos(n9 * arg6)
			local v4 = math.sin(n9 * arg6)
			return arg3 + v2 * (n8 * v3 + n10 * v4), v2 * ((n10 * n9 - arg5 * v * n8) * v3 - (n8 * n9 + arg5 * v * n10) * v4)
		end

		if arg5 == 1 then
			local v2 = math.exp(-v * arg6)
			local n9 = arg2 + v * n8
			return arg3 + (n8 + n9 * arg6) * v2, (n9 - v * (n8 + n9 * arg6)) * v2
		end

		local n9 = v * math.sqrt(arg5 * arg5 - 1)
		local n10 = -arg5 * v + n9
		local n11 = -arg5 * v - n9
		local n12 = (arg2 - n10 * n8) / (n11 - n10)
		local n13 = n8 - n12
		return arg3 + n13 * math.exp(n10 * arg6) + n12 * math.exp(n11 * arg6), n13 * n10 * math.exp(n10 * arg6) + n12 * n11 * math.exp(n11 * arg6)
	end

	local function fn14(arg)
		return (pcall(function()
			arg.target[arg.prop] = arg.kind.open(arg.now)
		end))
	end

	local function fn15(arg, arg2)
		local v = tbl3[arg]
		if not v then
			return
		end
		v[arg2] = nil

		if next(v) == nil then
			tbl3[arg] = nil
		end
	end

	local function fn16(deltaTime)
		local n8 = math.min(deltaTime, 0.05)
		local flag = true

		for k, v in pairs(tbl3) do
			for k2, v2 in pairs(v) do
				local flag2

				if v2.mode == "spring" then
					flag2 = true

					for i = 1, #v2.now do
						local v3, n9 = fn13(v2.now[i], v2.vel[i], v2.goal[i], v2.stiff, v2.damp, n8)

						if math.abs(v3 - v2.goal[i]) > n7 or math.abs(n9) > n7 then
							flag2 = false
						else
							v3 = v2.goal[i]
							n9 = 0
						end

						local vel = v2.vel
						v2.now[i] = v3
						vel[i] = n9
					end
				else
					v2.clock = v2.clock + n8
					local n9 = math.clamp(v2.clock / v2.span, 0, 1)
					local v3 = v2.ease(n9)

					for i = 1, #v2.now do
						local v4 = v2.now[i]
						v2.now[i] = v2.from[i] + (v2.goal[i] - v2.from[i]) * v3
						v2.vel[i] = n8 > 0 and (v2.now[i] - v4) / n8 or 0
					end

					flag2 = n9 >= 1
				end

				if not fn14(v2) then
					fn15(k, k2)
					flag = false
				else
					flag = false

					if flag2 then
						fn15(k, k2)

						if v2.done then
							task.spawn(v2.done)
						end
					end
				end
			end
		end

		if flag and connection then
			connection:Disconnect()
			connection = nil
		end
	end

	local function fn17()
		if connection then
			return
		end
		connection = RunService2.RenderStepped:Connect(fn16)
	end

	local function fn18(arg, arg2, arg3)
		local v = fn10(arg3)
		if not v then
			return nil
		end
		local tbl6 = tbl3[arg]

		if not tbl6 then
			tbl6 = {}
			tbl3[arg] = tbl6
		end

		local tbl7 = tbl6[arg2]

		if not tbl7 then
			local ok, result = pcall(function()
				return arg[arg2]
			end)

			if not ok then
				return nil
			end
			tbl7 = { target = arg, prop = arg2, kind = v, now = v.pack(result), vel = {} }

			for i = 1, #tbl7.now do
				tbl7.vel[i] = 0
			end

			tbl6[arg2] = tbl7
		end

		tbl7.kind = v
		tbl7.goal = v.pack(arg3)
		return tbl7
	end

	tbl5.spring = function(arg, arg2, arg3)
		local snappy = arg3 or tbl5.preset.snappy

		for k, v in pairs(arg2) do
			local v2 = fn18(arg, k, v)

			if v2 then
				v2.mode = "spring"
				v2.stiff = snappy.stiff or 260
				v2.damp = snappy.damp or 1
				v2.done = snappy.done
			end
		end

		fn17()
	end

	tbl5.tween = function(arg, arg2, arg3)
		local tbl6 = arg3 or {}

		for k, v in pairs(arg2) do
			local v2 = fn18(arg, k, v)

			if v2 then
				v2.mode = "tween"
				v2.span = math.max(tbl6.time or 0.2, 0.0041666666666666666)
				v2.ease = tbl6.ease or tbl5.ease.out
				v2.clock = 0
				v2.from = table.clone(v2.now)
				v2.done = tbl6.done
			end
		end

		fn17()
	end

	tbl5.shove = function(arg, arg2, arg3)
		local v = tbl3[arg]
		v = v and v[arg2]
		if not v then
			return
		end
		local v2 = fn10(arg3)
		if not v2 then
			return
		end
		local v3 = v2.pack(arg3)

		for i = 1, math.min(#v.vel, #v3) do
			v.vel[i] = v.vel[i] + v3[i]
		end

		fn17()
	end

	tbl5.stop = function(arg, arg2)
		if not tbl3[arg] then
			return
		end

		if arg2 then
			fn15(arg, arg2)
		else
			tbl3[arg] = nil
		end
	end

	tbl5.set = function(arg, arg2)
		for k, v in pairs(arg2) do
			tbl5.stop(arg, k)

			pcall(function()
				arg[k] = v
			end)
		end
	end

	return tbl5
end

local v = fn9()
local index = {}
index.__index = index
local index2 = {}
index2.__index = index2
local handlers = {}
handlers.__index = handlers
local tbl3 = { time = 0.14, ease = v.ease.out }
local snappy = v.preset.snappy
local bouncy = v.preset.bouncy
local tbl4 = { spring = true, stiff = 260, damp = 1 }
local tbl5 = { spring = true, stiff = 1500, damp = 1 }
local tbl6 = { spring = true, stiff = 420, damp = 1 }
local tbl7 = { spring = true, stiff = 430, damp = 1 }

local function fn10(arg, arg2, arg3)
	if arg2.spring then
		v.spring(arg, arg3, arg2)
	else
		v.tween(arg, arg3, arg2)
	end
end

local function fn11(arg, arg2, arg3)
	local Frame = fn2("Frame", {
		Name = "IconBox",
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 9, 0.5, 0),
		Size = UDim2.fromOffset(arg2, arg2),
		BackgroundColor3 = color,
		BackgroundTransparency = n2,
		BorderSizePixel = 0,
	}, arg)

	fn3(Frame, arg3 or 7)
	fn4(Frame, color2, 0.4)

	fn2("ImageLabel", {
		Name = "Art",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(0.58, 0.58),
		BackgroundTransparency = 1,
		Image = "",
		ImageTransparency = 0.1,
		ScaleType = Enum.ScaleType.Fit,
	}, Frame)

	return Frame
end

local function fn12()
	if RunService:IsStudio() then
		local localPlayer = Players.LocalPlayer

		if localPlayer then
			local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
			if playerGui then
				return playerGui
			end
		end

		return game:GetService("StarterGui")
	end

	local ok, result = pcall(function()
		return gethui and gethui()
	end)

	if ok and result then
		return result
	end

	local ok2, result2 = pcall(function()
		return game:GetService("CoreGui")
	end)

	if ok2 and result2 then
		return result2
	end
	local localPlayer = Players.LocalPlayer
	return localPlayer and localPlayer:FindFirstChildOfClass("PlayerGui")
end

local tbl8

tbl8 = {
	Version = "2.0.0",
	Options = {},
	Windows = {},
	Unloaded = false,
	Motion = v,
	Icons = obj,
	GetIcon = function(arg, arg2)
		if type(arg2) ~= "string" or arg2 == "" then
			return nil
		end

		if string.sub(arg2, 1, 3) == "rbx" then
			return arg2
		end
		return obj[arg2]
	end,
	Round = function(arg, arg2, arg3)
		if arg3 == 0 then
			return math.floor(arg2 + 0.5)
		end
		local n7 = 10 ^ arg3
		return math.floor(arg2 * n7 + 0.5) / n7
	end,
	Guard = function(arg, arg2, ...)
		if not arg2 then
			return
		end
		local v2 = pcall
		local v3 = table.pack(...)
		v3.n = 2 + v3.n - 1
		table.move(v3, 1, v3.n, 2, v3)
		v3[1] = arg2
		local v4, v5 = v2(table.unpack(v3, 1, v3.n))
		if v4 then
			return
		end
		local v6 = string.find(tostring(v5), ":%d+: ")

		tbl8:Notify({
			Kind = "bad",
			Title = "Callback error",
			Content = v6 and string.sub(v5, string.find(v5, ": ", v6) + 2) or tostring(v5),
			Duration = 6,
		})
	end,
}

local v2 = fn12()

for _, child in ipairs(v2:GetChildren()) do
	if child.Name == "NightHub" and child:IsA("ScreenGui") then
		child:Destroy()
	end
end

local ScreenGui = fn2("ScreenGui", {
	Name = "NightHub",
	ResetOnSpawn = false,
	IgnoreGuiInset = true,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	DisplayOrder = 9999,
}, v2)

pcall(function()
	ScreenGui.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
end)

tbl8.GUI = ScreenGui

local Frame = fn2("Frame", {
	Name = "Notes",
	AnchorPoint = Vector2.new(1, 0),
	Position = UDim2.new(1, -16, 0, 16),
	Size = UDim2.fromOffset(272, 0),
	BackgroundTransparency = 1,
	ZIndex = 80,
}, ScreenGui)

local function fn13()
	local CanvasGroup = fn2("CanvasGroup", {
		Name = "Note",
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, 0, 0, 0),
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = color,
		BackgroundTransparency = 0.04,
		BorderSizePixel = 0,
		GroupTransparency = 0,
		ZIndex = 81,
	}, Frame)

	fn3(CanvasGroup, 11)
	fn4(CanvasGroup, color2)
	fn2("UISizeConstraint", { MinSize = Vector2.new(0, 62) }, CanvasGroup)

	fn3(fn2("Frame", {
		Name = "Bar",
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 7, 0.5, 0),
		Size = UDim2.new(0, 3, 1, -22),
		BackgroundColor3 = color3,
		BorderSizePixel = 0,
		ZIndex = 82,
	}, CanvasGroup), 2)

	local Frame2 = fn2("Frame", {
		Name = "Pip",
		Position = UDim2.fromOffset(18, 13),
		Size = UDim2.fromOffset(26, 26),
		BackgroundColor3 = color3,
		BackgroundTransparency = 0.84,
		BorderSizePixel = 0,
		ZIndex = 82,
	}, CanvasGroup)

	fn3(Frame2, 8)

	fn2("ImageLabel", {
		Name = "Art",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(0.58, 0.58),
		BackgroundTransparency = 1,
		Image = "",
		ImageColor3 = color3,
		ScaleType = Enum.ScaleType.Fit,
		ZIndex = 83,
	}, Frame2)

	local Frame3 = fn2("Frame", {
		Name = "Body",
		Position = UDim2.fromOffset(52, 11),
		Size = UDim2.new(1, -64, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		ZIndex = 82,
	}, CanvasGroup)

	fn5(Frame3, 0, 0, 12, 0)
	fn6(Frame3, 2)

	fn7({
		Name = "Title",
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Text = "Notification",
		TextSize = 12,
		TextWrapped = true,
		TextYAlignment = Enum.TextYAlignment.Top,
		LayoutOrder = 1,
		FontFace = fn(Enum.FontWeight.Bold),
		ZIndex = 83,
	}, Frame3)

	fn7({
		Name = "Desc",
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Text = "",
		TextSize = 11,
		TextTransparency = n4,
		TextWrapped = true,
		TextYAlignment = Enum.TextYAlignment.Top,
		LayoutOrder = 2,
		ZIndex = 83,
	}, Frame3)

	fn2("Frame", {
		Name = "Fuse",
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 0, 1, 0),
		Size = UDim2.new(1, 0, 0, 2),
		BackgroundColor3 = color3,
		BackgroundTransparency = 0.3,
		BorderSizePixel = 0,
		ZIndex = 84,
	}, CanvasGroup)

	fn8(CanvasGroup, 85)
	return CanvasGroup
end

local tbl9 = {}
local n7 = 4

local function fn14()
	local n8 = 0

	for i, v3 in ipairs(tbl9) do
		v3.ZIndex = 140 - i
		v.spring(v3, { Position = UDim2.new(1, 0, 0, n8) }, tbl7)
		n8 = n8 + v3.AbsoluteSize.Y + 8
	end
end

local function fn15(arg)
	local v3 = nil

	for i, v4 in ipairs(tbl9) do
		if v4 == arg then
			v3 = i
			break
		else
			v3 = nil
		end
	end

	if not v3 then
		return
	end
	table.remove(tbl9, v3)
	v.stop(arg.Fuse, "Size")
	v.tween(arg, { GroupTransparency = 1 }, { time = 0.16, ease = v.ease.out })

	local tbl10 = {
		time = 0.22,
		ease = v.ease.backIn,
		done = function()
			arg:Destroy()
		end,
	}

	v.tween(arg, { Position = UDim2.new(1, 52, 0, arg.Position.Y.Offset) }, tbl10)
	fn14()
end

tbl8.Notify = function(arg, arg2)
	local tbl10 = arg2 or {}
	local info = tbl[tbl10.Kind] or tbl.info
	local v3 = fn13()
	v3.Bar.BackgroundColor3 = info.tint
	v3.Pip.BackgroundColor3 = info.tint
	v3.Pip.Art.Image = info.art
	v3.Pip.Art.ImageColor3 = info.tint
	v3.Fuse.BackgroundColor3 = info.tint
	v3.Body.Title.Text = tbl10.Title or "Notification"
	v3.Body.Desc.Text = tbl10.Content or ""
	v3.Body.Desc.Visible = (tbl10.Content or "") ~= ""
	table.insert(tbl9, 1, v3)
	v.set(v3, { GroupTransparency = 1, Position = UDim2.new(1, 52, 0, 0) })
	fn14()
	task.defer(fn14)
	v.tween(v3, { GroupTransparency = 0 }, { time = 0.2, ease = v.ease.out })
	local duration = tbl10.Duration or 4
	v.set(v3.Fuse, { Size = UDim2.new(1, 0, 0, 2) })
	local tbl11 = { time = duration, ease = v.ease.linear }
	v.tween(v3.Fuse, { Size = UDim2.new(0, 0, 0, 2) }, tbl11)

	v3.Hit.MouseButton1Click:Connect(function()
		fn15(v3)
	end)

	task.delay(duration, function()
		if v3.Parent then
			fn15(v3)
		end
	end)

	while n7 < #tbl9 do
		fn15(tbl9[#tbl9])
	end

	return { Close = function()
		fn15(v3)
	end }
end

local function fn16(arg, arg2, arg3, arg4, arg5, arg6, arg7)
	fn2("ImageLabel", {
		Name = arg2,
		BackgroundTransparency = 1,
		Image = str,
		ImageColor3 = arg3,
		ImageTransparency = arg7,
		ScaleType = Enum.ScaleType.Stretch,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(arg4, arg5),
		Size = UDim2.fromOffset(arg6, arg6),
		ZIndex = 1,
	}, arg)
end

local function fn17(arg)
	local CanvasGroup = fn2("CanvasGroup", {
		Name = "Backdrop",
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = color,
		BackgroundTransparency = n3,
		BorderSizePixel = 0,
		ZIndex = 0,
	}, arg)

	fn3(CanvasGroup, 14)
	fn16(CanvasGroup, "Dawn", Color3.fromRGB(59, 130, 246), 0.06, 0.08, 620, 0.42)
	fn16(CanvasGroup, "Dusk", Color3.fromRGB(139, 92, 246), 0.96, 0.24, 560, 0.55)
	fn16(CanvasGroup, "Reef", Color3.fromRGB(34, 176, 200), 0.18, 1.02, 500, 0.7)
	fn16(CanvasGroup, "Deep", Color3.fromRGB(79, 70, 229), 0.78, 1.04, 560, 0.6)

	local Frame2 = fn2("Frame", {
		Name = "Veil",
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = color,
		BackgroundTransparency = 0.4,
		BorderSizePixel = 0,
		ZIndex = 40,
	}, CanvasGroup)

	local v3 = fn2
	local tbl10 = { Rotation = 90 }
	local numberSequence = NumberSequence.new
	local tbl11 = {}
	local v4 = NumberSequenceKeypoint.new(0, 1)
	local v5 = NumberSequenceKeypoint.new(0.45, 0.55)
	local new = NumberSequenceKeypoint.new
	tbl11[1] = v4
	tbl11[2] = v5

	do
		local values = table.pack(new(1, 0))
		table.move(values, 1, values.n, 3, tbl11)
	end

	tbl10.Transparency = numberSequence(tbl11)
	v3("UIGradient", tbl10, Frame2)

	local Frame3 = fn2("Frame", {
		Name = "Sheen",
		Size = UDim2.new(1, 0, 0, 1),
		BackgroundColor3 = color4,
		BackgroundTransparency = 0.86,
		BorderSizePixel = 0,
		ZIndex = 45,
	}, CanvasGroup)

	local v6 = fn2
	local tbl12 = {}
	local numberSequence2 = NumberSequence.new
	local tbl13 = {}
	local v7 = NumberSequenceKeypoint.new(0, 1)
	local v8 = NumberSequenceKeypoint.new(0.5, 0)
	local new2 = NumberSequenceKeypoint.new
	tbl13[1] = v7
	tbl13[2] = v8

	do
		local values = table.pack(new2(1, 1))
		table.move(values, 1, values.n, 3, tbl13)
	end

	tbl12.Transparency = numberSequence2(tbl13)
	v6("UIGradient", tbl12, Frame3)
	return CanvasGroup
end

local function fn18(arg, arg2, arg3, arg4)
	local TextButton = fn2("TextButton", {
		Name = arg2,
		Size = UDim2.fromOffset(26, 26),
		Position = UDim2.fromOffset(arg4, 0),
		BackgroundColor3 = color4,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutoButtonColor = false,
		Text = "",
	}, arg)

	fn3(TextButton, 7)

	fn2("ImageLabel", {
		Name = "Glyph",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(14, 14),
		BackgroundTransparency = 1,
		Image = arg3,
		ImageColor3 = color4,
		ImageTransparency = 0.45,
		ScaleType = Enum.ScaleType.Fit,
	}, TextButton)

	TextButton.MouseEnter:Connect(function()
		fn10(TextButton, tbl3, { BackgroundTransparency = 0.9 })
		fn10(TextButton.Glyph, tbl3, { ImageTransparency = 0.1 })
	end)

	TextButton.MouseLeave:Connect(function()
		fn10(TextButton, tbl3, { BackgroundTransparency = 1 })
		fn10(TextButton.Glyph, tbl3, { ImageTransparency = 0.45 })
	end)

	return TextButton
end

tbl8.CreateWindow = function(arg, arg2)
	local tbl10 = arg2 or {}
	local offset = tbl10.Size and tbl10.Size.X.Offset or 500
	local offset2 = tbl10.Size and tbl10.Size.Y.Offset or 405
	local tabWidth = tbl10.TabWidth or 132

	local window = setmetatable({
		Tabs = {},
		Pages = {},
		Current = nil,
		Count = 0,
		Folded = false,
		Rail = tabWidth,
		BaseW = offset,
		BaseH = offset2,
	}, index)

	local ImageLabel = fn2("ImageLabel", {
		Name = "Halo",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(offset + 64, offset2 + 64),
		BackgroundTransparency = 1,
		Image = str2,
		ImageColor3 = Color3.fromRGB(0, 0, 0),
		ImageTransparency = 0.46,
		ScaleType = Enum.ScaleType.Stretch,
		ZIndex = 0,
	}, ScreenGui)

	local UIScale = fn2("UIScale", { Scale = 1 }, ImageLabel)

	local Frame2 = fn2("Frame", {
		Name = "Window",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(offset, offset2),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
	}, ScreenGui)

	local UIScale2 = fn2("UIScale", { Name = "Scale", Scale = 1 }, Frame2)
	fn3(Frame2, 14)
	fn4(Frame2, color2)
	fn17(Frame2)

	local function fn19()
		ImageLabel.Position = Frame2.Position
		ImageLabel.Size = UDim2.new(0, Frame2.Size.X.Offset + 64, 0, Frame2.Size.Y.Offset + 64)
		UIScale.Scale = UIScale2.Scale
		ImageLabel.Visible = Frame2.Visible
	end

	Frame2:GetPropertyChangedSignal("Position"):Connect(fn19)
	Frame2:GetPropertyChangedSignal("Size"):Connect(fn19)
	Frame2:GetPropertyChangedSignal("Visible"):Connect(fn19)
	UIScale2:GetPropertyChangedSignal("Scale"):Connect(fn19)
	local Frame3 = fn2("Frame", { Name = "Top", Size = UDim2.new(1, 0, 0, 50), BackgroundTransparency = 1 }, Frame2)
	local v3 = fn2

	local ImageLabel2 = v3("ImageLabel", {
		Name = "Logo",
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 14, 0.5, 0),
		Size = UDim2.fromOffset(28, 28),
		BackgroundColor3 = color,
		BackgroundTransparency = n2,
		BorderSizePixel = 0,
		Image = tbl10.Logo or "rbxassetid://98448650971303",
		ImageColor3 = color4,
		ScaleType = Enum.ScaleType.Fit,
	}, Frame3)

	fn3(ImageLabel2, 9)
	fn4(ImageLabel2, color2, 0.4)

	fn7({
		Name = "Title",
		Position = UDim2.fromOffset(52, 11),
		Size = UDim2.fromOffset(150, 17),
		Text = string.upper(tbl10.Title or "NIGHT HUB"),
		TextSize = 13,
		FontFace = fn(Enum.FontWeight.Bold),
	}, Frame3)

	fn7({
		Name = "Sub",
		Position = UDim2.fromOffset(52, 26),
		Size = UDim2.fromOffset(150, 13),
		Text = tbl10.SubTitle or "",
		TextSize = 10,
		TextTransparency = n6,
		TextTruncate = Enum.TextTruncate.AtEnd,
		Visible = (tbl10.SubTitle or "") ~= "",
	}, Frame3)

	local Frame4 = fn2("Frame", {
		Name = "Search",
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -106, 0.5, 0),
		Size = UDim2.fromOffset(148, 28),
		BackgroundColor3 = color,
		BackgroundTransparency = n2,
		BorderSizePixel = 0,
	}, Frame3)

	fn3(Frame4, 8)
	local v4 = fn4(Frame4, color2, 0.45)
	local v5 = fn2

	v5("ImageLabel", {
		Name = "Art",
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 9, 0.5, 0),
		Size = UDim2.fromOffset(13, 13),
		BackgroundTransparency = 1,
		Image = obj.search or "",
		ImageColor3 = color4,
		ImageTransparency = 0.5,
		ScaleType = Enum.ScaleType.Fit,
	}, Frame4)

	local TextBox = fn2("TextBox", {
		Name = "Field",
		Position = UDim2.fromOffset(27, 0),
		Size = UDim2.new(1, -50, 1, 0),
		BackgroundTransparency = 1,
		ClearTextOnFocus = false,
		Text = "",
		PlaceholderText = "Search",
		PlaceholderColor3 = color4,
		TextColor3 = color4,
		TextSize = 11,
		TextXAlignment = Enum.TextXAlignment.Left,
		FontFace = fn(),
	}, Frame4)

	local TextButton = fn2("TextButton", {
		Name = "Clear",
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -6, 0.5, 0),
		Size = UDim2.fromOffset(16, 16),
		BackgroundColor3 = color4,
		BackgroundTransparency = 0.9,
		BorderSizePixel = 0,
		AutoButtonColor = false,
		Text = "",
		Visible = false,
	}, Frame4)

	fn3(TextButton, 5)

	fn2("ImageLabel", {
		Name = "Art",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(9, 9),
		BackgroundTransparency = 1,
		Image = obj.close,
		ImageColor3 = color4,
		ImageTransparency = 0.25,
		ScaleType = Enum.ScaleType.Fit,
	}, TextButton)

	TextBox.Focused:Connect(function()
		fn10(v4, tbl3, { Transparency = 0 })
		fn10(v4, tbl3, { Color = color3 })
	end)

	TextBox.FocusLost:Connect(function()
		fn10(v4, tbl3, { Transparency = 0.45 })
		fn10(v4, tbl3, { Color = color2 })
	end)

	TextBox:GetPropertyChangedSignal("Text"):Connect(function()
		window:Sift(TextBox.Text)
	end)

	TextButton.MouseButton1Click:Connect(function()
		TextBox.Text = ""
	end)

	TextButton.MouseEnter:Connect(function()
		fn10(TextButton, tbl3, { BackgroundTransparency = 0.82 })
	end)

	TextButton.MouseLeave:Connect(function()
		fn10(TextButton, tbl3, { BackgroundTransparency = 0.9 })
	end)

	local Frame5 = fn2("Frame", {
		Name = "Tools",
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -10, 0.5, 0),
		Size = UDim2.fromOffset(92, 26),
		BackgroundTransparency = 1,
	}, Frame3)

	local mini = fn18(Frame5, "Mini", obj.minus, 0)
	local max = fn18(Frame5, "Max", obj.square, 33)
	local close = fn18(Frame5, "Close", obj.close, 66)

	local Frame6 = fn2("Frame", {
		Name = "Body",
		Position = UDim2.fromOffset(0, 50),
		Size = UDim2.new(1, 0, 1, -50),
		BackgroundTransparency = 1,
	}, Frame2)

	local Frame7 = fn2("Frame", { Name = "Side", Size = UDim2.new(0, tabWidth, 1, 0), BackgroundTransparency = 1 }, Frame6)

	local ScrollingFrame = fn2("ScrollingFrame", {
		Name = "Tabs",
		Position = UDim2.fromOffset(10, 4),
		Size = UDim2.new(1, -20, 1, -60),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ScrollBarThickness = 0,
		ElasticBehavior = Enum.ElasticBehavior.Never,
	}, Frame7)

	fn5(ScrollingFrame, 3, 5, 3, 13)
	fn6(ScrollingFrame, 4)

	local Frame8 = fn2("Frame", {
		Name = "Foot",
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 0, 1, 0),
		Size = UDim2.new(1, 0, 0, 52),
		BackgroundTransparency = 1,
	}, Frame7)

	fn2("Frame", {
		Name = "Split",
		Size = UDim2.new(1, -20, 0, 1),
		Position = UDim2.fromOffset(10, 0),
		BackgroundColor3 = color2,
		BorderSizePixel = 0,
	}, Frame8)

	local Frame9 = fn2("Frame", {
		Name = "Mark",
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 12, 0.5, 2),
		Size = UDim2.fromOffset(22, 22),
		BackgroundColor3 = Color3.fromRGB(24, 29, 38),
		BorderSizePixel = 0,
	}, Frame8)

	fn3(Frame9, 6)
	local v6 = fn4(Frame9, color2, 0.4)

	fn2("ImageLabel", {
		Name = "Art",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(0.6, 0.6),
		BackgroundTransparency = 1,
		Image = "",
		ScaleType = Enum.ScaleType.Fit,
	}, Frame9)

	local v7 = fn7({
		Name = "Brand",
		Position = UDim2.fromOffset(41, 14),
		Size = UDim2.new(1, -48, 0, 14),
		Text = string.upper(tbl10.Title or "NIGHT HUB"),
		TextSize = 11,
		FontFace = fn(Enum.FontWeight.Bold),
	}, Frame8)

	local UIGradient = fn2("UIGradient", {
		Name = "Shine",
		Enabled = false,
		Rotation = 10,
		Color = ColorSequence.new(Color3.fromRGB(254, 236, 170), Color3.fromRGB(229, 155, 20)),
	}, v7)

	local v8 = fn7({
		Name = "Plan",
		Position = UDim2.fromOffset(41, 28),
		Size = UDim2.new(1, -48, 0, 12),
		Text = "Plan  -  Free",
		TextSize = 9,
		TextTransparency = n6,
		TextTruncate = Enum.TextTruncate.AtEnd,
	}, Frame8)

	local Frame10 = fn2("Frame", {
		Name = "Stage",
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, 0, 0, 0),
		Size = UDim2.new(1, -tabWidth, 1, 0),
		BackgroundTransparency = 1,
		ClipsDescendants = true,
	}, Frame6)

	window.Gui = ScreenGui
	window.Root = Frame2
	window.Scale = UIScale2
	window.Top = Frame3
	window.Side = Frame7
	window.TabHolder = ScrollingFrame
	window.Stage = Frame10
	window.Foot = Frame8
	window.Field = TextBox
	window.Wipe = TextButton

	window.SetPlan = function(arg3, arg4, arg5)
		local enabled = arg4 == "Pro"
		Frame9.Art.Image = enabled and obj.crown or obj.user
		Frame9.Art.ImageColor3 = enabled and Color3.fromRGB(250, 204, 21) or Color3.fromRGB(236, 240, 246)
		Frame9.BackgroundColor3 = enabled and Color3.fromRGB(46, 36, 12) or Color3.fromRGB(24, 29, 38)
		v6.Color = enabled and Color3.fromRGB(126, 96, 26) or color2
		v7.TextColor3 = enabled and Color3.fromRGB(250, 204, 21) or Color3.fromRGB(236, 240, 246)
		UIGradient.Enabled = enabled
		local v9 = v8
		local str3

		if arg5 then
			str3 = arg5
		else
			str3 = enabled and "Lifetime" or "Free"
		end

		v9.Text = "Plan  -  " .. str3
	end

	window:SetPlan(tbl10.Plan and tbl10.Plan.Tier or "Free", tbl10.Plan and tbl10.Plan.Term)

	local function fn20()
		local currentCamera = workspace.CurrentCamera
		if not currentCamera then
			return
		end
		local viewportSize = currentCamera.ViewportSize
		window.Rest = math.max(math.min(viewportSize.X / (offset + 40), viewportSize.Y / (offset2 + 40), 1), 0.62)

		if not window.Folded then
			UIScale2.Scale = window.Rest
		end
	end

	local function fn21()
		local visible = Frame2.Size.X.Offset >= 470
		Frame7.Visible = visible
		Frame10.Size = visible and UDim2.new(1, -tabWidth, 1, 0) or UDim2.fromScale(1, 1)
		Frame4.Visible = Frame2.Size.X.Offset >= 430
	end

	Frame2:GetPropertyChangedSignal("Size"):Connect(fn21)
	local currentCamera = workspace.CurrentCamera

	if currentCamera then
		currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(fn20)
	end

	fn20()
	fn21()
	fn19()
	window.Rest = UIScale2.Scale
	v.set(UIScale2, { Scale = window.Rest * 0.86 })
	v.tween(UIScale2, { Scale = window.Rest }, { time = 0.46, ease = v.ease.back })
	local flag = false
	local position = nil
	local position2 = nil

	Frame3.InputBegan:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		flag = true
		position = input.Position
		position2 = Frame2.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				flag = false
			end
		end)
	end)

	UserInputService.InputChanged:Connect(function(input)
		if not flag then
			return
		end

		if input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		local n8 = input.Position - position
		Frame2.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n8.X, position2.Y.Scale, position2.Y.Offset + n8.Y)
	end)

	local ImageButton = fn2("ImageButton", {
		Name = "Bubble",
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 20, 0.5, 0),
		Size = UDim2.fromOffset(48, 48),
		BackgroundColor3 = color,
		BackgroundTransparency = 0.05,
		BorderSizePixel = 0,
		AutoButtonColor = false,
		Image = "",
		Visible = false,
		ZIndex = 150,
	}, ScreenGui)

	fn3(ImageButton, 24)
	local v9 = fn4(ImageButton, color3, 0.45)
	local UIScale3 = fn2("UIScale", { Name = "Pop", Scale = 1 }, ImageButton)

	local ImageLabel3 = fn2("ImageLabel", {
		Name = "Glow",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(120, 120),
		BackgroundTransparency = 1,
		Image = str,
		ImageColor3 = color3,
		ImageTransparency = 0.6,
		ScaleType = Enum.ScaleType.Stretch,
		ZIndex = 149,
	}, ImageButton)

	local v10 = fn2

	local ImageLabel4 = v10("ImageLabel", {
		Name = "Art",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(0.56, 0.56),
		BackgroundTransparency = 1,
		Image = tbl10.Logo or "rbxassetid://98448650971303",
		ImageColor3 = color4,
		ScaleType = Enum.ScaleType.Fit,
		ZIndex = 151,
	}, ImageButton)

	window.Bubble = ImageButton

	ImageButton.MouseEnter:Connect(function()
		if not window.Folded then
			return
		end
		v.spring(UIScale3, { Scale = 1.08 }, snappy)
		fn10(v9, tbl3, { Transparency = 0.1 })
	end)

	ImageButton.MouseLeave:Connect(function()
		if not window.Folded then
			return
		end
		v.spring(UIScale3, { Scale = 1 }, snappy)
		fn10(v9, tbl3, { Transparency = 0.45 })
	end)

	window.Fold = function(arg3)
		if arg3.Folded then
			return
		end
		arg3.Folded = true

		v.tween(UIScale2, { Scale = arg3.Rest * 0.86 }, {
			time = 0.18,
			ease = v.ease.backIn,
			done = function()
				if arg3.Folded then
					Frame2.Visible = false
				end
			end,
		})

		ImageButton.Visible = true
		v.set(UIScale3, { Scale = 0.4 })
		v.set(ImageButton, { BackgroundTransparency = 1 })
		v.set(ImageLabel4, { ImageTransparency = 1 })
		v.set(ImageLabel3, { ImageTransparency = 1 })
		v.set(v9, { Transparency = 1 })
		v.spring(UIScale3, { Scale = 1 }, { spring = true, stiff = 520, damp = 0.68 })
		v.tween(ImageButton, { BackgroundTransparency = 0.05 }, { time = 0.22, ease = v.ease.out })
		v.tween(ImageLabel4, { ImageTransparency = 0 }, { time = 0.26, ease = v.ease.out })
		v.tween(ImageLabel3, { ImageTransparency = 0.6 }, { time = 0.3, ease = v.ease.out })
		v.tween(v9, { Transparency = 0.45 }, { time = 0.26, ease = v.ease.out })
	end

	window.Unfold = function(arg3)
		if not arg3.Folded then
			return
		end
		arg3.Folded = false
		v.tween(UIScale3, { Scale = 0.4 }, { time = 0.16, ease = v.ease.backIn })
		v.tween(ImageButton, { BackgroundTransparency = 1 }, { time = 0.16, ease = v.ease.out })
		v.tween(ImageLabel4, { ImageTransparency = 1 }, { time = 0.14, ease = v.ease.out })
		v.tween(ImageLabel3, { ImageTransparency = 1 }, { time = 0.14, ease = v.ease.out })
		v.tween(v9, { Transparency = 1 }, { time = 0.14, ease = v.ease.out })

		task.delay(0.2, function()
			if arg3.Folded then
				return
			end
			ImageButton.Visible = false
			v.stop(v9)
			v.stop(UIScale3)
			v9.Transparency = 1
			UIScale3.Scale = 1
		end)

		Frame2.Visible = true
		v.set(UIScale2, { Scale = arg3.Rest * 0.88 })
		v.tween(UIScale2, { Scale = arg3.Rest }, { time = 0.4, ease = v.ease.back })
	end

	ImageButton.MouseButton1Click:Connect(function()
		window:Unfold()
	end)

	mini.MouseButton1Click:Connect(function()
		window:Fold()
	end)

	max.MouseButton1Click:Connect(function()
		window.Wide = not window.Wide
		local viewportSize = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1280, 720)
		local wide = window.Wide

		if wide then
			local min = math.min
			local n8 = viewportSize.Y - 60
			wide = UDim2.fromOffset(math.min(viewportSize.X - 60, 900), min(n8, 620))
		end

		v.spring(Frame2, { Size = wide or UDim2.fromOffset(offset, offset2) }, tbl4)
	end)

	close.MouseButton1Click:Connect(function()
		window:Close()
	end)

	window.Key = tbl10.Key or Enum.KeyCode.RightControl
	window.Shown = true

	window.SetKey = function(arg3, key)
		if typeof(key) == "EnumItem" then
			arg3.Key = key
			return true
		end

		local ok, key2 = pcall(function()
			return Enum.KeyCode[key]
		end)

		if not ok or not key2 then
			return false
		end
		arg3.Key = key2
		return true
	end

	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then
			return
		end

		if input.KeyCode == window.Key then
			window:Toggle()
		end
	end)

	window.Body = Frame6
	table.insert(tbl8.Windows, window)
	tbl8.Window = window

	if tbl10.Settings then
		tbl8.Settings = tbl10.Settings

		if tbl10.Settings.Save then
			task.delay(0.4, function()
				if tbl8.Loaded then
					return
				end
				tbl8.Loaded = true
				tbl8:LoadConfig(true)
			end)
		end
	end

	return window
end

index.Toggle = function(arg)
	arg.Shown = not arg.Shown

	if arg.Shown then
		if arg.Folded then
			arg.Bubble.Visible = true
			return
		end
		arg.Root.Visible = true
		v.set(arg.Scale, { Scale = arg.Rest * 0.9 })
		v.spring(arg.Scale, { Scale = arg.Rest }, snappy)
		return
	end

	arg.Bubble.Visible = false

	v.tween(arg.Scale, { Scale = arg.Rest * 0.9 }, {
		time = 0.16,
		ease = v.ease.backIn,
		done = function()
			if not arg.Shown then
				arg.Root.Visible = false
			end
		end,
	})
end

index.Close = function(arg)
	v.tween(arg.Scale, { Scale = 0.9 }, {
		time = 0.16,
		ease = v.ease.backIn,
		done = function()
			tbl8:Destroy()
		end,
	})
end

tbl8.Destroy = function()
	tbl8.Unloaded = true

	if tbl8.GUI then
		tbl8.GUI:Destroy()
	end
end

local tbl10 = { time = 0.17, ease = v.ease.out }

local function fn19(arg)
	local uiSizeConstraint = arg:FindFirstChildOfClass("UISizeConstraint")

	if uiSizeConstraint then
		if not arg:GetAttribute("Floor") then
			arg:SetAttribute("Floor", uiSizeConstraint.MinSize.Y)
		end

		uiSizeConstraint.MinSize = Vector2.new(uiSizeConstraint.MinSize.X, 0)
	end

	arg.ClipsDescendants = true
	arg.AutomaticSize = Enum.AutomaticSize.None
end

local function fn20(arg)
	local uiSizeConstraint = arg:FindFirstChildOfClass("UISizeConstraint")

	if uiSizeConstraint then
		uiSizeConstraint.MinSize = Vector2.new(uiSizeConstraint.MinSize.X, arg:GetAttribute("Floor") or 0)
	end

	arg.Size = UDim2.new(1, 0, 0, 0)
	arg.AutomaticSize = Enum.AutomaticSize.Y
	arg.ClipsDescendants = arg:GetAttribute("Clip") == true
end

local function fn21(arg, visible)
	if arg:GetAttribute("Clip") == nil then
		arg:SetAttribute("Clip", arg.ClipsDescendants)
	end

	if not arg:IsA("CanvasGroup") then
		arg.Visible = visible
		return
	end

	if arg:GetAttribute("Aim") == nil then
		arg:SetAttribute("Aim", arg.Visible)
	end

	if arg:GetAttribute("Aim") == visible then
		return
	end
	arg:SetAttribute("Aim", visible)
	local uiStroke = arg:FindFirstChildOfClass("UIStroke")

	if uiStroke and not arg:GetAttribute("Rim") then
		arg:SetAttribute("Rim", uiStroke.Transparency)
	end

	if visible then
		local attribute = arg:GetAttribute("Tall") or arg.AbsoluteSize.Y
		arg.Visible = true
		v.set(arg, { GroupTransparency = 1, Size = UDim2.new(1, 0, 0, 0) })

		if uiStroke then
			v.set(uiStroke, { Transparency = 1 })
		end

		fn19(arg)

		local tbl11 = {
			time = 0.26,
			ease = v.ease.out,
			done = function()
				if arg:GetAttribute("Aim") then
					fn20(arg)
				end
			end,
		}

		v.tween(arg, { Size = UDim2.new(1, 0, 0, attribute) }, tbl11)
		v.tween(arg, { GroupTransparency = 0 }, { time = 0.22, ease = v.ease.out })

		if uiStroke then
			v.tween(uiStroke, { Transparency = arg:GetAttribute("Rim") or 0.45 }, { time = 0.22, ease = v.ease.out })
		end

		return
	end

	arg:SetAttribute("Tall", arg.AbsoluteSize.Y)
	fn19(arg)
	arg.Size = UDim2.new(1, 0, 0, arg:GetAttribute("Tall"))

	local tbl11 = {
		time = 0.24,
		ease = v.ease.inOut,
		done = function()
			if not arg:GetAttribute("Aim") then
				arg.Visible = false
			end
		end,
	}

	v.tween(arg, { Size = UDim2.new(1, 0, 0, 0) }, tbl11)
	v.tween(arg, { GroupTransparency = 1 }, { time = 0.16, ease = v.ease.out })

	if uiStroke then
		v.tween(uiStroke, { Transparency = 1 }, { time = 0.14, ease = v.ease.out })
	end
end

local function fn22(arg, arg2)
	for _, descendant in ipairs(arg:GetDescendants()) do
		if descendant:IsA("TextLabel") and string.find(string.lower(descendant.Text), arg2, 1, true) then
			return true
		end
	end

	return false
end

index.AddTab = function(arg, arg2)
	local tbl11 = arg2 or {}
	arg.Count = arg.Count + 1
	local count = arg.Count
	local title = tbl11.Title or "Tab " .. count

	local TextButton = fn2("TextButton", {
		Name = title,
		Size = UDim2.new(1, 0, 0, 36),
		BackgroundColor3 = color4,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutoButtonColor = false,
		Text = "",
		LayoutOrder = count,
	}, arg.TabHolder)

	fn3(TextButton, 8)
	local v3 = fn4(TextButton, color3, 1)

	fn2("Frame", {
		Name = "Mark",
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, -10, 0.5, 0),
		Size = UDim2.fromOffset(3, 16),
		BackgroundColor3 = color3,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
	}, TextButton)

	fn3(TextButton.Mark, 2)
	local v4 = fn2

	v4("ImageLabel", {
		Name = "Icon",
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 10, 0.5, 0),
		Size = UDim2.fromOffset(16, 16),
		BackgroundTransparency = 1,
		Image = tbl8:GetIcon(tbl11.Icon) or obj.component,
		ImageColor3 = color4,
		ImageTransparency = 0.2,
		ScaleType = Enum.ScaleType.Fit,
	}, TextButton)

	fn7({
		Name = "Label",
		Position = UDim2.fromOffset(34, 0),
		Size = UDim2.new(1, -40, 1, 0),
		Text = title,
		TextSize = 12,
		TextTransparency = 0.5,
		TextTruncate = Enum.TextTruncate.AtEnd,
		TextYAlignment = Enum.TextYAlignment.Center,
	}, TextButton)

	local CanvasGroup = fn2("CanvasGroup", {
		Name = title,
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		GroupTransparency = count == 1 and 0 or 1,
		Visible = count == 1,
	}, arg.Stage)

	local Frame2 = fn2("Frame", {
		Name = "Head",
		Position = UDim2.fromOffset(14, 12),
		Size = UDim2.new(1, -28, 0, 38),
		BackgroundTransparency = 1,
	}, CanvasGroup)

	local v5 = fn2

	v5("ImageLabel", {
		Name = "Icon",
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.fromOffset(20, 20),
		BackgroundColor3 = color3,
		BackgroundTransparency = 0.82,
		BorderSizePixel = 0,
		Image = tbl8:GetIcon(tbl11.Icon) or obj.component,
		ImageColor3 = color3,
		ScaleType = Enum.ScaleType.Fit,
	}, Frame2)

	fn3(Frame2.Icon, 6)

	fn7({
		Name = "Title",
		Position = UDim2.fromOffset(28, (tbl11.Description or "") ~= "" and 1 or 10),
		Size = UDim2.new(1, -28, 0, 17),
		Text = string.upper(title),
		TextSize = 14,
		FontFace = fn(Enum.FontWeight.Bold),
	}, Frame2)

	fn7({
		Name = "Desc",
		Position = UDim2.fromOffset(28, 19),
		Size = UDim2.new(1, -28, 0, 13),
		Text = tbl11.Description or "",
		TextSize = 10,
		TextTransparency = n5,
		TextTruncate = Enum.TextTruncate.AtEnd,
		Visible = (tbl11.Description or "") ~= "",
	}, Frame2)

	local ScrollingFrame = fn2("ScrollingFrame", {
		Name = "List",
		Position = UDim2.fromOffset(0, 54),
		Size = UDim2.new(1, -14, 1, -62),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ScrollBarThickness = 2,
		ScrollBarImageColor3 = color4,
		ScrollBarImageTransparency = 0.72,
		ElasticBehavior = Enum.ElasticBehavior.Never,
	}, CanvasGroup)

	fn5(ScrollingFrame, 6, 10, 14, 14)
	fn6(ScrollingFrame, 10)

	fn7({
		Name = "Blank",
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.new(0.5, 0, 0, 90),
		Size = UDim2.new(1, -40, 0, 16),
		Text = "Nothing matches that search",
		TextSize = 11,
		TextTransparency = n5,
		TextXAlignment = Enum.TextXAlignment.Center,
		Visible = false,
	}, CanvasGroup)

	local obj2 = setmetatable({
		Window = arg,
		Name = title,
		Order = count,
		Button = TextButton,
		Page = CanvasGroup,
		List = ScrollingFrame,
		Count = 0,
		Loose = nil,
	}, index2)

	arg.Tabs[count] = obj2
	arg.Pages[title] = CanvasGroup

	TextButton.MouseEnter:Connect(function()
		if arg.Current ~= title then
			fn10(TextButton, tbl3, { BackgroundTransparency = 0.96 })
		end
	end)

	TextButton.MouseLeave:Connect(function()
		if arg.Current ~= title then
			fn10(TextButton, tbl3, { BackgroundTransparency = 1 })
		end
	end)

	TextButton.MouseButton1Click:Connect(function()
		arg:Select(title)
	end)

	if count == 1 then
		arg.Current = title
		TextButton.BackgroundTransparency = 0.92
		TextButton.Mark.BackgroundTransparency = 0
		TextButton.Label.TextTransparency = 0
		TextButton.Icon.ImageTransparency = 0
		v3.Transparency = 0.5
	end

	return obj2
end

index.Select = function(arg, current)
	if arg.Current == current then
		return
	end
	arg.Current = current

	for _, tab in pairs(arg.Tabs) do
		local flag = tab.Name == current
		local button = tab.Button
		local uiStroke = button:FindFirstChildOfClass("UIStroke")
		fn10(button, tbl3, { BackgroundTransparency = flag and 0.92 or 1 })
		fn10(button.Mark, tbl3, { BackgroundTransparency = flag and 0 or 1 })
		fn10(button.Label, tbl3, { TextTransparency = flag and 0 or 0.5 })
		fn10(button.Icon, tbl3, { ImageTransparency = flag and 0 or 0.2 })

		if uiStroke then
			uiStroke.Transparency = flag and 0.5 or 1
		end

		local page = tab.Page

		if flag then
			page.Visible = true
			v.set(page, { GroupTransparency = 1 })
			v.tween(page, { GroupTransparency = 0 }, tbl10)
			v.set(tab.List, { Position = UDim2.fromOffset(18, 54) })
			v.spring(tab.List, { Position = UDim2.fromOffset(0, 54) }, tbl4)
			v.set(page.Head, { Position = UDim2.fromOffset(26, 12) })
			v.spring(page.Head, { Position = UDim2.fromOffset(14, 12) }, tbl4)
		elseif page.Visible then
			v.spring(tab.List, { Position = UDim2.fromOffset(-14, 54) }, tbl4)
			v.spring(page.Head, { Position = UDim2.fromOffset(2, 12) }, tbl4)

			v.tween(page, { GroupTransparency = 1 }, {
				time = 0.13,
				ease = v.ease.out,
				done = function()
					if arg.Current ~= tab.Name then
						page.Visible = false
					end
				end,
			})
		end
	end
end

index2.AddSection = function(arg, arg2, arg3)
	arg.Count = arg.Count + 1

	local CanvasGroup = fn2("CanvasGroup", {
		Name = "Section",
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = color4,
		BackgroundTransparency = n,
		BorderSizePixel = 0,
		GroupTransparency = 0,
		LayoutOrder = arg.Count,
	}, arg.List)

	fn3(CanvasGroup, 10)
	fn4(CanvasGroup, color2, 0.25)
	fn6(CanvasGroup, 0)
	local Frame2 = fn2("Frame", { Name = "Head", Size = UDim2.new(1, 0, 0, 44), BackgroundTransparency = 1, LayoutOrder = 1 }, CanvasGroup)

	fn2("ImageLabel", {
		Name = "Icon",
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 12, 0.5, 0),
		Size = UDim2.fromOffset(20, 20),
		BackgroundColor3 = color3,
		BackgroundTransparency = 0.82,
		BorderSizePixel = 0,
		Image = "",
		ImageColor3 = color3,
		ScaleType = Enum.ScaleType.Fit,
	}, Frame2)

	fn3(Frame2.Icon, 6)

	fn7({
		Name = "Title",
		Position = UDim2.fromOffset(40, (arg3 or "") ~= "" and 8 or 15),
		Size = UDim2.new(1, -60, 0, 15),
		Text = string.upper(arg2 or "Section"),
		TextSize = 11,
		FontFace = fn(Enum.FontWeight.Bold),
	}, Frame2)

	fn7({
		Name = "Desc",
		Position = UDim2.fromOffset(40, 23),
		Size = UDim2.new(1, -60, 0, 13),
		Text = arg3 or "",
		TextSize = 10,
		TextTransparency = n5,
		TextTruncate = Enum.TextTruncate.AtEnd,
		Visible = (arg3 or "") ~= "",
	}, Frame2)

	local ImageLabel = fn2("ImageLabel", {
		Name = "Art",
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -14, 0.5, 0),
		Size = UDim2.fromOffset(13, 13),
		BackgroundTransparency = 1,
		Image = obj.caret,
		ImageColor3 = color4,
		ImageTransparency = n5,
		Rotation = 180,
		ScaleType = Enum.ScaleType.Fit,
	}, Frame2)

	local Frame3 = fn2("Frame", {
		Name = "Items",
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		LayoutOrder = 2,
	}, CanvasGroup)

	fn5(Frame3, 0, 10, 10, 10)
	fn6(Frame3, 6)
	local obj2 = setmetatable({ Window = arg.Window, Tab = arg, Card = CanvasGroup, Items = Frame3, Count = 0, Folded = false }, handlers)

	local function fn23(arg4, arg5, arg6)
		for _, child in ipairs(Frame3:GetChildren()) do
			if child:IsA("CanvasGroup") then
				v.tween(child, { GroupTransparency = arg4 }, { time = arg5, ease = arg6 })
			end
		end
	end

	fn8(Frame2).MouseButton1Click:Connect(function()
		obj2.Folded = not obj2.Folded
		v.spring(ImageLabel, { Rotation = obj2.Folded and 0 or 180 }, snappy)

		if obj2.Folded then
			Frame3:SetAttribute("Full", Frame3.AbsoluteSize.Y)
			Frame3.AutomaticSize = Enum.AutomaticSize.None
			Frame3.Size = UDim2.new(1, 0, 0, Frame3:GetAttribute("Full"))
			local tbl11 = { time = 0.28, ease = v.ease.inOut }
			v.tween(Frame3, { Size = UDim2.new(1, 0, 0, 0) }, tbl11)
			fn23(1, 0.13, v.ease.out)
		else
			local attribute = Frame3:GetAttribute("Full") or Frame3.AbsoluteSize.Y
			Frame3.AutomaticSize = Enum.AutomaticSize.None

			local tbl11 = {
				time = 0.32,
				ease = v.ease.inOut,
				done = function()
					if obj2.Folded then
						return
					end
					Frame3.Size = UDim2.new(1, 0, 0, 0)
					Frame3.AutomaticSize = Enum.AutomaticSize.Y
				end,
			}

			v.tween(Frame3, { Size = UDim2.new(1, 0, 0, attribute) }, tbl11)
			fn23(0, 0.34, v.ease.inOut)
		end
	end)

	obj2.SetIcon = function(arg4, arg5)
		Frame2.Icon.Image = tbl8:GetIcon(arg5) or ""
	end

	obj2:SetIcon(nil)
	return obj2
end

index2.Loft = function(arg)
	if not arg.Loose then
		arg.Loose = arg:AddSection("General", "")
		arg.Loose:SetIcon("layers")
	end

	return arg.Loose
end

index.Sift = function(arg, arg2)
	local v3 = string.lower(arg2 or "")
	local flag = v3 == ""
	arg.Wipe.Visible = not flag

	for _, tab in pairs(arg.Tabs) do
		local n8 = 0

		for _, child in ipairs(tab.List:GetChildren()) do
			if child:IsA("GuiObject") and child.Name == "Section" then
				local items = child:FindFirstChild("Items")
				local flag2 = fn22(child.Head, v3)
				local n9 = 0

				if items then
					for _, child2 in ipairs(items:GetChildren()) do
						if child2:IsA("GuiObject") then
							local v4 = flag or flag2 or fn22(child2, v3)
							fn21(child2, v4)

							if v4 then
								n9 += 1
							end
						end
					end
				end

				flag2 = flag or flag2 or n9 > 0
				fn21(child, flag2)

				if flag2 then
					n8 += 1
				end
			end
		end

		local blank = tab.Page:FindFirstChild("Blank")

		if blank then
			blank.Visible = not flag and n8 == 0
		end
	end
end

local function fn23(arg, arg2, arg3, arg4, arg5)
	arg.Count = arg.Count + 1

	local CanvasGroup = fn2("CanvasGroup", {
		Name = "Row",
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = color4,
		BackgroundTransparency = n,
		BorderSizePixel = 0,
		GroupTransparency = 0,
		LayoutOrder = arg.Count,
	}, arg.Items)

	fn2("UISizeConstraint", { MinSize = Vector2.new(0, arg4 or 46) }, CanvasGroup)
	fn3(CanvasGroup, 8)
	local v3 = fn4(CanvasGroup, color2, 0.45)
	fn11(CanvasGroup, 28)

	local Frame2 = fn2("Frame", {
		Name = "Text",
		Position = UDim2.fromOffset(47, 0),
		Size = UDim2.new(1, -(arg5 or 120), 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
	}, CanvasGroup)

	fn5(Frame2, 9, 0, 9, 0)
	fn6(Frame2, 2)

	fn7({
		Name = "Title",
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Text = arg2 or "Element",
		TextSize = 12,
		TextWrapped = true,
		TextYAlignment = Enum.TextYAlignment.Top,
		LayoutOrder = 1,
		FontFace = fn(Enum.FontWeight.Medium),
	}, Frame2)

	fn7({
		Name = "Desc",
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Text = arg3 or "",
		TextSize = 11,
		TextTransparency = n4,
		TextWrapped = true,
		TextYAlignment = Enum.TextYAlignment.Top,
		LayoutOrder = 2,
		Visible = (arg3 or "") ~= "",
	}, Frame2)

	local backgroundTransparency = CanvasGroup.BackgroundTransparency

	CanvasGroup.MouseEnter:Connect(function()
		fn10(CanvasGroup, tbl3, { BackgroundTransparency = backgroundTransparency - 0.025 })
		fn10(v3, tbl3, { Transparency = 0.15 })
	end)

	CanvasGroup.MouseLeave:Connect(function()
		fn10(CanvasGroup, tbl3, { BackgroundTransparency = backgroundTransparency })
		fn10(v3, tbl3, { Transparency = 0.45 })
	end)

	return CanvasGroup
end

local function fn24(arg, arg2)
	arg.IconBox.Art.Image = tbl8:GetIcon(arg2) or ""
end

local function fn25(arg)
	arg.IconBox.AnchorPoint = Vector2.new(0, 0)
	arg.IconBox.Position = UDim2.fromOffset(9, 9)
end

local function fn26(arg, frame)
	arg.Frame = frame
	arg.Locked = false
	local text = frame:FindFirstChild("Text")
	local title = text and text:FindFirstChild("Title")
	local desc = text and text:FindFirstChild("Desc")

	arg.SetTitle = function(arg2, text2)
		if title then
			title.Text = text2 or ""
		end
	end

	arg.SetDesc = function(arg2, text2)
		if not desc then
			return
		end
		desc.Text = text2 or ""
		desc.Visible = (text2 or "") ~= ""
	end

	arg.SetVisible = function(arg2, arg3)
		frame.Visible = arg3 ~= false
	end

	local function fn27()
		local guard = frame:FindFirstChild("Guard")
		if guard then
			return guard
		end

		local Frame2 = fn2("Frame", {
			Name = "Guard",
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = color,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Visible = false,
			ZIndex = 20,
		}, frame)

		fn3(Frame2, 8)

		fn2("ImageLabel", {
			Name = "Bolt",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(18, 18),
			BackgroundTransparency = 1,
			Image = obj.lock,
			ImageColor3 = color4,
			ImageTransparency = 1,
			ScaleType = Enum.ScaleType.Fit,
			ZIndex = 21,
		}, Frame2)

		fn8(Frame2, 22).MouseButton1Click:Connect(function()
			v.set(Frame2.Bolt, { Size = UDim2.fromOffset(24, 24) })
			v.spring(Frame2.Bolt, { Size = UDim2.fromOffset(18, 18) }, bouncy)

			tbl8:Notify({
				Kind = "warn",
				Title = arg.LockTitle or "Locked",
				Content = arg.LockNote or "This feature is locked",
				Duration = 4,
			})
		end)

		return Frame2
	end

	arg.Lock = function(arg2, lockNote, lockTitle)
		arg.LockNote = lockNote or arg.LockNote
		arg.LockTitle = lockTitle or arg.LockTitle
		if arg.Locked then
			return
		end
		arg.Locked = true
		local v3 = fn27()
		v3.Visible = true
		v.tween(v3, { BackgroundTransparency = 0.42 }, { time = 0.18, ease = v.ease.out })
		v.tween(v3.Bolt, { ImageTransparency = 0.12 }, { time = 0.22, ease = v.ease.out })
		v.tween(frame, { GroupTransparency = 0.25 }, { time = 0.18, ease = v.ease.out })
	end

	arg.Unlock = function()
		if not arg.Locked then
			return
		end
		arg.Locked = false
		local guard = frame:FindFirstChild("Guard")

		if guard then
			v.tween(guard.Bolt, { ImageTransparency = 1 }, { time = 0.14, ease = v.ease.out })

			v.tween(guard, { BackgroundTransparency = 1 }, {
				time = 0.18,
				ease = v.ease.out,
				done = function()
					if not arg.Locked then
						guard.Visible = false
					end
				end,
			})
		end

		v.tween(frame, { GroupTransparency = 0 }, { time = 0.18, ease = v.ease.out })
	end

	if not rawget(arg, "Destroy") then
		arg.Destroy = function()
			frame:Destroy()

			if arg.Id then
				tbl8.Options[arg.Id] = nil
			end
		end
	end

	return arg
end

local function fn27(id, arg)
	if not id then
		return arg
	end
	tbl8.Options[id] = arg
	arg.Id = id
	local setValue = arg.SetValue

	if setValue then
		arg.SetValue = function(arg2, arg3, arg4)
			setValue(arg2, arg3, arg4)

			if arg4 ~= true then
				tbl8:Dirty()
			end
		end
	end

	return arg
end

handlers.AddToggle = function(arg, arg2, arg3)
	local tbl11 = arg3 or {}
	local v3 = fn23(arg, tbl11.Title, tbl11.Description, 46, 96)
	fn24(v3, tbl11.Icon or "toggle")

	local Frame2 = fn2("Frame", {
		Name = "Track",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(1, -32, 0.5, 0),
		Size = UDim2.fromOffset(40, 21),
		BackgroundColor3 = color,
		BackgroundTransparency = n2,
		BorderSizePixel = 0,
	}, v3)

	fn3(Frame2, 11)
	fn4(Frame2, color2, 0.4)

	local Frame3 = fn2("Frame", {
		Name = "Knob",
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 3, 0.5, 0),
		Size = UDim2.fromOffset(15, 15),
		BackgroundColor3 = color4,
		BorderSizePixel = 0,
		ZIndex = 3,
	}, Frame2)

	fn3(Frame3, 8)
	local tbl12 = { Type = "Toggle", Value = tbl11.Default and true or false, Callback = tbl11.Callback }
	local size = Frame2.Size

	tbl12.SetValue = function(arg4, arg5, arg6)
		local value = not not arg5
		tbl12.Value = value
		v.spring(Frame2, { BackgroundColor3 = value and color3 or color, BackgroundTransparency = value and 0 or 0.45 }, snappy)

		v.spring(Frame3, {
			Position = UDim2.new(value and 1 or 0, value and -3 or 3, 0.5, 0),
			AnchorPoint = Vector2.new(value and 1 or 0, 0.5),
		}, snappy)

		v.spring(Frame2, { Size = size }, tbl6)
		v.shove(Frame2, "Size", UDim2.fromOffset(225, 440))
		if arg6 then
			return
		end
		tbl8:Guard(tbl12.Callback, value)
		tbl8:Guard(tbl12.Changed, value)
	end

	tbl12.OnChanged = function(arg4, changed)
		tbl12.Changed = changed
		changed(tbl12.Value)
	end

	tbl12.Destroy = function()
		v3:Destroy()
		tbl8.Options[arg2] = nil
	end

	fn8(v3).MouseButton1Click:Connect(function()
		tbl12:SetValue(not tbl12.Value)
	end)

	tbl12:SetValue(tbl12.Value, true)
	return fn27(arg2, fn26(tbl12, v3))
end

handlers.AddSlider = function(arg, arg2, arg3)
	local tbl11 = arg3 or {}
	local min = tbl11.Min or 0
	local max = tbl11.Max or 100
	local rounding = tbl11.Rounding or 0
	local v3 = fn23(arg, tbl11.Title, tbl11.Description, 78, 24)
	fn24(v3, tbl11.Icon or "sliders")
	fn25(v3)

	local v4 = fn7({
		Name = "Max",
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -14, 0, 11),
		Size = UDim2.fromOffset(120, 14),
		Text = "",
		TextSize = 11,
		TextTransparency = n5,
		TextXAlignment = Enum.TextXAlignment.Right,
	}, v3)

	local Frame2 = fn2("Frame", {
		Name = "Track",
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 47, 1, -16),
		Size = UDim2.new(1, -61, 0, 4),
		BackgroundColor3 = color,
		BackgroundTransparency = 0.25,
		BorderSizePixel = 0,
	}, v3)

	fn3(Frame2, 2)
	local Frame3 = fn2("Frame", { Name = "Fill", Size = UDim2.fromScale(0, 1), BackgroundColor3 = color3, BorderSizePixel = 0 }, Frame2)
	fn3(Frame3, 2)

	local Frame4 = fn2("Frame", {
		Name = "Grip",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(1, 0, 0.5, 0),
		Size = UDim2.fromOffset(13, 13),
		BackgroundColor3 = color4,
		BorderSizePixel = 0,
		ZIndex = 4,
	}, Frame3)

	fn3(Frame4, 7)

	local TextButton = fn2("TextButton", {
		Name = "Grab",
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(1, 0, 0, 22),
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		Text = "",
		ZIndex = 6,
	}, Frame2)

	local tbl12 = { Type = "Slider", Value = tbl11.Default or min, Min = min, Max = max, Callback = tbl11.Callback }

	local function fn28(arg4)
		v.spring(Frame3, { Size = UDim2.fromScale(arg4, 1) }, tbl5)
		v4.Text = tostring(tbl12.Value) .. "  /  " .. tostring(max)
	end

	tbl12.SetValue = function(arg4, arg5, arg6)
		local n8 = max == min and 0 or math.clamp((arg5 - min) / (max - min), 0, 1)
		tbl12.Value = tbl8:Round(min + (max - min) * n8, rounding)
		fn28(n8)
		if arg6 then
			return
		end
		tbl8:Guard(tbl12.Callback, tbl12.Value)
		tbl8:Guard(tbl12.Changed, tbl12.Value)
	end

	tbl12.OnChanged = function(arg4, changed)
		tbl12.Changed = changed
		changed(tbl12.Value)
	end

	tbl12.Destroy = function()
		v3:Destroy()
		tbl8.Options[arg2] = nil
	end

	local flag = false

	local function fn29(arg4)
		local x = Frame2.AbsoluteSize.X
		if x <= 0 then
			return
		end
		tbl12:SetValue(min + (max - min) * math.clamp((arg4 - Frame2.AbsolutePosition.X) / x, 0, 1))
	end

	TextButton.InputBegan:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		flag = true
		v.spring(Frame4, { Size = UDim2.fromOffset(17, 17) }, bouncy)
		fn29(input.Position.X)
	end)

	UserInputService.InputEnded:Connect(function(input)
		if not flag then
			return
		end

		if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		flag = false
		v.spring(Frame4, { Size = UDim2.fromOffset(13, 13) }, bouncy)
	end)

	UserInputService.InputChanged:Connect(function(input)
		if not flag then
			return
		end

		if input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		fn29(input.Position.X)
	end)

	tbl12:SetValue(tbl12.Value, true)
	return fn27(arg2, fn26(tbl12, v3))
end

handlers.AddInput = function(arg, arg2, arg3)
	local tbl11 = arg3 or {}
	local v3 = fn23(arg, tbl11.Title, tbl11.Description, 46, 211)
	fn24(v3, tbl11.Icon or "textField")

	local Frame2 = fn2("Frame", {
		Name = "Box",
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -12, 0.5, 0),
		Size = UDim2.fromOffset(140, 28),
		BackgroundColor3 = color,
		BackgroundTransparency = n2,
		BorderSizePixel = 0,
	}, v3)

	fn3(Frame2, 7)
	local v4 = fn4(Frame2, color2, 0.45)

	local TextBox = fn2("TextBox", {
		Name = "Field",
		Position = UDim2.fromOffset(9, 0),
		Size = UDim2.new(1, -18, 1, 0),
		BackgroundTransparency = 1,
		ClearTextOnFocus = false,
		Text = tbl11.Default or "",
		PlaceholderText = tbl11.Placeholder or "",
		PlaceholderColor3 = color4,
		TextColor3 = color4,
		TextSize = 11,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
		FontFace = fn(),
	}, Frame2)

	local Frame3 = fn2("Frame", {
		Name = "Line",
		AnchorPoint = Vector2.new(0.5, 1),
		Position = UDim2.new(0.5, 0, 1, -1),
		Size = UDim2.new(0, 0, 0, 2),
		BackgroundColor3 = color3,
		BorderSizePixel = 0,
		ZIndex = 3,
	}, Frame2)

	fn3(Frame3, 1)
	local tbl12

	tbl12 = {
		Type = "Input",
		Value = tbl11.Default or "",
		Callback = tbl11.Callback,
		SetValue = function(arg4, arg5, arg6)
			local value

			if tbl11.MaxLength and #arg5 > tbl11.MaxLength then
				value = string.sub(arg5, 1, tbl11.MaxLength)
			else
				value = arg5
			end

			if tbl11.Numeric and value ~= "" and not tonumber(value) then
				value = tbl12.Value
			end

			tbl12.Value = value
			TextBox.Text = value
			if arg6 then
				return
			end
			tbl8:Guard(tbl12.Callback, value)
			tbl8:Guard(tbl12.Changed, value)
		end,
		OnChanged = function(arg4, changed)
			tbl12.Changed = changed
			changed(tbl12.Value)
		end,
		Destroy = function()
			v3:Destroy()
			tbl8.Options[arg2] = nil
		end,
	}

	TextBox.Focused:Connect(function()
		v.spring(Frame3, { Size = UDim2.new(1, -4, 0, 2) }, snappy)
		fn10(v4, tbl3, { Transparency = 0.1, Color = color3 })
	end)

	TextBox.FocusLost:Connect(function(enterPressed)
		v.spring(Frame3, { Size = UDim2.new(0, 0, 0, 2) }, snappy)
		fn10(v4, tbl3, { Transparency = 0.45, Color = color2 })
		if tbl11.Finished and not enterPressed then
			return
		end
		tbl12:SetValue(TextBox.Text)
	end)

	if not tbl11.Finished then
		TextBox:GetPropertyChangedSignal("Text"):Connect(function()
			if TextBox.Text == tbl12.Value then
				return
			end
			tbl12:SetValue(TextBox.Text)
		end)
	end

	return fn27(arg2, fn26(tbl12, v3))
end

handlers.AddKeybind = function(arg, arg2, arg3)
	local tbl11 = arg3 or {}
	local v3 = fn23(arg, tbl11.Title, tbl11.Description, 46, 157)
	fn24(v3, tbl11.Icon or "keyboard")

	local Frame2 = fn2("Frame", {
		Name = "Box",
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -12, 0.5, 0),
		Size = UDim2.fromOffset(86, 28),
		BackgroundColor3 = color,
		BackgroundTransparency = n2,
		BorderSizePixel = 0,
	}, v3)

	fn3(Frame2, 7)
	local v4 = fn4(Frame2, color2, 0.45)

	local v5 = fn7({
		Name = "Key",
		Size = UDim2.fromScale(1, 1),
		Text = tbl11.Default or "None",
		TextSize = 11,
		TextXAlignment = Enum.TextXAlignment.Center,
		FontFace = fn(Enum.FontWeight.Medium),
	}, Frame2)

	local tbl12 = {
		Type = "Keybind",
		Value = tbl11.Default or "None",
		Mode = tbl11.Mode or "Toggle",
		Toggled = false,
		Callback = tbl11.Callback,
	}

	local flag = false

	tbl12.SetValue = function(arg4, value, mode)
		tbl12.Value = value or tbl12.Value
		tbl12.Mode = mode or tbl12.Mode
		v5.Text = tbl12.Value
	end

	tbl12.GetState = function()
		if tbl12.Mode == "Always" then
			return true
		end

		if tbl12.Mode == "Hold" then
			if tbl12.Value == "None" then
				return false
			end

			local ok, result = pcall(function()
				return UserInputService:IsKeyDown(Enum.KeyCode[tbl12.Value])
			end)

			return ok and result
		end

		return tbl12.Toggled
	end

	tbl12.OnChanged = function(arg4, changed)
		tbl12.Changed = changed
	end

	tbl12.Destroy = function()
		v3:Destroy()
		tbl8.Options[arg2] = nil
	end

	fn8(Frame2, 6).MouseButton1Click:Connect(function()
		flag = true
		v5.Text = "..."
		fn10(v4, tbl3, { Transparency = 0.1, Color = color3 })
	end)

	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if flag then
			if input.UserInputType ~= Enum.UserInputType.Keyboard then
				return
			end
			flag = false
			tbl12:SetValue(input.KeyCode.Name)
			fn10(v4, tbl3, { Transparency = 0.45, Color = color2 })
			tbl8:Guard(tbl12.Changed, tbl12.Value)
			return
		end

		if gameProcessed then
			return
		end

		if input.UserInputType ~= Enum.UserInputType.Keyboard then
			return
		end

		if input.KeyCode.Name ~= tbl12.Value then
			return
		end

		if tbl12.Mode == "Toggle" then
			tbl12.Toggled = not tbl12.Toggled
			tbl8:Guard(tbl12.Callback, tbl12.Toggled)
		else
			tbl8:Guard(tbl12.Callback, true)
		end
	end)

	return fn27(arg2, fn26(tbl12, v3))
end

handlers.AddParagraph = function(arg, arg2)
	local tbl11 = arg2 or {}
	local v3 = fn23(arg, tbl11.Title, tbl11.Content, 60, 24)
	fn24(v3, tbl11.Icon or "quote")
	fn25(v3)
	local tbl12 = { Type = "Paragraph" }
	fn26(tbl12, v3)
	tbl12.SetContent = tbl12.SetDesc
	return tbl12
end

handlers.AddButton = function(arg, arg2)
	local tbl11 = arg2 or {}
	local v3 = fn23(arg, tbl11.Title, tbl11.Description, 46, 149)
	fn24(v3, tbl11.Icon or "click")
	local v4 = fn2

	local TextButton = v4("TextButton", {
		Name = "Go",
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -12, 0.5, 0),
		Size = UDim2.fromOffset(78, 28),
		BackgroundColor3 = tbl11.Filled and color3 or color,
		BackgroundTransparency = tbl11.Filled and 0 or 0.45,
		BorderSizePixel = 0,
		AutoButtonColor = false,
		Text = tbl11.Label or "Run",
		TextColor3 = color4,
		TextSize = 11,
		FontFace = fn(Enum.FontWeight.Medium),
	}, v3)

	fn3(TextButton, 7)

	if not tbl11.Filled then
		fn4(TextButton, color2, 0.45)
	end

	local size = TextButton.Size

	TextButton.MouseButton1Down:Connect(function()
		fn10(TextButton, tbl3, { Size = UDim2.fromOffset(size.X.Offset - 4, size.Y.Offset - 2) })
	end)

	TextButton.MouseButton1Up:Connect(function()
		fn10(TextButton, bouncy, { Size = size })
	end)

	TextButton.MouseLeave:Connect(function()
		fn10(TextButton, bouncy, { Size = size })
	end)

	TextButton.MouseButton1Click:Connect(function()
		tbl8:Guard(tbl11.Callback)
	end)

	local tbl12 = { Type = "Button" }
	fn26(tbl12, v3)

	tbl12.SetLabel = function(arg3, text)
		TextButton.Text = text
	end

	return tbl12
end

handlers.AddButtons = function(arg, arg2)
	arg2 = arg2 or {}
	arg.Count = arg.Count + 1

	local CanvasGroup = fn2("CanvasGroup", {
		Name = "Actions",
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		GroupTransparency = 0,
		LayoutOrder = arg.Count,
	}, arg.Items)

	fn6(CanvasGroup, 6, Enum.FillDirection.Horizontal)
	local tbl11 = {}

	for i, v3 in ipairs(arg2) do
		local TextButton = fn2("TextButton", {
			Name = v3.Title or "Act" .. i,
			Size = UDim2.new(1 / #arg2, -(#arg2 - 1) * 6 / #arg2, 0, 62),
			BackgroundColor3 = v3.Filled and color3 or color4,
			BackgroundTransparency = v3.Filled and 0.12 or 0.95,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			Text = "",
			LayoutOrder = i,
		}, CanvasGroup)

		fn3(TextButton, 8)
		local v4 = fn4(TextButton, v3.Filled and color3 or color2, v3.Filled and 0.5 or 0.45)

		fn2("ImageLabel", {
			Name = "Icon",
			Position = UDim2.fromOffset(12, 12),
			Size = UDim2.fromOffset(16, 16),
			BackgroundTransparency = 1,
			Image = tbl8:GetIcon(v3.Icon or "click") or "",
			ImageColor3 = color4,
			ImageTransparency = 0.05,
			ScaleType = Enum.ScaleType.Fit,
		}, TextButton)

		fn7({
			Name = "Title",
			Position = UDim2.fromOffset(12, 32),
			Size = UDim2.new(1, -24, 0, 14),
			Text = v3.Title or "Action",
			TextSize = 12,
			TextTruncate = Enum.TextTruncate.AtEnd,
			FontFace = fn(Enum.FontWeight.Medium),
		}, TextButton)

		fn7({
			Name = "Desc",
			Position = UDim2.fromOffset(12, 45),
			Size = UDim2.new(1, -24, 0, 12),
			Text = v3.Description or "",
			TextSize = 10,
			TextTransparency = n4,
			TextTruncate = Enum.TextTruncate.AtEnd,
		}, TextButton)

		local backgroundTransparency = TextButton.BackgroundTransparency

		TextButton.MouseEnter:Connect(function()
			fn10(TextButton, tbl3, { BackgroundTransparency = backgroundTransparency - 0.04 })
			fn10(v4, tbl3, { Transparency = 0.15 })
		end)

		TextButton.MouseLeave:Connect(function()
			fn10(TextButton, tbl3, { BackgroundTransparency = backgroundTransparency })
			fn10(v4, tbl3, { Transparency = v3.Filled and 0.5 or 0.45 })
		end)

		TextButton.MouseButton1Click:Connect(function()
			tbl8:Guard(v3.Callback)
		end)

		tbl11[i] = TextButton
	end

	return {
		Type = "Buttons",
		Cells = tbl11,
		Destroy = function()
			CanvasGroup:Destroy()
		end,
	}
end

handlers.AddSegmented = function(arg, arg2, arg3)
	local tbl11 = arg3 or {}
	local values = tbl11.Values or {}
	local v3 = fn23(arg, tbl11.Title, tbl11.Description, 78, 24)
	fn24(v3, tbl11.Icon or "columns3")
	fn25(v3)

	local Frame2 = fn2("Frame", {
		Name = "Segment",
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 47, 1, -10),
		Size = UDim2.new(1, -61, 0, 26),
		BackgroundColor3 = color,
		BackgroundTransparency = n2,
		BorderSizePixel = 0,
	}, v3)

	fn3(Frame2, 8)
	fn4(Frame2, color2, 0.5)
	fn5(Frame2, 3)

	local Frame3 = fn2("Frame", {
		Name = "Pill",
		Size = UDim2.fromScale(1 / math.max(#values, 1), 1),
		BackgroundColor3 = color3,
		BorderSizePixel = 0,
		ZIndex = 2,
	}, Frame2)

	fn3(Frame3, 6)
	local tbl12 = { Type = "Segmented", Value = tbl11.Default or values[1], Callback = tbl11.Callback }
	local tbl13 = {}

	for i, value in ipairs(values) do
		local TextButton = fn2("TextButton", {
			Name = value,
			Size = UDim2.fromScale(1 / #values, 1),
			Position = UDim2.fromScale((i - 1) / #values, 0),
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			Text = value,
			TextColor3 = color4,
			TextSize = 11,
			TextTransparency = 0.45,
			FontFace = fn(Enum.FontWeight.Medium),
			ZIndex = 3,
		}, Frame2)

		tbl13[i] = TextButton

		TextButton.MouseButton1Click:Connect(function()
			tbl12:SetValue(value)
		end)
	end

	tbl12.SetValue = function(arg4, value, arg5)
		local v4 = table.find(values, value)
		if not v4 then
			return
		end
		tbl12.Value = value
		v.spring(Frame3, { Position = UDim2.fromScale((v4 - 1) / #values, 0) }, snappy)

		for i, v5 in ipairs(tbl13) do
			fn10(v5, tbl3, { TextTransparency = i == v4 and 0 or 0.45 })
		end

		if arg5 then
			return
		end
		tbl8:Guard(tbl12.Callback, value)
		tbl8:Guard(tbl12.Changed, value)
	end

	tbl12.OnChanged = function(arg4, changed)
		tbl12.Changed = changed
		changed(tbl12.Value)
	end

	tbl12.Destroy = function()
		v3:Destroy()
		tbl8.Options[arg2] = nil
	end

	tbl12:SetValue(tbl12.Value, true)
	return fn27(arg2, fn26(tbl12, v3))
end

local tbl11 = { time = 0.34, ease = v.ease.back }
local tbl12 = { time = 0.22, ease = v.ease.backIn }
local n8 = 236
local tbl13 = {}
local v3 = nil

local function fn28(arg)
	local roll = arg:FindFirstChild("Roll")
	if not roll then
		return arg.AbsoluteSize.Y
	end
	local uiListLayout = roll:FindFirstChildOfClass("UIListLayout")
	local n9

	if uiListLayout and uiListLayout.AbsoluteContentSize.Y > 0 then
		n9 = uiListLayout.AbsoluteContentSize.Y + 14
	else
		n9 = 14

		for _, child in ipairs(roll:GetChildren()) do
			if child:IsA("GuiObject") and child.Visible then
				n9 = n9 + child.Size.Y.Offset + 3
			end
		end
	end

	local scrollingEnabled = n9 > n8
	local n10 = math.min(n9, 236)
	arg.Size = UDim2.fromOffset(arg.Size.X.Offset, n10)
	roll.ScrollingEnabled = scrollingEnabled
	roll.ScrollBarThickness = scrollingEnabled and 2 or 0
	roll.CanvasPosition = Vector2.zero
	return n10
end

local function fn29(arg, arg2, arg3, arg4)
	local n9 = arg4 or 6
	local absolutePosition = arg2.AbsolutePosition
	local absoluteSize = arg2.AbsoluteSize
	local offset = arg.Size.X.Offset
	local v4 = fn28(arg)
	local y = arg3.AbsolutePosition.Y
	local n10 = y + arg3.AbsoluteSize.Y
	local n11 = absolutePosition.Y + absoluteSize.Y + n9
	local n12 = absolutePosition.Y - n9 - v4
	local flag = n11 + v4 > n10 - n9 and n12 >= y + n9
	local flag2 = false

	if flag then
		flag2 = true
	else
		n12 = n11
	end

	local n13 = math.clamp(n12, y + n9, math.max(y + n9, n10 - v4 - n9))
	local n14 = math.clamp(absolutePosition.X + absoluteSize.X - offset, arg3.AbsolutePosition.X + n9, math.max(arg3.AbsolutePosition.X + n9, arg3.AbsolutePosition.X + arg3.AbsoluteSize.X - offset - n9))
	arg:SetAttribute("Rest", n13)
	arg:SetAttribute("Flip", flag2)
	arg.Position = UDim2.fromOffset(n14, n13 + (flag2 and 8 or -8))
end

local function fn30(arg)
	local attribute = arg:GetAttribute("Rest") or arg.Position.Y.Offset
	local attribute2 = arg:GetAttribute("Flip")
	local offset = arg.Position.X.Offset
	arg:SetAttribute("Open", true)
	local uiStroke = arg:FindFirstChildOfClass("UIStroke")

	if uiStroke then
		v.set(uiStroke, { Transparency = 1 })
		v.tween(uiStroke, { Transparency = 0.25 }, { time = 0.17, ease = v.ease.out })
	end

	v.set(arg, { GroupTransparency = 1, Position = UDim2.fromOffset(offset, attribute + (attribute2 and 14 or -14)) })
	arg.Pop.Scale = 0.86
	arg.Visible = true
	v.tween(arg, { Position = UDim2.fromOffset(offset, attribute) }, tbl11)
	v.tween(arg.Pop, { Scale = 1 }, tbl11)
	v.tween(arg, { GroupTransparency = 0 }, { time = 0.13, ease = v.ease.out })
end

local function fn31(arg)
	if not arg.Visible then
		return
	end
	arg:SetAttribute("Open", false)
	local attribute = arg:GetAttribute("Rest") or arg.Position.Y.Offset
	local attribute2 = arg:GetAttribute("Flip")
	local offset = arg.Position.X.Offset
	local uiStroke = arg:FindFirstChildOfClass("UIStroke")

	if uiStroke then
		v.tween(uiStroke, { Transparency = 1 }, { time = 0.17, ease = v.ease.inOut })
	end

	v.tween(arg, { Position = UDim2.fromOffset(offset, attribute + (attribute2 and 10 or -10)) }, tbl12)
	v.tween(arg.Pop, { Scale = 0.9 }, tbl12)

	v.tween(arg, { GroupTransparency = 1 }, {
		time = 0.2,
		ease = v.ease.inOut,
		done = function()
			if not arg:GetAttribute("Open") then
				arg.Visible = false
			end
		end,
	})
end

local function fn32()
	for _, v4 in ipairs(tbl13) do
		fn31(v4)
	end

	v3 = nil
end

UserInputService.InputBegan:Connect(function(input)
	if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
		return
	end

	if not v3 or not v3.Visible then
		return
	end
	local absolutePosition = v3.AbsolutePosition
	local absoluteSize = v3.AbsoluteSize
	local position = input.Position

	if position.X < absolutePosition.X or position.X > absolutePosition.X + absoluteSize.X or position.Y < absolutePosition.Y or position.Y > absolutePosition.Y + absoluteSize.Y then
		task.defer(fn32)
	end
end)

local function fn33(arg)
	local CanvasGroup = fn2("CanvasGroup", {
		Name = "Float",
		Size = UDim2.fromOffset(arg, 0),
		BackgroundColor3 = color,
		BackgroundTransparency = 0.03,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		GroupTransparency = 0,
		Visible = false,
		ZIndex = 200,
	}, ScreenGui)

	fn2("UIScale", { Name = "Pop", Scale = 1 }, CanvasGroup)
	fn3(CanvasGroup, 11)
	fn4(CanvasGroup, color2, 0.25)
	table.insert(tbl13, CanvasGroup)
	return CanvasGroup
end

local function fn34(arg, arg2, arg3)
	local Frame2 = fn2("Frame", {
		Name = "Box",
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -12, 0.5, 0),
		Size = UDim2.fromOffset(arg2, 28),
		BackgroundColor3 = color,
		BackgroundTransparency = n2,
		BorderSizePixel = 0,
	}, arg)

	fn3(Frame2, 7)
	fn4(Frame2, color2, 0.45)

	fn7({
		Name = "Value",
		Position = UDim2.fromOffset(9, 0),
		Size = UDim2.new(1, -30, 1, 0),
		Text = arg3 or "",
		TextSize = 11,
		TextTruncate = Enum.TextTruncate.AtEnd,
	}, Frame2)

	fn2("ImageLabel", {
		Name = "Art",
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -8, 0.5, 0),
		Size = UDim2.fromOffset(12, 12),
		BackgroundTransparency = 1,
		Image = obj.caret,
		ImageColor3 = color4,
		ImageTransparency = 0.45,
		ScaleType = Enum.ScaleType.Fit,
	}, Frame2)

	return Frame2
end

handlers.AddDropdown = function(arg, arg2, arg3)
	local tbl14 = arg3 or {}
	local values = tbl14.Values or {}
	local v4 = fn23(arg, tbl14.Title, tbl14.Description, 46, 223)
	fn24(v4, tbl14.Icon or "caret")
	local v5 = fn34(v4, 152, "--")
	local v6 = fn33(178)

	local ScrollingFrame = fn2("ScrollingFrame", {
		Name = "Roll",
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ElasticBehavior = Enum.ElasticBehavior.Never,
		ScrollBarThickness = 0,
		ScrollBarImageColor3 = color4,
		ScrollBarImageTransparency = 0.7,
		ScrollingEnabled = false,
		ZIndex = 201,
	}, v6)

	fn5(ScrollingFrame, 7)
	fn6(ScrollingFrame, 3)

	local tbl15 = {
		Type = "Dropdown",
		Values = values,
		Multi = tbl14.Multi,
		Value = tbl14.Multi and {} or nil,
		Callback = tbl14.Callback,
	}

	local tbl16 = {}

	local function fn35()
		local str3

		if tbl15.Multi then
			local tbl17 = {}

			for _, value in ipairs(tbl15.Values) do
				if tbl15.Value[value] then
					tbl17[#tbl17 + 1] = value
				end
			end

			str3 = table.concat(tbl17, ", ")
		else
			str3 = tbl15.Value or ""
		end

		v5.Value.Text = str3 == "" and "--" or str3
	end

	local function fn36(arg4, arg5)
		fn10(arg4, tbl3, { BackgroundTransparency = arg5 and 0.9 or 1 })
		fn10(arg4.Label, tbl3, { TextTransparency = arg5 and 0 or 0.4 })
		fn10(arg4.Tick, tbl3, { ImageTransparency = arg5 and 0 or 1 })
		fn10(arg4.Mark, tbl3, { BackgroundTransparency = arg5 and 0 or 1 })
		arg4.Edge.Transparency = arg5 and 0.55 or 1

		if arg5 then
			v.set(arg4.Mark, { Size = UDim2.fromOffset(3, 0) })
			v.spring(arg4.Mark, { Size = UDim2.fromOffset(3, 14) }, bouncy)
			v.set(arg4.Tick, { Size = UDim2.fromOffset(6, 6) })
			v.spring(arg4.Tick, { Size = UDim2.fromOffset(13, 13) }, bouncy)
			v.set(arg4, { BackgroundTransparency = 0.7 })
			v.tween(arg4, { BackgroundTransparency = 0.9 }, { time = 0.26, ease = v.ease.out })
		end
	end

	local function fn37()
		for _, v7 in ipairs(tbl16) do
			v7:Destroy()
		end

		tbl16 = {}

		for i, value in ipairs(tbl15.Values) do
			local TextButton = fn2("TextButton", {
				Name = value,
				Size = UDim2.new(1, 0, 0, 30),
				BackgroundColor3 = color4,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutoButtonColor = false,
				Text = "",
				LayoutOrder = i,
				ZIndex = 202,
			}, ScrollingFrame)

			fn3(TextButton, 8)
			fn4(TextButton, color3, 1).Name = "Edge"

			fn3(fn2("Frame", {
				Name = "Mark",
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 0, 0.5, 0),
				Size = UDim2.fromOffset(3, 14),
				BackgroundColor3 = color3,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 203,
			}, TextButton), 2)

			fn7({
				Name = "Label",
				Position = UDim2.fromOffset(12, 0),
				Size = UDim2.new(1, -34, 1, 0),
				Text = value,
				TextSize = 11,
				TextTransparency = 0.4,
				TextTruncate = Enum.TextTruncate.AtEnd,
				ZIndex = 203,
			}, TextButton)

			fn2("ImageLabel", {
				Name = "Tick",
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -9, 0.5, 0),
				Size = UDim2.fromOffset(13, 13),
				BackgroundTransparency = 1,
				Image = obj.check,
				ImageColor3 = color3,
				ImageTransparency = 1,
				ScaleType = Enum.ScaleType.Fit,
				ZIndex = 203,
			}, TextButton)

			local function fn38()
				if tbl15.Multi then
					return tbl15.Value[value] and true or false
				end
				return tbl15.Value == value
			end

			TextButton.MouseEnter:Connect(function()
				if not fn38() then
					fn10(TextButton, tbl3, { BackgroundTransparency = 0.95 })
				end
			end)

			TextButton.MouseLeave:Connect(function()
				if not fn38() then
					fn10(TextButton, tbl3, { BackgroundTransparency = 1 })
				end
			end)

			TextButton.MouseButton1Click:Connect(function()
				if tbl15.Multi then
					tbl15.Value[value] = not tbl15.Value[value] or nil
					fn36(TextButton, tbl15.Value[value] and true or false)
				else
					tbl15.Value = value

					for _, v7 in ipairs(tbl16) do
						fn36(v7, v7 == TextButton)
					end

					task.delay(0.14, fn32)
				end

				fn35()
				tbl8:Dirty()
				tbl8:Guard(tbl15.Callback, tbl15.Value)
				tbl8:Guard(tbl15.Changed, tbl15.Value)
			end)

			tbl16[#tbl16 + 1] = TextButton
			local v7 = fn36
			local v8 = fn38()
			v7(TextButton, v8)
		end

		fn35()
	end

	tbl15.SetValues = function(arg4, values2)
		tbl15.Values = values2 or tbl15.Values
		fn37()
	end

	tbl15.SetValue = function(arg4, arg5, arg6)
		if tbl15.Multi then
			local value = {}
			local v7 = ipairs
			arg5 = arg5 or {}

			for _, v8 in v7(arg5) do
				if table.find(tbl15.Values, v8) then
					value[v8] = true
				end
			end

			tbl15.Value = value
		else
			tbl15.Value = table.find(tbl15.Values, arg5) and arg5 or nil
		end

		for _, v7 in ipairs(tbl16) do
			local v8 = fn36
			local multi = tbl15.Multi
			local flag

			if multi then
				flag = tbl15.Value[v7.Name] and true or false
			else
				flag = multi
			end

			v8(v7, flag or tbl15.Value == v7.Name)
		end

		fn35()
		if arg6 then
			return
		end
		tbl8:Guard(tbl15.Callback, tbl15.Value)
		tbl8:Guard(tbl15.Changed, tbl15.Value)
	end

	tbl15.OnChanged = function(arg4, changed)
		tbl15.Changed = changed
		changed(tbl15.Value)
	end

	tbl15.Destroy = function()
		v4:Destroy()
		v6:Destroy()
		tbl8.Options[arg2] = nil
	end

	fn37()

	if tbl14.Default then
		tbl15:SetValue(tbl14.Default, true)
	end

	fn8(v5, 6).MouseButton1Click:Connect(function()
		if v6.Visible and v6:GetAttribute("Open") then
			fn32()
			return
		end
		fn32()
		fn29(v6, v5, arg.Window.Root, 6)
		fn30(v6)
		v3 = v6
	end)

	return fn27(arg2, fn26(tbl15, v4))
end

handlers.AddColorpicker = function(arg, arg2, arg3)
	local tbl14 = arg3 or {}
	local v4 = fn23(arg, tbl14.Title, tbl14.Description, 46, 131)
	fn24(v4, tbl14.Icon or "pipette")
	local default = tbl14.Default or color3

	local Frame2 = fn2("Frame", {
		Name = "Chip",
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -12, 0.5, 0),
		Size = UDim2.fromOffset(52, 26),
		BackgroundColor3 = default,
		BorderSizePixel = 0,
	}, v4)

	fn3(Frame2, 7)
	fn4(Frame2, color2, 0.35)
	local v5 = fn33(186)
	v5.Size = UDim2.fromOffset(186, 186)

	local Frame3 = fn2("Frame", {
		Name = "Field",
		Position = UDim2.fromOffset(12, 12),
		Size = UDim2.fromOffset(134, 110),
		BackgroundColor3 = default,
		BorderSizePixel = 0,
		ZIndex = 201,
	}, v5)

	fn3(Frame3, 8)
	local Frame4 = fn2("Frame", { Size = UDim2.fromScale(1, 1), BackgroundColor3 = color4, BorderSizePixel = 0, ZIndex = 202 }, Frame3)
	fn3(Frame4, 8)
	local new = NumberSequenceKeypoint.new
	fn2("UIGradient", { Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), new(1, 1) }) }, Frame4)

	local Frame5 = fn2("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0,
		ZIndex = 203,
	}, Frame3)

	fn3(Frame5, 8)
	local new2 = NumberSequenceKeypoint.new

	fn2("UIGradient", {
		Rotation = 90,
		Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), new2(1, 0) }),
	}, Frame5)

	local Frame6 = fn2("Frame", {
		Name = "Dot",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.fromOffset(11, 11),
		BackgroundColor3 = color4,
		BorderSizePixel = 0,
		ZIndex = 205,
	}, Frame3)

	fn3(Frame6, 6)
	fn4(Frame6, Color3.new(0, 0, 0), 0.55)

	local Frame7 = fn2("Frame", {
		Name = "Hue",
		Position = UDim2.fromOffset(154, 12),
		Size = UDim2.fromOffset(20, 110),
		BorderSizePixel = 0,
		ZIndex = 201,
	}, v5)

	fn3(Frame7, 6)
	local tbl15 = {}

	for i = 0, 6 do
		tbl15[#tbl15 + 1] = ColorSequenceKeypoint.new(i / 6, Color3.fromHSV(i / 6, 1, 1))
	end

	fn2("UIGradient", { Color = ColorSequence.new(tbl15), Rotation = 90 }, Frame7)

	local Frame8 = fn2("Frame", {
		Name = "Slot",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0, 0),
		Size = UDim2.new(1, 6, 0, 5),
		BackgroundColor3 = color4,
		BorderSizePixel = 0,
		ZIndex = 203,
	}, Frame7)

	fn3(Frame8, 3)
	fn4(Frame8, Color3.new(0, 0, 0), 0.6)

	local TextBox = fn2("TextBox", {
		Name = "Hex",
		Position = UDim2.fromOffset(12, 132),
		Size = UDim2.fromOffset(162, 28),
		BackgroundColor3 = color,
		BackgroundTransparency = n2,
		BorderSizePixel = 0,
		ClearTextOnFocus = false,
		Text = "#" .. default:ToHex(),
		TextColor3 = color4,
		TextSize = 11,
		TextXAlignment = Enum.TextXAlignment.Center,
		FontFace = fn(Enum.FontWeight.Medium),
		ZIndex = 201,
	}, v5)

	fn3(TextBox, 7)
	fn4(TextBox, color2, 0.45)
	local color5, n9, n10 = Color3.toHSV(default)
	local tbl16 = { Type = "Colorpicker", Value = default, Callback = tbl14.Callback }

	local function fn35(arg4)
		local color6 = Color3.fromHSV(color5, n9, n10)
		tbl16.Value = color6
		Frame2.BackgroundColor3 = color6
		Frame3.BackgroundColor3 = Color3.fromHSV(color5, 1, 1)
		Frame6.Position = UDim2.fromScale(n9, 1 - n10)
		Frame8.Position = UDim2.new(0.5, 0, color5, 0)
		TextBox.Text = "#" .. color6:ToHex()
		if arg4 then
			return
		end
		tbl8:Dirty()
		tbl8:Guard(tbl16.Callback, color6)
		tbl8:Guard(tbl16.Changed, color6)
	end

	tbl16.SetValue = function(arg4, arg5, arg6)
		local color6, v6, v7 = Color3.toHSV(arg5)
		color5 = color6
		n9 = v6
		n10 = v7
		fn35(arg6)
	end

	tbl16.OnChanged = function(arg4, changed)
		tbl16.Changed = changed
		changed(tbl16.Value)
	end

	tbl16.Destroy = function()
		v4:Destroy()
		v5:Destroy()
		tbl8.Options[arg2] = nil
	end

	local flag = false
	local flag2 = false
	local v6 = fn8(Frame3, 206)
	local v7 = fn8(Frame7, 206)

	local function fn36(arg4)
		local absoluteSize = Frame3.AbsoluteSize
		if absoluteSize.X <= 0 or absoluteSize.Y <= 0 then
			return
		end
		n9 = math.clamp((arg4.X - Frame3.AbsolutePosition.X) / absoluteSize.X, 0, 1)
		n10 = 1 - math.clamp((arg4.Y - Frame3.AbsolutePosition.Y) / absoluteSize.Y, 0, 1)
		fn35()
	end

	local function fn37(arg4)
		local absoluteSize = Frame7.AbsoluteSize
		if absoluteSize.Y <= 0 then
			return
		end
		color5 = math.clamp((arg4.Y - Frame7.AbsolutePosition.Y) / absoluteSize.Y, 0, 1)
		fn35()
	end

	v6.InputBegan:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		flag = true
		fn36(input.Position)
	end)

	v7.InputBegan:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		flag2 = true
		fn37(input.Position)
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then
			return
		end

		if flag then
			fn36(input.Position)
		end

		if flag2 then
			fn37(input.Position)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		flag = false
		flag2 = false
	end)

	TextBox.FocusLost:Connect(function()
		local ok, result = pcall(Color3.fromHex, TextBox.Text)

		if ok and typeof(result) == "Color3" then
			tbl16:SetValue(result)
		else
			fn35(true)
		end
	end)

	fn8(Frame2, 6).MouseButton1Click:Connect(function()
		if v5.Visible and v5:GetAttribute("Open") then
			fn32()
			return
		end
		fn32()
		fn29(v5, Frame2, arg.Window.Root, 6)
		fn30(v5)
		v3 = v5
	end)

	fn35(true)
	return fn27(arg2, fn26(tbl16, v4))
end

local HttpService = game:GetService("HttpService")
local tbl14 = {}

local function fn35()
	return type(writefile) == "function" and type(readfile) == "function"
end

local function fn36(arg)
	if type(makefolder) ~= "function" or type(isfolder) ~= "function" then
		return
	end
	local v4, v5, v6 = string.gmatch(arg, "[^/]+")
	local str3 = nil

	for k in v4, v5, v6 do
		str3 = str3 and str3 .. "/" .. k or k

		if not isfolder(str3) then
			pcall(makefolder, str3)
		end
	end
end

local function fn37(arg, arg2)
	if not fn35() then
		tbl14[arg] = arg2
		return true, "vault"
	end

	if pcall(writefile, arg, arg2) then
		return true, "disk"
	end
	tbl14[arg] = arg2
	return true, "vault"
end

local function fn38(arg)
	if fn35() and type(isfile) == "function" then
		if select(2, pcall(isfile, arg)) then
			local ok, result = pcall(readfile, arg)
			if ok then
				return result, "disk"
			end
		end
	end

	return tbl14[arg], tbl14[arg] and "vault" or nil
end

local function fn39(arg)
	local type_ = arg.Type
	if type_ == "Colorpicker" then
		return { k = "color", v = arg.Value:ToHex() }
	end

	if type_ == "Keybind" then
		return { k = "bind", v = arg.Value, m = arg.Mode }
	end

	if type_ == "Dropdown" and arg.Multi then
		local tbl15 = {}
		local v4 = pairs
		local tbl16 = arg.Value or {}

		for k, v5 in v4(tbl16) do
			if v5 then
				tbl15[#tbl15 + 1] = k
			end
		end

		table.sort(tbl15)
		return { k = "many", v = tbl15 }
	end

	return { k = "plain", v = arg.Value }
end

local function fn40(arg, arg2)
	if type(arg2) ~= "table" then
		return
	end

	if arg2.k == "color" then
		local ok, result = pcall(Color3.fromHex, arg2.v)

		if ok then
			arg:SetValue(result, true)
		end

		return
	end

	if arg2.k == "bind" then
		arg:SetValue(arg2.v, arg2.m)
		return
	end

	if arg2.k == "many" then
		arg:SetValue(arg2.v, true)
		return
	end

	if arg2.v ~= nil then
		arg:SetValue(arg2.v, true)
	end
end

tbl8.ConfigPath = function()
	local settings = tbl8.Settings or {}
	local main = settings.Main or "Night Hub"
	return main, main .. "/" .. (settings.Game or tostring(game.PlaceId)) .. ".json"
end

tbl8.SaveConfig = function()
	if not tbl8.Settings then
		return false, "chua bat Settings"
	end
	local tbl15 = {}

	for k, option in pairs(tbl8.Options) do
		if option.Type then
			tbl15[k] = fn39(option)
		end
	end

	local ok, result = pcall(function()
		return HttpService:JSONEncode({ version = tbl8.Version, saved = os.time(), data = tbl15 })
	end)

	if not ok then
		return false, result
	end
	local v4, v5 = tbl8:ConfigPath()
	fn36(v4)
	local v6, v7 = fn37(v5, result)
	return v6, v7
end

tbl8.LoadConfig = function(arg, arg2)
	if not tbl8.Settings then
		return false, "chua bat Settings"
	end
	local v4, v5 = tbl8:ConfigPath()
	local v6, v7 = fn38(v5)

	if not v6 then
		if not arg2 then
			tbl8:Notify({ Kind = "warn", Title = "Khong co config", Content = v5, Duration = 4 })
		end

		return false, "trong"
	end

	local ok, result = pcall(function()
		return HttpService:JSONDecode(v6)
	end)

	if not ok or type(result) ~= "table" then
		return false, "hong"
	end
	tbl8.Busy = true
	local v8 = pairs
	local data = result.data or {}
	local n9 = 0

	for k, v9 in v8(data) do
		local v10 = tbl8.Options[k]

		if v10 and v10.SetValue then
			if pcall(fn40, v10, v9) then
				n9 += 1
			end
		end
	end

	task.defer(function()
		tbl8.Busy = false
	end)

	if not arg2 then
		tbl8:Notify({ Kind = "good", Title = "Da nap config", Content = n9 .. " muc tu " .. v7, Duration = 4 })
	end

	return true, n9
end

tbl8.DeleteConfig = function()
	if not tbl8.Settings then
		return false
	end
	local v4, v5 = tbl8:ConfigPath()
	tbl14[v5] = nil

	if type(delfile) == "function" then
		pcall(delfile, v5)
	end

	return true
end

local flag = false

tbl8.Dirty = function()
	if not tbl8.Settings or not tbl8.Settings.Save then
		return
	end

	if tbl8.Busy or flag then
		return
	end
	flag = true

	task.delay(0.6, function()
		flag = false
		if tbl8.Unloaded or tbl8.Busy then
			return
		end
		tbl8:SaveConfig()
	end)
end

index.Dialog = function(arg, arg2)
	local tbl15 = arg2 or {}

	local Frame2 = fn2("Frame", {
		Name = "Shade",
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Color3.new(0, 0, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 300,
	}, arg.Root)

	local CanvasGroup = fn2("CanvasGroup", {
		Name = "Box",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(300, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = color,
		BackgroundTransparency = 0.04,
		BorderSizePixel = 0,
		GroupTransparency = 1,
		ZIndex = 301,
	}, Frame2)

	fn3(CanvasGroup, 12)
	fn4(CanvasGroup, color2)
	local UIScale = fn2("UIScale", { Name = "Pop", Scale = 0.92 }, CanvasGroup)
	fn2("UISizeConstraint", { MaxSize = Vector2.new(math.max(arg.Root.AbsoluteSize.X - 64, 240), math.huge) }, CanvasGroup)

	local Frame3 = fn2("Frame", {
		Name = "Column",
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		ZIndex = 302,
	}, CanvasGroup)

	fn5(Frame3, 18)
	fn6(Frame3, 8)

	local TextButton = fn2("TextButton", {
		Name = "Quit",
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -10, 0, 10),
		Size = UDim2.fromOffset(24, 24),
		BackgroundColor3 = color4,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutoButtonColor = false,
		Text = "",
		ZIndex = 305,
	}, CanvasGroup)

	fn3(TextButton, 7)

	fn2("ImageLabel", {
		Name = "Art",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(12, 12),
		BackgroundTransparency = 1,
		Image = obj.close,
		ImageColor3 = color4,
		ImageTransparency = 0.45,
		ScaleType = Enum.ScaleType.Fit,
		ZIndex = 306,
	}, TextButton)

	TextButton.MouseEnter:Connect(function()
		fn10(TextButton, tbl3, { BackgroundTransparency = 0.9 })
		fn10(TextButton.Art, tbl3, { ImageTransparency = 0.1 })
	end)

	TextButton.MouseLeave:Connect(function()
		fn10(TextButton, tbl3, { BackgroundTransparency = 1 })
		fn10(TextButton.Art, tbl3, { ImageTransparency = 0.45 })
	end)

	fn7({
		Name = "Title",
		Size = UDim2.new(1, -28, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Text = tbl15.Title or "Confirm",
		TextSize = 14,
		TextWrapped = true,
		TextYAlignment = Enum.TextYAlignment.Top,
		LayoutOrder = 1,
		FontFace = fn(Enum.FontWeight.Bold),
		ZIndex = 303,
	}, Frame3)

	fn7({
		Name = "Desc",
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Text = tbl15.Content or "",
		TextSize = 11,
		TextTransparency = n4,
		TextWrapped = true,
		TextYAlignment = Enum.TextYAlignment.Top,
		LayoutOrder = 2,
		ZIndex = 303,
	}, Frame3)

	local Frame4 = fn2("Frame", {
		Name = "Buttons",
		Size = UDim2.new(1, 0, 0, 32),
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		ZIndex = 303,
	}, Frame3)

	fn6(Frame4, 8, Enum.FillDirection.Horizontal)

	local function fn41()
		v.tween(CanvasGroup, { GroupTransparency = 1 }, { time = 0.14, ease = v.ease.out })
		v.tween(UIScale, { Scale = 0.92 }, { time = 0.16, ease = v.ease.backIn })

		v.tween(Frame2, { BackgroundTransparency = 1 }, {
			time = 0.18,
			ease = v.ease.out,
			done = function()
				Frame2:Destroy()
			end,
		})
	end

	TextButton.MouseButton1Click:Connect(fn41)

	fn2("TextButton", {
		Name = "Away",
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		Text = "",
		ZIndex = 300,
	}, Frame2).MouseButton1Click:Connect(fn41)

	local buttons = tbl15.Buttons or { { Title = "OK" } }

	for i, button in ipairs(buttons) do
		local TextButton2 = fn2("TextButton", {
			Name = button.Title or "Pick" .. i,
			Size = UDim2.new(1 / #buttons, -(#buttons - 1) * 8 / #buttons, 1, 0),
			BackgroundColor3 = button.Filled and color3 or color,
			BackgroundTransparency = button.Filled and 0 or 0.45,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			Text = button.Title or "OK",
			TextColor3 = color4,
			TextSize = 11,
			LayoutOrder = i,
			FontFace = fn(Enum.FontWeight.Medium),
			ZIndex = 304,
		}, Frame4)

		fn3(TextButton2, 7)

		if not button.Filled then
			fn4(TextButton2, color2, 0.45)
		end

		TextButton2.MouseButton1Click:Connect(function()
			fn41()
			tbl8:Guard(button.Callback)
		end)
	end

	v.tween(Frame2, { BackgroundTransparency = 0.45 }, { time = 0.18, ease = v.ease.out })
	v.tween(CanvasGroup, { GroupTransparency = 0 }, { time = 0.18, ease = v.ease.out })
	v.tween(UIScale, { Scale = 1 }, { time = 0.32, ease = v.ease.back })
	return { Close = fn41 }
end

for _, v4 in ipairs({
	"AddToggle",
	"AddSlider",
	"AddInput",
	"AddKeybind",
	"AddDropdown",
	"AddColorpicker",
	"AddButton",
	"AddButtons",
	"AddParagraph",
	"AddSegmented",
}) do
	index2[v4] = function(arg, ...)
		return handlers[v4](arg:Loft(), ...)
	end
end

return tbl8
