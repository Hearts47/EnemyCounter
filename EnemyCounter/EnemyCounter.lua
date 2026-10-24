-- EnemyCounter : nombre d'ennemis en vie (Azeroth Survivors)
-- Lit le champ "en" de AZS_RUN. Cadre deplacable au clic gauche.

EnemyCounterDB = EnemyCounterDB or {}

local f = CreateFrame("Frame", "EnemyCounterFrame", UIParent)
f:SetWidth(140)
f:SetHeight(30)
f:SetPoint("TOP", UIParent, "TOP", 0, -100)
f:SetMovable(true)
f:EnableMouse(true)
f:RegisterForDrag("LeftButton")
f:SetBackdrop({
  bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
  edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
  tile = true, tileSize = 16, edgeSize = 12,
  insets = { left = 3, right = 3, top = 3, bottom = 3 }
})
f:SetBackdropColor(0, 0, 0, 0.6)

local text = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
text:SetPoint("CENTER", f, "CENTER", 0, 0)
text:SetText("Ennemis : 0")

f:SetScript("OnDragStart", function() this:StartMoving() end)
f:SetScript("OnDragStop", function()
  this:StopMovingOrSizing()
  EnemyCounterDB.left = this:GetLeft()
  EnemyCounterDB.top = this:GetTop()
end)

local elapsedTotal = 0
f:SetScript("OnUpdate", function()
  elapsedTotal = elapsedTotal + arg1
  if elapsedTotal < 0.2 then return end
  elapsedTotal = 0

  local r = AZS_RUN
  if type(r) == "table" and type(r.en) == "number" then
    text:SetText("Ennemis : " .. r.en)
  else
    text:SetText("Ennemis : -")
  end
end)

f:RegisterEvent("VARIABLES_LOADED")
f:SetScript("OnEvent", function()
  if EnemyCounterDB.left and EnemyCounterDB.top then
    this:ClearAllPoints()
    this:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", EnemyCounterDB.left, EnemyCounterDB.top)
  end
end)
