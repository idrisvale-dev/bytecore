-- By DevAurora Code
-- Detected obfuscation: Luraph v15
-- Local names are inferred from use (the original names are not in the bytecode)

local tbl = {
	Players = game:GetService("Players"),
	UIS = game:GetService("UserInputService"),
	TS = game:GetService("TweenService"),
	Run = game:GetService("RunService"),
	Http = game:GetService("HttpService"),
	Light = game:GetService("Lighting"),
	GuiS = game:GetService("GuiService"),
	Text = game:GetService("TextService"),
}

local function fn()
	return {
		assets = {
			["lucide-accessibility"] = "rbxassetid://10709751939",
			["lucide-activity"] = "rbxassetid://10709752035",
			["lucide-air-vent"] = "rbxassetid://10709752131",
			["lucide-airplay"] = "rbxassetid://10709752254",
			["lucide-alarm-check"] = "rbxassetid://10709752405",
			["lucide-alarm-clock"] = "rbxassetid://10709752630",
			["lucide-alarm-clock-off"] = "rbxassetid://10709752508",
			["lucide-alarm-minus"] = "rbxassetid://10709752732",
			["lucide-alarm-plus"] = "rbxassetid://10709752825",
			["lucide-album"] = "rbxassetid://10709752906",
			["lucide-alert-circle"] = "rbxassetid://10709752996",
			["lucide-alert-octagon"] = "rbxassetid://10709753064",
			["lucide-alert-triangle"] = "rbxassetid://10709753149",
			["lucide-align-center"] = "rbxassetid://10709753570",
			["lucide-align-center-horizontal"] = "rbxassetid://10709753272",
			["lucide-align-center-vertical"] = "rbxassetid://10709753421",
			["lucide-align-end-horizontal"] = "rbxassetid://10709753692",
			["lucide-align-end-vertical"] = "rbxassetid://10709753808",
			["lucide-align-horizontal-distribute-center"] = "rbxassetid://10747779791",
			["lucide-align-horizontal-distribute-end"] = "rbxassetid://10747784534",
			["lucide-align-horizontal-distribute-start"] = "rbxassetid://10709754118",
			["lucide-align-horizontal-justify-center"] = "rbxassetid://10709754204",
			["lucide-align-horizontal-justify-end"] = "rbxassetid://10709754317",
			["lucide-align-horizontal-justify-start"] = "rbxassetid://10709754436",
			["lucide-align-horizontal-space-around"] = "rbxassetid://10709754590",
			["lucide-align-horizontal-space-between"] = "rbxassetid://10709754749",
			["lucide-align-justify"] = "rbxassetid://10709759610",
			["lucide-align-left"] = "rbxassetid://10709759764",
			["lucide-align-right"] = "rbxassetid://10709759895",
			["lucide-align-start-horizontal"] = "rbxassetid://10709760051",
			["lucide-align-start-vertical"] = "rbxassetid://10709760244",
			["lucide-align-vertical-distribute-center"] = "rbxassetid://10709760351",
			["lucide-align-vertical-distribute-end"] = "rbxassetid://10709760434",
			["lucide-align-vertical-distribute-start"] = "rbxassetid://10709760612",
			["lucide-align-vertical-justify-center"] = "rbxassetid://10709760814",
			["lucide-align-vertical-justify-end"] = "rbxassetid://10709761003",
			["lucide-align-vertical-justify-start"] = "rbxassetid://10709761176",
			["lucide-align-vertical-space-around"] = "rbxassetid://10709761324",
			["lucide-align-vertical-space-between"] = "rbxassetid://10709761434",
			["lucide-anchor"] = "rbxassetid://10709761530",
			["lucide-angry"] = "rbxassetid://10709761629",
			["lucide-annoyed"] = "rbxassetid://10709761722",
			["lucide-aperture"] = "rbxassetid://10709761813",
			["lucide-apple"] = "rbxassetid://10709761889",
			["lucide-archive"] = "rbxassetid://10709762233",
			["lucide-archive-restore"] = "rbxassetid://10709762058",
			["lucide-armchair"] = "rbxassetid://10709762327",
			["lucide-arrow-big-down"] = "rbxassetid://10747796644",
			["lucide-arrow-big-left"] = "rbxassetid://10709762574",
			["lucide-arrow-big-right"] = "rbxassetid://10709762727",
			["lucide-arrow-big-up"] = "rbxassetid://10709762879",
			["lucide-arrow-down"] = "rbxassetid://10709767827",
			["lucide-arrow-down-circle"] = "rbxassetid://10709763034",
			["lucide-arrow-down-left"] = "rbxassetid://10709767656",
			["lucide-arrow-down-right"] = "rbxassetid://10709767750",
			["lucide-arrow-left"] = "rbxassetid://10709768114",
			["lucide-arrow-left-circle"] = "rbxassetid://10709767936",
			["lucide-arrow-left-right"] = "rbxassetid://10709768019",
			["lucide-arrow-right"] = "rbxassetid://10709768347",
			["lucide-arrow-right-circle"] = "rbxassetid://10709768226",
			["lucide-arrow-up"] = "rbxassetid://10709768939",
			["lucide-arrow-up-circle"] = "rbxassetid://10709768432",
			["lucide-arrow-up-down"] = "rbxassetid://10709768538",
			["lucide-arrow-up-left"] = "rbxassetid://10709768661",
			["lucide-arrow-up-right"] = "rbxassetid://10709768787",
			["lucide-asterisk"] = "rbxassetid://10709769095",
			["lucide-at-sign"] = "rbxassetid://10709769286",
			["lucide-award"] = "rbxassetid://10709769406",
			["lucide-axe"] = "rbxassetid://10709769508",
			["lucide-axis-3d"] = "rbxassetid://10709769598",
			["lucide-baby"] = "rbxassetid://10709769732",
			["lucide-backpack"] = "rbxassetid://10709769841",
			["lucide-baggage-claim"] = "rbxassetid://10709769935",
			["lucide-banana"] = "rbxassetid://10709770005",
			["lucide-banknote"] = "rbxassetid://10709770178",
			["lucide-bar-chart"] = "rbxassetid://10709773755",
			["lucide-bar-chart-2"] = "rbxassetid://10709770317",
			["lucide-bar-chart-3"] = "rbxassetid://10709770431",
			["lucide-bar-chart-4"] = "rbxassetid://10709770560",
			["lucide-bar-chart-horizontal"] = "rbxassetid://10709773669",
			["lucide-barcode"] = "rbxassetid://10747360675",
			["lucide-baseline"] = "rbxassetid://10709773863",
			["lucide-bath"] = "rbxassetid://10709773963",
			["lucide-battery"] = "rbxassetid://10709774640",
			["lucide-battery-charging"] = "rbxassetid://10709774068",
			["lucide-battery-full"] = "rbxassetid://10709774206",
			["lucide-battery-low"] = "rbxassetid://10709774370",
			["lucide-battery-medium"] = "rbxassetid://10709774513",
			["lucide-beaker"] = "rbxassetid://10709774756",
			["lucide-bed"] = "rbxassetid://10709775036",
			["lucide-bed-double"] = "rbxassetid://10709774864",
			["lucide-bed-single"] = "rbxassetid://10709774968",
			["lucide-beer"] = "rbxassetid://10709775167",
			["lucide-bell"] = "rbxassetid://10709775704",
			["lucide-bell-minus"] = "rbxassetid://10709775241",
			["lucide-bell-off"] = "rbxassetid://10709775320",
			["lucide-bell-plus"] = "rbxassetid://10709775448",
			["lucide-bell-ring"] = "rbxassetid://10709775560",
			["lucide-bike"] = "rbxassetid://10709775894",
			["lucide-binary"] = "rbxassetid://10709776050",
			["lucide-bitcoin"] = "rbxassetid://10709776126",
			["lucide-bluetooth"] = "rbxassetid://10709776655",
			["lucide-bluetooth-connected"] = "rbxassetid://10709776240",
			["lucide-bluetooth-off"] = "rbxassetid://10709776344",
			["lucide-bluetooth-searching"] = "rbxassetid://10709776501",
			["lucide-bold"] = "rbxassetid://10747813908",
			["lucide-bomb"] = "rbxassetid://10709781460",
			["lucide-bone"] = "rbxassetid://10709781605",
			["lucide-book"] = "rbxassetid://10709781824",
			["lucide-book-open"] = "rbxassetid://10709781717",
			["lucide-bookmark"] = "rbxassetid://10709782154",
			["lucide-bookmark-minus"] = "rbxassetid://10709781919",
			["lucide-bookmark-plus"] = "rbxassetid://10709782044",
			["lucide-bot"] = "rbxassetid://10709782230",
			["lucide-box"] = "rbxassetid://10709782497",
			["lucide-box-select"] = "rbxassetid://10709782342",
			["lucide-boxes"] = "rbxassetid://10709782582",
			["lucide-briefcase"] = "rbxassetid://10709782662",
			["lucide-brush"] = "rbxassetid://10709782758",
			["lucide-bug"] = "rbxassetid://10709782845",
			["lucide-building"] = "rbxassetid://10709783051",
			["lucide-building-2"] = "rbxassetid://10709782939",
			["lucide-bus"] = "rbxassetid://10709783137",
			["lucide-cake"] = "rbxassetid://10709783217",
			["lucide-calculator"] = "rbxassetid://10709783311",
			["lucide-calendar"] = "rbxassetid://10709789505",
			["lucide-calendar-check"] = "rbxassetid://10709783474",
			["lucide-calendar-check-2"] = "rbxassetid://10709783392",
			["lucide-calendar-clock"] = "rbxassetid://10709783577",
			["lucide-calendar-days"] = "rbxassetid://10709783673",
			["lucide-calendar-heart"] = "rbxassetid://10709783835",
			["lucide-calendar-minus"] = "rbxassetid://10709783959",
			["lucide-calendar-off"] = "rbxassetid://10709788784",
			["lucide-calendar-plus"] = "rbxassetid://10709788937",
			["lucide-calendar-range"] = "rbxassetid://10709789053",
			["lucide-calendar-search"] = "rbxassetid://10709789200",
			["lucide-calendar-x"] = "rbxassetid://10709789407",
			["lucide-calendar-x-2"] = "rbxassetid://10709789329",
			["lucide-camera"] = "rbxassetid://10709789686",
			["lucide-camera-off"] = "rbxassetid://10747822677",
			["lucide-car"] = "rbxassetid://10709789810",
			["lucide-carrot"] = "rbxassetid://10709789960",
			["lucide-cast"] = "rbxassetid://10709790097",
			["lucide-charge"] = "rbxassetid://10709790202",
			["lucide-check"] = "rbxassetid://10709790644",
			["lucide-check-circle"] = "rbxassetid://10709790387",
			["lucide-check-circle-2"] = "rbxassetid://10709790298",
			["lucide-check-square"] = "rbxassetid://10709790537",
			["lucide-chef-hat"] = "rbxassetid://10709790757",
			["lucide-cherry"] = "rbxassetid://10709790875",
			["lucide-chevron-down"] = "rbxassetid://10709790948",
			["lucide-chevron-first"] = "rbxassetid://10709791015",
			["lucide-chevron-last"] = "rbxassetid://10709791130",
			["lucide-chevron-left"] = "rbxassetid://10709791281",
			["lucide-chevron-right"] = "rbxassetid://10709791437",
			["lucide-chevron-up"] = "rbxassetid://10709791523",
			["lucide-chevrons-down"] = "rbxassetid://10709796864",
			["lucide-chevrons-down-up"] = "rbxassetid://10709791632",
			["lucide-chevrons-left"] = "rbxassetid://10709797151",
			["lucide-chevrons-left-right"] = "rbxassetid://10709797006",
			["lucide-chevrons-right"] = "rbxassetid://10709797382",
			["lucide-chevrons-right-left"] = "rbxassetid://10709797274",
			["lucide-chevrons-up"] = "rbxassetid://10709797622",
			["lucide-chevrons-up-down"] = "rbxassetid://10709797508",
			["lucide-chrome"] = "rbxassetid://10709797725",
			["lucide-circle"] = "rbxassetid://10709798174",
			["lucide-circle-dot"] = "rbxassetid://10709797837",
			["lucide-circle-ellipsis"] = "rbxassetid://10709797985",
			["lucide-circle-slashed"] = "rbxassetid://10709798100",
			["lucide-citrus"] = "rbxassetid://10709798276",
			["lucide-clapperboard"] = "rbxassetid://10709798350",
			["lucide-clipboard"] = "rbxassetid://10709799288",
			["lucide-clipboard-check"] = "rbxassetid://10709798443",
			["lucide-clipboard-copy"] = "rbxassetid://10709798574",
			["lucide-clipboard-edit"] = "rbxassetid://10709798682",
			["lucide-clipboard-list"] = "rbxassetid://10709798792",
			["lucide-clipboard-signature"] = "rbxassetid://10709798890",
			["lucide-clipboard-type"] = "rbxassetid://10709798999",
			["lucide-clipboard-x"] = "rbxassetid://10709799124",
			["lucide-clock"] = "rbxassetid://10709805144",
			["lucide-clock-1"] = "rbxassetid://10709799535",
			["lucide-clock-10"] = "rbxassetid://10709799718",
			["lucide-clock-11"] = "rbxassetid://10709799818",
			["lucide-clock-12"] = "rbxassetid://10709799962",
			["lucide-clock-2"] = "rbxassetid://10709803876",
			["lucide-clock-3"] = "rbxassetid://10709803989",
			["lucide-clock-4"] = "rbxassetid://10709804164",
			["lucide-clock-5"] = "rbxassetid://10709804291",
			["lucide-clock-6"] = "rbxassetid://10709804435",
			["lucide-clock-7"] = "rbxassetid://10709804599",
			["lucide-clock-8"] = "rbxassetid://10709804784",
			["lucide-clock-9"] = "rbxassetid://10709804996",
			["lucide-cloud"] = "rbxassetid://10709806740",
			["lucide-cloud-cog"] = "rbxassetid://10709805262",
			["lucide-cloud-drizzle"] = "rbxassetid://10709805371",
			["lucide-cloud-fog"] = "rbxassetid://10709805477",
			["lucide-cloud-hail"] = "rbxassetid://10709805596",
			["lucide-cloud-lightning"] = "rbxassetid://10709805727",
			["lucide-cloud-moon"] = "rbxassetid://10709805942",
			["lucide-cloud-moon-rain"] = "rbxassetid://10709805838",
			["lucide-cloud-off"] = "rbxassetid://10709806060",
			["lucide-cloud-rain"] = "rbxassetid://10709806277",
			["lucide-cloud-rain-wind"] = "rbxassetid://10709806166",
			["lucide-cloud-snow"] = "rbxassetid://10709806374",
			["lucide-cloud-sun"] = "rbxassetid://10709806631",
			["lucide-cloud-sun-rain"] = "rbxassetid://10709806475",
			["lucide-cloudy"] = "rbxassetid://10709806859",
			["lucide-clover"] = "rbxassetid://10709806995",
			["lucide-code"] = "rbxassetid://10709810463",
			["lucide-code-2"] = "rbxassetid://10709807111",
			["lucide-codepen"] = "rbxassetid://10709810534",
			["lucide-codesandbox"] = "rbxassetid://10709810676",
			["lucide-coffee"] = "rbxassetid://10709810814",
			["lucide-cog"] = "rbxassetid://10709810948",
			["lucide-coins"] = "rbxassetid://10709811110",
			["lucide-columns"] = "rbxassetid://10709811261",
			["lucide-command"] = "rbxassetid://10709811365",
			["lucide-compass"] = "rbxassetid://10709811445",
			["lucide-component"] = "rbxassetid://10709811595",
			["lucide-concierge-bell"] = "rbxassetid://10709811706",
			["lucide-connection"] = "rbxassetid://10747361219",
			["lucide-contact"] = "rbxassetid://10709811834",
			["lucide-contrast"] = "rbxassetid://10709811939",
			["lucide-cookie"] = "rbxassetid://10709812067",
			["lucide-copy"] = "rbxassetid://10709812159",
			["lucide-copyleft"] = "rbxassetid://10709812251",
			["lucide-copyright"] = "rbxassetid://10709812311",
			["lucide-corner-down-left"] = "rbxassetid://10709812396",
			["lucide-corner-down-right"] = "rbxassetid://10709812485",
			["lucide-corner-left-down"] = "rbxassetid://10709812632",
			["lucide-corner-left-up"] = "rbxassetid://10709812784",
			["lucide-corner-right-down"] = "rbxassetid://10709812939",
			["lucide-corner-right-up"] = "rbxassetid://10709813094",
			["lucide-corner-up-left"] = "rbxassetid://10709813185",
			["lucide-corner-up-right"] = "rbxassetid://10709813281",
			["lucide-cpu"] = "rbxassetid://10709813383",
			["lucide-croissant"] = "rbxassetid://10709818125",
			["lucide-crop"] = "rbxassetid://10709818245",
			["lucide-cross"] = "rbxassetid://10709818399",
			["lucide-crosshair"] = "rbxassetid://10709818534",
			["lucide-crown"] = "rbxassetid://10709818626",
			["lucide-cup-soda"] = "rbxassetid://10709818763",
			["lucide-curly-braces"] = "rbxassetid://10709818847",
			["lucide-currency"] = "rbxassetid://10709818931",
			["lucide-database"] = "rbxassetid://10709818996",
			["lucide-delete"] = "rbxassetid://10709819059",
			["lucide-diamond"] = "rbxassetid://10709819149",
			["lucide-dice-1"] = "rbxassetid://10709819266",
			["lucide-dice-2"] = "rbxassetid://10709819361",
			["lucide-dice-3"] = "rbxassetid://10709819508",
			["lucide-dice-4"] = "rbxassetid://10709819670",
			["lucide-dice-5"] = "rbxassetid://10709819801",
			["lucide-dice-6"] = "rbxassetid://10709819896",
			["lucide-dices"] = "rbxassetid://10723343321",
			["lucide-diff"] = "rbxassetid://10723343416",
			["lucide-disc"] = "rbxassetid://10723343537",
			["lucide-divide"] = "rbxassetid://10723343805",
			["lucide-divide-circle"] = "rbxassetid://10723343636",
			["lucide-divide-square"] = "rbxassetid://10723343737",
			["lucide-dollar-sign"] = "rbxassetid://10723343958",
			["lucide-download"] = "rbxassetid://10723344270",
			["lucide-download-cloud"] = "rbxassetid://10723344088",
			["lucide-droplet"] = "rbxassetid://10723344432",
			["lucide-droplets"] = "rbxassetid://10734883356",
			["lucide-drumstick"] = "rbxassetid://10723344737",
			["lucide-edit"] = "rbxassetid://10734883598",
			["lucide-edit-2"] = "rbxassetid://10723344885",
			["lucide-edit-3"] = "rbxassetid://10723345088",
			["lucide-egg"] = "rbxassetid://10723345518",
			["lucide-egg-fried"] = "rbxassetid://10723345347",
			["lucide-electricity"] = "rbxassetid://10723345749",
			["lucide-electricity-off"] = "rbxassetid://10723345643",
			["lucide-equal"] = "rbxassetid://10723345990",
			["lucide-equal-not"] = "rbxassetid://10723345866",
			["lucide-eraser"] = "rbxassetid://10723346158",
			["lucide-euro"] = "rbxassetid://10723346372",
			["lucide-expand"] = "rbxassetid://10723346553",
			["lucide-external-link"] = "rbxassetid://10723346684",
			["lucide-eye"] = "rbxassetid://10723346959",
			["lucide-eye-off"] = "rbxassetid://10723346871",
			["lucide-factory"] = "rbxassetid://10723347051",
			["lucide-fan"] = "rbxassetid://10723354359",
			["lucide-fast-forward"] = "rbxassetid://10723354521",
			["lucide-feather"] = "rbxassetid://10723354671",
			["lucide-figma"] = "rbxassetid://10723354801",
			["lucide-file"] = "rbxassetid://10723374641",
			["lucide-file-archive"] = "rbxassetid://10723354921",
			["lucide-file-audio"] = "rbxassetid://10723355148",
			["lucide-file-audio-2"] = "rbxassetid://10723355026",
			["lucide-file-axis-3d"] = "rbxassetid://10723355272",
			["lucide-file-badge"] = "rbxassetid://10723355622",
			["lucide-file-badge-2"] = "rbxassetid://10723355451",
			["lucide-file-bar-chart"] = "rbxassetid://10723355887",
			["lucide-file-bar-chart-2"] = "rbxassetid://10723355746",
			["lucide-file-box"] = "rbxassetid://10723355989",
			["lucide-file-check"] = "rbxassetid://10723356210",
			["lucide-file-check-2"] = "rbxassetid://10723356100",
			["lucide-file-clock"] = "rbxassetid://10723356329",
			["lucide-file-code"] = "rbxassetid://10723356507",
			["lucide-file-cog"] = "rbxassetid://10723356830",
			["lucide-file-cog-2"] = "rbxassetid://10723356676",
			["lucide-file-diff"] = "rbxassetid://10723357039",
			["lucide-file-digit"] = "rbxassetid://10723357151",
			["lucide-file-down"] = "rbxassetid://10723357322",
			["lucide-file-edit"] = "rbxassetid://10723357495",
			["lucide-file-heart"] = "rbxassetid://10723357637",
			["lucide-file-image"] = "rbxassetid://10723357790",
			["lucide-file-input"] = "rbxassetid://10723357933",
			["lucide-file-json"] = "rbxassetid://10723364435",
			["lucide-file-json-2"] = "rbxassetid://10723364361",
			["lucide-file-key"] = "rbxassetid://10723364605",
			["lucide-file-key-2"] = "rbxassetid://10723364515",
			["lucide-file-line-chart"] = "rbxassetid://10723364725",
			["lucide-file-lock"] = "rbxassetid://10723364957",
			["lucide-file-lock-2"] = "rbxassetid://10723364861",
			["lucide-file-minus"] = "rbxassetid://10723365254",
			["lucide-file-minus-2"] = "rbxassetid://10723365086",
			["lucide-file-output"] = "rbxassetid://10723365457",
			["lucide-file-pie-chart"] = "rbxassetid://10723365598",
			["lucide-file-plus"] = "rbxassetid://10723365877",
			["lucide-file-plus-2"] = "rbxassetid://10723365766",
			["lucide-file-question"] = "rbxassetid://10723365987",
			["lucide-file-scan"] = "rbxassetid://10723366167",
			["lucide-file-search"] = "rbxassetid://10723366550",
			["lucide-file-search-2"] = "rbxassetid://10723366340",
			["lucide-file-signature"] = "rbxassetid://10723366741",
			["lucide-file-spreadsheet"] = "rbxassetid://10723366962",
			["lucide-file-symlink"] = "rbxassetid://10723367098",
			["lucide-file-terminal"] = "rbxassetid://10723367244",
			["lucide-file-text"] = "rbxassetid://10723367380",
			["lucide-file-type"] = "rbxassetid://10723367606",
			["lucide-file-type-2"] = "rbxassetid://10723367509",
			["lucide-file-up"] = "rbxassetid://10723367734",
			["lucide-file-video"] = "rbxassetid://10723373884",
			["lucide-file-video-2"] = "rbxassetid://10723367834",
			["lucide-file-volume"] = "rbxassetid://10723374172",
			["lucide-file-volume-2"] = "rbxassetid://10723374030",
			["lucide-file-warning"] = "rbxassetid://10723374276",
			["lucide-file-x"] = "rbxassetid://10723374544",
			["lucide-file-x-2"] = "rbxassetid://10723374378",
			["lucide-files"] = "rbxassetid://10723374759",
			["lucide-film"] = "rbxassetid://10723374981",
			["lucide-filter"] = "rbxassetid://10723375128",
			["lucide-fingerprint"] = "rbxassetid://10723375250",
			["lucide-flag"] = "rbxassetid://10723375890",
			["lucide-flag-off"] = "rbxassetid://10723375443",
			["lucide-flag-triangle-left"] = "rbxassetid://10723375608",
			["lucide-flag-triangle-right"] = "rbxassetid://10723375727",
			["lucide-flame"] = "rbxassetid://10723376114",
			["lucide-flashlight"] = "rbxassetid://10723376471",
			["lucide-flashlight-off"] = "rbxassetid://10723376365",
			["lucide-flask-conical"] = "rbxassetid://10734883986",
			["lucide-flask-round"] = "rbxassetid://10723376614",
			["lucide-flip-horizontal"] = "rbxassetid://10723376884",
			["lucide-flip-horizontal-2"] = "rbxassetid://10723376745",
			["lucide-flip-vertical"] = "rbxassetid://10723377138",
			["lucide-flip-vertical-2"] = "rbxassetid://10723377026",
			["lucide-flower"] = "rbxassetid://10747830374",
			["lucide-flower-2"] = "rbxassetid://10723377305",
			["lucide-focus"] = "rbxassetid://10723377537",
			["lucide-folder"] = "rbxassetid://10723387563",
			["lucide-folder-archive"] = "rbxassetid://10723384478",
			["lucide-folder-check"] = "rbxassetid://10723384605",
			["lucide-folder-clock"] = "rbxassetid://10723384731",
			["lucide-folder-closed"] = "rbxassetid://10723384893",
			["lucide-folder-cog"] = "rbxassetid://10723385213",
			["lucide-folder-cog-2"] = "rbxassetid://10723385036",
			["lucide-folder-down"] = "rbxassetid://10723385338",
			["lucide-folder-edit"] = "rbxassetid://10723385445",
			["lucide-folder-heart"] = "rbxassetid://10723385545",
			["lucide-folder-input"] = "rbxassetid://10723385721",
			["lucide-folder-key"] = "rbxassetid://10723385848",
			["lucide-folder-lock"] = "rbxassetid://10723386005",
			["lucide-folder-minus"] = "rbxassetid://10723386127",
			["lucide-folder-open"] = "rbxassetid://10723386277",
			["lucide-folder-output"] = "rbxassetid://10723386386",
			["lucide-folder-plus"] = "rbxassetid://10723386531",
			["lucide-folder-search"] = "rbxassetid://10723386787",
			["lucide-folder-search-2"] = "rbxassetid://10723386674",
			["lucide-folder-symlink"] = "rbxassetid://10723386930",
			["lucide-folder-tree"] = "rbxassetid://10723387085",
			["lucide-folder-up"] = "rbxassetid://10723387265",
			["lucide-folder-x"] = "rbxassetid://10723387448",
			["lucide-folders"] = "rbxassetid://10723387721",
			["lucide-form-input"] = "rbxassetid://10723387841",
			["lucide-forward"] = "rbxassetid://10723388016",
			["lucide-frame"] = "rbxassetid://10723394389",
			["lucide-framer"] = "rbxassetid://10723394565",
			["lucide-frown"] = "rbxassetid://10723394681",
			["lucide-fuel"] = "rbxassetid://10723394846",
			["lucide-function-square"] = "rbxassetid://10723395041",
			["lucide-gamepad"] = "rbxassetid://10723395457",
			["lucide-gamepad-2"] = "rbxassetid://10723395215",
			["lucide-gauge"] = "rbxassetid://10723395708",
			["lucide-gavel"] = "rbxassetid://10723395896",
			["lucide-gem"] = "rbxassetid://10723396000",
			["lucide-ghost"] = "rbxassetid://10723396107",
			["lucide-gift"] = "rbxassetid://10723396402",
			["lucide-gift-card"] = "rbxassetid://10723396225",
			["lucide-git-branch"] = "rbxassetid://10723396676",
			["lucide-git-branch-plus"] = "rbxassetid://10723396542",
			["lucide-git-commit"] = "rbxassetid://10723396812",
			["lucide-git-compare"] = "rbxassetid://10723396954",
			["lucide-git-fork"] = "rbxassetid://10723397049",
			["lucide-git-merge"] = "rbxassetid://10723397165",
			["lucide-git-pull-request"] = "rbxassetid://10723397431",
			["lucide-git-pull-request-closed"] = "rbxassetid://10723397268",
			["lucide-git-pull-request-draft"] = "rbxassetid://10734884302",
			["lucide-glass"] = "rbxassetid://10723397788",
			["lucide-glass-2"] = "rbxassetid://10723397529",
			["lucide-glass-water"] = "rbxassetid://10723397678",
			["lucide-glasses"] = "rbxassetid://10723397895",
			["lucide-globe"] = "rbxassetid://10723404337",
			["lucide-globe-2"] = "rbxassetid://10723398002",
			["lucide-grab"] = "rbxassetid://10723404472",
			["lucide-graduation-cap"] = "rbxassetid://10723404691",
			["lucide-grape"] = "rbxassetid://10723404822",
			["lucide-grid"] = "rbxassetid://10723404936",
			["lucide-grip-horizontal"] = "rbxassetid://10723405089",
			["lucide-grip-vertical"] = "rbxassetid://10723405236",
			["lucide-hammer"] = "rbxassetid://10723405360",
			["lucide-hand"] = "rbxassetid://10723405649",
			["lucide-hand-metal"] = "rbxassetid://10723405508",
			["lucide-hard-drive"] = "rbxassetid://10723405749",
			["lucide-hard-hat"] = "rbxassetid://10723405859",
			["lucide-hash"] = "rbxassetid://10723405975",
			["lucide-haze"] = "rbxassetid://10723406078",
			["lucide-headphones"] = "rbxassetid://10723406165",
			["lucide-heart"] = "rbxassetid://10723406885",
			["lucide-heart-crack"] = "rbxassetid://10723406299",
			["lucide-heart-handshake"] = "rbxassetid://10723406480",
			["lucide-heart-off"] = "rbxassetid://10723406662",
			["lucide-heart-pulse"] = "rbxassetid://10723406795",
			["lucide-help-circle"] = "rbxassetid://10723406988",
			["lucide-hexagon"] = "rbxassetid://10723407092",
			["lucide-highlighter"] = "rbxassetid://10723407192",
			["lucide-history"] = "rbxassetid://10723407335",
			["lucide-home"] = "rbxassetid://10723407389",
			["lucide-hourglass"] = "rbxassetid://10723407498",
			["lucide-ice-cream"] = "rbxassetid://10723414308",
			["lucide-image"] = "rbxassetid://10723415040",
			["lucide-image-minus"] = "rbxassetid://10723414487",
			["lucide-image-off"] = "rbxassetid://10723414677",
			["lucide-image-plus"] = "rbxassetid://10723414827",
			["lucide-import"] = "rbxassetid://10723415205",
			["lucide-inbox"] = "rbxassetid://10723415335",
			["lucide-indent"] = "rbxassetid://10723415494",
			["lucide-indian-rupee"] = "rbxassetid://10723415642",
			["lucide-infinity"] = "rbxassetid://10723415766",
			["lucide-info"] = "rbxassetid://10723415903",
			["lucide-inspect"] = "rbxassetid://10723416057",
			["lucide-italic"] = "rbxassetid://10723416195",
			["lucide-japanese-yen"] = "rbxassetid://10723416363",
			["lucide-joystick"] = "rbxassetid://10723416527",
			["lucide-key"] = "rbxassetid://10723416652",
			["lucide-keyboard"] = "rbxassetid://10723416765",
			["lucide-lamp"] = "rbxassetid://10723417513",
			["lucide-lamp-ceiling"] = "rbxassetid://10723416922",
			["lucide-lamp-desk"] = "rbxassetid://10723417016",
			["lucide-lamp-floor"] = "rbxassetid://10723417131",
			["lucide-lamp-wall-down"] = "rbxassetid://10723417240",
			["lucide-lamp-wall-up"] = "rbxassetid://10723417356",
			["lucide-landmark"] = "rbxassetid://10723417608",
			["lucide-languages"] = "rbxassetid://10723417703",
			["lucide-laptop"] = "rbxassetid://10723423881",
			["lucide-laptop-2"] = "rbxassetid://10723417797",
			["lucide-lasso"] = "rbxassetid://10723424235",
			["lucide-lasso-select"] = "rbxassetid://10723424058",
			["lucide-laugh"] = "rbxassetid://10723424372",
			["lucide-layers"] = "rbxassetid://10723424505",
			["lucide-layout"] = "rbxassetid://10723425376",
			["lucide-layout-dashboard"] = "rbxassetid://10723424646",
			["lucide-layout-grid"] = "rbxassetid://10723424838",
			["lucide-layout-list"] = "rbxassetid://10723424963",
			["lucide-layout-template"] = "rbxassetid://10723425187",
			["lucide-leaf"] = "rbxassetid://10723425539",
			["lucide-library"] = "rbxassetid://10723425615",
			["lucide-life-buoy"] = "rbxassetid://10723425685",
			["lucide-lightbulb"] = "rbxassetid://10723425852",
			["lucide-lightbulb-off"] = "rbxassetid://10723425762",
			["lucide-line-chart"] = "rbxassetid://10723426393",
			["lucide-link"] = "rbxassetid://10723426722",
			["lucide-link-2"] = "rbxassetid://10723426595",
			["lucide-link-2-off"] = "rbxassetid://10723426513",
			["lucide-list"] = "rbxassetid://10723433811",
			["lucide-list-checks"] = "rbxassetid://10734884548",
			["lucide-list-end"] = "rbxassetid://10723426886",
			["lucide-list-minus"] = "rbxassetid://10723426986",
			["lucide-list-music"] = "rbxassetid://10723427081",
			["lucide-list-ordered"] = "rbxassetid://10723427199",
			["lucide-list-plus"] = "rbxassetid://10723427334",
			["lucide-list-start"] = "rbxassetid://10723427494",
			["lucide-list-video"] = "rbxassetid://10723427619",
			["lucide-list-x"] = "rbxassetid://10723433655",
			["lucide-loader"] = "rbxassetid://10723434070",
			["lucide-loader-2"] = "rbxassetid://10723433935",
			["lucide-locate"] = "rbxassetid://10723434557",
			["lucide-locate-fixed"] = "rbxassetid://10723434236",
			["lucide-locate-off"] = "rbxassetid://10723434379",
			["lucide-lock"] = "rbxassetid://10723434711",
			["lucide-log-in"] = "rbxassetid://10723434830",
			["lucide-log-out"] = "rbxassetid://10723434906",
			["lucide-luggage"] = "rbxassetid://10723434993",
			["lucide-magnet"] = "rbxassetid://10723435069",
			["lucide-mail"] = "rbxassetid://10734885430",
			["lucide-mail-check"] = "rbxassetid://10723435182",
			["lucide-mail-minus"] = "rbxassetid://10723435261",
			["lucide-mail-open"] = "rbxassetid://10723435342",
			["lucide-mail-plus"] = "rbxassetid://10723435443",
			["lucide-mail-question"] = "rbxassetid://10723435515",
			["lucide-mail-search"] = "rbxassetid://10734884739",
			["lucide-mail-warning"] = "rbxassetid://10734885015",
			["lucide-mail-x"] = "rbxassetid://10734885247",
			["lucide-mails"] = "rbxassetid://10734885614",
			["lucide-map"] = "rbxassetid://10734886202",
			["lucide-map-pin"] = "rbxassetid://10734886004",
			["lucide-map-pin-off"] = "rbxassetid://10734885803",
			["lucide-maximize"] = "rbxassetid://10734886735",
			["lucide-maximize-2"] = "rbxassetid://10734886496",
			["lucide-medal"] = "rbxassetid://10734887072",
			["lucide-megaphone"] = "rbxassetid://10734887454",
			["lucide-megaphone-off"] = "rbxassetid://10734887311",
			["lucide-meh"] = "rbxassetid://10734887603",
			["lucide-menu"] = "rbxassetid://10734887784",
			["lucide-message-circle"] = "rbxassetid://10734888000",
			["lucide-message-square"] = "rbxassetid://10734888228",
			["lucide-mic"] = "rbxassetid://10734888864",
			["lucide-mic-2"] = "rbxassetid://10734888430",
			["lucide-mic-off"] = "rbxassetid://10734888646",
			["lucide-microscope"] = "rbxassetid://10734889106",
			["lucide-microwave"] = "rbxassetid://10734895076",
			["lucide-milestone"] = "rbxassetid://10734895310",
			["lucide-minimize"] = "rbxassetid://10734895698",
			["lucide-minimize-2"] = "rbxassetid://10734895530",
			["lucide-minus"] = "rbxassetid://10734896206",
			["lucide-minus-circle"] = "rbxassetid://10734895856",
			["lucide-minus-square"] = "rbxassetid://10734896029",
			["lucide-monitor"] = "rbxassetid://10734896881",
			["lucide-monitor-off"] = "rbxassetid://10734896360",
			["lucide-monitor-speaker"] = "rbxassetid://10734896512",
			["lucide-moon"] = "rbxassetid://10734897102",
			["lucide-more-horizontal"] = "rbxassetid://10734897250",
			["lucide-more-vertical"] = "rbxassetid://10734897387",
			["lucide-mountain"] = "rbxassetid://10734897956",
			["lucide-mountain-snow"] = "rbxassetid://10734897665",
			["lucide-mouse"] = "rbxassetid://10734898592",
			["lucide-mouse-pointer"] = "rbxassetid://10734898476",
			["lucide-mouse-pointer-2"] = "rbxassetid://10734898194",
			["lucide-mouse-pointer-click"] = "rbxassetid://10734898355",
			["lucide-move"] = "rbxassetid://10734900011",
			["lucide-move-3d"] = "rbxassetid://10734898756",
			["lucide-move-diagonal"] = "rbxassetid://10734899164",
			["lucide-move-diagonal-2"] = "rbxassetid://10734898934",
			["lucide-move-horizontal"] = "rbxassetid://10734899414",
			["lucide-move-vertical"] = "rbxassetid://10734899821",
			["lucide-music"] = "rbxassetid://10734905958",
			["lucide-music-2"] = "rbxassetid://10734900215",
			["lucide-music-3"] = "rbxassetid://10734905665",
			["lucide-music-4"] = "rbxassetid://10734905823",
			["lucide-navigation"] = "rbxassetid://10734906744",
			["lucide-navigation-2"] = "rbxassetid://10734906332",
			["lucide-navigation-2-off"] = "rbxassetid://10734906144",
			["lucide-navigation-off"] = "rbxassetid://10734906580",
			["lucide-network"] = "rbxassetid://10734906975",
			["lucide-newspaper"] = "rbxassetid://10734907168",
			["lucide-octagon"] = "rbxassetid://10734907361",
			["lucide-option"] = "rbxassetid://10734907649",
			["lucide-outdent"] = "rbxassetid://10734907933",
			["lucide-package"] = "rbxassetid://10734909540",
			["lucide-package-2"] = "rbxassetid://10734908151",
			["lucide-package-check"] = "rbxassetid://10734908384",
			["lucide-package-minus"] = "rbxassetid://10734908626",
			["lucide-package-open"] = "rbxassetid://10734908793",
			["lucide-package-plus"] = "rbxassetid://10734909016",
			["lucide-package-search"] = "rbxassetid://10734909196",
			["lucide-package-x"] = "rbxassetid://10734909375",
			["lucide-paint-bucket"] = "rbxassetid://10734909847",
			["lucide-paintbrush"] = "rbxassetid://10734910187",
			["lucide-paintbrush-2"] = "rbxassetid://10734910030",
			["lucide-palette"] = "rbxassetid://10734910430",
			["lucide-palmtree"] = "rbxassetid://10734910680",
			["lucide-paperclip"] = "rbxassetid://10734910927",
			["lucide-party-popper"] = "rbxassetid://10734918735",
			["lucide-pause"] = "rbxassetid://10734919336",
			["lucide-pause-circle"] = "rbxassetid://10735024209",
			["lucide-pause-octagon"] = "rbxassetid://10734919143",
			["lucide-pen-tool"] = "rbxassetid://10734919503",
			["lucide-pencil"] = "rbxassetid://10734919691",
			["lucide-percent"] = "rbxassetid://10734919919",
			["lucide-person-standing"] = "rbxassetid://10734920149",
			["lucide-phone"] = "rbxassetid://10734921524",
			["lucide-phone-call"] = "rbxassetid://10734920305",
			["lucide-phone-forwarded"] = "rbxassetid://10734920508",
			["lucide-phone-incoming"] = "rbxassetid://10734920694",
			["lucide-phone-missed"] = "rbxassetid://10734920845",
			["lucide-phone-off"] = "rbxassetid://10734921077",
			["lucide-phone-outgoing"] = "rbxassetid://10734921288",
			["lucide-pie-chart"] = "rbxassetid://10734921727",
			["lucide-piggy-bank"] = "rbxassetid://10734921935",
			["lucide-pin"] = "rbxassetid://10734922324",
			["lucide-pin-off"] = "rbxassetid://10734922180",
			["lucide-pipette"] = "rbxassetid://10734922497",
			["lucide-pizza"] = "rbxassetid://10734922774",
			["lucide-plane"] = "rbxassetid://10734922971",
			["lucide-play"] = "rbxassetid://10734923549",
			["lucide-play-circle"] = "rbxassetid://10734923214",
			["lucide-plus"] = "rbxassetid://10734924532",
			["lucide-plus-circle"] = "rbxassetid://10734923868",
			["lucide-plus-square"] = "rbxassetid://10734924219",
			["lucide-podcast"] = "rbxassetid://10734929553",
			["lucide-pointer"] = "rbxassetid://10734929723",
			["lucide-pound-sterling"] = "rbxassetid://10734929981",
			["lucide-power"] = "rbxassetid://10734930466",
			["lucide-power-off"] = "rbxassetid://10734930257",
			["lucide-printer"] = "rbxassetid://10734930632",
			["lucide-puzzle"] = "rbxassetid://10734930886",
			["lucide-quote"] = "rbxassetid://10734931234",
			["lucide-radio"] = "rbxassetid://10734931596",
			["lucide-radio-receiver"] = "rbxassetid://10734931402",
			["lucide-rectangle-horizontal"] = "rbxassetid://10734931777",
			["lucide-rectangle-vertical"] = "rbxassetid://10734932081",
			["lucide-recycle"] = "rbxassetid://10734932295",
			["lucide-redo"] = "rbxassetid://10734932822",
			["lucide-redo-2"] = "rbxassetid://10734932586",
			["lucide-refresh-ccw"] = "rbxassetid://10734933056",
			["lucide-refresh-cw"] = "rbxassetid://10734933222",
			["lucide-refrigerator"] = "rbxassetid://10734933465",
			["lucide-regex"] = "rbxassetid://10734933655",
			["lucide-repeat"] = "rbxassetid://10734933966",
			["lucide-repeat-1"] = "rbxassetid://10734933826",
			["lucide-reply"] = "rbxassetid://10734934252",
			["lucide-reply-all"] = "rbxassetid://10734934132",
			["lucide-rewind"] = "rbxassetid://10734934347",
			["lucide-rocket"] = "rbxassetid://10734934585",
			["lucide-rocking-chair"] = "rbxassetid://10734939942",
			["lucide-rotate-3d"] = "rbxassetid://10734940107",
			["lucide-rotate-ccw"] = "rbxassetid://10734940376",
			["lucide-rotate-cw"] = "rbxassetid://10734940654",
			["lucide-rss"] = "rbxassetid://10734940825",
			["lucide-ruler"] = "rbxassetid://10734941018",
			["lucide-russian-ruble"] = "rbxassetid://10734941199",
			["lucide-sailboat"] = "rbxassetid://10734941354",
			["lucide-save"] = "rbxassetid://10734941499",
			["lucide-scale"] = "rbxassetid://10734941912",
			["lucide-scale-3d"] = "rbxassetid://10734941739",
			["lucide-scaling"] = "rbxassetid://10734942072",
			["lucide-scan"] = "rbxassetid://10734942565",
			["lucide-scan-face"] = "rbxassetid://10734942198",
			["lucide-scan-line"] = "rbxassetid://10734942351",
			["lucide-scissors"] = "rbxassetid://10734942778",
			["lucide-screen-share"] = "rbxassetid://10734943193",
			["lucide-screen-share-off"] = "rbxassetid://10734942967",
			["lucide-scroll"] = "rbxassetid://10734943448",
			["lucide-search"] = "rbxassetid://10734943674",
			["lucide-send"] = "rbxassetid://10734943902",
			["lucide-separator-horizontal"] = "rbxassetid://10734944115",
			["lucide-separator-vertical"] = "rbxassetid://10734944326",
			["lucide-server"] = "rbxassetid://10734949856",
			["lucide-server-cog"] = "rbxassetid://10734944444",
			["lucide-server-crash"] = "rbxassetid://10734944554",
			["lucide-server-off"] = "rbxassetid://10734944668",
			["lucide-settings"] = "rbxassetid://10734950309",
			["lucide-settings-2"] = "rbxassetid://10734950020",
			["lucide-share"] = "rbxassetid://10734950813",
			["lucide-share-2"] = "rbxassetid://10734950553",
			["lucide-sheet"] = "rbxassetid://10734951038",
			["lucide-shield"] = "rbxassetid://10734951847",
			["lucide-shield-alert"] = "rbxassetid://10734951173",
			["lucide-shield-check"] = "rbxassetid://10734951367",
			["lucide-shield-close"] = "rbxassetid://10734951535",
			["lucide-shield-off"] = "rbxassetid://10734951684",
			["lucide-shirt"] = "rbxassetid://10734952036",
			["lucide-shopping-bag"] = "rbxassetid://10734952273",
			["lucide-shopping-cart"] = "rbxassetid://10734952479",
			["lucide-shovel"] = "rbxassetid://10734952773",
			["lucide-shower-head"] = "rbxassetid://10734952942",
			["lucide-shrink"] = "rbxassetid://10734953073",
			["lucide-shrub"] = "rbxassetid://10734953241",
			["lucide-shuffle"] = "rbxassetid://10734953451",
			["lucide-sidebar"] = "rbxassetid://10734954301",
			["lucide-sidebar-close"] = "rbxassetid://10734953715",
			["lucide-sidebar-open"] = "rbxassetid://10734954000",
			["lucide-sigma"] = "rbxassetid://10734954538",
			["lucide-signal"] = "rbxassetid://10734961133",
			["lucide-signal-high"] = "rbxassetid://10734954807",
			["lucide-signal-low"] = "rbxassetid://10734955080",
			["lucide-signal-medium"] = "rbxassetid://10734955336",
			["lucide-signal-zero"] = "rbxassetid://10734960878",
			["lucide-siren"] = "rbxassetid://10734961284",
			["lucide-skip-back"] = "rbxassetid://10734961526",
			["lucide-skip-forward"] = "rbxassetid://10734961809",
			["lucide-skull"] = "rbxassetid://10734962068",
			["lucide-slack"] = "rbxassetid://10734962339",
			["lucide-slash"] = "rbxassetid://10734962600",
			["lucide-slice"] = "rbxassetid://10734963024",
			["lucide-sliders"] = "rbxassetid://10734963400",
			["lucide-sliders-horizontal"] = "rbxassetid://10734963191",
			["lucide-smartphone"] = "rbxassetid://10734963940",
			["lucide-smartphone-charging"] = "rbxassetid://10734963671",
			["lucide-smile"] = "rbxassetid://10734964441",
			["lucide-smile-plus"] = "rbxassetid://10734964188",
			["lucide-snowflake"] = "rbxassetid://10734964600",
			["lucide-sofa"] = "rbxassetid://10734964852",
			["lucide-sort-asc"] = "rbxassetid://10734965115",
			["lucide-sort-desc"] = "rbxassetid://10734965287",
			["lucide-speaker"] = "rbxassetid://10734965419",
			["lucide-sprout"] = "rbxassetid://10734965572",
			["lucide-square"] = "rbxassetid://10734965702",
			["lucide-star"] = "rbxassetid://10734966248",
			["lucide-star-half"] = "rbxassetid://10734965897",
			["lucide-star-off"] = "rbxassetid://10734966097",
			["lucide-stethoscope"] = "rbxassetid://10734966384",
			["lucide-sticker"] = "rbxassetid://10734972234",
			["lucide-sticky-note"] = "rbxassetid://10734972463",
			["lucide-stop-circle"] = "rbxassetid://10734972621",
			["lucide-stretch-horizontal"] = "rbxassetid://10734972862",
			["lucide-stretch-vertical"] = "rbxassetid://10734973130",
			["lucide-strikethrough"] = "rbxassetid://10734973290",
			["lucide-subscript"] = "rbxassetid://10734973457",
			["lucide-sun"] = "rbxassetid://10734974297",
			["lucide-sun-dim"] = "rbxassetid://10734973645",
			["lucide-sun-medium"] = "rbxassetid://10734973778",
			["lucide-sun-moon"] = "rbxassetid://10734973999",
			["lucide-sun-snow"] = "rbxassetid://10734974130",
			["lucide-sunrise"] = "rbxassetid://10734974522",
			["lucide-sunset"] = "rbxassetid://10734974689",
			["lucide-superscript"] = "rbxassetid://10734974850",
			["lucide-swiss-franc"] = "rbxassetid://10734975024",
			["lucide-switch-camera"] = "rbxassetid://10734975214",
			["lucide-sword"] = "rbxassetid://10734975486",
			["lucide-swords"] = "rbxassetid://10734975692",
			["lucide-syringe"] = "rbxassetid://10734975932",
			["lucide-table"] = "rbxassetid://10734976230",
			["lucide-table-2"] = "rbxassetid://10734976097",
			["lucide-tablet"] = "rbxassetid://10734976394",
			["lucide-tag"] = "rbxassetid://10734976528",
			["lucide-tags"] = "rbxassetid://10734976739",
			["lucide-target"] = "rbxassetid://10734977012",
			["lucide-tent"] = "rbxassetid://10734981750",
			["lucide-terminal"] = "rbxassetid://10734982144",
			["lucide-terminal-square"] = "rbxassetid://10734981995",
			["lucide-text-cursor"] = "rbxassetid://10734982395",
			["lucide-text-cursor-input"] = "rbxassetid://10734982297",
			["lucide-thermometer"] = "rbxassetid://10734983134",
			["lucide-thermometer-snowflake"] = "rbxassetid://10734982571",
			["lucide-thermometer-sun"] = "rbxassetid://10734982771",
			["lucide-thumbs-down"] = "rbxassetid://10734983359",
			["lucide-thumbs-up"] = "rbxassetid://10734983629",
			["lucide-ticket"] = "rbxassetid://10734983868",
			["lucide-timer"] = "rbxassetid://10734984606",
			["lucide-timer-off"] = "rbxassetid://10734984138",
			["lucide-timer-reset"] = "rbxassetid://10734984355",
			["lucide-toggle-left"] = "rbxassetid://10734984834",
			["lucide-toggle-right"] = "rbxassetid://10734985040",
			["lucide-tornado"] = "rbxassetid://10734985247",
			["lucide-toy-brick"] = "rbxassetid://10747361919",
			["lucide-train"] = "rbxassetid://10747362105",
			["lucide-trash"] = "rbxassetid://10747362393",
			["lucide-trash-2"] = "rbxassetid://10747362241",
			["lucide-tree-deciduous"] = "rbxassetid://10747362534",
			["lucide-tree-pine"] = "rbxassetid://10747362748",
			["lucide-trees"] = "rbxassetid://10747363016",
			["lucide-trending-down"] = "rbxassetid://10747363205",
			["lucide-trending-up"] = "rbxassetid://10747363465",
			["lucide-triangle"] = "rbxassetid://10747363621",
			["lucide-trophy"] = "rbxassetid://10747363809",
			["lucide-truck"] = "rbxassetid://10747364031",
			["lucide-tv"] = "rbxassetid://10747364593",
			["lucide-tv-2"] = "rbxassetid://10747364302",
			["lucide-type"] = "rbxassetid://10747364761",
			["lucide-umbrella"] = "rbxassetid://10747364971",
			["lucide-underline"] = "rbxassetid://10747365191",
			["lucide-undo"] = "rbxassetid://10747365484",
			["lucide-undo-2"] = "rbxassetid://10747365359",
			["lucide-unlink"] = "rbxassetid://10747365771",
			["lucide-unlink-2"] = "rbxassetid://10747397871",
			["lucide-unlock"] = "rbxassetid://10747366027",
			["lucide-upload"] = "rbxassetid://10747366434",
			["lucide-upload-cloud"] = "rbxassetid://10747366266",
			["lucide-usb"] = "rbxassetid://10747366606",
			["lucide-user"] = "rbxassetid://10747373176",
			["lucide-user-check"] = "rbxassetid://10747371901",
			["lucide-user-cog"] = "rbxassetid://10747372167",
			["lucide-user-minus"] = "rbxassetid://10747372346",
			["lucide-user-plus"] = "rbxassetid://10747372702",
			["lucide-user-x"] = "rbxassetid://10747372992",
			["lucide-users"] = "rbxassetid://10747373426",
			["lucide-utensils"] = "rbxassetid://10747373821",
			["lucide-utensils-crossed"] = "rbxassetid://10747373629",
			["lucide-venetian-mask"] = "rbxassetid://10747374003",
			["lucide-verified"] = "rbxassetid://10747374131",
			["lucide-vibrate"] = "rbxassetid://10747374489",
			["lucide-vibrate-off"] = "rbxassetid://10747374269",
			["lucide-video"] = "rbxassetid://10747374938",
			["lucide-video-off"] = "rbxassetid://10747374721",
			["lucide-view"] = "rbxassetid://10747375132",
			["lucide-voicemail"] = "rbxassetid://10747375281",
			["lucide-volume"] = "rbxassetid://10747376008",
			["lucide-volume-1"] = "rbxassetid://10747375450",
			["lucide-volume-2"] = "rbxassetid://10747375679",
			["lucide-volume-x"] = "rbxassetid://10747375880",
			["lucide-wallet"] = "rbxassetid://10747376205",
			["lucide-wand"] = "rbxassetid://10747376565",
			["lucide-wand-2"] = "rbxassetid://10747376349",
			["lucide-watch"] = "rbxassetid://10747376722",
			["lucide-waves"] = "rbxassetid://10747376931",
			["lucide-webcam"] = "rbxassetid://10747381992",
			["lucide-wifi"] = "rbxassetid://10747382504",
			["lucide-wifi-off"] = "rbxassetid://10747382268",
			["lucide-wind"] = "rbxassetid://10747382750",
			["lucide-wrap-text"] = "rbxassetid://10747383065",
			["lucide-wrench"] = "rbxassetid://10747383470",
			["lucide-x"] = "rbxassetid://10747384394",
			["lucide-x-circle"] = "rbxassetid://10747383819",
			["lucide-x-octagon"] = "rbxassetid://10747384037",
			["lucide-x-square"] = "rbxassetid://10747384217",
			["lucide-zoom-in"] = "rbxassetid://10747384552",
			["lucide-zoom-out"] = "rbxassetid://10747384679",
		},
	}
