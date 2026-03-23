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

------------------------------------------------------------
-- First-Run Setup Popup
------------------------------------------------------------

local setupFrame

local function CreateSetupFrame()
    if setupFrame then return setupFrame end

    local f = CreateFrame("Frame", "DailyReminderSetupPopup", UIParent, "BackdropTemplate")
    f:SetSize(400, 320)
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

local function RunCheck()
    if dismissedThisSession then return end

    local completed = GetCompletedQuestIDs()
    local results = {}

    -- Check each daily table against completed quests (only if enabled)
    local dailyTables = {
        { table = dungeonDailies, category = "Dungeon",                  enabled = DailyReminderDB.checkDungeons },
        { table = heroicDailies,  category = "Heroic",                   enabled = DailyReminderDB.checkHeroics },
        { table = pvpDailies,     category = "PVP",                      enabled = DailyReminderDB.checkPVP },
        { table = ogrilaDailies,  category = "Ogri'la / Sha'tari Skyguard", enabled = DailyReminderDB.checkOgrila },
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
    local sCb4 = CreateSettingsCheckbox(canvas, "Ogri'la / Sha'tari Skyguard Dailies",  "checkOgrila",   sCb3, -2)

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
        else
            OpenSettings()
        end
    end)

    -- Tooltip
    btn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:AddLine("|cff00ff00Daily Reminder|r")
        GameTooltip:AddLine("|cffffffffLeft-click:|r Open settings", 1, 1, 1)
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

local function OnEvent(self, event, arg1)
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

    -- Throttle
    local now = GetTime()
    if now - lastCheck < THROTTLE_SECONDS then return end
    lastCheck = now

    C_Timer.After(2, RunCheck)
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
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
    else
        OpenSettings()
    end
end

