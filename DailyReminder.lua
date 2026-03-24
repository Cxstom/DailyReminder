local addonName, ns = ...

------------------------------------------------------------
-- Quest Data
------------------------------------------------------------

-- TBC Dungeon Dailies (Normal)
local dungeonDailies = {
    [11389] = "Wanted: Arcatraz Sentinels",
    [11371] = "Wanted: Coilfang Myrmidons",
    [11376] = "Wanted: Malicious Instructors",
    [11383] = "Wanted: Rift Lords",
    [11364] = "Wanted: Shattered Hand Centurions",
    [11500] = "Wanted: Sisters of Torment",
    [11385] = "Wanted: Sunseeker Channelers",
    [11387] = "Wanted: Tempest-Forge Destroyers",
}

-- TBC Heroic Dailies
local heroicDailies = {
    [11369] = "Wanted: A Black Stalker Egg",
    [11384] = "Wanted: A Warp Splinter Clipping",
    [11382] = "Wanted: Aeonus's Hourglass",
    [11363] = "Wanted: Bladefist's Seal",
    [11362] = "Wanted: Keli'dan's Feathered Stave",
    [11375] = "Wanted: Murmur's Whisper",
    [11354] = "Wanted: Nazan's Riding Crop",
    [11386] = "Wanted: Pathaleon's Projector",
    [11373] = "Wanted: Shaffar's Wondrous Pendant",
    [11378] = "Wanted: The Epoch Hunter's Head",
    [11374] = "Wanted: The Exarch's Soul Gem",
    [11372] = "Wanted: The Headfeathers of Ikiss",
    [11368] = "Wanted: The Heart of Quagmirran",
    [11388] = "Wanted: The Scroll of Skyriss",
    [11370] = "Wanted: The Warlord's Treatise",
    [11499] = "WANTED: The Signet Ring of Prince Kael'thas",
}

-- TBC PVP Dailies (Horde + Alliance)
local pvpDailies = {
    -- Horde (Battlegrounds)
    [11342] = "Call to Arms: Warsong Gulch",
    [11339] = "Call to Arms: Arathi Basin",
    [11340] = "Call to Arms: Alterac Valley",
    [11341] = "Call to Arms: Eye of the Storm",
    [13407] = "Call to Arms: Strand of the Ancients",
    [14164] = "Call to Arms: Isle of Conquest",
    -- Horde (World PVP)
    [10110] = "Hellfire Fortifications",
    [11506] = "Spirits of Auchindoun",
    [11503] = "Enemies, Old and New",
    -- Alliance (Battlegrounds)
    [11338] = "Call to Arms: Warsong Gulch",
    [11335] = "Call to Arms: Arathi Basin",
    [11336] = "Call to Arms: Alterac Valley",
    [11337] = "Call to Arms: Eye of the Storm",
    [13405] = "Call to Arms: Strand of the Ancients",
    [14163] = "Call to Arms: Isle of Conquest",
    -- Alliance (World PVP)
    [10106] = "Hellfire Fortifications",
    [11505] = "Spirits of Auchindoun",
    [11502] = "In Defense of Halaa",
}

-- Ogri'la / Sha'tari Skyguard Dailies
local ogrilaDailies = {
    [11080] = "The Relic's Emanation",
    [11023] = "Bomb Them Again!",
    [11066] = "Wrangle More Aether Rays!",
    [11051] = "Banish More Demons",
    [11008] = "Fires Over Skettis",
    [11085] = "Escape from Skettis",
}

-- Cooking Dailies
local cookingDailies = {
    [11380] = "Manalicious",
    [11377] = "Revenge is Tasty",
    [11381] = "Soup for the Soul",
    [11379] = "Super Hot Stew",
}

-- Fishing Dailies
local fishingDailies = {
    [11666] = "Bait Bandits",
    [11665] = "Crocolisks in the City",
    [11669] = "Felblood Fillet",
    [11668] = "Shrimpin' Ain't Easy",
    [11667] = "The One That Got Away",
}

------------------------------------------------------------
-- Profession Cooldown Data
------------------------------------------------------------

-- Format: [spellID] = { name, cd (seconds), profession, shared (optional group key) }
local professionCooldowns = {
    -- Tailoring Specialization Cloths (3 day 20 hour cooldown)
    [26751] = { name = "Primal Mooncloth", cd = 331200, profession = "Tailoring" },
    [26750] = { name = "Spellcloth",       cd = 331200, profession = "Tailoring" },
    [36686] = { name = "Shadowcloth",      cd = 331200, profession = "Tailoring" },

    -- Alchemy Transmutes (20 hour shared cooldown)
    [28585] = { name = "Transmute: Primal Might",           cd = 72000, profession = "Alchemy", shared = "primal" },
    [28566] = { name = "Transmute: Primal Air to Fire",     cd = 72000, profession = "Alchemy", shared = "primal" },
    [28567] = { name = "Transmute: Primal Earth to Water",  cd = 72000, profession = "Alchemy", shared = "primal" },
    [28568] = { name = "Transmute: Primal Fire to Earth",   cd = 72000, profession = "Alchemy", shared = "primal" },
    [28569] = { name = "Transmute: Primal Water to Air",    cd = 72000, profession = "Alchemy", shared = "primal" },
    [28580] = { name = "Transmute: Primal Shadow to Water", cd = 72000, profession = "Alchemy", shared = "primal" },
    [28581] = { name = "Transmute: Primal Water to Shadow", cd = 72000, profession = "Alchemy", shared = "primal" },
    [28582] = { name = "Transmute: Primal Mana to Fire",    cd = 72000, profession = "Alchemy", shared = "primal" },
    [28583] = { name = "Transmute: Primal Fire to Mana",    cd = 72000, profession = "Alchemy", shared = "primal" },
    [28584] = { name = "Transmute: Primal Life to Earth",   cd = 72000, profession = "Alchemy", shared = "primal" },
    [32765] = { name = "Transmute: Earthstorm Diamond",     cd = 72000, profession = "Alchemy", shared = "primal" },
    [32766] = { name = "Transmute: Skyfire Diamond",        cd = 72000, profession = "Alchemy", shared = "primal" },

    -- Leatherworking (2 day 23 hour cooldown)
    [32748] = { name = "Salt Shaker", cd = 255600, profession = "Leatherworking" },
}

-- Reverse lookup: spell name → spellID
local profCooldownByName = {}
for spellID, data in pairs(professionCooldowns) do
    profCooldownByName[data.name] = spellID
end

------------------------------------------------------------
-- Defaults & Settings
------------------------------------------------------------

local defaults = {
    sound = "RAID_WARNING",
    alertType = "POPUP", -- "CHAT", "RAID_WARNING", "POPUP"
    minimapAngle = 220,
    minimapHidden = false,
    checkDungeons = true,
    checkHeroics = true,
    checkPVP = true,
    checkOgrila = true,
    checkCooking = true,
    checkFishing = true,
    checkConsortium = true,
    checkProfessions = true,
    firstRun = true,
}

local soundOptions = {
    { key = "NONE",          label = "None" },
    { key = "RAID_WARNING",  label = "Raid Warning" },
    { key = "READY_CHECK",   label = "Ready Check" },
    { key = "ALARM_CLOCK",   label = "Alarm Clock" },
    { key = "SPELLBOOK_OPEN",label = "Spell Book Open" },
    { key = "GNOME_ALERT",   label = "Gnome Alert Bot" },
    { key = "MALACRASS_WARN",label = "Malacrass Warning" },
}