end

local assets = fn().assets

local tbl2 = {
	white = Color3.new(1, 1, 1),
	black = Color3.new(0, 0, 0),
	sub = Color3.fromRGB(176, 176, 182),
	gray = Color3.fromRGB(150, 150, 156),
	knob = Color3.fromRGB(69, 69, 72),
	window = Color3.fromRGB(32, 32, 36),
	gold = Color3.fromRGB(240, 200, 80),
	inter = "rbxasset://fonts/families/Inter.json",
	builder = "rbxasset://fonts/families/BuilderSans.json",
	montserrat = "rbxasset://fonts/families/Montserrat.json",
	gotham = "rbxasset://fonts/families/GothamSSm.json",
	logo = "rbxassetid://98448650971303",
}

local tbl3 = {
	White = { accent = Color3.fromRGB(236, 236, 242), base = Color3.fromRGB(34, 34, 38) },
	Blue = { accent = Color3.fromRGB(76, 194, 255), base = Color3.fromRGB(22, 28, 40) },
	Pink = { accent = Color3.fromRGB(255, 122, 196), base = Color3.fromRGB(40, 24, 36) },
	Emerald = { accent = Color3.fromRGB(46, 214, 150), base = Color3.fromRGB(18, 36, 31) },
	Ruby = { accent = Color3.fromRGB(196, 92, 255), base = Color3.fromRGB(33, 22, 44) },
	Amber = { accent = Color3.fromRGB(255, 176, 64), base = Color3.fromRGB(40, 30, 18) },
}

local tbl4 = { "White", "Blue", "Pink", "Emerald", "Ruby", "Amber" }
local tbl5

tbl5 = {
	make = function(arg, arg2, parent)
		local instance = Instance.new(arg)
		local v = pairs
		arg2 = arg2 or {}

		for k, v2 in v(arg2) do
			instance[k] = v2
		end

		if parent then
			instance.Parent = parent
		end

		return instance
	end,
	corner = function(arg, arg2)
		local make = tbl5.make
		local tbl6 = {}
		local cornerRadius = typeof(arg2) == "UDim" and arg2

		if not cornerRadius then
			cornerRadius = UDim.new(0, arg2 or 8)
		end

		tbl6.CornerRadius = cornerRadius
		make("UICorner", tbl6, arg)
		return arg
	end,
	stroke = function(arg, arg2, arg3, arg4)
		return tbl5.make("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = arg3 or tbl2.white,
			Transparency = arg2 or 0.9,
			Thickness = arg4 or 1,
		}, arg)
	end,
}

local inter = nil

local function fn2()
	if inter then
		return inter
	end

	for _, v in ipairs({ tbl2.builder, tbl2.montserrat, tbl2.inter }) do
		if pcall(Font.new, v, Enum.FontWeight.Regular) then
			inter = v
			return inter
		end
	end

	inter = tbl2.inter
	return inter
end

tbl5.font = function(arg, arg2)
	return Font.new(arg2 or fn2(), arg or Enum.FontWeight.Regular)
end

tbl5.text = function(arg, arg2, arg3, arg4, arg5, arg6, arg7)
	local TextLabel = tbl5.make("TextLabel", {
		Name = arg2,
		BackgroundTransparency = 1,
		FontFace = tbl5.font(arg6),
		TextSize = arg4,
		TextColor3 = arg5 or tbl2.white,
		Text = arg3 or "",
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
	}, arg)

	local v = pairs
	arg7 = arg7 or {}

	for k, v2 in v(arg7) do
		TextLabel[k] = v2
	end

	return TextLabel
end

tbl5.icon = function(arg)
	if type(arg) ~= "string" or arg == "" then
		return nil
	end

	if string.find(arg, "^rbx") or string.find(arg, "^http") then
		return arg
	end
	return assets["lucide-" .. arg] or assets[arg]
end

tbl5.image = function(arg, arg2, arg3, arg4, arg5)
	local ImageLabel = tbl5.make("ImageLabel", {
		Name = arg2,
		BackgroundTransparency = 1,
		Image = tbl5.icon(arg3) or "",
		ImageColor3 = tbl2.white,
		Size = UDim2.fromOffset(arg4, arg4),
	}, arg)

	local v = pairs
	arg5 = arg5 or {}

	for k, v2 in v(arg5) do
		ImageLabel[k] = v2
	end

	return ImageLabel
end

tbl5.button = function(arg, arg2, arg3)
	local TextButton = tbl5.make("TextButton", { Name = arg2, Text = "", AutoButtonColor = false, BackgroundTransparency = 1, BorderSizePixel = 0 }, arg)
	local v = pairs
	arg3 = arg3 or {}

	for k, v2 in v(arg3) do
		TextButton[k] = v2
	end

	return TextButton
end

tbl5.tween = function(arg, arg2, arg3, arg4, arg5, arg6)
	local tween = tbl.TS:Create(arg, TweenInfo.new(arg2, arg4 or Enum.EasingStyle.Quint, arg5 or Enum.EasingDirection.Out, 0, false, arg6 or 0), arg3)
	tween:Play()
	return tween
end

tbl5.click = function(arg)
	local userInputType = arg.UserInputType
	return userInputType == Enum.UserInputType.MouseButton1 or userInputType == Enum.UserInputType.Touch
end

tbl5.move = function(arg)
	local userInputType = arg.UserInputType
	return userInputType == Enum.UserInputType.MouseMovement or userInputType == Enum.UserInputType.Touch
end

tbl5.inside = function(arg, arg2)
	local absolutePosition = arg.AbsolutePosition
	local absoluteSize = arg.AbsoluteSize
	return arg2.X >= absolutePosition.X and arg2.X <= absolutePosition.X + absoluteSize.X and arg2.Y >= absolutePosition.Y and arg2.Y <= absolutePosition.Y + absoluteSize.Y
end

tbl5.same = function(arg, arg2)
	if type(arg) == "table" and type(arg2) == "table" then
		for k, v in pairs(arg) do
			if arg2[k] ~= v then
				return false
			end
		end

		for k, v in pairs(arg2) do
			if arg[k] ~= v then
				return false
			end
		end

		return true
	end

	return arg == arg2
end

local tbl6

tbl6 = {
	jobs = {},
	loop = nil,
	quick = TweenInfo.new(0.2, Enum.EasingStyle.Quint),
	smooth = TweenInfo.new(0.35, Enum.EasingStyle.Quint),
	springy = TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
	tick = function()
		error("devirt: symbolic generic for (at 0:3)")
	end,
	run = function(arg)
		tbl6.jobs[arg] = true

		if not tbl6.loop then
			tbl6.loop = tbl.Run.RenderStepped:Connect(tbl6.tick)
		end
	end,
	stop = function(arg)
		tbl6.jobs[arg] = nil
	end,
	spring = function(arg, arg2, arg3)
		return { x = arg, v = 0, t = arg, k = arg2, d = arg3 }
	end,
	step = function(arg, arg2)
		local v = table.pack(math.max(1, math.ceil(arg2 * 240)))
		local n = arg2 / v[1]

		for i = 1, v[1] do
			arg.v = arg.v + (arg.k * (arg.t - arg.x) - arg.d * arg.v) * n
			arg.x = arg.x + arg.v * n
		end

		local v2 = table.pack(math.abs(arg.t - arg.x))
		local flag

		if v2[1] < 0.001 then
			flag = math.abs(arg.v) < 0.01
		else
			flag = v2[1] < 0.001
		end

		if flag then
			arg.x = arg.t
			arg.v = 0
			return true
		end

		return false
	end,
}

