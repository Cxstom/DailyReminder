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

    -- Jewelcrafting (20 hour cooldown)
    [47280] = { name = "Brilliant Glass", cd = 72000, profession = "Jewelcrafting" },

    -- Enchanting (48 hour cooldown)
    [28028] = { name = "Void Sphere", cd = 172800, profession = "Enchanting" },
}

-- Reverse lookup: spell name → spellID
local profCooldownByName = {}
for spellID, data in pairs(professionCooldowns) do
    profCooldownByName[data.name] = spellID
end

-- Deduplicated trackable cooldown list (shared groups collapsed into one entry)
-- Each entry: { key = "primal"|spellID, label = display name, profession = "Alchemy" }
local trackableCooldowns = {}
do
    local seen = {}
    for spellID, data in pairs(professionCooldowns) do
        local key = data.shared or tostring(spellID)
        if not seen[key] then
            seen[key] = true
            local label = data.name
            if data.shared then
                label = "Transmutes (shared CD)"
            end
            table.insert(trackableCooldowns, { key = key, label = label, profession = data.profession })
        end
    end
    table.sort(trackableCooldowns, function(a, b)
        if a.profession ~= b.profession then return a.profession < b.profession end
        return a.label < b.label
    end)
end

-- Per-character cooldown tracking preferences
-- Defaults to true if no preference has been saved yet
local function IsCooldownTracked(charKey, trackKey)
    local prefs = DailyReminderDB and DailyReminderDB.profCDPrefs and DailyReminderDB.profCDPrefs[charKey]
    if not prefs then return true end
    if prefs[trackKey] == nil then return true end
    return prefs[trackKey]
end

local function SetCooldownTracked(charKey, trackKey, enabled)
    if not DailyReminderDB.profCDPrefs then DailyReminderDB.profCDPrefs = {} end
    if not DailyReminderDB.profCDPrefs[charKey] then DailyReminderDB.profCDPrefs[charKey] = {} end
    DailyReminderDB.profCDPrefs[charKey][trackKey] = enabled
end

local function GetTrackKeyForSpell(spellID)
    local data = professionCooldowns[spellID]
    if not data then return nil end
    return data.shared or tostring(spellID)
end

------------------------------------------------------------
-- Defaults & Settings
------------------------------------------------------------

local defaults = {
    -- Quest alert settings
    questSound = "RAID_WARNING",
    questAlertType = "POPUP", -- "CHAT", "RAID_WARNING", "POPUP"
    questTriggerLogin = true,
    questTriggerInstanceLeave = true,
    -- Consortium alert settings
    consortiumSound = "RAID_WARNING",
    consortiumAlertType = "POPUP", -- "CHAT", "RAID_WARNING", "POPUP"
    consortiumReminderDays = 7,
    -- Professions alert settings
    professionsSound = "RAID_WARNING",
    professionsAlertType = "POPUP", -- "CHAT", "RAID_WARNING", "POPUP"
    professionsTriggerLogin = true,
    professionsTriggerInstanceLeave = true,
    -- General
    minimapAngle = 220,
    minimapHidden = false,
    checkQuests = true,
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

-- Session-only dismiss flags (per-category)
local questDismissedThisSession = false
local consortiumDismissedThisSession = false
local professionsDismissedThisSession = false

-- Instance tracking for "leave instance" trigger detection
local wasInInstance = false

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

local function PlayAlertSound(soundKey)
    if not soundKey or soundKey == "NONE" then return end
    local id = soundMap[soundKey]
    if id then
        PlaySound(id)
    end
end

------------------------------------------------------------
-- Reusable Frame Helpers
------------------------------------------------------------

-- Shared backdrop definition for all dark dialog frames (do not modify)
local DARK_DIALOG_BACKDROP = {
    bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true, tileSize = 32, edgeSize = 32,
    insets = { left = 8, right = 8, top = 8, bottom = 8 },
}

-- Create a movable, dark-backdrop dialog frame anchored at top-center
local function CreateDarkDialogFrame(frameName, width, height)
    local f = CreateFrame("Frame", frameName, UIParent, "BackdropTemplate")
    f:SetSize(width, height)
    f:SetPoint("TOP", UIParent, "TOP", 0, -100)
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)
    f:SetFrameStrata("DIALOG")
    f:SetBackdrop(DARK_DIALOG_BACKDROP)
    f:SetBackdropColor(0.1, 0.1, 0.1, 0.95)
    return f
end

------------------------------------------------------------
-- Alert Popup Frames (one per category)
------------------------------------------------------------

local function CreateAlertPopupFrame(frameName, titleText, onDismiss)
    local f = CreateDarkDialogFrame(frameName, 360, 200)

    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -16)
    title:SetText(titleText)

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
        if onDismiss then onDismiss() end
        f:Hide()
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[Daily Reminder]|r Reminders paused for this session. Type |cffffff00/dr resume|r to re-enable.")
    end)

    f:Hide()
    return f
end

-- Factory for category alert popup shower functions
local function CreatePopupShower(frameName, titleText, onDismiss)
    local frame
    return function(lines)
        if not frame then
            frame = CreateAlertPopupFrame(frameName, titleText, onDismiss)
        end
        local text = table.concat(lines, "\n")
        frame.body:SetText(text)
        local textHeight = frame.body:GetStringHeight()
        frame:SetHeight(math.max(140, textHeight + 90))
        frame:Show()
    end
end

local ShowQuestPopup = CreatePopupShower(
    "DailyReminderQuestPopup",
    "|cff00ff00Daily Reminder — Quests|r",
    function() questDismissedThisSession = true end)

local ShowConsortiumAlertPopup = CreatePopupShower(
    "DailyReminderConsortiumAlertPopup",
    "|cff00ff00Daily Reminder — Consortium|r",
    function() consortiumDismissedThisSession = true end)

local ShowProfessionsAlertPopup = CreatePopupShower(
    "DailyReminderProfessionsAlertPopup",
    "|cff00ff00Daily Reminder — Professions|r",
    function() professionsDismissedThisSession = true end)

-- Combined alert popup (used when multiple categories fire POPUP alerts)
local combinedPopupFrame
local combinedSectionPool = {}  -- reusable section UI elements

-- Dismiss lookup: dismissKey → function that sets the session flag
local dismissActions = {
    quests      = function() questDismissedThisSession = true end,
    consortium  = function() consortiumDismissedThisSession = true end,
    professions = function() professionsDismissedThisSession = true end,
}

local function CreateCombinedPopupFrame()
    if combinedPopupFrame then return combinedPopupFrame end

    local f = CreateDarkDialogFrame("DailyReminderCombinedPopup", 380, 200)

    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -16)
    title:SetText("|cff00ff00Daily Reminder|r")
    f.title = title

    -- OK button (close)
    local okBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    okBtn:SetSize(100, 24)
    okBtn:SetPoint("BOTTOM", 0, 14)
    okBtn:SetText("OK")
    okBtn:SetScript("OnClick", function() f:Hide() end)

    -- Content area where sections are placed
    f.contentTop = -40  -- Y offset where first section starts

    f:Hide()
    combinedPopupFrame = f
    return f
end

-- Get or create a section UI element from the pool
local function GetCombinedSection(index)
    if combinedSectionPool[index] then
        return combinedSectionPool[index]
    end

    local f = CreateCombinedPopupFrame()
    local sec = {}

    -- Section header text
    sec.header = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    sec.header:SetJustifyH("LEFT")

    -- Dismiss button (× icon) to the right of the header
    sec.dismissBtn = CreateFrame("Button", nil, f)
    sec.dismissBtn:SetSize(16, 16)
    local dTex = sec.dismissBtn:CreateTexture(nil, "ARTWORK")
    dTex:SetAllPoints()
    dTex:SetTexture("Interface\\Buttons\\UI-StopButton")
    dTex:SetVertexColor(0.7, 0.3, 0.3)
    sec.dismissBtn.icon = dTex
    local dHL = sec.dismissBtn:CreateTexture(nil, "HIGHLIGHT")
    dHL:SetAllPoints()
    dHL:SetTexture("Interface\\Buttons\\UI-StopButton")
    dHL:SetBlendMode("ADD")
    dHL:SetAlpha(0.5)

    -- Tooltip for the dismiss button
    sec.dismissBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("Don't remind this session", 1, 1, 1)
        GameTooltip:Show()
    end)
    sec.dismissBtn:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    -- Body text for the section lines
    sec.body = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    sec.body:SetJustifyH("LEFT")
    sec.body:SetSpacing(2)

    -- Strikethrough overlay (shown when dismissed)
    sec.strikethrough = f:CreateTexture(nil, "ARTWORK")
    sec.strikethrough:SetColorTexture(0.5, 0.5, 0.5, 0.3)
    sec.strikethrough:SetHeight(1)
    sec.strikethrough:Hide()

    sec.dismissed = false
    combinedSectionPool[index] = sec
    return sec
end