local alertOptions = {
    { key = "CHAT",          label = "Chat Message" },
    { key = "RAID_WARNING",  label = "Raid Warning Text" },
    { key = "POPUP",         label = "Popup Window" },
}

-- Session-only flag: once the user dismisses the popup, stop reminding
local dismissedThisSession = false

------------------------------------------------------------
-- Sound Playback
------------------------------------------------------------

local soundMap = {
    RAID_WARNING  = SOUNDKIT.RAID_WARNING,
    READY_CHECK   = SOUNDKIT.READY_CHECK,
    ALARM_CLOCK   = SOUNDKIT.ALARM_CLOCK_WARNING_2,
    SPELLBOOK_OPEN = 875,
    GNOME_ALERT   = 5761,
    MALACRASS_WARN = 12057,
}

local function PlayChosenSound()
    local key = DailyReminderDB.sound
    if key == "NONE" then return end
    local id = soundMap[key]
    if id then
        PlaySound(id)
    end
end

------------------------------------------------------------
-- Popup Frame
------------------------------------------------------------

local popupFrame

local function CreatePopupFrame()
    if popupFrame then return popupFrame end

    local f = CreateFrame("Frame", "DailyReminderPopup", UIParent, "BackdropTemplate")
    f:SetSize(360, 200)
    f:SetPoint("CENTER")
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)
    f:SetFrameStrata("DIALOG")

    f:SetBackdrop({
        bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 8, right = 8, top = 8, bottom = 8 },
    })

    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -16)
    title:SetText("|cff00ff00Daily Reminder|r")

    local body = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    body:SetPoint("TOP", title, "BOTTOM", 0, -10)
    body:SetPoint("LEFT", 20, 0)
    body:SetPoint("RIGHT", -20, 0)
    body:SetJustifyH("LEFT")
    body:SetSpacing(2)
    f.body = body

    -- OK button (close)
    local okBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    okBtn:SetSize(100, 24)
    okBtn:SetPoint("BOTTOMRIGHT", -16, 14)
    okBtn:SetText("OK")
    okBtn:SetScript("OnClick", function() f:Hide() end)

    -- Dismiss for session button
    local dismissBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    dismissBtn:SetSize(180, 24)
    dismissBtn:SetPoint("BOTTOMLEFT", 16, 14)
    dismissBtn:SetText("Don't remind this session")
    dismissBtn:SetScript("OnClick", function()
        dismissedThisSession = true
        f:Hide()
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[Daily Reminder]|r Reminders paused for this session. Type |cffffff00/dr resume|r to re-enable.")
    end)

    f:Hide()
    popupFrame = f
    return f
end

local function ShowPopup(lines)
    local f = CreatePopupFrame()
    -- Resize height based on content
    local text = table.concat(lines, "\n")
    f.body:SetText(text)
    local textHeight = f.body:GetStringHeight()
    f:SetHeight(math.max(140, textHeight + 90))
    f:Show()
end

-- Forward declarations (defined later, referenced in callbacks above their definition)
local RunCheck
local ShowConsortiumWindow
local ShowProfessionsWindow
local RefreshProfessionsWindow
local professionsFrame

------------------------------------------------------------
-- First-Run Setup Popup
------------------------------------------------------------

local setupFrame

local function CreateSetupFrame()
    if setupFrame then return setupFrame end

    local f = CreateFrame("Frame", "DailyReminderSetupPopup", UIParent, "BackdropTemplate")
    f:SetSize(400, 430)
    f:SetPoint("CENTER")
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)
    f:SetFrameStrata("DIALOG")

    f:SetBackdrop({
        bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 8, right = 8, top = 8, bottom = 8 },
    })

    -- Title
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -16)
    title:SetText("|cff00ff00Daily Reminder — First Time Setup|r")

    -- Description
    local desc = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    desc:SetPoint("TOP", title, "BOTTOM", 0, -8)
    desc:SetPoint("LEFT", 20, 0)
    desc:SetPoint("RIGHT", -20, 0)
    desc:SetJustifyH("LEFT")
    desc:SetText("Welcome! Choose which daily categories you want to track.\nYou can change these later in the addon settings.")

    -- Checkbox helper
    local checkboxes = {}
    local function CreateSetupCheckbox(parent, labelText, dbKey, anchor, offsetY)
        local cb = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
        cb:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, offsetY or -6)
        cb.text = cb:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        cb.text:SetPoint("LEFT", cb, "RIGHT", 4, 0)
        cb.text:SetText(labelText)
        cb:SetChecked(DailyReminderDB[dbKey])
        cb.dbKey = dbKey
        table.insert(checkboxes, cb)
        return cb
    end

    local cb1 = CreateSetupCheckbox(f, "Dungeon Dailies (Normal)",        "checkDungeons", desc, -8)
    local cb2 = CreateSetupCheckbox(f, "Heroic Dungeon Dailies",          "checkHeroics",  cb1, -4)
    local cb3 = CreateSetupCheckbox(f, "PVP Dailies (Battlegrounds & World)", "checkPVP",  cb2, -4)
    local cb4 = CreateSetupCheckbox(f, "Ogri'la / Sha'tari Skyguard Dailies", "checkOgrila", cb3, -4)
    local cb5 = CreateSetupCheckbox(f, "Cooking Dailies",                      "checkCooking", cb4, -4)
    local cb6 = CreateSetupCheckbox(f, "Fishing Dailies",                      "checkFishing", cb5, -4)
    local cb7 = CreateSetupCheckbox(f, "Consortium Monthly Quest",             "checkConsortium", cb6, -4)
    local cb8 = CreateSetupCheckbox(f, "Profession Cooldowns",                  "checkProfessions", cb7, -4)

    -- Save button
    local saveBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    saveBtn:SetSize(140, 26)
    saveBtn:SetPoint("BOTTOM", 0, 16)
    saveBtn:SetText("Save & Continue")
    saveBtn:SetScript("OnClick", function()
        for _, cb in ipairs(checkboxes) do
            DailyReminderDB[cb.dbKey] = cb:GetChecked() and true or false
        end
        DailyReminderDB.firstRun = false
        f:Hide()
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[Daily Reminder]|r Setup complete! Use |cffffff00/dr|r to adjust settings anytime.")
        -- Run initial check after setup
        C_Timer.After(2, RunCheck)
    end)

    f:Hide()
    setupFrame = f
    return f
end

local function ShowFirstRunSetup()
    local f = CreateSetupFrame()
    f:Show()
end

------------------------------------------------------------
-- Consortium Monthly Quest Tracking
------------------------------------------------------------

local CONSORTIUM_FACTION_ID = 933

-- Quest ID varies by reputation standing with The Consortium
local consortiumQuestsByStanding = {
    [5] = { id = 9886, label = "Friendly" },  -- Friendly
    [6] = { id = 9884, label = "Honored" },   -- Honored
    [7] = { id = 9885, label = "Revered" },   -- Revered
    [8] = { id = 9887, label = "Exalted" },   -- Exalted
}

local allConsortiumQuestIDs = { 9886, 9884, 9885, 9887 }

local consortiumStatusDisplay = {
    available    = { text = "Available",        color = "|cff00ff00" },
    in_progress  = { text = "In Progress",      color = "|cffffff00" },
    ready        = { text = "Ready to Turn In",  color = "|cffff8000" },
    completed    = { text = "Completed",         color = "|cff888888" },
    not_eligible = { text = "Not Eligible",      color = "|cff666666" },
    stale        = { text = "Needs Update",      color = "|cffff5555" },
}