local tbl7

tbl7 = {
	Version = "1.0.0",
	Options = {},
	Themes = tbl4,
	Unloaded = false,
	Connections = {},
	Icons = assets,
	Connect = function(arg, arg2, arg3)
		local connection = arg2:Connect(arg3)
		table.insert(tbl7.Connections, connection)
		return connection
	end,
	GetIcon = function(arg, arg2)
		return tbl5.icon(arg2)
	end,
	SafeCallback = function(arg, arg2, ...)
		if type(arg2) ~= "function" then
			return
		end
		local v = pcall
		local v2 = table.pack(...)
		v2.n = 2 + v2.n - 1
		table.move(v2, 1, v2.n, 2, v2)
		v2[1] = arg2
		local v3, v4 = v(table.unpack(v2, 1, v2.n))
		if v3 then
			return
		end
		local str = tostring(v4)
		local v5 = string.find(str, ":%d+: ")

		tbl7:Notify({
			Title = "Callback error",
			Content = v5 and string.sub(str, v5 + 1) or str,
			Kind = "bad",
			Duration = 6,
		})
	end,
}

local function fn3()
	if tbl.Run:IsStudio() then
		local localPlayer = tbl.Players.LocalPlayer
		return localPlayer and localPlayer:WaitForChild("PlayerGui")
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
	return tbl.Players.LocalPlayer:WaitForChild("PlayerGui")
end

local v = fn3()

for _, child in ipairs(v:GetChildren()) do
	if child.Name == "NightGlass" and child:IsA("ScreenGui") then
		child:Destroy()
	end
end

local ScreenGui = tbl5.make("ScreenGui", {
	Name = "NightGlass",
	ResetOnSpawn = false,
	IgnoreGuiInset = true,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	DisplayOrder = 9999,
})

pcall(function()
	if syn and syn.protect_gui then
		syn.protect_gui(ScreenGui)
	end
end)

ScreenGui.Parent = v
tbl7.GUI = ScreenGui

local glass = {
	meshes = {
		Center = "rbxassetid://124254578783606",
		Edge = "rbxassetid://71901416013578",
		Corner = "rbxassetid://87705720216841",
	},
	intensity = 1,
	inset = 4,
	lensDepth = 0.45,
	lensThickness = 0.03,
	small = 60,
	list = {},
	parts = {},
	bits = {},
	frames = {},
}

local cframe = CFrame.Angles(0, 1.5707963267948966, 0)
local cframe2 = CFrame.Angles(0, 0, 1.5707963267948966)
local cframe3 = CFrame.Angles(0, -1.5707963267948966, 0)
local size = Vector3.one * 0.001
local vector = Vector3.zero
local tbl8 = { block = "Center", cyl = "Edge", ball = "Corner" }
local n = 0.01
local n2 = 0.001
local n3 = 2
local tbl9 = { vp = Vector2.zero, fov = 0, near = 0 }
local depthOfFieldEffect = nil
local flag = nil
local v2 = nil
local model = nil

for _, child in ipairs(tbl.Light:GetChildren()) do
	if child.Name == "NightGlassBlur" or child.Name == "NightGlassOverlay" then
		child:Destroy()
	end
end

for _, child in ipairs(workspace:GetChildren()) do
	if child.Name == "NightGlassLens" then
		child:Destroy()
	end
end

if workspace.CurrentCamera then
	for _, child in ipairs(workspace.CurrentCamera:GetChildren()) do
		if child.Name == "NightGlassBlur" then
			child:Destroy()
		end
	end
end

local function fn4()
	if depthOfFieldEffect and depthOfFieldEffect.Parent then
		return depthOfFieldEffect
	end
	depthOfFieldEffect = Instance.new("DepthOfFieldEffect")
	depthOfFieldEffect.Name = "NightGlassBlur"
	depthOfFieldEffect.FarIntensity = 0
	depthOfFieldEffect.InFocusRadius = 0
	depthOfFieldEffect.NearIntensity = glass.intensity
	depthOfFieldEffect.FocusDistance = 0.25 - tbl9.near
	depthOfFieldEffect.Parent = tbl.Light
	return depthOfFieldEffect
end

local function fn5()
	if model and model.Parent then
		return model
	end
	model = Instance.new("Model")
	model.Name = "NightGlassLens"
	local highlight = Instance.new("Highlight")
	highlight.FillColor = tbl2.black
	highlight.FillTransparency = 0.9
	highlight.OutlineTransparency = 1
	highlight.Parent = model
	model.Parent = workspace
	return model
end

local function fn6(arg)
	local part = Instance.new("Part")
	part.Name = "NightGlassBlur"
	part.Size = Vector3.one * n
	part.Anchored = true
	part.CanCollide = false
	part.CanTouch = false
	part.CanQuery = false
	part.CastShadow = false
	part.Material = Enum.Material.Glass
	part.Transparency = 0.9999999
	local instance = Instance.new(arg and "SpecialMesh" or "BlockMesh")

	if arg then
		instance.MeshType = Enum.MeshType.Cylinder
	end

	instance.Scale = vector
	instance.Parent = part
	return { part = part, mesh = instance, round = arg }
end

local function fn7(arg)
	local overlay = glass.overlay and glass.overlay:FindFirstChild(tbl8[arg])

	if overlay then
		local clone = overlay:Clone()

		for _, child in ipairs(clone:GetChildren()) do
			if child:IsA("JointInstance") then
				child:Destroy()
			end
		end

		clone.Name = "NightGlassLens"
		clone.Anchored = true
		clone.CanCollide = false
		clone.CanTouch = false
		clone.CanQuery = false
		clone.CastShadow = false
		clone.Size = size
		clone.Parent = fn5()
		return { part = clone, lens = true, cf = CFrame.identity }
	end

	local part = Instance.new("Part")
	part.Name = "NightGlassLens"
	part.Size = Vector3.one
	part.Anchored = true
	part.CanCollide = false
	part.CanTouch = false
	part.CanQuery = false
	part.CastShadow = false
	part.Material = Enum.Material.Glass
	part.Transparency = 2
	part.Color = tbl2.black
	local instance = Instance.new(arg == "block" and "BlockMesh" or "SpecialMesh")

	if arg == "cyl" then
		instance.MeshType = Enum.MeshType.Cylinder
	end

	if arg == "ball" then
		instance.MeshType = Enum.MeshType.Sphere
	end

	instance.Scale = vector
	instance.Parent = part
	part.Parent = fn5()
	return { part = part, mesh = instance, lens = true, cf = CFrame.identity }
end

