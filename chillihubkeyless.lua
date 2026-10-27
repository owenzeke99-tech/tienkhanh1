-- [[ CHILLI HUB - MODERN RED & BLACK KEY SYSTEM ]] --
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- System Configuration
local KeyFileName = "ChilliHub_KeyCache.txt"
local CorrectKey = "ChilliHubKeyKsowowj - LaVisoaowijepoehsb"
local KeyDuration = 86400 -- 24 hours in seconds (Hidden from UI)

-- Function to execute main script
local function loadMainScript()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()
    end)
    if not success then
        warn("Error loading Chilli Hub script: " .. tostring(err))
    end
end

-- Function to save key cache secretly
local function saveKeyCache(key)
    if writefile then
        local data = {
            Key = key,
            Timestamp = os.time()
        }
        pcall(function()
            writefile(KeyFileName, game:GetService("HttpService"):JSONEncode(data))
        end)
    end
end

-- Function to verify cached key
local function checkKeyCache()
    if readfile and isfile and isfile(KeyFileName) then
        local success, result = pcall(function()
            local data = game:GetService("HttpService"):JSONDecode(readfile(KeyFileName))
            if data and data.Key and data.Timestamp then
                if data.Key == CorrectKey and (os.time() - data.Timestamp) < KeyDuration then
                    return true
                end
            end
        end)
        if success and result then return true end
    end
    return false
end

-- Auto Load if valid key exists in cache
if checkKeyCache() then
    loadMainScript()
    return
end

-- Clean up previous UI
if CoreGui:FindFirstChild("ChilliKeySystemUI") then
    CoreGui.ChilliKeySystemUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ChilliKeySystemUI"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 380, 0, 245)
MainFrame.Position = UDim2.new(0.5, -190, 0.5, -122)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(220, 30, 45)
MainStroke.Thickness = 2
MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
MainStroke.Parent = MainFrame

-- Title Box
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 16)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.FredokaOne
Title.Text = "CHILLI HUB"
Title.TextColor3 = Color3.fromRGB(255, 45, 60)
Title.TextSize = 22
Title.Parent = MainFrame

local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(1, 0, 0, 18)
SubTitle.Position = UDim2.new(0, 0, 0, 52)
SubTitle.BackgroundTransparency = 1
SubTitle.Font = Enum.Font.GothamBold
SubTitle.Text = "KEY VERIFICATION SYSTEM"
SubTitle.TextColor3 = Color3.fromRGB(140, 140, 150)
SubTitle.TextSize = 10
SubTitle.Parent = MainFrame

-- Key Input Box Container
local InputContainer = Instance.new("Frame")
InputContainer.Size = UDim2.new(0, 320, 0, 42)
InputContainer.Position = UDim2.new(0.5, -160, 0, 80)
InputContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
InputContainer.BorderSizePixel = 0
InputContainer.Parent = MainFrame

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 9)
InputCorner.Parent = InputContainer

local InputStroke = Instance.new("UIStroke")
InputStroke.Color = Color3.fromRGB(45, 45, 55)
InputStroke.Thickness = 1
InputStroke.Parent = InputContainer

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(1, -20, 1, 0)
TextBox.Position = UDim2.new(0, 10, 0, 0)
TextBox.BackgroundTransparency = 1
TextBox.Font = Enum.Font.GothamMedium
TextBox.PlaceholderText = "Enter key here..."
TextBox.PlaceholderColor3 = Color3.fromRGB(90, 90, 105)
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 13
TextBox.ClearTextOnFocus = false
TextBox.Parent = InputContainer

-- Modern Status Badge
local StatusContainer = Instance.new("Frame")
StatusContainer.Size = UDim2.new(0, 320, 0, 28)
StatusContainer.Position = UDim2.new(0.5, -160, 0, 130)
StatusContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
StatusContainer.BackgroundTransparency = 0.5
StatusContainer.BorderSizePixel = 0
StatusContainer.Parent = MainFrame

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(0, 7)
StatusCorner.Parent = StatusContainer