-- Check if a quest has been turned in (works across API versions)
local function IsQuestTurnedIn(questID)
    if C_QuestLog and C_QuestLog.IsQuestFlaggedCompleted then
        return C_QuestLog.IsQuestFlaggedCompleted(questID)
    elseif IsQuestFlaggedCompleted then
        return IsQuestFlaggedCompleted(questID)
    end
    return false
end

local function GetCharacterKey()
    return UnitName("player") .. "-" .. GetRealmName()
end

local function GetCurrentMonth()
    return date("%Y-%m")
end

-- Returns standing ID (5-8) and quest info table, or nil if below Friendly
local function GetConsortiumStanding()
    local name, _, standingID = GetFactionInfoByID(CONSORTIUM_FACTION_ID)
    if not name or not standingID or standingID < 5 then
        return nil, nil
    end
    return standingID, consortiumQuestsByStanding[standingID]
end

-- Determine the current character's Consortium quest status
local function GetConsortiumQuestStatus()
    local standingID, questInfo = GetConsortiumStanding()
    if not standingID or not questInfo then
        return "not_eligible", nil, nil
    end

    local questID = questInfo.id
    local standingLabel = questInfo.label

    -- Check if any consortium quest variant was already turned in this month
    for _, qid in ipairs(allConsortiumQuestIDs) do
        if IsQuestTurnedIn(qid) then
            return "completed", questID, standingLabel
        end
    end

    -- Check if any consortium quest is currently in the quest log
    local numEntries = (C_QuestLog and C_QuestLog.GetNumQuestLogEntries or GetNumQuestLogEntries)()
    for i = 1, (numEntries or 0) do
        local qID, isComplete
        if C_QuestLog and C_QuestLog.GetInfo then
            local info = C_QuestLog.GetInfo(i)
            if info and not info.isHeader and info.questID then
                qID = info.questID
                isComplete = info.isComplete
            end
        else
            local _, _, _, isHeader, _, comp, _, id = GetQuestLogTitle(i)
            if not isHeader then
                qID = id
                isComplete = comp
            end
        end
        if qID then
            for _, cqid in ipairs(allConsortiumQuestIDs) do
                if qID == cqid then
                    return isComplete and "ready" or "in_progress", questID, standingLabel
                end
            end
        end
    end

    return "available", questID, standingLabel
end

-- Save current character's Consortium data to the shared DB
local function UpdateConsortiumData()
    if not DailyReminderDB.consortium then
        DailyReminderDB.consortium = {}
    end

    local key = GetCharacterKey()
    local status, questID, standingLabel = GetConsortiumQuestStatus()
    local _, englishClass = UnitClass("player")
    local level = UnitLevel("player")

    DailyReminderDB.consortium[key] = {
        standing    = standingLabel,
        questID     = questID,
        status      = status,
        lastUpdated = date("%Y-%m-%d"),
        month       = GetCurrentMonth(),
        class       = englishClass,
        level       = level,
    }

    return status, questID, standingLabel
end

------------------------------------------------------------
-- Consortium Status Window
------------------------------------------------------------

local consortiumFrame

local function CreateConsortiumFrame()
    if consortiumFrame then return consortiumFrame end

    local f = CreateFrame("Frame", "DailyReminderConsortiumFrame", UIParent, "BackdropTemplate")
    f:SetSize(540, 300)
    f:SetPoint("CENTER")
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)
    f:SetFrameStrata("DIALOG")

    f:SetBackdrop({
        bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 8, right = 8, top = 8, bottom = 8 },
    })

    -- Title
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -16)
    title:SetText("|cff00ff00Consortium — Monthly Quest Status|r")

    -- Subtitle
    local subtitle = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    subtitle:SetPoint("TOP", title, "BOTTOM", 0, -4)
    subtitle:SetText("Membership Benefits — resets on the 1st of each month")

    -- Close button
    local closeBtn = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    closeBtn:SetPoint("TOPRIGHT", -4, -4)

    -- Column headers
    local headerY = -56
    local colPositions = { 24, 180, 270, 420 }
    local headerTexts  = { "Character", "Standing", "Status", "Last Updated" }
    for idx, text in ipairs(headerTexts) do
        local fs = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        fs:SetPoint("TOPLEFT", colPositions[idx], headerY)
        fs:SetText(text)
    end

    -- Separator line
    local sep = f:CreateTexture(nil, "ARTWORK")
    sep:SetColorTexture(0.5, 0.5, 0.5, 0.5)
    sep:SetSize(496, 1)
    sep:SetPoint("TOPLEFT", 22, headerY - 16)

    f.rows = {}
    f.colPositions = colPositions
    f.contentStartY = headerY - 24

    f:Hide()
    consortiumFrame = f
    return f
end

local function RefreshConsortiumWindow()
    local f = CreateConsortiumFrame()

    -- Clear previous rows
    for _, row in ipairs(f.rows) do
        for _, fs in pairs(row) do
            fs:SetText("")
            fs:Hide()
        end
    end

    -- Update current character's data
    UpdateConsortiumData()

    local data = DailyReminderDB.consortium or {}
    local currentMonth = GetCurrentMonth()
    local y = f.contentStartY
    local rowIndex = 0

    -- Sort characters alphabetically
    local sortedKeys = {}
    for k in pairs(data) do
        table.insert(sortedKeys, k)
    end
    table.sort(sortedKeys)

    for _, charKey in ipairs(sortedKeys) do
        local info = data[charKey]
        rowIndex = rowIndex + 1

        -- Detect stale data from a previous month
        local displayStatus = info.status
        if info.month and info.month ~= currentMonth then
            if info.status ~= "not_eligible" and info.status ~= "available" then
                displayStatus = "stale"
            end
        end

        local statusInfo = consortiumStatusDisplay[displayStatus] or consortiumStatusDisplay.stale

        -- Class-coloured character name (strip realm for display)
        local charName = charKey:match("^(.+)-") or charKey
        local nameDisplay = charName
        if info.class and RAID_CLASS_COLORS and RAID_CLASS_COLORS[info.class] then
            local c = RAID_CLASS_COLORS[info.class]
            nameDisplay = string.format("|cff%02x%02x%02x%s|r",
                c.r * 255, c.g * 255, c.b * 255, charName)
        end

        -- Create or reuse row font strings
        if not f.rows[rowIndex] then
            f.rows[rowIndex] = {}
        end
        local row = f.rows[rowIndex]

        local fields = {
            { key = "name",    text = nameDisplay },
            { key = "standing", text = info.standing or "—" },
            { key = "status",  text = statusInfo.color .. statusInfo.text .. "|r" },
            { key = "updated", text = info.lastUpdated or "—" },
        }
        for colIdx, field in ipairs(fields) do
            if not row[field.key] then
                row[field.key] = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
            end
            row[field.key]:ClearAllPoints()
            row[field.key]:SetPoint("TOPLEFT", f.colPositions[colIdx], y)
            row[field.key]:SetText(field.text)
            row[field.key]:Show()
        end

        y = y - 20
    end

    -- Empty state
    if rowIndex == 0 then
        if not f.rows[1] then f.rows[1] = {} end
        if not f.rows[1].name then
            f.rows[1].name = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        end
        f.rows[1].name:ClearAllPoints()
        f.rows[1].name:SetPoint("TOPLEFT", f.colPositions[1], f.contentStartY)
        f.rows[1].name:SetText("|cff999999No character data yet. Log in to your characters to collect information.|r")
        f.rows[1].name:Show()
        rowIndex = 1
    end

    -- Resize frame to fit content
    f:SetHeight(math.max(180, (-f.contentStartY) + (rowIndex * 20) + 40))