local function ShowCombinedPopup(alertGroups)
    local f = CreateCombinedPopupFrame()

    -- Hide all pooled sections first
    for _, sec in ipairs(combinedSectionPool) do
        sec.header:Hide()
        sec.dismissBtn:Hide()
        sec.body:Hide()
        sec.strikethrough:Hide()
        sec.dismissed = false
    end

    local y = f.contentTop
    for idx, group in ipairs(alertGroups) do
        local sec = GetCombinedSection(idx)

        -- Section header
        sec.header:ClearAllPoints()
        sec.header:SetPoint("TOPLEFT", f, "TOPLEFT", 24, y)
        sec.header:SetText("|cffffff00— " .. group.sectionTitle .. " —|r")
        sec.header:SetAlpha(1)
        sec.header:Show()

        -- Dismiss button anchored to the right of the header
        sec.dismissBtn:ClearAllPoints()
        sec.dismissBtn:SetPoint("LEFT", sec.header, "RIGHT", 6, 0)
        sec.dismissBtn.icon:SetVertexColor(0.7, 0.3, 0.3)
        sec.dismissBtn.icon:SetDesaturated(false)
        sec.dismissBtn:Enable()
        sec.dismissBtn:Show()
        sec.dismissed = false

        -- Body lines
        local text = table.concat(group.lines, "\n")
        sec.body:ClearAllPoints()
        sec.body:SetPoint("TOPLEFT", f, "TOPLEFT", 30, y - 18)
        sec.body:SetPoint("RIGHT", f, "RIGHT", -24, 0)
        sec.body:SetText(text)
        sec.body:SetAlpha(1)
        sec.body:Show()

        -- Strikethrough (hidden by default, shown on dismiss)
        sec.strikethrough:ClearAllPoints()
        sec.strikethrough:SetPoint("TOPLEFT", sec.header, "LEFT", -2, 0)
        sec.strikethrough:SetPoint("RIGHT", f, "RIGHT", -24, 0)
        sec.strikethrough:Hide()

        -- Dismiss click handler
        local capturedDismissKey = group.dismissKey
        local capturedSec = sec
        sec.dismissBtn:SetScript("OnClick", function()
            if capturedSec.dismissed then return end
            capturedSec.dismissed = true
            -- Fire the dismiss action
            if capturedDismissKey and dismissActions[capturedDismissKey] then
                dismissActions[capturedDismissKey]()
            end
            -- Visual feedback: dim the section and show strikethrough
            capturedSec.header:SetAlpha(0.35)
            capturedSec.body:SetAlpha(0.35)
            capturedSec.dismissBtn.icon:SetVertexColor(0.3, 0.3, 0.3)
            capturedSec.dismissBtn.icon:SetDesaturated(true)
            capturedSec.dismissBtn:Disable()
            capturedSec.strikethrough:Show()
            DEFAULT_CHAT_FRAME:AddMessage(
                "|cff00ff00[Daily Reminder]|r " .. group.sectionTitle .. " reminders paused for this session. Type |cffffff00/dr resume|r to re-enable.")
        end)

        local bodyHeight = sec.body:GetStringHeight() or 14
        y = y - 18 - bodyHeight - 12  -- header + body + gap
    end

    -- Resize frame to fit content + OK button
    f:SetHeight(math.max(160, math.abs(y) + 50))
    f:Show()
end

-- Pending popup alert queue (batches multiple popups into one combined window)
local pendingPopupAlerts = {}
local pendingFlushScheduled = false

local function FlushPendingAlerts()
    pendingFlushScheduled = false
    if #pendingPopupAlerts == 0 then return end

    if #pendingPopupAlerts == 1 then
        -- Single alert: show individual popup as before
        local alert = pendingPopupAlerts[1]
        alert.showPopupFn(alert.lines)
        PlayAlertSound(alert.soundKey)
    else
        -- Multiple alerts: show combined popup
        local alertGroups = {}
        for _, alert in ipairs(pendingPopupAlerts) do
            table.insert(alertGroups, {
                sectionTitle = alert.sectionTitle,
                lines = alert.lines,
                dismissKey = alert.dismissKey,
            })
        end
        ShowCombinedPopup(alertGroups)
        -- Play the first non-NONE sound
        for _, alert in ipairs(pendingPopupAlerts) do
            if alert.soundKey and alert.soundKey ~= "NONE" then
                PlayAlertSound(alert.soundKey)
                break
            end
        end
    end

    wipe(pendingPopupAlerts)
end

-- Schedule a single flush 2.5 seconds after the FIRST queued popup.
-- The window is wide enough to capture all staggered checks
-- (login fires at 2s/3s/4s, manual at 0s/0.5s/1s).
-- Subsequent queue entries within the window are simply collected
-- without resetting the timer.
local function SchedulePopupFlush()
    if not pendingFlushScheduled then
        pendingFlushScheduled = true
        C_Timer.After(2.5, FlushPendingAlerts)
    end
end

------------------------------------------------------------
-- Utility
------------------------------------------------------------

local function GetCharacterKey()
    return UnitName("player") .. "-" .. GetRealmName()
end

-- Class-coloured character name (strip realm for display)
local function GetClassColoredName(charKey, className)
    local charName = charKey:match("^(.+)-") or charKey
    if className and RAID_CLASS_COLORS and RAID_CLASS_COLORS[className] then
        local c = RAID_CLASS_COLORS[className]
        return string.format("|cff%02x%02x%02x%s|r", c.r * 255, c.g * 255, c.b * 255, charName)
    end
    return charName
end

-- Collect and sort keys from a table alphabetically
local function GetSortedKeys(tbl)
    local keys = {}
    for k in pairs(tbl) do
        table.insert(keys, k)
    end
    table.sort(keys)
    return keys
end

-- Reset all session dismiss flags
local function ResetAllDismissFlags()
    questDismissedThisSession = false
    consortiumDismissedThisSession = false
    professionsDismissedThisSession = false
end

-- Forward declarations (defined later, referenced in callbacks above their definition)
local RunQuestCheck
local RunConsortiumCheck
local RunProfessionsCheck
local ShowConsortiumWindow
local ShowProfessionsWindow
local RefreshProfessionsWindow
local professionsFrame

-- Run all checks with standard staggered timing (immediate / 0.5s / 1s)
local function RunAllChecksStaggered()
    RunQuestCheck()
    C_Timer.After(0.5, RunConsortiumCheck)
    C_Timer.After(1, RunProfessionsCheck)
end

------------------------------------------------------------
-- First-Run Setup Popup
------------------------------------------------------------

local setupFrame