local function fn8()
	table.clear(glass.parts)
	table.clear(glass.bits)

	for _, v3 in ipairs(glass.list) do
		for _, piece in ipairs(v3.pieces) do
			glass.parts[#glass.parts + 1] = piece.part
			glass.bits[#glass.bits + 1] = piece
		end

		for _, lense in ipairs(v3.lenses) do
			glass.parts[#glass.parts + 1] = lense.part
			glass.bits[#glass.bits + 1] = lense
		end
	end

	table.clear(glass.frames)
end

local function fn9(arg)
	while arg do
		if arg:IsA("GuiObject") then
			local flag2

			if not arg.Visible then
				flag2 = not arg.Visible
			else
				flag2 = arg:GetAttribute("GlassHide")
			end

			if flag2 then
				return false
			end
		elseif arg:IsA("LayerCollector") then
			return arg.Enabled
		end

		arg = arg.Parent
	end

	return false
end

local function fn10(...) --[[ unresolved LuaFunc at 2,56665 - 2,57127 ]] return nil end

local function fn11(arg, arg2)
	local v3 = table.pack(arg:FindFirstChildOfClass("UICorner"))
	if not v3[1] then
		return 0
	end
	local v4 = v3[1]
	local v5 = table.pack(math.min(arg2.X, arg2.Y))
	return math.clamp(v4.CornerRadius.Scale * v5[1] + v4.CornerRadius.Offset * fn10(arg), 0, v5[1] / 2)
end

local function fn12(arg, arg2, arg3, arg4, arg5, arg6)
	local flag2

	if arg4 <= 0 then
		flag2 = arg4 <= 0
	else
		flag2 = arg5 <= 0
	end

	if flag2 then
		arg.mesh.Scale = vector
		return
	end
	arg.mesh.Offset = Vector3.new((arg2 + arg4 / 2) * arg6.k - arg6.tx, arg6.ty - (arg3 + arg5 / 2) * arg6.k, -arg6.d)
	arg.mesh.Scale = Vector3.new(arg4 * arg6.k, arg5 * arg6.k, n2) / n
end

local function fn13(arg, arg2, arg3, arg4, arg5)
	if arg4 <= 0 then
		arg.mesh.Scale = vector
		return
	end
	arg.mesh.Offset = Vector3.new(arg5.d, arg5.ty - arg3 * arg5.k, arg2 * arg5.k - arg5.tx)
	arg.mesh.Scale = Vector3.new(n2, 2 * arg4 * arg5.k, 2 * arg4 * arg5.k) / n
end

local function fn14(arg)
	if arg.mesh then
		arg.mesh.Scale = vector
	else
		arg.part.Size = size
	end
end

local function fn15()
	error("devirt: symbolic generic for (at 0:1)")
end

local function fn16(arg, arg2, arg3, arg4, arg5, arg6, arg7)
	local v3 = table.pack(math.min(arg4, arg5))
	local edge

	if arg.edge then
		edge = arg.edge
	else
		local v4 = v3[1]

		if v4 <= glass.small then
			edge = math.max(1, v4 * 0.01)
		else
			edge = v4 <= glass.small
		end
	end

	edge = edge or arg.inset
	local n4, n5, v4, v5, flag2

	if arg4 - edge * 2 < 1 then
		local n6 = arg4 - edge * 2
		local n7 = arg5 - edge * 2
		local flag3 = arg4 - edge * 2 < 1
		n4 = arg2 + edge
		n5 = arg3 + edge
		v4 = n6
		v5 = n7
		flag2 = flag3
	else
		local n6 = arg4 - edge * 2
		local n7 = arg5 - edge * 2
		n4 = arg2 + edge
		n5 = arg3 + edge
		v4 = n6
		v5 = n7
		flag2 = v5 < 1
	end

	if flag2 then
		return fn15(arg.pieces)
	end
	local v6 = table.pack(math.min(math.max(arg6 - edge, 0), v4 / 2, v5 / 2))

	if v6[1] < 0.5 then
		local pieces = arg.pieces
		fn12(pieces[1], n4, n5, v4, v5, arg7)
		fn12(pieces[2], 0, 0, 0, 0, arg7)

		for i = 3, 6 do
			fn13(pieces[i], 0, 0, 0, arg7)
		end

		return
	end

	local pieces = arg.pieces
	local v7 = v6[1]
	fn12(pieces[1], n4, n5 + v7, v4, v5 - 2 * v7, arg7)
	fn12(pieces[2], n4 + v7, n5, v4 - 2 * v7, v5, arg7)
	fn13(pieces[3], n4 + v7, n5 + v7, v7, arg7)
	fn13(pieces[4], n4 + v4 - v7, n5 + v7, v7, arg7)
	fn13(pieces[5], n4 + v7, n5 + v5 - v7, v7, arg7)
	fn13(pieces[6], n4 + v4 - v7, n5 + v5 - v7, v7, arg7)
end

local function fn17(arg, arg2, arg3, arg4, arg5)
	local flag2

	if arg4 < 0.5 then
		flag2 = arg4 < 0.5
	else
		flag2 = arg5 < 0.5
	end

	if flag2 then
		arg.mesh.Scale = vector
		return
	end
	error("devirt: unm (at 0:2)")
end

local function fn18(arg, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
	local flag2

	if arg4 < 0.5 then
		flag2 = arg4 < 0.5
	else
		flag2 = arg5 < 0.5
	end

	if flag2 then
		return fn14(arg)
	end
	local flag3, flag4

	if arg6 % 180 ~= 0 then
		flag3 = arg4
		flag4 = arg6 % 180 ~= 0
	else
		flag3 = arg6 % 180 ~= 0
		flag4 = arg6 % 180 ~= 0
	end

	arg.part.Size = Vector3.new(arg7, (flag3 or arg5) * arg8.lk + 0.001, (flag4 and arg5 or arg4) * arg8.lk + 0.001)
	error("devirt: unm (at 0:3)")
end

local function fn19(arg, arg2, arg3, arg4, arg5, arg6, arg7)
	fn18(arg.lenses[1], arg2 + arg4 / 2, arg3 + arg5 / 2, arg4 - 2 * arg6, arg5 - 2 * arg6, 0, arg.lensThickness, arg7)
	local lensThickness = arg.lensThickness
	local v3 = arg.lenses[2]
	local lenses = arg.lenses
	local n4 = arg4 - 2 * arg6
	local n5 = arg5 - 2 * arg6
	local n6 = arg2 + arg4 / 2
	local n7 = arg3 + arg5 / 2
	fn18(v3, n6, arg3 + arg6 / 2, n4, arg6, 0, lensThickness, arg7)
	fn18(lenses[3], n6, arg3 + arg5 - arg6 / 2, n4, arg6, 180, lensThickness, arg7)
	fn18(lenses[4], arg2 + arg6 / 2, n7, arg6, n5, 90, lensThickness, arg7)
	fn18(lenses[5], arg2 + arg4 - arg6 / 2, n7, arg6, n5, -90, lensThickness, arg7)
	fn18(lenses[6], arg2 + arg6 / 2, arg3 + arg6 / 2, arg6, arg6, 90, lensThickness, arg7)
	fn18(lenses[7], arg2 + arg4 - arg6 / 2, arg3 + arg6 / 2, arg6, arg6, 0, lensThickness, arg7)
	fn18(lenses[8], arg2 + arg6 / 2, arg3 + arg5 - arg6 / 2, arg6, arg6, 180, lensThickness, arg7)
	fn18(lenses[9], arg2 + arg4 - arg6 / 2, arg3 + arg5 - arg6 / 2, arg6, arg6, -90, lensThickness, arg7)
end

local function fn20(arg, arg2, arg3, arg4, arg5, arg6, arg7)
	if not arg.lenses[1].mesh then
		return fn19(arg, arg2, arg3, arg4, arg5, arg6, arg7)
	end
	local min, flag2, lenses, lensDepth

	if arg6 > 0.5 then
		min = math.min
		flag2 = arg6
		lenses = arg.lenses
		lensDepth = arg.lensDepth
	else
		min = math.min
		flag2 = arg6 > 0.5
		lenses = arg.lenses
		lensDepth = arg.lensDepth
	end

	flag2 = flag2 or arg.lensWidth
	local v3 = table.pack(min(flag2, arg4 / 2, arg5 / 2))
	fn15(lenses)
	local v4, n4, n5, n6, flag3

	if arg4 - v3[1] * 2 < 1 then
		v4 = v3[1]
		n4 = v3[1] * 2
		n5 = arg2 + arg4 / 2
		n6 = arg3 + arg5 / 2
		flag3 = arg5 - n4 < 1
	else
		v4 = v3[1]
		n4 = v3[1] * 2
		n5 = arg2 + arg4 / 2
		n6 = arg3 + arg5 / 2
		flag3 = arg4 - v3[1] * 2 < 1
	end

	if flag3 then
		local v5 = table.pack(math.min(arg4, arg5))
		return fn17(lenses[6], n5, n6, v5[1], v5[1], v5[1] * lensDepth, arg7)
	end

	if arg5 - n4 < 1 then
		fn17(lenses[2], n5, n6, arg4 - arg5, arg5, arg5 * lensDepth, arg7)
		fn17(lenses[6], arg2 + arg5 / 2, n6, arg5, arg5, arg5 * lensDepth, arg7)
		fn17(lenses[7], arg2 + arg4 - arg5 / 2, n6, arg5, arg5, arg5 * lensDepth, arg7)
		return
	end

	if arg4 - n4 < 1 then
		fn17(lenses[4], n5, n6, arg5 - arg4, arg4, arg4 * lensDepth, arg7, cframe2)
		fn17(lenses[6], n5, arg3 + arg4 / 2, arg4, arg4, arg4 * lensDepth, arg7)
		fn17(lenses[7], n5, arg3 + arg5 - arg4 / 2, arg4, arg4, arg4 * lensDepth, arg7)
		return
	end

	fn17(lenses[1], n5, n6, arg4 - n4, arg5 - n4, 0, arg7)
	fn17(lenses[2], n5, arg3 + v4, arg4 - n4, n4, n4 * lensDepth, arg7)
	fn17(lenses[3], n5, arg3 + arg5 - v4, arg4 - n4, n4, n4 * lensDepth, arg7)
	fn17(lenses[4], arg2 + v4, n6, arg5 - n4, n4, n4 * lensDepth, arg7, cframe2)
	fn17(lenses[5], arg2 + arg4 - v4, n6, arg5 - n4, n4, n4 * lensDepth, arg7, cframe2)

	if arg6 > 0.5 then
		fn17(lenses[6], arg2 + v4, arg3 + v4, n4, n4, n4 * lensDepth, arg7)
		fn17(lenses[7], arg2 + arg4 - v4, arg3 + v4, n4, n4, n4 * lensDepth, arg7)
		fn17(lenses[8], arg2 + v4, arg3 + arg5 - v4, n4, n4, n4 * lensDepth, arg7)
		fn17(lenses[9], arg2 + arg4 - v4, arg3 + arg5 - v4, n4, n4, n4 * lensDepth, arg7)
	end
end

local function fn21(arg)
	local parent = arg.Parent
	local n4 = -math.huge
	local n5 = -math.huge
	local huge = math.huge
	local huge2 = math.huge

	while parent and not parent:IsA("LayerCollector") do
		local v3 = table.pack(parent:IsA("GuiObject"))
		local clipsDescendants

		if v3[1] then
			clipsDescendants = parent.ClipsDescendants
		else
			clipsDescendants = v3[1]
		end

		if clipsDescendants then
			local v4 = table.pack(math.max(n4, parent.AbsolutePosition.X))
			local v5 = table.pack(math.max(n5, parent.AbsolutePosition.Y))
			local absolutePosition = parent.AbsolutePosition
			local absoluteSize = parent.AbsoluteSize
			local v6 = v4[1]
			local v7 = v5[1]
			local v8 = table.pack(math.min(huge, absolutePosition.X + absoluteSize.X))
			local v9 = table.pack(math.min(huge2, absolutePosition.Y + absoluteSize.Y))
			n4 = v6
			n5 = v7
			huge = v8[1]
			huge2 = v9[1]
		end

		parent = parent.Parent
	end

	return n4, n5, huge, huge2
end

local function fn22(arg, arg2, arg3)
	local v3 = table.pack(fn9(arg.gui))
	local gui, on, absolutePosition, absoluteSize, r

	if v3[1] then
		gui = arg.gui
		on = v3[1]
		absolutePosition = arg.gui.AbsolutePosition
		absoluteSize = arg.gui.AbsoluteSize
		r = fn11(gui, absoluteSize)
	else
		gui = arg.gui
		on = v3[1]
		absolutePosition = arg.gui.AbsolutePosition
		absoluteSize = arg.gui.AbsoluteSize
		r = v3[1]
	end

	r = r or 0
	local v4 = table.pack(tbl.GuiS:GetGuiInset())
	local v5 = table.pack(fn21(gui))
	local v6, v7, v8, v9, v10, flag2

	if not arg3 then
		v6 = v4[1]
		v7 = v5[1]
		v8 = v5[2]
		v9 = v5[3]
		v10 = v5[4]
		flag2 = on == arg.on
	else
		local flag3 = not arg3
		v6 = v4[1]
		v7 = v5[1]
		v8 = v5[2]
		v9 = v5[3]
		v10 = v5[4]
		flag2 = flag3
	end

	if flag2 and absolutePosition == arg.pos and absoluteSize == arg.size and r == arg.r and v6 == arg.off and v7 == arg.x0 and v8 == arg.y0 and v9 == arg.x1 and v10 == arg.y1 then
		return
	end
	arg.on = on
	arg.pos = absolutePosition
	arg.size = absoluteSize
	arg.r = r
	arg.off = v6
	arg.x0 = v7
	arg.y0 = v8
	arg.x1 = v9
	arg.y1 = v10
	local n4 = math.max(absolutePosition.X, v7)
	local v11 = table.pack(math.max(absolutePosition.Y, v8))
	local v12 = table.pack(math.min(absolutePosition.X + absoluteSize.X, v9))
	local v13 = table.pack(math.min(absolutePosition.Y + absoluteSize.Y, v10))
	local flag3, v14, n5, n6

	if n4 ~= absolutePosition.X then
		flag3 = n4 ~= absolutePosition.X
		v14 = v11[1]
		n5 = v12[1] - n4
		n6 = v13[1] - v11[1]
	else
		v14 = v11[1]
		n5 = v12[1] - n4
		n6 = v13[1] - v11[1]
		flag3 = v14 ~= absolutePosition.Y
	end

	flag3 = flag3 or n5 ~= absoluteSize.X or n6 ~= absoluteSize.Y
	local n7, v15

	if on then
		local n8 = v14 + v6.Y
		n7 = n4 + v6.X
		v15 = n8
		on = n5 >= 1
	else
		local n8 = v14 + v6.Y
		n7 = n4 + v6.X
		v15 = n8
	end

	on = on and n6 >= 1 and v15 + n6 >= 0 and v15 <= arg2.vp.Y
	arg.seen = on
	local str, lensOn

	if on then
		str = "lensShown"
		lensOn = arg.lensOn
	else
		str = "lensShown"
		lensOn = on
	end

	arg[str] = lensOn and not flag3

	if on and arg.blur then
		fn16(arg, n7, v15, n5, n6, math.min(r, n5 / 2, n6 / 2), arg2)
	else
		fn15(arg.pieces)
	end

	if arg.lensShown then
		fn20(arg, n7, v15, n5, n6, r, arg2)
	else
		fn15(arg.lenses)
	end
end

local function fn23()
	local currentCamera, flag2

	if not workspace.CurrentCamera then
		currentCamera = workspace.CurrentCamera
		flag2 = not workspace.CurrentCamera
	else
		currentCamera = workspace.CurrentCamera
		flag2 = #glass.list == 0
	end

	if flag2 then
		return
	end

	if currentCamera ~= v2 then
		error("devirt: symbolic generic for (at 0:17)")
	end

	local viewportSize, fieldOfView, nearPlaneZ, flag3

	if currentCamera.ViewportSize ~= tbl9.vp then
		viewportSize = currentCamera.ViewportSize
		fieldOfView = currentCamera.FieldOfView
		nearPlaneZ = currentCamera.NearPlaneZ
		flag3 = currentCamera.ViewportSize ~= tbl9.vp
	else
		viewportSize = currentCamera.ViewportSize
		fieldOfView = currentCamera.FieldOfView
		nearPlaneZ = currentCamera.NearPlaneZ
		flag3 = fieldOfView ~= tbl9.fov
	end

	if flag3 or nearPlaneZ ~= tbl9.near then
		tbl9.vp = viewportSize
		tbl9.fov = fieldOfView
		tbl9.near = nearPlaneZ
		fn4().FocusDistance = 0.25 - nearPlaneZ
	end

	local flag4

	if not depthOfFieldEffect then
		flag4 = not depthOfFieldEffect
	else
		flag4 = not depthOfFieldEffect.Parent
	end

	if flag4 then
		fn4()
	end

	if viewportSize.Y < 1 then
		return
	end
	local v3 = table.pack(math.tan(math.rad(fieldOfView) / 2))
	local v4 = v3[1]
	local n4 = 0.05 - nearPlaneZ
	error("devirt: symbolic generic for (at 0:6)")
end

local function fn24()
	if flag then
		return
	end
	flag = true
	fn4()
	tbl.Run:BindToRenderStep("NightGlass", Enum.RenderPriority.Camera.Value + 1, fn23)
end

local function fn25()
	if not flag then
		return
	end
	flag = false
	pcall(tbl.Run.UnbindFromRenderStep, tbl.Run, "NightGlass")

	if depthOfFieldEffect then
		depthOfFieldEffect:Destroy()
	end

	if model then
		model:Destroy()
	end

	depthOfFieldEffect = nil
	model = nil
	v2 = nil
	tbl9.vp = Vector2.zero
end

local function fn26(arg, arg2)
	local gui = arg.gui

	if arg2.rim ~= false and not gui:FindFirstChild("GlassRim") then
		local uiStroke = Instance.new("UIStroke")
		uiStroke.Name = "GlassRim"
		uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uiStroke.Color = tbl2.white
		uiStroke.Thickness = arg2.rimThickness or 1
		uiStroke.Transparency = arg2.rimTransparency or 0
		local uiGradient = Instance.new("UIGradient")
		uiGradient.Rotation = 35
		local numberSequence = NumberSequence.new
		local tbl10 = {}
		local v3 = NumberSequenceKeypoint.new(0, 0.05)
		local v4 = NumberSequenceKeypoint.new(0.3, 0.7)
		local v5 = NumberSequenceKeypoint.new(0.7, 0.8)
		local new = NumberSequenceKeypoint.new
		tbl10[1] = v3
		tbl10[2] = v4
		tbl10[3] = v5

		do
			local values = table.pack(new(1, 0.3))
			table.move(values, 1, values.n, 4, tbl10)
		end

		uiGradient.Transparency = numberSequence(tbl10)
		uiGradient.Parent = uiStroke
		uiStroke.Parent = gui
		arg.bits[#arg.bits + 1] = uiStroke
	end

	if arg2.sheen ~= false and not gui:FindFirstChild("GlassSheen") then
		local uiGradient = Instance.new("UIGradient")
		uiGradient.Name = "GlassSheen"
		uiGradient.Rotation = 90
		local numberSequence = NumberSequence.new
		local tbl10 = {}
		local v3 = NumberSequenceKeypoint.new(0, 0)
		local v4 = NumberSequenceKeypoint.new(0.45, 0.45)
		local new = NumberSequenceKeypoint.new
		tbl10[1] = v3
		tbl10[2] = v4

		do
			local values = table.pack(new(1, 0.2))
			table.move(values, 1, values.n, 3, tbl10)
		end

		uiGradient.Transparency = numberSequence(tbl10)
		uiGradient.Parent = gui
		arg.bits[#arg.bits + 1] = uiGradient
	end
end

local function destroy(arg)
	local v3 = table.find(glass.list, arg)
	if not v3 then
		return
	end
	table.remove(glass.list, v3)

	for _, conn in ipairs(arg.conns) do
		conn:Disconnect()
	end

	for _, piece in ipairs(arg.pieces) do
		piece.part:Destroy()
	end

	for _, lense in ipairs(arg.lenses) do
		lense.part:Destroy()
	end

	for _, bit in ipairs(arg.bits) do
		bit:Destroy()
	end

	fn8()

	if #glass.list == 0 then
		fn25()
	end
end

glass.new = function(arg, arg2)
	local tbl10 = arg2 or {}

	for _, v3 in ipairs(glass.list) do
		if v3.gui == arg then
			return v3
		end
	end

	local tbl11 = {
		gui = arg,
		inset = tbl10.inset or glass.inset,
		edge = tbl10.edge,
		blur = tbl10.blur ~= false,
		lensOn = tbl10.liquidglass ~= false,
		lensWidth = tbl10.lensWidth or 10,
		depthScale = tbl10.depthScale or 1,
		lensDepth = (tbl10.lensDepth or glass.lensDepth) * (tbl10.depthScale or 1),
		lensThickness = tbl10.lensThickness or glass.lensThickness,
		pieces = {},
		lenses = {},
		bits = {},
		conns = {},
	}

	if tbl11.blur then
		for i = 1, 6 do
			local v3 = fn6(i > 2)
			v3.part.Parent = workspace.CurrentCamera
			tbl11.pieces[i] = v3
		end
	end

	if tbl11.lensOn then
		local lenses = {}
		local block = fn7("block")
		local cyl = fn7("cyl")
		local cyl2 = fn7("cyl")
		local cyl3 = fn7("cyl")
		local cyl4 = fn7("cyl")
		local ball = fn7("ball")
		local ball2 = fn7("ball")
		local ball3 = fn7("ball")
		lenses[1] = block
		lenses[2] = cyl
		lenses[3] = cyl2
		lenses[4] = cyl3
		lenses[5] = cyl4
		lenses[6] = ball
		lenses[7] = ball2
		lenses[8] = ball3

		do
			local values = table.pack(fn7("ball"))
			table.move(values, 1, values.n, 9, lenses)
		end

		tbl11.lenses = lenses
	end

	fn26(tbl11, tbl10)

	tbl11.conns[1] = arg.AncestryChanged:Connect(function()
		if not arg:IsDescendantOf(game) then
			destroy(tbl11)
		end
	end)

	tbl11.Destroy = destroy
	glass.list[#glass.list + 1] = tbl11
	fn8()
	v2 = nil
	fn24()
	return tbl11
end

glass.remove = function(arg)
	for _, v3 in ipairs(glass.list) do
		if v3.gui == arg then
			return destroy(v3)
		end
	end
end

glass.has = function(arg)
	for _, v3 in ipairs(glass.list) do
		if v3.gui == arg then
			return true
		end
	end

	return false
end

glass.set = function(arg)
	if arg.intensity then
		glass.intensity = arg.intensity

		if depthOfFieldEffect then
			depthOfFieldEffect.NearIntensity = arg.intensity
		end
	end

	if arg.overlay then
		glass.overlay = arg.overlay
	end

	if arg.lensThickness then
		glass.lensThickness = arg.lensThickness
	end

	if arg.lensDepth then
		glass.lensDepth = arg.lensDepth

		for _, v3 in ipairs(glass.list) do
			v3.lensDepth = arg.lensDepth * (v3.depthScale or 1)
			v3.on = nil
		end
	end

	if arg.tint and model then
		local highlight = model:FindFirstChildOfClass("Highlight")

		if highlight then
			highlight.FillTransparency = arg.tint
		end
	end
end

local function fn27(arg, name)
	arg.Name = name
	arg.Material = Enum.Material.Glass
	arg.Color = tbl2.black
	arg.Transparency = 2
	arg.Reflectance = 0
	arg.Anchored = true
	arg.CanCollide = false
	arg.CanTouch = false
	arg.CanQuery = false
	arg.CastShadow = false
	return arg
end

local function fn28(arg, arg2)
	local ok, result = pcall(function()
		return game:GetService("AssetService"):CreateMeshPartAsync(arg, { CollisionFidelity = Enum.CollisionFidelity.Box, RenderFidelity = Enum.RenderFidelity.Precise })
	end)

	if ok and typeof(result) == "Instance" and result:IsA("MeshPart") then
		return fn27(result, arg2)
	end
	return nil
end

glass.build = function()
	if glass.overlay and glass.overlay.Parent then
		return glass.overlay
	end
	local folder = Instance.new("Folder")
	folder.Name = "NightGlassOverlay"
	local n4 = 0

	for k, meshe in pairs(glass.meshes) do
		local v3 = fn28(meshe, k)

		if v3 then
			v3.Parent = folder
			n4 += 1
		end
	end

	if n4 < 3 then
		folder:Destroy()
		glass.source = "basic"
		return nil
	end

	folder.Parent = tbl.Light
	glass.overlay = folder
	glass.source = "builtin"
	glass.refresh()
	return folder
end

glass.refresh = function()
	for _, v3 in ipairs(glass.list) do
		if v3.lensOn then
			for _, lense in ipairs(v3.lenses) do
				lense.part:Destroy()
			end

			local lenses = {}
			local block = fn7("block")
			local cyl = fn7("cyl")
			local cyl2 = fn7("cyl")
			local cyl3 = fn7("cyl")
			local cyl4 = fn7("cyl")
			local ball = fn7("ball")
			local ball2 = fn7("ball")
			local ball3 = fn7("ball")
			lenses[1] = block
			lenses[2] = cyl
			lenses[3] = cyl2
			lenses[4] = cyl3
			lenses[5] = cyl4
			lenses[6] = ball
			lenses[7] = ball2
			lenses[8] = ball3

			do
				local values = table.pack(fn7("ball"))
				table.move(values, 1, values.n, 9, lenses)
			end

			v3.lenses = lenses
		end

		v3.on = nil
	end

	fn8()
	v2 = nil
end

glass.overlayFrom = function(overlay)
	if typeof(overlay) == "Instance" and overlay:FindFirstChild("Center") then
		glass.overlay = overlay
		glass.source = "workspace"
		glass.refresh()
		return overlay
	end

	if type(overlay) == "string" then
		local v3 = string.match(overlay, "%d+")

		local ok = v3 and pcall(function()
			return game:GetObjects("rbxassetid://" .. v3)
		end)

		local v4 = nil
		local v5 = nil
		v5 = ok and v5 and v4[1]

		if v5 and v5:FindFirstChild("Center") then
			v5.Name = "NightGlassOverlay"

			for _, descendant in ipairs(v5:GetDescendants()) do
				if descendant:IsA("BasePart") then
					fn27(descendant, descendant.Name)
				end
			end

			v5.Parent = tbl.Light
			glass.overlay = v5
			glass.source = "asset"
			glass.refresh()
			return v5
		end

		if v5 then
			v5:Destroy()
		end
	end

	return glass.build()
end

glass.clear = function()
	for i = #glass.list, 1, -1 do
		destroy(glass.list[i])
	end

	fn25()
end

local Frame = tbl5.make("Frame", {
	Name = "Notifications",
	AnchorPoint = Vector2.new(1, 1),
	Position = UDim2.new(1, -16, 1, -16),
	Size = UDim2.new(0, 300, 1, -32),
	BackgroundTransparency = 1,
	ZIndex = 200,
}, ScreenGui)

tbl5.make("UIListLayout", {
	Padding = UDim.new(0, 0),
	SortOrder = Enum.SortOrder.LayoutOrder,
	VerticalAlignment = Enum.VerticalAlignment.Bottom,
	HorizontalAlignment = Enum.HorizontalAlignment.Right,
}, Frame)

local tbl10 = {
	info = { icon = "info", color = Color3.fromRGB(76, 194, 255) },
	good = { icon = "check-circle", color = Color3.fromRGB(46, 214, 150) },
	warn = { icon = "alert-triangle", color = Color3.fromRGB(255, 176, 64) },
	bad = { icon = "x-circle", color = Color3.fromRGB(255, 90, 110) },
}

local n4 = 0

tbl7.Notify = function(arg, arg2)
	local tbl11 = arg2 or {}
	n4 += 1
	local info = tbl10[tbl11.Kind or "info"] or tbl10.info
	local duration = tbl11.Duration

	local Frame2 = tbl5.make("Frame", {
		Name = "Note",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = n4,
		ClipsDescendants = false,
		ZIndex = 200,
	}, Frame)

	local make = tbl5.make

	local Frame3 = make("Frame", {
		Name = "Card",
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 340, 1, 0),
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = tbl7.GlassOn and tbl2.window or tbl7.Base or tbl2.window,
		BackgroundTransparency = tbl7.GlassOn and 0.45 or 0.07,
		ZIndex = 201,
	}, Frame2)

	tbl5.corner(Frame3, 10)
	tbl5.stroke(Frame3, 0.88)

	tbl5.make("UIPadding", {
		PaddingTop = UDim.new(0, 12),
		PaddingBottom = UDim.new(0, 14),
		PaddingLeft = UDim.new(0, 46),
		PaddingRight = UDim.new(0, 36),
	}, Frame3)

	tbl5.make("UIListLayout", { Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder }, Frame3)
	local v3 = tbl5.image(Frame2, "Kind", info.icon, 20, { ImageColor3 = info.color, ZIndex = 203 })
	tbl5.text(Frame3, "Title", tbl11.Title or "Night Hub", 13, tbl2.white, Enum.FontWeight.SemiBold, { Size = UDim2.new(1, 0, 0, 18), LayoutOrder = 1, ZIndex = 202 })

	if tbl11.Content and tbl11.Content ~= "" then
		tbl5.text(Frame3, "Content", tbl11.Content, 12, Color3.fromRGB(220, 220, 224), nil, {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			TextWrapped = true,
			TextTruncate = Enum.TextTruncate.None,
			LayoutOrder = 2,
			ZIndex = 202,
		})
	end

	if tbl11.SubContent and tbl11.SubContent ~= "" then
		tbl5.text(Frame3, "Sub", tbl11.SubContent, 11, tbl2.sub, nil, {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			TextWrapped = true,
			TextTruncate = Enum.TextTruncate.None,
			LayoutOrder = 3,
			ZIndex = 202,
		})
	end

	local v4 = tbl5.button(Frame2, "Close", { AnchorPoint = Vector2.new(1, 0), Size = UDim2.fromOffset(24, 24), ZIndex = 204 })

	tbl5.image(v4, "Icon", "x", 12, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		ImageColor3 = tbl2.sub,
		ZIndex = 205,
	})

	local Frame4 = tbl5.make("Frame", {
		Name = "Timer",
		AnchorPoint = Vector2.new(0, 1),
		BackgroundColor3 = info.color,
		BorderSizePixel = 0,
		Size = UDim2.new(1, -20, 0, 2),
		ZIndex = 204,
		Visible = duration ~= nil,
	}, Frame2)

	tbl5.corner(Frame4, 1)
	local v5 = tbl6.spring(340, 260, 26)
	local v6 = tbl6.spring(0, 320, 34)
	local flag2 = false
	local flag3 = false

	local function fn29()
		local y = Frame3.AbsoluteSize.Y
		v6.t = flag2 and 0 or y + 10
		Frame2.Size = UDim2.new(1, 0, 0, math.max(v6.x, 0))
		Frame3.Position = UDim2.new(0, v5.x, 1, 0)
		local n5 = math.max(v6.x, 0) - y
		v3.Position = UDim2.fromOffset(v5.x + 14, n5 + 12)
		v4.Position = UDim2.new(1, v5.x - 6, 0, n5 + 6)
		Frame4.Position = UDim2.new(0, v5.x + 10, 1, 0)
	end

	local function fn30(arg3)
		local v7 = table.pack(tbl6.step(v5, arg3))
		local v8 = table.pack(tbl6.step(v6, arg3))
		fn29()
		local v9, v10, v11

		if flag2 then
			v9 = v7[1]
			v10 = v7[1]
			v11 = v8[1]
		else
			v9 = flag2
			v10 = v7[1]
			v11 = v8[1]
		end

		if v9 and v11 then
			Frame2:Destroy()
			return true
		end
		return v10 and v11 and not flag2
	end

	local function fn31()
		if flag2 then
			return
		end
		flag2 = true

		if flag3 then
			glass.remove(Frame3)
		end

		v5.t = 340
		local v7 = v5
		v5.k = 180
		v7.d = 22
		v6.t = 0
		tbl6.run(fn30)
	end

	v4.Activated:Connect(fn31)

	task.defer(function()
		v5.t = 0

		if tbl7.GlassOn then
			flag3 = true
			glass.new(Frame3, { blur = true, liquidglass = true, sheen = false, rim = false, inset = 4 })
		end

		tbl6.run(fn30)

		if duration then
			Frame4.Size = UDim2.new(1, -20, 0, 2)
			tbl5.tween(Frame4, duration, { Size = UDim2.new(0, 0, 0, 2) }, Enum.EasingStyle.Linear)
			task.delay(duration, fn31)
		end
	end)

	return { Close = fn31 }
end

local tbl11 = {}

local function fn29()
	return type(writefile) == "function" and type(readfile) == "function"
end

local function fn30(arg)
	if type(makefolder) ~= "function" or type(isfolder) ~= "function" then
		return
	end
	local str = nil

	for match in string.gmatch(arg, "[^/]+") do
		str = str and str .. "/" .. match or match

		if not isfolder(str) then
			pcall(makefolder, str)
		end
	end
end

tbl7.ConfigPath = function()
	local settings = tbl7.Settings or {}
	local folder = settings.Folder or "Night Hub"
	return folder, folder .. "/" .. (settings.Game or tostring(game.PlaceId)) .. ".json"
end

local function fn31(arg)
	local type_ = arg.Type
	if type_ == "Colorpicker" then
		return { k = "color", v = arg.Value:ToHex() }
	end

	if type_ == "Keybind" then
		return { k = "bind", v = arg.Value, m = arg.Mode }
	end

	if type_ == "Dropdown" and arg.Multi then
		local tbl12 = {}
		local v3 = pairs
		local tbl13 = arg.Value or {}

		for k, v4 in v3(tbl13) do
			if v4 then
				tbl12[#tbl12 + 1] = k
			end
		end

		table.sort(tbl12)
		return { k = "many", v = tbl12 }
	end

	return { k = "plain", v = arg.Value }
end

local function fn32(arg, arg2)
	if type(arg2) ~= "table" then
		return
	end

	if arg2.k == "color" then
		local ok, result = pcall(Color3.fromHex, arg2.v)

		if ok then
			arg:SetValue(result)
		end
	elseif arg2.k == "bind" then
		arg:SetValue(arg2.v, arg2.m)
	elseif arg2.v ~= nil then
		arg:SetValue(arg2.v)
	end
end

tbl7.SaveConfig = function()
	local tbl12 = {}

	for k, option in pairs(tbl7.Options) do
		if option.Type and option.Type ~= "Button" and option.Save ~= false then
			tbl12[k] = fn31(option)
		end
	end

	local ok, result = pcall(function()
		return tbl.Http:JSONEncode({ version = tbl7.Version, saved = os.time(), data = tbl12 })
	end)

	if not ok then
		return false, result
	end
	local v3, v4 = tbl7:ConfigPath()

	if fn29() then
		fn30(v3)
		if pcall(writefile, v4, result) then
			return true, "disk"
		end
	end

	tbl11[v4] = result
	return true, "memory"
end

tbl7.ReadConfig = function()
	local v3, v4 = tbl7:ConfigPath()
	local v5 = nil

	if fn29() and type(isfile) == "function" then
		local ok, result = pcall(isfile, v4)

		if ok and result then
			local ok2, result2 = pcall(readfile, v4)

			if ok2 then
				v5 = result2
			end
		end
	end

	v5 = v5 or tbl11[v4]
	if not v5 then
		return nil
	end

	local ok, result = pcall(function()
		return tbl.Http:JSONDecode(v5)
	end)

	return ok and type(result) == "table" and result.data or nil
end

tbl7.ApplyPending = function(arg, arg2, arg3)
	local pending = tbl7.Pending and tbl7.Pending[arg2]
	if not pending or not arg3.SetValue then
		return
	end
	tbl7.Pending[arg2] = nil
	local loading = tbl7.Loading
	tbl7.Loading = true
	pcall(fn32, arg3, pending)
	tbl7.Loading = loading
end

tbl7.LoadConfig = function(arg, arg2)
	local v3, v4 = tbl7:ConfigPath()
	local v5 = nil

	if fn29() and type(isfile) == "function" then
		local ok, result = pcall(isfile, v4)

		if ok and result then
			local ok2, result2 = pcall(readfile, v4)

			if ok2 then
				v5 = result2
			end
		end
	end

	v5 = v5 or tbl11[v4]
	if not v5 then
		return false, "empty"
	end

	local ok, result = pcall(function()
		return tbl.Http:JSONDecode(v5)
	end)

	if not ok or type(result) ~= "table" then
		return false, "broken"
	end
	tbl7.Loading = true
	local v6 = pairs
	local data = result.data or {}
	local n5 = 0

	for k, v7 in v6(data) do
		local v8 = tbl7.Options[k]

		if v8 and v8.SetValue and pcall(fn32, v8, v7) then
			n5 += 1
		end
	end

	task.delay(0.1, function()
		tbl7.Loading = false
	end)

	if not arg2 then
		tbl7:Notify({ Title = "Config loaded", Content = n5 .. " settings restored", Kind = "good", Duration = 3 })
	end

	return true, n5
end

tbl7.DeleteConfig = function()
	local v3, v4 = tbl7:ConfigPath()
	tbl11[v4] = nil

	if type(delfile) == "function" and type(isfile) == "function" then
		local ok, result = pcall(isfile, v4)

		if ok and result then
			pcall(delfile, v4)
		end
	end

	return true
end

local flag2 = false

tbl7.Dirty = function()
	if not tbl7.Settings or tbl7.Settings.Save == false then
		return
	end

	if tbl7.Loading or flag2 or tbl7.Unloaded then
		return
	end
	flag2 = true

	task.delay(0.6, function()
		flag2 = false

		if not tbl7.Unloaded then
			tbl7:SaveConfig()
		end
	end)
end

local tbl12

tbl12 = {
	accent = tbl3.Blue.accent,
	painters = setmetatable({}, { __mode = "k" }),
	ROW_FULL = 54,
	ROW_SLIM = 38,
	rowHeight = function(arg)
		return arg and arg ~= "" and tbl12.ROW_FULL or tbl12.ROW_SLIM
	end,
	card = function(arg, arg2, arg3)
		local right = arg3.right or 16
		local flag3 = arg3.desc and arg3.desc ~= ""
		local v3 = tbl12.rowHeight(arg3.desc)

		local TextButton = tbl5.make("TextButton", {
			Name = arg3.title or "Card",
			Text = "",
			AutoButtonColor = false,
			BackgroundColor3 = tbl2.white,
			BackgroundTransparency = 0.95,
			Size = UDim2.new(1, 0, 0, v3),
			ClipsDescendants = true,
			LayoutOrder = arg2,
		}, arg)

		tbl5.corner(TextButton, 8)
		tbl5.stroke(TextButton, 0.9).Name = "Line"
		TextButton:SetAttribute("Card", true)
		TextButton:SetAttribute("Row", v3)

		if arg3.kind then
			TextButton:SetAttribute("Element", arg3.kind)
		end

		tbl5.image(TextButton, "Icon", arg3.icon or "circle", 18, { AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 16, 0.5, 0) })

		tbl5.text(TextButton, "Title", arg3.title, 13, tbl2.white, nil, {
			Position = UDim2.fromOffset(50, flag3 and 10 or 0),
			Size = UDim2.new(1, -(50 + right), 0, flag3 and 17 or v3),
		})

		tbl5.text(TextButton, "Subtitle", arg3.desc or "", 11, tbl2.sub, nil, { Position = UDim2.fromOffset(50, 28), Size = UDim2.new(1, -(50 + right), 0, 15), Visible = flag3 })
		return TextButton
	end,
	setDesc = function(arg, text)
		local visible = text and text ~= ""
		arg.Subtitle.Text = text or ""
		arg.Subtitle.Visible = visible
		local attribute = arg:GetAttribute("Element")
		if attribute == "Paragraph" then
			return
		end
		local v3 = tbl12.rowHeight(text)
		arg:SetAttribute("Row", v3)
		arg.Title.Position = UDim2.fromOffset(50, visible and 10 or 0)
		arg.Title.Size = UDim2.new(arg.Title.Size.X.Scale, arg.Title.Size.X.Offset, 0, visible and 17 or v3)

		if attribute == "Slider" then
			tbl12.layoutSlider(arg, v3)
		else
			arg.Size = UDim2.new(arg.Size.X.Scale, arg.Size.X.Offset, 0, v3)
		end
	end,
	pill = function(arg, arg2, arg3)
		local v3 = tbl5.button(arg, arg2, {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -16, 0.5, 0),
			Size = UDim2.fromOffset(arg3, 28),
			BackgroundColor3 = tbl2.white,
			BackgroundTransparency = 0.92,
		})

		tbl5.corner(v3, 5)
		tbl5.stroke(v3, 0.88)
		return v3
	end,
	section = function(arg, arg2, arg3)
		local v3 = tbl5.text(arg, "Section", arg3, 13, tbl2.white, Enum.FontWeight.SemiBold, { Size = UDim2.new(1, 0, 0, 30), TextYAlignment = Enum.TextYAlignment.Bottom, LayoutOrder = arg2 })
		tbl5.make("UIPadding", { PaddingBottom = UDim.new(0, 4), PaddingLeft = UDim.new(0, 2) }, v3)
		return v3
	end,
	separator = function(arg, arg2, arg3)
		if not arg3 or arg3 == "" then
			return (tbl5.make("Frame", {
				Name = "Separator",
				BackgroundColor3 = tbl2.white,
				BackgroundTransparency = 0.88,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				LayoutOrder = arg2,
			}, arg))
		end

		local v3 = tbl5.text(arg, "Separator", arg3, 13, tbl2.white, Enum.FontWeight.SemiBold, {
			Size = UDim2.new(1, 0, 0, 30),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Bottom,
			LayoutOrder = arg2,
		})

		tbl5.make("UIPadding", { PaddingBottom = UDim.new(0, 4), PaddingLeft = UDim.new(0, 2) }, v3)
		return v3
	end,
	toggle = function(arg, arg2, arg3)
		local v3 = tbl12.card(arg, arg2, { kind = "Toggle", title = arg3.title, desc = arg3.desc, icon = arg3.icon or "toggle-right", right = 100 })

		local v4 = tbl5.button(v3, "Toggle", {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -16, 0.5, 0),
			Size = UDim2.fromOffset(40, 20),
			BackgroundColor3 = tbl12.accent,
			BackgroundTransparency = 1,
		})

		tbl5.corner(v4, UDim.new(1, 0))
		tbl5.stroke(v4, 0.35)

		tbl5.corner(tbl5.make("Frame", {
			Name = "Knob",
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 5, 0.5, 0),
			Size = UDim2.fromOffset(10, 10),
			BackgroundColor3 = tbl2.white,
			BorderSizePixel = 0,
		}, v4), UDim.new(1, 0))

		tbl5.text(v3, "State", "Off", 12, tbl2.white, nil, {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -66, 0.5, 0),
			Size = UDim2.fromOffset(30, 18),
			TextXAlignment = Enum.TextXAlignment.Right,
		})

		v3:SetAttribute("Value", arg3.default == true)
		return v3
	end,
	layoutSlider = function(arg, arg2)
		local attribute = arg2 or arg:GetAttribute("Row") or tbl12.ROW_FULL
		arg.Size = UDim2.new(1, 0, 0, attribute + 22)
		arg.Icon.Position = UDim2.new(0, 16, 0, attribute / 2)
		local track = arg:FindFirstChild("Track")

		if track then
			track.Position = UDim2.fromOffset(50, attribute + 4)
		end

		local amount = arg:FindFirstChild("Amount")

		if amount then
			amount.Position = UDim2.new(1, -16, 0, attribute + 4)
		end

		local bubble = arg:FindFirstChild("Bubble")

		if bubble then
			bubble.Position = UDim2.fromOffset(50, attribute - 8)
		end
	end,
	slider = function(arg, arg2, arg3)
		local v3 = tbl12.card(arg, arg2, {
			kind = "Slider",
			title = arg3.title,
			desc = arg3.desc,
			icon = arg3.icon or "sliders-horizontal",
			right = 16,
		})

		local v4 = tbl12.rowHeight(arg3.desc)

		local Frame2 = tbl5.make("Frame", {
			Name = "Track",
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromOffset(50, v4 + 4),
			Size = UDim2.new(1, -134, 0, 4),
			BackgroundColor3 = tbl2.white,
			BackgroundTransparency = 0.8,
			BorderSizePixel = 0,
		}, v3)

		tbl5.corner(Frame2, UDim.new(1, 0))
		local udim = UDim.new
		tbl5.corner(tbl5.make("Frame", { Name = "Fill", Size = UDim2.fromScale(0, 1), BackgroundColor3 = tbl12.accent, BorderSizePixel = 0 }, Frame2), udim(1, 0))

		local v5 = tbl5.button(Frame2, "Knob", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0, 0.5),
			Size = UDim2.fromOffset(16, 16),
			BackgroundColor3 = tbl2.knob,
			BackgroundTransparency = 0,
			ZIndex = 3,
		})

		tbl5.corner(v5, UDim.new(1, 0))
		local udim2 = UDim.new

		tbl5.corner(tbl5.make("Frame", {
			Name = "Halo",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(16, 16),
			BackgroundColor3 = tbl12.accent,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 2,
		}, v5), udim2(1, 0))

		local udim3 = UDim.new

		tbl5.corner(tbl5.make("Frame", {
			Name = "Dot",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(8, 8),
			BackgroundColor3 = tbl12.accent,
			BorderSizePixel = 0,
			ZIndex = 4,
		}, v5), udim3(1, 0))

		tbl5.text(v3, "Amount", "", 12, tbl2.white, nil, {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -16, 0, v4 + 4),
			Size = UDim2.fromOffset(64, 18),
			TextXAlignment = Enum.TextXAlignment.Right,
		})

		local Frame3 = tbl5.make("Frame", {
			Name = "Bubble",
			AnchorPoint = Vector2.new(0.5, 1),
			Position = UDim2.fromOffset(50, v4 - 8),
			Size = UDim2.fromOffset(52, 22),
			BackgroundColor3 = Color3.fromRGB(52, 52, 56),
			BorderSizePixel = 0,
			Visible = false,
			ZIndex = 5,
		}, v3)

		tbl5.corner(Frame3, 6)
		tbl5.stroke(Frame3, 0.85)
		tbl5.make("UIScale", { Scale = 0 }, Frame3)
		tbl5.text(Frame3, "Label", "", 11, tbl2.white, Enum.FontWeight.SemiBold, { Size = UDim2.fromScale(1, 1), TextXAlignment = Enum.TextXAlignment.Center, ZIndex = 6 })
		tbl12.layoutSlider(v3, v4)
		v3:SetAttribute("Min", arg3.min or 0)
		v3:SetAttribute("Max", arg3.max or 100)
		v3:SetAttribute("Rounding", arg3.rounding or 0)
		v3:SetAttribute("Suffix", arg3.suffix or "")
		v3:SetAttribute("Value", arg3.default or arg3.min or 0)
		return v3
	end,
	fraction = function(arg)
		local attribute = arg:GetAttribute("Min") or 0
		local attribute2 = arg:GetAttribute("Max") or 1
		local attribute3 = arg:GetAttribute("Value") or attribute
		return attribute2 > attribute and math.clamp((attribute3 - attribute) / (attribute2 - attribute), 0, 1) or 0, attribute3
	end,
	format = function(arg, arg2)
		local attribute = arg:GetAttribute("Rounding") or 0
		return (attribute <= 0 and string.format("%d", math.floor(arg2 + 0.5)) or string.format("%." .. attribute .. "f", arg2)) .. (arg:GetAttribute("Suffix") or "")
	end,
	dropdown = function(arg, arg2, arg3)
		local v3 = tbl12.card(arg, arg2, { kind = "Dropdown", title = arg3.title, desc = arg3.desc, icon = arg3.icon or "list", right = 150 })
		local v4 = tbl12.pill(v3, "Pill", 120)
		tbl5.text(v4, "Value", "", 12, tbl2.white, nil, { Position = UDim2.fromOffset(12, 0), Size = UDim2.new(1, -36, 1, 0) })
		tbl5.image(v4, "Arrow", "chevron-down", 12, { AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -10, 0.5, 0), ImageColor3 = tbl2.sub })
		return v3
	end,
	keybind = function(arg, arg2, arg3)
		local v3 = tbl12.card(arg, arg2, { kind = "Keybind", title = arg3.title, desc = arg3.desc, icon = arg3.icon or "keyboard", right = 120 })
		local white = tbl2.white
		local medium = Enum.FontWeight.Medium
		tbl5.text(tbl12.pill(v3, "Key", 84), "Value", "", 12, white, medium, { Size = UDim2.fromScale(1, 1), TextXAlignment = Enum.TextXAlignment.Center })
		v3:SetAttribute("Value", arg3.default or "None")
		return v3
	end,
	button = function(arg, arg2, arg3)
		local v3 = tbl12.card(arg, arg2, {
			kind = "Button",
			title = arg3.title,
			desc = arg3.desc,
			icon = arg3.icon or "mouse-pointer-click",
			right = 120,
		})

		local v4 = tbl12.pill(v3, "Action", 84)
		v4.BackgroundColor3 = tbl12.accent
		v4.BackgroundTransparency = 0
		v4:FindFirstChildOfClass("UIStroke").Transparency = 1
		tbl5.text(v4, "Label", arg3.label or "Run", 12, tbl2.black, Enum.FontWeight.SemiBold, { Size = UDim2.fromScale(1, 1), TextXAlignment = Enum.TextXAlignment.Center })
		v3:SetAttribute("Clicks", 0)
		return v3
	end,
	input = function(arg, arg2, arg3)
		local v3 = tbl12.card(arg, arg2, {
			kind = "Input",
			title = arg3.title,
			desc = arg3.desc,
			icon = arg3.icon or "text-cursor-input",
			right = 160,
		})

		local v4 = tbl12.pill(v3, "Field", 130)

		tbl5.make("TextBox", {
			Name = "Box",
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(10, 0),
			Size = UDim2.new(1, -20, 1, 0),
			FontFace = tbl5.font(),
			TextSize = 12,
			TextColor3 = tbl2.white,
			PlaceholderText = arg3.placeholder or "Type here...",
			PlaceholderColor3 = tbl2.sub,
			Text = arg3.default or "",
			TextXAlignment = Enum.TextXAlignment.Left,
			ClearTextOnFocus = false,
			ClipsDescendants = true,
		}, v4)

		tbl5.make("Frame", {
			Name = "Line",
			AnchorPoint = Vector2.new(0.5, 1),
			Position = UDim2.new(0.5, 0, 1, 0),
			Size = UDim2.new(0, 0, 0, 2),
			BackgroundColor3 = tbl12.accent,
			BorderSizePixel = 0,
		}, v4)

		v3:SetAttribute("Value", arg3.default or "")
		return v3
	end,
	paragraph = function(arg, arg2, arg3)
		local v3 = tbl12.card(arg, arg2, { kind = "Paragraph", title = arg3.title, icon = arg3.icon or "align-left", right = 16 })
		local subtitle = v3.Subtitle
		v3.Icon.Position = UDim2.new(0, 16, 0.5, 0)
		v3.Title.Position = UDim2.fromOffset(50, 10)
		v3.Title.Size = UDim2.new(1, -66, 0, 17)
		subtitle.Visible = true
		subtitle.Text = arg3.content or ""
		subtitle.Position = UDim2.fromOffset(50, 28)
		subtitle.TextWrapped = true
		subtitle.TextTruncate = Enum.TextTruncate.None
		subtitle.TextYAlignment = Enum.TextYAlignment.Top
		subtitle.LineHeight = 1.15
		subtitle.Size = UDim2.new(1, -66, 0, 15)
		v3.Size = UDim2.new(1, 0, 0, tbl12.ROW_FULL)
		v3:SetAttribute("Row", tbl12.ROW_FULL)
		local n5 = -1
		local v4 = nil
		local v5 = nil

		local function fn33()
			local x = subtitle.AbsoluteSize.X
			if x < 1 or x == n5 and subtitle.Text == v4 then
				return
			end
			local text = subtitle.Text
			n5 = x
			v4 = text
			local tbl13 = {}
			v5 = tbl13

			task.spawn(function()
				local getTextBoundsParams = Instance.new("GetTextBoundsParams")
				getTextBoundsParams.Text = subtitle.Text
				getTextBoundsParams.Font = subtitle.FontFace
				getTextBoundsParams.Size = subtitle.TextSize
				getTextBoundsParams.Width = x
				local ok, result = pcall(tbl.Text.GetTextBoundsAsync, tbl.Text, getTextBoundsParams)
				if v5 ~= tbl13 or not v3.Parent then
					return
				end
				local n6 = math.max(math.ceil((ok and result.Y or subtitle.TextSize) * subtitle.LineHeight) + 2, 15)
				subtitle.Size = UDim2.new(1, -66, 0, n6)
				v3.Size = UDim2.new(1, 0, 0, math.max(28 + n6 + 11, tbl12.ROW_FULL))
			end)
		end

		subtitle:GetPropertyChangedSignal("Text"):Connect(fn33)
		subtitle:GetPropertyChangedSignal("AbsoluteSize"):Connect(fn33)
		task.defer(fn33)
		return v3
	end,
	link = function(arg, arg2, arg3)
		local v3 = tbl12.card(arg, arg2, { kind = "Link", title = arg3.title, desc = arg3.desc, icon = arg3.icon or "folder", right = 40 })
		tbl5.image(v3, "Chevron", "chevron-right", 14, { AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -16, 0.5, 0), ImageColor3 = tbl2.sub })
		return v3
	end,
	bind = {},
	hover = function(arg)
		local backgroundTransparency = nil

		arg.MouseEnter:Connect(function()
			backgroundTransparency = backgroundTransparency or arg.BackgroundTransparency
			tbl5.tween(arg, 0.2, { BackgroundTransparency = math.max(backgroundTransparency - 0.04, 0) })
		end)

		arg.MouseLeave:Connect(function()
			if backgroundTransparency then
				tbl5.tween(arg, 0.2, { BackgroundTransparency = backgroundTransparency })
			end
		end)

		arg:GetAttributeChangedSignal("BaseTransparency"):Connect(function()
			backgroundTransparency = arg:GetAttribute("BaseTransparency")
		end)
	end,
}