end

ShowConsortiumWindow = function()
    RefreshConsortiumWindow()
    consortiumFrame:Show()
end

------------------------------------------------------------
-- Profession Cooldown Tracking
------------------------------------------------------------

-- Format seconds into human-readable time
local function FormatCooldownTime(seconds)
    if not seconds or seconds <= 0 then return "Ready" end
    local days  = math.floor(seconds / 86400)
    local hours = math.floor((seconds % 86400) / 3600)
    local mins  = math.floor((seconds % 3600) / 60)
    if days > 0 then
        return days .. "d " .. hours .. "h"
    elseif hours > 0 then
        return hours .. "h " .. mins .. "m"
    else
        return mins .. "m"
    end
end

-- Ensure DB tables exist for the current character
local function EnsureProfCDEntry()
    if not DailyReminderDB.professionCDs then
        DailyReminderDB.professionCDs = {}
    end
    local charKey = GetCharacterKey()
    if not DailyReminderDB.professionCDs[charKey] then
        DailyReminderDB.professionCDs[charKey] = {
            class = select(2, UnitClass("player")),
            cooldowns = {},
            knownCooldowns = {},
        }
    end
    local entry = DailyReminderDB.professionCDs[charKey]
    entry.class = select(2, UnitClass("player"))
    entry.lastUpdated = date("%Y-%m-%d %H:%M")
    if not entry.knownCooldowns then entry.knownCooldowns = {} end
    return charKey, entry
end

-- Record a profession cooldown being triggered (spell cast)
local function RecordProfessionCooldown(spellID, cooldownData)
    local charKey, charEntry = EnsureProfCDEntry()
    local readyAt = time() + cooldownData.cd

    -- Mark this recipe as known
    charEntry.knownCooldowns[spellID] = true

    if cooldownData.shared then
        for otherID, otherData in pairs(professionCooldowns) do
            if otherData.shared == cooldownData.shared then
                charEntry.cooldowns[otherID] = {
                    readyAt      = readyAt,
                    castSpellID  = spellID,
                    sharedGroup  = cooldownData.shared,
                }
            end
        end
    else
        charEntry.cooldowns[spellID] = {
            readyAt     = readyAt,
            castSpellID = spellID,
        }
    end

    if professionsFrame and professionsFrame:IsShown() then
        RefreshProfessionsWindow()
    end
end

-- Scan the trade skill window for active cooldowns.
-- Only creates a DB entry if the character actually has at least one
-- tracked cooldown recipe learned (i.e. visible in the trade skill list).
local function ScanTradeSkillCooldowns()
    local numSkills = GetNumTradeSkills()
    if not numSkills or numSkills == 0 then return end

    -- First pass: collect every tracked recipe that the character knows
    local found = {}  -- { index, spellID, cooldownData, cooldownRemaining }
    for i = 1, numSkills do
        local skillName, skillType = GetTradeSkillInfo(i)
        if skillType ~= "header" and skillName then
            local spellID = profCooldownByName[skillName]
            if spellID then
                local cooldown = GetTradeSkillCooldown(i)
                table.insert(found, {
                    spellID      = spellID,
                    cooldownData = professionCooldowns[spellID],
                    remaining    = cooldown,
                })
            end
        end
    end

    -- Nothing relevant in this profession window — don't touch the DB
    if #found == 0 then return end

    -- Character genuinely owns cooldown recipes — now create/update the entry
    local charKey, charEntry = EnsureProfCDEntry()

    for _, entry in ipairs(found) do
        local spellID      = entry.spellID
        local cooldownData = entry.cooldownData
        local cooldown     = entry.remaining

        -- Mark this recipe as known
        charEntry.knownCooldowns[spellID] = true

        if cooldown and cooldown > 0 then
            local readyAt = time() + cooldown
            if cooldownData.shared then
                for otherID, otherData in pairs(professionCooldowns) do
                    if otherData.shared == cooldownData.shared then
                        charEntry.cooldowns[otherID] = {
                            readyAt     = readyAt,
                            castSpellID = spellID,
                            sharedGroup = cooldownData.shared,
                        }
                    end
                end
            else
                charEntry.cooldowns[spellID] = {
                    readyAt     = readyAt,
                    castSpellID = spellID,
                }
            end
        else
            -- Cooldown finished — clear it
            if charEntry.cooldowns[spellID] then
                charEntry.cooldowns[spellID] = nil
            end
        end
    end

    if professionsFrame and professionsFrame:IsShown() then
        RefreshProfessionsWindow()
    end
end

-- Clean expired cooldowns for a character
local function CleanupExpiredCooldowns(charKey)
    local charEntry = DailyReminderDB.professionCDs and DailyReminderDB.professionCDs[charKey]
    if not charEntry or not charEntry.cooldowns then return end

    local now = time()
    local toRemove = {}
    for spellID, cdData in pairs(charEntry.cooldowns) do
        if cdData.readyAt and now >= cdData.readyAt then
            table.insert(toRemove, spellID)
        end
    end
    for _, spellID in ipairs(toRemove) do
        charEntry.cooldowns[spellID] = nil
    end
end

-- Get deduplicated cooldown list for a character (shared groups counted once)
-- Returns ALL known cooldown recipes: on-CD with remaining time, ready with remaining = 0
local function GetCharCooldownSummary(charKey)
    CleanupExpiredCooldowns(charKey)
    local charEntry = DailyReminderDB.professionCDs and DailyReminderDB.professionCDs[charKey]
    if not charEntry then return {} end

    local now = time()
    local results = {}
    local seenShared = {}
    local seenSpell = {}

    -- 1) Active cooldowns
    if charEntry.cooldowns then
        for spellID, cdData in pairs(charEntry.cooldowns) do
            local info = professionCooldowns[spellID]
            if info then
                local key = cdData.sharedGroup or spellID
                if not seenShared[key] then
                    seenShared[key] = true
                    seenSpell[spellID] = true
                    local remaining = cdData.readyAt - now
                    if remaining > 0 then
                        local displayName = info.name
                        if cdData.castSpellID and cdData.castSpellID ~= spellID then
                            local castInfo = professionCooldowns[cdData.castSpellID]
                            if castInfo then displayName = castInfo.name end
                        end
                        table.insert(results, {
                            profession = info.profession,
                            name       = displayName,
                            remaining  = remaining,
                        })
                    end
                end
            end
        end
    end

    -- 2) Known recipes that are NOT on cooldown (ready to use)
    if charEntry.knownCooldowns then
        for spellID in pairs(charEntry.knownCooldowns) do
            local info = professionCooldowns[spellID]
            if info then
                local key = info.shared or spellID
                if not seenShared[key] then
                    seenShared[key] = true
                    table.insert(results, {
                        profession = info.profession,
                        name       = info.name,
                        remaining  = 0,
                    })
                end
            end
        end
    end

    -- Sort by profession, then on-CD first (descending remaining), then ready
    table.sort(results, function(a, b)
        if a.profession ~= b.profession then return a.profession < b.profession end
        return a.remaining > b.remaining
    end)
    return results
end

-- Get count of active (on-cooldown) items for a character
local function GetReadyCooldownCount(charKey)
    local summary = GetCharCooldownSummary(charKey)
    return #summary
end

------------------------------------------------------------
-- Profession Cooldowns Status Window
------------------------------------------------------------

local profCollapsed = {}   -- [charKey] = true/false, session-only
local profFilter = "ALL"   -- "ALL", "ON_CD", "READY"