local function CreateSetupFrame()
    if setupFrame then return setupFrame end

    local f = CreateDarkDialogFrame("DailyReminderSetupPopup", 380, 270)

    -- Title
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOP", 0, -16)
    title:SetText("|cff00ff00Daily Reminder — First Time Setup|r")

    -- Description
    local desc = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    desc:SetPoint("TOP", title, "BOTTOM", 0, -6)
    desc:SetPoint("LEFT", 20, 0)
    desc:SetPoint("RIGHT", -20, 0)
    desc:SetJustifyH("LEFT")
    desc:SetText("Welcome! Choose which categories you want to track.\nYou can change these later in the addon settings.")

    -- Helpers (smaller fonts for compact wizard)
    local checkboxes = {}
    local function CreateSetupCheckbox(parent, labelText, dbKey, anchor, offsetY, fontObj)
        local cb = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
        cb:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, offsetY or -2)
        cb:SetSize(22, 22)
        cb.text = cb:CreateFontString(nil, "OVERLAY", fontObj or "GameFontHighlightSmall")
        cb.text:SetPoint("LEFT", cb, "RIGHT", 2, 0)
        cb.text:SetText(labelText)
        cb:SetChecked(DailyReminderDB[dbKey])
        cb.dbKey = dbKey
        table.insert(checkboxes, cb)
        return cb
    end

    local function CreateSectionHeader(parent, text, anchor, offsetY)
        local header = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        header:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, offsetY or -12)
        header:SetText("|cffffff00" .. text .. "|r")

        local sep = parent:CreateTexture(nil, "ARTWORK")
        sep:SetColorTexture(0.5, 0.5, 0.5, 0.5)
        sep:SetSize(330, 1)
        sep:SetPoint("TOPLEFT", header, "BOTTOMLEFT", 0, -2)

        return sep
    end

    -- === Section 1: Quests ===
    local sec1 = CreateSectionHeader(f, "Quests", desc, -10)
    local cbMasterQ = CreateSetupCheckbox(f, "Enable quest turn-in tracking", "checkQuests", sec1, -2, "GameFontNormalSmall")

    -- Collapse toggle for quest sub-categories
    local questSubsCollapsed = true
    local questSubsContainer = CreateFrame("Frame", nil, f)
    questSubsContainer:SetPoint("TOPLEFT", cbMasterQ, "BOTTOMLEFT", 16, 0)
    questSubsContainer:SetSize(300, 1)
    questSubsContainer:Hide()

    -- Anchor inside the container
    local subAnchor = questSubsContainer:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    subAnchor:SetPoint("TOPLEFT", 0, 0)
    subAnchor:SetText("")
    subAnchor:SetHeight(1)

    local cb1 = CreateSetupCheckbox(questSubsContainer, "Dungeons (Normal)",           "checkDungeons", subAnchor, -2)
    local cb2 = CreateSetupCheckbox(questSubsContainer, "Heroics",                     "checkHeroics",  cb1, -1)
    local cb3 = CreateSetupCheckbox(questSubsContainer, "PVP (Battlegrounds & World)", "checkPVP",      cb2, -1)
    local cb4 = CreateSetupCheckbox(questSubsContainer, "Ogri'la / Sha'tari Skyguard", "checkOgrila",   cb3, -1)
    local cb5 = CreateSetupCheckbox(questSubsContainer, "Cooking",                     "checkCooking",  cb4, -1)
    local cb6 = CreateSetupCheckbox(questSubsContainer, "Fishing",                     "checkFishing",  cb5, -1)

    local questSubsHeight = 6 * 23  -- 6 checkboxes × ~23px each

    -- Toggle button (+/-)
    local toggleBtn = CreateFrame("Button", nil, f)
    toggleBtn:SetSize(16, 16)
    toggleBtn:SetPoint("LEFT", cbMasterQ.text, "RIGHT", 6, 0)
    local toggleIcon = toggleBtn:CreateTexture(nil, "ARTWORK")
    toggleIcon:SetAllPoints()
    toggleIcon:SetTexture("Interface\\Buttons\\UI-PlusButton-UP")
    local toggleHL = toggleBtn:CreateTexture(nil, "HIGHLIGHT")
    toggleHL:SetAllPoints()
    toggleHL:SetTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
    toggleHL:SetBlendMode("ADD")

    -- Spacer below the master checkbox — its height changes based on collapse state
    local questSpacer = CreateFrame("Frame", nil, f)
    questSpacer:SetPoint("TOPLEFT", cbMasterQ, "BOTTOMLEFT", 0, 0)
    questSpacer:SetSize(1, 1)

    -- Forward-declare professions collapse state for shared height updater
    local profSubsCollapsed = true
    local profSubsHeight = #trackableCooldowns * 23
    local profSpacer  -- assigned later

    -- Shared height updater (accounts for both collapsible sections)
    local function UpdateSetupFrameHeight()
        local baseHeight = 270
        local questExtra = questSubsCollapsed and 0 or questSubsHeight
        local profExtra = profSubsCollapsed and 0 or profSubsHeight
        f:SetHeight(baseHeight + questExtra + profExtra)
    end

    local function UpdateQuestCollapse()
        if questSubsCollapsed then
            questSubsContainer:Hide()
            questSpacer:SetHeight(1)
            toggleIcon:SetTexture("Interface\\Buttons\\UI-PlusButton-UP")
        else
            questSubsContainer:Show()
            questSpacer:SetHeight(questSubsHeight)
            toggleIcon:SetTexture("Interface\\Buttons\\UI-MinusButton-UP")
        end
        UpdateSetupFrameHeight()
    end

    toggleBtn:SetScript("OnClick", function()
        questSubsCollapsed = not questSubsCollapsed
        UpdateQuestCollapse()
    end)

    -- Visual enable/disable for quest sub-checkboxes
    local questSetupSubs = { cb1, cb2, cb3, cb4, cb5, cb6 }
    local function UpdateSetupQuestSubs()
        local on = cbMasterQ:GetChecked()
        for _, cb in ipairs(questSetupSubs) do
            if on then cb:Enable(); cb.text:SetTextColor(0.8, 0.8, 0.8)
            else       cb:Disable(); cb.text:SetTextColor(0.4, 0.4, 0.4) end
        end
    end
    cbMasterQ:HookScript("OnClick", UpdateSetupQuestSubs)
    UpdateSetupQuestSubs()
    UpdateQuestCollapse()

    -- === Section 2: Consortium ===
    local sec2 = CreateSectionHeader(f, "Consortium", questSpacer, -10)
    local cb7 = CreateSetupCheckbox(f, "Monthly Quest",    "checkConsortium",  sec2, -2, "GameFontNormalSmall")

    -- === Section 3: Professions ===
    local sec3 = CreateSectionHeader(f, "Professions", cb7, -10)
    local cb8 = CreateSetupCheckbox(f, "Cooldown Tracking", "checkProfessions", sec3, -2, "GameFontNormalSmall")

    -- Collapse toggle for profession cooldown sub-categories
    local profSubsContainer = CreateFrame("Frame", nil, f)
    profSubsContainer:SetPoint("TOPLEFT", cb8, "BOTTOMLEFT", 16, 0)
    profSubsContainer:SetSize(300, 1)
    profSubsContainer:Hide()

    local profSubAnchor = profSubsContainer:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    profSubAnchor:SetPoint("TOPLEFT", 0, 0)
    profSubAnchor:SetText("")
    profSubAnchor:SetHeight(1)

    local profCDCheckboxes = {}
    local lastProfAnchor = profSubAnchor
    for _, tc in ipairs(trackableCooldowns) do
        local pcb = CreateFrame("CheckButton", nil, profSubsContainer, "UICheckButtonTemplate")
        pcb:SetPoint("TOPLEFT", lastProfAnchor, "BOTTOMLEFT", 0, -2)
        pcb:SetSize(22, 22)
        pcb.text = pcb:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        pcb.text:SetPoint("LEFT", pcb, "RIGHT", 2, 0)
        pcb.text:SetText(tc.label .. "  |cff888888(" .. tc.profession .. ")|r")
        pcb:SetChecked(true) -- default: track all cooldowns
        pcb.trackKey = tc.key
        table.insert(profCDCheckboxes, pcb)
        lastProfAnchor = pcb
    end

    -- Toggle button (+/-) for professions sub-categories
    local profToggleBtn = CreateFrame("Button", nil, f)
    profToggleBtn:SetSize(16, 16)
    profToggleBtn:SetPoint("LEFT", cb8.text, "RIGHT", 6, 0)
    local profToggleIcon = profToggleBtn:CreateTexture(nil, "ARTWORK")
    profToggleIcon:SetAllPoints()
    profToggleIcon:SetTexture("Interface\\Buttons\\UI-PlusButton-UP")
    local profToggleHL = profToggleBtn:CreateTexture(nil, "HIGHLIGHT")
    profToggleHL:SetAllPoints()
    profToggleHL:SetTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
    profToggleHL:SetBlendMode("ADD")

    -- Spacer below professions master checkbox
    profSpacer = CreateFrame("Frame", nil, f)
    profSpacer:SetPoint("TOPLEFT", cb8, "BOTTOMLEFT", 0, 0)
    profSpacer:SetSize(1, 1)

    local function UpdateProfCollapse()
        if profSubsCollapsed then
            profSubsContainer:Hide()
            profSpacer:SetHeight(1)
            profToggleIcon:SetTexture("Interface\\Buttons\\UI-PlusButton-UP")
        else
            profSubsContainer:Show()
            profSpacer:SetHeight(profSubsHeight)
            profToggleIcon:SetTexture("Interface\\Buttons\\UI-MinusButton-UP")
        end
        UpdateSetupFrameHeight()
    end

    profToggleBtn:SetScript("OnClick", function()
        profSubsCollapsed = not profSubsCollapsed
        UpdateProfCollapse()
    end)

    -- Visual enable/disable for profession sub-checkboxes
    local function UpdateSetupProfSubs()
        local on = cb8:GetChecked()
        for _, pcb in ipairs(profCDCheckboxes) do
            if on then pcb:Enable(); pcb.text:SetTextColor(0.8, 0.8, 0.8)
            else       pcb:Disable(); pcb.text:SetTextColor(0.4, 0.4, 0.4) end
        end
    end
    cb8:HookScript("OnClick", UpdateSetupProfSubs)
    UpdateSetupProfSubs()
    UpdateProfCollapse()

    -- Save button
    local saveBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    saveBtn:SetSize(140, 24)
    saveBtn:SetPoint("BOTTOM", 0, 16)
    saveBtn:SetText("Save & Continue")
    saveBtn:SetScript("OnClick", function()
        for _, cb in ipairs(checkboxes) do
            DailyReminderDB[cb.dbKey] = cb:GetChecked() and true or false
        end
        -- Save per-character cooldown preferences from the wizard
        local charKey = GetCharacterKey()
        if not DailyReminderDB.profCDPrefs then DailyReminderDB.profCDPrefs = {} end
        if not DailyReminderDB.profCDPrefs[charKey] then DailyReminderDB.profCDPrefs[charKey] = {} end
        for _, pcb in ipairs(profCDCheckboxes) do
            DailyReminderDB.profCDPrefs[charKey][pcb.trackKey] = pcb:GetChecked() and true or false
        end
        DailyReminderDB.firstRun = false
        f:Hide()
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[Daily Reminder]|r Setup complete! Use |cffffff00/dr|r to adjust settings anytime.")
        -- Run initial check after setup
        C_Timer.After(2, RunQuestCheck)
        C_Timer.After(4, RunConsortiumCheck)
        C_Timer.After(3, RunProfessionsCheck)
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

-- Calculate days remaining until the end of the current month
local function GetDaysRemainingInMonth()
    local t = date("*t")
    local lastDay = date("*t", time({ year = t.year, month = t.month + 1, day = 0 }))
    return lastDay.day - t.day
end

------------------------------------------------------------
-- Consortium Status Window
------------------------------------------------------------

local consortiumFrame

local function CreateConsortiumFrame()
    if consortiumFrame then return consortiumFrame end

    local f = CreateDarkDialogFrame("DailyReminderConsortiumFrame", 540, 300)

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
    local sortedKeys = GetSortedKeys(data)

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
        local nameDisplay = GetClassColoredName(charKey, info.class)

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

-- Write cooldown data for a spell, handling shared-group propagation
local function WriteCooldownData(charEntry, spellID, cooldownData, readyAt)
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
end

-- Record a profession cooldown being triggered (spell cast)
local function RecordProfessionCooldown(spellID, cooldownData)
    local charKey, charEntry = EnsureProfCDEntry()
    local readyAt = time() + cooldownData.cd

    -- Mark this recipe as known
    charEntry.knownCooldowns[spellID] = true

    WriteCooldownData(charEntry, spellID, cooldownData, readyAt)

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
            WriteCooldownData(charEntry, spellID, cooldownData, time() + cooldown)
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
                    local trackKey = info.shared or tostring(spellID)
                    if IsCooldownTracked(charKey, trackKey) then
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
    end

    -- 2) Known recipes that are NOT on cooldown (ready to use)
    if charEntry.knownCooldowns then
        for spellID in pairs(charEntry.knownCooldowns) do
            local info = professionCooldowns[spellID]
            if info then
                local key = info.shared or spellID
                if not seenShared[key] then
                    seenShared[key] = true
                    local trackKey = info.shared or tostring(spellID)
                    if IsCooldownTracked(charKey, trackKey) then
                        table.insert(results, {
                            profession = info.profession,
                            name       = info.name,
                            remaining  = 0,
                        })
                    end
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

    local f = CreateDarkDialogFrame("DailyReminderProfessionsFrame", PROF_FRAME_WIDTH, 300)

    -- Title
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -16)
    title:SetText("|cff00ff00Profession Cooldowns|r")

    -- Subtitle
    local subtitle = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    subtitle:SetPoint("TOP", title, "BOTTOM", 0, -4)
    subtitle:SetText("Tailoring, Alchemy, Leatherworking, Jewelcrafting & Enchanting — all characters")

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
    local sortedKeys = GetSortedKeys(profData)

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
            local nameDisplay = GetClassColoredName(charKey, charInfo.class)

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