tbl12.bind.Toggle = function(arg)
	local toggle = arg.Toggle
	local knob = toggle.Knob
	local uiStroke = toggle:FindFirstChildOfClass("UIStroke")
	local state = arg.State
	local flag3 = arg:GetAttribute("Value") == true
	local t = toggle.Size.Y.Offset - 8
	local v3 = tbl6.spring(flag3 and 1 or 0, 260, 20)
	local v4 = tbl6.spring(flag3 and 1 or 0, 160, 24)
	local v5 = tbl6.spring(t, 420, 26)
	local v6 = tbl6.spring(0, 420, 30)

	local function fn33()
		local offset = toggle.Size.X.Offset
		local offset2 = toggle.Size.Y.Offset
		local n5 = v6.x * 5
		local n6 = math.clamp(math.abs(v3.v) * 1.1, 0, 8) + n5
		local n7 = math.clamp(v5.x - math.clamp(math.abs(v3.v) * 0.25, 0, 2), 4, offset2 - 4)
		local n8 = math.min(n7 + n6, offset - 8)
		local n9 = (offset2 - n7) / 2
		local n10 = math.clamp(v4.x, 0, 1)
		knob.Size = UDim2.fromOffset(n8, n7)
		knob.Position = UDim2.new(0, n9 + (offset - n9 * 2 - n8) * math.clamp(v3.x, 0, 1), 0.5, 0)
		knob.BackgroundColor3 = tbl2.white:Lerp(tbl2.black, n10)
		toggle.BackgroundColor3 = tbl12.accent
		toggle.BackgroundTransparency = 1 - n10
		uiStroke.Transparency = 0.35 + 0.65 * n10
	end

	local function fn34(arg2)
		local v7 = table.pack(tbl6.step(v3, arg2))
		local v8 = table.pack(tbl6.step(v4, arg2))
		local v9 = table.pack(tbl6.step(v5, arg2))
		local v10 = table.pack(tbl6.step(v6, arg2))
		fn33()
		local v11, v12, v13

		if v7[1] then
			v11 = v8[1]
			v12 = v9[1]
			v13 = v10[1]
		else
			v11 = v7[1]
			v12 = v9[1]
			v13 = v10[1]
		end

		return v11 and v12 and v13
	end

	local function fn35()
		if arg:GetAttribute("Locked") then
			return
		end
		arg:SetAttribute("Value", not arg:GetAttribute("Value"))
	end

	toggle.Activated:Connect(fn35)
	arg.Activated:Connect(fn35)

	for _, v7 in ipairs({ arg, toggle }) do
		v7.MouseButton1Down:Connect(function()
			local v8 = v5
			local t2 = t + 2
			v6.t = 1
			v8.t = t2
			tbl6.run(fn34)
		end)

		v7.MouseButton1Up:Connect(function()
			v6.t = 0
			tbl6.run(fn34)
		end)
	end

	arg.MouseEnter:Connect(function()
		v5.t = t + 2
		tbl6.run(fn34)
	end)

	arg.MouseLeave:Connect(function()
		local v7 = v6
		v5.t = t
		v7.t = 0
		tbl6.run(fn34)
	end)

	arg:GetAttributeChangedSignal("Value"):Connect(function()
		local flag4 = arg:GetAttribute("Value") == true
		local v7 = v3
		local v8 = v4
		local t2 = flag4 and 1 or 0
		local t3 = flag4 and 1 or 0
		v7.t = t2
		v8.t = t3
		local v9 = v3
		v9.v = v9.v + (flag4 and 3 or -3)
		state.Text = flag4 and "On" or "Off"
		tbl6.run(fn34)
	end)

	tbl12.painters[arg] = fn33
	state.Text = flag3 and "On" or "Off"
	fn33()
end

tbl12.bind.Slider = function(arg)
	local track = arg.Track
	local fill = track.Fill
	local knob = track.Knob
	local dot = knob.Dot
	local halo = knob.Halo
	local bubble = arg.Bubble
	local uiScale = bubble:FindFirstChildOfClass("UIScale")
	local offset = track.Size.Y.Offset
	local v3 = tbl6.spring(tbl12.fraction(arg), 380, 34)
	local v4 = tbl6.spring(16, 380, 24)
	local v5 = tbl6.spring(8, 420, 22)
	local v6 = tbl6.spring(offset, 300, 26)
	local v7 = tbl6.spring(0, 320, 20)
	local v8 = tbl6.spring(0, 200, 24)
	local flag3 = false
	local flag4 = false

	local function fn33()
		local n5 = math.clamp(v3.x, 0, 1)
		fill.Size = UDim2.fromScale(n5, 1)
		fill.BackgroundColor3 = tbl12.accent
		knob.Position = UDim2.fromScale(n5, 0.5)
		knob.Size = UDim2.fromOffset(v4.x, v4.x)
		track.Size = UDim2.new(track.Size.X.Scale, track.Size.X.Offset, 0, v6.x)
		dot.Size = UDim2.fromOffset(v5.x, v5.x)
		dot.BackgroundColor3 = tbl12.accent
		local n6 = v4.x + 14 * v8.x
		halo.Size = UDim2.fromOffset(n6, n6)
		halo.BackgroundColor3 = tbl12.accent
		halo.BackgroundTransparency = 1 - 0.3 * v8.x
		bubble.Position = UDim2.fromOffset(track.AbsolutePosition.X - arg.AbsolutePosition.X + track.AbsoluteSize.X * n5, track.Position.Y.Offset - 12)
		bubble.Visible = v7.x > 0.02
		uiScale.Scale = math.max(v7.x, 0)
		bubble.Label.Text = tbl12.format(arg, arg:GetAttribute("Value") or 0)
	end

	local function fn34()
		error("devirt: storing a non-empty VM table into a register (at 0:1)")
	end

	local function fn35()
		v4.t = (flag4 or flag3) and 18 or 16
		v5.t = flag3 and 11 or flag4 and 10 or 8
		v6.t = flag3 and offset + 2 or offset
		v7.t = flag3 and 1 or 0
		v8.t = flag3 and 1 or 0
		tbl6.run(fn34)
	end

	local function fn36(arg2)
		local attribute = arg:GetAttribute("Min") or 0
		local attribute2 = arg:GetAttribute("Max") or 1
		local n5 = 10 ^ (arg:GetAttribute("Rounding") or 0)
		arg:SetAttribute("Value", math.clamp(math.floor((attribute + (attribute2 - attribute) * math.clamp((arg2 - track.AbsolutePosition.X) / math.max(track.AbsoluteSize.X, 1), 0, 1)) * n5 + 0.5) / n5, attribute, attribute2))
	end

	local function fn37(input)
		if not tbl5.click(input) or arg:GetAttribute("Locked") then
			return
		end
		flag3 = true
		arg:SetAttribute("Dragging", true)
		fn36(input.Position.X)
		fn35()
	end

	knob.InputBegan:Connect(fn37)
	track.InputBegan:Connect(fn37)

	for _, v9 in ipairs({ knob, track }) do
		v9.MouseEnter:Connect(function()
			flag4 = true
			fn35()
		end)

		v9.MouseLeave:Connect(function()
			flag4 = false
			fn35()
		end)
	end

	tbl7:Connect(tbl.UIS.InputChanged, function(arg2)
		if flag3 and tbl5.move(arg2) then
			fn36(arg2.Position.X)
		end
	end)

	tbl7:Connect(tbl.UIS.InputEnded, function(arg2)
		if not flag3 or not tbl5.click(arg2) then
			return
		end
		flag3 = false
		fn35()
		arg:SetAttribute("Dragging", false)
	end)

	arg:GetAttributeChangedSignal("Value"):Connect(function()
		v3.t = tbl12.fraction(arg)
		arg.Amount.Text = tbl12.format(arg, arg:GetAttribute("Value"))
		tbl6.run(fn34)
	end)

	tbl12.painters[arg] = fn33
	arg.Amount.Text = tbl12.format(arg, arg:GetAttribute("Value"))
	fn33()
end

tbl12.openFlyout = nil

tbl12.flyout = function(arg, arg2, arg3)
	if tbl12.openFlyout then
		tbl12.openFlyout(true)
	end

	local n5 = 32
	local tbl13 = string.split(arg:GetAttribute("Options") or "", "\31")

	if arg:GetAttribute("Options") == "" then
		tbl13 = {}
	end

	local tbl14 = {}
	local v3 = ipairs
	local split = string.split
	local attribute = arg:GetAttribute("Value") or ""

	for _, v4 in v3(split(attribute, "\31")) do
		tbl14[v4] = true
	end

	local n6 = 1

	for i, v4 in ipairs(tbl13) do
		if tbl14[v4] then
			n6 = i
			break
		end
	end

	local n7 = math.min(#tbl13, 8)
	local n8 = math.max(arg2.AbsoluteSize.X + 24, 160)
	local n9 = 8 + n7 * n5
	local n10 = arg2.AbsolutePosition - ScreenGui.AbsolutePosition
	local n11 = math.min(n6, n7)
	local n12 = math.clamp(n10.Y + arg2.AbsoluteSize.Y / 2 - 4 + (n11 - 1) * n5 + n5 / 2, 8, math.max(ScreenGui.AbsoluteSize.Y - n9 - 8, 8))
	local n13 = math.clamp(n10.X - 12, 8, math.max(ScreenGui.AbsoluteSize.X - n8 - 8, 8))
	local n14 = n12 + 4 + (n11 - 1) * n5
	local Frame2 = tbl5.make("Frame", { Name = "Flyout", BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), ZIndex = 150 }, ScreenGui)
	local v4 = tbl5.button(Frame2, "Blocker", { Size = UDim2.fromScale(1, 1), ZIndex = 150 })
	local tbl15 = {}

	for _, descendant in ipairs(ScreenGui:GetDescendants()) do
		if descendant:IsA("ScrollingFrame") and descendant.ScrollingEnabled and not descendant:IsDescendantOf(Frame2) then
			descendant.ScrollingEnabled = false
			tbl15[#tbl15 + 1] = descendant
		end
	end

	local v5 = tbl5.corner(tbl5.make("Frame", {
		Name = "Box",
		BackgroundColor3 = Color3.fromRGB(44, 44, 48),
		BackgroundTransparency = 0.07,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ZIndex = 151,
	}, Frame2), 8)

	local ScrollingFrame = tbl5.make("ScrollingFrame", {
		Name = "List",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromOffset(n8, n9),
		CanvasSize = UDim2.fromOffset(0, 8 + #tbl13 * n5),
		ScrollBarThickness = #tbl13 > n7 and 2 or 0,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ZIndex = 151,
	}, v5)

	local v6 = tbl5.corner(tbl5.make("Frame", { Name = "Edge", BackgroundTransparency = 1, ZIndex = 155 }, Frame2), 8)
	local v7 = tbl5.stroke(v6, 1)
	local flag3 = false
	local v8 = tbl6.spring(0, 300, 32)
	local tbl16 = {}

	local function fn33(arg4, arg5)
		tbl5.tween(arg4, 0.2, { BackgroundTransparency = arg5 and (arg4:GetAttribute("On") or 0.9) or arg4:GetAttribute("Off") or 1 })
		tbl5.tween(arg4.Pick, 0.3, { Size = UDim2.fromOffset(3, arg5 and 16 or 0) }, Enum.EasingStyle.Back)
	end

	for i, v9 in ipairs(tbl13) do
		local v10 = tbl5.button(ScrollingFrame, v9, {
			BackgroundColor3 = tbl2.white,
			BackgroundTransparency = tbl14[v9] and 0.9 or 1,
			Position = UDim2.fromOffset(4, 4 + (i - 1) * n5),
			Size = UDim2.fromOffset(n8 - 8 - 2, n5 - 2),
			ZIndex = 152,
		})

		v10:SetAttribute("On", 0.9)
		v10:SetAttribute("Off", 1)
		tbl5.corner(v10, 5)
		local corner = tbl5.corner
		local make = tbl5.make

		corner(make("Frame", {
			Name = "Pick",
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 0, 0.5, 0),
			Size = UDim2.fromOffset(3, tbl14[v9] and 16 or 0),
			BackgroundColor3 = tbl12.accent,
			BorderSizePixel = 0,
			ZIndex = 153,
		}, v10), UDim.new(1, 0))

		tbl5.text(v10, "Label", v9, 12, tbl2.white, nil, { Position = UDim2.fromOffset(14, 0), Size = UDim2.new(1, -20, 1, 0), ZIndex = 153 })
		tbl16[i] = v10
	end

	if tbl12.flyoutHook then
		tbl12.flyoutHook(v5, tbl16, tbl14)
	end

	for i, v9 in ipairs(tbl16) do
		v9.MouseEnter:Connect(function()
			if not tbl14[tbl13[i]] then
				tbl5.tween(v9, 0.2, { BackgroundTransparency = (v9:GetAttribute("Off") or 1) - 0.04 })
			end
		end)

		v9.MouseLeave:Connect(function()
			if not tbl14[tbl13[i]] then
				tbl5.tween(v9, 0.2, { BackgroundTransparency = v9:GetAttribute("Off") or 1 })
			end
		end)
	end

	local function fn34()
		local n15 = math.clamp(v8.x, 0, 1.2)
		local n16 = n14 + (n12 - n14) * math.min(n15, 1)
		local n17 = n5 + (n9 - n5) * n15
		v5.Position = UDim2.fromOffset(n13, n16)
		v5.Size = UDim2.fromOffset(n8, math.max(n17, 1))
		ScrollingFrame.Position = UDim2.fromOffset(0, n12 - n16)
		local n18 = math.clamp(n15 * 2.5, 0, 1)
		v5.Visible = n18 > 0.01
		local v9 = v6
		local size2 = v5.Size
		v6.Position = v5.Position
		v9.Size = size2
		v7.Transparency = 1 - 0.14 * n18
	end

	local function fn35(arg4)
		local v9 = table.pack(tbl6.step(v8, arg4))
		fn34()
		local v10, flag4

		if flag3 then
			v10 = v9[1]
			flag4 = v8.x < 0.03
		else
			v10 = v9[1]
			flag4 = flag3
		end

		if flag4 then
			Frame2:Destroy()
			return true
		end
		return v10
	end

	local openFlyout = nil

	openFlyout = function(arg4)
		if flag3 then
			return
		end
		flag3 = true

		for _, v9 in ipairs(tbl15) do
			v9.ScrollingEnabled = true
		end

		if tbl12.openFlyout == openFlyout then
			tbl12.openFlyout = nil
		end

		tbl5.tween(arg2.Arrow, 0.35, { Rotation = 0 })
		glass.remove(v5)

		for _, v9 in ipairs(tbl16) do
			glass.remove(v9)
		end

		if arg4 then
			Frame2:Destroy()
			return
		end
		v8.t = 0
		local v9 = v8
		v8.k = 520
		v9.d = 44
		tbl6.run(fn35)
	end

	for i, v9 in ipairs(tbl16) do
		v9.Activated:Connect(function()
			if flag3 then
				return
			end
			local v10 = tbl13[i]

			if arg3 then
				tbl14[v10] = not tbl14[v10] or nil
				fn33(v9, tbl14[v10])
				local tbl17 = {}

				for _, v11 in ipairs(tbl13) do
					if tbl14[v11] then
						tbl17[#tbl17 + 1] = v11
					end
				end

				arg:SetAttribute("Value", table.concat(tbl17, "\31"))
			else
				for i2, v11 in ipairs(tbl16) do
					if i2 ~= i and tbl14[tbl13[i2]] then
						fn33(v11, false)
					end
				end

				tbl14 = { [v10] = true }
				fn33(v9, true)
				arg:SetAttribute("Value", v10)
				task.delay(0.1, openFlyout)
			end
		end)
	end

	v4.Activated:Connect(function()
		openFlyout()
	end)

	tbl12.openFlyout = openFlyout
	tbl5.tween(arg2.Arrow, 0.35, { Rotation = 180 })
	v8.t = 1
	fn34()
	tbl6.run(fn35)
	return openFlyout
end

tbl12.bind.Dropdown = function(arg)
	local pill = arg.Pill
	local v3 = nil

	local function fn33()
		local v4 = string.gsub(arg:GetAttribute("Value") or "", "\31", ", ")
		pill.Value.Text = v4 == "" and "--" or v4
	end

	local function fn34()
		if arg:GetAttribute("Locked") then
			return
		end

		if v3 and tbl12.openFlyout == v3 then
			v3()
			v3 = nil
		elseif not tbl12.openFlyout then
			v3 = tbl12.flyout(arg, pill, arg:GetAttribute("Multi") == true)
		end
	end

	pill.Activated:Connect(fn34)
	arg.Activated:Connect(fn34)
	arg:GetAttributeChangedSignal("Value"):Connect(fn33)

	arg.AncestryChanged:Connect(function()
		if v3 and tbl12.openFlyout == v3 then
			v3(true)
		end
	end)

	fn33()
end

tbl12.bind.Keybind = function(arg)
	local key = arg.Key
	local flag3 = false

	local function fn33()
		key.Value.Text = flag3 and "..." or tostring(arg:GetAttribute("Value"))
		tbl5.tween(key, 0.2, { BackgroundColor3 = flag3 and tbl12.accent or tbl2.white, BackgroundTransparency = flag3 and 0.75 or 0.92 })
	end

	key.Activated:Connect(function()
		if arg:GetAttribute("Locked") then
			return
		end
		flag3 = true
		fn33()
		local uiScale = key:FindFirstChildOfClass("UIScale") or tbl5.make("UIScale", {}, key)
		uiScale.Scale = 0.9
		tbl5.tween(uiScale, 0.35, { Scale = 1 }, Enum.EasingStyle.Back)
	end)

	tbl7:Connect(tbl.UIS.InputBegan, function(arg2)
		if flag3 then
			local name

			if arg2.UserInputType == Enum.UserInputType.Keyboard then
				name = arg2.KeyCode.Name
			else
				if arg2.UserInputType == Enum.UserInputType.MouseButton1 then
					return
				end
				name = nil

				if arg2.UserInputType == Enum.UserInputType.MouseButton2 then
					name = "MouseRight"
				end
			end

			if not name then
				return
			end
			flag3 = false

			if name == "Backspace" then
				arg:SetAttribute("Value", "None")
			elseif name ~= "Escape" then
				arg:SetAttribute("Value", name)
			end

			fn33()
			return
		end

		if tbl.UIS:GetFocusedTextBox() then
			return
		end
		local attribute = arg:GetAttribute("Value")

		if arg2.UserInputType == Enum.UserInputType.Keyboard and arg2.KeyCode.Name == attribute or attribute == "MouseRight" and arg2.UserInputType == Enum.UserInputType.MouseButton2 then
			arg:SetAttribute("Pressed", (arg:GetAttribute("Pressed") or 0) + 1)
		end
	end)

	arg:GetAttributeChangedSignal("Value"):Connect(fn33)
	tbl12.painters[arg] = fn33
	fn33()
end

tbl12.bind.Button = function(arg)
	local action = arg.Action
	local size2 = action.Size

	local function fn33()
		if arg:GetAttribute("Locked") then
			return
		end
		arg:SetAttribute("Clicks", (arg:GetAttribute("Clicks") or 0) + 1)
		action.BackgroundColor3 = tbl2.white
		tbl5.tween(action, 0.35, { BackgroundColor3 = tbl12.accent })
	end

	action.MouseButton1Down:Connect(function()
		tbl5.tween(action, 0.2, { Size = size2 - UDim2.fromOffset(4, 3) })
	end)

	action.MouseButton1Up:Connect(function()
		tbl5.tween(action, 0.35, { Size = size2 }, Enum.EasingStyle.Back)
	end)

	action.MouseLeave:Connect(function()
		tbl5.tween(action, 0.35, { Size = size2 }, Enum.EasingStyle.Back)
	end)

	action.Activated:Connect(fn33)
	arg.Activated:Connect(fn33)

	tbl12.painters[arg] = function()
		action.BackgroundColor3 = tbl12.accent
	end
end

tbl12.bind.Input = function(arg)
	local field = arg.Field
	local box = field.Box
	local line = field.Line

	box.Focused:Connect(function()
		tbl5.tween(line, 0.35, { Size = UDim2.new(1, -8, 0, 2) })
		tbl5.tween(field, 0.2, { BackgroundTransparency = 0.88 })
	end)

	box.FocusLost:Connect(function()
		tbl5.tween(line, 0.35, { Size = UDim2.new(0, 0, 0, 2) })
		tbl5.tween(field, 0.2, { BackgroundTransparency = 0.92 })

		if arg:GetAttribute("Finished") then
			arg:SetAttribute("Value", box.Text)
		end
	end)

	box:GetPropertyChangedSignal("Text"):Connect(function()
		local text = box.Text
		if arg:GetAttribute("Numeric") and text ~= "" and text ~= "-" and not tonumber(text) then
			box.Text = arg:GetAttribute("Value") or ""
			return
		end
		local attribute = arg:GetAttribute("MaxLength")
		if attribute and #text > attribute then
			box.Text = string.sub(text, 1, attribute)
			return
		end

		if not arg:GetAttribute("Finished") then
			arg:SetAttribute("Value", text)
		end
	end)

	arg.Activated:Connect(function()
		box:CaptureFocus()
	end)

	arg:GetAttributeChangedSignal("Value"):Connect(function()
		if box.Text ~= arg:GetAttribute("Value") then
			box.Text = arg:GetAttribute("Value")
		end
	end)

	tbl12.painters[arg] = function()
		line.BackgroundColor3 = tbl12.accent
	end
end

tbl12.setAccent = function(accent)
	tbl12.accent = accent

	for _, painter in pairs(tbl12.painters) do
		pcall(painter)
	end
end

tbl12.closeFlyouts = function()
	if tbl12.openFlyout then
		tbl12.openFlyout(true)
	end
end

tbl12.SEP = "\31"
local index = {}
index.__index = index

index.new = function(arg, arg2, arg3, arg4)
	return setmetatable({ Window = arg, Page = arg2, Scroll = arg3, Base = arg4 or 0, Count = 0, Sections = 0 }, index)
end

index.Next = function(arg)
	arg.Count = arg.Count + 1
	if not arg.Parent and arg.Sections > 0 then
		return arg.Sections * 10000 + 5000 + arg.Count
	end
	return arg.Base + arg.Count
end

local function fn33(arg, arg2)
	if type(arg) == "table" then
		local id = arg.Id

		if id then
			arg2 = arg
			arg = id
		else
			arg2 = arg
			arg = arg.Flag
		end
	end

	return arg, arg2 or {}
end

local function fn34(arg, arg2, arg3, arg4)
	arg.Value = arg3()

	arg2:GetAttributeChangedSignal(arg4 or "Value"):Connect(function()
		local v3 = arg3()
		if tbl5.same(v3, arg.Value) then
			return
		end
		arg.Value = v3
		if arg.Silent then
			arg.Silent = false
			return
		end
		arg.Fired = true
		tbl7:SafeCallback(arg.Callback, v3)
		tbl7:SafeCallback(arg.Changed, v3)
		tbl7:Dirty()
	end)
end

local function fn35(arg, id, arg2, card, arg3)
	arg2.Card = card
	arg2.Title = arg3.Title
	arg2.Window = arg.Window

	arg2.SetTitle = function(arg4, text)
		card.Title.Text = text or ""
	end

	arg2.SetDesc = function(arg4, arg5)
		tbl12.setDesc(card, arg5)
	end

	arg2.SetVisible = function(arg4, arg5)
		card.Visible = arg5 ~= false
	end

	arg2.OnChanged = function(arg4, changed)
		arg2.Changed = changed
		tbl7:SafeCallback(changed, arg2.Value)
	end

	arg2.Destroy = function()
		(card.Parent and card.Parent:GetAttribute("Slot") and card.Parent or card):Destroy()

		if id then
			tbl7.Options[id] = nil
		end
	end

	local setValue = arg2.SetValue

	if setValue then
		arg2.SetValue = function(arg4, arg5, arg6, ...)
			if arg6 == true then
				arg2.Silent = true
			end

			local v3 = table.pack(...)
			local v4 = setValue
			local v5 = arg2
			v3.n = 4 + v3.n - 1
			table.move(v3, 1, v3.n, 4, v3)
			v3[1] = v5
			v3[2] = arg5
			v3[3] = arg6
			return v4(table.unpack(v3, 1, v3.n))
		end
	end

	if id then
		arg2.Id = id
		tbl7.Options[id] = arg2
	end

	arg.Window:Adopt(card)

	if id then
		tbl7:ApplyPending(id, arg2)
	end

	return arg2
end

local function fn36(arg)
	task.defer(function()
		if arg.Fired or arg.Value == nil or arg.Value == false then
			return
		end
		tbl7:SafeCallback(arg.Callback, arg.Value)
	end)
end

index.AddSection = function(arg, arg2)
	local parent = arg.Parent or arg
	parent.Sections = parent.Sections + 1
	local v3 = index.new(arg.Window, arg.Page, arg.Scroll, parent.Sections * 10000)
	v3.Parent = parent
	v3.Header = tbl12.section(arg.Scroll, v3.Base, arg2 or "Section")
	return v3
end

index.AddSeparator = function(arg, arg2)
	local title = type(arg2) == "table" and (arg2.Title or arg2.Text) or arg2
	return tbl12.separator(arg.Scroll, arg:Next(), title)
end

index.AddDivider = index.AddSeparator

index.AddToggle = function(arg, arg2, arg3)
	local v3, v4 = fn33(arg2, arg3)
	local tbl13 = { title = v4.Title, desc = v4.Description, icon = v4.Icon, default = v4.Default }
	local v5 = tbl12.toggle(arg.Scroll, arg:Next(), tbl13)
	local tbl14 = { Type = "Toggle", Callback = v4.Callback }

	fn34(tbl14, v5, function()
		return v5:GetAttribute("Value") == true
	end)

	tbl14.SetValue = function(arg4, arg5)
		v5:SetAttribute("Value", arg5 == true)
	end

	fn35(arg, v3, tbl14, v5, v4)

	if v4.Default then
		fn36(tbl14)
	end

	return tbl14
end

index.AddSlider = function(arg, arg2, arg3)
	local v3, v4 = fn33(arg2, arg3)

	local tbl13 = {
		title = v4.Title,
		desc = v4.Description,
		icon = v4.Icon,
		min = v4.Min,
		max = v4.Max,
		default = v4.Default,
		rounding = v4.Rounding,
		suffix = v4.Suffix,
	}

	local v5 = tbl12.slider(arg.Scroll, arg:Next(), tbl13)

	local tbl14 = {
		Type = "Slider",
		Callback = v4.Callback,
		Min = v4.Min or 0,
		Max = v4.Max or 100,
		Rounding = v4.Rounding or 0,
	}

	fn34(tbl14, v5, function()
		return v5:GetAttribute("Value")
	end)

	tbl14.SetValue = function(arg4, arg5)
		local num = tonumber(arg5)
		if not num then
			return
		end
		local n5 = 10 ^ tbl14.Rounding
		local min = tbl14.Min
		local max = tbl14.Max
		v5:SetAttribute("Value", math.clamp(math.floor(num * n5 + 0.5) / n5, min, max))
	end

	fn35(arg, v3, tbl14, v5, v4)

	if v4.Default then
		fn36(tbl14)
	end

	return tbl14
end

index.AddDropdown = function(arg, arg2, arg3)
	local v3, v4 = fn33(arg2, arg3)
	local tbl13 = { title = v4.Title, desc = v4.Description, icon = v4.Icon }
	local v5 = tbl12.dropdown(arg.Scroll, arg:Next(), tbl13)
	local tbl14 = { Type = "Dropdown", Callback = v4.Callback, Multi = v4.Multi == true, Values = v4.Values or {} }
	v5:SetAttribute("Multi", tbl14.Multi)
	v5:SetAttribute("Options", table.concat(tbl14.Values, tbl12.SEP))

	local function fn37()
		local attribute = v5:GetAttribute("Value") or ""

		if tbl14.Multi then
			local tbl15 = {}

			if attribute ~= "" then
				local v6 = ipairs
				local v7 = table.pack(string.split(attribute, tbl12.SEP))
				v7.n = 1 + v7.n - 1
				table.move(v7, 1, v7.n, 1, v7)

				for _, v8 in v6(table.unpack(v7, 1, v7.n)) do
					tbl15[v8] = true
				end
			end

			return tbl15
		end

		return attribute ~= "" and attribute or nil
	end

	tbl14.SetValues = function(arg4, values)
		tbl14.Values = values or {}
		v5:SetAttribute("Options", table.concat(tbl14.Values, tbl12.SEP))
	end

	tbl14.SetValue = function(arg4, arg5)
		if tbl14.Multi then
			local tbl15 = {}

			if type(arg5) == "table" then
				for k, v6 in pairs(arg5) do
					local flag3 = type(k) == "number" and v6 or v6 and k

					if flag3 and table.find(tbl14.Values, flag3) then
						tbl15[#tbl15 + 1] = flag3
					end
				end
			end

			table.sort(tbl15, function(arg6, arg7)
				return (table.find(tbl14.Values, arg6) or 0) < (table.find(tbl14.Values, arg7) or 0)
			end)

			v5:SetAttribute("Value", table.concat(tbl15, tbl12.SEP))
		else
			v5:SetAttribute("Value", arg5 and table.find(tbl14.Values, arg5) and arg5 or "")
		end
	end

	tbl14.GetActiveValues = function()
		if not tbl14.Multi then
			return tbl14.Value and { tbl14.Value } or {}
		end
		local tbl15 = {}
		local v6 = pairs
		local tbl16 = tbl14.Value or {}

		for k in v6(tbl16) do
			tbl15[#tbl15 + 1] = k
		end

		return tbl15
	end

	v5:SetAttribute("Value", "")
	local default = v4.Default

	if type(default) == "number" then
		default = tbl14.Values[default]
	end

	if default ~= nil then
		tbl14:SetValue(default)
	end

	fn34(tbl14, v5, fn37)
	fn35(arg, v3, tbl14, v5, v4)

	if default ~= nil then
		fn36(tbl14)
	end

	return tbl14
end

index.AddKeybind = function(arg, arg2, arg3)
	local v3, v4 = fn33(arg2, arg3)
	local tbl13 = { title = v4.Title, desc = v4.Description, icon = v4.Icon, default = v4.Default }
	local v5 = tbl12.keybind(arg.Scroll, arg:Next(), tbl13)

	local tbl14 = {
		Type = "Keybind",
		Callback = v4.Callback,
		ChangedCallback = v4.ChangedCallback,
		Mode = v4.Mode or "Toggle",
		Toggled = false,
	}

	tbl14.Value = v5:GetAttribute("Value")

	v5:GetAttributeChangedSignal("Value"):Connect(function()
		local attribute = v5:GetAttribute("Value")
		if attribute == tbl14.Value then
			return
		end
		tbl14.Value = attribute
		tbl7:SafeCallback(tbl14.ChangedCallback, attribute)
		tbl7:SafeCallback(tbl14.Changed, attribute)
		tbl7:Dirty()
	end)

	v5:GetAttributeChangedSignal("Pressed"):Connect(function()
		if tbl14.Mode == "Toggle" then
			tbl14.Toggled = not tbl14.Toggled
		end

		tbl7:SafeCallback(tbl14.Callback, tbl14.Mode == "Toggle" and tbl14.Toggled or true)
		tbl7:SafeCallback(tbl14.Clicked, tbl14.Toggled)
	end)

	tbl14.SetValue = function(arg4, arg5, mode)
		if typeof(arg5) == "EnumItem" then
			arg5 = arg5.Name
		end

		if mode then
			tbl14.Mode = mode
		end

		v5:SetAttribute("Value", arg5 or "None")
	end

	tbl14.GetState = function()
		if tbl14.Mode == "Always" then
			return true
		end

		if tbl14.Mode == "Hold" then
			if tbl14.Value == "None" then
				return false
			end

			if tbl14.Value == "MouseRight" then
				return tbl.UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
			end

			local ok, result = pcall(function()
				return Enum.KeyCode[tbl14.Value]
			end)

			return ok and result and tbl.UIS:IsKeyDown(result) or false
		end

		return tbl14.Toggled
	end

	tbl14.OnClick = function(arg4, clicked)
		tbl14.Clicked = clicked
	end

	fn35(arg, v3, tbl14, v5, v4)
	return tbl14
end

index.AddButton = function(arg, arg2)
	local v3, v4 = fn33(arg2)

	local v5 = tbl12.button(arg.Scroll, arg:Next(), {
		title = v4.Title,
		desc = v4.Description,
		icon = v4.Icon,
		label = v4.Label or v4.ButtonText,
	})

	local tbl13 = { Type = "Button", Callback = v4.Callback }

	v5:GetAttributeChangedSignal("Clicks"):Connect(function()
		tbl7:SafeCallback(tbl13.Callback)
	end)

	tbl13.SetLabel = function(arg3, text)
		v5.Action.Label.Text = text
	end

	return fn35(arg, nil, tbl13, v5, v4)
end

index.AddButtons = function(arg, arg2)
	local tbl13 = {}
	local v3 = ipairs
	arg2 = arg2 or {}

	for _, v4 in v3(arg2) do
		tbl13[#tbl13 + 1] = arg:AddButton({
			Title = v4.Title,
			Description = v4.Description,
			Icon = v4.Icon,
			Label = v4.Label or v4.ButtonText,
			Callback = v4.Callback,
		})
	end

	return tbl13
end

index.AddInput = function(arg, arg2, arg3)
	local v3, v4 = fn33(arg2, arg3)

	local tbl13 = {
		title = v4.Title,
		desc = v4.Description,
		icon = v4.Icon,
		default = v4.Default,
		placeholder = v4.Placeholder,
	}

	local v5 = tbl12.input(arg.Scroll, arg:Next(), tbl13)
	v5:SetAttribute("Numeric", v4.Numeric == true)
	v5:SetAttribute("Finished", v4.Finished == true)

	if v4.MaxLength then
		v5:SetAttribute("MaxLength", v4.MaxLength)
	end

	local tbl14 = { Type = "Input", Callback = v4.Callback, Numeric = v4.Numeric, Finished = v4.Finished }

	fn34(tbl14, v5, function()
		return v5:GetAttribute("Value") or ""
	end)

	tbl14.SetValue = function(arg4, arg5)
		v5:SetAttribute("Value", tostring(arg5 or ""))
	end

	return fn35(arg, v3, tbl14, v5, v4)
end

index.AddTextbox = index.AddInput

index.AddParagraph = function(arg, arg2)
	local v3, v4 = fn33(arg2)
	local tbl13 = { title = v4.Title, content = v4.Content, icon = v4.Icon }
	local v5 = tbl12.paragraph(arg.Scroll, arg:Next(), tbl13)
	local tbl14 = { Type = "Paragraph" }
	fn35(arg, nil, tbl14, v5, v4)

	tbl14.SetDesc = function(arg3, text)
		v5.Subtitle.Text = text or ""
	end

	tbl14.SetContent = tbl14.SetDesc
	return tbl14
end

index.AddPage = function(arg, arg2)
	local v3, v4 = fn33(arg2)
	local tbl13 = { title = v4.Title, desc = v4.Description, icon = v4.Icon }
	local v5 = tbl12.link(arg.Scroll, arg:Next(), tbl13)
	local v6 = arg.Window:CreatePage(v4.Title)
	v5:SetAttribute("Page", v6.Key)
	fn35(arg, nil, { Type = "Link" }, v5, v4)

	v5.Activated:Connect(function()
		arg.Window:Open(v6.Key)
	end)

	return v6
end

local index2 = {}
index2.__index = index2

tbl7.CreateWindow = function(arg, arg2)
	local tbl13 = arg2 or {}
	assert(not tbl7.Window, "NightGlass: only one window is supported")
	local size2 = tbl13.Size or UDim2.fromOffset(580, 440)

	local window = setmetatable({
		Config = tbl13,
		Tabs = {},
		Pages = {},
		PageCount = 0,
		Stack = {},
		Running = {},
		Size = UDim2.fromOffset(size2.X.Offset, size2.Y.Offset),
		Minimized = false,
		Maximized = false,
		Busy = false,
		GlassOn = tbl13.Glass == true,
		ThemeName = tbl3[tbl13.Theme or ""] and tbl13.Theme or "Blue",
		BlurValue = tbl13.Blur or 100,
		MinimizeKey = tbl13.MinimizeKey or Enum.KeyCode.RightControl,
	}, index2)

	tbl7.Window = window
	tbl7.Settings = tbl13.Settings
	tbl7.GlassOn = window.GlassOn

	if tbl7.Settings and tbl7.Settings.Save ~= false then
		tbl7.Pending = tbl7:ReadConfig()
	end

	window.DepthValue = tbl13.Depth or 55
	glass.set({ intensity = math.clamp(window.BlurValue / 100, 0, 1), lensDepth = 0.2 + window.DepthValue / 100 * 0.7 })

	task.spawn(function()
		glass.overlayFrom(tbl13.Overlay or workspace:FindFirstChild("CustomOverlay") or tbl7.Overlay)
	end)

	local Frame2 = tbl5.make("Frame", {
		Name = "Holder",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = window.Size,
		BackgroundTransparency = 1,
		ZIndex = 10,
	}, ScreenGui)

	window.Holder = Frame2
	window.Shadows = {}

	for i, v3 in ipairs({ { 36, 0.985 }, { 28, 0.975 }, { 20, 0.965 }, { 13, 0.955 }, { 7, 0.945 }, { 2, 0.94 } }) do
		local corner = tbl5.corner
		local make = tbl5.make

		local tbl14 = {
			Name = "Shadow" .. i,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 10),
			Size = UDim2.new(1, v3[1], 1, v3[1]),
			BackgroundColor3 = tbl2.black,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
		}

		local n5 = 8 + v3[1] / 2
		local v4 = v3[2]
		window.Shadows[corner(make("Frame", tbl14, Frame2), n5)] = v4
	end

	local v3 = tbl5.corner(tbl5.make("Frame", {
		Name = "Window",
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = tbl2.window,
		BackgroundTransparency = 0.45,
		BorderSizePixel = 0,
	}, Frame2), 16)

	window.Round = v3:FindFirstChildOfClass("UICorner")
	tbl5.stroke(v3, 0.88).Name = "Line"
	window.Frame = v3

	local Frame3 = tbl5.make("Frame", {
		Name = "TitleBar",
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(0, 4),
		Size = UDim2.new(1, 0, 0, 48),
	}, v3)

	window.Bar = Frame3

	window.TitleLabel = tbl5.text(Frame3, "Title", tbl13.Title or "Night Hub", 13, tbl2.white, nil, {
		FontFace = tbl5.font(Enum.FontWeight.Bold, tbl2.gotham),
		Position = UDim2.fromOffset(18, 8),
		Size = UDim2.fromOffset(200, 16),
	})

	window.SubLabel = tbl5.text(Frame3, "Subtitle", tbl13.SubTitle or "", 11, tbl2.sub, nil, {
		FontFace = tbl5.font(Enum.FontWeight.Medium, tbl2.gotham),
		Position = UDim2.fromOffset(18, 26),
		Size = UDim2.fromOffset(260, 14),
		TextTruncate = Enum.TextTruncate.None,
	})

	for _, v4 in ipairs({ window.TitleLabel, window.SubLabel }) do
		v4.TextTruncate = Enum.TextTruncate.None
		v4.AutomaticSize = Enum.AutomaticSize.X
		v4.Size = UDim2.fromOffset(0, v4.Size.Y.Offset)
	end

	local Frame4 = tbl5.make("Frame", {
		Name = "Caption",
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -10, 0.5, 0),
		Size = UDim2.fromOffset(96, 32),
	}, Frame3)

	tbl5.make("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, SortOrder = Enum.SortOrder.LayoutOrder }, Frame4)
	window.Caption = Frame4
	window.CapButtons = {}

	for i, v4 in ipairs({ { "Minimize", "minus", 12 }, { "Maximize", "square", 11 }, { "Close", "x", 15 } }) do
		local v5 = tbl5.button(Frame4, v4[1], { LayoutOrder = i, Size = UDim2.fromOffset(32, 32), BackgroundColor3 = tbl2.white })
		tbl5.corner(v5, 6)
		tbl5.image(v5, "Icon", v4[2], v4[3], { AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5) })

		v5.MouseEnter:Connect(function()
			tbl5.tween(v5, 0.2, {
				BackgroundTransparency = v4[1] == "Close" and 0.2 or 0.92,
				BackgroundColor3 = v4[1] == "Close" and Color3.fromRGB(196, 43, 28) or tbl2.white,
			})
		end)

		v5.MouseLeave:Connect(function()
			tbl5.tween(v5, 0.2, { BackgroundTransparency = 1 })
		end)

		window.CapButtons[v4[1]] = v5
	end

	local Frame5 = tbl5.make("Frame", {
		Name = "Sidebar",
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(12, 52),
		Size = UDim2.new(0, 196, 1, -52),
	}, v3)

	window.Sidebar = Frame5
	local v4 = tbl5.button(Frame5, "Profile", { Size = UDim2.new(1, 0, 0, 74), BackgroundColor3 = tbl2.white })
	tbl5.corner(v4, 8)

	v4.MouseEnter:Connect(function()
		tbl5.tween(v4, 0.2, { BackgroundTransparency = 0.96 })
	end)

	v4.MouseLeave:Connect(function()
		tbl5.tween(v4, 0.2, { BackgroundTransparency = 1 })
	end)

	window.Profile = v4
	local udim = UDim.new

	local v5 = tbl5.corner(tbl5.make("Frame", {
		Name = "Avatar",
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 4, 0.5, -2),
		Size = UDim2.fromOffset(48, 48),
		BackgroundColor3 = Color3.fromRGB(226, 226, 230),
		BorderSizePixel = 0,
		ClipsDescendants = true,
	}, v4), udim(1, 0))

	tbl5.image(v5, "Placeholder", "user", 24, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		ImageColor3 = Color3.fromRGB(120, 120, 126),
	})

	tbl5.corner(tbl5.make("ImageLabel", { Name = "Photo", BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Image = "", ZIndex = 2 }, v5), UDim.new(1, 0))
	window.Avatar = v5
	local profile = tbl13.Profile or {}
	window.NameLabel = tbl5.text(v4, "Name", profile.Username or tbl.Players.LocalPlayer and tbl.Players.LocalPlayer.DisplayName or "Guest", 13, tbl2.white, Enum.FontWeight.SemiBold, { Position = UDim2.fromOffset(62, 19), Size = UDim2.new(1, -66, 0, 17) })
	local text = tbl5.text
	local plan = profile.Plan

	if plan then
		plan = "Plan: " .. profile.Plan .. (profile.Term and " - " .. profile.Term or "")
	end

	window.PlanLabel = text(v4, "Plan", plan or "Free Plan", 11, profile.Plan and tbl2.gold or tbl2.sub, Enum.FontWeight.SemiBold, { Position = UDim2.fromOffset(62, 37), Size = UDim2.new(1, -66, 0, 15) })

	local ScrollingFrame = tbl5.make("ScrollingFrame", {
		Name = "Nav",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.fromOffset(0, 80),
		Size = UDim2.new(1, 0, 1, -88),
		ScrollBarThickness = 0,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
	}, Frame5)

	tbl5.make("UIPadding", { PaddingTop = UDim.new(0, 6), PaddingBottom = UDim.new(0, 6) }, ScrollingFrame)

	local Frame6 = tbl5.make("Frame", {
		Name = "Items",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
	}, ScrollingFrame)

	tbl5.make("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder }, Frame6)
	window.Nav = ScrollingFrame
	window.NavItems = Frame6

	local v6 = tbl5.corner(tbl5.make("Frame", {
		Name = "Select",
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(2, 0),
		Size = UDim2.new(1, -8, 0, 36),
		ZIndex = 5,
		Visible = false,
	}, ScrollingFrame), 8)

	tbl5.stroke(v6, 0.72).Name = "Line"

	tbl5.corner(tbl5.make("Frame", {
		Name = "Tint",
		BackgroundColor3 = tbl2.white,
		BackgroundTransparency = 0.93,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		ZIndex = 5,
	}, v6), 8)

	tbl5.corner(tbl5.make("Frame", {
		Name = "Pill",
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.fromOffset(3, 16),
		BackgroundColor3 = tbl12.accent,
		BorderSizePixel = 0,
		ZIndex = 8,
	}, v6), 2)

	window.Select = v6

	local Frame7 = tbl5.make("Frame", {
		Name = "Crumbs",
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(228, 52),
		Size = UDim2.new(1, -250, 0, 50),
		ClipsDescendants = true,
	}, v3)

	tbl5.make("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 8),
	}, Frame7)

	local position = Frame7.Position
	window.Crumbs = Frame7
	window.CrumbBase = position

	window.PageHolder = tbl5.make("Frame", {
		Name = "Pages",
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(220, 102),
		Size = UDim2.new(1, -220, 1, -102),
		ClipsDescendants = true,
	}, v3)

	window.Sections = { Frame3, Frame5, Frame7, window.PageHolder }
	window:BuildSearch()
	window:BuildNavMotion()
	window:BuildDrag()
	window:BuildDock()
	window:BuildCaption()
	window:BuildProfile()
	window.Born = os.clock()
	window:SetTheme(window.ThemeName, true)
	window:ApplyMode(true)

	tbl7:Connect(tbl.UIS.InputBegan, function(arg3)
		if tbl.UIS:GetFocusedTextBox() or arg3.UserInputType ~= Enum.UserInputType.Keyboard then
			return
		end
		local minimizeKey = window.MinimizeKey

		if arg3.KeyCode.Name == (typeof(minimizeKey) == "EnumItem" and minimizeKey.Name or tostring(minimizeKey)) then
			window:ToggleMinimize()
		end
	end)

	Frame2.Size = UDim2.fromOffset(window.Size.X.Offset * 0.9, window.Size.Y.Offset * 0.9)
	v3.BackgroundTransparency = 1

	for _, section in ipairs(window.Sections) do
		section.Visible = false
	end

	task.defer(function()
		tbl5.tween(Frame2, 0.6, { Size = window.Size }, Enum.EasingStyle.Back)
		tbl5.tween(v3, 0.4, { BackgroundTransparency = window.GlassOn and 0.45 or 0.07 })
		task.wait(0.15)

		for _, section in ipairs(window.Sections) do
			section.Visible = true
		end
	end)

	return window