local PROF_ROW_HEIGHT   = 20
local PROF_MAX_HEIGHT   = 560
local PROF_FRAME_WIDTH  = 560
local PROF_HEADER_Y     = -100  -- column headers Y, below title+subtitle+filter
local PROF_COL_POSITIONS = { 4, 150, 280, 430 }

local function CreateProfessionsFrame()
    if professionsFrame then return professionsFrame end

    local f = CreateFrame("Frame", "DailyReminderProfessionsFrame", UIParent, "BackdropTemplate")
    f:SetSize(PROF_FRAME_WIDTH, 300)
    f:SetPoint("CENTER")
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)
    f:SetFrameStrata("DIALOG")

    f:SetBackdrop({
        bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 8, right = 8, top = 8, bottom = 8 },
    })
    f:SetBackdropColor(0.1, 0.1, 0.1, 0.95)

    -- Title
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -16)
    title:SetText("|cff00ff00Profession Cooldowns|r")

    -- Subtitle
    local subtitle = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    subtitle:SetPoint("TOP", title, "BOTTOM", 0, -4)
    subtitle:SetText("Tailoring cloths, Alchemy transmutes & Leatherworking — all characters")

    -- Close button
    local closeBtn = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    closeBtn:SetPoint("TOPRIGHT", -4, -4)

    -- Filter dropdown (between subtitle and column headers, right-aligned)
    local filterLabel = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    filterLabel:SetPoint("TOPRIGHT", -170, -58)
    filterLabel:SetText("Show:")

    local filterDD = CreateFrame("Frame", "DailyReminderProfFilterDD", f, "UIDropDownMenuTemplate")
    filterDD:SetPoint("LEFT", filterLabel, "RIGHT", -8, -2)
    UIDropDownMenu_SetWidth(filterDD, 100)

    local filterLabels = { ALL = "All", ON_CD = "On Cooldown", READY = "Ready" }
    UIDropDownMenu_SetText(filterDD, filterLabels[profFilter])

    UIDropDownMenu_Initialize(filterDD, function(self, level)
        local options = {
            { key = "ALL",   label = "All" },
            { key = "ON_CD", label = "On Cooldown" },
            { key = "READY", label = "Ready" },
        }
        for _, opt in ipairs(options) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = opt.label
            info.value = opt.key
            info.checked = (profFilter == opt.key)
            info.func = function(btn)
                profFilter = btn.value
                UIDropDownMenu_SetText(filterDD, filterLabels[btn.value])
                CloseDropDownMenus()
                RefreshProfessionsWindow()
            end
            UIDropDownMenu_AddButton(info, level)
        end
    end)

    -- Column headers (inside the scroll area's parent, but above the scroll)
    local headerY = PROF_HEADER_Y
    local headerTexts = { "Character", "Profession", "Cooldown", "Time Left" }
    for idx, text in ipairs(headerTexts) do
        local fs = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        fs:SetPoint("TOPLEFT", PROF_COL_POSITIONS[idx] + 20, headerY)
        fs:SetText(text)
    end

    -- Separator line
    local sep = f:CreateTexture(nil, "ARTWORK")
    sep:SetColorTexture(0.5, 0.5, 0.5, 0.5)
    sep:SetSize(PROF_FRAME_WIDTH - 44, 1)
    sep:SetPoint("TOPLEFT", 22, headerY - 16)

    -- Scroll frame
    local scrollFrame = CreateFrame("ScrollFrame", "DailyReminderProfScroll", f, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 12, headerY - 22)
    scrollFrame:SetPoint("BOTTOMRIGHT", -32, 12)

    local scrollChild = CreateFrame("Frame", "DailyReminderProfScrollChild", scrollFrame)
    scrollChild:SetSize(PROF_FRAME_WIDTH - 50, 1) -- height set dynamically
    scrollFrame:SetScrollChild(scrollChild)

    f.scrollFrame = scrollFrame
    f.scrollChild = scrollChild
    f.rows = {}
    f.toggleBtns = {}

    f:Hide()
    professionsFrame = f
    return f
end

-- Helper: create or reuse a font string in the scroll child
local function GetRowFontString(f, rowIndex, key)
    if not f.rows[rowIndex] then f.rows[rowIndex] = {} end
    if not f.rows[rowIndex][key] then
        f.rows[rowIndex][key] = f.scrollChild:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    end
    return f.rows[rowIndex][key]
end

-- Helper: create or reuse a collapse toggle button (uses +/- textures like the reputation panel)
local function GetToggleButton(f, btnIndex)
    if not f.toggleBtns[btnIndex] then
        local btn = CreateFrame("Button", nil, f.scrollChild)
        btn:SetSize(14, 14)
        local tex = btn:CreateTexture(nil, "ARTWORK")
        tex:SetAllPoints()
        btn.icon = tex
        local hl = btn:CreateTexture(nil, "HIGHLIGHT")
        hl:SetAllPoints()
        hl:SetTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
        hl:SetBlendMode("ADD")
        f.toggleBtns[btnIndex] = btn
    end
    return f.toggleBtns[btnIndex]
end

RefreshProfessionsWindow = function()
    local f = CreateProfessionsFrame()

    -- Hide all previous rows and toggle buttons
    for _, row in ipairs(f.rows) do
        for _, fs in pairs(row) do
            fs:SetText("")
            fs:Hide()
        end
    end
    for _, btn in ipairs(f.toggleBtns) do
        btn:Hide()
    end

    local profData = DailyReminderDB.professionCDs or {}
    local y = 0
    local rowIndex = 0
    local btnIndex = 0

    -- Sort characters alphabetically
    local sortedKeys = {}
    for k in pairs(profData) do
        table.insert(sortedKeys, k)
    end
    table.sort(sortedKeys)

    for _, charKey in ipairs(sortedKeys) do
        local charInfo = profData[charKey]
        local allCooldowns = GetCharCooldownSummary(charKey)

        -- Apply filter
        local cooldowns = {}
        for _, cd in ipairs(allCooldowns) do
            if profFilter == "ALL" then
                table.insert(cooldowns, cd)
            elseif profFilter == "ON_CD" and cd.remaining > 0 then
                table.insert(cooldowns, cd)
            elseif profFilter == "READY" and cd.remaining <= 0 then
                table.insert(cooldowns, cd)
            end
        end

        -- Skip characters with nothing to show after filtering
        if #cooldowns > 0 or profFilter == "ALL" then
            -- Class-coloured character name (strip realm for display)
            local charName = charKey:match("^(.+)-") or charKey
            local nameDisplay = charName
            if charInfo.class and RAID_CLASS_COLORS and RAID_CLASS_COLORS[charInfo.class] then
                local c = RAID_CLASS_COLORS[charInfo.class]
                nameDisplay = string.format("|cff%02x%02x%02x%s|r",
                    c.r * 255, c.g * 255, c.b * 255, charName)
            end

            local isCollapsed = profCollapsed[charKey]

            -- Collapse / expand toggle button
            btnIndex = btnIndex + 1
            local toggleBtn = GetToggleButton(f, btnIndex)
            toggleBtn.icon:SetTexture(isCollapsed
                and "Interface\\Buttons\\UI-PlusButton-UP"
                or  "Interface\\Buttons\\UI-MinusButton-UP")
            toggleBtn:ClearAllPoints()
            toggleBtn:SetPoint("TOPLEFT", f.scrollChild, "TOPLEFT", PROF_COL_POSITIONS[1], y)
            toggleBtn.charKey = charKey
            toggleBtn:SetScript("OnClick", function(self)
                profCollapsed[self.charKey] = not profCollapsed[self.charKey]
                RefreshProfessionsWindow()
            end)
            toggleBtn:Show()

            -- Character name header row
            rowIndex = rowIndex + 1
            local nameFS = GetRowFontString(f, rowIndex, "name")
            nameFS:ClearAllPoints()
            nameFS:SetPoint("TOPLEFT", f.scrollChild, "TOPLEFT", PROF_COL_POSITIONS[1] + 16, y)
            nameFS:SetText(nameDisplay)
            nameFS:Show()

            -- Summary count on the header line
            local onCDCount = 0
            local readyCount = 0
            for _, cd in ipairs(allCooldowns) do
                if cd.remaining > 0 then onCDCount = onCDCount + 1
                else readyCount = readyCount + 1 end
            end
            local summaryFS = GetRowFontString(f, rowIndex, "summary")
            summaryFS:ClearAllPoints()
            summaryFS:SetPoint("TOPLEFT", f.scrollChild, "TOPLEFT", PROF_COL_POSITIONS[3], y)
            local summaryText = ""
            if onCDCount > 0 then
                summaryText = "|cffffff00" .. onCDCount .. " on CD|r"
            end
            if readyCount > 0 then
                if summaryText ~= "" then summaryText = summaryText .. "  " end
                summaryText = summaryText .. "|cff00ff00" .. readyCount .. " ready|r"
            end
            summaryFS:SetText(summaryText)
            summaryFS:Show()

            y = y - PROF_ROW_HEIGHT

            -- Detail rows (only if expanded)
            if not isCollapsed then
                if #cooldowns == 0 and profFilter == "ALL" then
                    -- No known recipes at all — legacy edge case
                    rowIndex = rowIndex + 1
                    local emptyFS = GetRowFontString(f, rowIndex, "name")
                    emptyFS:ClearAllPoints()
                    emptyFS:SetPoint("TOPLEFT", f.scrollChild, "TOPLEFT", PROF_COL_POSITIONS[2], y)
                    emptyFS:SetText("|cff999999No cooldown recipes known|r")
                    emptyFS:Show()
                    y = y - PROF_ROW_HEIGHT
                else
                    for _, cd in ipairs(cooldowns) do
                        rowIndex = rowIndex + 1
                        local shortName = cd.name:gsub("^Transmute: ", "")

                        -- Color remaining time by urgency
                        local remainStr
                        if cd.remaining > 86400 then
                            remainStr = "|cffff8000" .. FormatCooldownTime(cd.remaining) .. "|r"
                        elseif cd.remaining > 3600 then
                            remainStr = "|cffffff00" .. FormatCooldownTime(cd.remaining) .. "|r"
                        else
                            remainStr = "|cff00ff00" .. FormatCooldownTime(cd.remaining) .. "|r"
                        end

                        local fields = {
                            { key = "profession", col = 2, text = cd.profession },
                            { key = "cooldown",   col = 3, text = shortName },
                            { key = "remaining",  col = 4, text = remainStr },
                        }
                        for _, field in ipairs(fields) do
                            local fs = GetRowFontString(f, rowIndex, field.key)
                            fs:ClearAllPoints()
                            fs:SetPoint("TOPLEFT", f.scrollChild, "TOPLEFT", PROF_COL_POSITIONS[field.col], y)
                            fs:SetText(field.text)
                            fs:Show()
                        end
                        y = y - PROF_ROW_HEIGHT
                    end
                end
            end
        end
    end

    -- Empty state
    if rowIndex == 0 then
        rowIndex = 1
        local emptyFS = GetRowFontString(f, rowIndex, "name")
        emptyFS:ClearAllPoints()
        emptyFS:SetPoint("TOPLEFT", f.scrollChild, "TOPLEFT", PROF_COL_POSITIONS[1], 0)
        if profFilter ~= "ALL" then
            emptyFS:SetText("|cff999999No cooldowns match the current filter.|r")
        else
            emptyFS:SetText("|cff999999No cooldown data yet. Open a profession window or craft a cooldown item to start tracking.|r")
        end
        emptyFS:Show()
        y = y - PROF_ROW_HEIGHT
    end

    -- Set scroll child height to total content
    local totalContentHeight = math.abs(y)
    f.scrollChild:SetHeight(math.max(1, totalContentHeight))

    -- Set outer frame height: content area + header area, clamped to max
    local frameHeight = (PROF_HEADER_Y * -1) + 22 + totalContentHeight + 20
    f:SetHeight(math.min(math.max(240, frameHeight), PROF_MAX_HEIGHT))

    -- Hide scrollbar when content fits without scrolling
    local scrollBar = f.scrollFrame.ScrollBar or _G["DailyReminderProfScrollScrollBar"]
    if scrollBar then
        local visibleHeight = f.scrollFrame:GetHeight()
        if totalContentHeight <= visibleHeight then
            scrollBar:Hide()
        else
            scrollBar:Show()
        end
    end
end

ShowProfessionsWindow = function()
    RefreshProfessionsWindow()
    professionsFrame:Show()
end


------------------------------------------------------------
-- Core Check Logic
------------------------------------------------------------

local lastCheck = 0
local THROTTLE_SECONDS = 5

-- Scan the quest log once and return a set of {questID = true} for quests
-- that are complete (objectives done, ready to turn in).
local function GetCompletedQuestIDs()
    local completed = {}
    local numEntries = (C_QuestLog.GetNumQuestLogEntries or GetNumQuestLogEntries)()
    if not numEntries or numEntries == 0 then return completed end

    for i = 1, numEntries do
        -- Try modern retail API first (C_QuestLog.GetInfo returns a table)
        if C_QuestLog.GetInfo then
            local info = C_QuestLog.GetInfo(i)
            if info and not info.isHeader and info.questID and info.isComplete then
                completed[info.questID] = true
            end
        else
            -- Fallback: classic-style GetQuestLogTitle
            local _, _, _, isHeader, _, isComplete, _, questID = GetQuestLogTitle(i)
            if not isHeader and questID and isComplete then
                completed[questID] = true
            end
        end
    end
    return completed
end

RunCheck = function()
    if dismissedThisSession then return end

    local completed = GetCompletedQuestIDs()
    local results = {}

    -- Check each daily table against completed quests (only if enabled)
    local dailyTables = {
        { table = dungeonDailies, category = "Dungeon",                      enabled = DailyReminderDB.checkDungeons },
        { table = heroicDailies,  category = "Heroic",                       enabled = DailyReminderDB.checkHeroics },
        { table = pvpDailies,     category = "PVP",                          enabled = DailyReminderDB.checkPVP },
        { table = ogrilaDailies,  category = "Ogri'la / Sha'tari Skyguard", enabled = DailyReminderDB.checkOgrila },
        { table = cookingDailies, category = "Cooking",                      enabled = DailyReminderDB.checkCooking },
        { table = fishingDailies, category = "Fishing",                      enabled = DailyReminderDB.checkFishing },
    }
    for _, dt in ipairs(dailyTables) do
        if dt.enabled then
            for questID, questName in pairs(dt.table) do
                if completed[questID] then
                    table.insert(results, { category = dt.category, name = questName })
                end
            end
        end
    end

    -- Check Consortium monthly quest (if enabled)
    if DailyReminderDB.checkConsortium then
        local status = UpdateConsortiumData()
        if status == "available" then
            table.insert(results, { category = "Consortium", name = "Membership Benefits (available to pick up)" })
        elseif status == "ready" then
            table.insert(results, { category = "Consortium", name = "Membership Benefits (ready to turn in)" })
        end
    end

    -- Check profession cooldowns (if enabled)
    if DailyReminderDB.checkProfessions then
        local charKey = GetCharacterKey()
        local activeCDs = GetCharCooldownSummary(charKey)
        -- If there is tracked data but zero active cooldowns, all are ready
        local charEntry = DailyReminderDB.professionCDs and DailyReminderDB.professionCDs[charKey]
        if charEntry and charEntry.lastUpdated and #activeCDs == 0 then
            table.insert(results, { category = "Professions", name = "All cooldowns ready" })
        end
    end

    if #results == 0 then return end

    local alertType = DailyReminderDB.alertType

    if alertType == "CHAT" then
        for _, r in ipairs(results) do
            DEFAULT_CHAT_FRAME:AddMessage(
                "|cff00ff00[Daily Reminder]|r " .. r.category .. " quest ready to turn in: |cffffff00" .. r.name .. "|r"
            )
        end

    elseif alertType == "RAID_WARNING" then
        for _, r in ipairs(results) do
            DEFAULT_CHAT_FRAME:AddMessage(
                "|cff00ff00[Daily Reminder]|r " .. r.category .. " quest ready to turn in: |cffffff00" .. r.name .. "|r"
            )
        end
        -- Show first result as on-screen raid warning text
        RaidNotice_AddMessage(RaidWarningFrame,
            results[1].category .. " daily ready: " .. results[1].name,
            ChatTypeInfo["RAID_WARNING"])

    elseif alertType == "POPUP" then
        local lines = {}
        for _, r in ipairs(results) do
            table.insert(lines, "|cffffff00" .. r.category .. ":|r " .. r.name)
        end
        ShowPopup(lines)
    end

    PlayChosenSound()
end

------------------------------------------------------------
-- Settings Panel (integrated into WoW AddOns settings tab)
------------------------------------------------------------

local settingsCategory
local dropdownCounter = 0

-- Helper: create a proper UIDropDownMenu
local function CreateOptionDropdown(parent, labelText, options, dbKey, anchorTo, offsetY)
    dropdownCounter = dropdownCounter + 1

    local label = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    if anchorTo then
        -- Compensate for UIDropDownMenu's -16 left shift when chaining dropdowns
        local xOff = anchorTo:GetObjectType() == "FontString" and 0 or 16
        label:SetPoint("TOPLEFT", anchorTo, "BOTTOMLEFT", xOff, offsetY or -24)
    else
        label:SetPoint("TOPLEFT", 20, offsetY or -20)
    end
    label:SetText(labelText)

    local name = "DailyReminderDropdown" .. dropdownCounter
    local dropdown = CreateFrame("Frame", name, parent, "UIDropDownMenuTemplate")
    dropdown:SetPoint("TOPLEFT", label, "BOTTOMLEFT", -16, -2)

    local function GetLabel(key)
        for _, opt in ipairs(options) do
            if opt.key == key then return opt.label end
        end
        return key
    end

    UIDropDownMenu_SetWidth(dropdown, 180)
    UIDropDownMenu_SetText(dropdown, GetLabel(DailyReminderDB[dbKey]))

    UIDropDownMenu_Initialize(dropdown, function(self, level)
        for _, opt in ipairs(options) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = opt.label
            info.value = opt.key
            info.checked = (DailyReminderDB[dbKey] == opt.key)
            info.func = function(btn)
                DailyReminderDB[dbKey] = btn.value
                UIDropDownMenu_SetText(dropdown, btn.value and GetLabel(btn.value) or opt.label)
                CloseDropDownMenus()
            end
            UIDropDownMenu_AddButton(info, level)
        end
    end)

    return dropdown
end

-- Build the canvas frame that lives inside the WoW settings panel
local function CreateSettingsCanvas()
    local canvas = CreateFrame("Frame", "DailyReminderSettingsCanvas")
    canvas:SetSize(600, 400)
    canvas:Hide()

    -- Title
    local title = canvas:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 20, -20)
    title:SetText("|cff00ff00Daily Reminder|r")

    local subtitle = canvas:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    subtitle:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -4)
    subtitle:SetText("Configure how you are reminded to turn in completed dailies.")

    -- Sound dropdown
    local soundDD = CreateOptionDropdown(canvas, "Sound:", soundOptions, "sound", subtitle, -18)

    -- Alert type dropdown
    local alertDD = CreateOptionDropdown(canvas, "Alert Type:", alertOptions, "alertType", soundDD, -16)

    -- Test Alert button
    local testBtn = CreateFrame("Button", nil, canvas, "UIPanelButtonTemplate")
    testBtn:SetSize(120, 26)
    testBtn:SetPoint("TOPLEFT", alertDD, "BOTTOMLEFT", 16, -20)
    testBtn:SetText("Test Alert")
    testBtn:SetScript("OnClick", function()
        local saved = dismissedThisSession
        dismissedThisSession = false

        local alertType = DailyReminderDB.alertType
        local testEntry = { category = "Heroic", name = "Wanted: Murmur's Whisper" }

        if alertType == "CHAT" then
            DEFAULT_CHAT_FRAME:AddMessage(
                "|cff00ff00[Daily Reminder]|r " .. testEntry.category .. " quest ready to turn in: |cffffff00" .. testEntry.name .. "|r"
            )
        elseif alertType == "RAID_WARNING" then
            DEFAULT_CHAT_FRAME:AddMessage(
                "|cff00ff00[Daily Reminder]|r " .. testEntry.category .. " quest ready to turn in: |cffffff00" .. testEntry.name .. "|r"
            )
            RaidNotice_AddMessage(RaidWarningFrame,
                testEntry.category .. " daily ready: " .. testEntry.name,
                ChatTypeInfo["RAID_WARNING"])
        elseif alertType == "POPUP" then
            ShowPopup({ "|cffffff00" .. testEntry.category .. ":|r " .. testEntry.name })
        end
        PlayChosenSound()

        dismissedThisSession = saved
    end)

    -- Category toggles section
    local catHeader = canvas:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    catHeader:SetPoint("TOPLEFT", testBtn, "BOTTOMLEFT", 0, -24)
    catHeader:SetText("Tracked Categories:")

    local function CreateSettingsCheckbox(parent, labelText, dbKey, anchor, offsetY)
        local cb = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
        cb:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, offsetY or -6)
        cb.text = cb:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        cb.text:SetPoint("LEFT", cb, "RIGHT", 4, 0)
        cb.text:SetText(labelText)
        cb:SetChecked(DailyReminderDB[dbKey])
        cb:SetScript("OnClick", function(self)
            DailyReminderDB[dbKey] = self:GetChecked() and true or false
        end)
        return cb
    end

    local sCb1 = CreateSettingsCheckbox(canvas, "Dungeon Dailies (Normal)",             "checkDungeons", catHeader, -4)
    local sCb2 = CreateSettingsCheckbox(canvas, "Heroic Dungeon Dailies",               "checkHeroics",  sCb1, -2)
    local sCb3 = CreateSettingsCheckbox(canvas, "PVP Dailies (Battlegrounds & World)",  "checkPVP",      sCb2, -2)
    local sCb4 = CreateSettingsCheckbox(canvas, "Ogri'la / Sha'tari Skyguard Dailies",  "checkOgrila",     sCb3, -2)
    local sCb5 = CreateSettingsCheckbox(canvas, "Cooking Dailies",                      "checkCooking",    sCb4, -2)
    local sCb6 = CreateSettingsCheckbox(canvas, "Fishing Dailies",                      "checkFishing",    sCb5, -2)
    local sCb7 = CreateSettingsCheckbox(canvas, "Consortium Monthly Quest",              "checkConsortium", sCb6, -2)
    local sCb8 = CreateSettingsCheckbox(canvas, "Profession Cooldowns",                   "checkProfessions", sCb7, -2)

    return canvas
