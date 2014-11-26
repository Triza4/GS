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
    state.Buff.Saboteur = buffactive.saboteur or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT')

    gear.default.obi_waist = "Sekhmet Corset"
    
    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Chainspell'] = {body="Vitivation Tabard"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Atrophy Chapeau +1",
        body="Atrophy Tabard",hands="Yaoyotl Gloves",
        back="Refraction Cape",legs="Hagondes Pants +1",feet="Hagondes Sabots"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    -- 80% Fast Cast (including trait) for all spells, plus 5% quick cast
    -- No other FC sets necessary.
    sets.precast.FC = {ammo="Impatiens",
        head="Atrophy Chapeau +1",ear1="Esquire's Earring",ear2="Loquacious Earring",
        body="Vitivation Tabard",hands="Gendewitha Gages +1",ring1="Prolix Ring",ring2="Veneficium Ring",
        back="Swith Cape",waist="Witful Belt",legs="Artsieq hose",feet="Chelona Boots"}

    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Atrophy Chapeau +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Atrophy Tabard",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Atheling Mantle",waist="Caudata Belt",legs="Hagondes Pants +1",feet="Hagondes Sabots"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, 
        {neck="Shadow Gorget",ear1="Aredan Earring",ear2="Lifestorm Earring",
        ring1="Solemn Ring",ring2="Sirona's Ring",waist="Shadow Belt"})

    sets.precast.WS['Sanguine Blade'] = {ammo="Witchstone",
        head="Hagondes Hat +1",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Hagondes Coat +1",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Acumen Ring",
        back="Toro Cape",legs="Hagondes Pants +1",feet="Hagondes Sabots"}

    
    -- Midcast Sets
    
    sets.midcast.FastRecast = {
        head="Atrophy Chapeau +1",ear1="Esquire's Earring",ear2="Loquacious Earring",
        body="Vitivation Tabard",hands="Gendewitha Gages +1",ring1="Prolix Ring",
        back="Swith Cape",waist="Witful Belt",legs="Artsieq hose",feet="Hagondes Sabots"}

    sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",
        head="Gendewitha Caubeen +1",neck="Healing Torque",ear1="Lifestorm Earring",ear2="Loquacious Earring",
        body="Vitivation Tabard",hands="Hagondes cuffs",ring1="Ephedra Ring",ring2="Sirona's Ring",
        back="Tempered cape",waist="Witful Belt",legs="Atrophy Tights",feet="Rubeus Boots"}
        
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.CureSelf = {ring1="Kunaji Ring",ring2="Asklepian Ring"}

    sets.midcast['Enhancing Magic'] = {
        head="Atrophy Chapeau +1",neck="Colossus's Torque",ear1="Andoaa Earring",
        body="Vitivation Tabard",hands="Atrophy Gloves +1",ring1="Prolix Ring",
        back="Estoqueur's Cape",waist="Olympus Sash",legs="Atrophy Tights",feet="Estoqueur's Houseaux +2"}

    sets.midcast.Refresh = {legs="Estoqueur's Fuseau +2"}

    sets.midcast.Stoneskin = {waist="Siegel Sash"}
    
    sets.midcast['Enfeebling Magic'] = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Kalboron Stone",
        head="Atrophy Chapeau +1",neck="Imbodla Necklace",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body="Ischemia chasuble",hands="Lurid mitts",ring1="Balrahn's ring",ring2="Sangoma Ring",
        back="Refraction Cape",waist="Demonry Sash",legs="Mes'yohi Slacks",feet="Artsieq boots"}

    sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitivation Chapeau"})

    sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitivation Chapeau"})
    
    sets.midcast['Elemental Magic'] = {main="Lehbrailg +2",sub="Zuuxowu grip",ammo="Witchstone",
        head="Hagondes Hat +1",neck="Stoicheion medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Hagondes Coat +1",hands="Yaoyotl Gloves",ring1="Icesoul Ring",ring2="Acumen Ring",
        back="Toro Cape",waist=gear.ElementalObi,legs="Hagondes Pants +1",feet="Hagondes Sabots"}
        
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    sets.midcast['Dark Magic'] = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Kalboron Stone",
        head="Atrophy Chapeau +1",neck="Weike Torque",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body="Vitivation Tabard",hands="Gendewitha Gages +1",ring1="Prolix Ring",ring2="Sangoma Ring",
        back="Refraction Cape",waist="Goading Belt",legs="Hagondes Pants +1",feet="Artsieq boots"}

    sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Kalboron Stone",
        head="Atrophy Chapeau +1",neck="Weike Torque",ear1="Esquire's Earring",ear2="Loquacious Earring",
        body="Vitivation Tabard",hands="Gendewitha Gages +1",ring1="Prolix Ring",ring2="Sangoma Ring",
        back="Refraction Cape",waist="Goading Belt",legs="Artsieq Hose",feet="Artsieq boots"})

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {ring1="Excelsis Ring", waist="Fucho-no-Obi"})

    sets.midcast.Aspir = sets.midcast.Drain


    -- Sets for special buff conditions on spells.

    sets.midcast.EnhancingDuration = {hands="Atrophy Gloves +1",back="Estoqueur's Cape",feet="Estoqueur's Houseaux +2"}
        
    sets.buff.ComposureOther = {head="Estoqueur's Chappel +2",
        body="Estoqueur's Sayon +2",hands="Estoqueur's Gantherots +2",
        legs="Estoqueur's Fuseau +2",feet="Estoqueur's Houseaux +2"}

    sets.buff.Saboteur = {hands="Estoqueur's Gantherots +2"}
    

    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {main="Chatoyant Staff",
        head="Vitivation Chapeau",neck="Twilight Gorget",ear1="Moonshade Earring",
        body="Atrophy Tabard",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        waist="Austerity Belt",legs="Nares Trews",feet="Chelona Boots"}
    

    -- Idle sets
    sets.idle = {main="Bolelabunga",sub="Genbu's Shield",ammo="Impatiens",
        head="Vitivation Chapeau",neck="Twilight Torque",ear1="Moonshade Earring",ear2="Loquacious Earring",
        body="Gendewitha Bliaut +1",hands="Gendewitha Gages +1",ring1="Dark Ring",ring2="Dark Ring",
        back="Shadow Mantle",waist="Witful Belt",legs="Nares Trews",feet="Gendewitha Galoshes +1"}

    sets.idle.Town = {main="Bolelabunga",sub="Genbu's Shield",ammo="Impatiens",
        head="Atrophy Chapeau +1",neck="Twilight Torque",ear1="Moonshade Earring",ear2="Loquacious Earring",
        body="Vitivation Tabard",hands="Gendewitha Gages +1",ring1="Dark Ring",ring2="Dark Ring",
        back="Shadow Mantle",waist="Witful Belt",legs="Crimson Cuisses",feet="Gendewitha Galoshes +1"}
    
    sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",ammo="Impatiens",
        head="Vitivation Chapeau",neck="Twilight Torque",ear1="Moonshade Earring",ear2="Loquacious Earring",
        body="Atrophy Tabard",hands="Serpentes Cuffs",ring1="Dark Ring",ring2="Dark Ring",
        back="Shadow Mantle",waist="Flume Belt +1",legs="Crimson Cuisses",feet="Hagondes Sabots"}

    sets.idle.PDT = {main="Bolelabunga",sub="Genbu's Shield",ammo="Demonry Stone",
        head="Gendewitha Caubeen +1",neck="Twilight Torque",ear1="Moonshade Earring",ear2="Loquacious Earring",
        body="Gendewitha Bliaut +1",hands="Gendewitha Gages +1",ring1="Dark Ring",ring2="Dark Ring",
        back="Shadow Mantle",waist="Flume Belt +1",legs="Osmium Cuisses",feet="Gendewitha Galoshes +1"}

    sets.idle.MDT = {main="Bolelabunga",sub="Genbu's Shield",ammo="Demonry Stone",
        head="Gendewitha Caubeen +1",neck="Twilight Torque",ear1="Moonshade Earring",ear2="Loquacious Earring",
        body="Gendewitha Bliaut +1",hands="Gendewitha Gages +1",ring1="Dark Ring",ring2="Dark Ring",
        back="Engulfer Cape",waist="Flume Belt +1",legs="Osmium Cuisses",feet="Gendewitha Galoshes +1"}
    
    
    -- Defense sets
    sets.defense.PDT = {
        head="Atrophy Chapeau +1",neck="Twilight Torque",ear1="Moonshade Earring",ear2="Loquacious Earring",
        body="Gendewitha Bliaut +1",hands="Gendewitha Gages +1",ring1="Dark Ring",ring2="Dark Ring",
        back="Shadow Mantle",waist="Flume Belt +1",legs="Hagondes Pants +1",feet="Gendewitha Galoshes +1"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Atrophy Chapeau +1",neck="Twilight Torque",ear1="Moonshade Earring",ear2="Loquacious Earring",
        body="Atrophy Tabard",hands="Gendewitha Gages +1",ring1="Dark Ring",ring2="Dark Ring",
        back="Engulfer Cape",waist="Flume Belt +1",legs="Hagondes Pants +1",feet="Gendewitha Galoshes +1"}

    sets.Kiting = {legs="Crimson Cuisses"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
        head="Atrophy Chapeau +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Atrophy Tabard",hands="Atrophy Gloves +1",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Atheling Mantle",waist="Goading Belt",legs="Osmium Cuisses",feet="Battlecast gaiters"}

    sets.engaged.Defense = {ammo="Demonry Stone",
        head="Atrophy Chapeau +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Atrophy Tabard",hands="Atrophy Gloves +1",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Kayapa Cape",waist="Goading Belt",legs="Osmium Cuisses",feet="Battlecast gaiters"}

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Enfeebling Magic' and state.Buff.Saboteur then
        equip(sets.buff.Saboteur)
    elseif spell.skill == 'Enhancing Magic' then
        equip(sets.midcast.EnhancingDuration)
        if buffactive.composure and spell.target.type == 'PLAYER' then
            equip(sets.buff.ComposureOther)
        end
    elseif spellMap == 'Cure' and spell.target.type == 'SELF' then
        equip(sets.midcast.CureSelf)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'None' then
            enable('main','sub','range')
        else
            disable('main','sub','range')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(2, 4)
    elseif player.sub_job == 'NIN' then
        set_macro_page(3, 4)
    elseif player.sub_job == 'THF' then
        set_macro_page(4, 4)
    else
        set_macro_page(1, 4)
    end
end