end

index2.BuildDrag = function(arg)
	local v3 = nil
	local n5 = nil
	local flag3

	arg.Bar.InputBegan:Connect(function(input)
		if not tbl5.click(input) or arg.Busy or arg.Maximized then
			return
		end

		for _, capButton in pairs(arg.CapButtons) do
			if tbl5.inside(capButton, input.Position) then
				return
			end
		end

		if tbl5.inside(arg.Search, input.Position) then
			return
		end
		local position = input.Position
		flag3 = true
		v3 = position
		n5 = arg.Holder.AbsolutePosition + arg.Holder.AbsoluteSize / 2 - ScreenGui.AbsolutePosition
	end)

	tbl7:Connect(tbl.UIS.InputChanged, function(arg2)
		local flag4

		if not flag3 then
			flag4 = not flag3
		else
			flag4 = not tbl5.move(arg2)
		end

		if flag4 then
			return
		end
		arg.Holder.Position = UDim2.fromOffset(n5.X + (arg2.Position - v3).X, n5.Y + (arg2.Position - v3).Y)
	end)

	tbl7:Connect(tbl.UIS.InputEnded, function(arg2)
		if flag3 and tbl5.click(arg2) then
			flag3 = false
		end
	end)
end

local tbl13 = {}
local numberSequence = NumberSequence.new
local tbl14 = {}
local v3 = NumberSequenceKeypoint.new(0, 0)
local v4 = NumberSequenceKeypoint.new(0.5, 0)
local v5 = NumberSequenceKeypoint.new(0.75, 1)
local new = NumberSequenceKeypoint.new
tbl14[1] = v3
tbl14[2] = v4
tbl14[3] = v5

do
	local values = table.pack(new(1, 1))
	table.move(values, 1, values.n, 4, tbl14)
end

tbl13.FORWARD = numberSequence(tbl14)
local numberSequence2 = NumberSequence.new
local tbl15 = {}
local v6 = NumberSequenceKeypoint.new(0, 1)
local v7 = NumberSequenceKeypoint.new(0.25, 1)
local v8 = NumberSequenceKeypoint.new(0.5, 0)
local new2 = NumberSequenceKeypoint.new
tbl15[1] = v6
tbl15[2] = v7
tbl15[3] = v8

do
	local values = table.pack(new2(1, 0))
	table.move(values, 1, values.n, 4, tbl15)
end

tbl13.BACKWARD = numberSequence2(tbl15)
tbl13.enter = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
tbl13.leave = TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
tbl13.reveal = TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0.09)
tbl13.center = UDim2.fromScale(0.5, 0.5)

tbl13.cascade = function(parent)
	local n5 = 30
	local n6 = 0.045
	local tbl16 = {}

	local function fn37(arg)
		if arg:GetAttribute("Slot") or arg.Parent ~= parent or not arg:IsA("GuiObject") then
			return
		end

		local Frame2 = tbl5.make("Frame", {
			Name = arg.Name,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = arg.LayoutOrder,
			Size = UDim2.new(1, 0, 0, arg.AbsoluteSize.Y),
			Visible = arg.Visible,
		})

		Frame2:SetAttribute("Slot", true)
		local Vector3Value = tbl5.make("Vector3Value", { Name = "Enter" })

		Vector3Value.Changed:Connect(function(arg2)
			arg.Position = UDim2.new(0.5, arg2.X, 0.5, 0)
		end)

		Frame2.Parent = parent
		arg.AnchorPoint = Vector2.new(0.5, 0.5)
		arg.Position = UDim2.fromScale(0.5, 0.5)
		arg.Parent = Frame2
		Vector3Value.Parent = Frame2
		local n7 = -1

		local function fn38()
			local n8 = math.floor(arg.AbsoluteSize.Y + 0.5)
			if math.abs(n8 - n7) <= 1 then
				return
			end
			n7 = n8
			Frame2.Size = UDim2.new(1, 0, 0, n8)
		end

		arg:GetPropertyChangedSignal("AbsoluteSize"):Connect(fn38)

		arg:GetPropertyChangedSignal("Visible"):Connect(function()
			Frame2.Visible = arg.Visible
		end)

		arg:GetPropertyChangedSignal("LayoutOrder"):Connect(function()
			Frame2.LayoutOrder = arg.LayoutOrder
		end)

		arg.AncestryChanged:Connect(function()
			if arg.Parent ~= Frame2 and Frame2.Parent then
				Frame2:Destroy()
			end
		end)

		fn38()
	end

	local function fn38(arg)
		local y = parent.AbsolutePosition.Y
		local n7 = y + parent.AbsoluteSize.Y
		local n8 = 0

		for _, child in ipairs(parent:GetChildren()) do
			local enter = child:GetAttribute("Slot") and child:FindFirstChild("Enter")

			if enter then
				local y2 = child.AbsolutePosition.Y
				local str = (y2 + child.AbsoluteSize.Y < y or y2 > n7) and "away" or "shown"

				if tbl16[child] ~= str then
					local v9 = tbl16[child]
					tbl16[child] = str
					local vector2 = Vector3.new(str == "away" and -n5 or 0, 0, 0)

					if arg or v9 == nil or str ~= "shown" then
						enter.Value = vector2
					else
						tbl.TS:Create(enter, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, n8 * n6), { Value = vector2 }):Play()
						n8 += 1
					end
				end
			end
		end
	end

	for _, child in ipairs(parent:GetChildren()) do
		fn37(child)
	end

	parent.ChildAdded:Connect(function(child)
		if child:GetAttribute("Slot") then
			return
		end

		task.defer(function()
			fn37(child)
			fn38(true)
		end)
	end)

	parent:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
		fn38(false)
	end)

	local uiListLayout = parent:FindFirstChildOfClass("UIListLayout")

	if uiListLayout then
		uiListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			task.defer(fn38, false)
		end)
	end

	parent:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		fn38(true)
	end)

	return fn38
end

index2.MakePage = function(arg, title)
	arg.PageCount = arg.PageCount + 1
	local key = "Page" .. arg.PageCount

	local CanvasGroup = tbl5.make("CanvasGroup", {
		Name = key,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = tbl13.center,
		Size = UDim2.fromScale(1, 1),
		Visible = false,
	}, arg.PageHolder)

	CanvasGroup:SetAttribute("Title", title or key)

	tbl5.make("UIGradient", {
		Name = "Reveal",
		Rotation = 90,
		Transparency = tbl13.FORWARD,
		Offset = Vector2.new(0, 0.55000001192092896),
	}, CanvasGroup)

	local ScrollingFrame = tbl5.make("ScrollingFrame", {
		Name = "Scroll",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		ScrollBarThickness = 3,
		ScrollBarImageColor3 = tbl2.white,
		ScrollBarImageTransparency = 0.6,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		CanvasSize = UDim2.new(),
	}, CanvasGroup)

	tbl5.make("UIPadding", {
		PaddingLeft = UDim.new(0, 8),
		PaddingRight = UDim.new(0, 14),
		PaddingTop = UDim.new(0, 4),
		PaddingBottom = UDim.new(0, 14),
	}, ScrollingFrame)

	tbl5.make("UIListLayout", {
		Padding = UDim.new(0, 6),
		SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
	}, ScrollingFrame)

	tbl13.cascade(ScrollingFrame)
	local v9 = index.new(arg, CanvasGroup, ScrollingFrame, 0)
	v9.Key = key
	v9.Title = title
	arg.Pages[key] = v9
	return v9
end

index2.CreatePage = function(arg, arg2)
	return arg:MakePage(arg2)
end

index2.AddTab = function(arg, arg2)
	local tbl16

	if type(arg2) ~= "string" then
		tbl16 = arg2
	else
		tbl16 = { Title = arg2 }
	end

	tbl16 = tbl16 or {}
	local v9 = arg:MakePage(tbl16.Title or "Tab")
	local index3 = #arg.Tabs + 1
	local v10 = tbl5.button(arg.NavItems, tbl16.Title or "Tab", { LayoutOrder = index3, Size = UDim2.new(1, -6, 0, 36), BackgroundColor3 = tbl2.white })
	tbl5.corner(v10, 8)
	local image = tbl5.image
	local icon = tbl16.Icon or "circle"

	image(v10, "Icon", icon, 18, {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 14, 0.5, 0),
		ImageColor3 = tbl16.IconColor or tbl2.white,
	})

	tbl5.text(v10, "Label", tbl16.Title or "Tab", 13, tbl2.white, nil, { Position = UDim2.fromOffset(46, 0), Size = UDim2.new(1, -54, 1, 0) })

	v10.MouseEnter:Connect(function()
		if arg.Tab ~= index3 then
			tbl5.tween(v10, 0.2, { BackgroundTransparency = 0.96 })
		end
	end)

	v10.MouseLeave:Connect(function()
		tbl5.tween(v10, 0.2, { BackgroundTransparency = 1 })
	end)

	v10.Activated:Connect(function()
		arg:SelectTab(index3)
	end)

	v9.Button = v10
	v9.Index = index3
	arg.Tabs[index3] = v9

	if index3 == 1 then
		arg.Tab = 1
		arg.Current = v9.Page
		arg.Stack = { v9.Key }
		v9.Page.Visible = true
		arg.Select.Visible = true
		arg:MoveSelect(1, true)
		arg:Trail(0)
	end

	return v9
end

index2.SelectTab = function(arg, tab)
	local v9 = arg.Tabs[tab]
	if not v9 or arg.Busy then
		return
	end
	arg:MoveSelect(tab)

	if v9.Key ~= arg.Stack[1] then
		local n5 = tab > (arg.Tab or 1) and 1 or -1
		arg.Tab = tab
		arg:Go({ v9.Key }, n5, true)
	elseif #arg.Stack > 1 then
		arg:Go({ v9.Key }, -1)
	end
end

index2.BuildNavMotion = function(arg)
	local n5 = 36
	local n6 = 4
	local n7 = 2
	local n8 = 8
	local v9 = tbl6.spring(0, 140, 22)
	local select = arg.Select

	local function fn37()
		local n9 = math.clamp(math.abs(v9.v) / 90, 0, 6)
		select.Position = UDim2.fromOffset(2, v9.x - n9 / 2)
		select.Size = UDim2.new(1, -(n7 + n8), 0, n5 + n9)
	end

	local function fn38(arg2)
		local v10 = table.pack(tbl6.step(v9, arg2))
		fn37()
		return v10[1]
	end

	arg.MoveSelect = function(arg2, arg3, arg4)
		v9.t = (arg3 - 1) * (n5 + n6)

		if arg4 then
			local v10 = v9
			v9.x = v9.t
			v10.v = 0
			fn37()
		else
			tbl6.run(fn38)
		end
	end
end

index2.Cancel = function(arg)
	for _, v9 in ipairs(arg.Running) do
		v9:Cancel()
	end

	table.clear(arg.Running)

	if arg.Watcher then
		arg.Watcher:Disconnect()
		arg.Watcher = nil
	end

	for _, descendant in ipairs(arg.PageHolder:GetDescendants()) do
		if descendant:GetAttribute("GlassHide") then
			descendant:SetAttribute("GlassHide", nil)
		end
	end
end