end

-- Register the settings panel into the official WoW AddOns tab
local function RegisterSettings()
    local canvas = CreateSettingsCanvas()
    settingsCategory = Settings.RegisterCanvasLayoutCategory(canvas, "Daily Reminder")
    settingsCategory.ID = "DailyReminder"
    Settings.RegisterAddOnCategory(settingsCategory)
end

local function OpenSettings()
    if settingsCategory then
        Settings.OpenToCategory(settingsCategory.ID)
    end
end

------------------------------------------------------------
-- Minimap Button
------------------------------------------------------------

local minimapButton

local function UpdateMinimapButtonPosition()
    local angle = math.rad(DailyReminderDB.minimapAngle or defaults.minimapAngle)
    local radius = 80
    minimapButton:ClearAllPoints()
    minimapButton:SetPoint("CENTER", Minimap, "CENTER", math.cos(angle) * radius, math.sin(angle) * radius)
end

local function CreateMinimapButton()
    local btn = CreateFrame("Button", "DailyReminderMinimapButton", Minimap)
    btn:SetSize(32, 32)
    btn:SetFrameStrata("MEDIUM")
    btn:SetFrameLevel(8)
    btn:SetMovable(true)
    btn:SetClampedToScreen(true)

    -- Icon
    local icon = btn:CreateTexture(nil, "ARTWORK")
    icon:SetTexture("Interface\\Icons\\INV_Misc_PocketWatch_01")
    icon:SetSize(20, 20)
    icon:SetPoint("CENTER")

    -- Border overlay (standard minimap button look)
    local border = btn:CreateTexture(nil, "OVERLAY")
    border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    border:SetSize(56, 56)
    border:SetPoint("TOPLEFT")

    -- Highlight
    local highlight = btn:CreateTexture(nil, "HIGHLIGHT")
    highlight:SetTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
    highlight:SetSize(24, 24)
    highlight:SetPoint("CENTER")
    highlight:SetBlendMode("ADD")

    -- Drag to reposition around the minimap ring
    btn:RegisterForDrag("LeftButton")
    btn:SetScript("OnDragStart", function(self)
        self.isDragging = true
        self:SetScript("OnUpdate", function(self)
            local mx, my = Minimap:GetCenter()
            local cx, cy = GetCursorPosition()
            local scale = Minimap:GetEffectiveScale()
            cx, cy = cx / scale, cy / scale
            DailyReminderDB.minimapAngle = math.deg(math.atan2(cy - my, cx - mx))
            UpdateMinimapButtonPosition()
        end)
    end)
    btn:SetScript("OnDragStop", function(self)
        self.isDragging = false
        self:SetScript("OnUpdate", nil)
    end)

    -- Clicks
    btn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    btn:SetScript("OnClick", function(self, button)
        if button == "RightButton" then
            -- Force check
            dismissedThisSession = false
            RunCheck()
        elseif IsShiftKeyDown() then
            ShowConsortiumWindow()
        elseif IsControlKeyDown() then
            ShowProfessionsWindow()
        else
            OpenSettings()
        end
    end)

    -- Tooltip
    btn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:AddLine("|cff00ff00Daily Reminder|r")
        GameTooltip:AddLine("|cffffffffLeft-click:|r Open settings", 1, 1, 1)
        GameTooltip:AddLine("|cffffffffShift-click:|r Consortium status", 1, 1, 1)
        GameTooltip:AddLine("|cffffffffCtrl-click:|r Profession cooldowns", 1, 1, 1)
        GameTooltip:AddLine("|cffffffffRight-click:|r Check dailies now", 1, 1, 1)
        GameTooltip:AddLine("|cffffffffDrag:|r Move this button", 0.7, 0.7, 0.7)
        GameTooltip:Show()
    end)
    btn:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    minimapButton = btn
    UpdateMinimapButtonPosition()
