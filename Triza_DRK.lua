-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- Last Updated: 03/08/14 8:30 PM *Added More WS Sets* --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid/Stun. Default ACC Set Is LowACC. The First TP Set Of Your Main Weapon Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {"Movement","Regen","Refresh"} -- Default Idle Set Is Movement --
	Armor = 'None'
	Twilight = 0
	Rancor = 'ON' -- Set Default Rancor ON or OFF Here --
	Mekira = 'ON' -- Set Default Mekira ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	send_command('input /macro book 2;wait .1;input /macro set 1') -- Change Default Macro Book Here --

	sc_map = {SC1="Resolution", SC2="LastResort", SC3="Souleater"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	-- Idle/Town Sets --
	sets.Idle = {ammo="Hagneia Stone",
			head="Twilight Helm",
			neck="Wiglen Gorget",
			ear1="Trux Earring",
			ear2="Sanare Earring",
			body="Xaddi mail",
			hands="Xaddi gauntlets",
			ring1="Sheltered Ring",
			ring2="Paguroidea Ring",
			back="Shadow Mantle",
			waist="Flume Belt +1",
			legs="Blood Cuisses",
			feet="Ejekamal boots"}
	sets.Idle.Regen = {
			ammo="Hagneia Stone",
			head="Twilight Helm",
			neck="Wiglen Gorget",
			ear1="Trux Earring",
			ear2="Sanare Earring",
			body="Kumarbi's Akar",
			hands="Igominy gauntlets +1",
			ring1="Sheltered Ring",
			ring2="Paguroidea Ring",
			back="Repulse Mantle",
			waist="Lycopodium Sash",
			legs="Blood Cuisses",
			feet="Ejekamal boots"}
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			ammo="Hagneia Stone",
			head="Yaoyotl Helm",
			neck="Wiglen Gorget",
			ear1="Trux Earring",
			ear2="Sanare Earring",
			body="Xaddi mail",
			hands="Xaddi gauntlets",
			ring1="Dark Ring",
			ring2="Defending Ring",
			back="Shadow Mantle",
			waist="Flume Belt +1",
			legs="Blood Cuisses",
			feet="Ejekamal boots"})
	sets.Idle.Refresh = set_combine(sets.Idle.Regen,{
			head="Wivre Hairpin",
			neck="Bale Choker",
			body="Twilight Mail",
			hands="Ogier's Gauntlets",
			feet="Ogier's Leggings"})

	sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}

	-- TP Base Set --
	sets.TP = {}

	-- Liberator(AM3 Down) TP Sets --
	sets.TP.Liberator = {
			main="Liberator",
			sub="Duplus Grip",
			ammo="Hagneia Stone",
			head="Otomi Helm",
			neck="Ganesha's Mala",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Pak Corselet",
			hands="Cizin mufflers +1",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Atheling Mantle",
			waist="Windbuffet belt +1",
			legs="Ares' Flanchard +1",
			feet="Huginn Gambieras"}
	sets.TP.Liberator.MidACC = set_combine(sets.TP.Liberator,{
			ammo="Fire Bomblet",
			head="Yaoyotl Helm",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			hands="Mikinaak Gauntlets",
			back="Letalis Mantle",
			waist="Dynamic Belt",
			feet="Whirlpool Greaves"})
	sets.TP.Liberator.HighACC = set_combine(sets.TP.Liberator.MidACC,{
			neck="Iqabi Necklace",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			ring2="Mars's Ring"})

	-- Liberator(AM3 Up) TP Sets --
	sets.TP.Liberator.AM3 = set_combine(sets.TP.Liberator,{
			head="Yaoyotl Helm",
			ear1="Tripudio Earring",
			ear2="Brutal Earring",
			body="Enif Corazza"})
	sets.TP.Liberator.MidACC.AM3 = set_combine(sets.TP.Liberator.AM3,{
			ammo="Fire Bomblet",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			hands="Mikinaak Gauntlets",
			back="Letalis Mantle",
			waist="Dynamic Belt",
			feet="Whirlpool Greaves"})
	sets.TP.Liberator.HighACC.AM3 = set_combine(sets.TP.Liberator.MidACC.AM3,{
			neck="Iqabi Necklace",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			ring2="Mars's Ring"})

	-- Liberator(AM3 Down: High Haste) TP Sets --
	sets.TP.Liberator.HighHaste = set_combine(sets.TP.Liberator,{})
	sets.TP.Liberator.MidACC.HighHaste = set_combine(sets.TP.Liberator.HighHaste,{})
	sets.TP.Liberator.HighACC.HighHaste = set_combine(sets.TP.Liberator.MidACC.HighHaste,{})

	-- Liberator(AM3 Up: High Haste) TP Sets --
	sets.TP.Liberator.AM3.HighHaste = set_combine(sets.TP.Liberator.AM3,{})
	sets.TP.Liberator.MidACC.AM3.HighHaste = set_combine(sets.TP.Liberator.AM3.HighHaste,{})
	sets.TP.Liberator.HighACC.AM3.HighHaste = set_combine(sets.TP.Liberator.MidACC.AM3.HighHaste,{})

	-- Liberator(AM3 Down: Ionis) TP Sets --
	sets.TP.Liberator.Ionis = set_combine(sets.TP.Liberator,{})
	sets.TP.Liberator.MidACC.Ionis = set_combine(sets.TP.Liberator.Ionis,{})
	sets.TP.Liberator.HighACC.Ionis = set_combine(sets.TP.Liberator.MidACC.Ionis,{})

	-- Liberator(AM3 Up: Ionis) TP Sets --
	sets.TP.Liberator.AM3.Ionis = set_combine(sets.TP.Liberator.AM3,{})
	sets.TP.Liberator.MidACC.AM3.Ionis = set_combine(sets.TP.Liberator.AM3.Ionis,{})
	sets.TP.Liberator.MidACC.AM3.Ionis = set_combine(sets.TP.Liberator.MidACC.AM3.Ionis,{})

	-- Liberator(AM3 Down: High Haste + Ionis) TP Sets --
	sets.TP.Liberator.HighHaste.Ionis = set_combine(sets.TP.Liberator.HighHaste,{})
	sets.TP.Liberator.MidACC.HighHaste.Ionis = set_combine(sets.TP.Liberator.HighHaste.Ionis,{})
	sets.TP.Liberator.HighACC.HighHaste.Ionis = set_combine(sets.TP.Liberator.MidACC.HighHaste.Ionis,{})

	-- Liberator(AM3 Up: High Haste + Ionis) TP Sets --
	sets.TP.Liberator.AM3.HighHaste.Ionis = set_combine(sets.TP.Liberator.AM3.HighHaste,{})
	sets.TP.Liberator.MidACC.AM3.HighHaste.Ionis = set_combine(sets.TP.Liberator.AM3.HighHaste.Ionis,{})
	sets.TP.Liberator.HighACC.AM3.HighHaste.Ionis = set_combine(sets.TP.Liberator.MidACC.AM3.HighHaste.Ionis,{})

	-- Ragnarok TP Sets --
	sets.TP.Ragnarok = {
			main="Ragnarok",
			sub="Duplus Grip",
			ammo="Yetshila",
			head="Otomi Helm",
			neck="Ganesha's Mala",
			ear1="Brutal Earring",
			ear2="Trux Earring",
			body="Xaddi mail",
			hands="Xaddi gauntlets",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Atheling Mantle",
			waist="Windbuffet belt +1",
			legs="Xaddi Cuisses",
			feet="Mikinaak Greaves"}
	sets.TP.Ragnarok.MidACC = set_combine(sets.TP.Ragnarok,{
			head="Yaoyotl Helm",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			waist="Dynamic Belt",
			feet="Whirlpool Greaves"})
	sets.TP.Ragnarok.HighACC = set_combine(sets.TP.Ragnarok.MidACC,{
			ammo="Fire Bomblet",
			neck="Iqabi Necklace",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			ring2="Mars's Ring"})

	-- Ragnarok(High Haste) TP Sets --
	sets.TP.Ragnarok.HighHaste = set_combine(sets.TP.Ragnarok,{})
	sets.TP.Ragnarok.MidACC.HighHaste = set_combine(sets.TP.Ragnarok.HighHaste,{
			head="Yaoyotl Helm",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			waist="Windbuffet belt +1",
			feet="Ejekamal boots"})
	sets.TP.Ragnarok.HighACC.HighHaste = set_combine(sets.TP.Ragnarok.MidACC.HighHaste,{
			ammo="Fire Bomblet",
			neck="Iqabi Necklace",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			ring2="Mars's Ring"})

	-- Ragnarok(Ionis) TP Sets --
	sets.TP.Ragnarok.Ionis = set_combine(sets.TP.Ragnarok,{})
	sets.TP.Ragnarok.MidACC.Ionis = set_combine(sets.TP.Ragnarok.Ionis,{
			head="Yaoyotl Helm",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			waist="Dynamic Belt",
			feet="Whirlpool Greaves"})
	sets.TP.Ragnarok.HighACC.Ionis = set_combine(sets.TP.Ragnarok.MidACC.Ionis,{
			ammo="Fire Bomblet",
			neck="Iqabi Necklace",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			ring2="Mars's Ring"})

	-- Ragnarok(High Haste + Ionis) TP Sets --
	sets.TP.Ragnarok.HighHaste.Ionis = set_combine(sets.TP.Ragnarok.HighHaste,{})
	sets.TP.Ragnarok.MidACC.HighHaste.Ionis = set_combine(sets.TP.Ragnarok.HighHaste.Ionis,{
			head="Yaoyotl Helm",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			waist="Dynamic Belt",
			feet="Whirlpool Greaves"})
	sets.TP.Ragnarok.HighACC.HighHaste.Ionis = set_combine(sets.TP.Ragnarok.MidACC.HighHaste.Ionis,{
			ammo="Fire Bomblet",
			neck="Iqabi Necklace",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			ring2="Mars's Ring"})

	-- Apocalypse(AM Down) TP Sets --
	sets.TP.Apocalypse = {
			main="Apocalypse",
			sub="Duplus Grip",
			ammo="Hagneia Stone",
			head="Yaoyotl Helm",
			neck="Ganesha's Mala",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Pak Corselet",
			hands="Cizin mufflers +1",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Atheling Mantle",
			waist="Goading Belt",
			legs="Cizin breeches +1",
			feet="Mikinaak Greaves"}
	sets.TP.Apocalypse.MidACC = set_combine(sets.TP.Apocalypse,{
			ammo="Fire Bomblet",
			head="Yaoyotl Helm",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			hands="Mikinaak Gauntlets",
			back="Letalis Mantle",
			waist="Dynamic Belt"})
	sets.TP.Apocalypse.HighACC = set_combine(sets.TP.Apocalypse.MidACC,{
			neck="Iqabi Necklace",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			ring2="Mars's Ring"})

	-- Apocalypse(AM Up) TP Sets --
	sets.TP.Apocalypse.AM = set_combine(sets.TP.Apocalypse,{})
	sets.TP.Apocalypse.MidACC.AM = set_combine(sets.TP.Apocalypse.AM,{})
	sets.TP.Apocalypse.HighACC.AM = set_combine(sets.TP.Apocalypse.MidACC.AM,{})

	-- Apocalypse(AM Down: High Haste) TP Sets --
	sets.TP.Apocalypse.HighHaste = set_combine(sets.TP.Apocalypse,{})
	sets.TP.Apocalypse.MidACC.HighHaste = set_combine(sets.TP.Apocalypse.HighHaste,{})
	sets.TP.Apocalypse.HighACC.HighHaste = set_combine(sets.TP.Apocalypse.MidACC.HighHaste,{})

	-- Apocalypse(AM Up: High Haste) TP Sets --
	sets.TP.Apocalypse.AM.HighHaste = set_combine(sets.TP.Apocalypse.AM,{})
	sets.TP.Apocalypse.MidACC.AM.HighHaste = set_combine(sets.TP.Apocalypse.AM.HighHaste,{})
	sets.TP.Apocalypse.HighACC.AM.HighHaste = set_combine(sets.TP.Apocalypse.MidACC.AM.HighHaste,{})

	-- Apocalypse(AM Down: Ionis) TP Sets --
	sets.TP.Apocalypse.Ionis = set_combine(sets.TP.Apocalypse,{})
	sets.TP.Apocalypse.MidACC.Ionis = set_combine(sets.TP.Apocalypse.Ionis,{})
	sets.TP.Apocalypse.HighACC.Ionis = set_combine(sets.TP.Apocalypse.MidACC.Ionis,{})

	-- Apocalypse(AM Up: Ionis) TP Sets --
	sets.TP.Apocalypse.AM.Ionis = set_combine(sets.TP.Apocalypse.AM,{})
	sets.TP.Apocalypse.MidACC.AM.Ionis = set_combine(sets.TP.Apocalypse.AM.Ionis,{})
	sets.TP.Apocalypse.HighACC.AM.Ionis= set_combine(sets.TP.Apocalypse.MidACC.AM.Ionis,{})

	-- Apocalypse(AM Down: High Haste + Ionis) TP Sets --
	sets.TP.Apocalypse.HighHaste.Ionis = set_combine(sets.TP.Apocalypse.HighHaste,{})
	sets.TP.Apocalypse.MidACC.HighHaste.Ionis = set_combine(sets.TP.Apocalypse.HighHaste.Ionis,{})
	sets.TP.Apocalypse.HighACC.HighHaste.Ionis = set_combine(sets.TP.Apocalypse.MidACC.HighHaste.Ionis,{})

	-- Apocalypse(AM Up: High Haste + Ionis) TP Sets --
	sets.TP.Apocalypse.AM.HighHaste.Ionis = set_combine(sets.TP.Apocalypse.AM.HighHaste,{})
	sets.TP.Apocalypse.MidACC.AM.HighHaste.Ionis = set_combine(sets.TP.Apocalypse.AM.HighHaste.Ionis,{})
	sets.TP.Apocalypse.HighACC.AM.HighHaste.Ionis = set_combine(sets.TP.Apocalypse.MidACC.AM.HighHaste.Ionis,{})

	-- Senbaak Nagan TP Sets --
	sets.TP['Senbaak Nagan'] = {
			main="Ragnarok",
			sub="Duplus Grip",
			ammo="Hagneia Stone",
			head="Otomi Helm",
			neck="Ganesha's Mala",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Pak Corselet",
			hands="Cizin mufflers +1",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Atheling Mantle",
			waist="Goading Belt",
			legs="Ares' Flanchard +1",
			feet="Mikinaak Greaves"}
	sets.TP['Senbaak Nagan'].MidACC = set_combine(sets.TP['Senbaak Nagan'],{
			head="Yaoyotl Helm",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			waist="Dynamic Belt",
			feet="Whirlpool Greaves"})
	sets.TP['Senbaak Nagan'].HighACC = set_combine(sets.TP['Senbaak Nagan'].MidACC,{
			ammo="Fire Bomblet",
			neck="Iqabi Necklace",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			ring2="Mars's Ring"})

	-- Senbaak Nagan(High Haste) TP Sets --
	sets.TP['Senbaak Nagan'].HighHaste = set_combine(sets.TP['Senbaak Nagan'],{})
	sets.TP['Senbaak Nagan'].MidACC.HighHaste = set_combine(sets.TP['Senbaak Nagan'].HighHaste,{
			head="Yaoyotl Helm",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			waist="Dynamic Belt",
			feet="Whirlpool Greaves"})
	sets.TP['Senbaak Nagan'].HighACC.HighHaste = set_combine(sets.TP['Senbaak Nagan'].MidACC.HighHaste,{
			ammo="Fire Bomblet",
			neck="Iqabi Necklace",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			ring2="Mars's Ring"})

	-- Senbaak Nagan(Ionis) TP Sets --
	sets.TP['Senbaak Nagan'].Ionis = set_combine(sets.TP['Senbaak Nagan_LowACC'],{})
	sets.TP['Senbaak Nagan'].MidACC.Ionis = set_combine(sets.TP['Senbaak Nagan'].Ionis,{
			head="Yaoyotl Helm",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			waist="Dynamic Belt",
			feet="Whirlpool Greaves"})
	sets.TP['Senbaak Nagan'].HighACC.Ionis = set_combine(sets.TP['Senbaak Nagan'].MidACC.Ionis,{
			ammo="Fire Bomblet",
			neck="Iqabi Necklace",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			ring2="Mars's Ring"})

	-- Senbaak Nagan(High Haste + Ionis) TP Sets --
	sets.TP['Senbaak Nagan'].HighHaste.Ionis = set_combine(sets.TP['Senbaak Nagan'].HighHaste,{})
	sets.TP['Senbaak Nagan'].MidACC.HighHaste.Ionis = set_combine(sets.TP['Senbaak Nagan'].HighHaste.Ionis,{
			head="Yaoyotl Helm",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			waist="Dynamic Belt",
			feet="Whirlpool Greaves"})
	sets.TP['Senbaak Nagan'].HighACC.HighHaste.Ionis = set_combine(sets.TP['Senbaak Nagan'].MidACC.HighHaste.Ionis,{
			ammo="Fire Bomblet",
			neck="Iqabi Necklace",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			ring2="Mars's Ring"})

	-- Liberator(AM3 Down) /SAM TP Sets --
	sets.TP.Liberator.SAM = {
			main="Liberator",
			sub="Duplus Grip",
			ammo="Hagneia Stone",
			head="Otomi Helm",
			neck="Ganesha's Mala",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Pak Corselet",
			hands="Cizin mufflers +1",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Atheling Mantle",
			waist="Windbuffet belt +1",
			legs="Ares' Flanchard +1",
			feet="Huginn Gambieras"}
	sets.TP.Liberator.SAM.MidACC = set_combine(sets.TP.Liberator.SAM,{
			head="Yaoyotl Helm",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			hands="Mikinaak Gauntlets",
			back="Letalis Mantle",
			waist="Dynamic Belt",
			feet="Mikinaak Greaves"})
	sets.TP.Liberator.SAM.HighACC = set_combine(sets.TP.Liberator.SAM.MidACC,{
			ammo="Fire Bomblet",
			neck="Iqabi Necklace",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			ring2="Mars's Ring",
			feet="Whirlpool Greaves"})

	-- Liberator(AM3 Up) /SAM TP Sets --
	sets.TP.Liberator.SAM.AM3 = set_combine(sets.TP.Liberator.SAM,{
			head="Yaoyotl Helm",
			ear1="Tripudio Earring",
			ear2="Brutal Earring",
			body="Enif Corazza"})
	sets.TP.Liberator.SAM.MidACC.AM3 = set_combine(sets.TP.Liberator.SAM.AM3,{
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			hands="Mikinaak Gauntlets",
			back="Letalis Mantle",
			waist="Dynamic Belt",
			feet="Mikinaak Greaves"})
	sets.TP.Liberator.SAM.HighACC.AM3 = set_combine(sets.TP.Liberator.SAM.MidACC.AM3,{
			ammo="Fire Bomblet",
			neck="Iqabi Necklace",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			ring2="Mars's Ring",
			feet="Whirlpool Greaves"})

	-- Liberator(AM3 Down: High Haste) /SAM TP Sets --
	sets.TP.Liberator.SAM.HighHaste = set_combine(sets.TP.Liberator.SAM,{})
	sets.TP.Liberator.SAM.MidACC.HighHaste = set_combine(sets.TP.Liberator.SAM.HighHaste,{})
	sets.TP.Liberator.SAM.HighACC.HighHaste = set_combine(sets.TP.Liberator.SAM.MidACC.HighHaste,{})

	-- Liberator(AM3 Up: High Haste) /SAM TP Sets --
	sets.TP.Liberator.SAM.AM3.HighHaste = set_combine(sets.TP.Liberator.SAM.AM3,{})
	sets.TP.Liberator.SAM.MidACC.AM3.HighHaste = set_combine(sets.TP.Liberator.SAM.AM3.HighHaste,{})
	sets.TP.Liberator.SAM.HighACC.AM3.HighHaste = set_combine(sets.TP.Liberator.SAM.MidACC.AM3.HighHaste,{})

	-- Liberator(AM3 Down: Ionis) /SAM TP Sets --
	sets.TP.Liberator.SAM.Ionis = set_combine(sets.TP.Liberator.SAM,{})
	sets.TP.Liberator.SAM.MidACC.Ionis = set_combine(sets.TP.Liberator.SAM.Ionis,{})
	sets.TP.Liberator.SAM.HighACC.Ionis = set_combine(sets.TP.Liberator.SAM.MidACC.Ionis,{})

	-- Liberator(AM3 Up: Ionis) /SAM TP Sets --
	sets.TP.Liberator.SAM.AM3.Ionis = set_combine(sets.TP.Liberator.SAM.AM3,{})
	sets.TP.Liberator.SAM.MidACC.AM3.Ionis = set_combine(sets.TP.Liberator.SAM.AM3.Ionis,{})
	sets.TP.Liberator.SAM.HighACC.AM3.Ionis = set_combine(sets.TP.Liberator.SAM.MidACC.AM3.Ionis,{})

	-- Liberator(AM3 Down: High Haste + Ionis) /SAM TP Sets --
	sets.TP.Liberator.SAM.HighHaste.Ionis = set_combine(sets.TP.Liberator.SAM.HighHaste,{})
	sets.TP.Liberator.SAM.MidACC.HighHaste.Ionis = set_combine(sets.TP.Liberator.SAM.HighHaste.Ionis,{})
	sets.TP.Liberator.SAM.HighACC.HighHaste.Ionis = set_combine(sets.TP.Liberator.SAM.MidACC.HighHaste.Ionis,{})

	-- Liberator(AM3 Up: High Haste + Ionis) /SAM TP Sets --
	sets.TP.Liberator.SAM.AM3.HighHaste.Ionis = set_combine(sets.TP.Liberator.SAM.AM3.HighHaste,{})
	sets.TP.Liberator.SAM.MidACC.AM3.HighHaste.Ionis = set_combine(sets.TP.Liberator.SAM.AM3.HighHaste.Ionis,{})
	sets.TP.Liberator.SAM.HighACC.AM3.HighHaste.Ionis = set_combine(sets.TP.Liberator.SAM.MidACC.AM3.HighHaste.Ionis,{})

	-- Ragnarok /SAM TP Sets --
	sets.TP.Ragnarok.SAM = {
			main="Ragnarok",
			sub="Blooddrain Strap",
			ammo="Hagneia Stone",
			head="Otomi Helm",
			neck="Ganesha's Mala",
			ear1="Bladeborn Earring",
			ear2="Steelflash earring",
			body="Xaddi mail",
			hands="Xaddi gauntlets",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Atheling Mantle",
			waist="Windbuffet belt +1",
			legs="Xaddi Cuisses",
			feet="Mikinaak Greaves"}
	sets.TP.Ragnarok.SAM.MidACC = set_combine(sets.TP.Ragnarok.SAM,{
			ammo="Fire Bomblet",
			head="Yaoyotl Helm",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring"})
	sets.TP.Ragnarok.SAM.HighACC = set_combine(sets.TP.Ragnarok.SAM.MidACC,{
			neck="Iqabi Necklace",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			ring2="Mars's Ring",
			waist="Dynamic Belt",
			feet="Whirlpool Greaves"})

	-- Ragnarok(High Haste) /SAM TP Sets --
	sets.TP.Ragnarok.SAM.HighHaste = set_combine(sets.TP.Ragnarok.SAM,{})
	sets.TP.Ragnarok.SAM.MidACC.HighHaste = set_combine(sets.TP.Ragnarok.SAM.HighHaste,{
			ammo="Fire Bomblet",
			head="Yaoyotl Helm",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			feet="Ejekamal boots"})
	sets.TP.Ragnarok.SAM.HighACC.HighHaste = set_combine(sets.TP.Ragnarok.SAM.MidACC.HighHaste,{
			neck="Iqabi Necklace",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			ring2="Mars's Ring",
			waist="Dynamic Belt",
			feet="Ejekamal boots"})

	-- Ragnarok(Ionis) /SAM TP Sets --
	sets.TP.Ragnarok.SAM.Ionis = set_combine(sets.TP.Ragnarok.SAM,{})
	sets.TP.Ragnarok.SAM.MidACC.Ionis = set_combine(sets.TP.Ragnarok.SAM.Ionis,{
			ammo="Fire Bomblet",
			head="Yaoyotl Helm",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring"})
	sets.TP.Ragnarok.SAM.HighACC.Ionis = set_combine(sets.TP.Ragnarok.SAM.MidACC.Ionis,{
			neck="Iqabi Necklace",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			ring2="Mars's Ring",
			waist="Dynamic Belt",
			feet="Whirlpool Greaves"})

	-- Ragnarok(High Haste + Ionis) /SAM TP Sets --
	sets.TP.Ragnarok.SAM.HighHaste.Ionis = set_combine(sets.TP.Ragnarok.SAM.HighHaste,{})
	sets.TP.Ragnarok.SAM.MidACC.HighHaste.Ionis = set_combine(sets.TP.Ragnarok.SAM.HighHaste.Ionis,{
			ammo="Fire Bomblet",
			head="Yaoyotl Helm",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring"})
	sets.TP.Ragnarok.SAM.HighACC.HighHaste.Ionis = set_combine(sets.TP.Ragnarok.SAM.MidACC.HighHaste.Ionis,{
			neck="Iqabi Necklace",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			ring2="Mars's Ring",
			waist="Dynamic Belt",
			feet="Whirlpool Greaves"})

	-- Apocalypse(AM Down) /SAM TP Sets --
	sets.TP.Apocalypse.SAM = {
			ammo="Hagneia Stone",
			head="Otomi Helm",
			neck="Ganesha's Mala",
			ear1="Brutal Earring",
			ear2="Trux earring",
			body="Xaddi mail",
			hands="Xaddi gauntlets",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Atheling Mantle",
			waist="Windbuffet belt +1",
			legs="Xaddi Cuisses",
			feet="Mikinaak Greaves"}
	sets.TP.Apocalypse.SAM.MidACC = set_combine(sets.TP.Apocalypse.SAM,{
			ammo="Fire Bomblet",
			head="Yaoyotl Helm",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring"})
	sets.TP.Apocalypse.SAM.HighACC = set_combine(sets.TP.Apocalypse.SAM.MidACC,{
			neck="Iqabi Necklace",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			ring2="Mars's Ring",
			waist="Dynamic Belt",
			feet="Whirlpool Greaves"})

	-- Apocalypse(AM Up) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.AM = set_combine(sets.TP.Apocalypse.SAM,{waist="Windbuffet belt +1"})
	sets.TP.Apocalypse.SAM.MidACC.AM = set_combine(sets.TP.Apocalypse.SAM.AM,{})
	sets.TP.Apocalypse.SAM.HighACC.AM = set_combine(sets.TP.Apocalypse.SAM.MidACC.AM,{})

	-- Apocalypse(AM Down: High Haste) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.HighHaste = set_combine(sets.TP.Apocalypse.SAM,{})
	sets.TP.Apocalypse.SAM.MidACC.HighHaste = set_combine(sets.TP.Apocalypse.SAM.HighHaste,{})
	sets.TP.Apocalypse.SAM.HighACC.HighHaste = set_combine(sets.TP.Apocalypse.SAM.MidACC.HighHaste,{})

	-- Apocalypse(AM Up: High Haste) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.AM.HighHaste = set_combine(sets.TP.Apocalypse.SAM.AM,{})
	sets.TP.Apocalypse.SAM.MidACC.AM.HighHaste = set_combine(sets.TP.Apocalypse.SAM.AM.HighHaste,{})
	sets.TP.Apocalypse.SAM.HighACC.AM.HighHaste = set_combine(sets.TP.Apocalypse.SAM.MidACC.AM.HighHaste,{})

	-- Apocalypse(AM Down: Ionis) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.Ionis = set_combine(sets.TP.Apocalypse.SAM,{})
	sets.TP.Apocalypse.SAM.MidACC.Ionis = set_combine(sets.TP.Apocalypse.SAM.Ionis,{})
	sets.TP.Apocalypse.SAM.HighACC.Ionis = set_combine(sets.TP.Apocalypse.SAM.MidACC.Ionis,{})

	-- Apocalypse(AM Up: Ionis) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.AM.Ionis = set_combine(sets.TP.Apocalypse.SAM.AM,{})
	sets.TP.Apocalypse.SAM.MidACC.AM.Ionis = set_combine(sets.TP.Apocalypse.SAM.AM.Ionis,{})
	sets.TP.Apocalypse.SAM.HighACC.AM.Ionis = set_combine(sets.TP.Apocalypse.SAM.MidACC.AM.Ionis,{})

	-- Apocalypse(AM Down: High Haste + Ionis) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.HighHaste.Ionis = set_combine(sets.TP.Apocalypse.SAM.HighHaste,{})
	sets.TP.Apocalypse.SAM.MidACC.HighHaste.Ionis = set_combine(sets.TP.Apocalypse.SAM.HighHaste.Ionis,{})
	sets.TP.Apocalypse.SAM.HighACC.HighHaste.Ionis = set_combine(sets.TP.Apocalypse.SAM.MidACC.HighHaste.Ionis,{})

	-- Apocalypse(AM Up: High Haste + Ionis) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.AM.HighHaste.Ionis = set_combine(sets.TP.Apocalypse.SAM.AM.HighHaste,{})
	sets.TP.Apocalypse.SAM.MidACC.AM.HighHaste.Ionis = set_combine(sets.TP.Apocalypse.SAM.AM.HighHaste.Ionis,{})
	sets.TP.Apocalypse.SAM.HighACC.AM.HighHaste.Ionis = set_combine(sets.TP.Apocalypse.SAM.MidACC.AM.HighHaste.Ionis,{})

	-- Senbaak Nagan /SAM TP Sets --
	sets.TP['Senbaak Nagan'].SAM = {
			main="Ragnarok",
			sub="Duplus Grip",
			ammo="Hagneia Stone",
			head="Otomi Helm",
			neck="Ganesha's Mala",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Pak Corselet",
			hands="Cizin mufflers +1",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Atheling Mantle",
			waist="Goading Belt",
			legs="Ares' Flanchard +1",
			feet="Mikinaak Greaves"}
	sets.TP['Senbaak Nagan'].SAM.MidACC = set_combine(sets.TP['Senbaak Nagan'].SAM,{
			ammo="Fire Bomblet",
			head="Yaoyotl Helm",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring"})
	sets.TP['Senbaak Nagan'].SAM.HighACC = set_combine(sets.TP['Senbaak Nagan'].SAM.MidACC,{
			neck="Iqabi Necklace",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			ring2="Mars's Ring",
			waist="Dynamic Belt",
			feet="Whirlpool Greaves"})

	-- Senbaak Nagan(High Haste) /SAM TP Sets --
	sets.TP['Senbaak Nagan'].SAM.HighHaste = set_combine(sets.TP['Senbaak Nagan'].SAM,{})
	sets.TP['Senbaak Nagan'].SAM.MidACC.HighHaste = set_combine(sets.TP['Senbaak Nagan'].SAM.HighHaste,{
			ammo="Fire Bomblet",
			head="Yaoyotl Helm",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring"})
	sets.TP['Senbaak Nagan'].SAM.HighACC.HighHaste = set_combine(sets.TP['Senbaak Nagan'].SAM.MidACC.HighHaste,{
			neck="Iqabi Necklace",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			ring2="Mars's Ring",
			waist="Dynamic Belt",
			feet="Whirlpool Greaves"})

	-- Senbaak Nagan(Ionis) /SAM TP Sets --
	sets.TP['Senbaak Nagan'].SAM.Ionis = set_combine(sets.TP['Senbaak Nagan'].SAM,{})
	sets.TP['Senbaak Nagan'].SAM.MidACC.Ionis = set_combine(sets.TP['Senbaak Nagan'].SAM.Ionis,{
			ammo="Fire Bomblet",
			head="Yaoyotl Helm",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring"})
	sets.TP['Senbaak Nagan'].SAM.HighACC.Ionis = set_combine(sets.TP['Senbaak Nagan'].SAM.MidACC.Ionis,{
			neck="Iqabi Necklace",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			ring2="Mars's Ring",
			waist="Dynamic Belt",
			feet="Whirlpool Greaves"})

	-- Senbaak Nagan(High Haste + Ionis) /SAM TP Sets --
	sets.TP['Senbaak Nagan'].SAM.HighHaste.Ionis = set_combine(sets.TP['Senbaak Nagan'].SAM.HighHaste,{})
	sets.TP['Senbaak Nagan'].SAM.MidACC.HighHaste.Ionis = set_combine(sets.TP['Senbaak Nagan'].SAM.HighHaste.Ionis,{
			ammo="Fire Bomblet",
			head="Yaoyotl Helm",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring"})
	sets.TP['Senbaak Nagan'].SAM.HighACC.HighHaste.Ionis = set_combine(sets.TP['Senbaak Nagan'].SAM.MidACC.HighHaste.Ionis,{
			neck="Iqabi Necklace",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			ring2="Mars's Ring",
			waist="Dynamic Belt",
			feet="Whirlpool Greaves"})

	-- AM3 Rancor ON Mantle --
	sets.TP.Rancor = {back="Rancorous Mantle"}

	-- PDT/MDT Sets --
	sets.PDT = {
			ammo="Iron Gobbet",
			head="Cizin Helm +1",
			neck="Twilight Torque",
			ear1="Black Earring",
			ear2="Darkness Earring",
			body="Cizin Mail +1",
			hands="Cizin mufflers +1",
			ring1="Dark Ring",
			ring2="Defending Ring",
			back="Shadow Mantle",
			waist="Flume Belt +1",
			legs="Cizin breeches +1",
			feet="Cizin Greaves +1"}

	sets.MDT = set_combine(sets.PDT,{
			ammo="Demonry Stone",
			head="Laeradr Helm",
			ear1="Merman's Earring",
			ear2="Sanare Earring",
			body="Nocturnus Mail",
			ring1="Shadow Ring",
			back="Engulfer Cape",
			waist="Resolute Belt"})

	-- Hybrid Set --
	sets.TP.Hybrid = set_combine(sets.PDT,{
			head="Yaoyotl Helm",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			body="Pak Corselet",
			waist="Goading Belt",
			feet="Whirlpool Greaves"})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})

	-- WS Base Set --
	sets.WS = {}

	-- WS Sets --
	sets.WS.Resolution = {
			ammo="Aqreqaq Bomblet",
			head="Otomi Helm",
			neck="Thunder Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Ignominy Cuirass +1",
			hands="Ignominy gauntlets +1",
			ring1="Pyrosoul Ring",
			ring2="Rajas Ring",
			back="Niht Mantle",
			waist="Thunder Belt",
			legs="Ignominy flanchard +1",
			feet="Fallen's sollerets +1"}
	sets.WS.Resolution.MidACC = set_combine(sets.WS.Resolution,{
			head="Yaoyotl Helm",
			feet="Ejekamal boots"})
	sets.WS.Resolution.HighACC = set_combine(sets.WS.Resolution.MidACC,{
			body="Mes. Haubergeon",
			legs="Mikinaak Cuisses"})

	sets.WS.Catastrophe = {
			ammo="Aqreqaq Bomblet",
			head="Otomi Helm",
			neck="Shadow Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Phorcys korazin",
			hands="Ignominy gauntlets +1",
			ring1="Pyrosoul Ring",
			ring2="Spiral Ring",
			back="Niht Mantle",
			waist="Shadow Belt",
			legs="Ignominy flanchard +1",
			feet="Fallen's sollerets +1"}
	sets.WS.Catastrophe.MidACC = set_combine(sets.WS.Catastrophe,{
			head="Yaoyotl Helm",
			feet="Whirlpool Greaves"})
	sets.WS.Catastrophe.HighACC = set_combine(sets.WS.Catastrophe.MidACC,{
			body="Mikinaak Breastplate",
			legs="Mikinaak Cuisses"})

	sets.WS.Entropy = {
			ammo="Ombre Tathlum",
			head="Otomi Helm",
			neck="Shadow Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Ignominy Cuirass +1",
			hands="Mikinaak Gauntlets",
			ring1="Spiral Ring",
			ring2="Raja's Ring",
			back="Atheling Mantle",
			waist="Shadow Belt",
			legs="Ignominy Flanchard +1",
			feet="Mikinaak Greaves"}
	sets.WS.Entropy.MidACC = set_combine(sets.WS.Entropy,{
			head="Yaoyotl Helm",
			feet="Whirlpool Greaves"})
	sets.WS.Entropy.HighACC = set_combine(sets.WS.Entropy.MidACC,{
			body="Mikinaak Breastplate",
			legs="Mikinaak Cuisses"})

	sets.WS.Insurgency = {}
	sets.WS.Insurgency.MidACC = set_combine(sets.WS.Insurgency,{})
	sets.WS.Insurgency.HighACC = set_combine(sets.WS.Insurgency.MidACC,{})

	sets.WS.Torcleaver = {}
	sets.WS.Quietus = {}

	-- JA Sets --
	sets.JA = {}
	sets.JA["Blood Weapon"] = {body="Fallen's Cuirass"}
	sets.JA["Diabolic Eye"] = {hands="Fallen's Fin. Gaunt. +1"}
	sets.JA["Nether Void"] = {legs="Bale Flanchard +2"}
	sets.JA["Arcane Circle"] = {feet="Ignominy Sollerets +1"}
	sets.JA["Last Resort"] = {feet="Fallen's Sollerets +1"}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {
			ammo="Impatiens",
			head="Cizin Helm +1",
			neck="Orunmila's Torque",
			ear1="Loquac. Earring",
			ring1="Prolix Ring",
			ring2="Veneficium Ring",
			legs="Blood cuisses"}

	-- Precast DarkMagic --
	sets.Precast.DarkMagic = set_combine(sets.Precast.FastCast,{head="Fallen's Burgeonet +1"})

	-- Midcast Base Set --
	sets.Midcast = {}

	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.PDT,{})

	-- DarkMagic Set --
	sets.Midcast.DarkMagic = {
			head="Ignominy Burgeonet",
			neck="Dark Torque",
			ear1="Abyssal Earring",
			ear2="Dark Earring",
			body="Demon's Harness",
			hands="Pavor Gauntlets",
			ring1="Archon Ring",
			ring2="Sangoma Ring",
			back="Niht Mantle",
			waist="Casso Sash",
			legs="Bale Flanchard +2",
			feet="Ignominy sollerets"}

	-- Stun Sets --
	sets.Midcast.Stun = set_combine(sets.Midcast.DarkMagic,{})
	sets.Midcast.Stun.MidACC = set_combine(sets.Midcast.Stun,{})
	sets.Midcast.Stun.HighACC = set_combine(sets.Midcast.Stun.MidACC,{})

	-- Endark Set --
	sets.Midcast.Endark = set_combine(sets.Midcast.DarkMagic,{
			feet="Whirlpool Greaves"})

	-- EnfeeblingMagic Set --
	sets.Midcast.EnfeeblingMagic = {body="Ignominy Cuirass +1"}

	-- ElementalMagic Set --
	sets.Midcast.ElementalMagic = {}

	-- Dread Spikes Set --
	sets.Midcast['Dread Spikes'] = {
			ammo="Egoist's Tathlum",
			head="Ganesha's Mask",
			neck="Dualism Collar",
			ear1="Bloodgem Earring",
			ear2="Cassie Earring",
			body="Bale Cuirass +2",
			hands="Ignominy Gauntlets +1",
			ring1="K'ayres Ring",
			ring="Meridian Ring",
			back="Prodigious Mantle",
			waist="Oneiros Belt",
			legs="Ignominy Flanchard",
			feet="Llwyd's Clogs"}
end

function pretarget(spell,action)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
		cancel_spell()
		send_command('Aggressor')
	elseif spell.english == "Seigan" and buffactive.Seigan then -- Change Seigan To Third Eye If Seigan Is On --
		cancel_spell()
		send_command('ThirdEye')
	elseif spell.english == "Meditate" and player.tp > 2900 then -- Cancel Meditate If TP Is Above 290 --
		cancel_spell()
		add_to_chat(123, spell.name .. ' Canceled: ['..player.tp..' TP]')
	elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	elseif buffactive['Light Arts'] or buffactive['Addendum: White'] then
		if spell.english == "Light Arts" and not buffactive['Addendum: White'] then
			cancel_spell()
			send_command('input /ja Addendum: White <me>')
		elseif spell.english == "Manifestation" then
			cancel_spell()
			send_command('input /ja Accession <me>')
		elseif spell.english == "Alacrity" then
			cancel_spell()
			send_command('input /ja Celerity <me>')
		elseif spell.english == "Parsimony" then
			cancel_spell()
			send_command('input /ja Penury <me>')
		end
	elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
		if spell.english == "Dark Arts" and not buffactive['Addendum: Black'] then
			cancel_spell()
			send_command('input /ja Addendum: Black <me>')
		elseif spell.english == "Accession" then
			cancel_spell()
			send_command('input /ja Manifestation <me>')
		elseif spell.english == "Celerity" then
			cancel_spell()
			send_command('input /ja Alacrity <me>')
		elseif spell.english == "Penury" then
			cancel_spell()
			send_command('input /ja Parsimony <me>')
		end
	end
end

function precast(spell,action)
	if spell.type == "WeaponSkill" then
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
			cancel_spell()
			add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
			return
		else
			equipSet = sets.WS
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if spell.english == "Catastrophe" and (world.day_element == 'Dark' or world.day_element == 'Earth') and Mekira == 'ON' then -- Equip Mekira-oto +1 On Darksday or Earthsday --
				equipSet = set_combine(equipSet,{head="Mekira-oto +1"})
			end
			if spell.english == "Resolution" or spell.english == "Entropy" then
				if spell.english == "Resolution" and (world.day_element == 'Thunder' or world.day_element == 'Wind' or world.day_element == 'Earth') and Mekira == 'ON' then -- Equip Mekira-oto +1 On Lightningday or Windsday or Earthsday --
					equipSet = set_combine(equipSet,{head="Mekira-oto +1"})
				elseif spell.english == "Entropy" and (world.day_element == 'Dark' or world.day_element == 'Earth' or world.day_element == 'Water') and Mekira == 'ON' then -- Equip Mekira-oto +1 On Darksday or Earthsday or Watersday --
					equipSet = set_combine(equipSet,{head="Mekira-oto +1"})
				end
				if player.tp > 2999 or buffactive.Sekkanoki then -- Equip Bale Earring When You Have 300 TP or Sekkanoki --
					equipSet = set_combine(equipSet,{ear1="Bale Earring"})
				end
			end
			equip(equipSet)
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
		if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
			return
		else
			if spell.english == "Stun" then
				if buffactive.Hasso or buffactive.Seigan then -- Cancel Hasso or Seigan When You Use Stun --
					cast_delay(0.2)
					send_command('cancel Hasso,Seigan')
				end
				equip(sets.Precast.FastCast)
			elseif string.find(spell.english,'Utsusemi') then
				if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
					cancel_spell()
					add_to_chat(123, spell.name .. ' Canceled: [3+ Images]')
					return
				else
					equip(sets.Precast.FastCast)
				end
			elseif sets.Precast[spell.skill] then
				equip(sets.Precast[spell.skill])
			else
				equip(sets.Precast.FastCast)
			end
		end
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
	if Twilight == 1 then
		equip(sets.Twilight)
	end
end

function midcast(spell,action)
	equipSet = {}
	if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
		equipSet = sets.Midcast
		if string.find(spell.english,'Absorb') then
			if buffactive["Dark Seal"] then -- Equip Aug'd Abs. Burgeonet +2 When You Have Dark Seal Up --
				equipSet = set_combine(equipSet,{head="Abs. Burgeonet +2"})
			end
		elseif string.find(spell.english,'Drain') or string.find(spell.english,'Aspir') or string.find(spell.english,'Bio') then
			if world.day == "Darksday" or world.weather_element == "Dark" then -- Equip Anrin Obi On Darksday or Dark Weather --
				equipSet = set_combine(equipSet,{waist="Anrin Obi"})
			end
		elseif spell.english == "Stoneskin" then
			if buffactive.Stoneskin then
				send_command('@wait 1.7;cancel stoneskin')
			end
			equipSet = equipSet.Stoneskin
		elseif spell.english == "Sneak" then
			if spell.target.name == player.name and buffactive['Sneak'] then
				send_command('cancel sneak')
			end
			equipSet = equipSet.Haste
		elseif string.find(spell.english,'Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equipSet = equipSet.Haste
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equipSet = equipSet.Haste
		else
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if equipSet[spell.skill] then
				equipSet = equipSet[spell.skill]
			end
			if equipSet[spell.type] then
				equipSet = equipSet[spell.type]
			end
		end
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end
	equip(equipSet)
end

function aftercast(spell,action)
	if spell.type == "WeaponSkill" and not spell.interrupted then
		send_command('wait 0.2;gs c TP')
	elseif spell.english == "Arcane Circle" and not spell.interrupted then -- Arcane Circle Countdown --
		send_command('wait 260;input /echo '..spell.name..' Effect: [WEARING OFF IN 10 SEC.];wait 10;input /echo '..spell.name..' Effect: [OFF]')
	elseif spell.english == "Sleep II" and not spell.interrupted then -- Sleep II Countdown --
		send_command('wait 60;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
	elseif spell.english == "Sleep" and not spell.interrupted then -- Sleep Countdown --
		send_command('wait 30;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
	end
	status_change(player.status)
end

function status_change(new,old)
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif Armor == 'MDT' then
		equip(sets.MDT)
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if equipSet[player.equipment.main] then
			equipSet = equipSet[player.equipment.main]
		end
		if equipSet[player.sub_job] then
			equipSet = equipSet[player.sub_job]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if buffactive["Aftermath: Lv.3"] and equipSet["AM3"] then
			if Rancor == 'ON' then -- Default Rancor Toggle Is Rancorous Mantle --
				equipSet = set_combine(equipSet["AM3"],sets.TP.Rancor)
			else -- Use Rancor Toggle For Atheling Mantle --
				equipSet = equipSet["AM3"]
			end
		end
		if buffactive.Aftermath and equipSet["AM"] then
			equipSet = equipSet["AM"]
		end
		if buffactive["Last Resort"] and buffactive.March == 2 and (buffactive.Haste or buffactive.Embrava) and equipSet["HighHaste"] then
			equipSet = equipSet["HighHaste"]
		end
		if buffactive.Ionis and equipSet["Ionis"] then
			equipSet = equipSet["Ionis"]
		end
		equip(equipSet)
	else
		equip(sets.Idle[IdleArray[IdleIndex]])
	end
	if buffactive.doom then -- Lock Twilight When You Are Doomed --
		equip(sets.Twilight)
		disable('head','body')
	end
	if Twilight == 1 then
		equip(sets.Twilight)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "doom" and not gain then
		enable('head','body')
	elseif buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
		if gain then
			send_command('timers create "Aftermath: Lv.3" 180 down;wait 120;input /echo Aftermath: Lv.3 [WEARING OFF IN 60 SEC.];wait 30;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 20;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
		else
			send_command('timers delete "Aftermath: Lv.3"')
			add_to_chat(123,'AM3: [OFF]')
		end
	elseif buff == 'weakness' then -- Weakness Timer --
		if gain then
			send_command('timers create "Weakness" 300 up')
		else
			send_command('timers delete "Weakness"')
		end
	end
	if buff == "sleep" and gain and player.hp > 200 and player.status == "Engaged" then -- Equip Berserker's Torque When You Are Asleep & Have 200+ HP --
		equip({neck="Berserker's Torque"})
	else
		if not midaction() then
			status_change(player.status)
		end
	end
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Accuracy Level Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		status_change(player.status)
		add_to_chat(158,'Accuracy Level: '..AccArray[AccIndex])
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C2' then -- Hybrid Toggle --
		if Armor == 'Hybrid' then
			Armor = 'None'
			add_to_chat(123,'Hybrid Set: [Unlocked]')
		else
			Armor = 'Hybrid'
			add_to_chat(158,'Hybrid Set: '..AccArray[AccIndex])
		end
		status_change(player.status)
	elseif command == 'C7' then -- PDT Toggle --
		if Armor == 'PDT' then
			Armor = 'None'
			add_to_chat(123,'PDT Set: [Unlocked]')
		else
			Armor = 'PDT'
			add_to_chat(158,'PDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C15' then -- MDT Toggle --
		if Armor == 'MDT' then
			Armor = 'None'
			add_to_chat(123,'MDT Set: [Unlocked]')
		else
			Armor = 'MDT'
			add_to_chat(158,'MDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C16' then -- Rancor Toggle --
		if Rancor == 'ON' then
			Rancor = 'OFF'
			add_to_chat(123,'Rancor: [OFF]')
		else
			Rancor = 'ON'
			add_to_chat(158,'Rancor: [ON]')
		end
		status_change(player.status)
	elseif command == 'C9' then -- Mekira Toggle --
		if Mekira == 'ON' then
			Mekira = 'OFF'
			add_to_chat(123,'Mekira: [OFF]')
		else
			Mekira = 'ON'
			add_to_chat(158,'Mekira: [ON]')
		end
		status_change(player.status)
	elseif command == 'C3' then -- Twilight Toggle --
		if Twilight == 1 then
			Twilight = 0
			add_to_chat(123,'Twilight Set: [Unlocked]')
		else
			Twilight = 1
			add_to_chat(158,'Twilight Set: [locked]')
		end
		status_change(player.status)
	elseif command == 'C8' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
		else
			add_to_chat(123,'No Target Selected')
		end
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		status_change(player.status)
		add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end