index2.Play = function(arg, arg2, arg3, arg4)
	local tween = tbl.TS:Create(arg2, arg3, arg4)
	arg.Running[#arg.Running + 1] = tween
	tween:Play()
	return tween
end

index2.Unveil = function(arg, arg2, arg3, arg4)
	local tbl16 = {}

	for _, descendant in ipairs(arg2:GetDescendants()) do
		if descendant:GetAttribute("Card") then
			tbl16[#tbl16 + 1] = descendant
			descendant:SetAttribute("GlassHide", true)
		end
	end

	arg.Watcher = tbl.Run.RenderStepped:Connect(function()
		math.max(arg2.AbsoluteSize.Y, 1)

		if not (arg3.Offset.Y + 0.375) then
		end

		error("devirt: symbolic generic for (at 0:6)")
	end)
end

index2.Trail = function(arg, arg2)
	local crumbs = arg.Crumbs

	for _, child in ipairs(crumbs:GetChildren()) do
		if not child:IsA("UIListLayout") then
			child:Destroy()
		end
	end

	local n5 = #arg.Stack
	local n6 = n5 <= 1 and 28 or n5 == 2 and 24 or 20

	if arg2 ~= 0 then
		crumbs.Position = arg.CrumbBase + UDim2.fromOffset(0, 6)
		arg:Play(crumbs, tbl13.enter, { Position = arg.CrumbBase })
	end

	for i, v9 in ipairs(arg.Stack) do
		local flag3 = i == n5
		local flag4 = flag3 and arg2 ~= 0

		if i > 1 then
			local v10 = tbl5.image(crumbs, "Sep" .. i, "chevron-right", math.floor(n6 * 0.8), {
				ImageColor3 = Color3.fromRGB(205, 205, 210),
				LayoutOrder = i * 2 - 1,
				ImageTransparency = flag4 and 1 or 0,
			})

			if flag4 then
				arg:Play(v10, tbl13.enter, { ImageTransparency = 0 })
			end
		end

		local v10 = arg.Pages[v9]

		local v11 = tbl5.button(crumbs, "Crumb" .. i, {
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.new(0, 0, 1, 0),
			FontFace = tbl5.font(Enum.FontWeight.SemiBold),
			TextSize = n6,
			Text = v10 and v10.Page:GetAttribute("Title") or v9,
			TextColor3 = flag3 and tbl2.white or tbl2.gray,
			TextTransparency = flag4 and 1 or 0,
			LayoutOrder = i * 2,
		})

		if flag4 then
			arg:Play(v11, tbl13.enter, { TextTransparency = 0 })
		end

		if not flag3 then
			v11.MouseEnter:Connect(function()
				tbl5.tween(v11, 0.2, { TextColor3 = tbl2.white })
			end)

			v11.MouseLeave:Connect(function()
				tbl5.tween(v11, 0.2, { TextColor3 = tbl2.gray })
			end)

			v11.Activated:Connect(function()
				arg:Go(table.move(arg.Stack, 1, i, 1, {}), -1)
			end)
		end
	end
end

index2.Go = function(arg, stack, arg2, arg3)
	local v9 = arg.Pages[stack[#stack]]
	if not v9 then
		return
	end
	local page = v9.Page
	if page == arg.Current then
		return
	end
	tbl12.closeFlyouts()
	arg:Cancel()
	arg:ClearSearch()
	local current = arg.Current
	arg.Current = page
	arg.Stack = stack

	for _, page2 in pairs(arg.Pages) do
		local page3 = page2.Page

		if page3 ~= current and page3 ~= page then
			page3.Visible = false
			page3.Position = tbl13.center
			page3.GroupTransparency = 0
			page3.Reveal.Offset = Vector2.new(0, 0.55000001192092896)
		end
	end

	local function fn37(arg4)
		return tbl13.center + (arg3 and UDim2.fromOffset(0, arg4) or UDim2.fromOffset(arg4, 0))
	end

	if current then
		current:SetAttribute("GlassHide", true)

		arg:Play(current, tbl13.leave, { Position = fn37(-arg2 * (arg3 and 10 or 22)), GroupTransparency = 1 }).Completed:Connect(function(playbackState)
			if playbackState ~= Enum.PlaybackState.Completed then
				return
			end
			current.Visible = false
			current.Position = tbl13.center
			current.GroupTransparency = 0
			current.Reveal.Offset = Vector2.new(0, 0.55000001192092896)
			current:SetAttribute("GlassHide", nil)
		end)
	end

	v9.Scroll.CanvasPosition = Vector2.zero
	local reveal = page.Reveal
	local flag3 = arg3 and arg2 < 0
	reveal.Transparency = flag3 and tbl13.BACKWARD or tbl13.FORWARD
	reveal.Offset = Vector2.new(0, flag3 and 0.8 or -0.8)
	arg3 = arg3 and 18 or 42
	page.Position = fn37(arg2 * arg3)
	page.GroupTransparency = 0
	page.Visible = true
	arg:Play(page, tbl13.reveal, { Position = tbl13.center })

	arg:Play(reveal, tbl13.reveal, { Offset = Vector2.new(0, flag3 and -0.55 or 0.55) }).Completed:Connect(function(playbackState)
		if playbackState ~= Enum.PlaybackState.Completed then
			return
		end

		for _, descendant in ipairs(page:GetDescendants()) do
			if descendant:GetAttribute("GlassHide") then
				descendant:SetAttribute("GlassHide", nil)
			end
		end
	end)

	arg:Unveil(page, reveal, flag3)
	arg:Trail(arg2)
end

index2.Open = function(arg, arg2)
	if not arg.Pages[arg2] then
		return
	end
	local v9 = table.clone(arg.Stack)
	v9[#v9 + 1] = arg2
	arg:Go(v9, 1)
end

index2.Adopt = function(arg, arg2)
	local attribute = arg2:GetAttribute("Element")

	if attribute and tbl12.bind[attribute] then
		tbl12.bind[attribute](arg2)
	end

	tbl12.hover(arg2)
	arg:StyleCard(arg2)
end

index2.BuildSearch = function(arg)
	local bar = arg.Bar
	local t = 32
	local t2 = t + 12
	local n5 = t * 1.3

	local Frame2 = tbl5.make("Frame", {
		Name = "Search",
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 130, 0.5, 0),
		Size = UDim2.fromOffset(320, 32),
	}, bar)

	local CanvasGroup = tbl5.make("CanvasGroup", { Name = "Goo", BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), GroupTransparency = 0.72 }, Frame2)
	local gooPieces = {}

	for _, v9 in ipairs({ "A", "B", "Neck" }) do
		gooPieces[v9] = tbl5.corner(tbl5.make("Frame", {
			Name = v9,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0, 16, 0.5, 0),
			Size = UDim2.fromOffset(32, 32),
			BackgroundColor3 = tbl2.white,
			BorderSizePixel = 0,
			Visible = v9 == "A",
		}, CanvasGroup), 16)

		local make = tbl5.make
		local tbl16 = { Name = "Sheen", Rotation = 90 }
		local numberSequence3 = NumberSequence.new
		local tbl17 = {}
		local v10 = NumberSequenceKeypoint.new(0, 0)
		local v11 = NumberSequenceKeypoint.new(0.5, 0.55)
		local new3 = NumberSequenceKeypoint.new
		tbl17[1] = v10
		tbl17[2] = v11

		do
			local values = table.pack(new3(1, 0.25))
			table.move(values, 1, values.n, 3, tbl17)
		end

		tbl16.Transparency = numberSequence3(tbl17)
		make("UIGradient", tbl16, gooPieces[v9])
	end

	local v9 = tbl5.corner(tbl5.make("Frame", {
		Name = "Glow",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0, 16, 0.5, 0),
		Size = UDim2.fromOffset(32, 32),
		BackgroundColor3 = tbl2.white,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 2,
	}, Frame2), 16)

	local v10 = tbl5.stroke(v9, 1, tbl12.accent, 1.5)

	local v11 = tbl5.image(Frame2, "Icon", "search", 16, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0, 16, 0.5, 0),
		ImageColor3 = tbl2.sub,
		ZIndex = 3,
	})

	local TextBox = tbl5.make("TextBox", {
		Name = "Box",
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 60, 0.5, 0),
		Size = UDim2.fromOffset(236, 32),
		FontFace = tbl5.font(),
		Text = "",
		PlaceholderText = "Find a setting",
		PlaceholderColor3 = tbl2.sub,
		TextColor3 = tbl2.white,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		ClearTextOnFocus = false,
		Visible = false,
		ZIndex = 3,
	}, Frame2)

	local v12 = tbl5.button(Frame2, "Hit", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0, 16, 0.5, 0),
		Size = UDim2.fromOffset(32, 32),
		ZIndex = 4,
	})

	arg.Search = Frame2
	arg.SearchBox = TextBox
	arg.Goo = CanvasGroup
	arg.GlowLine = v10
	arg.GooPieces = gooPieces
	local a = gooPieces.A
	local b = gooPieces.B
	local neck = gooPieces.Neck
	local n6 = 260
	local v13 = tbl6.spring(0, 190, 17)
	local v14 = tbl6.spring(32, 150, 20)
	local v15 = tbl6.spring(0, 320, 13)
	local flag3 = true
	local flag4 = false

	local function fn37(arg2, arg3, arg4, arg5)
		arg2.Position = UDim2.new(0, arg3, 0.5, 0)
		arg2.Size = UDim2.fromOffset(arg4, arg5)
	end

	local function fn38()
		if flag4 then
			v13.t = t2
			v14.t = flag3 and 32 or n6
		else
			v14.t = t
			v13.t = v14.x <= t + 1 and 0 or t2
		end
	end

	local function fn39()
		local x = v13.x
		local x2 = v14.x

		if flag3 and x > n5 then
			flag3 = false
			v15.v = v15.v + 3
		elseif not flag3 and x < n5 * 0.85 then
			flag3 = true
			v15.v = v15.v - 1.4
		end

		local n7 = flag3 and math.clamp(x / n5, 0, 1) or 0
		local n8 = n7 * n7 * (3 - 2 * n7)
		local n9 = math.clamp((x2 - t) / math.max(n6 - t, 1), 0, 1)
		local n10 = t * (1 + 0.14 * n8 + v15.x * 0.1)
		fn37(a, t / 2 + (n10 - t) / 2, n10, t * (1 - 0.06 * n8 - v15.x * 0.06))
		local n11 = 1 + v15.x * 0.06
		local n12 = math.max(x2, 32) * n11
		local n13 = t * (1 - 0.06 * n8 + v15.x * 0.06)
		b.Visible = x > 0.5
		fn37(b, t / 2 + x + (n12 - t) / 2 - n8 * t * 0.07, n12, n13)
		neck.Visible = flag3 and x > 0.5

		if neck.Visible then
			fn37(neck, t / 2 + x / 2, x, t * (1 - 0.74 * n8))
		end

		TextBox.Visible = n9 > 0.35
		TextBox.Position = UDim2.new(0, x + 14, 0.5, 0)
		TextBox.Size = UDim2.fromOffset(math.max(x2 - 28, 0), 32)
		TextBox.TextTransparency = 1 - math.clamp((n9 - 0.35) / 0.65, 0, 1)
	end

	local function fn40(arg2)
		fn38()
		local v16 = table.pack(tbl6.step(v13, arg2))
		local v17 = table.pack(tbl6.step(v14, arg2))
		local v18 = table.pack(tbl6.step(v15, arg2))
		fn39()
		local v19, v20

		if v16[1] then
			v19 = v17[1]
			v20 = v18[1]
		else
			v19 = v16[1]
			v20 = v18[1]
		end

		return v19 and v20
	end

	local function fn41()
		local titleLabel = arg.TitleLabel
		local n7 = titleLabel.Position.X.Offset + math.max(titleLabel.TextBounds.X, arg.SubLabel.TextBounds.X) + 14
		n6 = math.clamp(bar.AbsoluteSize.X - arg.Caption.AbsoluteSize.X - 18 - n7 + t2, 32, 260)
		Frame2.Position = UDim2.new(0, n7, 0.5, 0)
		Frame2.Size = UDim2.fromOffset(t2 + n6, 32)
		tbl6.run(fn40)
	end

	local function fn42(arg2)
		tbl5.tween(v9, 0.25, { BackgroundTransparency = arg2 and 0.82 or 1 })
		tbl5.tween(v10, 0.25, { Transparency = arg2 and 0 or 1 })
		tbl5.tween(v11, 0.25, { ImageColor3 = arg2 and tbl2.white or tbl2.sub })
	end

	local function fn43(arg2)
		flag4 = arg2
		tbl6.run(fn40)

		if arg2 then
			task.delay(0.35, function()
				if flag4 then
					TextBox:CaptureFocus()
				end
			end)
		elseif TextBox:IsFocused() then
			TextBox:ReleaseFocus()
		end
	end

	arg.ClearSearch = function()
		if TextBox.Text ~= "" then
			TextBox.Text = ""
		end

		if flag4 then
			fn43(false)
		end
	end

	v12.Activated:Connect(function()
		fn43(not flag4)
	end)

	TextBox.Focused:Connect(function()
		fn42(true)
	end)

	TextBox.FocusLost:Connect(function()
		fn42(false)

		task.delay(0.15, function()
			if TextBox.Text == "" and not TextBox:IsFocused() then
				fn43(false)
			end
		end)
	end)

	TextBox:GetPropertyChangedSignal("Text"):Connect(function()
		arg:Filter(TextBox.Text)
	end)

	local v16 = ipairs
	local tbl16 = {}
	local signal = arg.TitleLabel:GetPropertyChangedSignal("TextBounds")
	local getPropertyChangedSignal = bar.GetPropertyChangedSignal
	local signal2 = arg.SubLabel:GetPropertyChangedSignal("TextBounds")
	tbl16[1] = signal
	tbl16[2] = signal2

	do
		local values = table.pack(getPropertyChangedSignal(bar, "AbsoluteSize"))
		table.move(values, 1, values.n, 3, tbl16)
	end

	for _, v17 in v16(tbl16) do
		v17:Connect(fn41)
	end

	fn41()
	fn39()
end

index2.Filter = function(arg, arg2)
	local scroll = arg.Current and arg.Current:FindFirstChild("Scroll")
	if not scroll then
		return
	end
	local v9 = string.lower(arg2 or "")

	for _, descendant in ipairs(scroll:GetDescendants()) do
		if descendant:IsA("GuiObject") and (descendant:GetAttribute("Card") or descendant.Name == "Section") and not descendant:GetAttribute("Slot") then
			if descendant:GetAttribute("Card") then
				local title = descendant:FindFirstChild("Title")
				local subtitle = descendant:FindFirstChild("Subtitle")
				local v10 = string.lower((title and title.Text or "") .. " " .. (subtitle and subtitle.Text or ""))
				descendant.Visible = v9 == "" or string.find(v10, v9, 1, true) ~= nil
			else
				descendant.Visible = v9 == ""
			end
		end
	end
end

local tbl16 = {
	blend = TweenInfo.new(0.45, Enum.EasingStyle.Quint),
	fields = {
		{ "GuiObject", "BackgroundTransparency" },
		{ "TextLabel", "TextTransparency" },
		{ "TextButton", "TextTransparency" },
		{ "TextBox", "TextTransparency" },
		{ "ImageLabel", "ImageTransparency" },
		{ "ImageButton", "ImageTransparency" },
		{ "UIStroke", "Transparency" },
	},
	check = "rbxassetid://10709790644",
}

index2.Put = function(arg, arg2, arg3, arg4)
	local saved = arg.Saved and arg.Saved[arg2]

	if saved and saved[arg3] ~= nil then
		saved[arg3] = arg4
	else
		arg2[arg3] = arg4
	end
end

index2.StyleCard = function(arg, arg2)
	local line = arg2:FindFirstChild("Line")
	local uiCorner = arg2:FindFirstChildOfClass("UICorner")
	arg2.BackgroundColor3 = tbl2.white

	if arg.GlassOn and arg.CardGlass ~= false then
		if line then
			line.Enabled = false
		end

		if uiCorner then
			uiCorner.CornerRadius = UDim.new(0, 10)
		end

		arg:Put(arg2, "BackgroundTransparency", 0.94)
		arg2:SetAttribute("BaseTransparency", 0.94)
		glass.new(arg2, { blur = false, liquidglass = true, sheen = true, rimTransparency = 0.85, inset = 10 })
	else
		glass.remove(arg2)

		if line then
			line.Enabled = true
		end

		if uiCorner then
			uiCorner.CornerRadius = UDim.new(0, 8)
		end

		arg:Put(arg2, "BackgroundTransparency", 0.95)
		arg2:SetAttribute("BaseTransparency", 0.95)
	end
end