end

------------------------------------------------------------
-- Event Handling (MUST come after Settings & Minimap)
------------------------------------------------------------

local function OnEvent(self, event, arg1, arg2, arg3)
    if event == "ADDON_LOADED" and arg1 == addonName then
        -- Init saved variables
        if not DailyReminderDB then
            DailyReminderDB = {}
        end
        for k, v in pairs(defaults) do
            if DailyReminderDB[k] == nil then
                DailyReminderDB[k] = v
            end
        end
        -- Create minimap button
        CreateMinimapButton()
        if DailyReminderDB.minimapHidden then
            minimapButton:Hide()
        end
        -- Register into WoW addon settings tab
        RegisterSettings()
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[Daily Reminder]|r Loaded. Type |cffffff00/dr|r or open Game Menu > Options > AddOns.")
        -- Show first-run setup if this is a fresh install
        if DailyReminderDB.firstRun then
            C_Timer.After(3, ShowFirstRunSetup)
        end
        self:UnregisterEvent("ADDON_LOADED")
        return
    end

    -- Profession cooldown events (no throttle — must capture every cast)
    if event == "UNIT_SPELLCAST_SUCCEEDED" then
        if DailyReminderDB and DailyReminderDB.checkProfessions and arg1 == "player" then
            local spellID = arg3
            local cooldownData = professionCooldowns[spellID]
            if not cooldownData then
                local spellName = GetSpellInfo(spellID)
                if spellName then
                    local lookupID = profCooldownByName[spellName]
                    if lookupID then
                        spellID = lookupID
                        cooldownData = professionCooldowns[spellID]
                    end
                end
            end
            if cooldownData then
                RecordProfessionCooldown(spellID, cooldownData)
            end
        end
        return
    end

    if event == "TRADE_SKILL_SHOW" then
        if DailyReminderDB and DailyReminderDB.checkProfessions then
            C_Timer.After(0.3, ScanTradeSkillCooldowns)
        end
        return
    end

    -- Throttle (for PLAYER_ENTERING_WORLD / ZONE_CHANGED_NEW_AREA)
    local now = GetTime()
    if now - lastCheck < THROTTLE_SECONDS then return end
    lastCheck = now

    C_Timer.After(2, RunCheck)
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
eventFrame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
eventFrame:RegisterEvent("TRADE_SKILL_SHOW")
eventFrame:SetScript("OnEvent", OnEvent)

------------------------------------------------------------
-- Slash Commands
------------------------------------------------------------

SLASH_DAILYREMINDER1 = "/dr"
SLASH_DAILYREMINDER2 = "/dailyreminder"
SlashCmdList["DAILYREMINDER"] = function(msg)
    local cmd = strlower(strtrim(msg))
    if cmd == "resume" then
        dismissedThisSession = false
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[Daily Reminder]|r Reminders re-enabled for this session.")
    elseif cmd == "check" then
        dismissedThisSession = false
        RunCheck()
    elseif cmd == "minimap" then
        DailyReminderDB.minimapHidden = not DailyReminderDB.minimapHidden
        if DailyReminderDB.minimapHidden then
            minimapButton:Hide()
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[Daily Reminder]|r Minimap button hidden. Type |cffffff00/dr minimap|r to show it again.")
        else
            minimapButton:Show()
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[Daily Reminder]|r Minimap button shown.")
        end
    elseif cmd == "consortium" then
        ShowConsortiumWindow()
    elseif cmd == "professions" then
        ShowProfessionsWindow()
    else
        OpenSettings()
    end
end

