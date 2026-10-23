-- SecretGPS - Progress tracking
-- A step counts as done when its quest flag is complete in-game
-- (read-only check) or when the player ticks it manually.
-- An entry counts as solved when it is manually marked complete,
-- or every quest flag in its completion list is done, or every
-- step is done. Manual state lives in SecretGPSDB (SavedVariables).
local _, ns = ...

local function IsQuestDone(questID)
    if not questID then return false end
    if C_QuestLog and C_QuestLog.IsQuestFlaggedCompleted then
        local ok, res = pcall(C_QuestLog.IsQuestFlaggedCompleted, questID)
        if ok then return res and true or false end
    end
    if IsQuestFlaggedCompleted then
        local ok, res = pcall(IsQuestFlaggedCompleted, questID)
        if ok then return res and true or false end
    end
    return false
end
ns.IsQuestDone = IsQuestDone

local function StepHasQuest(step)
    return step and step.questFlag and true or false
end

local function IsStepDone(entry, idx)
    if not entry or not entry.steps then return false end
    local step = entry.steps[idx]
    if not step then return false end
    if StepHasQuest(step) and IsQuestDone(step.questFlag) then return true end
    local db = ns.db
    if db and db.manualSteps and db.manualSteps[entry.id] and db.manualSteps[entry.id][idx] then
        return true
    end
    return false
end
ns.IsStepDone = IsStepDone

local function ToggleStep(entry, idx)
    if not entry or not ns.db then return end
    local db = ns.db
    if type(db.manualSteps[entry.id]) ~= "table" then db.manualSteps[entry.id] = {} end
    if db.manualSteps[entry.id][idx] then
        db.manualSteps[entry.id][idx] = nil
    else
        db.manualSteps[entry.id][idx] = true
    end
end
ns.ToggleStep = ToggleStep

-- Returns doneSteps, totalSteps
local function EntryStepProgress(entry)
    if not entry or not entry.steps then return 0, 0 end
    local done = 0
    for i = 1, #entry.steps do
        if IsStepDone(entry, i) then done = done + 1 end
    end
    return done, #entry.steps
end
ns.EntryStepProgress = EntryStepProgress

local function IsEntrySolved(entry)
    if not entry then return false end
    local db = ns.db
    if db and db.manualComplete and db.manualComplete[entry.id] then return true end
    if entry.completion and entry.completion.questFlags then
        local flags = entry.completion.questFlags
        if #flags > 0 then
            local all = true
            for i = 1, #flags do
                if not IsQuestDone(flags[i]) then all = false break end
            end
            if all then return true end
        end
    end
    local done, total = EntryStepProgress(entry)
    if total > 0 and done == total then return true end
    return false
end
ns.IsEntrySolved = IsEntrySolved

local function ToggleEntryComplete(entry)
    if not entry or not ns.db then return end
    if ns.db.manualComplete[entry.id] then
        ns.db.manualComplete[entry.id] = nil
    else
        ns.db.manualComplete[entry.id] = true
    end
end
ns.ToggleEntryComplete = ToggleEntryComplete

-- Mind-Seeker: the in-game Feat of Strength needs 17 of the 34 canonical
-- secrets solved. This addon tracks only the Mind-Seeker entries present
-- in its own catalog, and says so.
local function MindSeekerCounts()
    local solved, total = 0, 0
    for i = 1, #ns.Entries do
        local e = ns.Entries[i]
        if e.mindSeeker then
            total = total + 1
            if IsEntrySolved(e) then solved = solved + 1 end
        end
    end
    return solved, total
end
ns.MindSeekerCounts = MindSeekerCounts

local function MindSeekerSummary()
    local solved, total = MindSeekerCounts()
    return "Mind-Seeker: " .. solved .. " solved of " .. total ..
        " Mind-Seeker secrets in this catalog (the Feat of Strength needs 17 of 34 in total)."
end
ns.MindSeekerSummary = MindSeekerSummary
