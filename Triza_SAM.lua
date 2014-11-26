-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Hasso = buffactive.Hasso or false
    state.Buff.Seigan = buffactive.Seigan or false
    state.Buff.Sekkanoki = buffactive.Sekkanoki or false
    state.Buff.Sengikori = buffactive.Sengikori or false
    state.Buff['Meikyo Shisui'] = buffactive['Meikyo Shisui'] or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'PDT', 'Reraise')
    state.WeaponskillMode:options('Normal', 'Acc', 'Mod')
    state.PhysicalDefenseMode:options('PDT', 'Reraise')

    update_combat_form()
    
    -- Additional local binds
    send_command('bind ^` input /ja "Hasso" <me>')
    send_command('bind !` input /ja "Seigan" <me>')

    select_default_macro_book()
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !-')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    -- Precast sets to enhance JAs
    sets.precast.JA.Meditate = {head="Myochin Kabuto",hands="Saotome Kote +2"}
    sets.precast.JA['Warding Circle'] = {head="Myochin Kabuto"}
    sets.precast.JA['Blade Bash'] = {hands="Saotome Kote +2"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Sonia's Plectrum",
        head="Yaoyotl Helm",
        body="Otronif Harness +1 +1",hands="Buremte Gloves",ring1="Spiral Ring",
        back="Iximulew Cape",waist="Caudata Belt",legs="Karieyh Brayettes +1",feet="Otronif Boots +1"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ranged="Cibitshavore",
		head="Otomi Helm",neck="Asperity Necklace",ear1="Moonshade Earring",ear2="Brutal Earring",
		body="Sakonji Domaru +1",hands="Boor Bracelets",ring1="Pyrosoul Ring",ring2="Rajas Ring",
		back="Buquwik Cape",waist="Metalsinger belt",legs="Scuffler's cosciales",feet="Ejekamal Boots"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {back="Letalis Mantle"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Tachi: Fudo'] = set_combine(sets.precast.WS, {neck="Snow Gorget"})
	sets.precast.WS['Tachi: Fudo'].Acc = set_combine(sets.precast.WS.Acc, {head="Yaoyotl Helm",hands="Buremte Gloves",neck="Snow Gorget",
	    legs="Mikinaak cuisses",waist="Snow Belt"})
	sets.precast.WS['Tachi: Fudo'].Mod = set_combine(sets.precast.WS['Tachi: Fudo'], {body="Sakonji domaru +1",waist="Snow Belt"})
    sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {neck="Thunder Gorget",waist="Thunder Belt"})
	sets.precast.WS['Tachi: Shoha'].Acc = set_combine(sets.precast.WS.Acc, {head="Yaoyotl Helm",hands="Buremte Gloves",
		neck="Thunder Gorget",legs="Mikinaak cuisses",waist="Thunder Belt"})
	sets.precast.WS['Tachi: Shoha'].Mod = set_combine(sets.precast.WS['Tachi: Shoha'], {waist="Thunder Belt"})
    sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {neck="Thunder Gorget"})
    sets.precast.WS['Tachi: Shoha'].Acc = set_combine(sets.precast.WS.Acc, {neck="Thunder Gorget"})
    sets.precast.WS['Tachi: Shoha'].Mod = set_combine(sets.precast.WS['Tachi: Shoha'], {body="Sakonji domaru +1",waist="Thunder Belt"})

    sets.precast.WS['Tachi: Rana'] = set_combine(sets.precast.WS, {neck="Snow Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",})
    sets.precast.WS['Tachi: Rana'].Acc = set_combine(sets.precast.WS.Acc, {neck="Snow Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",})
    sets.precast.WS['Tachi: Rana'].Mod = set_combine(sets.precast.WS['Tachi: Rana'], {waist="Snow Belt"})
	
    sets.precast.WS['Apex Arrow'] = set_combine(sets.precast.WS, {ammo="Tulfaire Arrow",
        head="Sakonji Kabuto",neck="Thunder Gorget",ear2="Clearview Earring",hands="Unkai Kote +2",
        ring1="Stormsoul Ring",ring2="Hajduk ring",waist="Thunder Belt",legs="Wakido Haidate +1",feet="Wakido Sune-Ate +1"})
    sets.precast.WS['Apex Arrow'].Acc = set_combine(sets.precast.WS.Acc, {neck="Iqabi Necklace",body="Kayujutsugi",hands="Buremte Gloves",
        ring1="Paqichikaji Ring",legs="Artosaur trousers +1"})
	

    sets.precast.WS['Tachi: Kasha'] = set_combine(sets.precast.WS, {neck="Light Gorget",waist="Light Belt"})

    sets.precast.WS['Tachi: Gekko'] = set_combine(sets.precast.WS, {neck="Snow Gorget",waist="Snow Belt"})

    sets.precast.WS['Tachi: Yukikaze'] = set_combine(sets.precast.WS, {neck="Snow Gorget",waist="Snow Belt"})

    sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS, {neck="Soil Gorget",waist="Soil Belt"})

    sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS, {neck="Soil Gorget",waist="Soil Belt"})


    -- Midcast Sets
    sets.midcast.FastRecast = {
		head="Yaoyotl Helm",
		body="Otronif Harness +1",hands="Otronif Gloves +1",
		legs="Otronif Brais +1",feet="Otronif Boots +1"}
    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
	sets.resting = {neck="Wiglen Gorget",ring1="Sheltered Ring",ring2="Paguroidea Ring"}


	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle.Town = {main="Tsurumaru",ranged="Cibitshavore",
		head="Otomi Helm",neck="Wiglen Gorget",ear1="Trux Earring",ear2="Brutal Earring",
		body="Kumarbi's Akar",hands="Wakido Kote +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Wakido Haidate +1",feet="Danzo Sune-ate"}

	sets.idle.Field = {
		head="Otomi Helm",neck="Wiglen Gorget",ear1="Trux Earring",ear2="Brutal Earring",
		body="Kumarbi's Akar",hands="Wakido Kote +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Wakido Haidate +1",feet="Danzo Sune-ate"}

	sets.idle.Weak = {
		head="Twilight Helm",neck="Wiglen Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Twilight Mail",hands="Buremte Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Sakonji Haidate",feet="Danzo Sune-ate"}

	-- Defense sets
	sets.defense.PDT = {ranged="Cibitshavore",
		head="Lithelimb Cap",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Otronif Harness +1",hands="Otronif Gloves +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Otronif Brais +1",feet="Otronif Boots +1"}

	sets.defense.Reraise = {
		head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Twilight Mail",hands="Buremte Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Sakonji Haidate",feet="Otronif Boots +1"}

	sets.defense.MDT = {ranged="Cibitshavore",
		head="Yaoyotl Helm",neck="Twilight Torque",ear1="Snare Earring",ear2="Mujin Stud",
		body="Kyujutsugi",hands="Otronif Gloves +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Engulfer Cape",waist="Flume Belt +1",legs="Otronif Brais +1",feet="Otronif Boots +1"}

	sets.Kiting = {feet="Danzo Sune-ate"}

	sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	-- Delay 450 GK, 25 Save TP => 65 Store TP for a 5-hit (25 Store TP in gear)
	sets.engaged = {ranged="Cibitshavore",
		head="Otomi Helm",neck="Ganesha's Mala",ear1="Trux Earring",ear2="Brutal Earring",
		body="Sakonji domaru +1",hands="Wakido Kote +1",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Takaha Mantle",waist="Windbuffet Belt +1",legs="Wakido Haidate +1",feet="Sakonji Sune-Ate"}
	sets.engaged.Acc = {ranged="Cibitshavore",
		head="Yaoyotl Helm",neck="Iqabi necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Mes'yohi Haubergeon",hands="Wakido Kote +1",ring1="Patricius Ring",ring2="Mars's Ring",
		back="Takaha Mantle",waist="Dynamic Belt",legs="Xaddi Cuisses",feet="Wakido sune-ate +1"}
	sets.engaged.PDT = {ranged="Cibitshavore",
		head="Lithelimb Cap",neck="Ganesha's Mala",ear1="Trux Earring",ear2="Brutal Earring",
		body="Otronif Harness +1",hands="Otronif Gloves +1",ring1="Patricius Ring",ring2="Defending Ring",
		back="Takaha Mantle",waist="Windbuffet Belt +1",legs="Otronif Brais +1",feet="Otronif Boots +1"}
	sets.engaged.Acc.PDT = {ranged="Cibitshavore",
		head="Lithelimb Cap",neck="Iqabi necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Mes'yohi Haubergeon",hands="Otronif Gloves +1",ring1="Patricius Ring",ring2="Defending Ring",
		back="Takaha Mantle",waist="Windbuffet Belt +1",legs="Otronif Brais +1",feet="Otronif Boots +1"}
	sets.engaged.Reraise = {ranged="Cibitshavore",
		head="Twilight Helm",neck="Ganesha's Mala",ear1="Trux Earring",ear2="Brutal Earring",
		body="Twilight Mail",hands="Wakido Kote +1",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Takaha Mantle",waist="Windbuffet Belt +1",legs="Otronif Brais +1",feet="Otronif Boots +1"}
	sets.engaged.Acc.Reraise = {ranged="Cibitshavore",
		head="Twilight Helm",neck="Ganesha's Mala",ear1="Trux Earring",ear2="Brutal Earring",
		body="Twilight Mail",hands="Wakido Kote +1",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Takaha Mantle",waist="Windbuffet Belt +1",legs="Otronif Brais +1",feet="Otronif Boots +1"}

	-- Melee sets for in Adoulin, which has an extra 10 Save TP for weaponskills.
	-- Delay 450 GK, 35 Save TP => 89 Store TP for a 4-hit (49 Store TP in gear), 2 Store TP for a 5-hit
	sets.engaged.Adoulin = {ranged="Cibitshavore",
		head="Otomi Helm",neck="Ganesha's Mala",ear1="Trux Earring",ear2="Brutal Earring",
		body="Xaddi Mail",hands="Wakido Kote +1",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Takaha Mantle",waist="Windbuffet Belt +1",legs="Otronif Brais +1",feet="Otronif Boots +1"}
	sets.engaged.Adoulin.Acc = {ranged="Cibitshavore",
		head="Yaoyotl Helm",neck="Iqabi necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Mes'yohi Haubergeon",hands="Wakido Kote +1",ring1="Patricius Ring",ring2="Mars's Ring",
		back="Takaha Mantle",waist="Windbuffet Belt +1",legs="Xaddi Cuisses",feet="Wakido sune-ate +1"}
	sets.engaged.Adoulin.PDT = {ranged="Cibitshavore",
		head="Lithelimb Cap",neck="Ganesha's Mala",ear1="Trux Earring",ear2="Brutal Earring",
		body="Otronif Harness +1",hands="Otronif Gloves +1",ring1="Patricius Ring",ring2="Defending Ring",
		back="Takaha Mantle",waist="Windbuffet Belt +1",legs="Otronif Brais +1",feet="Otronif Boots +1"}
	sets.engaged.Adoulin.Acc.PDT = {ranged="Cibitshavore",
		head="Lithelimb Cap",neck="Iqabi necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Mes'yohi Haubergeon",hands="Otronif Gloves +1",ring1="Patricius Ring",ring2="Defending Ring",
		back="Takaha Mantle",waist="Windbuffet Belt +1",legs="Otronif Brais +1",feet="Otronif Boots +1"}
	sets.engaged.Adoulin.Reraise = {ranged="Cibitshavore",
		head="Twilight Helm",neck="Ganesha's Mala",ear1="Trux Earring",ear2="Brutal Earring",
		body="Twilight Mail",hands="Wakido Kote +1",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Takaha Mantle",waist="Windbuffet Belt +1",legs="Otronif Brais +1",feet="Otronif Boots +1"}
	sets.engaged.Adoulin.Acc.Reraise = {ranged="Cibitshavore",
		head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Twilight Mail",hands="Otronif Gloves +1",ring1="Beeline Ring",ring2="K'ayres Ring",
		back="Takaha Mantle",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}


	sets.buff.Sekkanoki = {hands="Unkai Kote +2"}
	sets.buff.Sengikori = {feet="Unkai Sune-ate +2"}
	sets.buff['Meikyo Shisui'] = {feet="Sakonji Sune-Ate"}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic target handling to be done.
function job_pretarget(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' then
        -- Change any GK weaponskills to polearm weaponskill if we're using a polearm.
        if player.equipment.main=='Quint Spear' or player.equipment.main=='Quint Spear' then
            if spell.english:startswith("Tachi:") then
                send_command('@input /ws "Penta Thrust" '..spell.target.raw)
                eventArgs.cancel = true
            end
        end
    end
end

-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type:lower() == 'weaponskill' then
        if state.Buff.Sekkanoki then
            equip(sets.buff.Sekkanoki)
        end
        if state.Buff.Sengikori then
            equip(sets.buff.Sengikori)
        end
        if state.Buff['Meikyo Shisui'] then
            equip(sets.buff['Meikyo Shisui'])
        end
    end
end


-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Effectively lock these items in place.
    if state.HybridMode.value == 'Reraise' or
        (state.DefenseMode.value == 'Physical' and state.PhysicalDefenseMode.value == 'Reraise') then
        equip(sets.Reraise)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_combat_form()
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_combat_form()
    if areas.Adoulin:contains(world.area) and buffactive.ionis then
        state.CombatForm:set('Adoulin')
    else
        state.CombatForm:reset()
    end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'WAR' then
		set_macro_page(1, 7)
	elseif player.sub_job == 'DNC' then
		set_macro_page(2, 7)
	elseif player.sub_job == 'THF' then
		set_macro_page(3, 7)
	elseif player.sub_job == 'NIN' then
		set_macro_page(4, 7)
	else
		set_macro_page(1, 7)
	end
end