local StatusStroke = Instance.new("UIStroke")
StatusStroke.Color = Color3.fromRGB(40, 40, 50)
StatusStroke.Thickness = 1
StatusStroke.Parent = StatusContainer

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -20, 1, 0)
StatusLabel.Position = UDim2.new(0, 10, 0, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Font = Enum.Font.GothamMedium
StatusLabel.Text = "Waiting for input..."
StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 160)
StatusLabel.TextSize = 11
StatusLabel.Parent = StatusContainer

-- Check Key Button
local CheckBtn = Instance.new("TextButton")
CheckBtn.Size = UDim2.new(0, 155, 0, 38)
CheckBtn.Position = UDim2.new(0.5, -160, 0, 172)
CheckBtn.BackgroundColor3 = Color3.fromRGB(200, 30, 45)
CheckBtn.BorderSizePixel = 0
CheckBtn.Font = Enum.Font.GothamBold
CheckBtn.Text = "CHECK KEY"
CheckBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckBtn.TextSize = 13
CheckBtn.AutoButtonColor = true
CheckBtn.Parent = MainFrame

local CheckCorner = Instance.new("UICorner")
CheckCorner.CornerRadius = UDim.new(0, 9)
CheckCorner.Parent = CheckBtn

-- Get Key Button
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0, 155, 0, 38)
GetKeyBtn.Position = UDim2.new(0.5, 5, 0, 172)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
GetKeyBtn.BorderSizePixel = 0
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.Text = "GET KEY"
GetKeyBtn.TextColor3 = Color3.fromRGB(220, 220, 230)
GetKeyBtn.TextSize = 13
GetKeyBtn.AutoButtonColor = true
GetKeyBtn.Parent = MainFrame

local GetCorner = Instance.new("UICorner")
GetCorner.CornerRadius = UDim.new(0, 9)
GetCorner.Parent = GetKeyBtn

local GetStroke = Instance.new("UIStroke")
GetStroke.Color = Color3.fromRGB(50, 50, 65)
GetStroke.Thickness = 1
GetStroke.Parent = GetKeyBtn

-- [[ Smooth Shake Effect ]] --
local function smoothShake()
    local basePos = UDim2.new(0.5, -190, 0.5, -122)
    local offsets = {8, -8, 5, -5, 3, -3, 0}
    local tweenInfo = TweenInfo.new(0.04, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    
    for _, offset in ipairs(offsets) do
        local targetPos = basePos + UDim2.new(0, offset, 0, 0)
        local tween = TweenService:Create(MainFrame, tweenInfo, {Position = targetPos})
        tween:Play()
        tween.Completed:Wait()
    end
end

-- [[ Button Events ]] --

GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard("https://link4m.org/fb7u6F0A")
    StatusLabel.TextColor3 = Color3.fromRGB(80, 230, 130)
    StatusStroke.Color = Color3.fromRGB(40, 120, 70)
    StatusLabel.Text = "Link copied to clipboard!"
end)

CheckBtn.MouseButton1Click:Connect(function()
    local enteredKey = TextBox.Text
    
    if enteredKey == CorrectKey then
        StatusLabel.TextColor3 = Color3.fromRGB(80, 230, 130)
        StatusStroke.Color = Color3.fromRGB(40, 120, 70)
        StatusLabel.Text = "Key Accepted! Loading..."
        
        -- Save Key Hidden Cache
        saveKeyCache(enteredKey)
        
        -- Exit Animation
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 1,
            Size = UDim2.new(0, 360, 0, 225),
            Position = UDim2.new(0.5, -180, 0.5, -112)
        }):Play()
        task.wait(0.35)
        ScreenGui:Destroy()
        
        -- Load main script
        loadMainScript()
    else
        StatusLabel.TextColor3 = Color3.fromRGB(255, 75, 75)
        StatusStroke.Color = Color3.fromRGB(150, 40, 50)
        StatusLabel.Text = "Invalid key! Please try again."
        TextBox.Text = "" -- Clear input automatically
        
        -- Trigger Smooth Shake
        task.spawn(smoothShake)
    end
end)