local lastQuestCheck = 0
local lastConsortiumCheck = 0
local lastProfessionsCheck = 0
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

-- Generic alert dispatch: fires sound and the chosen alert type
-- For POPUP alerts, results are queued and batched — if multiple categories
-- fire POPUP alerts close together they are shown in a single combined window.
local function FireAlert(results, soundKey, alertType, showPopupFn, sectionTitle, dismissKey)
    if #results == 0 then return end

    if alertType == "CHAT" then
        for _, r in ipairs(results) do
            local prefix = (r.category ~= "") and (r.category .. ": ") or ""
            DEFAULT_CHAT_FRAME:AddMessage(
                "|cff00ff00[Daily Reminder]|r " .. prefix .. "|cffffff00" .. r.name .. "|r"
            )
        end
        PlayAlertSound(soundKey)

    elseif alertType == "RAID_WARNING" then
        for _, r in ipairs(results) do
            local prefix = (r.category ~= "") and (r.category .. ": ") or ""
            DEFAULT_CHAT_FRAME:AddMessage(
                "|cff00ff00[Daily Reminder]|r " .. prefix .. "|cffffff00" .. r.name .. "|r"
            )
        end
        -- Show first result as on-screen raid warning text
        local rwPrefix = (results[1].category ~= "") and (results[1].category .. ": ") or ""
        RaidNotice_AddMessage(RaidWarningFrame,
            rwPrefix .. results[1].name,
            ChatTypeInfo["RAID_WARNING"])
        PlayAlertSound(soundKey)

    elseif alertType == "POPUP" then
        local lines = {}
        for _, r in ipairs(results) do
            if r.category ~= "" then
                table.insert(lines, "|cffffff00" .. r.category .. ":|r " .. r.name)
            else
                table.insert(lines, r.name)
            end
        end
        -- Queue for batched display — flush timer resets each time a new
        -- alert is queued so closely-spaced popups merge into one window.
        table.insert(pendingPopupAlerts, {
            sectionTitle = sectionTitle or "Alert",
            lines        = lines,
            soundKey     = soundKey,
            showPopupFn  = showPopupFn,
            dismissKey   = dismissKey,
        })
        SchedulePopupFlush()
    end
end

-- Quest + Profession check (uses quest alert settings)
RunQuestCheck = function()
    if questDismissedThisSession then return end
    if not DailyReminderDB.checkQuests then return end

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

    if #results == 0 then return end
    FireAlert(results, DailyReminderDB.questSound, DailyReminderDB.questAlertType, ShowQuestPopup, "Quests", "quests")
end

-- Consortium check (uses consortium alert settings, respects reminder-days threshold)
RunConsortiumCheck = function()
    if consortiumDismissedThisSession then return end
    if not DailyReminderDB.checkConsortium then return end

    -- Only alert when we are within the configured reminder window
    local daysRemaining = GetDaysRemainingInMonth()
    if daysRemaining > (DailyReminderDB.consortiumReminderDays or 7) then return end

    local status = UpdateConsortiumData()
    local results = {}

    if status == "available" then
        table.insert(results, { category = "", name = "Available to pick up" })
    elseif status == "ready" then
        table.insert(results, { category = "", name = "Ready to turn in" })
    end

    if #results == 0 then return end

    -- Append days-remaining info
    results[1].name = results[1].name .. "  |cffaaaaaa(" .. daysRemaining .. " days left this month)|r"

    FireAlert(results, DailyReminderDB.consortiumSound, DailyReminderDB.consortiumAlertType, ShowConsortiumAlertPopup, "Consortium", "consortium")
end

-- Profession cooldown check (uses professions alert settings)
RunProfessionsCheck = function()
    if professionsDismissedThisSession then return end
    if not DailyReminderDB.checkProfessions then return end

    local charKey = GetCharacterKey()
    local activeCDs = GetCharCooldownSummary(charKey)
    local charEntry = DailyReminderDB.professionCDs and DailyReminderDB.professionCDs[charKey]

    if not charEntry or not charEntry.lastUpdated then return end

    -- Don't alert if no cooldowns are being tracked for this character
    local hasAnyTracked = false
    for _, tc in ipairs(trackableCooldowns) do
        if IsCooldownTracked(charKey, tc.key) then
            hasAnyTracked = true
            break
        end
    end
    if not hasAnyTracked then return end

    if #activeCDs > 0 then return end  -- still has active cooldowns

    local results = { { category = "Professions", name = "All cooldowns ready" } }
    FireAlert(results, DailyReminderDB.professionsSound, DailyReminderDB.professionsAlertType, ShowProfessionsAlertPopup, "Professions", "professions")
end

------------------------------------------------------------
-- Settings Panel (integrated into WoW AddOns settings tab)
------------------------------------------------------------

local settingsCategory
local dropdownCounter = 0

