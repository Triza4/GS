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
    indi_timer = ''
    indi_duration = 180
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

    gear.default.weaponskill_waist = "Windbuffet Belt +1"

    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
    sets.precast.JA['Life cycle'] = {body="Geomancy Tunic"}

    -- Fast cast sets for spells

    sets.precast.FC = {range="Dunna",
        head="Nahtirah Hat",ear2="Loquacious Earring",
        body="Vanir Cotehardie",hands="Repartie Gloves",ring1="Prolix Ring",ring2="Veneficium Ring",
        back="Swith Cape",waist="Witful Belt",legs="Geomancy Pants",feet="Chelona Boots"}

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Tamaxchi",sub="Genbu's Shield",back="Pahtli Cape"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal"})

    
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Nahtirah Hat",neck=gear.ElementalGorget,ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Refraction Cape",waist=gear.ElementalBelt,legs="Hagondes Pants +1",feet="Hagondes Sabots"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Flash Nova'] = {ammo="Dosis Tathlum",
        head="Hagondes Hat +1",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Hagondes coat +1",hands="Yaoyotl Gloves",ring1="Acumen Ring",ring2="Strendu Ring",
        back="Toro Cape",waist="Snow Belt",legs="Hagondes Pants +1",feet="Hagondes Sabots"}

    sets.precast.WS['Starlight'] = {ear2="Moonshade Earring"}

    sets.precast.WS['Moonlight'] = {ear2="Moonshade Earring"}


    --------------------------------------
    -- Midcast sets
    --------------------------------------

    -- Base fast recast for spells
    sets.midcast.FastRecast = {main="Lehbrailg +2",sub="Mephitis Grip",
        head="Nahtirah Hat",ear2="Loquacious Earring",
        body="Hagondes coat +1",hands="Bagua Mitaines",ring1="Prolix Ring",
        back="Swith Cape",waist="Goading Belt",legs="Artsieq Hose",feet="Artsieq Boots"}

    sets.midcast.Geomancy = {main="Lehbrailg +2",sub="Mephitis Grip",range="Dunna",
	    head="Artsieq Hat",ear1="Gwati Earring",ear2="Gifted Earring",
		body="Bagua Tunic +1",hands="Geomancy Mitaines +1",
		back="Lifestream Cape",waist="Sekhmet Corset",legs="Bagua Pants",feet="Umbani Boots"}
		
    sets.midcast.Geomancy.Indi = {main="Lehbrailg +2",sub="Mephitis Grip",range="Dunna",
	    head="Artsieq Hat",ear1="Gwati Earring",ear2="Gifted Earring",
		body="Bagua Tunic +1",hands="Geomancy Mitaines +1",
		back="Lifestream Cape",waist="Sekhmet Corset",legs="Bagua Pants",feet="Umbani Boots"}

    sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",
        body="Heka's Kalasiris",hands="Bagua Mitaines",ring1="Haoma Ring",ring2="Sirona's Ring",
        back="Swith Cape",legs="Nares Trews",feet="Rubeus Boots"}
		
	sets.midcast['Enfeebling Magic'] = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Kalboron Stone",
        head="Buremte hat",neck="Imbodla Necklace",ear1="Psystorm Earring",ear2="Lifestorm earring",
        body="Artsieq Jubbah",hands="Lurid Mitts",ring1="Balrahn's ring",ring2="Sangoma Ring",
        back="Refraction cape",waist="Demonry sash",legs="Mes'yohi slacks",feet="Artsieq Boots"}
		
	sets.midcast['Elemental Magic'] = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Witchstone",
        head="Buremte hat",neck="Eddy Necklace",ear1="Hecate's earring",ear2="Crematio earring",
        body="Artsieq Jubbah",hands="Yaoyotl gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
        back="Torro cape",waist="Sekhmet Corset",legs="Hagondes Pants +1",feet="Umbani Boots"}
    
    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Protectra = {ring1="Sheltered Ring"}

    sets.midcast.Shellra = {ring1="Sheltered Ring"}


    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    sets.resting = {head="Nefer Khat",neck="Wiglen Gorget",
        body="Heka's Kalasiris",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        waist="Austerity Belt",legs="Nares Trews",feet="Chelona Boots"}


    -- Idle sets

    sets.idle = {main="Bolelabunga",sub="Genbu's Shield",range="Dunna",
        head="Nahtirah Hat",neck="Wiglen Gorget",ear1="Gifted Earring",ear2="Sanare Earring",
        body="Hagondes coat +1",hands="Bagua mitaines",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Kumbira Cape",waist="Fucho-no-obi",legs="Nares Trews",feet="Geomancy sandals"}

    sets.idle.PDT = {main="Bolelabunga",sub="Genbu's Shield",range="Dunna",
        head="Nahtirah Hat",neck="Twilight Torque",ear1="Gifted Earring",ear2="Sanare Earring",
        body="Geomancy tunic",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Dark Ring",
        back="Shadow mantle",waist="Fucho-no-obi",legs="Nares Trews",feet="Geomancy sandals"}

    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = {main="Bolelabunga",sub="Genbu's Shield",range="Dunna",
        head="Nahtirah Hat",neck="Twilight Torque",ear1="Gifted Earring",ear2="Sanare Earring",
        body="Geomancy tunic",hands="Geomancy Mitaines +1",ring1="Defending Ring",ring2="Paguroidea Ring",
        back="Shadow mantle",waist="Isa Belt",legs="Nares Trews",feet="Bagua Sandals"}

    sets.idle.PDT.Pet = {main="Bolelabunga",sub="Genbu's Shield",range="Dunna",
        head="Nahtirah Hat",neck="Twilight Torque",ear1="Gifted Earring",ear2="Sanare Earring",
        body="Hagondes coat +1",hands="Geomancy Mitaines +1",ring1="Defending Ring",ring2="Dark Ring",
        back="Shadow mantle",waist="Isa Belt",legs="Nares Trews",feet="Bagua Sandals"}

    -- .Indi sets are for when an Indi-spell is active.
    sets.idle.Indi = set_combine(sets.idle, {legs="Bagua Pants"})
    sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {legs="Bagua Pants"})
    sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {legs="Bagua Pants"})
    sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {legs="Bagua Pants"})

    sets.idle.Town = {main="Bolelabunga",sub="Genbu's Shield",range="Dunna",
        head="Nahtirah Hat",neck="Wiglen Gorget",ear1="Gifted Earring",ear2="Sanare Earring",
        body="Hagondes coat +1",hands="Bagua mitaines",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Kumbira Cape",waist="Fucho-no-obi",legs="Nares Trews",feet="Geomancy sandals"}

    sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",range="Dunna",
        head="Nahtirah Hat",neck="Wiglen Gorget",ear1="Gifted Earring",ear2="Sanare Earring",
        body="Geomancy tunic",hands="Bagua mitaines",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Shadow mantle",waist="Fucho-no-obi",legs="Nares Trews",feet="Geomancy sandals"}

    -- Defense sets

    sets.defense.PDT = {range="Dunna",
        head="Hagondes Hat +1",neck="Wiglen Gorget",ear1="Gifted Earring",ear2="Sanare Earring",
        body="Hagondes coat +1",hands="Bagua mitaines",ring1="Defending Ring",ring2="Dark Ring",
        back="Shadow mantle",waist="Fucho-no-obi",legs="Hagondes Pants +1",feet="Hagondes Sabots"}

    sets.defense.MDT = {range="Dunna",
        head="Nahtirah Hat",neck="Wiglen Gorget",ear1="Gifted Earring",ear2="Sanare Earring",
        body="Hagondes coat +1",hands="Bagua mitaines",ring1="Defending Ring",ring2="Shadow Ring",
        back="Shadow mantle",waist="Fucho-no-obi",legs="Hagondes Pants +1",feet="Hagondes Sabots"}

    sets.Kiting = {feet="Geomancy sandals"}

    sets.latent_refresh = {waist="Fucho-no-obi"}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {range="Dunna",
        head="Nahtirah Hat",neck="Asperity necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Hagondes coat +1",hands="Bokwus Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Rancorous Mantle",waist="Goading Belt",legs="Hagondes Pants +1",feet="Hagondes Sabots"}

    --------------------------------------
    -- Custom buff sets
    --------------------------------------

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english:startswith('Indi') then
            if not classes.CustomIdleGroups:contains('Indi') then
                classes.CustomIdleGroups:append('Indi')
            end
            send_command('@timers d "'..indi_timer..'"')
            indi_timer = spell.english
            send_command('@timers c "'..indi_timer..'" '..indi_duration..' down spells/00136.png')
        elseif spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
        elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
        end
    elseif not player.indi then
        classes.CustomIdleGroups:clear()
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if player.indi and not classes.CustomIdleGroups:contains('Indi')then
        classes.CustomIdleGroups:append('Indi')
        handle_equipping_gear(player.status)
    elseif classes.CustomIdleGroups:contains('Indi') and not player.indi then
        classes.CustomIdleGroups:clear()
        handle_equipping_gear(player.status)
    end
end

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Geomancy' then
            if spell.english:startswith('Indi') then
                return 'Indi'
            end
        end
    end
end

function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    classes.CustomIdleGroups:clear()
    if player.indi then
        classes.CustomIdleGroups:append('Indi')
    end
end

-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 12)
end
