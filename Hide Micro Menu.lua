local BagButtonVisable = false
local QueueButtonVisable = false
local MicroMenuVisable = false



--Create frame to attach the bag button to

local BagButtonFrame = CreateFrame("Frame", nil, nil, "BackdropTemplate")
BagButtonFrame:SetSize(50, 50)
BagButtonFrame:SetBackdrop(BACKDROP_TUTORIAL_16_16)
--BagButtonFrame:ClearBackdrop()


--Detach bag button from micromenu and attach to it's own frame

--MainMenuBarBackpackButton:ClearAllPoints()
MainMenuBarBackpackButton:SetParent(BagButtonFrame)
MainMenuBarBackpackButton:SetScale (0.65)
BagBarExpandToggle:ClearAllPoints()
BagBarExpandToggle:SetParent(BagButtonFrame)


--Create a frame to attach the Queue Status Button to

local QueueButtonFrame = CreateFrame("Frame", nil, nil, "BackdropTemplate")
QueueButtonFrame:SetPoint("CENTER", QueueStatusButton, "CENTER", 0, -0)
QueueButtonFrame:SetSize(50, 50)
QueueButtonFrame:SetBackdrop(BACKDROP_TUTORIAL_16_16)
QueueButtonFrame:ClearBackdrop()
QueueButtonFrameCenter = QueueButtonFrame:GetCenter()
print (QueueButtonFrameCenter)


--Detach Queue Button from micromenu and attach to it's own frame

QueueStatusButton:SetParent(QueueButtonFrame)
QueueStatusButton:SetScale (0.65)


--Make Queue Status Frame Draggable
QueueStatusButton:SetMovable(true)
QueueStatusButton:EnableMouse(true)
QueueStatusButton:RegisterForDrag("LeftButton")
QueueStatusButton:SetScript("OnDragStart", function(self, button)
	self:StartMoving()
end)
QueueStatusButton:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing()
end)
QueueStatusButton:SetUserPlaced(true)


--Hide objects if variable is false

if (BagButtonVisable == false) then
	BagButtonFrame:Hide()
else
	BagButtonFrame:Show()
end

if (QueueButtonVisable == false) then
	QueueButtonFrame:Hide()
else
	QueueButtonFrame:Show()
end

if (MicroMenuVisable == false) then
	MicroButtonAndBagsBar:Hide()
else
	MicroButtonAndBagsBar:Show()
end



local Frame = CreateFrame("Frame")
Frame:RegisterEvent("PLAYER_LOGIN")

HideMicroMenu = {};
HideMicroMenu.panel = CreateFrame( "Frame", "HideMicroMenuPanel", UIParent );
HideMicroMenu.panel.name = "Hide Micro Menu";
InterfaceOptions_AddCategory(HideMicroMenu.panel);


--Bag Button CheckButton in Options
BagCheckButton = CreateFrame("CheckButton", "BagCheckButton_GlobalName", HideMicroMenuPanel, "ChatConfigCheckButtonTemplate");
BagCheckButton:SetPoint("TOPLEFT", 35, -65);
BagCheckButton_GlobalNameText:SetText("Hide Bag Button");

BagCheckButton:SetScript("OnClick", 
  function()
    if BagButtonVisable == true then
		BagButtonFrame:Hide()
		BagButtonVisable = false
	else
		BagButtonFrame:Show()
		BagButtonVisable = true
	end
  end
);



--MicroMenu Button CheckButton in Options
MicroMenuCheckButton = CreateFrame("CheckButton", "MicroMenuCheckButton_GlobalName", HideMicroMenuPanel, "ChatConfigCheckButtonTemplate");
MicroMenuCheckButton:SetPoint("TOPLEFT", 35, -165);
MicroMenuCheckButton_GlobalNameText:SetText("Hide Mcro Menu");
MicroMenuCheckButton.tooltip = "Hide Micro Menu";
MicroMenuCheckButton:SetScript("OnClick", 
  function()
	if MicroMenuVisable == true then
		MicroButtonAndBagsBar:Hide()
		MicroMenuVisable = false
	else
		MicroButtonAndBagsBar:Show()
		MicroMenuVisable = true
	end
  end
);



--Queue Button CheckButton in Options
QueueCheckButton = CreateFrame("CheckButton", "QueueCheckButton_GlobalName", HideMicroMenuPanel, "ChatConfigCheckButtonTemplate");
QueueCheckButton:SetPoint("TOPLEFT", 35, -265);
QueueCheckButton_GlobalNameText:SetText("Hide Queue Status Button");
QueueCheckButton.tooltip = "Hide Queue Status Button";
QueueCheckButton:SetScript("OnClick", 
  function()
	if QueueButtonVisable == true then
		QueueStatusButton:Hide()
		QueueButtonVisable = false
	else
		QueueStatusButton:Show()
		QueueButtonVisable = true
	end
  end
);


--[[
QueueDefaultLocationButton = CreateFrame("Button", "QueueDefaultLocationButton_GlobalName", HideMicroMenuPanel, "UIPanelButtonTemplate")
QueueDefaultLocationButton:SetSize(120 ,22) -- width, height
QueueDefaultLocationButton:SetText("Default Location")
QueueDefaultLocationButton:SetPoint("TOPLEFT", 65, -295)
QueueDefaultLocationButton:SetScript("OnClick", function()
    QueueStatusButton:SetPoint("CENTER", WorldFrame, "CENTER", 0, -0)
end)
]]




