index2.Cards = function(arg)
	local tbl17 = {}

	for _, descendant in ipairs(arg.PageHolder:GetDescendants()) do
		if descendant:IsA("GuiObject") and descendant:GetAttribute("Card") then
			tbl17[#tbl17 + 1] = descendant
		end
	end

	return tbl17
end

index2.ApplyMode = function(arg, arg2)
	local glassOn = arg.GlassOn
	tbl7.GlassOn = glassOn
	local v9 = tbl3[arg.ThemeName]
	arg2 = arg2 and TweenInfo.new(0) or tbl16.blend

	for k, shadow in pairs(arg.Shadows) do
		tbl.TS:Create(k, arg2, { BackgroundTransparency = glassOn and 1 or shadow }):Play()
	end

	if not arg.Opening then
		tbl.TS:Create(arg.Frame, arg2, {
			BackgroundColor3 = glassOn and tbl2.window or v9.base,
			BackgroundTransparency = glassOn and 0.45 or 0.07,
		}):Play()
	end

	if glassOn then
		glass.new(arg.Frame, { blur = true, liquidglass = true, rim = false, sheen = false, inset = 9, lensThickness = 0.08 })
		glass.new(arg.Select, { liquidglass = true, blur = false, rim = false, sheen = false })

		for _, v10 in ipairs({ "A", "B" }) do
			glass.new(arg.GooPieces[v10], {
				blur = true,
				liquidglass = true,
				sheen = false,
				rim = false,
				edge = 5,
				lensThickness = 0.06,
			})
		end
	else
		glass.remove(arg.Frame)
		glass.remove(arg.Select)
		glass.remove(arg.GooPieces.A)
		glass.remove(arg.GooPieces.B)
	end

	for _, v10 in ipairs(arg:Cards()) do
		arg:StyleCard(v10)
	end

	if arg.StyleDock then
		arg:StyleDock()
	end
end

index2.SetTheme = function(arg, themeName, arg2)
	local v9 = tbl3[themeName]
	if not v9 then
		return
	end
	arg.ThemeName = themeName
	tbl7.Base = v9.base
	tbl12.setAccent(v9.accent)
	arg.Select.Pill.BackgroundColor3 = v9.accent
	arg.GlowLine.Color = v9.accent

	if not arg.GlassOn and not arg.Busy then
		tbl5.tween(arg.Frame, arg2 and 0 or 0.4, { BackgroundColor3 = v9.base })
	end

	if arg.StyleDock then
		arg:StyleDock()
	end
end

index2.SetBlur = function(arg, arg2)
	arg.BlurValue = math.clamp(tonumber(arg2) or 100, 0, 100)
	glass.set({ intensity = arg.BlurValue / 100 })
end

index2.SetDepth = function(arg, arg2)
	arg.DepthValue = math.clamp(tonumber(arg2) or 55, 0, 100)
	glass.set({ lensDepth = 0.2 + arg.DepthValue / 100 * 0.7 })
end

index2.Frozen = function(arg, arg2)
	while arg2 and arg2 ~= arg.PageHolder do
		if arg2.Name == "Toggle" or arg2.Name == "Track" or arg2.Name == "Bubble" then
			return true
		end
		arg2 = arg2.Parent
	end

	return false
end

index2.Fade = function(arg, arg2, arg3)
	local tweenInfo = TweenInfo.new(arg3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
	arg.Saved = arg.Saved or {}
	local saved = arg.Saved

	if not arg2 then
		for _, capButton in pairs(arg.CapButtons) do
			capButton.BackgroundTransparency = 1
		end

		arg.Profile.BackgroundTransparency = 1
	end

	tbl5.tween(arg.Frame.Line, arg2 and 0.5 or 0.3, { Transparency = arg2 and 0.88 or 0.55 })

	for _, section in ipairs(arg.Sections) do
		for _, descendant in ipairs(section:GetDescendants()) do
			if not (descendant:IsDescendantOf(arg.Goo) or arg:Frozen(descendant)) then
				if arg2 then
					local v9 = saved[descendant]

					if v9 then
						tbl.TS:Create(descendant, tweenInfo, v9):Play()
					end
				else
					local tbl17 = saved[descendant] or {}

					for _, field in ipairs(tbl16.fields) do
						if descendant:IsA(field[1]) and tbl17[field[2]] == nil then
							tbl17[field[2]] = descendant[field[2]]
						end
					end

					if next(tbl17) then
						saved[descendant] = tbl17
						local tbl18 = {}

						for k in pairs(tbl17) do
							tbl18[k] = 1
						end

						tbl.TS:Create(descendant, tweenInfo, tbl18):Play()
					end
				end
			end
		end
	end

	if arg2 then
		arg.Saved = nil
	end
end

index2.Morph = function(arg)
	if arg.Check then
		return arg.Check, arg.CheckScale
	end

	local ImageLabel = tbl5.make("ImageLabel", {
		Name = "Morph",
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(18, 18),
		Image = tbl16.check,
		ImageColor3 = tbl2.white,
		ImageTransparency = 1,
		ZIndex = 20,
		Visible = false,
	}, arg.Frame)

	local UIScale = tbl5.make("UIScale", { Scale = 0 }, ImageLabel)
	arg.Check = ImageLabel
	arg.CheckScale = UIScale
	return arg.Check, arg.CheckScale
end

index2.SetGlass = function(arg, arg2)
	local want = arg2 ~= false
	arg.Want = want
	if want == arg.GlassOn and not arg.Busy then
		return
	end
	local minimized = arg.Minimized

	if not minimized then
		local born = arg.Born
		minimized = os.clock() - born < 1.5
	end

	if minimized then
		if arg.Busy then
			return
		end
		arg.GlassOn = want
		arg:ApplyMode(true)
		return
	end

	task.spawn(arg.Transition, arg)
end

index2.Transition = function(arg)
	if arg.Busy then
		return
	end
	arg.Busy = true
	local holder = arg.Holder
	local round = arg.Round
	local v9, v10 = arg:Morph()

	while arg.Want ~= nil and arg.Want ~= arg.GlassOn and not tbl7.Unloaded do
		local want = arg.Want
		tbl12.closeFlyouts()
		arg:Fade(false, 0.22)
		arg.Goo.Visible = false
		task.wait(0.22)

		for _, section in ipairs(arg.Sections) do
			section.Visible = false
		end

		local size2 = holder.Size
		tbl5.tween(round, 0.55, { CornerRadius = UDim.new(0, 17.5) }, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
		tbl5.tween(holder, 0.55, { Size = UDim2.fromOffset(35, 35) }, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut).Completed:Wait()
		v9.Visible = true
		v9.Rotation = -200
		tbl5.tween(v9, 0.25, { ImageTransparency = 0 }, Enum.EasingStyle.Quad)
		tbl5.tween(v10, 0.45, { Scale = 1 }, Enum.EasingStyle.Back)
		tbl5.tween(v9, 0.8, { Rotation = 0 })
		task.wait(0.35)
		arg.GlassOn = want
		arg:ApplyMode(false)
		task.wait(0.45)
		tbl5.tween(v10, 0.25, { Scale = 0 }, Enum.EasingStyle.Back, Enum.EasingDirection.In)
		tbl5.tween(v9, 0.25, { ImageTransparency = 1 }, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		task.wait(0.18)
		tbl5.tween(round, 0.6, { CornerRadius = UDim.new(0, 16) })
		local v11 = tbl5.tween(holder, 0.7, { Size = size2 }, Enum.EasingStyle.Back)
		task.wait(0.3)
		v9.Visible = false
		arg.PageHolder:SetAttribute("GlassHide", true)

		for _, section in ipairs(arg.Sections) do
			section.Visible = true
		end

		arg.Goo.Visible = true
		arg:Fade(true, 0.45)
		v11.Completed:Wait()
		task.wait(0.1)
		arg.PageHolder:SetAttribute("GlassHide", nil)
		tbl12.setAccent(tbl12.accent)
	end

	arg.Busy = false
end

tbl12.flyoutHook = function(arg, arg2, arg3)
	local window = tbl7.Window

	if window and window.GlassOn then
		arg.BackgroundColor3 = tbl2.window
		arg.BackgroundTransparency = 0.45
		glass.new(arg, { blur = true, liquidglass = true, rim = false, sheen = false, inset = 6, lensThickness = 0.05 })

		for _, v9 in ipairs(arg2) do
			local v10 = arg3[v9.Name]
			v9:SetAttribute("On", 0.9)
			v9:SetAttribute("Off", 0.97)
			v9.BackgroundTransparency = v10 and 0.9 or 0.97
			glass.new(v9, { blur = false, liquidglass = true, sheen = false, rimTransparency = 0.88 })
		end
	else
		arg.BackgroundColor3 = tbl3[window and window.ThemeName or "Blue"].base:Lerp(tbl2.white, 0.06)
		arg.BackgroundTransparency = 0.07
	end
end

index2.Dialog = function(arg, arg2)
	local tbl17 = arg2 or {}
	tbl12.closeFlyouts()
	local frame = arg.Frame
	local tweenInfo = TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
	local tweenInfo2 = TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

	local v9 = tbl5.corner(tbl5.button(frame, "Smoke", {
		BackgroundColor3 = tbl2.black,
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ZIndex = 100,
	}), 16)

	local corner = tbl5.corner
	local make = tbl5.make

	local v10 = corner(make("CanvasGroup", {
		Name = "Dialog",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(tbl17.Width or 360, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Color3.fromRGB(43, 43, 43),
		GroupTransparency = 1,
		ZIndex = 101,
	}, frame), 8)

	local UIScale = tbl5.make("UIScale", { Scale = 1.05 }, v10)
	tbl5.make("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }, v10)

	local Frame2 = tbl5.make("Frame", {
		Name = "Content",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = 1,
		ZIndex = 102,
	}, v10)

	tbl5.make("UIPadding", {
		PaddingTop = UDim.new(0, 24),
		PaddingBottom = UDim.new(0, 24),
		PaddingLeft = UDim.new(0, 24),
		PaddingRight = UDim.new(0, 24),
	}, Frame2)

	tbl5.make("UIListLayout", { Padding = UDim.new(0, 12), SortOrder = Enum.SortOrder.LayoutOrder }, Frame2)

	local tbl18 = {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		TextWrapped = true,
		TextTruncate = Enum.TextTruncate.None,
		ZIndex = 102,
	}

	tbl5.text(Frame2, "Title", tbl17.Title or "", 20, tbl2.white, Enum.FontWeight.SemiBold, tbl18).LayoutOrder = 1
	local v11 = tbl5.text(Frame2, "Body", tbl17.Content or "", 14, Color3.fromRGB(206, 206, 210), nil, tbl18)
	local top = Enum.TextYAlignment.Top
	v11.LayoutOrder = 2
	v11.TextYAlignment = top
	v11.LineHeight = 1.2

	local Frame3 = tbl5.make("Frame", {
		Name = "Footer",
		BackgroundColor3 = Color3.fromRGB(32, 32, 32),
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 80),
		LayoutOrder = 2,
		ZIndex = 102,
	}, v10)

	tbl5.make("UIPadding", { PaddingLeft = UDim.new(0, 24), PaddingRight = UDim.new(0, 24) }, Frame3)

	tbl5.make("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0, 8),
		SortOrder = Enum.SortOrder.LayoutOrder,
	}, Frame3)

	local contextual = Enum.ApplyStrokeMode.Contextual
	tbl5.stroke(v10, 0.88).ApplyStrokeMode = contextual
	local tbl19 = {}

	for _, descendant in ipairs(ScreenGui:GetDescendants()) do
		if descendant:IsA("ScrollingFrame") and descendant.ScrollingEnabled then
			descendant.ScrollingEnabled = false
			tbl19[#tbl19 + 1] = descendant
		end
	end

	local flag3 = false

	local function fn37(arg3)
		if flag3 then
			return
		end
		flag3 = true

		for _, v12 in ipairs(tbl19) do
			v12.ScrollingEnabled = true
		end

		tbl.TS:Create(v9, tweenInfo2, { BackgroundTransparency = 1 }):Play()
		tbl.TS:Create(UIScale, tweenInfo2, { Scale = 1.05 }):Play()
		local tween = tbl.TS:Create(v10, tweenInfo2, { GroupTransparency = 1 })
		tween:Play()

		tween.Completed:Connect(function()
			v9:Destroy()
			v10:Destroy()
		end)

		if arg3 then
			task.spawn(tbl7.SafeCallback, tbl7, arg3)
		end
	end

	local buttons = tbl17.Buttons or { { Title = "OK" } }

	for i, button in ipairs(buttons) do
		local flag4 = i == 1

		local v12 = tbl5.corner(tbl5.button(Frame3, button.Title or "Button", {
			BackgroundColor3 = flag4 and tbl12.accent or tbl2.white,
			BackgroundTransparency = flag4 and 0 or 0.94,
			Size = UDim2.new(1 / #buttons, -4, 0, 32),
			LayoutOrder = i,
			ZIndex = 103,
		}), 5)

		if not flag4 then
			tbl5.stroke(v12, 0.9)
		end

		tbl5.text(v12, "Label", button.Title or "Button", 14, flag4 and tbl2.black or tbl2.white, flag4 and Enum.FontWeight.SemiBold or nil, { Size = UDim2.fromScale(1, 1), TextXAlignment = Enum.TextXAlignment.Center, ZIndex = 104 })
		local UIScale2 = tbl5.make("UIScale", {}, v12)
		local backgroundTransparency = v12.BackgroundTransparency
		local backgroundColor3 = v12.BackgroundColor3

		v12.MouseEnter:Connect(function()
			if flag4 then
				tbl5.tween(v12, 0.2, { BackgroundColor3 = backgroundColor3:Lerp(tbl2.white, 0.12) })
			else
				tbl5.tween(v12, 0.2, { BackgroundTransparency = backgroundTransparency - 0.03 })
			end
		end)

		v12.MouseLeave:Connect(function()
			tbl5.tween(v12, 0.2, { BackgroundColor3 = backgroundColor3, BackgroundTransparency = backgroundTransparency })
			tbl5.tween(UIScale2, 0.35, { Scale = 1 }, Enum.EasingStyle.Back)
		end)

		v12.MouseButton1Down:Connect(function()
			tbl5.tween(UIScale2, 0.2, { Scale = 0.97 })
		end)

		v12.MouseButton1Up:Connect(function()
			tbl5.tween(UIScale2, 0.35, { Scale = 1 }, Enum.EasingStyle.Back)
		end)

		v12.Activated:Connect(function()
			fn37(button.Callback)
		end)
	end

	tbl.TS:Create(v9, tweenInfo, { BackgroundTransparency = 0.5 }):Play()
	tbl.TS:Create(v10, TweenInfo.new(0.25, Enum.EasingStyle.Quint), { GroupTransparency = 0 }):Play()
	tbl.TS:Create(UIScale, tweenInfo, { Scale = 1 }):Play()

	return { Close = function()
		fn37()
	end }
end

tbl7.Dialog = function(arg, arg2)
	return tbl7.Window and tbl7.Window:Dialog(arg2)
end

index.AddInterface = function(arg, arg2)
	local window = arg.Window
	local v9 = arg:AddSection(arg2 or "Interface")

	local NightGlass_Glass = v9:AddToggle("NightGlass_Glass", {
		Title = "Liquid Glass",
		Description = "Blur and refraction behind the window",
		Icon = "wand-2",
		Default = window.GlassOn,
		Callback = function(arg3)
			window:SetGlass(arg3)
		end,
	})

	local NightGlass_Blur = v9:AddSlider("NightGlass_Blur", {
		Title = "Blur strength",
		Description = "How strong the background blur is",
		Icon = "droplets",
		Min = 0,
		Max = 100,
		Default = window.BlurValue,
		Suffix = "%",
		Callback = function(arg3)
			window:SetBlur(arg3)
		end,
	})

	v9:AddSlider("NightGlass_Depth", {
		Title = "Glass depth",
		Description = "How much the glass bends what is behind it",
		Icon = "layers",
		Min = 0,
		Max = 100,
		Default = window.DepthValue,
		Suffix = "%",
		Callback = function(arg3)
			window:SetDepth(arg3)
		end,
	})

	v9:AddToggle("NightGlass_CardGlass", {
		Title = "Glass on elements",
		Description = "Liquid glass on every card too. Turn off on a slow PC, the window keeps its glass",
		Icon = "layers",
		Default = window.CardGlass ~= false,
		Callback = function(cardGlass)
			window.CardGlass = cardGlass

			for _, v10 in ipairs(window:Cards()) do
				window:StyleCard(v10)
			end
		end,
	})

	v9:AddDropdown("NightGlass_Theme", {
		Title = "Theme",
		Description = "Accent color, and the window color without glass",
		Icon = "palette",
		Values = tbl4,
		Default = window.ThemeName,
		Callback = function(arg3)
			window:SetTheme(arg3)
		end,
	})

	v9:AddKeybind("NightGlass_MenuKey", {
		Title = "Minimize key",
		Description = "Hide or show the window",
		Icon = "keyboard",
		Default = typeof(window.MinimizeKey) == "EnumItem" and window.MinimizeKey.Name or tostring(window.MinimizeKey),
		ChangedCallback = function(minimizeKey)
			window.MinimizeKey = minimizeKey
		end,
	})

	local flag3 = false

	local function fn37()
		if flag3 or window.Busy or not window.GlassOn or NightGlass_Blur.Card:GetAttribute("Dragging") then
			return
		end

		if (NightGlass_Blur.Card:GetAttribute("Value") or 100) >= 10 then
			return
		end
		flag3 = true

		tbl7:Notify({
			Title = "Blur is too low",
			Content = "Liquid Glass needs at least 10% blur.",
			Kind = "warn",
			Duration = 4,
		})

		window:Dialog({
			Title = "Blur is too low",
			Content = "Liquid Glass needs at least 10% blur to look right. Raise the blur to 20%, or turn Liquid Glass off.",
			Buttons = {
				{
					Title = "Raise to 20%",
					Callback = function()
						flag3 = false
						NightGlass_Blur:SetValue(20)
					end,
				},
				{
					Title = "Turn off Glass",
					Callback = function()
						flag3 = false
						NightGlass_Glass:SetValue(false)
					end,
				},
			},
		})
	end

	NightGlass_Blur.Card:GetAttributeChangedSignal("Value"):Connect(fn37)
	NightGlass_Blur.Card:GetAttributeChangedSignal("Dragging"):Connect(fn37)
	local Configuration = arg:AddSection("Configuration")

	Configuration:AddButton({
		Title = "Save config",
		Description = "Write every setting to disk now",
		Icon = "save",
		Label = "Save",
		Callback = function()
			local v10, v11 = tbl7:SaveConfig()

			tbl7:Notify({
				Title = v10 and "Config saved" or "Save failed",
				Content = v10 and "Saved to " .. v11 or tostring(v11),
				Kind = v10 and "good" or "bad",
				Duration = 3,
			})
		end,
	})

	Configuration:AddButton({
		Title = "Load config",
		Description = "Restore the last saved settings",
		Icon = "folder-open",
		Label = "Load",
		Callback = function()
			local v10, v11 = tbl7:LoadConfig()

			if not v10 then
				tbl7:Notify({ Title = "Nothing to load", Content = tostring(v11), Kind = "warn", Duration = 3 })
			end
		end,
	})

	Configuration:AddButton({
		Title = "Delete config",
		Description = "Remove the saved file for this game",
		Icon = "trash-2",
		Label = "Delete",
		Callback = function()
			tbl7:DeleteConfig()
			tbl7:Notify({ Title = "Config deleted", Kind = "info", Duration = 3 })
		end,
	})

	return v9
end

local tbl17 = { size = 48, orb = 35, lead = 64 }

index2.BuildDock = function(arg)
	local size2 = tbl17.size

	local v9 = tbl5.button(ScreenGui, "Dock", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0, 44, 0.5, 0),
		Size = UDim2.fromOffset(size2, size2),
		BackgroundColor3 = tbl2.window,
		BackgroundTransparency = 0.45,
		ZIndex = 50,
	})

	tbl5.corner(v9, UDim.new(1, 0))
	tbl5.stroke(v9, 0.85).Name = "Line"
	local make = tbl5.make

	local ImageLabel = make("ImageLabel", {
		Name = "Logo",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(0.62, 0.62),
		BackgroundTransparency = 1,
		Image = arg.Config.Logo or tbl2.logo,
		ZIndex = 53,
	}, v9)

	local v10 = tbl5.corner(tbl5.make("Frame", {
		Name = "State",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.85, 0, 0.85, 0),
		Size = UDim2.fromOffset(10, 10),
		BackgroundColor3 = tbl12.accent,
		BorderSizePixel = 0,
		ZIndex = 54,
	}, v9), UDim.new(1, 0))

	tbl5.stroke(v10, 0, tbl2.window, 2)
	arg.Dock = v9
	arg.DockLogo = ImageLabel
	arg.DockState = v10
	local v11 = tbl6.spring(0, 320, 13)
	local v12 = tbl6.spring(0, 300, 24)

	local function fn37()
		local n5 = tbl17.size * (1 + v11.x * 0.14 + v12.x * 0.06)
		v9.Size = UDim2.fromOffset(n5, n5)
	end

	local function fn38(arg2)
		local v13 = table.pack(tbl6.step(v11, arg2))
		local v14 = table.pack(tbl6.step(v12, arg2))
		fn37()
		local v15

		if v13[1] then
			v15 = v14[1]
		else
			v15 = v13[1]
		end

		return v15
	end

	arg.PopDock = function(arg2, arg3)
		local v13 = v11
		v13.v = v13.v + (arg3 or 3)
		tbl6.run(fn38)
	end

	v9.MouseEnter:Connect(function()
		v12.t = 1
		tbl6.run(fn38)
	end)

	v9.MouseLeave:Connect(function()
		v12.t = 0
		tbl6.run(fn38)
	end)

	local flag3 = nil
	local v13 = nil
	local n5 = nil
	local flag4 = nil

	v9.InputBegan:Connect(function(input)
		if not tbl5.click(input) then
			return
		end
		local position = input.Position
		flag3 = true
		flag4 = false
		v13 = position
		n5 = v9.AbsolutePosition + v9.AbsoluteSize / 2 - ScreenGui.AbsolutePosition
	end)

	tbl7:Connect(tbl.UIS.InputChanged, function(arg2)
		local flag5

		if not flag3 then
			flag5 = not flag3
		else
			flag5 = not tbl5.move(arg2)
		end

		if flag5 then
			return
		end
		local n6, flag6

		if not flag4 then
			n6 = arg2.Position - v13
			flag6 = n6.Magnitude < 5
		else
			n6 = arg2.Position - v13
			flag6 = not flag4
		end

		if flag6 then
			return
		end

		if nil --[[?BoxPart]] then
			return
		end
		flag4 = true
		local absoluteSize = ScreenGui.AbsoluteSize
		local n7 = tbl17.size / 2 + 4
		v9.Position = UDim2.fromOffset(math.clamp(n5.X + n6.X, n7, absoluteSize.X - n7), math.clamp(n5.Y + n6.Y, n7, absoluteSize.Y - n7))
	end)

	tbl7:Connect(tbl.UIS.InputEnded, function(arg2)
		if not flag3 or not tbl5.click(arg2) then
			return
		end
		flag3 = false

		if not flag4 then
			arg:PopDock(-1.5)
			arg:ToggleMinimize()
		end
	end)
end

index2.StyleDock = function(arg)
	local dock = arg.Dock
	if not dock then
		return
	end
	arg.DockState.BackgroundColor3 = tbl12.accent
	local v9 = tbl3[arg.ThemeName]

	if arg.GlassOn then
		dock.BackgroundColor3 = tbl2.window
		dock.BackgroundTransparency = 0.45
		glass.new(dock, { blur = true, liquidglass = true, sheen = false, rimThickness = 1.5, inset = 3 })
	else
		glass.remove(dock)
		dock.BackgroundColor3 = v9.base
		dock.BackgroundTransparency = 0.07
	end

	local backgroundColor3 = dock.BackgroundColor3
	arg.DockState:FindFirstChildOfClass("UIStroke").Color = backgroundColor3
end

index2.Center = function(arg, arg2)
	return arg2.AbsolutePosition + arg2.AbsoluteSize / 2 - ScreenGui.AbsolutePosition
end

index2.Fly = function(arg, arg2, arg3, arg4, arg5)
	local holder, orb, n5, magnitude, unit

	if (arg3 - arg2).Magnitude > 1 then
		holder = arg.Holder
		orb = tbl17.orb
		n5 = arg3 - arg2
		magnitude = (arg3 - arg2).Magnitude
		unit = Vector2.new(-n5.Y, n5.X).Unit
	else
		holder = arg.Holder
		orb = tbl17.orb
		n5 = arg3 - arg2
		magnitude = (arg3 - arg2).Magnitude
		unit = (arg3 - arg2).Magnitude > 1
	end

	unit = unit or Vector2.zero

	if unit.Y > 0 then
		unit = -unit
	end

	local v9 = table.pack(os.clock())
	local v10 = table.pack(math.max(magnitude / arg4 * 1.8, 1))
	local n6 = arg2 + n5 / 2 + unit * magnitude * 0.2
	local v11 = v9[1]
	local v12 = v10[1]
	local v13 = arg2

	while true do
		local v14 = table.pack(tbl.Run.RenderStepped:Wait())
		local v15 = table.pack(math.clamp((os.clock() - v11) / arg4, 0, 1))
		local v16, v17, ts, getValue, quint

		if arg5 then
			v16 = v14[1]
			v17 = v15[1]
			ts = tbl.TS
			getValue = tbl.TS.GetValue
			quint = arg5
		else
			v16 = v14[1]
			v17 = v15[1]
			ts = tbl.TS
			getValue = tbl.TS.GetValue
			quint = Enum.EasingStyle.Quint
		end

		local v18 = table.pack(getValue(ts, v17, quint, Enum.EasingDirection.InOut))
		local v19 = table.pack(v13:Lerp(n6, v18[1]))
		local v20 = table.pack((v19[1]):Lerp(n6:Lerp(arg3, v18[1]), v18[1]))
		local n7 = v20[1] - arg2
		arg2 = v20[1]
		local v21 = n7
		local v22 = table.pack(math.max(v16, 0.001))
		local v23 = table.pack(math.clamp((v21 / v22[1]).Magnitude / v12, 0, 1))
		local v24, unit2

		if (v21 / v22[1]).Magnitude > 1 then
			local n8 = v21 / v22[1]
			v24 = v23[1]
			unit2 = n8.Unit
		else
			unit2 = (v21 / v22[1]).Magnitude > 1
			v24 = v23[1]
		end

		unit2 = unit2 or Vector2.zero
		local n8 = orb * (1 + 0.34 * v24 * math.abs(unit2.X) - 0.16 * v24 * math.abs(unit2.Y))
		local n9 = math.abs(unit2.Y)
		local v25 = table.pack(math.abs(unit2.X))
		holder.Position = UDim2.fromOffset(arg2.X, arg2.Y)
		holder.Size = UDim2.fromOffset(n8, orb * (1 + 0.34 * v24 * n9 - 0.16 * v24 * v25[1]))
		if not (v17 >= 1) then
			continue
		end
		break
	end

	holder.Size = UDim2.fromOffset(orb, orb)
end

index2.Merge = function(...) --[[ unresolved LuaFunc at 2,388597 - 2,394026 ]] return nil end

index2.ToggleMinimize = function(arg)
	if arg.Busy or tbl7.Unloaded then
		return
	end
	task.spawn(arg.Minimized and arg.Restore or arg.Minimize, arg)
end

index2.Minimize = function(arg)
	if arg.Busy or arg.Minimized then
		return
	end
	arg.Busy = true
	tbl12.closeFlyouts()
	local holder = arg.Holder
	local orb = tbl17.orb
	arg.RestoreSize = holder.Size
	arg.RestoreCenter = arg:Center(holder)
	arg:Fade(false, 0.2)
	arg.Goo.Visible = false

	for k in pairs(arg.Shadows) do
		tbl5.tween(k, 0.3, { BackgroundTransparency = 1 })
	end

	task.wait(0.2)

	for _, section in ipairs(arg.Sections) do
		section.Visible = false
	end

	holder.Position = UDim2.fromOffset(arg.RestoreCenter.X, arg.RestoreCenter.Y)
	tbl5.tween(arg.Round, 0.45, { CornerRadius = UDim.new(0, orb / 2) }, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
	tbl5.tween(holder, 0.45, { Size = UDim2.fromOffset(orb, orb) }, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut).Completed:Wait()
	local v9 = arg:Center(arg.Dock)
	local n5 = arg.RestoreCenter - v9
	local unit = n5.Magnitude > 1 and n5.Unit or Vector2.new(1, 0)
	arg:Fly(arg.RestoreCenter, v9 + unit * tbl17.lead, 0.6)
	local v10, v11 = arg:Merge(unit, true)
	holder.Visible = false
	v11()
	arg:PopDock(3.2)
	tbl5.tween(arg.DockState, 0.3, { Size = UDim2.fromOffset(0, 0) }, Enum.EasingStyle.Back, Enum.EasingDirection.In)
	arg.Minimized = true
	arg.Busy = false
end

index2.Restore = function(arg)
	if arg.Busy or not arg.Minimized then
		return
	end
	arg.Busy = true
	local holder = arg.Holder
	local orb = tbl17.orb
	local v9 = arg:Center(arg.Dock)
	local absoluteSize = ScreenGui.AbsoluteSize
	local restoreSize = arg.RestoreSize or arg.Size
	local restoreCenter = arg.RestoreCenter or absoluteSize / 2
	local vector2 = Vector2.new(math.clamp(restoreCenter.X, restoreSize.X.Offset / 2 + 8, math.max(absoluteSize.X - restoreSize.X.Offset / 2 - 8, restoreSize.X.Offset / 2 + 8)), math.clamp(restoreCenter.Y, restoreSize.Y.Offset / 2 + 8, math.max(absoluteSize.Y - restoreSize.Y.Offset / 2 - 8, restoreSize.Y.Offset / 2 + 8)))
	local n5 = vector2 - v9
	local unit = n5.Magnitude > 1 and n5.Unit or Vector2.new(1, 0)
	tbl5.tween(arg.DockState, 0.35, { Size = UDim2.fromOffset(10, 10) }, Enum.EasingStyle.Back)
	local v10, v11 = arg:Merge(unit, false)
	holder.Size = UDim2.fromOffset(orb, orb)
	holder.Position = UDim2.fromOffset(v10.X, v10.Y)
	arg.Round.CornerRadius = UDim.new(0, orb / 2)
	holder.Visible = true
	tbl.Run.RenderStepped:Wait()
	v11()
	arg:Fly(v10, vector2, 0.55)
	arg.Minimized = false
	tbl5.tween(arg.Round, 0.6, { CornerRadius = UDim.new(0, 16) })
	local v12 = tbl5.tween(holder, 0.7, { Size = restoreSize }, Enum.EasingStyle.Back)

	for k, shadow in pairs(arg.Shadows) do
		if not arg.GlassOn then
			tbl5.tween(k, 0.6, { BackgroundTransparency = shadow })
		end
	end

	task.wait(0.28)
	arg.PageHolder:SetAttribute("GlassHide", true)

	for _, section in ipairs(arg.Sections) do
		section.Visible = true
	end

	arg.Goo.Visible = true
	arg:Fade(true, 0.45)
	v12.Completed:Wait()
	task.wait(0.1)
	arg.PageHolder:SetAttribute("GlassHide", nil)
	tbl12.setAccent(tbl12.accent)
	arg.Busy = false

	if arg.Want ~= nil and arg.Want ~= arg.GlassOn then
		task.spawn(arg.Transition, arg)
	end
end

index2.ToggleMaximize = function(arg)
	if arg.Busy or arg.Minimized then
		return
	end
	local holder = arg.Holder
	local icon = arg.CapButtons.Maximize.Icon

	if not arg.Maximized then
		local size2 = holder.Size
		local v9 = arg:Center(holder)
		arg.NormalSize = size2
		arg.NormalCenter = v9
		local absoluteSize = ScreenGui.AbsoluteSize
		local n5 = math.max(tbl.GuiS:GetGuiInset().Y, 36) + 12
		local n6 = math.max(absoluteSize.X - 160, arg.Size.X.Offset)
		local n7 = math.max(absoluteSize.Y - n5 - 24, arg.Size.Y.Offset)
		holder.Position = UDim2.fromOffset(arg.NormalCenter.X, arg.NormalCenter.Y)
		tbl5.tween(holder, 0.5, { Size = UDim2.fromOffset(n6, n7), Position = UDim2.fromOffset(absoluteSize.X / 2, n5 + n7 / 2) })
		icon.Image = tbl5.icon("copy") or icon.Image
		arg.Maximized = true
	else
		tbl5.tween(holder, 0.5, { Size = arg.NormalSize, Position = UDim2.fromOffset(arg.NormalCenter.X, arg.NormalCenter.Y) })
		icon.Image = tbl5.icon("square") or icon.Image
		arg.Maximized = false
	end
end

index2.Close = function(arg)
	if arg.Busy then
		return
	end

	arg:Dialog({
		Title = "Close " .. (arg.Config.Title or "Night Hub") .. "?",
		Content = "The window and every running feature will be unloaded. Your settings are saved.",
		Buttons = {
			{
				Title = "Close",
				Callback = function()
					task.spawn(arg.Shutdown, arg)
				end,
			},
			{ Title = "Cancel" },
		},
	})
end

index2.Shutdown = function(arg)
	if arg.Busy then
		return
	end
	arg.Busy = true
	local holder = arg.Holder
	local orb = tbl17.orb

	if not arg.Minimized then
		arg:Fade(false, 0.2)
		arg.Goo.Visible = false

		for k in pairs(arg.Shadows) do
			tbl5.tween(k, 0.3, { BackgroundTransparency = 1 })
		end

		task.wait(0.2)

		for _, section in ipairs(arg.Sections) do
			section.Visible = false
		end

		tbl5.tween(arg.Round, 0.45, { CornerRadius = UDim.new(0, orb / 2) }, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
		tbl5.tween(holder, 0.45, { Size = UDim2.fromOffset(orb, orb) }, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut).Completed:Wait()
		tbl5.tween(holder, 0.3, { Size = UDim2.fromOffset(0, 0) }, Enum.EasingStyle.Back, Enum.EasingDirection.In)
	end

	tbl5.tween(arg.Dock, 0.3, { Size = UDim2.fromOffset(0, 0) }, Enum.EasingStyle.Back, Enum.EasingDirection.In)
	task.wait(0.32)
	tbl7:Destroy()
end

index2.BuildCaption = function(arg)
	local capButtons = arg.CapButtons

	capButtons.Minimize.Activated:Connect(function()
		arg:ToggleMinimize()
	end)

	capButtons.Maximize.Activated:Connect(function()
		arg:ToggleMaximize()
	end)

	capButtons.Close.Activated:Connect(function()
		arg:Close()
	end)
end

tbl7.Destroy = function()
	if tbl7.Unloaded then
		return
	end

	if tbl7.Settings and tbl7.Settings.Save ~= false then
		pcall(tbl7.SaveConfig, tbl7)
	end

	tbl7.Unloaded = true
	pcall(tbl12.closeFlyouts)

	for _, connection in ipairs(tbl7.Connections) do
		pcall(function()
			connection:Disconnect()
		end)
	end

	table.clear(tbl7.Connections)
	glass.clear()
	ScreenGui:Destroy()
	tbl7.Window = nil
	tbl7:SafeCallback(tbl7.OnUnload)
end

index2.SetKey = function(arg, minimizeKey)
	if typeof(minimizeKey) == "EnumItem" then
		minimizeKey = minimizeKey.Name
	end

	if type(minimizeKey) == "string" and minimizeKey ~= "" and minimizeKey ~= "None" then
		arg.MinimizeKey = minimizeKey
	end
end

tbl7.Toggle = function()
	if tbl7.Window then
		tbl7.Window:ToggleMinimize()
	end
end

local tbl18

tbl18 = {
	folder = "Night Hub/avatars",
	epoch = 1420070400000,
	divide = function(arg, arg2)
		local tbl19 = {}
		local n5 = 0

		for i = 1, #arg do
			local n6 = n5 * 10 + tonumber(string.sub(arg, i, i))
			local n7 = n6 // arg2
			n5 = n6 % arg2

			if #tbl19 > 0 or n7 > 0 then
				tbl19[#tbl19 + 1] = tostring(n7)
			end
		end

		return #tbl19 > 0 and table.concat(tbl19) or "0", n5
	end,
	url = function(arg, arg2)
		if type(arg2) == "string" and string.find(arg2, "^https?://") then
			return arg2
		end

		if type(arg2) == "string" and arg2 ~= "" then
			return "https://cdn.discordapp.com/avatars/" .. arg .. "/" .. arg2 .. ".png?size=256"
		end
		local v9, v10 = tbl18.divide(tbl18.divide(arg, 4194304), 6)
		return "https://cdn.discordapp.com/embed/avatars/" .. v10 .. ".png"
	end,
	since = function(arg)
		local ok, result = pcall(function()
			local v9 = tonumber
			local v10 = tbl18.divide(arg, 4194304)
			return DateTime.fromUnixTimestampMillis(v9(v10) + tbl18.epoch):FormatLocalTime("MMM D, YYYY", "en-us")
		end)

		return ok and result or "Unknown"
	end,
	fetch = function(arg, arg2)
		if type(arg2) == "string" and string.find(arg2, "^rbxasset") then
			return arg2
		end
		local request_ = syn and syn.request or http and http.request or http_request or request
		if type(request_) ~= "function" or type(writefile) ~= "function" or type(getcustomasset) ~= "function" then
			return nil
		end
		local ok, result = pcall(request_, { Url = tbl18.url(arg, arg2), Method = "GET" })
		if not ok or type(result) ~= "table" or result.StatusCode and result.StatusCode ~= 200 or type(result.Body) ~= "string" then
			return nil
		end

		if type(makefolder) == "function" and type(isfolder) == "function" then
			for _, v9 in ipairs({ "Night Hub", tbl18.folder }) do
				if not isfolder(v9) then
					pcall(makefolder, v9)
				end
			end
		end

		local str = tbl18.folder .. "/" .. arg .. "_" .. string.sub(type(arg2) == "string" and arg2 ~= "" and string.gsub(arg2, "%W", "") or "default", -32) .. ".png"
		if not pcall(writefile, str, result.Body) then
			return nil
		end
		local ok2, result2 = pcall(getcustomasset, str)
		return ok2 and result2 or nil
	end,
}

index2.BuildProfile = function(arg)
	arg.ProfileData = {}
	arg:SetProfile(arg.Config.Profile or {})

	arg.Profile.Activated:Connect(function()
		if arg.Busy then
			return
		end

		if arg.ProfileCard then
			return arg:CloseProfile()
		end
		local discordId = arg.ProfileData.DiscordId

		if type(discordId) ~= "string" or not string.find(discordId, "^%d+$") then
			tbl7:Notify({
				Title = "Pro feature",
				Content = "Your want pro plan to do this activity",
				Kind = "warn",
				Duration = 4,
			})

			return
		end

		arg:OpenProfile()
	end)
end

index2.SetProfile = function(arg, arg2)
	local tbl19 = arg2 or {}

	if type(tbl19.DiscordId) == "number" then
		warn("NightGlass: DiscordId must be a string, a number loses precision")
		tbl19.DiscordId = nil
	end

	for k, v9 in pairs(tbl19) do
		arg.ProfileData[k] = v9
	end

	local profileData = arg.ProfileData
	local localPlayer = tbl.Players.LocalPlayer
	arg.NameLabel.Text = profileData.DisplayName or profileData.Username or localPlayer and localPlayer.DisplayName or "Guest"

	if profileData.Plan then
		arg.PlanLabel.Text = "Plan: " .. profileData.Plan .. (profileData.Term and " - " .. profileData.Term or "")
		arg.PlanLabel.TextColor3 = tbl2.gold
	else
		arg.PlanLabel.Text = "Free Plan"
		arg.PlanLabel.TextColor3 = tbl2.sub
	end

	if profileData.DiscordId then
		task.spawn(function()
			local v9 = tbl18.fetch(profileData.DiscordId, profileData.Avatar)
			if not v9 or tbl7.Unloaded then
				return
			end
			arg.AvatarContent = v9
			arg.Avatar.Photo.Image = v9
			arg.Avatar.Placeholder.Visible = false
		end)
	end
end

index2.OpenProfile = function(arg)
	local profileData = arg.ProfileData
	local localPlayer = tbl.Players.LocalPlayer
	local n5 = profileData.Plan and 392 or 344
	local window = arg.GlassOn and tbl2.window or tbl3[arg.ThemeName].base
	local v9 = tbl5.button(ScreenGui, "ProfileBlocker", { Size = UDim2.fromScale(1, 1), ZIndex = 119 })

	local v10 = tbl5.corner(tbl5.make("Frame", {
		Name = "ProfileCard",
		BackgroundColor3 = window,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromOffset(300, n5),
		ZIndex = 120,
	}, ScreenGui), 12)

	local v11 = tbl5.stroke(v10, 1)

	local v12 = tbl5.corner(tbl5.make("CanvasGroup", {
		Name = "Body",
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		GroupTransparency = 1,
		ZIndex = 121,
	}, v10), 12)

	local Frame2 = tbl5.make("Frame", {
		Name = "Banner",
		BackgroundColor3 = tbl12.accent,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 96),
		ZIndex = 121,
	}, v12)

	tbl5.make("UIGradient", { Rotation = 20, Color = ColorSequence.new(tbl12.accent, tbl12.accent:Lerp(tbl2.black, 0.55)) }, Frame2)

	local v13 = tbl5.corner(tbl5.make("Frame", {
		Name = "Ring",
		BackgroundColor3 = window,
		BorderSizePixel = 0,
		Position = UDim2.fromOffset(14, 50),
		Size = UDim2.fromOffset(92, 92),
		ZIndex = 122,
	}, v12), UDim.new(1, 0))

	local corner = tbl5.corner
	local make = tbl5.make

	local v14 = corner(make("ImageLabel", {
		Name = "Avatar",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(80, 80),
		BackgroundColor3 = Color3.fromRGB(88, 101, 242),
		Image = arg.AvatarContent or "",
		ZIndex = 123,
	}, v13), UDim.new(1, 0))

	if not arg.AvatarContent then
		tbl5.image(v14, "Glyph", "user", 36, { AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), ZIndex = 124 })
	end

	local v15 = tbl5.corner(tbl5.make("Frame", {
		Name = "Status",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromOffset(78, 78),
		Size = UDim2.fromOffset(24, 24),
		BackgroundColor3 = window,
		BorderSizePixel = 0,
		ZIndex = 124,
	}, v13), UDim.new(1, 0))

	tbl5.corner(tbl5.make("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(16, 16),
		BackgroundColor3 = Color3.fromRGB(35, 165, 90),
		BorderSizePixel = 0,
		ZIndex = 125,
	}, v15), UDim.new(1, 0))

	if profileData.Plan then
		local v16 = tbl5.corner(tbl5.make("Frame", {
			Name = "Badge",
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -14, 0, 106),
			Size = UDim2.fromOffset(0, 24),
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundColor3 = tbl2.black,
			BackgroundTransparency = 0.55,
			ZIndex = 122,
		}, v12), UDim.new(1, 0))

		tbl5.make("UIPadding", { PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10) }, v16)
		tbl5.stroke(v16, 0.6, tbl2.gold)

		tbl5.text(v16, "Label", string.upper(profileData.Plan) .. (profileData.Term and " · " .. profileData.Term or ""), 11, tbl2.gold, Enum.FontWeight.Bold, {
			Size = UDim2.fromScale(0, 1),
			AutomaticSize = Enum.AutomaticSize.X,
			TextTruncate = Enum.TextTruncate.None,
			ZIndex = 123,
		})
	end

	tbl5.text(v12, "Display", profileData.DisplayName or profileData.Username or "Discord user", 20, tbl2.white, Enum.FontWeight.Bold, { Position = UDim2.fromOffset(18, 148), Size = UDim2.new(1, -36, 0, 24), ZIndex = 122 })
	tbl5.text(v12, "Username", profileData.Username or "id " .. tostring(profileData.DiscordId), 13, tbl2.sub, Enum.FontWeight.Medium, { Position = UDim2.fromOffset(18, 174), Size = UDim2.new(1, -36, 0, 16), ZIndex = 122 })

	local v16 = tbl5.corner(tbl5.make("Frame", {
		Name = "Info",
		BackgroundColor3 = tbl2.black,
		BackgroundTransparency = 0.6,
		BorderSizePixel = 0,
		Position = UDim2.fromOffset(12, 202),
		Size = UDim2.new(1, -24, 0, n5 - 214),
		ZIndex = 122,
	}, v12), 8)

	tbl5.make("UIPadding", { PaddingTop = UDim.new(0, 12), PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 12) }, v16)
	tbl5.make("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder }, v16)

	local function fn37(arg2, arg3)
		return (tbl5.text(v16, "Label", arg2, 11, tbl2.white, Enum.FontWeight.Bold, { Size = UDim2.new(1, 0, 0, 16), LayoutOrder = arg3, ZIndex = 123 }))
	end

	local function fn38(arg2, arg3)
		return tbl5.text(v16, "Value", arg2, 13, Color3.fromRGB(220, 220, 224), nil, { Size = UDim2.new(1, 0, 0, 18), LayoutOrder = arg3, ZIndex = 123 })
	end

	fn37("MEMBER SINCE", 1)
	fn38(tbl18.since(profileData.DiscordId), 2)
	tbl5.make("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 6), LayoutOrder = 3 }, v16)
	fn37("ROBLOX ACCOUNT", 4)

	local Frame3 = tbl5.make("Frame", {
		Name = "Roblox",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 30),
		LayoutOrder = 5,
		ZIndex = 123,
	}, v16)

	local v17 = tbl5.corner(tbl5.make("ImageLabel", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.fromOffset(26, 26),
		BackgroundColor3 = Color3.fromRGB(60, 60, 64),
		ZIndex = 124,
	}, Frame3), UDim.new(1, 0))

	tbl5.text(Frame3, "Name", localPlayer and localPlayer.DisplayName .. "  @" .. localPlayer.Name or "Guest", 13, tbl2.white, Enum.FontWeight.Medium, { Position = UDim2.fromOffset(34, 0), Size = UDim2.new(1, -34, 1, 0), ZIndex = 124 })

	if localPlayer then
		task.spawn(function()
			local ok, image = pcall(tbl.Players.GetUserThumbnailAsync, tbl.Players, localPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)

			if ok and v17.Parent then
				v17.Image = image
			end
		end)
	end

	if profileData.Plan then
		tbl5.make("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 6), LayoutOrder = 6 }, v16)
		fn37("PLAN", 7)
		fn38(profileData.Plan .. (profileData.Term and " - " .. profileData.Term or ""), 8)
	end

	local n6 = arg.Profile.AbsolutePosition - ScreenGui.AbsolutePosition
	local n7 = arg.Holder.AbsolutePosition - ScreenGui.AbsolutePosition
	local absoluteSize = ScreenGui.AbsoluteSize
	local n8

	if n7.X - 300 - 14 >= 8 then
		n8 = n7.X - 300 - 14
	elseif n7.X + arg.Holder.AbsoluteSize.X + 14 + 300 <= absoluteSize.X - 8 then
		n8 = n7.X + arg.Holder.AbsoluteSize.X + 14
	else
		n8 = math.clamp(n6.X + arg.Profile.AbsoluteSize.X + 14, 8, math.max(absoluteSize.X - 300 - 8, 8))
	end

	local n9 = math.clamp(n6.Y, 8, math.max(absoluteSize.Y - n5 - 8, 8))
	local v18 = tbl6.spring(0, 300, 26)
	local flag3 = false

	local function fn39()
		local x = v18.x
		local n10 = math.clamp(x, 0, 1.05)
		v10.Position = UDim2.fromOffset(n8 - 10 * (1 - n10), n9)
		v10.Size = UDim2.fromOffset(300, n5 * (0.94 + 0.06 * n10))
		v10.BackgroundTransparency = 1 - (1 - (arg.GlassOn and 0.18 or 0.03)) * math.clamp(x, 0, 1)
		v11.Transparency = 1 - 0.14 * math.clamp(x, 0, 1)
		v12.GroupTransparency = 1 - math.clamp(x * 1.4 - 0.2, 0, 1)
	end

	local function fn40(arg2)
		local v19 = table.pack(tbl6.step(v18, arg2))
		fn39()
		local v20, flag4

		if flag3 then
			v20 = v19[1]
			flag4 = v18.x < 0.02
		else
			v20 = v19[1]
			flag4 = flag3
		end

		if flag4 then
			glass.remove(v10)
			v10:Destroy()
			v9:Destroy()
			return true
		end

		return v20
	end

	fn39()

	if arg.GlassOn then
		glass.new(v10, { blur = true, liquidglass = true, sheen = false, rimTransparency = 0.8, inset = 8 })
	end

	v18.t = 1
	tbl6.run(fn40)
	arg.ProfileCard = v10

	arg.CloseProfile = function(arg2)
		if flag3 then
			return
		end
		flag3 = true
		arg2.ProfileCard = nil
		glass.remove(v10)
		v18.t = 0
		local v19 = v18
		v18.k = 420
		v19.d = 40
		tbl6.run(fn40)
	end

	v9.Activated:Connect(function()
		arg:CloseProfile()
	end)
end

tbl7.Window = nil
tbl7.Container = index
tbl7.Glass = glass
return tbl7