-- Build the canvas frame that lives inside the WoW settings panel
local function CreateSettingsCanvas()
    local canvas = CreateFrame("Frame", "DailyReminderSettingsCanvas")
    canvas:SetSize(620, 500)
    canvas:Hide()

    -- Title
    local title = canvas:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 20, -20)
    title:SetText("|cff00ff00Daily Reminder|r")

    local subtitle = canvas:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    subtitle:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -4)
    subtitle:SetText("Configure tracking, alerts and notifications.")

    ------------------------------------------------------------------
    -- Tab infrastructure (scrollable tabs)
    ------------------------------------------------------------------
    local tabScrolls = {}   -- scroll frames (shown / hidden)
    local tabChildren = {}  -- scroll children (widgets go here)
    local tabButtons = {}
    local NUM_TABS = 3

    local function SelectTab(index)
        for i, sf in ipairs(tabScrolls) do sf:Hide() end
        tabScrolls[index]:Show()
        PanelTemplates_SetTab(canvas, index)
    end

    canvas.numTabs = NUM_TABS
    local tabNames = { "Quests", "Consortium", "Professions" }
    for i, name in ipairs(tabNames) do
        local tab = CreateFrame("Button", "DailyReminderSettingsCanvasTab" .. i, canvas, "CharacterFrameTabButtonTemplate")
        tab:SetText(name)
        tab:SetID(i)

        if i == 1 then
            tab:SetPoint("TOPLEFT", subtitle, "BOTTOMLEFT", -4, -16)
        else
            tab:SetPoint("LEFT", tabButtons[i - 1], "RIGHT", -16, 0)
        end

        tab:SetScript("OnClick", function() SelectTab(i) end)
        PanelTemplates_TabResize(tab, 0)
        tabButtons[i] = tab

        -- Scroll frame for this tab
        local sf = CreateFrame("ScrollFrame", "DRSettingsScroll" .. i, canvas, "UIPanelScrollFrameTemplate")
        sf:SetPoint("TOPLEFT", tabButtons[1], "BOTTOMLEFT", 0, -12)
        sf:SetPoint("BOTTOMRIGHT", canvas, "BOTTOMRIGHT", -26, 10)
        sf:Hide()

        local child = CreateFrame("Frame", nil, sf)
        child:SetWidth(560)
        child:SetHeight(1) -- set later per-tab
        sf:SetScrollChild(child)

        tabScrolls[i] = sf
        tabChildren[i] = child
    end

    PanelTemplates_SetNumTabs(canvas, NUM_TABS)
    PanelTemplates_SetTab(canvas, 1)
    tabScrolls[1]:Show()

    -- Auto-hide scrollbar when content fits
    local function FinalizeTab(tabIndex, contentHeight)
        tabChildren[tabIndex]:SetHeight(contentHeight)
        local bar = tabScrolls[tabIndex].ScrollBar or _G["DRSettingsScroll" .. tabIndex .. "ScrollBar"]
        tabScrolls[tabIndex]:SetScript("OnShow", function(self)
            if bar then
                if contentHeight <= self:GetHeight() then bar:Hide() else bar:Show() end
            end
        end)
        -- Run once immediately for the initially-visible tab
        if tabIndex == 1 and bar then
            C_Timer.After(0, function()
                if tabScrolls[1]:IsShown() and contentHeight <= tabScrolls[1]:GetHeight() then bar:Hide() end
            end)
        end
    end

    ------------------------------------------------------------------
    -- Shared helpers
    ------------------------------------------------------------------
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

    local function CreateSectionSep(parent, anchor, offsetY)
        local sep = parent:CreateTexture(nil, "ARTWORK")
        sep:SetColorTexture(0.4, 0.4, 0.4, 0.4)
        sep:SetSize(520, 1)
        sep:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, offsetY or -12)
        return sep
    end

    -- Compact horizontal alert row: [Sound dropdown] [Alert Type dropdown] [Test Alert]
    -- Returns an anchor frame whose BOTTOMLEFT marks the bottom of the row (~56 px tall)
    local function CreateAlertRow(parent, soundDbKey, alertDbKey, testClickFn, anchor, offsetY)
        -- Sound label + dropdown (left)
        local soundLabel = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        soundLabel:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, offsetY or -10)
        soundLabel:SetText("Sound:")

        dropdownCounter = dropdownCounter + 1
        local soundDD = CreateFrame("Frame", "DailyReminderDropdown" .. dropdownCounter, parent, "UIDropDownMenuTemplate")
        soundDD:SetPoint("TOPLEFT", soundLabel, "BOTTOMLEFT", -16, -2)
        UIDropDownMenu_SetWidth(soundDD, 120)

        local function GetSoundLabel(key)
            for _, o in ipairs(soundOptions) do if o.key == key then return o.label end end
            return key
        end
        UIDropDownMenu_SetText(soundDD, GetSoundLabel(DailyReminderDB[soundDbKey]))
        UIDropDownMenu_Initialize(soundDD, function(_, level)
            for _, opt in ipairs(soundOptions) do
                local info = UIDropDownMenu_CreateInfo()
                info.text = opt.label; info.value = opt.key
                info.checked = (DailyReminderDB[soundDbKey] == opt.key)
                info.func = function(btn)
                    DailyReminderDB[soundDbKey] = btn.value
                    UIDropDownMenu_SetText(soundDD, GetSoundLabel(btn.value))
                    CloseDropDownMenus()
                end
                UIDropDownMenu_AddButton(info, level)
            end
        end)

        -- Alert Type label + dropdown (middle)
        local alertLabel = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        alertLabel:SetPoint("TOPLEFT", soundLabel, "TOPLEFT", 190, 0)
        alertLabel:SetText("Alert Type:")

        dropdownCounter = dropdownCounter + 1
        local alertDD = CreateFrame("Frame", "DailyReminderDropdown" .. dropdownCounter, parent, "UIDropDownMenuTemplate")
        alertDD:SetPoint("TOPLEFT", alertLabel, "BOTTOMLEFT", -16, -2)
        UIDropDownMenu_SetWidth(alertDD, 120)

        local function GetAlertLabel(key)
            for _, o in ipairs(alertOptions) do if o.key == key then return o.label end end
            return key
        end
        UIDropDownMenu_SetText(alertDD, GetAlertLabel(DailyReminderDB[alertDbKey]))
        UIDropDownMenu_Initialize(alertDD, function(_, level)
            for _, opt in ipairs(alertOptions) do
                local info = UIDropDownMenu_CreateInfo()
                info.text = opt.label; info.value = opt.key
                info.checked = (DailyReminderDB[alertDbKey] == opt.key)
                info.func = function(btn)
                    DailyReminderDB[alertDbKey] = btn.value
                    UIDropDownMenu_SetText(alertDD, GetAlertLabel(btn.value))
                    CloseDropDownMenus()
                end
                UIDropDownMenu_AddButton(info, level)
            end
        end)

        -- Test Alert button (right)
        local testBtn = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
        testBtn:SetSize(100, 22)
        testBtn:SetPoint("TOPLEFT", alertLabel, "TOPLEFT", 175, -16)
        testBtn:SetText("Test Alert")
        testBtn:SetScript("OnClick", testClickFn)

        -- Return a clean anchor at x=0 (compensates for UIDropDownMenu's -16 left shift)
        local rowAnchor = CreateFrame("Frame", nil, parent)
        rowAnchor:SetSize(1, 1)
        rowAnchor:SetPoint("TOPLEFT", soundDD, "BOTTOMLEFT", 16, 0)
        return rowAnchor
    end

    -- Reusable test-alert callback builder
    local function MakeTestFn(soundDbKey, alertDbKey, dismissRef, showPopupFn, testCategory, testName)
        return function()
            local saved = dismissRef()
            local alertType = DailyReminderDB[alertDbKey]
            local entry = { category = testCategory, name = testName }

            if alertType == "CHAT" then
                DEFAULT_CHAT_FRAME:AddMessage(
                    "|cff00ff00[Daily Reminder]|r " .. entry.category .. " — |cffffff00" .. entry.name .. "|r")
            elseif alertType == "RAID_WARNING" then
                DEFAULT_CHAT_FRAME:AddMessage(
                    "|cff00ff00[Daily Reminder]|r " .. entry.category .. " — |cffffff00" .. entry.name .. "|r")
                RaidNotice_AddMessage(RaidWarningFrame,
                    entry.category .. ": " .. entry.name, ChatTypeInfo["RAID_WARNING"])
            elseif alertType == "POPUP" then
                showPopupFn({ "|cffffff00" .. entry.category .. ":|r " .. entry.name })
            end
            PlayAlertSound(DailyReminderDB[soundDbKey])
            saved() -- restore
        end
    end

    -- Custom slider builder (explicit textures — works reliably in Classic TBC)
    local function CreateCustomSlider(parent, sliderName, anchor, offsetY, minVal, maxVal, dbKey, formatFn)
        local slider = CreateFrame("Slider", sliderName, parent, "BackdropTemplate")
        slider:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 4, offsetY or -20)
        slider:SetSize(200, 17)
        slider:SetOrientation("HORIZONTAL")

        slider:SetBackdrop({
            bgFile   = "Interface\\Buttons\\UI-SliderBar-Background",
            edgeFile = "Interface\\Buttons\\UI-SliderBar-Border",
            tile = true, tileSize = 8, edgeSize = 8,
            insets = { left = 3, right = 3, top = 6, bottom = 6 },
        })

        local thumb = slider:CreateTexture(nil, "ARTWORK")
        thumb:SetTexture("Interface\\Buttons\\UI-SliderBar-Button-Horizontal")
        thumb:SetSize(32, 32)
        slider:SetThumbTexture(thumb)

        slider:SetMinMaxValues(minVal, maxVal)
        slider:SetValueStep(1)
        slider:SetObeyStepOnDrag(true)
        slider:SetValue(DailyReminderDB[dbKey] or minVal)

        local low = slider:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        low:SetPoint("TOPLEFT", slider, "BOTTOMLEFT", 0, -2)
        low:SetText(minVal .. (minVal == 1 and " day" or " days"))

        local high = slider:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        high:SetPoint("TOPRIGHT", slider, "BOTTOMRIGHT", 0, -2)
        high:SetText(maxVal .. " days")

        local text = slider:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        text:SetPoint("BOTTOM", slider, "TOP", 0, 2)
        text:SetText(formatFn(DailyReminderDB[dbKey] or minVal))

        slider:SetScript("OnValueChanged", function(self, value)
            value = math.floor(value + 0.5)
            DailyReminderDB[dbKey] = value
            text:SetText(formatFn(value))
        end)

        return slider
    end

    -- Enable / disable a checkbox visually
    local function SetCheckboxEnabled(cb, enabled)
        if enabled then
            cb:Enable()
            cb.text:SetTextColor(1, 1, 1)
        else
            cb:Disable()
            cb.text:SetTextColor(0.5, 0.5, 0.5)
        end
    end

    ------------------------------------------------------------------
    -- Tab 1: Quests
    ------------------------------------------------------------------
    local q = tabChildren[1]

    -- Description
    local qDesc = q:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    qDesc:SetPoint("TOPLEFT", 0, 0)
    qDesc:SetPoint("RIGHT", -20, 0)
    qDesc:SetJustifyH("LEFT")
    qDesc:SetText("Track completed daily quests and get alerted when they are ready to turn in.")

    -- Master toggle
    local qMasterCb = CreateSettingsCheckbox(q, "Enable Quest Tracking", "checkQuests", qDesc, -10)

    -- Sub-content indented under master toggle (16px indent mirrors consortium/professions visual)
    -- Alert settings header
    local alertHeader = q:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    alertHeader:SetPoint("TOPLEFT", qMasterCb, "BOTTOMLEFT", 16, -12)
    alertHeader:SetText("Alerts")

    -- Compact alert row (sound + type + test on same line)
    local qAlertRow = CreateAlertRow(q, "questSound", "questAlertType",
        MakeTestFn("questSound", "questAlertType",
            function() local s = questDismissedThisSession; questDismissedThisSession = false; return function() questDismissedThisSession = s end end,
            ShowQuestPopup, "Heroic", "Wanted: Murmur's Whisper"),
        alertHeader)

    -- Alert triggers
    local trigSep = CreateSectionSep(q, qAlertRow, -12)

    local trigHeader = q:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    trigHeader:SetPoint("TOPLEFT", trigSep, "BOTTOMLEFT", 0, -8)
    trigHeader:SetText("Alert Triggers")

    local trigCb1 = CreateSettingsCheckbox(q, "On Login / Reload",           "questTriggerLogin",         trigHeader, -4)
    local trigCb2 = CreateSettingsCheckbox(q, "When Leaving an Instance (dungeon / battleground)", "questTriggerInstanceLeave", trigCb1, -2)

    -- Quest category toggles (collapsible two-column layout)
    local qSep = CreateSectionSep(q, trigCb2, -12)

    local catHeader = q:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    catHeader:SetPoint("TOPLEFT", qSep, "BOTTOMLEFT", 0, -8)
    catHeader:SetText("Tracked Quest Categories")

    -- Collapse toggle (+/-)
    local catCollapsed = false
    local catToggle = CreateFrame("Button", nil, q)
    catToggle:SetSize(16, 16)
    catToggle:SetPoint("LEFT", catHeader, "RIGHT", 6, 0)
    local catToggleIcon = catToggle:CreateTexture(nil, "ARTWORK")
    catToggleIcon:SetAllPoints()
    catToggleIcon:SetTexture("Interface\\Buttons\\UI-MinusButton-UP")
    local catToggleHL = catToggle:CreateTexture(nil, "HIGHLIGHT")
    catToggleHL:SetAllPoints()
    catToggleHL:SetTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
    catToggleHL:SetBlendMode("ADD")

    -- Container for the category checkboxes
    local catContainer = CreateFrame("Frame", nil, q)
    catContainer:SetPoint("TOPLEFT", catHeader, "BOTTOMLEFT", 0, 0)
    catContainer:SetSize(500, 1)

    -- Invisible anchor inside the container
    local catAnchor = catContainer:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    catAnchor:SetPoint("TOPLEFT", 0, 0)
    catAnchor:SetText("")
    catAnchor:SetHeight(1)

    -- Left column
    local sCb1 = CreateSettingsCheckbox(catContainer, "Dungeons (Normal)",             "checkDungeons", catAnchor, -4)
    local sCb2 = CreateSettingsCheckbox(catContainer, "Heroics",                       "checkHeroics",  sCb1, -2)
    local sCb3 = CreateSettingsCheckbox(catContainer, "PVP (Battlegrounds & World)",   "checkPVP",      sCb2, -2)
    local sCb4 = CreateSettingsCheckbox(catContainer, "Ogri'la / Sha'tari Skyguard",   "checkOgrila",   sCb3, -2)

    -- Right column (aligned to left-column rows)
    local sCb5 = CreateSettingsCheckbox(catContainer, "Cooking",  "checkCooking",  catAnchor, -4)
    sCb5:ClearAllPoints()
    sCb5:SetPoint("TOPLEFT", sCb1, "TOPLEFT", 260, 0)

    local sCb6 = CreateSettingsCheckbox(catContainer, "Fishing",  "checkFishing",  catAnchor, -4)
    sCb6:ClearAllPoints()
    sCb6:SetPoint("TOPLEFT", sCb2, "TOPLEFT", 260, 0)

    local function UpdateCatCollapse()
        if catCollapsed then
            catContainer:Hide()
            catToggleIcon:SetTexture("Interface\\Buttons\\UI-PlusButton-UP")
        else
            catContainer:Show()
            catToggleIcon:SetTexture("Interface\\Buttons\\UI-MinusButton-UP")
        end
    end

    catToggle:SetScript("OnClick", function()
        catCollapsed = not catCollapsed
        UpdateCatCollapse()
    end)
    UpdateCatCollapse()

    -- Visual enable/disable for quest sub-controls
    local questSubCbs = { trigCb1, trigCb2, sCb1, sCb2, sCb3, sCb4, sCb5, sCb6 }
    local function UpdateQuestEnabled()
        local on = qMasterCb:GetChecked()
        for _, cb in ipairs(questSubCbs) do SetCheckboxEnabled(cb, on) end
    end
    qMasterCb:HookScript("OnClick", UpdateQuestEnabled)
    UpdateQuestEnabled()

    FinalizeTab(1, 380)

    ------------------------------------------------------------------
    -- Tab 2: Consortium
    ------------------------------------------------------------------
    local c = tabChildren[2]

    local cDesc = c:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    cDesc:SetPoint("TOPLEFT", 0, 0)
    cDesc:SetPoint("RIGHT", -20, 0)
    cDesc:SetJustifyH("LEFT")
    cDesc:SetText("Track the monthly Membership Benefits quest from The Consortium.\nStatus is shared across all characters on the account.")

    local cCb = CreateSettingsCheckbox(c, "Enable Consortium Monthly Quest tracking", "checkConsortium", cDesc, -10)

    local cHint = c:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    cHint:SetPoint("TOPLEFT", cCb, "BOTTOMLEFT", 26, -6)
    cHint:SetTextColor(0.6, 0.6, 0.6)
    cHint:SetText("Open the status window with Shift-click on the minimap button or /dr consortium")

    -- Consortium alert settings
    local cAlertSep = CreateSectionSep(c, cHint, -12)

    local cAlertHeader = c:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    cAlertHeader:SetPoint("TOPLEFT", cAlertSep, "BOTTOMLEFT", 0, -8)
    cAlertHeader:SetText("Consortium Alerts")

    local cAlertRow = CreateAlertRow(c, "consortiumSound", "consortiumAlertType",
        MakeTestFn("consortiumSound", "consortiumAlertType",
            function() local s = consortiumDismissedThisSession; consortiumDismissedThisSession = false; return function() consortiumDismissedThisSession = s end end,
            ShowConsortiumAlertPopup, "Consortium", "Membership Benefits (available)  |cffaaaaaa(5 days left)|r"),
        cAlertHeader)

    -- Reminder-days slider
    local cDaysSep = CreateSectionSep(c, cAlertRow, -12)

    local cDaysHeader = c:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    cDaysHeader:SetPoint("TOPLEFT", cDaysSep, "BOTTOMLEFT", 0, -8)
    cDaysHeader:SetText("Reminder Window")

    local cDaysDesc = c:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    cDaysDesc:SetPoint("TOPLEFT", cDaysHeader, "BOTTOMLEFT", 0, -4)
    cDaysDesc:SetPoint("RIGHT", -20, 0)
    cDaysDesc:SetJustifyH("LEFT")
    cDaysDesc:SetTextColor(0.8, 0.8, 0.8)
    cDaysDesc:SetText("How many days before the month ends should reminders start?\nLower values = less spam while you're still levelling the reputation.")

    local cDaysSlider = CreateCustomSlider(c, "DRConsortiumDaysSlider", cDaysDesc, -20, 1, 28,
        "consortiumReminderDays",
        function(v) return "Remind " .. v .. " days before month end" end)

    FinalizeTab(2, 360)

    ------------------------------------------------------------------
    -- Tab 3: Professions
    ------------------------------------------------------------------
    local p = tabChildren[3]

    local pDesc = p:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    pDesc:SetPoint("TOPLEFT", 0, 0)
    pDesc:SetPoint("RIGHT", -20, 0)
    pDesc:SetJustifyH("LEFT")
    pDesc:SetText("Track profession cooldowns across all your characters.")

    local pCb = CreateSettingsCheckbox(p, "Enable Profession Cooldown tracking", "checkProfessions", pDesc, -10)

    local pHint = p:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    pHint:SetPoint("TOPLEFT", pCb, "BOTTOMLEFT", 26, -6)
    pHint:SetTextColor(0.6, 0.6, 0.6)
    pHint:SetText("Open the cooldowns window with Ctrl-click on the minimap button or /dr professions")

    -- Professions alert settings
    local pAlertSep = CreateSectionSep(p, pHint, -12)

    local pAlertHeader = p:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    pAlertHeader:SetPoint("TOPLEFT", pAlertSep, "BOTTOMLEFT", 0, -8)
    pAlertHeader:SetText("Professions Alerts")

    local pAlertRow = CreateAlertRow(p, "professionsSound", "professionsAlertType",
        MakeTestFn("professionsSound", "professionsAlertType",
            function() local s = professionsDismissedThisSession; professionsDismissedThisSession = false; return function() professionsDismissedThisSession = s end end,
            ShowProfessionsAlertPopup, "Professions", "All cooldowns ready"),
        pAlertHeader)

    -- Professions alert triggers
    local pTrigSep = CreateSectionSep(p, pAlertRow, -12)

    local pTrigHeader = p:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    pTrigHeader:SetPoint("TOPLEFT", pTrigSep, "BOTTOMLEFT", 0, -8)
    pTrigHeader:SetText("Alert Triggers")

    local pTrigCb1 = CreateSettingsCheckbox(p, "On Login / Reload",           "professionsTriggerLogin",         pTrigHeader, -4)
    local pTrigCb2 = CreateSettingsCheckbox(p, "When Leaving an Instance (dungeon / battleground)", "professionsTriggerInstanceLeave", pTrigCb1, -2)

    -- Tracked Cooldowns section (per-character cooldown preferences)
    local pCDSep = CreateSectionSep(p, pTrigCb2, -12)

    local pCDHeader = p:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    pCDHeader:SetPoint("TOPLEFT", pCDSep, "BOTTOMLEFT", 0, -8)
    pCDHeader:SetText("Tracked Cooldowns")

    local pCDDesc = p:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    pCDDesc:SetPoint("TOPLEFT", pCDHeader, "BOTTOMLEFT", 0, -4)
    pCDDesc:SetPoint("RIGHT", -20, 0)
    pCDDesc:SetJustifyH("LEFT")
    pCDDesc:SetTextColor(0.8, 0.8, 0.8)
    pCDDesc:SetText("Select a character on the right, then toggle which cooldowns to track on the left.")

    -- ===== Container for the two-panel layout =====
    local panelContainer = CreateFrame("Frame", nil, p)
    panelContainer:SetPoint("TOPLEFT", pCDDesc, "BOTTOMLEFT", 0, -10)
    panelContainer:SetSize(540, 200)

    -- -----------------------------------------------
    -- LEFT BLOCK: Fixed cooldown checkboxes
    -- -----------------------------------------------
    local leftPanel = CreateFrame("Frame", nil, panelContainer, "BackdropTemplate")
    leftPanel:SetPoint("TOPLEFT", 0, 0)
    leftPanel:SetSize(310, 200)
    leftPanel:SetBackdrop({
        bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 },
    })
    leftPanel:SetBackdropColor(0.08, 0.08, 0.08, 0.7)
    leftPanel:SetBackdropBorderColor(0.4, 0.4, 0.4, 0.6)

    -- "No character selected" label (shown when no character is active)
    local noCharLabel = leftPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    noCharLabel:SetPoint("CENTER", 0, 0)
    noCharLabel:SetText("|cff999999Select a character to configure cooldowns.|r")

    -- Header inside left panel showing selected character name
    local leftCharName = leftPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    leftCharName:SetPoint("TOPLEFT", 10, -10)
    leftCharName:SetText("")

    -- Create fixed checkboxes for each trackable cooldown (always present, just updated)
    local cdCheckboxes = {}
    for i, tc in ipairs(trackableCooldowns) do
        local cb = CreateFrame("CheckButton", nil, leftPanel, "UICheckButtonTemplate")
        if i == 1 then
            cb:SetPoint("TOPLEFT", leftCharName, "BOTTOMLEFT", 4, -6)
        else
            cb:SetPoint("TOPLEFT", cdCheckboxes[i - 1], "BOTTOMLEFT", 0, -2)
        end
        cb:SetSize(22, 22)
        cb.text = cb:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        cb.text:SetPoint("LEFT", cb, "RIGHT", 2, 0)
        cb.text:SetText(tc.label .. "  |cff888888(" .. tc.profession .. ")|r")
        cb:SetChecked(false)
        cb:Disable()
        cb.trackKey = tc.key
        cb:SetScript("OnClick", function(self)
            if self.boundCharKey then
                SetCooldownTracked(self.boundCharKey, self.trackKey, self:GetChecked() and true or false)
            end
        end)
        table.insert(cdCheckboxes, cb)
    end

    -- Track currently selected character key
    local selectedCharKey = nil

    -- Update left panel checkboxes for the given character
    local function SelectCharacter(charKey, displayName)
        selectedCharKey = charKey
        if not charKey then
            noCharLabel:Show()
            leftCharName:SetText("")
            for _, cb in ipairs(cdCheckboxes) do
                cb:SetChecked(false)
                cb:Disable()
                cb.text:SetTextColor(0.4, 0.4, 0.4)
                cb.boundCharKey = nil
            end
            return
        end
        noCharLabel:Hide()
        leftCharName:SetText(displayName or charKey)
        for _, cb in ipairs(cdCheckboxes) do
            cb.boundCharKey = charKey
            cb:SetChecked(IsCooldownTracked(charKey, cb.trackKey))
            cb:Enable()
            cb.text:SetTextColor(0.8, 0.8, 0.8)
        end
    end

    -- -----------------------------------------------
    -- RIGHT BLOCK: Scrollable character list with arrows
    -- -----------------------------------------------
    local RIGHT_WIDTH = 200
    local ROW_HEIGHT = 22
    local VISIBLE_ROWS = 6

    local rightPanel = CreateFrame("Frame", nil, panelContainer, "BackdropTemplate")
    rightPanel:SetPoint("TOPLEFT", leftPanel, "TOPRIGHT", 10, 0)
    rightPanel:SetSize(RIGHT_WIDTH, 200)
    rightPanel:SetBackdrop({
        bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 },
    })
    rightPanel:SetBackdropColor(0.08, 0.08, 0.08, 0.7)
    rightPanel:SetBackdropBorderColor(0.4, 0.4, 0.4, 0.6)

    -- "Characters" label at top
    local rightTitle = rightPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    rightTitle:SetPoint("TOP", 0, -6)
    rightTitle:SetText("Characters")

    -- Up arrow button (anchored near the top, below title)
    local upBtn = CreateFrame("Button", nil, rightPanel)
    upBtn:SetSize(RIGHT_WIDTH - 20, 16)
    upBtn:SetPoint("TOP", rightTitle, "BOTTOM", 0, -2)
    local upArrow = upBtn:CreateTexture(nil, "ARTWORK")
    upArrow:SetSize(16, 8)
    upArrow:SetPoint("CENTER")
    upArrow:SetTexture("Interface\\Buttons\\Arrow-Up-Up")
    local upHL = upBtn:CreateTexture(nil, "HIGHLIGHT")
    upHL:SetSize(16, 8)
    upHL:SetPoint("CENTER")
    upHL:SetTexture("Interface\\Buttons\\Arrow-Up-Up")
    upHL:SetBlendMode("ADD")
    upHL:SetAlpha(0.4)
    upBtn.arrow = upArrow

    -- Down arrow button (anchored near the bottom of the panel)
    local downBtn = CreateFrame("Button", nil, rightPanel)
    downBtn:SetSize(RIGHT_WIDTH - 20, 16)
    downBtn:SetPoint("BOTTOM", rightPanel, "BOTTOM", 0, 6)
    local downArrow = downBtn:CreateTexture(nil, "ARTWORK")
    downArrow:SetSize(16, 8)
    downArrow:SetPoint("CENTER")
    downArrow:SetTexture("Interface\\Buttons\\Arrow-Down-Up")
    local downHL = downBtn:CreateTexture(nil, "HIGHLIGHT")
    downHL:SetSize(16, 8)
    downHL:SetPoint("CENTER")
    downHL:SetTexture("Interface\\Buttons\\Arrow-Down-Up")
    downHL:SetBlendMode("ADD")
    downHL:SetAlpha(0.4)
    downBtn.arrow = downArrow

    -- Visible row buttons (between the two arrows)
    local listArea = CreateFrame("Frame", nil, rightPanel)
    listArea:SetPoint("TOPLEFT", upBtn, "BOTTOMLEFT", 0, -2)
    listArea:SetPoint("TOPRIGHT", upBtn, "BOTTOMRIGHT", 0, -2)
    listArea:SetPoint("BOTTOM", downBtn, "TOP", 0, 2)

    local rowButtons = {}
    for i = 1, VISIBLE_ROWS do
        local row = CreateFrame("Button", nil, listArea)
        row:SetSize(RIGHT_WIDTH - 20, ROW_HEIGHT)
        if i == 1 then
            row:SetPoint("TOPLEFT", listArea, "TOPLEFT", 2, 0)
        else
            row:SetPoint("TOPLEFT", rowButtons[i - 1], "BOTTOMLEFT", 0, 0)
        end

        -- Selection highlight background
        local selBg = row:CreateTexture(nil, "BACKGROUND")
        selBg:SetAllPoints()
        selBg:SetColorTexture(1, 0.82, 0, 0.15)
        selBg:Hide()
        row.selBg = selBg

        -- Hover highlight
        local hoverBg = row:CreateTexture(nil, "HIGHLIGHT")
        hoverBg:SetAllPoints()
        hoverBg:SetColorTexture(1, 1, 1, 0.08)

        -- Delete button (small X on the right side of the row)
        local delBtn = CreateFrame("Button", nil, row)
        delBtn:SetSize(14, 14)
        delBtn:SetPoint("RIGHT", -2, 0)
        local delTex = delBtn:CreateTexture(nil, "ARTWORK")
        delTex:SetAllPoints()
        delTex:SetTexture("Interface\\Buttons\\UI-StopButton")
        delTex:SetVertexColor(0.6, 0.2, 0.2)
        local delHL = delBtn:CreateTexture(nil, "HIGHLIGHT")
        delHL:SetAllPoints()
        delHL:SetTexture("Interface\\Buttons\\UI-StopButton")
        delHL:SetBlendMode("ADD")
        delHL:SetAlpha(0.5)
        delBtn:Hide()
        row.delBtn = delBtn

        -- Character name text (leave room for the delete button)
        local nameText = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        nameText:SetPoint("LEFT", 6, 0)
        nameText:SetPoint("RIGHT", delBtn, "LEFT", -2, 0)
        nameText:SetJustifyH("LEFT")
        row.nameText = nameText

        row:Hide()
        table.insert(rowButtons, row)
    end

    -- Empty state label (shown when no characters exist)
    local emptyLabel = rightPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    emptyLabel:SetPoint("CENTER", 0, -10)
    emptyLabel:SetWidth(RIGHT_WIDTH - 20)
    emptyLabel:SetText("|cff999999No profession data yet.|r")
    emptyLabel:Hide()

    -- Scroll state
    local charList = {}         -- sorted charKey entries: { key, display, class }
    local scrollOffset = 0      -- index of the first visible row (0-based)

    -- Forward-declare BuildTrackedCooldownsUI so delete handlers can call it
    local BuildTrackedCooldownsUI

    -- Update arrow enabled/disabled state
    local function UpdateArrows()
        local maxOffset = math.max(0, #charList - VISIBLE_ROWS)
        if scrollOffset <= 0 then
            upArrow:SetDesaturated(true)
            upArrow:SetAlpha(0.3)
            upBtn:Disable()
        else
            upArrow:SetDesaturated(false)
            upArrow:SetAlpha(1)
            upBtn:Enable()
        end
        if scrollOffset >= maxOffset then
            downArrow:SetDesaturated(true)
            downArrow:SetAlpha(0.3)
            downBtn:Disable()
        else
            downArrow:SetDesaturated(false)
            downArrow:SetAlpha(1)
            downBtn:Enable()
        end
    end

    -- Delete a character's profession data
    local function DeleteCharacterData(charKey)
        if DailyReminderDB.professionCDs then
            DailyReminderDB.professionCDs[charKey] = nil
        end
        if DailyReminderDB.profCDPrefs then
            DailyReminderDB.profCDPrefs[charKey] = nil
        end
    end

    -- Refresh the visible rows from charList + scrollOffset
    local function RefreshCharList()
        for i = 1, VISIBLE_ROWS do
            local dataIdx = scrollOffset + i
            local row = rowButtons[i]
            if dataIdx <= #charList then
                local entry = charList[dataIdx]
                row.charKey = entry.key
                row.displayName = entry.display
                row.nameText:SetText(entry.display)
                row.delBtn:Show()
                row:Show()
                -- Highlight selected
                if selectedCharKey == entry.key then
                    row.selBg:Show()
                else
                    row.selBg:Hide()
                end
            else
                row.charKey = nil
                row.displayName = nil
                row.nameText:SetText("")
                row.delBtn:Hide()
                row:Hide()
            end
        end
        UpdateArrows()
    end

    -- Row click handler (select character)
    for _, row in ipairs(rowButtons) do
        row:SetScript("OnClick", function(self)
            if self.charKey then
                SelectCharacter(self.charKey, self.displayName)
                RefreshCharList()  -- update highlight
            end
        end)
        -- Delete button click handler
        row.delBtn:SetScript("OnClick", function(self)
            local rw = self:GetParent()
            if rw.charKey then
                DeleteCharacterData(rw.charKey)
                BuildTrackedCooldownsUI()
                -- Refresh the professions status window if it's open
                if professionsFrame and professionsFrame:IsShown() then
                    RefreshProfessionsWindow()
                end
            end
        end)
    end

    -- Arrow click handlers
    upBtn:SetScript("OnClick", function()
        if scrollOffset > 0 then
            scrollOffset = scrollOffset - 1
            RefreshCharList()
        end
    end)

    downBtn:SetScript("OnClick", function()
        local maxOffset = math.max(0, #charList - VISIBLE_ROWS)
        if scrollOffset < maxOffset then
            scrollOffset = scrollOffset + 1
            RefreshCharList()
        end
    end)

    -- Mouse wheel on the list area
    listArea:EnableMouseWheel(true)
    listArea:SetScript("OnMouseWheel", function(_, delta)
        local maxOffset = math.max(0, #charList - VISIBLE_ROWS)
        scrollOffset = math.max(0, math.min(maxOffset, scrollOffset - delta))
        RefreshCharList()
    end)

    -- Master build function: populates charList from DB, selects first char
    BuildTrackedCooldownsUI = function()
        wipe(charList)
        scrollOffset = 0
        selectedCharKey = nil

        local profData = DailyReminderDB.professionCDs or {}
        local sortedKeys = GetSortedKeys(profData)

        for _, charKey in ipairs(sortedKeys) do
            local charInfo = profData[charKey]
            local nameDisplay = GetClassColoredName(charKey, charInfo.class)
            table.insert(charList, { key = charKey, display = nameDisplay, class = charInfo.class })
        end

        if #charList == 0 then
            emptyLabel:Show()
            for _, row in ipairs(rowButtons) do row:Hide() end
            SelectCharacter(nil)
            UpdateArrows()
            return
        end

        emptyLabel:Hide()
        -- Auto-select first character
        SelectCharacter(charList[1].key, charList[1].display)
        RefreshCharList()
    end

    -- Rebuild when the professions tab becomes visible
    panelContainer:SetScript("OnShow", BuildTrackedCooldownsUI)

    -- Visual enable/disable for professions sub-controls
    local profSubCbs = { pTrigCb1, pTrigCb2 }
    local function UpdateProfEnabled()
        local on = pCb:GetChecked()
        for _, cb in ipairs(profSubCbs) do SetCheckboxEnabled(cb, on) end
    end
    pCb:HookScript("OnClick", UpdateProfEnabled)
    UpdateProfEnabled()

    FinalizeTab(3, 580)

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
            ResetAllDismissFlags()
            RunAllChecksStaggered()
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
        -- Migrate from unified alerts to per-category (v1.5 → v1.6)
        if DailyReminderDB.sound and not DailyReminderDB.questSound then
            DailyReminderDB.questSound = DailyReminderDB.sound
            DailyReminderDB.consortiumSound = DailyReminderDB.sound
            DailyReminderDB.professionsSound = DailyReminderDB.sound
        end
        if DailyReminderDB.alertType and not DailyReminderDB.questAlertType then
            DailyReminderDB.questAlertType = DailyReminderDB.alertType
            DailyReminderDB.consortiumAlertType = DailyReminderDB.alertType
            DailyReminderDB.professionsAlertType = DailyReminderDB.alertType
        end
        DailyReminderDB.sound = nil
        DailyReminderDB.alertType = nil
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

    -- PLAYER_ENTERING_WORLD: fires on login, reload, and instance transitions
    if event == "PLAYER_ENTERING_WORLD" then
        -- Don't fire any checks until the first-run wizard has been completed
        if DailyReminderDB.firstRun then return end

        local isLogin  = arg1  -- true on initial login
        local isReload = arg2  -- true on /reload

        local inInstance = IsInInstance()
        local justLeftInstance = wasInInstance and not inInstance
        wasInInstance = inInstance

        -- Throttle
        local now = GetTime()
        if now - lastQuestCheck < THROTTLE_SECONDS
           and now - lastConsortiumCheck < THROTTLE_SECONDS
           and now - lastProfessionsCheck < THROTTLE_SECONDS then return end

        local loginEvent = isLogin or isReload

        -- Quest triggers: login (if enabled) and/or instance-leave (if enabled)
        if now - lastQuestCheck >= THROTTLE_SECONDS then
            local shouldCheckQuests = false
            if loginEvent and DailyReminderDB.questTriggerLogin then
                shouldCheckQuests = true
            end
            if justLeftInstance and DailyReminderDB.questTriggerInstanceLeave then
                shouldCheckQuests = true
            end
            if shouldCheckQuests then
                lastQuestCheck = now
                C_Timer.After(2, RunQuestCheck)
            end
        end

        -- Consortium trigger: login only (days-before-month-end check is inside RunConsortiumCheck)
        if loginEvent and now - lastConsortiumCheck >= THROTTLE_SECONDS then
            lastConsortiumCheck = now
            C_Timer.After(4, RunConsortiumCheck)
        end

        -- Professions triggers: login (if enabled) and/or instance-leave (if enabled)
        if now - lastProfessionsCheck >= THROTTLE_SECONDS then
            local shouldCheckProf = false
            if loginEvent and DailyReminderDB.professionsTriggerLogin then
                shouldCheckProf = true
            end
            if justLeftInstance and DailyReminderDB.professionsTriggerInstanceLeave then
                shouldCheckProf = true
            end
            if shouldCheckProf then
                lastProfessionsCheck = now
                C_Timer.After(3, RunProfessionsCheck)
            end
        end
    end
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
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
        ResetAllDismissFlags()
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[Daily Reminder]|r Reminders re-enabled for this session.")
    elseif cmd == "check" then
        ResetAllDismissFlags()
        RunAllChecksStaggered()
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

