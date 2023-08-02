repeat wait() until game.Players.LocalPlayer
repeat wait() until game.Players.LocalPlayer.Character
repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
wait()



-- /////////////////////////         Game List           ////////////////////////
if game.PlaceId == 12986400307 then

    local Lighting = game:GetService("Lighting")
    local RunService = game:GetService("RunService")
    local VirtualUser = game:GetService("VirtualUser")
    local HttpService = game:GetService("HttpService")
    local TweenService = game:GetService("TweenService")
    local TeleportService = game:GetService("TeleportService")
    local UserInputService = game:GetService("UserInputService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local VirtualInputManager = game:GetService("VirtualInputManager")

    local LocalPlayer = game:GetService("Players").LocalPlayer
    local Mouse = LocalPlayer:GetMouse()
    local lastInput = UserInputService:GetLastInputType()
    local requestt = http_request or request or syn.request or HttpPost
    local headers = {
        ["Content-Type"] = "application/json"
    }


    --// GUI
    if not getgenv()["Plasma"] then
        getgenv()["Plasma"] = {}
    end
    if not getgenv()["Golbal"] then
        getgenv()["Golbal"] = {}
    end
    local G_Plasma = getgenv()["Plasma"]
    local G_Golbal = getgenv()["Golbal"]

    local Pass

    if (lastInput == Enum.UserInputType.Keyboard) then    
    	getgenv().PC = true
    else
    	getgenv().PC = false
    end

    -- (PASS OR NOT)
    function Encode(data)
        return HttpService:JSONEncode(data)
    end
    function Decode(data)
        return HttpService:JSONDecode(data)
    end

    local JS = {}
    JS.write = function(pathh,data)
        writefile(pathh,Encode(data))
    end
    JS.read = function(pathh)
        return Decode(readfile(pathh))
    end
    JS.del = function(pathh)
        delfile(pathh)
    end
    JS.check = function(pathh)
        return isfile(pathh)
    end

    function load_player_data(name)
        if isfile(name) then
            local data = JS.read(name)
            for i,v in pairs(data) do
                if G_Plasma[i] then continue end
                G_Plasma[i] = v
            end
        else
            JS.write(name, {})
        end
    end

    function load_golbal_data(name)
        if isfile(name) then
            local data = JS.read(name)
            for i,v in pairs(data) do
                if G_Golbal[i] then continue end
                G_Golbal[i] = v
            end
        else
            JS.write(name, {})
        end
    end

    do local ui = game:GetService("CoreGui"):FindFirstChild("PlasmaHub")  if ui then ui:Destroy() end end
    do local ui = game:GetService("CoreGui"):FindFirstChild("PlasmaHubRightFrame")  if ui then ui:Destroy() end end
    do local ui = game:GetService("CoreGui"):FindFirstChild("PlasmaNotify")  if ui then ui:Destroy() end end
    do local ui = game:GetService("CoreGui"):FindFirstChild("PlasmaHub_mobile")  if ui then ui:Destroy() end end

    local Red = {RainbowColorValue = 0, HueSelectionPosition = 0}

    local Discord_Invite_Code = ""
    _G.Color = Color3.fromRGB(0, 204, 0)
    _G.Color1 = Color3.fromRGB(255,255,255)

    coroutine.wrap(function()
        while wait() do
            Red.RainbowColorValue = Red.RainbowColorValue + 1 / 255
            Red.HueSelectionPosition = Red.HueSelectionPosition + 1
        
            if Red.RainbowColorValue >= 1 then
                Red.RainbowColorValue = 0
            end
        
            if Red.HueSelectionPosition == 160 then
                Red.HueSelectionPosition = 0
            end
        end
    end)()

    local PlasmaCourseScreen = Instance.new("ScreenGui")
    local PlasmaNotify = Instance.new("ScreenGui")
    local PlasmaHubRightFrame = Instance.new("ScreenGui")
    local Plasma_mobile
    local Ui_mobile
    if not getgenv().PC then
        Plasma_mobile = Instance.new("ScreenGui")
    end

    if syn and syn.protect_gui then
        syn.protect_gui(PlasmaCourseScreen)
        syn.protect_gui(PlasmaNotify)
        syn.protect_gui(PlasmaHubRightFrame)
        if not getgenv().PC then
            syn.protect_gui(Plasma_mobile)
        end
    end

    if not getgenv().PC then
        Plasma_mobile.Parent = game:GetService("CoreGui")
        Plasma_mobile.Name = "PlasmaHub_mobile"
        Plasma_mobile.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        Ui_mobile = Instance.new("Frame")
        Ui_mobile.Name = "Ui_mobile"
        Ui_mobile.Size = UDim2.new(0, 50, 0, 50)
        Ui_mobile.AnchorPoint = Vector2.new(0.5, 0.5)
        Ui_mobile.Position = UDim2.new(0, 0, 0, 0)
        Ui_mobile.BackgroundTransparency = 1.000
        Ui_mobile.Parent = Plasma_mobile
        
        local Ui_mobile_img = Instance.new("ImageButton")
        Ui_mobile_img.Parent = Ui_mobile
        Ui_mobile_img.BackgroundTransparency = 1.000
        Ui_mobile_img.BorderSizePixel = 0
        Ui_mobile_img.Position = UDim2.new(0.5, 0, 0.5, 0)
        Ui_mobile_img.AnchorPoint = Vector2.new(0.5, 0.5)
        Ui_mobile_img.Size = UDim2.new(1, 0, 1, 0)
        Ui_mobile_img.Image = "rbxassetid://11390492777"
        Ui_mobile_img.ZIndex = 10

        Ui_mobile_img.Activated:Connect(function()
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.RightControl, false, game)
        end)
    end
    

    PlasmaCourseScreen.Parent = game:GetService("CoreGui")
    PlasmaCourseScreen.Name = "PlasmaHub"
    PlasmaCourseScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling


    PlasmaNotify.Parent = game:GetService("CoreGui")
    PlasmaNotify.Name = "PlasmaNotify"
    PlasmaNotify.ZIndexBehavior = Enum.ZIndexBehavior.Sibling


    PlasmaHubRightFrame.Parent = game:GetService("CoreGui")
    PlasmaHubRightFrame.Name = "PlasmaHubRightFrame"
    PlasmaHubRightFrame.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    PlasmaHubRightFrame.Enabled = false

    local UiToggle = Instance.new("Frame")

    UiToggle.Name = "UI_TOGGLE"
    UiToggle.Parent = PlasmaHubRightFrame
    UiToggle.AnchorPoint = Vector2.new(0.5, 0)
    UiToggle.BackgroundColor3 = Color3.fromRGB(32,32,32)
    UiToggle.BackgroundTransparency = 0
    UiToggle.BorderColor3 = _G.Color
    UiToggle.BorderSizePixel = 0
    UiToggle.ClipsDescendants = true
    UiToggle.Position = UDim2.new(0.75, 0, 0, 0)
    UiToggle.Size = UDim2.new(0, 170, 0, 50)

    local UiToggle_UiConner1 = Instance.new("UICorner")

    UiToggle_UiConner1.CornerRadius = UDim.new(0, 3)
    UiToggle_UiConner1.Name = "UiToggle_UiConner1"
    UiToggle_UiConner1.Parent = UiToggle

    local UiToggle_UiStroke1 = Instance.new("UIStroke")

    UiToggle_UiStroke1.Color = Color3.fromRGB(153, 204, 255)
    UiToggle_UiStroke1.Thickness = 2
    UiToggle_UiStroke1.Name = "UiToggle_UiStroke1"
    UiToggle_UiStroke1.Parent = UiToggle

    local UiToggleminiFrame = Instance.new("Frame")

    UiToggleminiFrame.Name = "UiToggleminiFrame"
    UiToggleminiFrame.Parent = UiToggle
    UiToggleminiFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    UiToggleminiFrame.BackgroundColor3 = _G.Color
    UiToggleminiFrame.BackgroundTransparency = 0
    UiToggleminiFrame.BorderColor3 = _G.Color
    UiToggleminiFrame.BorderSizePixel = 0
    UiToggleminiFrame.ClipsDescendants = true
    UiToggleminiFrame.Position = UDim2.new(0.01, 0, 0.5, 0)
    UiToggleminiFrame.Size = UDim2.new(0, 4, 0, 60)

    local UiToggleminiFrame_UiConner1 = Instance.new("UICorner")

    UiToggleminiFrame_UiConner1.CornerRadius = UDim.new(0, 9)
    UiToggleminiFrame_UiConner1.Name = "UiToggleminiFrame_UiConner1"
    UiToggleminiFrame_UiConner1.Parent = UiToggleminiFrame

    local TitleUiToggle = Instance.new("TextLabel")

    TitleUiToggle.Parent = UiToggle
    TitleUiToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleUiToggle.BackgroundTransparency = 1
    TitleUiToggle.BorderSizePixel = 0
    TitleUiToggle.Position = UDim2.new(0.6, 0, 0.5, 0)
    TitleUiToggle.AnchorPoint = Vector2.new(0.5, 0.5)
    TitleUiToggle.Size = UDim2.new(0, 30,0, 23)
    TitleUiToggle.Font = Enum.Font.GothamBold
    TitleUiToggle.Text = "Ui Toggle :\nRight Control"
    TitleUiToggle.TextColor3 = _G.Color1
    TitleUiToggle.TextSize = 11.000
    TitleUiToggle.TextXAlignment = Enum.TextXAlignment.Center

    local UiToggleImage = Instance.new("ImageLabel")
    UiToggleImage.Parent = UiToggle
    UiToggleImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    UiToggleImage.BackgroundTransparency = 1
    UiToggleImage.Position = UDim2.new(0.101, 0, 0.15, 0)
    UiToggleImage.Size = UDim2.new(0, 35, 0, 35)
    UiToggleImage.Image = "https://www.roblox.com/asset/?id=11390492777"

    local lib = {toggledui = false;}
    game:GetService("UserInputService").InputBegan:Connect(function(input)
        pcall(function()
            if input.KeyCode == Enum.KeyCode.RightControl then
                if lib.toggledui == false then
                    lib.toggledui = true
                    wait(.5)
                    TweenService:Create(UiToggle,TweenInfo.new(0.5,Enum.EasingStyle.Back),{Size = UDim2.new(0, 170, 0, 50)}):Play()
                    PlasmaHubRightFrame.Enabled = true
                else
                    lib.toggledui = false
                    TweenService:Create(UiToggle,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Size = UDim2.new(0, 0, 0, 0)}):Play()
                    wait(.5)
                    PlasmaHubRightFrame.Enabled = false
                end
            end
        end)
    end)

    local function MakeDraggable(topbarobject, object)
        local Dragging = nil
        local DragInput = nil
        local DragStart = nil
        local StartPosition = nil

        local function Update(input)
            local Delta = input.Position - DragStart
            local pos =
                UDim2.new(
                StartPosition.X.Scale,
                StartPosition.X.Offset + Delta.X,
                StartPosition.Y.Scale,
                StartPosition.Y.Offset + Delta.Y
            )
            local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
            Tween:Play()
        end

        topbarobject.InputBegan:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    Dragging = true
                    DragStart = input.Position
                    StartPosition = object.Position

                    input.Changed:Connect(
                        function()
                            if input.UserInputState == Enum.UserInputState.End then
                                Dragging = false
                            end
                        end
                    )
                end
            end
        )

        topbarobject.InputChanged:Connect(
            function(input)
                if
                    input.UserInputType == Enum.UserInputType.MouseMovement or
                        input.UserInputType == Enum.UserInputType.Touch
                then
                    DragInput = input
                end
            end
        )

        UserInputService.InputChanged:Connect(
            function(input)
                if input == DragInput and Dragging then
                    Update(input)
                end
            end
        )
    end

    local function Tween(instance, properties,style,wa)
        if style == nil or "" then
            return Back
        end
        TweenService:Create(instance,TweenInfo.new(wa,Enum.EasingStyle[style]),{properties}):Play()
    end

    local create = {}
    function create:Win(text,logo)
        local fs = false

        local MainFrame = Instance.new("Frame")
        MainFrame.Name = "MainFrame"
        MainFrame.Parent = PlasmaCourseScreen
        MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        MainFrame.BackgroundColor3 = Color3.fromRGB(32,32,32)
        MainFrame.BorderSizePixel = 0
        MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        MainFrame.Size = UDim2.new(0, 0, 0, 0)
        MainFrame.ClipsDescendants = true

        local Main_UiConner = Instance.new("UICorner")

        Main_UiConner.CornerRadius = UDim.new(0, 8)
        Main_UiConner.Name = "Main_UiConner"
        Main_UiConner.Parent = MainFrame

        local Main_UiStroke = Instance.new("UIStroke")

        Main_UiStroke.Color = Color3.fromRGB(255, 255, 255)
        Main_UiStroke.Thickness = 1
        Main_UiStroke.Name = "Main_UiConner"
        Main_UiStroke.Parent = MainFrame

        local TimeGlobal = Instance.new("TextLabel")

        TimeGlobal.Name = "TimeGlobal"
        TimeGlobal.Parent = MainFrame
        TimeGlobal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TimeGlobal.Position = UDim2.new(0.84, 0, 0.95, 0)
        TimeGlobal.Size = UDim2.new(0, 95, 0, 39)
        TimeGlobal.BackgroundTransparency = 1
        TimeGlobal.ZIndex = 3
        TimeGlobal.Font = Enum.Font.GothamBold
        TimeGlobal.Text = "N/A"
        TimeGlobal.TextColor3 = Color3.fromRGB(255, 255, 255)
        TimeGlobal.TextSize = 19.000
        TimeGlobal.TextXAlignment = Enum.TextXAlignment.Left

        spawn(function()
            while wait() do
                TimeGlobal.Text = ""..os.date("%H")..":"..os.date("%M")..":"..os.date("%S")
            end
        end)

        local NameOfGame = Instance.new("TextLabel")
        local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

        NameOfGame.Name = "NameOfGame"
        NameOfGame.Parent = MainFrame
        NameOfGame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NameOfGame.Position = UDim2.new(0.03, 0, 0.95, 0)
        NameOfGame.Size = UDim2.new(0, 95, 0, 39)
        NameOfGame.BackgroundTransparency = 1
        NameOfGame.ZIndex = 3
        NameOfGame.Font = Enum.Font.GothamBold
        NameOfGame.Text = GameName
        NameOfGame.TextColor3 = Color3.fromRGB(255, 255, 255)
        NameOfGame.TextSize = 14.000
        NameOfGame.TextXAlignment = Enum.TextXAlignment.Left

        local ClickFrame = Instance.new("Frame")
        ClickFrame.Name = "ClickFrame"
        ClickFrame.Parent = MainFrame
        ClickFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        ClickFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
        ClickFrame.BorderSizePixel = 0
        ClickFrame.Position = UDim2.new(0.059, 0, 0.043, 0)
        ClickFrame.Size = UDim2.new(0, 1200, 0, 50)
        ClickFrame.ClipsDescendants = true
        ClickFrame.BackgroundTransparency = 1

        local MainFrame1 = Instance.new("Frame")
        MainFrame1.Name = "MainFrame1"
        MainFrame1.Parent = MainFrame
        MainFrame1.AnchorPoint = Vector2.new(0.5, 0.5)
        MainFrame1.BackgroundColor3 = Color3.fromRGB(32,32,32)
        MainFrame1.BorderSizePixel = 0
        MainFrame1.Position = UDim2.new(0.5, 0, 0.19, 0)
        MainFrame1.Size = UDim2.new(0, 0, 0, 0)
        MainFrame1.ClipsDescendants = true

        local Main_UiConner1 = Instance.new("UICorner")

        Main_UiConner1.CornerRadius = UDim.new(0, 9)
        Main_UiConner1.Name = "Main_UiConner"
        Main_UiConner1.Parent = MainFrame1

        local Main_UiStroke1 = Instance.new("UIStroke")

        Main_UiStroke1.Color = Color3.fromRGB(255, 255, 255)
        Main_UiStroke1.Thickness = 1.8
        Main_UiStroke1.Name = "Main_UiConner"
        Main_UiStroke1.Parent = MainFrame1

        local miniFrame = Instance.new("Frame")
        miniFrame.Name = "miniFrame"
        miniFrame.Parent = MainFrame1
        miniFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        miniFrame.BackgroundColor3 = _G.Color
        miniFrame.BorderSizePixel = 0
        miniFrame.Position = UDim2.new(0.08, 0, 0.39, 0)
        miniFrame.Size = UDim2.new(0, 5,0, 70)
        miniFrame.ClipsDescendants = true

        local miniFrame_UiConner1 = Instance.new("UICorner")

        miniFrame_UiConner1.CornerRadius = UDim.new(5, 0)
        miniFrame_UiConner1.Name = "miniFrame_UiConner"
        miniFrame_UiConner1.Parent = miniFrame

        local Welcometo = Instance.new("TextLabel")

        Welcometo.Parent = MainFrame1
        Welcometo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Welcometo.BackgroundTransparency = 1
        Welcometo.BorderSizePixel = 0
        Welcometo.Position = UDim2.new(0.19, 0, 0.2, 0)
        Welcometo.AnchorPoint = Vector2.new(0.5, 0.5)
        Welcometo.Size = UDim2.new(0, 168,0, 23)
        Welcometo.Font = Enum.Font.GothamBold
        Welcometo.Text = "Welcome to"
        Welcometo.TextColor3 = Color3.fromRGB(255, 255, 255)
        Welcometo.TextSize = 17.000

        local NameReal2 = Instance.new("TextLabel")

        NameReal2.Parent = MainFrame1
        NameReal2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NameReal2.BackgroundTransparency = 1
        NameReal2.BorderSizePixel = 0
        NameReal2.Position = UDim2.new(0.225, 0, 0.38, 0)
        NameReal2.AnchorPoint = Vector2.new(0.5, 0.5)
        NameReal2.Size = UDim2.new(0, 134,0, 23)
        NameReal2.Font = Enum.Font.GothamBold
        NameReal2.RichText = true
        NameReal2.Text = text.."<font color=\"rgb(".. math.floor(_G.Color1.R * 255) .. "," .. math.floor(_G.Color1.G * 255) .. ",".. math.floor(_G.Color1.B * 255) ..")\"> HUB</font>"
        NameReal2.TextColor3 = _G.Color
        NameReal2.TextSize = 35.000
        NameReal2.TextXAlignment = Enum.TextXAlignment.Left

        -- local Hub2 = Instance.new("TextLabel")

        -- Hub2.Parent = MainFrame1
        -- Hub2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        -- Hub2.BackgroundTransparency = 1
        -- Hub2.BorderSizePixel = 0
        -- Hub2.Position = UDim2.new(0.47, 0, 0.38, 0)
        -- Hub2.AnchorPoint = Vector2.new(0.5, 0.5)
        -- Hub2.Size = UDim2.new(0, 134,0, 23)
        -- Hub2.Font = Enum.Font.GothamBold
        -- Hub2.Text = "HUB"
        -- Hub2.TextColor3 = Color3.fromRGB(255, 255, 255)
        -- Hub2.TextSize = 30.000
        -- Hub2.TextXAlignment = Enum.TextXAlignment.Left

        local ImageLogo = Instance.new("ImageLabel")

        ImageLogo.Parent = MainFrame1
        ImageLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLogo.BackgroundTransparency = 1
        ImageLogo.AnchorPoint = Vector2.new(0.5, 0.5)
        ImageLogo.Position = UDim2.new(0.8, 0,0.5, 0)
        ImageLogo.Size = UDim2.new(0, 100,0, 100)
        ImageLogo.Image = "https://www.roblox.com/asset/?id=" .. logo

        local FrameJoinDis = Instance.new("Frame")
        FrameJoinDis.Name = "FrameJoinDis"
        FrameJoinDis.Parent = MainFrame1
        FrameJoinDis.AnchorPoint = Vector2.new(0.5, 0.5)
        FrameJoinDis.BackgroundColor3 = _G.Color
        FrameJoinDis.BorderSizePixel = 0
        FrameJoinDis.Position = UDim2.new(0.24, 0, 0.69, 0)
        FrameJoinDis.Size = UDim2.new(0, 150,0, 30)
        FrameJoinDis.ClipsDescendants = true

        local FrameJoinDis1 = Instance.new("Frame")
        FrameJoinDis1.Name = "FrameJoinDis"
        FrameJoinDis1.Parent = MainFrame1
        FrameJoinDis1.AnchorPoint = Vector2.new(0.5, 0.5)
        FrameJoinDis1.BackgroundColor3 = Color3.fromRGB(32,32,32)
        FrameJoinDis1.BorderSizePixel = 0
        FrameJoinDis1.Position = UDim2.new(0.24, 0, 0.69, 0)
        FrameJoinDis1.Size = UDim2.new(0, 148,0, 28)
        FrameJoinDis1.ClipsDescendants = true

        local FrameJoinDis_UiConner1 = Instance.new("UICorner")
        FrameJoinDis_UiConner1.CornerRadius = UDim.new(0, 8)
        FrameJoinDis_UiConner1.Name = "FrameJoinDis_UiConner1"
        FrameJoinDis_UiConner1.Parent = FrameJoinDis

        local FrameJoinDis_UiConner2 = Instance.new("UICorner")
        FrameJoinDis_UiConner2.CornerRadius = UDim.new(0, 8)
        FrameJoinDis_UiConner2.Name = "FrameJoinDis_UiConner1"
        FrameJoinDis_UiConner2.Parent = FrameJoinDis1

        local JoinDiscord = Instance.new("TextButton")

        JoinDiscord.Parent = FrameJoinDis1
        JoinDiscord.Name = "JoinDiscord"
        JoinDiscord.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        JoinDiscord.BackgroundTransparency = 1
        JoinDiscord.Position = UDim2.new(0,0.5,0,0.8)
        JoinDiscord.Size = UDim2.new(0, 148,0, 28)
        JoinDiscord.Font = Enum.Font.GothamBold
        JoinDiscord.TextColor3 = _G.Color
        JoinDiscord.TextSize = 16.000
        JoinDiscord.Text = "Join Discord"

        JoinDiscord.MouseButton1Click:Connect(function()
            local filename1 = "NoAutoJoinDiscord.txt";
            requestt({
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["Origin"] = "https://discord.com"
                },
                Body = HttpService:JSONEncode({
                    cmd = "INVITE_BROWSER",
                    args = {
                        code = Discord_Invite_Code
                    },
                    nonce = HttpService:GenerateGUID(false)
                }),
            })
        end)

        MakeDraggable(ClickFrame,MainFrame,MainFrame1)
        TweenService:Create(MainFrame1,TweenInfo.new(0.4,Enum.EasingStyle.Back),{Size = UDim2.new(0, 530, 0, 128)}):Play()
        TweenService:Create(MainFrame,TweenInfo.new(0.4,Enum.EasingStyle.Back),{Size = UDim2.new(0, 550, 0, 654)}):Play()

        local library = {toggledui = false;}
        game:GetService("UserInputService").InputBegan:Connect(function(input)
            pcall(function()
                if input.KeyCode == Enum.KeyCode.RightControl then
                    if library.toggledui == false then
                        library.toggledui = true
                        TweenService:Create(MainFrame,TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Size = UDim2.new(0, 0, 0, 0)}):Play()
                        wait(.3)
                        PlasmaCourseScreen.Enabled = false
                    else
                        library.toggledui = false
                        TweenService:Create(MainFrame,TweenInfo.new(0.4,Enum.EasingStyle.Back),{Size = UDim2.new(0, 550, 0, 654)}):Play()
                        PlasmaCourseScreen.Enabled = true
                    end
                end
            end)
        end)

        local imageclickframe = Instance.new("ImageLabel")

        imageclickframe.Parent = ClickFrame
        imageclickframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        imageclickframe.BackgroundTransparency = 1.000
        imageclickframe.AnchorPoint = Vector2.new(0.5, 0.5)
        imageclickframe.Position = UDim2.new(0.5, 0, 0.5, 0)
        imageclickframe.Size = UDim2.new(0, 30, 0, 30)
        imageclickframe.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. LocalPlayer.UserId .. "&width=420&height=420&format=png"

        local NameReal = Instance.new("TextLabel")
        NameReal.Parent = MainFrame
        NameReal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NameReal.BackgroundTransparency = 1
        NameReal.BorderSizePixel = 3
        NameReal.Position = UDim2.new(0.25, 0, 0.043, 0)
        NameReal.AnchorPoint = Vector2.new(0.5, 0.5)
        NameReal.Size = UDim2.new(0, 142, 0, 34)
        NameReal.Font = Enum.Font.GothamBold
        NameReal.RichText = true
        NameReal.Text = text.."<font color=\"rgb(".. math.floor(_G.Color1.R * 255) .. "," .. math.floor(_G.Color1.G * 255) .. ",".. math.floor(_G.Color1.B * 255) ..")\"> HUB</font>"
        NameReal.TextColor3 = _G.Color
        NameReal.TextSize = 26.000
        NameReal.TextXAlignment = Enum.TextXAlignment.Left

        local MainFrame2 = Instance.new("Frame")
        MainFrame2.Name = "MainFrame2"
        MainFrame2.Parent = MainFrame
        MainFrame2.AnchorPoint = Vector2.new(0.5, 0.5)
        MainFrame2.BackgroundColor3 = Color3.fromRGB(18,18,18)
        MainFrame2.BorderSizePixel = 0
        MainFrame2.Position = UDim2.new(0.5, 0, 0.5, 0)
        MainFrame2.Size = UDim2.new(0, 0, 0, 0)
        MainFrame2.ClipsDescendants = true

        local Main_UiConner2  = Instance.new("UICorner")

        Main_UiConner2.CornerRadius = UDim.new(0, 9)
        Main_UiConner2.Name = "Main_UiConner"
        Main_UiConner2.Parent = MainFrame

        MainFrame2:TweenSizeAndPosition(UDim2.new(0, 550-20, 0, 474-50), UDim2.new(0.5, 0, 0.63, 0), "Out", "Back", 0.5, true)


        local ScolTapBarFrame = Instance.new("Frame")
        ScolTapBarFrame.Name = "ScolTapBarFrameMainFrame2"
        ScolTapBarFrame.Parent = MainFrame2
        ScolTapBarFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        ScolTapBarFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
        ScolTapBarFrame.BorderSizePixel = 0
        ScolTapBarFrame.BackgroundTransparency = 1
        ScolTapBarFrame.Position = UDim2.new(0.5, 0, 0.07, 0)
        ScolTapBarFrame.Size = UDim2.new(0, 500, 0, 35)
        ScolTapBarFrame.ClipsDescendants = true

        local ScrollingFrame_Menubar = Instance.new("ScrollingFrame")

        ScrollingFrame_Menubar.Parent = ScolTapBarFrame
        ScrollingFrame_Menubar.Active = true
        ScrollingFrame_Menubar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ScrollingFrame_Menubar.BackgroundTransparency = 1
        ScrollingFrame_Menubar.BorderSizePixel = 0
        ScrollingFrame_Menubar.Size = UDim2.new(0, 500, 0, 35)
        ScrollingFrame_Menubar.CanvasSize = UDim2.new(2, 0, 0, 0)
        ScrollingFrame_Menubar.ScrollBarImageColor3 = _G.Color
        ScrollingFrame_Menubar.ScrollBarThickness = 3


        local UIListLayout_Menubar = Instance.new("UIListLayout")

        UIListLayout_Menubar.Parent = ScrollingFrame_Menubar
        UIListLayout_Menubar.FillDirection = Enum.FillDirection.Horizontal
        UIListLayout_Menubar.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_Menubar.Padding = UDim.new(0, 10)

        local UIPadding_Menubar = Instance.new("UIPadding")

        UIPadding_Menubar.Parent = ScrollingFrame_Menubar
        UIPadding_Menubar.PaddingTop = UDim.new(0, 2)


        local PageOrders = -1

        local Container_Page = Instance.new('Frame',MainFrame2)
        Container_Page.Size = UDim2.new(0, 518, 0, 268)
        Container_Page.Position = UDim2.new(0.5, 0, 0.45, 0)
        Container_Page.BackgroundTransparency = 1
        Container_Page.Name = "Page "
        Container_Page.AnchorPoint = Vector2.new(0.5, 0.5)

        local pagesFolder = Instance.new("Folder")

        pagesFolder.Name = "pagesFolder"
        pagesFolder.Parent = Container_Page


        local UIPage = Instance.new('UIPageLayout',pagesFolder)
        UIPage.SortOrder = Enum.SortOrder.LayoutOrder
        UIPage.EasingDirection = Enum.EasingDirection.InOut
        UIPage.EasingStyle = Enum.EasingStyle.Quad
        UIPage.Padding = UDim.new(0, 10)
        UIPage.TweenTime = 0.500

        local top = {}

        local NotiFrame = Instance.new("Frame")
        NotiFrame.Name = "NotiFrame"
        NotiFrame.Parent = PlasmaNotify
        NotiFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        NotiFrame.BackgroundColor3 = Color3.fromRGB(18,18,18)
        NotiFrame.BorderSizePixel = 0
        NotiFrame.Position =  UDim2.new(1, -210, 1, -500)
        NotiFrame.Size = UDim2.new(0, 400, 0, 500)
        NotiFrame.ClipsDescendants = true
        NotiFrame.BackgroundTransparency = 1


        local Notilistlayout = Instance.new("UIListLayout")
        Notilistlayout.Parent = NotiFrame
        Notilistlayout.SortOrder = Enum.SortOrder.LayoutOrder
        Notilistlayout.Padding = UDim.new(0, 5)


        function create:Notify(title,text,delays)
            local TitleFrame = Instance.new("Frame")
            TitleFrame.Name = "TitleFrame"
            TitleFrame.Parent = NotiFrame
            TitleFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            TitleFrame.BackgroundColor3 = Color3.fromRGB(18,18,18)
            TitleFrame.BorderSizePixel = 0
            TitleFrame.Position =  UDim2.new(0.5, 0, 0.5,0)
            TitleFrame.Size = UDim2.new(0, 0, 0, 0)
            TitleFrame.ClipsDescendants = true
            TitleFrame.BackgroundTransparency = 0

            local ConnerTitile = Instance.new("UICorner")

            ConnerTitile.CornerRadius = UDim.new(0, 4)
            ConnerTitile.Name = ""
            ConnerTitile.Parent = TitleFrame

            TitleFrame:TweenSizeAndPosition(UDim2.new(0, 400-10, 0, 70),  UDim2.new(0.5, 0, 0.5,0), "Out", "Quad", 0.3, true)

            local imagenoti = Instance.new("ImageLabel")

            imagenoti.Parent = TitleFrame
            imagenoti.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            imagenoti.BackgroundTransparency = 1.000
            imagenoti.AnchorPoint = Vector2.new(0.5, 0.5)
            imagenoti.Position = UDim2.new(0.9, 0, 0.5, 0)
            imagenoti.Size = UDim2.new(0, 50, 0, 50)
            imagenoti.Image = "https://www.roblox.com/asset/?id=" .. logo

            local txdlid = Instance.new("TextLabel")

            txdlid.Parent = TitleFrame
            txdlid.Name = "TextLabel_Tap"
            txdlid.BackgroundColor3 = _G.Color
            txdlid.Size =UDim2.new(0, 160, 0,25 )
            txdlid.Font = Enum.Font.GothamBold
            txdlid.Text = title
            txdlid.TextColor3 = _G.Color
            txdlid.TextSize = 20.000
            txdlid.AnchorPoint = Vector2.new(0.5, 0.5)
            txdlid.Position = UDim2.new(0.23, 0, 0.3, 0)
            -- txdlid.TextYAlignment = Enum.TextYAlignment.Top
            txdlid.TextXAlignment = Enum.TextXAlignment.Left
            txdlid.BackgroundTransparency = 1

            local LableFrame = Instance.new("Frame")
            LableFrame.Name = "LableFrame"
            LableFrame.Parent = TitleFrame
            LableFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            LableFrame.BackgroundColor3 = _G.Color
            LableFrame.BorderSizePixel = 0
            LableFrame.Position =  UDim2.new(0.36, 0, 0.67,0)
            LableFrame.Size = UDim2.new(0, 260, 0,25 )
            LableFrame.ClipsDescendants = true
            LableFrame.BackgroundTransparency = 1

            local TextNoti = Instance.new("TextLabel")

            TextNoti.Parent = LableFrame
            TextNoti.Name = "TextLabel_Tap"
            TextNoti.BackgroundColor3 = _G.Color
            TextNoti.Size =UDim2.new(0, 260, 0,25 )
            TextNoti.Font = Enum.Font.GothamBold
            TextNoti.Text = text
            TextNoti.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextNoti.TextSize = 13.000
            TextNoti.AnchorPoint = Vector2.new(0.5, 0.5)
            TextNoti.Position = UDim2.new(0.5, 0, 0.5, 0)
            -- TextNoti.TextYAlignment = Enum.TextYAlignment.Top
            TextNoti.TextXAlignment = Enum.TextXAlignment.Left
            TextNoti.BackgroundTransparency = 1

            repeat wait() until TitleFrame.Size == UDim2.new(0, 400-10, 0, 70)

            local Time = Instance.new("Frame")
            Time.Name = "Time"
            Time.Parent = TitleFrame
    --Time.AnchorPoint = Vector2.new(0.5, 0.5)
            Time.BackgroundColor3 =  _G.Color
            Time.BorderSizePixel = 0
            Time.Position =  UDim2.new(0, 0, 0.,0)
            Time.Size = UDim2.new(0, 0,0,0)
            Time.ClipsDescendants = false
            Time.BackgroundTransparency = 0

            local ConnerTitile_Time = Instance.new("UICorner")

            ConnerTitile_Time.CornerRadius = UDim.new(0, 4)
            ConnerTitile_Time.Name = ""
            ConnerTitile_Time.Parent = Time


            Time:TweenSizeAndPosition(UDim2.new(0, 400-10, 0, 3),  UDim2.new(0., 0, 0.,0), "Out", "Quad", 0.3, true)
            repeat wait() until Time.Size == UDim2.new(0, 400-10, 0, 3)

            TweenService:Create(
                Time,
                TweenInfo.new(tonumber(delays), Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
                {Size = UDim2.new(0, 0, 0, 3)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            delay(tonumber(delays),function()
                TweenService:Create(
                    TitleFrame,
                    TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
                    {Size = UDim2.new(0, 0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                wait(0.3)
                TitleFrame:Destroy()
            end
        )
        end


        function top:Taps(text)
            PageOrders = PageOrders + 1
            local name = tostring(text) or tostring(math.random(1,5000))

            local Frame_Tap = Instance.new("Frame")
            Frame_Tap.Parent = ScrollingFrame_Menubar
            Frame_Tap.Name = text.."Server"
            Frame_Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Frame_Tap.BackgroundTransparency = 1
            Frame_Tap.Position = UDim2.new(0.0, 0, 0.0, 0)
            Frame_Tap.Size = UDim2.new(0, 100, 0, 25)
            Frame_Tap.Visible = true

            local TextLabel_Tap = Instance.new("TextLabel")

            TextLabel_Tap.Parent = Frame_Tap
            TextLabel_Tap.Name = "TextLabel_Tap"
            TextLabel_Tap.BackgroundColor3 = _G.Color
            TextLabel_Tap.Position = UDim2.new(0.5, 0, 0.8, 0)
            TextLabel_Tap.Size = UDim2.new(0, 0, 0, 0)
            TextLabel_Tap.Font = Enum.Font.SourceSans
            TextLabel_Tap.Text = " "
            TextLabel_Tap.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextLabel_Tap.TextSize = 14.000
            TextLabel_Tap.AnchorPoint = Vector2.new(0.5, 0.5)

            local TextButton_Tap = Instance.new("TextButton")

            TextButton_Tap.Parent = Frame_Tap
            TextButton_Tap.Name = "TextButton_Tap"
            TextButton_Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextButton_Tap.BackgroundTransparency = 1.000
            TextButton_Tap.Position = UDim2.new(0.114491031, 0, -0.0216345787, 0)
            TextButton_Tap.Size = UDim2.new(0, 80, 0, 20)
            TextButton_Tap.Font = Enum.Font.GothamBold
            TextButton_Tap.TextColor3 = Color3.fromRGB(155, 155, 155)
            TextButton_Tap.TextSize = 13.000
            TextButton_Tap.Text = tostring(text)

            local MainPage = Instance.new("Frame")

            MainPage.Name = name.."_MainPage"
            MainPage.Parent = pagesFolder
            MainPage.BackgroundColor3 = Color3.fromRGB(255,255, 255)
            MainPage.BorderSizePixel = 0
            MainPage.Position = UDim2.new(0.5, 0, 0.5, 0) -- UDim2.new(0.0149812736, 0, 0.13, 0)
            MainPage.Size = UDim2.new(0, 518, 0, 375)
            MainPage.BackgroundTransparency = 1
            MainPage.ClipsDescendants = true
            MainPage.Visible = true
            MainPage.LayoutOrder = PageOrders




            TextButton_Tap.MouseButton1Click:connect(function()
                if MainPage.Name == text.."_MainPage" then
                    UIPage:JumpToIndex(MainPage.LayoutOrder)

                end
                for i ,v in next , ScrollingFrame_Menubar:GetChildren() do
                    if v:IsA("Frame") then
                        TweenService:Create(
                            v.TextButton_Tap,
                            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(155, 155, 155)}
                        ):Play()
                    end

                    TweenService:Create(
                        TextButton_Tap,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = _G.Color}
                    ):Play()
                end
            end)

            if fs == false then
                -- TweenService:Create(
                --     TextLabel_Tap,
                --     TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                --     {Size = UDim2.new(0, 70, 0, 2)}
                -- ):Play()
                TweenService:Create(
                    TextButton_Tap,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = _G.Color}
                ):Play()

                MainPage.Visible = true
                Frame_Tap.Name  = text .. "Server"
                fs  = true
            end
            local ScrollingFrame_Pagefrist = Instance.new("ScrollingFrame")

            ScrollingFrame_Pagefrist.Parent = MainPage
            ScrollingFrame_Pagefrist.Active = true
            ScrollingFrame_Pagefrist.BackgroundColor3 = Color3.fromRGB(23, 23, 23) -- 0, 128, 255
            ScrollingFrame_Pagefrist.BorderSizePixel = 0
            ScrollingFrame_Pagefrist.Size = UDim2.new(0, 518, 0, 375)
            ScrollingFrame_Pagefrist.ScrollBarThickness = 4
            ScrollingFrame_Pagefrist.ScrollBarImageColor3 = _G.Color -- 0, 128, 255

            local UIGridLayout_Pagefrist = Instance.new("UIGridLayout")
            local UIPadding_Pagefrist = Instance.new("UIPadding")

            UIGridLayout_Pagefrist.Archivable = false
            UIGridLayout_Pagefrist.Parent = ScrollingFrame_Pagefrist
            UIGridLayout_Pagefrist.SortOrder = Enum.SortOrder.LayoutOrder
            UIGridLayout_Pagefrist.CellPadding = UDim2.new(0, 13, 0, 15)
            UIGridLayout_Pagefrist.CellSize = UDim2.new(0, 240, 0, 370)

            UIPadding_Pagefrist.Parent = ScrollingFrame_Pagefrist
            UIPadding_Pagefrist.PaddingLeft = UDim.new(0, 10)
            UIPadding_Pagefrist.PaddingTop = UDim.new(0, 20)

            local page = {}

            function page:newpage()

                local Pageframe = Instance.new("Frame")
                Pageframe.Parent = ScrollingFrame_Pagefrist
                Pageframe.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                Pageframe.BorderSizePixel = 0
                Pageframe.Position = UDim2.new(0.028957529, 0, 0.0496277921, 0)
                Pageframe.Size = UDim2.new(0, 240, 0, 379)


                local ScrollingFrame_Pageframe = Instance.new("ScrollingFrame")


                ScrollingFrame_Pageframe.Parent = Pageframe
                ScrollingFrame_Pageframe.Active = true
                ScrollingFrame_Pageframe.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                ScrollingFrame_Pageframe.BorderSizePixel = 0
                ScrollingFrame_Pageframe.Position = UDim2.new(0, 0, -0.0101253344, 0)
                ScrollingFrame_Pageframe.Size = UDim2.new(0, 240, 0, 379)
                ScrollingFrame_Pageframe.ScrollBarThickness = 4
                ScrollingFrame_Pageframe.ScrollBarImageColor3 = Color3.fromRGB(222, 222, 222)



                local UIPadding_Pageframe = Instance.new("UIPadding")
                local UIListLayout_Pageframe = Instance.new("UIListLayout")


                UIPadding_Pageframe.Parent = ScrollingFrame_Pageframe
                UIPadding_Pageframe.PaddingLeft = UDim.new(0, 15)
                UIPadding_Pageframe.PaddingTop = UDim.new(0, 10)


                UIListLayout_Pageframe.Parent = ScrollingFrame_Pageframe
                UIListLayout_Pageframe.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_Pageframe.Padding = UDim.new(0, 7)

                UIListLayout_Pageframe:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
                    ScrollingFrame_Pageframe.CanvasSize = UDim2.new(0,0,0,UIListLayout_Pageframe.AbsoluteContentSize.Y + 120 )
                end)

                UIGridLayout_Pagefrist:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
                    ScrollingFrame_Pagefrist.CanvasSize = UDim2.new(0,0,0,UIGridLayout_Pagefrist.AbsoluteContentSize.Y + 50 )
                end)

                game:GetService("RunService").Stepped:Connect(function ()
                    pcall(function ()
                        ScrollingFrame_Menubar.CanvasSize = UDim2.new(0,  UIListLayout_Menubar.AbsoluteContentSize.X, 0,0)
                        ScrollingFrame_Pageframe.CanvasSize = UDim2.new(0,0,0,UIListLayout_Pageframe.AbsoluteContentSize.Y +20 )
                        ScrollingFrame_Pagefrist.CanvasSize = UDim2.new(0,0,0,UIGridLayout_Pagefrist.AbsoluteContentSize.Y + 40)
                    end)
                end)
            local items = {}

            function items:Toggle(text,config,callback)
                local Toggle = Instance.new("Frame")

                Toggle.Parent = ScrollingFrame_Pageframe
                Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Toggle.BorderSizePixel = 0
                Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
                Toggle.Size = UDim2.new(0, 213, 0, 35)
                Toggle.BackgroundTransparency = 1
                Toggle.AnchorPoint = Vector2.new(0.5, 0.5)

                local TextButton_Toggle = Instance.new("TextButton")

                TextButton_Toggle.Parent = Toggle
                TextButton_Toggle.BackgroundTransparency = 1
                TextButton_Toggle.BackgroundColor3 = Color3.fromRGB(60,60,60)
                TextButton_Toggle.BorderSizePixel = 0
                TextButton_Toggle.Size = UDim2.new(0, 213, 0, 35)
                TextButton_Toggle.AutoButtonColor = false
                TextButton_Toggle.Font = Enum.Font.SourceSans
                TextButton_Toggle.Text = " "
                TextButton_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
                TextButton_Toggle.TextSize = 12.000

                local TextButton_2_Toggle = Instance.new("TextButton")

                TextButton_2_Toggle.Parent = TextButton_Toggle
                TextButton_2_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155, 155)
        --        TextButton_2_Toggle.BorderColor3 = _G.Color
                TextButton_2_Toggle.BorderSizePixel = 0
                TextButton_2_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
                TextButton_2_Toggle.Position = UDim2.new(0.9, 0, 0.5, 0)
                TextButton_2_Toggle.Size = UDim2.new(0, 30, 0, 13)
                TextButton_2_Toggle.Font = Enum.Font.SourceSans
                TextButton_2_Toggle.Text = " "
                TextButton_2_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
                TextButton_2_Toggle.TextSize = 12.000
                TextButton_2_Toggle.AutoButtonColor = false

                local TextButton_Pageframe_Uiconner = Instance.new("UICorner")

                TextButton_Pageframe_Uiconner.CornerRadius = UDim.new(0, 30)
                TextButton_Pageframe_Uiconner.Name = ""
                TextButton_Pageframe_Uiconner.Parent = TextButton_2_Toggle

                local TextButton_3_Toggle = Instance.new("TextButton")

                TextButton_3_Toggle.Parent = TextButton_2_Toggle
                TextButton_3_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255,255)
        --        TextButton_3_Toggle.BorderColor3 = _G.Color
                TextButton_3_Toggle.BorderSizePixel = 0
                TextButton_3_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
                TextButton_3_Toggle.Position = UDim2.new(0.1, 0, 0.5, 0)
                TextButton_3_Toggle.Size = UDim2.new(0, 19, 0, 19)
                TextButton_3_Toggle.Font = Enum.Font.SourceSans
                TextButton_3_Toggle.Text = " "
                TextButton_3_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
                TextButton_3_Toggle.TextSize = 12.000
                TextButton_3_Toggle.AutoButtonColor = false

                local TextButton_Pageframe_Uiconner2 = Instance.new("UICorner")

                TextButton_Pageframe_Uiconner2.CornerRadius = UDim.new(0, 30)
                TextButton_Pageframe_Uiconner2.Name = ""
                TextButton_Pageframe_Uiconner2.Parent = TextButton_3_Toggle

                local TextButton_4_Toggle = Instance.new("TextButton")

                TextButton_4_Toggle.Parent = TextButton_3_Toggle
                TextButton_4_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155,155)
        --        TextButton_3_Toggle.BorderColor3 = _G.Color
                TextButton_4_Toggle.BorderSizePixel = 0
                TextButton_4_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
                TextButton_4_Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextButton_4_Toggle.Size = UDim2.new(0, 27, 0, 27-2)
                TextButton_4_Toggle.Font = Enum.Font.SourceSans
                TextButton_4_Toggle.Text = " "
                TextButton_4_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
                TextButton_4_Toggle.TextSize = 12.000
                TextButton_4_Toggle.AutoButtonColor = false
                TextButton_4_Toggle.BackgroundTransparency = 1
                TextButton_4_Toggle.Visible = true

                local TextButton_Pageframe_Uiconner4 = Instance.new("UICorner")

                TextButton_Pageframe_Uiconner4.CornerRadius = UDim.new(0, 30)
                TextButton_Pageframe_Uiconner4.Name = ""
                TextButton_Pageframe_Uiconner4.Parent = TextButton_4_Toggle

                local TextLabel_Toggle = Instance.new("TextLabel")

                TextLabel_Toggle.Parent = Toggle
                TextLabel_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_Toggle.BackgroundTransparency = 1
                TextLabel_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
                TextLabel_Toggle.Position = UDim2.new(0.4, 0, 0.5, 0)
                TextLabel_Toggle.BorderSizePixel = 0
                TextLabel_Toggle.Size = UDim2.new(0, 130, 0, 25)
                TextLabel_Toggle.Font = Enum.Font.GothamBold
                TextLabel_Toggle.Text = text
                TextLabel_Toggle.TextColor3 = Color3.fromRGB(200, 200, 200)
                TextLabel_Toggle.TextSize = 11.000
                TextLabel_Toggle.ClipsDescendants = true
                TextLabel_Toggle.TextWrapped = true
                TextLabel_Toggle.TextXAlignment = Enum.TextXAlignment.Left

                local TextButton_Toggle2 = Instance.new("TextButton")

                TextButton_Toggle2.Parent = TextButton_Toggle
                TextButton_Toggle2.BackgroundTransparency =1
                TextButton_Toggle2.BackgroundColor3 = Color3.fromRGB(60,60,60)
                TextButton_Toggle2.BorderSizePixel = 0
                TextButton_Toggle2.Size = UDim2.new(0, 213, 0, 35)
                TextButton_Toggle2.AutoButtonColor = false
                TextButton_Toggle2.Font = Enum.Font.SourceSans
                TextButton_Toggle2.Text = " "
                TextButton_Toggle2.TextColor3 = Color3.fromRGB(0, 0, 0)
                TextButton_Toggle2.TextSize = 12.000

                TextButton_Toggle2.MouseEnter:Connect(function()
                    TweenService:Create(
                        TextButton_4_Toggle,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.6} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextLabel_Toggle,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end
            )

            TextButton_Toggle2.MouseLeave:Connect(function()
                    TweenService:Create(
                        TextButton_4_Toggle,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundTransparency = 1} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextLabel_Toggle,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(200, 200, 200)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end
            )

            local check = {toogle = false ; loacker = true ; togfunction = {};}

            TextButton_Toggle2.MouseButton1Click:Connect(function()
                if check.toogle == false and check.loacker == true  then
                    TweenService:Create(
                        TextButton_4_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  _G.Color} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextButton_3_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  _G.Color} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextButton_2_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  _G.Color} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
                elseif  check.loacker ==  true then
                    TweenService:Create(
                        TextButton_4_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextButton_3_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextButton_2_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(0.1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
                end
                if  check.loacker == true  then
                    check.toogle = not check.toogle
                    callback(check.toogle)
                end
            end)

            if config == true then
                TweenService:Create(
                    TextButton_4_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  _G.Color} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_3_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  _G.Color} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_2_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  _G.Color} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
                check.toogle = true
                spawn(function()
                    while not getgenv().Loaded do task.wait() end
                    callback(check.toogle)
                end)
            end

            local lockerframe = Instance.new("Frame")

            lockerframe.Name = "lockerframe"
            lockerframe.Parent = Toggle
            lockerframe.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            lockerframe.BackgroundTransparency = 1
            lockerframe.Size = UDim2.new(0, 320, 0, 35)
            lockerframe.Position = UDim2.new(0.5, 0, 0.5, 0)
            lockerframe.AnchorPoint = Vector2.new(0.5, 0.5)

            local LockerImageLabel = Instance.new("ImageButton")
            LockerImageLabel.Parent = lockerframe
            LockerImageLabel.BackgroundTransparency = 1.000
            LockerImageLabel.BorderSizePixel = 0
            LockerImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
            LockerImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
            LockerImageLabel.Size = UDim2.new(0, 0, 0, 0)
            LockerImageLabel.Image = "rbxassetid://3926305904"
            LockerImageLabel.ZIndex = 10
            LockerImageLabel.ImageRectOffset = Vector2.new(4, 684)
            LockerImageLabel.ImageRectSize = Vector2.new(36, 36)

            function check.togfunction:SetState(boolean)
                if check.toogle == boolean then return end
                if boolean and check.loacker == true  then
                    TweenService:Create(
                        TextButton_4_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  _G.Color} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextButton_3_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  _G.Color} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextButton_2_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  _G.Color} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
                elseif  check.loacker ==  true then
                    TweenService:Create(
                        TextButton_4_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextButton_3_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextButton_2_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(0.1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
                end
                if check.loacker == true then
                    while not getgenv().Loaded do task.wait() end
                    check.toogle = not check.toogle
                    callback(check.toogle)
                end
            end
                function check.togfunction:lock()
                    TweenService:Create(
                        lockerframe,
                        TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
                        {BackgroundTransparency = 0.7}
                    ):Play()
                    TweenService:Create(
                        LockerImageLabel,
                        TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
                        {Size = UDim2.new(0, 30, 0, 30)}
                    ):Play()

                    check.loacker  = false
                --    pcall(callback,locker)
                end
                
                function check.togfunction:unlock()
                    TweenService:Create(
                        lockerframe,
                        TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
                        {BackgroundTransparency = 1}
                    ):Play()
                    TweenService:Create(
                        LockerImageLabel,
                        TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
                        {Size = UDim2.new(0, 0, 0, 0)}
                    ):Play()
                    check.loacker  = true
                --   pcall(callback,locker)
                end

                return  check.togfunction
            end

            function items:Button(text,callback)
                local ButtonFrame = Instance.new("Frame")
                ButtonFrame.Name = "ButtonFrame"
                ButtonFrame.Parent = ScrollingFrame_Pageframe
                ButtonFrame.BackgroundColor3 = _G.Color
                ButtonFrame.BorderSizePixel = 0
                ButtonFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
                ButtonFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                ButtonFrame.Size = UDim2.new(0, 213, 0, 25) -- UDim2.new(0, 213, 0, 35)
                ButtonFrame.BackgroundTransparency  = 1
                ButtonFrame.ClipsDescendants = true

                local MheeFrameStroke = Instance.new("UIStroke")
                MheeFrameStroke.Thickness = 0
                MheeFrameStroke.Name = ""
                MheeFrameStroke.Parent = ButtonFrame
                MheeFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
                MheeFrameStroke.Color = _G.Color
                MheeFrameStroke.Transparency = 0.7

                local Button = Instance.new("TextButton")
                Button.Parent = ButtonFrame
                Button.Name = "Button"
                Button.BackgroundColor3 = _G.Color
                Button.Size = UDim2.new(0,150, 0, 25)
                Button.Font = Enum.Font.GothamBold
                Button.Text = tostring(text)
                Button.TextColor3 = Color3.fromRGB(155, 155, 155)
                Button.TextSize = 11.000
                Button.AnchorPoint = Vector2.new(0.5, 0.5)
                Button.Position = UDim2.new(0.5, 0, 0.5, 0)
                Button.TextXAlignment = Enum.TextXAlignment.Center
                Button.BackgroundTransparency = 0.6
                Button.TextWrapped = true
                Button.AutoButtonColor = false
                Button.ClipsDescendants = true

                local ConnerPageMhee = Instance.new("UICorner")
                ConnerPageMhee.CornerRadius = UDim.new(0, 4)
                ConnerPageMhee.Name = ""
                ConnerPageMhee.Parent = Button

                Button.MouseEnter:Connect(function()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size =  UDim2.new(0, 213, 0, 25)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end
            )
                Button.MouseLeave:Connect(function()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size =  UDim2.new(0, 150, 0, 25)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.6} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end
            )

            Button.MouseButton1Click:Connect(function()
            --Ripple(Button)
                callback()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                    {TextSize =  16} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                wait(0.1)
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                    {TextSize =  13} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end)
                local extra_func = {}

                function extra_func:Delete()
                    ButtonFrame:Destroy()
                end

                return extra_func
            end

            function items:Slider(text,check,floor,min,max,de,lol,tog,callback,logoslide)

                if logoslide == nil then
                logoslide = 590556791
            end

            if check then

                local SliderFrame = Instance.new("Frame")

                SliderFrame.Name = "SliderFrame"
                SliderFrame.Parent = ScrollingFrame_Pageframe
                SliderFrame.BackgroundColor3 =  Color3.fromRGB(28, 28, 28)-- _G.Color
                SliderFrame.BorderSizePixel = 0
                SliderFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
                SliderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                SliderFrame.Size = UDim2.new(0, 213, 0, 75) -- UDim2.new(0, 213, 0, 35)
                SliderFrame.BackgroundTransparency  = 0
                SliderFrame.ClipsDescendants = true

                local SliderFrameConner = Instance.new("UICorner")

                SliderFrameConner.CornerRadius = UDim.new(0, 4)
                SliderFrameConner.Name = ""
                SliderFrameConner.Parent = SliderFrame

                local SliderFrameStroke = Instance.new("UIStroke")

                SliderFrameStroke.Thickness = 1
                SliderFrameStroke.Name = ""
                SliderFrameStroke.Parent = SliderFrame
                SliderFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
                SliderFrameStroke.Color = _G.Color
                SliderFrameStroke.Transparency = 0.7


                SliderFrame.MouseEnter:Connect(function()
                    TweenService:Create(
                        SliderFrameStroke,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end
            )

                SliderFrame.MouseLeave:Connect(function()
                    TweenService:Create(
                        SliderFrameStroke,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end
            )


                local LabelNameSliderxd = Instance.new("TextLabel")

                LabelNameSliderxd.Parent = SliderFrame
                LabelNameSliderxd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LabelNameSliderxd.BackgroundTransparency = 1
                LabelNameSliderxd.BorderSizePixel = 0
                LabelNameSliderxd.Position = UDim2.new(0.35, 0, 0.2, 0)
                LabelNameSliderxd.AnchorPoint = Vector2.new(0.5, 0.5)
                LabelNameSliderxd.Size = UDim2.new(0, 120, 0, 20)
                LabelNameSliderxd.Font = Enum.Font.GothamBold
                LabelNameSliderxd.Text = tostring(text)
                LabelNameSliderxd.TextColor3 = Color3.fromRGB(255, 255, 255)
                LabelNameSliderxd.TextSize = 26.000
                LabelNameSliderxd.TextXAlignment = Enum.TextXAlignment.Left


                local ShowValueFarm = Instance.new("Frame")

                ShowValueFarm.Name = "ShowValueFarm"
                ShowValueFarm.Parent = SliderFrame
                ShowValueFarm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                ShowValueFarm.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
                ShowValueFarm.Size = UDim2.new(0, 75, 0, 15)
                ShowValueFarm.BackgroundTransparency = 0
                ShowValueFarm.BorderSizePixel = 0
                ShowValueFarm.AnchorPoint = Vector2.new(0.5, 0.5)
                ShowValueFarm.Position = UDim2.new(0.8, 0, 0.2, 0)
                ShowValueFarm.ClipsDescendants = false

                local CustomValue = Instance.new("TextBox")

                CustomValue.Parent = ShowValueFarm
                CustomValue.BackgroundColor3 = Color3.fromRGB(45,45, 45)
                CustomValue.BorderSizePixel = 0
                CustomValue.ClipsDescendants = true
                CustomValue.AnchorPoint = Vector2.new(0.5, 0.5)
                CustomValue.Position = UDim2.new(0.5, 0, 0.5, 0)
                CustomValue.Size = UDim2.new(0, 158, 0, 26)
                CustomValue.Font = Enum.Font.GothamBold
                CustomValue.PlaceholderColor3 = Color3.fromRGB(222, 222, 222)
                CustomValue.PlaceholderText =  ""
                if floor == true then
                    CustomValue.Text =  tostring(de and string.format("%.1f",(de / max) * (max - min) + min) or 0)
                else
                    CustomValue.Text =  tostring(de and math.floor( (de / max) * (max - min) + min) or 0)
                end
                CustomValue.TextColor3 = Color3.fromRGB(255, 255, 255)
                CustomValue.TextSize = 10.000
                CustomValue.BackgroundTransparency = 1

                local ValueFrame = Instance.new("Frame")

                ValueFrame.Name = "ValueFrame"
                ValueFrame.Parent = SliderFrame
                ValueFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                ValueFrame.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
                ValueFrame.Size = UDim2.new(0, 140, 0, 5)
                ValueFrame.BackgroundTransparency = 0
                ValueFrame.BorderSizePixel = 0
                ValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                ValueFrame.Position = UDim2.new(0.4, 0, 0.8, 0)
                ValueFrame.ClipsDescendants = false


                local PartValue = Instance.new("Frame")

                PartValue.Name = "PartValue"
                PartValue.Parent = ValueFrame
                PartValue.BackgroundColor3 = Color3.fromRGB(222, 222, 222)
                PartValue.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
                PartValue.Size = UDim2.new(0, 140, 0, 5)
                PartValue.BackgroundTransparency = 1
                PartValue.BorderSizePixel = 0
                PartValue.AnchorPoint = Vector2.new(0.5, 0.5)
                PartValue.Position = UDim2.new(0.5, 0, 0.5, 0)
                PartValue.ClipsDescendants = false

                local MainValue = Instance.new("Frame")

                MainValue.Name = "MainValue"
                MainValue.Parent = PartValue
                MainValue.BackgroundColor3 = _G.Color
                MainValue.Size = UDim2.new((de or 0) / max, 0, 0, 5)
                MainValue.BackgroundTransparency = 0
                MainValue.BorderSizePixel = 0
                -- MainValue.AnchorPoint = Vector2.new(0.5, 0.5)
                MainValue.Position = UDim2.new(0., 0, 0.0, 0)
                MainValue.ClipsDescendants = false

                local Conner_S1 = Instance.new("UICorner")

                Conner_S1.CornerRadius = UDim.new(0, 8)
                Conner_S1.Name = ""
                Conner_S1.Parent = MainValue

                local Conner_S2 = Instance.new("UICorner")

                Conner_S2.CornerRadius = UDim.new(0, 8)
                Conner_S2.Name = ""
                Conner_S2.Parent = ValueFrame

                local ConneValue = Instance.new("Frame")

                ConneValue.Name = "ConneValue"
                ConneValue.Parent = PartValue
                ConneValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ConneValue.Size = UDim2.new(0, 13, 0,13)
                ConneValue.BackgroundTransparency = 0
                ConneValue.BorderSizePixel = 0
                ConneValue.AnchorPoint = Vector2.new(0.5, 0.5)
                ConneValue.Position = UDim2.new((de or 0)/max, 0.5, 0.3,0.5, 0)
                ConneValue.ClipsDescendants = false


                local Conner_Conne = Instance.new("UICorner")

                Conner_Conne.CornerRadius = UDim.new(0, 300)
                Conner_Conne.Name = ""
                Conner_Conne.Parent = ConneValue

                local Addvalue = Instance.new("ImageButton")

                Addvalue.Name = "Imatog"
                Addvalue.Parent = SliderFrame
                Addvalue.BackgroundTransparency = 1.000
                Addvalue.BorderSizePixel = 0
                Addvalue.Position = UDim2.new(0.85, 0, 0.35, 0)
                Addvalue.Size = UDim2.new(0, 15, 0, 15)
                Addvalue.Image = "http://www.roblox.com/asset/?id=8188583292"
                Addvalue.ImageColor3 =  _G.Color

                local Deletevalue = Instance.new("ImageButton")

                Deletevalue.Name = "Imatog"
                Deletevalue.Parent = SliderFrame
                Deletevalue.BackgroundTransparency = 1.000
                Deletevalue.BorderSizePixel = 0
                Deletevalue.Position = UDim2.new(0.7, 0, 0.35, 0)
                Deletevalue.Size = UDim2.new(0, 15, 0, 15)
                Deletevalue.Image = "http://www.roblox.com/asset/?id=6035047377"
                Deletevalue.ImageColor3 =  _G.Color


                local TextButton_2_Toggle = Instance.new("TextButton")

                TextButton_2_Toggle.Parent = ValueFrame
                TextButton_2_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155, 155)
        --        TextButton_2_Toggle.BorderColor3 = _G.Color
                TextButton_2_Toggle.BorderSizePixel = 0
                TextButton_2_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
                TextButton_2_Toggle.Position = UDim2.new(1.25, 0, 0.4, 0)
                TextButton_2_Toggle.Size = UDim2.new(0, 30, 0, 13)
                TextButton_2_Toggle.Font = Enum.Font.SourceSans
                TextButton_2_Toggle.Text = " "
                TextButton_2_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
                TextButton_2_Toggle.TextSize = 12.000
                TextButton_2_Toggle.AutoButtonColor = false

                local TextButton_Pageframe_Uiconner = Instance.new("UICorner")

                TextButton_Pageframe_Uiconner.CornerRadius = UDim.new(0, 30)
                TextButton_Pageframe_Uiconner.Name = ""
                TextButton_Pageframe_Uiconner.Parent = TextButton_2_Toggle

                local TextButton_3_Toggle = Instance.new("TextButton")

                TextButton_3_Toggle.Parent = TextButton_2_Toggle
                TextButton_3_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255,255)
        --        TextButton_3_Toggle.BorderColor3 = _G.Color
                TextButton_3_Toggle.BorderSizePixel = 0
                TextButton_3_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
                TextButton_3_Toggle.Position = UDim2.new(0.1, 0, 0.5, 0)
                TextButton_3_Toggle.Size = UDim2.new(0, 19, 0, 19)
                TextButton_3_Toggle.Font = Enum.Font.SourceSans
                TextButton_3_Toggle.Text = " "
                TextButton_3_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
                TextButton_3_Toggle.TextSize = 12.000
                TextButton_3_Toggle.AutoButtonColor = false

                local TextButton_Pageframe_Uiconner2 = Instance.new("UICorner")

                TextButton_Pageframe_Uiconner2.CornerRadius = UDim.new(0, 30)
                TextButton_Pageframe_Uiconner2.Name = ""
                TextButton_Pageframe_Uiconner2.Parent = TextButton_3_Toggle

                local TextButton_4_Toggle = Instance.new("TextButton")

                TextButton_4_Toggle.Parent = TextButton_3_Toggle
                TextButton_4_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155,155)
        --        TextButton_3_Toggle.BorderColor3 = _G.Color
                TextButton_4_Toggle.BorderSizePixel = 0
                TextButton_4_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
                TextButton_4_Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextButton_4_Toggle.Size = UDim2.new(0, 27, 0, 27-2)
                TextButton_4_Toggle.Font = Enum.Font.SourceSans
                TextButton_4_Toggle.Text = " "
                TextButton_4_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
                TextButton_4_Toggle.TextSize = 12.000
                TextButton_4_Toggle.AutoButtonColor = false
                TextButton_4_Toggle.BackgroundTransparency = 1
                TextButton_4_Toggle.Visible = true

                local TextButton_Pageframe_Uiconner4 = Instance.new("UICorner")

                TextButton_Pageframe_Uiconner4.CornerRadius = UDim.new(0, 30)
                TextButton_Pageframe_Uiconner4.Name = ""
                TextButton_Pageframe_Uiconner4.Parent = TextButton_4_Toggle


                local TextButton_Toggle = Instance.new("TextButton")

                TextButton_Toggle.Parent = ValueFrame
                TextButton_Toggle.BackgroundTransparency =1
                TextButton_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextButton_Toggle.BorderSizePixel = 0
                TextButton_Toggle.Size = UDim2.new(0, 50, 0, 20)
                TextButton_Toggle.AutoButtonColor = false
                TextButton_Toggle.Font = Enum.Font.SourceSans
                TextButton_Toggle.Text = " "
                TextButton_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
                TextButton_Toggle.TextSize = 12.000
                TextButton_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
                TextButton_Toggle.Position = UDim2.new(1.25, 0, 0.4, 0)



            -- local value = de
            local check2 = {toogle2 = false;}
                local function move(input)
                    local pos =
                        UDim2.new(
                            math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                            0,
                            0.3,
                            0
                        )
                    local pos1 =
                        UDim2.new(
                            math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                            0,
                            0,
                            5
                        )

                        MainValue:TweenSize(pos1, "Out", "Sine", 0.2, true)

                        ConneValue:TweenPosition(pos, "Out", "Sine", 0.2, true)
                        if floor == true then
                            local value = string.format("%.1f",((pos.X.Scale * max) / max) * (max - min) + min)
                            CustomValue.Text = tostring(value)
                        --   callback[2] = value
                        callback({
                            ["s"] = value;
                            ["t"] = check2.toogle2
                        })
                        --callback({value,check2.toogle2})
                            --callback(value)
                        else
                            local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
                            CustomValue.Text = tostring(value)
                            callback({
                                ["s"] = value;
                                ["t"] = check2.toogle2
                            })
                    --       callback({value,check2.toogle2})

                        end



                    end

                    local dragging = false
                    ConneValue.InputBegan:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                dragging = true

                            end
                        end
                    )
                    ConneValue.InputEnded:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                dragging = false

                            end
                        end
                    )
                    SliderFrame.InputBegan:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                dragging = true

                            end
                        end
                    )
                    SliderFrame.InputEnded:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                dragging = false

                            end
                        end
                    )


                    ValueFrame.InputBegan:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                dragging = true

                            end
                        end
                    )
                    ValueFrame.InputEnded:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                dragging = false

                            end
                        end
                    )

                    game:GetService("UserInputService").InputChanged:Connect(
                        function(input)
                            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                                move(input)
                            end
                        end
                        )

                        CustomValue.FocusLost:Connect(function()
                            if CustomValue.Text == "" then
                                CustomValue.Text  = de
                            end
                            if  tonumber(CustomValue.Text) > max then
                                CustomValue.Text  = max
                            end
                            if  tonumber(CustomValue.Text) <= min then
                                CustomValue.Text  = min
                            end
                            MainValue:TweenSize(UDim2.new((CustomValue.Text or 0) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                            ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0, 0) , "Out", "Sine", 0.2, true)
                            if floor == true then
                                CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                            else
                                CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                            end
                            callback({
                                ["s"] =  CustomValue.Text;
                                ["t"] = check2.toogle2;
                            })
                    --       callback({ tonumber(CustomValue.Text),check2.toogle2})
                    --  pcall(callback, CustomValue.Text)
                        end)


                        Addvalue.MouseButton1Click:Connect(function ()
                            if CustomValue.Text == "" then
                                CustomValue.Text  = de
                            end
                            pcall(function()
                                CustomValue.Text  = CustomValue.Text  - tonumber(lol)
                            end)
                            if  tonumber(CustomValue.Text) > max then
                                CustomValue.Text  = max
                            end
                            if  tonumber(CustomValue.Text) < min then
                                CustomValue.Text  = min
                            end
                            MainValue:TweenSize(UDim2.new((CustomValue.Text  or 0  ) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                            ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.5, 0) , "Out", "Sine", 0.2, true)
                            if floor == true then
                                CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                            else
                                CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                            end
                            callback({
                                ["s"] =  CustomValue.Text;
                                ["t"] = check2.toogle2
                            })
                        --   callback({ tonumber(CustomValue.Text),check2.toogle2})
                        --  pcall(callback, CustomValue.Text)
                        end)

                        Deletevalue.MouseButton1Click:Connect(function ()
                            if CustomValue.Text == "" then
                                CustomValue.Text  = de
                            end
                            pcall(function()
                                CustomValue.Text  = CustomValue.Text  + tonumber(lol)
                            end)
                            if  tonumber(CustomValue.Text) > max then
                                CustomValue.Text  = max
                            end
                            if  tonumber(CustomValue.Text) < min then
                                CustomValue.Text  = min
                            end
                            MainValue:TweenSize(UDim2.new((CustomValue.Text  or 0  ) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                            ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.5, 0) , "Out", "Sine", 0.2, true)
                            if floor == true then
                                CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                            else
                                CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                            end
                            callback({
                                ["s"] =  CustomValue.Text;
                                ["t"] = check2.toogle2;
                            })
                --callback({ tonumber(CustomValue.Text),check2.toogle2})
                        --  pcall(callback, CustomValue.Text)
                        end)




                ---
                        TextButton_Toggle.MouseEnter:Connect(function()
                            TweenService:Create(
                                TextButton_4_Toggle,
                                TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {BackgroundTransparency = 0.6} -- UDim2.new(0, 128, 0, 25)
                            ):Play()
                        end
                    )

                    TextButton_Toggle.MouseLeave:Connect(function()
                            TweenService:Create(
                                TextButton_4_Toggle,
                                TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {BackgroundTransparency = 1} -- UDim2.new(0, 128, 0, 25)
                            ):Play()
                        end
                    )



                TextButton_Toggle.MouseButton1Click:Connect(function()
                    if check2.toogle2 == false   then
                        TweenService:Create(
                            TextButton_4_Toggle,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundColor3 =  _G.Color} -- UDim2.new(0, 128, 0, 25)
                        ):Play()
                        TweenService:Create(
                            TextButton_3_Toggle,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundColor3 =  _G.Color} -- UDim2.new(0, 128, 0, 25)
                        ):Play()
                        TweenService:Create(
                            TextButton_2_Toggle,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundColor3 =  _G.Color} -- UDim2.new(0, 128, 0, 25)
                        ):Play()
                        TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
                    else
                        TweenService:Create(
                            TextButton_4_Toggle,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                        ):Play()
                        TweenService:Create(
                            TextButton_3_Toggle,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                        ):Play()
                        TweenService:Create(
                            TextButton_2_Toggle,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                        ):Play()
                        TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(0.1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
                    end
                        check2.toogle2 = not check2.toogle2
                        callback({
                            ["t"] = check2.toogle2;

                        })
                    --   callback({value,check2.toogle2})
                        --callback(check2.toogle2)
                end
            )

                if tog == true then
                    TweenService:Create(
                        TextButton_4_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  _G.Color} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextButton_3_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  _G.Color} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextButton_2_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  _G.Color} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
                    check2.toogle2 = true
                    callback({
                        ["t"] = check2.toogle2;
                    })
            --        callback({value,check2.toogle2})
                --  callback(check2.toogle2)
                end


            else
                tog = nil
                local SliderFrame = Instance.new("Frame")

                SliderFrame.Name = "SliderFrame"
                SliderFrame.Parent = ScrollingFrame_Pageframe
                SliderFrame.BackgroundColor3 =  Color3.fromRGB(28, 28, 28)-- _G.Color
                SliderFrame.BorderSizePixel = 0
                SliderFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
                SliderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                SliderFrame.Size = UDim2.new(0, 213, 0, 75) -- UDim2.new(0, 213, 0, 35)
                SliderFrame.BackgroundTransparency  = 0
                SliderFrame.ClipsDescendants = true

                local SliderFrameStroke = Instance.new("UIStroke")

                SliderFrameStroke.Thickness = 1
                SliderFrameStroke.Name = ""
                SliderFrameStroke.Parent = SliderFrame
                SliderFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
                SliderFrameStroke.Color = _G.Color
                SliderFrameStroke.Transparency = 0.7

                SliderFrame.MouseEnter:Connect(function()
                    TweenService:Create(
                        SliderFrameStroke,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end
            )

                SliderFrame.MouseLeave:Connect(function()
                    TweenService:Create(
                        SliderFrameStroke,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end
            )

                local LabelNameSliderxd = Instance.new("TextLabel")

                LabelNameSliderxd.Parent = SliderFrame
                LabelNameSliderxd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LabelNameSliderxd.BackgroundTransparency = 1
                LabelNameSliderxd.BorderSizePixel = 0
                LabelNameSliderxd.Position = UDim2.new(0.35, 0, 0.2, 0)
                LabelNameSliderxd.AnchorPoint = Vector2.new(0.5, 0.5)
                LabelNameSliderxd.Size = UDim2.new(0, 120, 0, 20)
                LabelNameSliderxd.Font = Enum.Font.GothamBold
                LabelNameSliderxd.Text = tostring(text)
                LabelNameSliderxd.TextColor3 = Color3.fromRGB(255, 255, 255)
                LabelNameSliderxd.TextSize = 11.000
                LabelNameSliderxd.TextXAlignment = Enum.TextXAlignment.Left


                local ShowValueFarm = Instance.new("Frame")

                ShowValueFarm.Name = "ShowValueFarm"
                ShowValueFarm.Parent = SliderFrame
                ShowValueFarm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                ShowValueFarm.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
                ShowValueFarm.Size = UDim2.new(0, 75, 0, 15)
                ShowValueFarm.BackgroundTransparency = 0
                ShowValueFarm.BorderSizePixel = 0
                ShowValueFarm.AnchorPoint = Vector2.new(0.5, 0.5)
                ShowValueFarm.Position = UDim2.new(0.8, 0, 0.2, 0)
                ShowValueFarm.ClipsDescendants = false

                local CustomValue = Instance.new("TextBox")

                CustomValue.Parent = ShowValueFarm
                CustomValue.BackgroundColor3 = Color3.fromRGB(45,45, 45)
                CustomValue.BorderSizePixel = 0
                CustomValue.ClipsDescendants = true
                CustomValue.AnchorPoint = Vector2.new(0.5, 0.5)
                CustomValue.Position = UDim2.new(0.5, 0, 0.5, 0)
                CustomValue.Size = UDim2.new(0, 158, 0, 26)
                CustomValue.Font = Enum.Font.GothamBold
                CustomValue.PlaceholderColor3 = Color3.fromRGB(222, 222, 222)
                CustomValue.PlaceholderText =  ""
                if floor == true then
                    CustomValue.Text =  tostring(de and string.format("%.1f",(de / max) * (max - min) + min) or 0)
                else
                    CustomValue.Text =  tostring(de and math.floor( (de / max) * (max - min) + min) or 0)
                end
                CustomValue.TextColor3 = Color3.fromRGB(255, 255, 255)
                CustomValue.TextSize = 8.000
                CustomValue.BackgroundTransparency = 1

                local ValueFrame = Instance.new("Frame")

                ValueFrame.Name = "ValueFrame"
                ValueFrame.Parent = SliderFrame
                ValueFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                ValueFrame.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
                ValueFrame.Size = UDim2.new(0, 190, 0, 5)
                ValueFrame.BackgroundTransparency = 0
                ValueFrame.BorderSizePixel = 0
                ValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                ValueFrame.Position = UDim2.new(0.5, 0, 0.8, 0)
                ValueFrame.ClipsDescendants = false


                local PartValue = Instance.new("Frame")

                PartValue.Name = "PartValue"
                PartValue.Parent = ValueFrame
                PartValue.BackgroundColor3 = Color3.fromRGB(222, 222, 222)
                PartValue.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
                PartValue.Size = UDim2.new(0, 190, 0, 5)
                PartValue.BackgroundTransparency = 1
                PartValue.BorderSizePixel = 0
                PartValue.AnchorPoint = Vector2.new(0.5, 0.5)
                PartValue.Position = UDim2.new(0.5, 0, 0.5, 0)
                PartValue.ClipsDescendants = false

                local MainValue = Instance.new("Frame")

                MainValue.Name = "MainValue"
                MainValue.Parent = PartValue
                MainValue.BackgroundColor3 = _G.Color
                MainValue.Size = UDim2.new((de or 0) / max, 0, 0, 5)
                MainValue.BackgroundTransparency = 0
                MainValue.BorderSizePixel = 0
                -- MainValue.AnchorPoint = Vector2.new(0.5, 0.5)
                MainValue.Position = UDim2.new(0., 0, 0.0, 0)
                MainValue.ClipsDescendants = false

                local Conner_S1 = Instance.new("UICorner")

                Conner_S1.CornerRadius = UDim.new(0, 8)
                Conner_S1.Name = ""
                Conner_S1.Parent = MainValue

                local Conner_S2 = Instance.new("UICorner")

                Conner_S2.CornerRadius = UDim.new(0, 8)
                Conner_S2.Name = ""
                Conner_S2.Parent = ValueFrame
                local ConneValue = Instance.new("ImageLabel")
            
                ConneValue.Name = "ConneValue"
                ConneValue.Parent = PartValue
                ConneValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ConneValue.Size = UDim2.new(0, 20, 0,20)
                ConneValue.BackgroundTransparency = 1
                ConneValue.BorderSizePixel = 0
                ConneValue.AnchorPoint = Vector2.new(0.5, 0.5)
                ConneValue.Position = UDim2.new((de or 0)/max, 0.5, 0.3,0.5, 0)
                ConneValue.ClipsDescendants = false
                ConneValue.Image = "https://www.roblox.com/asset/?id=" .. logoslide

                local Addvalue = Instance.new("ImageButton")

                Addvalue.Name = "Imatog"
                Addvalue.Parent = SliderFrame
                Addvalue.BackgroundTransparency = 1.000
                Addvalue.BorderSizePixel = 0
                Addvalue.Position = UDim2.new(0.85, 0, 0.35, 0)
                Addvalue.Size = UDim2.new(0, 15, 0, 15)
                Addvalue.Image = "http://www.roblox.com/asset/?id=6035067836"
                Addvalue.ImageColor3 =  _G.Color

                local Deletevalue = Instance.new("ImageButton")

                Deletevalue.Name = "Imatog"
                Deletevalue.Parent = SliderFrame
                Deletevalue.BackgroundTransparency = 1.000
                Deletevalue.BorderSizePixel = 0
                Deletevalue.Position = UDim2.new(0.7, 0, 0.35, 0)
                Deletevalue.Size = UDim2.new(0, 15, 0, 15)
                Deletevalue.Image = "http://www.roblox.com/asset/?id=6035047377"
                Deletevalue.ImageColor3 =  _G.Color

                local function move(input)
                    local pos =
                        UDim2.new(
                            math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                            0,
                            0.3,
                            0
                        )
                    local pos1 =
                        UDim2.new(
                            math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                            0,
                            0,
                            5
                        )

                        MainValue:TweenSize(pos1, "Out", "Sine", 0.2, true)

                        ConneValue:TweenPosition(pos, "Out", "Sine", 0.2, true)
                        if floor == true then
                            local value = string.format("%.1f",((pos.X.Scale * max) / max) * (max - min) + min)
                            CustomValue.Text = tostring(value)
                            callback(value)
                        else
                            local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
                            CustomValue.Text = tostring(value)
                            callback(value)
                        end



                    end

                    local dragging = false
                    ConneValue.InputBegan:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                dragging = true

                            end
                        end
                    )
                    ConneValue.InputEnded:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                dragging = false

                            end
                        end
                    )
                    SliderFrame.InputBegan:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                dragging = true

                            end
                        end
                    )
                    SliderFrame.InputEnded:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                dragging = false

                            end
                        end
                    )


                    ValueFrame.InputBegan:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                dragging = true

                            end
                        end
                    )
                    ValueFrame.InputEnded:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                dragging = false

                            end
                        end
                    )

                    game:GetService("UserInputService").InputChanged:Connect(
                        function(input)
                            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                                move(input)
                            end
                        end
                        )

                        CustomValue.FocusLost:Connect(function()
                            if CustomValue.Text == "" then
                                CustomValue.Text  = de
                            end
                            if  tonumber(CustomValue.Text) > max then
                                CustomValue.Text  = max
                            end
                            MainValue:TweenSize(UDim2.new((CustomValue.Text or 0) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                            ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0, 0) , "Out", "Sine", 0.2, true)
                            if floor == true then
                                CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                            else
                                CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                            end
                            pcall(callback, CustomValue.Text)
                        end)


                Addvalue.MouseButton1Click:Connect(function ()
                    if CustomValue.Text == "" then
                        CustomValue.Text  = de
                    end
                    CustomValue.Text  = CustomValue.Text  - tonumber(lol)
                    if  tonumber(CustomValue.Text) > max then
                        CustomValue.Text  = max
                    end
                    if  tonumber(CustomValue.Text) < min then
                        CustomValue.Text  = min
                    end
                    MainValue:TweenSize(UDim2.new((CustomValue.Text  or 0  ) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                    ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.5, 0) , "Out", "Sine", 0.2, true)
                    if floor == true then
                        CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                    else
                        CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                    end
                    pcall(callback, CustomValue.Text)
                end)

                Deletevalue.MouseButton1Click:Connect(function ()
                    if CustomValue.Text == "" then
                        CustomValue.Text  = de
                    end
                    CustomValue.Text  = CustomValue.Text  + tonumber(lol)
                    if  tonumber(CustomValue.Text) > max then
                        CustomValue.Text  = max
                    end
                    if  tonumber(CustomValue.Text) < min then
                        CustomValue.Text  = min
                    end
                    MainValue:TweenSize(UDim2.new((CustomValue.Text  or 0  ) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                    ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.5, 0) , "Out", "Sine", 0.2, true)
                    if floor == true then
                        CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                    else
                        CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                    end
                    pcall(callback, CustomValue.Text)
                end)

            end

            end

            function items:Drop(text,text2,use,option,callback,LogoDrop)

            if LogoDrop == nil then
                LogoDrop = 401613236
            end

            if use == false then
                local DropFrame = Instance.new("Frame")

                DropFrame.Name = "DropFrame"
                DropFrame.Parent = ScrollingFrame_Pageframe
                DropFrame.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)-- _G.Color
                DropFrame.BorderSizePixel = 0
                DropFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
                DropFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                DropFrame.Size = UDim2.new(0, 213, 0, 30) -- UDim2.new(0, 213, 0, 35)
                DropFrame.BackgroundTransparency  = 0
                DropFrame.ClipsDescendants = true

                local ConnerDropFrame = Instance.new("UICorner")

                ConnerDropFrame.CornerRadius = UDim.new(0, 4)
                ConnerDropFrame.Name = ""
                ConnerDropFrame.Parent = DropFrame

                local DropFrameStroke = Instance.new("UIStroke")

                DropFrameStroke.Thickness = 1
                DropFrameStroke.Name = ""
                DropFrameStroke.Parent = DropFrame
                DropFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
                DropFrameStroke.Color = _G.Color
                DropFrameStroke.Transparency = 0.7





                local LabelFrameDrop = Instance.new("TextLabel")

                LabelFrameDrop.Parent = DropFrame
                LabelFrameDrop.Name = "LabelFrameDrop"
                LabelFrameDrop.BackgroundColor3 = _G.Color
                LabelFrameDrop.Position = UDim2.new(0., 0, 0., 0)
                LabelFrameDrop.Size =    UDim2.new(0, 213, 0, 30)
                LabelFrameDrop.Font = Enum.Font.GothamBold
                LabelFrameDrop.Text = ""
                LabelFrameDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
                LabelFrameDrop.TextSize = 14.000
            --   LabelFrameDrop.AnchorPoint = Vector2.new(0.5, 0.5)
                LabelFrameDrop.BackgroundTransparency = 1
                LabelFrameDrop.TextXAlignment = Enum.TextXAlignment.Left


                local TextLabel_TapDrop = Instance.new("TextLabel")

                TextLabel_TapDrop.Parent = LabelFrameDrop
                TextLabel_TapDrop.Name = "TextLabel_TapDrop"
                TextLabel_TapDrop.BackgroundColor3 = _G.Color
                TextLabel_TapDrop.Position = UDim2.new(0.04, 0, 0.14, 0)
                TextLabel_TapDrop.Size =    UDim2.new(0, 140, 0, 20)
                TextLabel_TapDrop.Font = Enum.Font.GothamBold
                TextLabel_TapDrop.Text = tostring(text).." : "..tostring(text2)
                TextLabel_TapDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
                TextLabel_TapDrop.TextSize = 11.000
        --     TextLabel_TapDrop.AnchorPoint = Vector2.new(0.5, 0.5)
                TextLabel_TapDrop.BackgroundTransparency = 1
                TextLabel_TapDrop.TextXAlignment = Enum.TextXAlignment.Left


                local DropArbt_listimage = Instance.new("ImageButton")

                DropArbt_listimage.Parent = LabelFrameDrop
                DropArbt_listimage.BackgroundTransparency = 1.000
                DropArbt_listimage.AnchorPoint = Vector2.new(0.5, 0.5)
                DropArbt_listimage.Position = UDim2.new(0.9, 0, 0.5, 0)
                DropArbt_listimage.BorderSizePixel = 0
                DropArbt_listimage.Size = UDim2.new(0, 25, 0, 25)
                DropArbt_listimage.Image = "http://www.roblox.com/asset/?id="..LogoDrop
                DropArbt_listimage.ImageColor3 = Color3.fromRGB(155, 155, 155)

                local ScolDown = Instance.new("ScrollingFrame")

                ScolDown.Name = "ScolDown"
                ScolDown.Position = UDim2.new(0.02, 0, 1., 0)
                ScolDown.Parent = LabelFrameDrop
                ScolDown.Active = true
                ScolDown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ScolDown.BorderSizePixel = 0
                ScolDown.Size = UDim2.new(0, 205, 0, 115)
                ScolDown.ScrollBarThickness = 3
                ScolDown.ClipsDescendants = true
                ScolDown.BackgroundTransparency = 1
                ScolDown.CanvasSize = UDim2.new(0, 0, 0, 2)

                local UIListLayoutlist = Instance.new("UIListLayout")
                local UIPaddinglist = Instance.new("UIPadding")

                UIListLayoutlist.Name = "UIListLayoutlist"
                UIListLayoutlist.Parent = ScolDown
                UIListLayoutlist.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayoutlist.Padding = UDim.new(0, 5)

                UIPaddinglist.Name = "UIPaddinglist"
                UIPaddinglist.Parent = ScolDown
                UIPaddinglist.PaddingTop = UDim.new(0, 5)
                UIPaddinglist.PaddingLeft = UDim.new(0, 12)

                local ButtonDrop = Instance.new("TextButton")

                ButtonDrop.Parent = DropFrame
                ButtonDrop.Name = "ButtonDrop"
                ButtonDrop.BackgroundColor3 = _G.Color
                ButtonDrop.Size = UDim2.new(0, 213, 0, 30)
                ButtonDrop.Font = Enum.Font.GothamBold
                ButtonDrop.Text = ""
                ButtonDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
                ButtonDrop.TextSize = 13.000
            --   ButtonDrop.AnchorPoint = Vector2.new(0.5, 0.5)
                ButtonDrop.Position = UDim2.new(0., 0, 0., 0)
                ButtonDrop.TextXAlignment = Enum.TextXAlignment.Center
                ButtonDrop.BackgroundTransparency = 1
                ButtonDrop.TextWrapped = true
                ButtonDrop.AutoButtonColor = false
                ButtonDrop.ClipsDescendants = true

                local dog = false

                local FrameSize = 75
                local cout = 0
                for i , v in pairs(option) do
                    cout =cout + 1
                    if cout == 1 then
                        FrameSize = 75
                    elseif cout == 2 then
                        FrameSize = 110
                    elseif cout >= 3 then
                        FrameSize = 150
                    end

                    local ListFrame = Instance.new("Frame")

                    ListFrame.Name = "ListFrame"
                    ListFrame.Parent = ScolDown
                    ListFrame.BackgroundColor3 =  Color3.fromRGB(22553, 23, 23)-- _G.Color
                    ListFrame.BorderSizePixel = 0
                    ListFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
                    ListFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                    ListFrame.Size = UDim2.new(0, 180, 0, 30) -- UDim2.new(0, 213, 0, 35)
                    ListFrame.BackgroundTransparency  = 1
                    ListFrame.ClipsDescendants = true

                    local TextLabel_TapDro2p = Instance.new("TextLabel")

                    TextLabel_TapDro2p.Parent = ListFrame
                    TextLabel_TapDro2p.Name =  tostring(v).."Dropdown"
                    TextLabel_TapDro2p.BackgroundColor3 = _G.Color
                    TextLabel_TapDro2p.Position = UDim2.new(0.5, 0, 0.5, 0)
                    TextLabel_TapDro2p.Size =  UDim2.new(0, 180, 0, 30)
                    TextLabel_TapDro2p.Font = Enum.Font.GothamBold
                    TextLabel_TapDro2p.Text = tostring(v)
                    TextLabel_TapDro2p.TextColor3 = Color3.fromRGB(155, 155, 155)
                    TextLabel_TapDro2p.TextSize = 14.000
                    TextLabel_TapDro2p.AnchorPoint = Vector2.new(0.5, 0.5)
                    TextLabel_TapDro2p.BackgroundTransparency = 1
                    TextLabel_TapDro2p.TextXAlignment = Enum.TextXAlignment.Center

                    local ButtonDrop2 = Instance.new("TextButton")

                    ButtonDrop2.Parent = ListFrame
                    ButtonDrop2.Name = "ButtonDrop2"
                    ButtonDrop2.BackgroundColor3 = _G.Color
                    ButtonDrop2.Size = UDim2.new(0, 213, 0, 30)
                    ButtonDrop2.Font = Enum.Font.GothamBold
                    ButtonDrop2.Text = ""
                    ButtonDrop2.TextColor3 = Color3.fromRGB(155, 155, 155)
                    ButtonDrop2.TextSize = 13.000
                --   ButtonDrop2.AnchorPoint = Vector2.new(0.5, 0.5)
                    ButtonDrop2.Position = UDim2.new(0., 0, 0., 0)
                    ButtonDrop2.TextXAlignment = Enum.TextXAlignment.Center
                    ButtonDrop2.BackgroundTransparency = 1
                    ButtonDrop2.TextWrapped = true
                    ButtonDrop2.AutoButtonColor = false
                    ButtonDrop2.ClipsDescendants = true

                    ButtonDrop2.MouseEnter:Connect(function ()
                        TweenService:Create(
                            TextLabel_TapDro2p,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                        ):Play()
                    end)

                    ButtonDrop2.MouseLeave:Connect(function ()
                        TweenService:Create(
                            TextLabel_TapDro2p,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                        ):Play()
                    end)

                    ButtonDrop2.MouseButton1Click:Connect(function()
                        TweenService:Create(
                            DropFrame,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
                        ):Play()
                        TweenService:Create(
                            DropArbt_listimage,
                            TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                        TextLabel_TapDrop.Text =  text.." : "..tostring(v)
                        callback(v)
                        dog = not dog
                    end
                )


                    ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
                end


                DropFrame.MouseEnter:Connect(function()
                    TweenService:Create(
                        DropFrameStroke,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextLabel_TapDrop,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        DropArbt_listimage,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {ImageColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end
            )

            DropFrame.MouseLeave:Connect(function()
                    TweenService:Create(
                        DropFrameStroke,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextLabel_TapDrop,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        DropArbt_listimage,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {ImageColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end
            )


            ButtonDrop.MouseButton1Click:Connect(function()
                if dog == false then
                    TweenService:Create(
                        DropFrame,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 213, 0, 150)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        DropArbt_listimage,
                        TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                        {Rotation = -180}
                    ):Play()
                    ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
                else
                    TweenService:Create(
                        DropFrame,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        DropArbt_listimage,
                        TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                        {Rotation = 0}
                    ):Play()
                    ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
                end
                dog = not dog
            end
        )
        ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )

            local dropfunc = {}

            function dropfunc:Clear()
                TextLabel_TapDrop.Text = tostring(text).." :"
                for _, v in next, ScolDown:GetChildren() do
                    if v:IsA("Frame") then
                        v:Destroy()
                    end
                end
                ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
            end

            function dropfunc:Add(t)
                local ListFrame = Instance.new("Frame")

                ListFrame.Name = "ListFrame"
                ListFrame.Parent = ScolDown
                ListFrame.BackgroundColor3 =  Color3.fromRGB(22553, 23, 23)-- _G.Color
                ListFrame.BorderSizePixel = 0
                ListFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
                ListFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                ListFrame.Size = UDim2.new(0, 180, 0, 30) -- UDim2.new(0, 213, 0, 35)
                ListFrame.BackgroundTransparency  = 1
                ListFrame.ClipsDescendants = true

                local TextLabel_TapDro2p = Instance.new("TextLabel")

                TextLabel_TapDro2p.Parent = ListFrame
                TextLabel_TapDro2p.Name =  tostring(t).."Dropdown"
                TextLabel_TapDro2p.BackgroundColor3 = _G.Color
                TextLabel_TapDro2p.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextLabel_TapDro2p.Size =  UDim2.new(0, 180, 0, 30)
                TextLabel_TapDro2p.Font = Enum.Font.GothamBold
                TextLabel_TapDro2p.Text = tostring(t)
                TextLabel_TapDro2p.TextColor3 = Color3.fromRGB(155, 155, 155)
                TextLabel_TapDro2p.TextSize = 14.000
                TextLabel_TapDro2p.AnchorPoint = Vector2.new(0.5, 0.5)
                TextLabel_TapDro2p.BackgroundTransparency = 1
                TextLabel_TapDro2p.TextXAlignment = Enum.TextXAlignment.Center

                local ButtonDrop2 = Instance.new("TextButton")

                ButtonDrop2.Parent = ListFrame
                ButtonDrop2.Name = "ButtonDrop2"
                ButtonDrop2.BackgroundColor3 = _G.Color
                ButtonDrop2.Size = UDim2.new(0, 213, 0, 30)
                ButtonDrop2.Font = Enum.Font.GothamBold
                ButtonDrop2.Text = ""
                ButtonDrop2.TextColor3 = Color3.fromRGB(155, 155, 155)
                ButtonDrop2.TextSize = 13.000
            --   ButtonDrop2.AnchorPoint = Vector2.new(0.5, 0.5)
                ButtonDrop2.Position = UDim2.new(0., 0, 0., 0)
                ButtonDrop2.TextXAlignment = Enum.TextXAlignment.Center
                ButtonDrop2.BackgroundTransparency = 1
                ButtonDrop2.TextWrapped = true
                ButtonDrop2.AutoButtonColor = false
                ButtonDrop2.ClipsDescendants = true

                ButtonDrop2.MouseEnter:Connect(function ()
                    TweenService:Create(
                        TextLabel_TapDro2p,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end)

                ButtonDrop2.MouseLeave:Connect(function ()
                    TweenService:Create(
                        TextLabel_TapDro2p,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end)

                ButtonDrop2.MouseButton1Click:Connect(function()
                    TweenService:Create(
                        DropFrame,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        DropArbt_listimage,
                        TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                        {Rotation = 0}
                    ):Play()
                    TextLabel_TapDrop.Text =  text.." : "..tostring(t)
                    callback(t)
                    dog = not dog
                end
            )

                ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
            end
            return dropfunc

        else

            local location = option.location or self.flags
            local flag = not use and option.flag or ""
            local callback = callback or function() end
            local list = option.list or {}
            local default = list.default or list[1].Name

            if not use then
                location[flag] = default
            end


            local DropFrame = Instance.new("Frame")

            DropFrame.Name = "DropFrame"
            DropFrame.Parent = ScrollingFrame_Pageframe
            DropFrame.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)-- _G.Color
            DropFrame.BorderSizePixel = 0
            DropFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            DropFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            DropFrame.Size = UDim2.new(0, 213, 0, 30) -- UDim2.new(0, 213, 0, 35)
            DropFrame.BackgroundTransparency  = 0
            DropFrame.ClipsDescendants = true

            local ConnerDropFrame = Instance.new("UICorner")

            ConnerDropFrame.CornerRadius = UDim.new(0, 4)
            ConnerDropFrame.Name = ""
            ConnerDropFrame.Parent = DropFrame

            local DropFrameStroke = Instance.new("UIStroke")

            DropFrameStroke.Thickness = 1
            DropFrameStroke.Name = ""
            DropFrameStroke.Parent = DropFrame
            DropFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
            DropFrameStroke.Color = _G.Color
            DropFrameStroke.Transparency = 0.7





            local LabelFrameDrop = Instance.new("TextLabel")

            LabelFrameDrop.Parent = DropFrame
            LabelFrameDrop.Name = "LabelFrameDrop"
            LabelFrameDrop.BackgroundColor3 = _G.Color
            LabelFrameDrop.Position = UDim2.new(0., 0, 0., 0)
            LabelFrameDrop.Size =    UDim2.new(0, 213, 0, 30)
            LabelFrameDrop.Font = Enum.Font.GothamBold
            LabelFrameDrop.Text = ""
            LabelFrameDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
            LabelFrameDrop.TextSize = 14.000
        --   LabelFrameDrop.AnchorPoint = Vector2.new(0.5, 0.5)
            LabelFrameDrop.BackgroundTransparency = 1
            LabelFrameDrop.TextXAlignment = Enum.TextXAlignment.Left


            local TextLabel_TapDrop = Instance.new("TextLabel")

            TextLabel_TapDrop.Parent = LabelFrameDrop
            TextLabel_TapDrop.Name = "TextLabel_TapDrop"
            TextLabel_TapDrop.BackgroundColor3 = _G.Color
            TextLabel_TapDrop.Position = UDim2.new(0.04, 0, 0.14, 0)
            TextLabel_TapDrop.Size =    UDim2.new(0, 140, 0, 20)
            TextLabel_TapDrop.Font = Enum.Font.GothamBold
            TextLabel_TapDrop.Text = tostring(text).." :"
            TextLabel_TapDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
            TextLabel_TapDrop.TextSize = 14.000
    --     TextLabel_TapDrop.AnchorPoint = Vector2.new(0.5, 0.5)
            TextLabel_TapDrop.BackgroundTransparency = 1
            TextLabel_TapDrop.TextXAlignment = Enum.TextXAlignment.Left


            local DropArbt_listimage = Instance.new("ImageButton")

            DropArbt_listimage.Parent = LabelFrameDrop
            DropArbt_listimage.BackgroundTransparency = 1.000
            DropArbt_listimage.AnchorPoint = Vector2.new(0.5, 0.5)
            DropArbt_listimage.Position = UDim2.new(0.9, 0, 0.5, 0)
            DropArbt_listimage.BorderSizePixel = 0
            DropArbt_listimage.Size = UDim2.new(0, 25, 0, 25)
            DropArbt_listimage.Image = "http://www.roblox.com/asset/?id=6031091004"
            DropArbt_listimage.ImageColor3 = Color3.fromRGB(155, 155, 155)

            local ScolDown = Instance.new("ScrollingFrame")

            ScolDown.Name = "ScolDown"
            ScolDown.Position = UDim2.new(0.02, 0, 1., 0)
            ScolDown.Parent = LabelFrameDrop
            ScolDown.Active = true
            ScolDown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ScolDown.BorderSizePixel = 0
            ScolDown.Size = UDim2.new(0, 205, 0, 115)
            ScolDown.ScrollBarThickness = 3
            ScolDown.ClipsDescendants = true
            ScolDown.BackgroundTransparency = 1
            ScolDown.CanvasSize = UDim2.new(0, 0, 0, 2)

            local UIListLayoutlist = Instance.new("UIListLayout")
            local UIPaddinglist = Instance.new("UIPadding")

            UIListLayoutlist.Name = "UIListLayoutlist"
            UIListLayoutlist.Parent = ScolDown
            UIListLayoutlist.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayoutlist.Padding = UDim.new(0, 5)

            UIPaddinglist.Name = "UIPaddinglist"
            UIPaddinglist.Parent = ScolDown
            UIPaddinglist.PaddingTop = UDim.new(0, 5)
            UIPaddinglist.PaddingLeft = UDim.new(0, 12)

            local ButtonDrop = Instance.new("TextButton")

            ButtonDrop.Parent = DropFrame
            ButtonDrop.Name = "ButtonDrop"
            ButtonDrop.BackgroundColor3 = _G.Color
            ButtonDrop.Size = UDim2.new(0, 213, 0, 30)
            ButtonDrop.Font = Enum.Font.GothamBold
            ButtonDrop.Text = ""
            ButtonDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
            ButtonDrop.TextSize = 13.000
        --   ButtonDrop.AnchorPoint = Vector2.new(0.5, 0.5)
            ButtonDrop.Position = UDim2.new(0., 0, 0., 0)
            ButtonDrop.TextXAlignment = Enum.TextXAlignment.Center
            ButtonDrop.BackgroundTransparency = 1
            ButtonDrop.TextWrapped = true
            ButtonDrop.AutoButtonColor = false
            ButtonDrop.ClipsDescendants = true

            local dog = false

            local FrameSize = 75
            local cout = 0
            for i , v in pairs(list) do
                cout =cout + 1
                if cout == 1 then
                    FrameSize = 75
                elseif cout == 2 then
                    FrameSize = 110
                elseif cout >= 3 then
                    FrameSize = 150
                end

                local listtog = Instance.new("Frame")

                listtog.Name = "listtog"
                listtog.Parent = ScolDown
                listtog.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
                listtog.BackgroundTransparency =1
                listtog.BorderSizePixel = 0
                listtog.ClipsDescendants = true
                listtog.AnchorPoint = Vector2.new(0.5, 0.5)
                listtog.Position = UDim2.new(0.5, 0, 0.5, 0)
                listtog.Size = UDim2.new(0, 210, 0, 33)


                local listtextbutton = Instance.new("TextButton")

                listtextbutton.Parent = listtog
                listtextbutton.BackgroundTransparency =1
                listtextbutton.BackgroundColor3 = Color3.fromRGB(60,60,60)
                listtextbutton.BorderSizePixel = 0
                listtextbutton.Size =  UDim2.new(0, 210, 0, 33)
                listtextbutton.AutoButtonColor = false
                listtextbutton.Font = Enum.Font.SourceSans
                listtextbutton.Text = " "
                listtextbutton.TextColor3 = Color3.fromRGB(0, 0, 0)
                listtextbutton.TextSize = 14.000

                local farmtoglist = Instance.new("TextButton")

                farmtoglist.Parent = listtextbutton
                farmtoglist.BackgroundColor3 = _G.Color
                farmtoglist.BorderColor3 = _G.Color
                farmtoglist.BorderSizePixel = 0
                farmtoglist.AnchorPoint = Vector2.new(0.5, 0.5)
                farmtoglist.Position = UDim2.new(0.1, 0, 0.5, 0)
                farmtoglist.Size = UDim2.new(0, 23, 0, 23)
                farmtoglist.Font = Enum.Font.SourceSans
                farmtoglist.Text = " "
                farmtoglist.TextColor3 = Color3.fromRGB(0, 0, 0)
                farmtoglist.TextSize = 14.000
                farmtoglist.AutoButtonColor = false


                local farmtoglist2 = Instance.new("TextButton")

                farmtoglist2.Parent = farmtoglist
                farmtoglist2.BackgroundColor3 = Color3.fromRGB(32, 32,32)
                farmtoglist2.BorderColor3 = _G.Color
                farmtoglist2.BorderSizePixel = 0
                farmtoglist2.AnchorPoint = Vector2.new(0.5, 0.5)
                farmtoglist2.Position = UDim2.new(0.5, 0, 0.5, 0)
                farmtoglist2.Size = UDim2.new(0, 21, 0, 21)
                farmtoglist2.Font = Enum.Font.SourceSans
                farmtoglist2.Text = " "
                farmtoglist2.TextColor3 = Color3.fromRGB(0, 0, 0)
                farmtoglist2.TextSize = 14.000
                farmtoglist2.AutoButtonColor = false


                local listimage = Instance.new("ImageButton")

                listimage.Parent = farmtoglist2
                listimage.BackgroundTransparency = 1.000
                listimage.AnchorPoint = Vector2.new(0.5, 0.5)
                listimage.Position = UDim2.new(0.5, 0, 0.5, 0)
                listimage.BorderSizePixel = 0
                listimage.Size = UDim2.new(0, 0, 0, 0)
                listimage.Image = "http://www.roblox.com/asset/?id=5880482965"


                local textlist = Instance.new("TextLabel")


                textlist.Parent = listtextbutton
                textlist.Name = "textlist"
                textlist.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                textlist.BackgroundTransparency = 1.000
                textlist.AnchorPoint = Vector2.new(0.5, 0.5)
                textlist.Position = UDim2.new(0.5, 0, 0.5, 0)
                textlist.BorderSizePixel = 0
                textlist.Size = UDim2.new(0, 91, 0, 25)
                textlist.Font = Enum.Font.GothamBold
                textlist.Text = tostring(v.Name)
                textlist.TextColor3 = Color3.fromRGB(255, 255, 255)
                textlist.TextSize = 13.000



                local TextButton_Pageframe_Uiconner2 = Instance.new("UICorner")

                TextButton_Pageframe_Uiconner2.CornerRadius = UDim.new(0, 5)
                TextButton_Pageframe_Uiconner2.Name = ""
                TextButton_Pageframe_Uiconner2.Parent = farmtoglist

                local TextButton_Pageframe_Uiconner22 = Instance.new("UICorner")

                TextButton_Pageframe_Uiconner22.CornerRadius = UDim.new(0, 5)
                TextButton_Pageframe_Uiconner22.Name = ""
                TextButton_Pageframe_Uiconner22.Parent = farmtoglist2



                listtextbutton.MouseButton1Click:Connect(function()
                    if not  location[v.flag] then
                        listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
                        wait(0.1)
                        listimage:TweenSizeAndPosition(UDim2.new(0, 23, 0, 23), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
                    else
                        listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
                        wait(0.1)
                        listimage:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
                    end
                    location[v.flag] = not location[v.flag]
                    callback(location[v.flag])
                end
            )

            if  location[v.flag] then
                listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
                wait(0.1)
                listimage:TweenSizeAndPosition(UDim2.new(0, 23, 0, 23), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)

                callback(location[v.flag])
            end

                ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
            end


            DropFrame.MouseEnter:Connect(function()
                TweenService:Create(
                    DropFrameStroke,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextLabel_TapDrop,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    DropArbt_listimage,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {ImageColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )

        DropFrame.MouseLeave:Connect(function()
                TweenService:Create(
                    DropFrameStroke,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextLabel_TapDrop,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    DropArbt_listimage,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {ImageColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )


        ButtonDrop.MouseButton1Click:Connect(function()
            if dog == false then
                TweenService:Create(
                    DropFrame,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 213, 0, FrameSize)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    DropArbt_listimage,
                    TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {Rotation = -180}
                ):Play()
                ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
            else
                TweenService:Create(
                    DropFrame,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    DropArbt_listimage,
                    TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {Rotation = 0}
                ):Play()
                ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
            end
            dog = not dog
        end
    )
    ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )



            end



            end

            function items:TextBox(text,text2,callback)
                local TextFrame = Instance.new("Frame")

                TextFrame.Name = "TextFrame"
                TextFrame.Parent = ScrollingFrame_Pageframe
                TextFrame.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)
                TextFrame.BorderSizePixel = 0
                TextFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                TextFrame.Size = UDim2.new(0, 213, 0, 70)
                TextFrame.BackgroundTransparency  = 1
                TextFrame.ClipsDescendants = true

                local LabelNameSliderxd = Instance.new("TextLabel")

                LabelNameSliderxd.Parent = TextFrame
                LabelNameSliderxd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LabelNameSliderxd.BackgroundTransparency = 1
                LabelNameSliderxd.BorderSizePixel = 0
                LabelNameSliderxd.Position = UDim2.new(0.5, 0, 0.2, 0)
                LabelNameSliderxd.AnchorPoint = Vector2.new(0.5, 0.5)
                LabelNameSliderxd.Size = UDim2.new(0, 160, 0, 20)
                LabelNameSliderxd.Font = Enum.Font.GothamBold
                LabelNameSliderxd.Text = tostring(text)
                LabelNameSliderxd.TextColor3 = Color3.fromRGB(155, 155, 155)
                LabelNameSliderxd.TextSize = 11.000
                LabelNameSliderxd.TextXAlignment = Enum.TextXAlignment.Center

                local ConerTextBox = Instance.new("UICorner")

                ConerTextBox.CornerRadius = UDim.new(0, 4)
                ConerTextBox.Name = ""
                ConerTextBox.Parent = TextFrame

                local FrameBox = Instance.new("Frame")

                FrameBox.Name = "TextFrame"
                FrameBox.Parent = TextFrame
                FrameBox.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)
                FrameBox.BorderSizePixel = 0
                FrameBox.Position = UDim2.new(0.5, 0, 0.65, 0)
                FrameBox.AnchorPoint = Vector2.new(0.5, 0.5)
                FrameBox.Size = UDim2.new(0, 158, 0, 30)
                FrameBox.BackgroundTransparency  = 0.2
                FrameBox.ClipsDescendants = true
                FrameBox.AnchorPoint = Vector2.new(0.5, 0.5)

                local TextFrame2 = Instance.new("TextBox")

                TextFrame2.Parent = FrameBox
                TextFrame2.BackgroundColor3 = _G.Color
                TextFrame2.BorderSizePixel = 0
                TextFrame2.ClipsDescendants = true
                TextFrame2.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextFrame2.AnchorPoint = Vector2.new(0.5, 0.5)
                TextFrame2.Size = UDim2.new(0, 158, 0, 35)
                TextFrame2.Font = Enum.Font.GothamBold
                TextFrame2.PlaceholderColor3 = Color3.fromRGB(155, 155, 155)
                TextFrame2.PlaceholderText = text2
                TextFrame2.Text = ""
                TextFrame2.TextColor3 = Color3.fromRGB(155, 155, 155)
                TextFrame2.TextSize = 12.000
                TextFrame2.BackgroundTransparency = 1

                local ConerTextBox2 = Instance.new("UICorner")

                ConerTextBox2.CornerRadius = UDim.new(0, 4)
                ConerTextBox2.Name = ""
                ConerTextBox2.Parent = FrameBox

                local TextBoxStroke = Instance.new("UIStroke")

                TextBoxStroke.Thickness = 1
                TextBoxStroke.Name = ""
                TextBoxStroke.Parent = FrameBox
                TextBoxStroke.LineJoinMode = Enum.LineJoinMode.Round
                TextBoxStroke.Color = _G.Color
                TextBoxStroke.Transparency = 0.7


                TextFrame.MouseEnter:Connect(function()
                    TweenService:Create(
                        FrameBox,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        FrameBox,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 = _G.Color} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextFrame2,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {PlaceholderColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextFrame2,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        LabelNameSliderxd,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextBoxStroke,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Thickness = 0} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end
            )

            TextFrame.MouseLeave:Connect(function()
                TweenService:Create(
                    FrameBox,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 158, 0, 30)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    FrameBox,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 = Color3.fromRGB(23, 23, 23)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextFrame2,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {PlaceholderColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextBoxStroke,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Thickness = 1} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    LabelNameSliderxd,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextFrame2,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
            )
                TextFrame2.FocusLost:Connect(function ()
                    if #TextFrame2.Text > 0 then
                        pcall(callback,TextFrame2.Text)
                    end
                end)
            end

            function items:Bind(text,bi,callback)
                local BindFrame = Instance.new("Frame")

                BindFrame.Name = "BindFrame"
                BindFrame.Parent = ScrollingFrame_Pageframe
                BindFrame.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)
                BindFrame.BorderSizePixel = 0
                BindFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
                BindFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                BindFrame.Size = UDim2.new(0, 213, 0, 35)
                BindFrame.BackgroundTransparency  = 0
                BindFrame.ClipsDescendants = true

                local BindConner = Instance.new("UICorner")

                BindConner.CornerRadius = UDim.new(0, 4)
                BindConner.Name = ""
                BindConner.Parent = BindFrame

                local BindStroke = Instance.new("UIStroke")

                BindStroke.Thickness = 1
                BindStroke.Name = ""
                BindStroke.Parent = BindFrame
                BindStroke.LineJoinMode = Enum.LineJoinMode.Round
                BindStroke.Color = _G.Color
                BindStroke.Transparency = 0.7

                local LabelBind = Instance.new("TextLabel")

                LabelBind.Parent = BindFrame
                LabelBind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LabelBind.BackgroundTransparency = 1
                LabelBind.BorderSizePixel = 0
                LabelBind.Position = UDim2.new(0.4, 0, 0.5, 0)
                LabelBind.AnchorPoint = Vector2.new(0.5, 0.5)
                LabelBind.Size = UDim2.new(0, 140, 0, 35)
                LabelBind.Font = Enum.Font.GothamBold
                LabelBind.Text = tostring(text)
                LabelBind.TextColor3 = Color3.fromRGB(155, 155, 155)
                LabelBind.TextSize = 11.000
                LabelBind.TextXAlignment = Enum.TextXAlignment.Left

                local key = bi.Name
                local LabelBind2 = Instance.new("TextButton")

                LabelBind2.Parent = BindFrame
                LabelBind2.Name = "LabelBind2"
                LabelBind2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LabelBind2.Size = UDim2.new(0, 100, 0, 19)
                LabelBind2.Font = Enum.Font.GothamBold
                LabelBind2.Text =  "KEY : "..key
                LabelBind2.TextColor3 = Color3.fromRGB(155, 155, 155)
                LabelBind2.TextSize = 11.000
                LabelBind2.AnchorPoint = Vector2.new(0.5, 0.5)
                LabelBind2.Position = UDim2.new(0.75, 0, 0.5, 0)
                LabelBind2.TextXAlignment = Enum.TextXAlignment.Center
                LabelBind2.BackgroundTransparency = 1
                LabelBind2.TextWrapped = true

                local LabelBind22 = Instance.new("TextButton")

                LabelBind22.Parent = BindFrame
                LabelBind22.Name = "LabelBind22"
                LabelBind22.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LabelBind22.Size = UDim2.new(0, 213, 0, 35)
                LabelBind22.Font = Enum.Font.GothamBold
                LabelBind22.Text =  ""
                LabelBind22.TextColor3 = Color3.fromRGB(155, 155, 155)
                LabelBind22.TextSize = 11.000
                LabelBind22.AnchorPoint = Vector2.new(0.5, 0.5)
                LabelBind22.Position = UDim2.new(0.5, 0, 0.5, 0)
                LabelBind22.TextXAlignment = Enum.TextXAlignment.Center
                LabelBind22.BackgroundTransparency = 1
                LabelBind22.TextWrapped = true

                BindFrame.MouseEnter:Connect(function()
                    TweenService:Create(
                        BindStroke,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        LabelBind22,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        LabelBind2,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        LabelBind,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end
            )
                BindFrame.MouseLeave:Connect(function()
                    TweenService:Create(
                        BindStroke,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        LabelBind22,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        LabelBind2,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        LabelBind,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end
            )

                LabelBind22.MouseButton1Click:Connect(function ()


                    LabelBind2.Text = "KEY : ".."..."
                    local inputwait = game:GetService("UserInputService").InputBegan:wait()
                    local fuckulop = inputwait.KeyCode == Enum.KeyCode.Unknown and inputwait.UserInputType or inputwait.KeyCode

                    if
                    fuckulop.Name ~= "Focus" and fuckulop.Name ~= "MouseMovement" and fuckulop.Name ~= "Focus"
                    then
                        LabelBind2.Text =  "KEY : "..fuckulop.Name
                        key = fuckulop.Name
                    end
                    -- if fuckulop.Name ~= "Unknown" then
                    --     LabelBind2.Text = fuckulop.Name
                    --     key = fuckulop.Name
                    -- end

                end)


                game:GetService("UserInputService").InputBegan:connect(
                    function(current)
                        local fuckulop2 = current.KeyCode == Enum.KeyCode.Unknown and current.UserInputType or current.KeyCode

                            if fuckulop2.Name ==  key then
                                if UserInputService:GetFocusedTextBox() then return end
                                pcall(callback)

                        end
                    end
                    )

            end

            function items:Line()
                local LineFrame = Instance.new("Frame")

                LineFrame.Name = "LineFrame"
                LineFrame.Parent = ScrollingFrame_Pageframe
                LineFrame.BackgroundColor3 =  _G.Color
                LineFrame.BorderSizePixel = 0
                LineFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
                LineFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                LineFrame.Size = UDim2.new(0, 213, 0, 1)
                LineFrame.BackgroundTransparency  = 0
                LineFrame.ClipsDescendants = true

                local LineFrame_BindConner = Instance.new("UICorner")

                LineFrame_BindConner.CornerRadius = UDim.new(0, 30)
                LineFrame_BindConner.Name = ""
                LineFrame_BindConner.Parent = LineFrame

            end

            function items:Color(text,preset,callback)
                local Pixker = Instance.new("Frame")

                Pixker.Name = "Pixker"
                Pixker.Parent = ScrollingFrame_Pageframe
                Pixker.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
                Pixker.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
                Pixker.Size = UDim2.new(0, 213, 0, 33)
                Pixker.BackgroundTransparency = 0
                Pixker.BorderSizePixel = 0
                Pixker.AnchorPoint = Vector2.new(0.5, 0.5)
                Pixker.Position = UDim2.new(0.5, 0, 0.5, 0)
                Pixker.ClipsDescendants = true


                local BoxColorCorner2 = Instance.new("UICorner")

                BoxColorCorner2.CornerRadius = UDim.new(0, 4)
                BoxColorCorner2.Name = "BoxColorCorner"
                BoxColorCorner2.Parent = Pixker

                local MheeFrameStroke = Instance.new("UIStroke")

                MheeFrameStroke.Thickness = 1
                MheeFrameStroke.Name = ""
                MheeFrameStroke.Parent = Pixker
                MheeFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
                MheeFrameStroke.Color = _G.Color
                MheeFrameStroke.Transparency = 0.7


                local TextFrameColor = Instance.new("TextLabel")

                TextFrameColor.Parent = Pixker
                TextFrameColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextFrameColor.BorderSizePixel = 0
                TextFrameColor.Size = UDim2.new(0, 200, 0, 34)
                TextFrameColor.Font = Enum.Font.SourceSans
                TextFrameColor.Text = "  "
                TextFrameColor.TextColor3 = Color3.fromRGB(0, 0, 0)
                TextFrameColor.TextSize = 14.000
                TextFrameColor.BackgroundTransparency = 1
                TextFrameColor.Position = UDim2.new(0., 0, 0., 0)

                local TextReal = Instance.new("TextLabel")

                TextReal.Parent = TextFrameColor
                TextReal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextReal.BorderSizePixel = 0
                TextReal.Size = UDim2.new(0, 140, 0, 34)
                TextReal.Font = Enum.Font.GothamBold
                TextReal.Text = text
                TextReal.TextColor3 = Color3.fromRGB(155,155, 155)
                TextReal.TextSize = 12.000
                TextReal.BackgroundTransparency = 1
                TextReal.Position = UDim2.new(0.05, 0, 0., 0)
                TextReal.TextXAlignment = Enum.TextXAlignment.Left

                local BoxColor = Instance.new("Frame")

                BoxColor.Name = "BoxColor"
                BoxColor.Parent = TextFrameColor
                BoxColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                BoxColor.Position = UDim2.new(0.85, 0, 0.5, 0)
                BoxColor.Size = UDim2.new(0, 35, 0, 19)
                BoxColor.AnchorPoint = Vector2.new(0.5, 0.5)

                local BoxColorCorner = Instance.new("UICorner")

                BoxColorCorner.CornerRadius = UDim.new(0, 4)
                BoxColorCorner.Name = "BoxColorCorner"
                BoxColorCorner.Parent = BoxColor

                local TextButton_Dropdown = Instance.new("TextButton")


                TextButton_Dropdown.Parent = TextFrameColor
                TextButton_Dropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                TextButton_Dropdown.BorderSizePixel = 0
                TextButton_Dropdown.Position = UDim2.new(0., 0, 0.14705883, 0)
                TextButton_Dropdown.Size = UDim2.new(0, 200, 0, 33)
                TextButton_Dropdown.Font = Enum.Font.SourceSans
                TextButton_Dropdown.Text = "  "
                TextButton_Dropdown.TextColor3 = Color3.fromRGB(0, 0, 0)
                TextButton_Dropdown.TextSize = 14.000
                TextButton_Dropdown.AutoButtonColor = false
                --TextButton_Dropdown.AnchorPoint = Vector2.new(0.5, 0.5)
                TextButton_Dropdown.Position = UDim2.new(0, 0, 0, 0)
                TextButton_Dropdown.BackgroundTransparency = 1



                Pixker.MouseEnter:Connect(function()
                    TweenService:Create(
                        MheeFrameStroke,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Transparency = 0.}
                    ):Play()
                    TweenService:Create(
                        TextReal,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255,255, 255)}
                    ):Play()

                end)
                Pixker.MouseLeave:Connect(function()
                    TweenService:Create(
                        MheeFrameStroke,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Transparency = 0.7}
                    ):Play()
                    TweenService:Create(
                        TextReal,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(155,155, 155)}
                    ):Play()
                end)
            -- Rainbow Toggle


            local TextButton_2_Toggle = Instance.new("TextButton")

            TextButton_2_Toggle.Parent = TextFrameColor
            TextButton_2_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155, 155)
    --        TextButton_2_Toggle.BorderColor3 = _G.Color
            TextButton_2_Toggle.BorderSizePixel = 0
            TextButton_2_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
            TextButton_2_Toggle.Position = UDim2.new(0.2, 0, 1.87, 0)
            TextButton_2_Toggle.Size = UDim2.new(0, 30, 0, 13)
            TextButton_2_Toggle.Font = Enum.Font.SourceSans
            TextButton_2_Toggle.Text = " "
            TextButton_2_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton_2_Toggle.TextSize = 12.000
            TextButton_2_Toggle.AutoButtonColor = false

            local TextButton_Pageframe_Uiconner = Instance.new("UICorner")

            TextButton_Pageframe_Uiconner.CornerRadius = UDim.new(0, 30)
            TextButton_Pageframe_Uiconner.Name = ""
            TextButton_Pageframe_Uiconner.Parent = TextButton_2_Toggle

            local TextButton_3_Toggle = Instance.new("TextButton")

            TextButton_3_Toggle.Parent = TextButton_2_Toggle
            TextButton_3_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255,255)
    --        TextButton_3_Toggle.BorderColor3 = _G.Color
            TextButton_3_Toggle.BorderSizePixel = 0
            TextButton_3_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
            TextButton_3_Toggle.Position = UDim2.new(0.1, 0, 0.5, 0)
            TextButton_3_Toggle.Size = UDim2.new(0, 19, 0, 19)
            TextButton_3_Toggle.Font = Enum.Font.SourceSans
            TextButton_3_Toggle.Text = " "
            TextButton_3_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton_3_Toggle.TextSize = 12.000
            TextButton_3_Toggle.AutoButtonColor = false

            local TextButton_Pageframe_Uiconner2 = Instance.new("UICorner")

            TextButton_Pageframe_Uiconner2.CornerRadius = UDim.new(0, 30)
            TextButton_Pageframe_Uiconner2.Name = ""
            TextButton_Pageframe_Uiconner2.Parent = TextButton_3_Toggle

            local TextButton_4_Toggle = Instance.new("TextButton")

            TextButton_4_Toggle.Parent = TextButton_3_Toggle
            TextButton_4_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155,155)
    --        TextButton_3_Toggle.BorderColor3 = _G.Color
            TextButton_4_Toggle.BorderSizePixel = 0
            TextButton_4_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
            TextButton_4_Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
            TextButton_4_Toggle.Size = UDim2.new(0, 27, 0, 27-2)
            TextButton_4_Toggle.Font = Enum.Font.SourceSans
            TextButton_4_Toggle.Text = " "
            TextButton_4_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton_4_Toggle.TextSize = 12.000
            TextButton_4_Toggle.AutoButtonColor = false
            TextButton_4_Toggle.BackgroundTransparency = 1
            TextButton_4_Toggle.Visible = true

            local TextButton_Pageframe_Uiconner4 = Instance.new("UICorner")

            TextButton_Pageframe_Uiconner4.CornerRadius = UDim.new(0, 30)
            TextButton_Pageframe_Uiconner4.Name = ""
            TextButton_Pageframe_Uiconner4.Parent = TextButton_4_Toggle


            local TextButton_Toggle = Instance.new("TextButton")

            TextButton_Toggle.Parent = ValueFrame
            TextButton_Toggle.BackgroundTransparency =1
            TextButton_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextButton_Toggle.BorderSizePixel = 0
            TextButton_Toggle.Size = UDim2.new(0, 50, 0, 20)
            TextButton_Toggle.AutoButtonColor = false
            TextButton_Toggle.Font = Enum.Font.SourceSans
            TextButton_Toggle.Text = " "
            TextButton_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton_Toggle.TextSize = 12.000
            TextButton_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
            TextButton_Toggle.Position = UDim2.new(1.25, 0, 0.4, 0)

            local TextButton_3_Toggle2 = Instance.new("TextLabel")

            TextButton_3_Toggle2.Parent = TextButton_2_Toggle
            TextButton_3_Toggle2.BackgroundColor3 = Color3.fromRGB(32, 32,32)
            TextButton_3_Toggle2.BorderColor3 = _G.Color
            TextButton_3_Toggle2.BorderSizePixel = 0
            TextButton_3_Toggle2.AnchorPoint = Vector2.new(0.5, 0.5)
            TextButton_3_Toggle2.Position = UDim2.new(1.9, 0, 0.5, 0)
            TextButton_3_Toggle2.Size = UDim2.new(0, 500, 0, 21)
            TextButton_3_Toggle2.Font = Enum.Font.SourceSansBold
            TextButton_3_Toggle2.Text = "Rainbow"
            TextButton_3_Toggle2.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextButton_3_Toggle2.TextSize = 13.000
            TextButton_3_Toggle2.BackgroundTransparency = 1

            local OMF = Instance.new("TextButton")

            OMF.Parent = TextButton_2_Toggle
            OMF.BackgroundTransparency =1
            OMF.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            OMF.BorderSizePixel = 0
            OMF.Size = UDim2.new(0, 100, 0, 20)
            OMF.AutoButtonColor = false
            OMF.Font = Enum.Font.SourceSans
            OMF.Text = " "
            OMF.TextColor3 = Color3.fromRGB(0, 0, 0)
            OMF.TextSize = 12.000
            OMF.AnchorPoint = Vector2.new(0.5, 0.5)
            OMF.Position = UDim2.new(1.3, 0, 0.5, 0)

            local Color =  Instance.new("ImageLabel")

            Color.Name = "Color"
            Color.Parent = TextFrameColor
            Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
            Color.Position = UDim2.new(0.05,0,4,0)
            Color.Size = UDim2.new(0, 195, 0, 40)
            Color.ZIndex = 0
            Color.BorderSizePixel = 0
            Color.Image = "rbxassetid://4155801252"

            local ColorFucj = Instance.new("UICorner")

            ColorFucj.CornerRadius = UDim.new(0, 4)
            ColorFucj.Name = ""
            ColorFucj.Parent = Color

            local ColorSelection =  Instance.new("ImageLabel")

            ColorSelection.Name = "ColorSelection"
            ColorSelection.Parent = Color
            ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
            ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorSelection.BackgroundTransparency = 1.000
            ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
            ColorSelection.Size = UDim2.new(0, 18, 0, 18)
            ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
            ColorSelection.ScaleType = Enum.ScaleType.Fit
            ColorSelection.Visible = true

            local Hue =  Instance.new("ImageLabel")

            Hue.Name = "Hue2"
            Hue.Parent = TextFrameColor
            Hue.Position = UDim2.new(0.14,0,3,0)
            Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Hue.Size = UDim2.new(0, 160, 0, 25)
            Hue.ZIndex = 0
            Hue.BorderSizePixel = 0

            local ColorFucj2 = Instance.new("UICorner")

            ColorFucj2.CornerRadius = UDim.new(0, 4)
            ColorFucj2.Name = ""
            ColorFucj2.Parent = Hue

            local HueGradient = Instance.new("UIGradient")

            HueGradient.Color = ColorSequence.new {
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
                ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
                ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
                ColorSequenceKeypoint.new(0.60, _G.Color),
                ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
                ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
            }
            HueGradient.Rotation = 0
            HueGradient.Name = "HueGradient"
            HueGradient.Parent = Hue

            local HueSelection =  Instance.new("ImageLabel")

            HueSelection.Name = "HueSelection"
            HueSelection.Parent = Hue
            HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
            HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            HueSelection.BackgroundTransparency = 1.000
            HueSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
            HueSelection.Size = UDim2.new(0, 18, 0, 18)
            HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
            HueSelection.ScaleType = Enum.ScaleType.Fit
            HueSelection.Visible = true


            local BTN_XD = Instance.new("TextButton")

            BTN_XD.Parent = TextFrameColor
            BTN_XD.BackgroundColor3 = _G.Color
            BTN_XD.BorderColor3 = _G.Color
            BTN_XD.BorderSizePixel = 0
            BTN_XD.AnchorPoint = Vector2.new(0.5, 0.5)
            BTN_XD.Position = UDim2.new(0.8, 0, 1.9, 0)
            BTN_XD.Size = UDim2.new(0, 50, 0, 25)
            BTN_XD.Font = Enum.Font.GothamBold
            BTN_XD.Text = "Confirm"
            BTN_XD.TextColor3 = Color3.fromRGB(255, 255, 255)
            BTN_XD.TextSize = 11.000
            BTN_XD.AutoButtonColor = false

            local BTN_XD_COnner = Instance.new("UICorner")

            BTN_XD_COnner.CornerRadius = UDim.new(0, 4)
            BTN_XD_COnner.Name = ""
            BTN_XD_COnner.Parent = BTN_XD



            local MheeFrameStroke = Instance.new("UIStroke")

            MheeFrameStroke.Thickness = 1
            MheeFrameStroke.Name = ""
            MheeFrameStroke.Parent = BTN_XD
            MheeFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
            MheeFrameStroke.Color = _G.Color
            MheeFrameStroke.Transparency = 0.7


            local UwU = false


            OMF.MouseButton1Click:Connect(function()
                if       UwU == false  then
                    TweenService:Create(
                        TextButton_4_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  _G.Color} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextButton_3_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  _G.Color} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextButton_2_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  _G.Color} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
                else
                    TweenService:Create(
                        TextButton_4_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextButton_3_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextButton_2_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(0.1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
                end
                UwU = not UwU
            end
        )


        OMF.MouseEnter:Connect(function()
                TweenService:Create(
                    TextButton_4_Toggle,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 0.6} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )

        OMF.MouseLeave:Connect(function()
                TweenService:Create(
                    TextButton_4_Toggle,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 1} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )

        OMF.MouseButton1Down:Connect(
                function()
                    RainbowColorPicker = not RainbowColorPicker

                    if ColorInput then
                        ColorInput:Disconnect()
                    end

                    if HueInput then
                        HueInput:Disconnect()
                    end

                    if RainbowColorPicker then


                        OldToggleColor = BoxColor.BackgroundColor3
                        OldColor = Color.BackgroundColor3
                        OldColorSelectionPosition = ColorSelection.Position
                        OldHueSelectionPosition = HueSelection.Position

                        while RainbowColorPicker do
                            BoxColor.BackgroundColor3 = Color3.fromHSV(Red.RainbowColorValue, 1, 1)
                            Color.BackgroundColor3 = Color3.fromHSV(Red.RainbowColorValue, 1, 1)

                            ColorSelection.Position = UDim2.new(1, 0, 0, 0)
                            HueSelection.Position = UDim2.new(0,  Red.HueSelectionPosition, 0.5,0)

                            pcall(callback, BoxColor.BackgroundColor3)
                            wait()
                        end
                    elseif not RainbowColorPicker then

                        BoxColor.BackgroundColor3 = OldToggleColor
                        Color.BackgroundColor3 = OldColor

                        ColorSelection.Position = OldColorSelectionPosition
                        HueSelection.Position = OldHueSelectionPosition

                        pcall(callback, BoxColor.BackgroundColor3)
                    end
                end
            )
            TextButton_3_Toggle.MouseButton1Down:Connect(
                function()
                    RainbowColorPicker = not RainbowColorPicker

                    if ColorInput then
                        ColorInput:Disconnect()
                    end

                    if HueInput then
                        HueInput:Disconnect()
                    end

                    if RainbowColorPicker then


                        OldToggleColor = BoxColor.BackgroundColor3
                        OldColor = Color.BackgroundColor3
                        OldColorSelectionPosition = ColorSelection.Position
                        OldHueSelectionPosition = HueSelection.Position

                        while RainbowColorPicker do
                            BoxColor.BackgroundColor3 = Color3.fromHSV(Red.RainbowColorValue, 1, 1)
                            Color.BackgroundColor3 = Color3.fromHSV(Red.RainbowColorValue, 1, 1)

                            ColorSelection.Position = UDim2.new(1, 0, 0, 0)
                            HueSelection.Position = UDim2.new(0,  Red.HueSelectionPosition, 0.5,0)

                            pcall(callback, BoxColor.BackgroundColor3)
                            wait()
                        end
                    elseif not RainbowColorPicker then

                        BoxColor.BackgroundColor3 = OldToggleColor
                        Color.BackgroundColor3 = OldColor

                        ColorSelection.Position = OldColorSelectionPosition
                        HueSelection.Position = OldHueSelectionPosition

                        pcall(callback, BoxColor.BackgroundColor3)
                    end
                end
            )


            local function UpdateColorPicker(nope)
                BoxColor.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
                Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

                pcall(callback, BoxColor.BackgroundColor3)
            end
            ColorH =
            1 -
            (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
                Hue.AbsoluteSize.Y)
            ColorS =
                (math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
                    Color.AbsoluteSize.X)
            ColorV =
                1 -
                (math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
                    Color.AbsoluteSize.Y)

            BoxColor.BackgroundColor3 = preset
            Color.BackgroundColor3 = preset
            pcall(callback, BoxColor.BackgroundColor3)

            local RainbowColorPicker = false

            Color.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if RainbowColorPicker then
                            return
                        end

                        if ColorInput then
                            ColorInput:Disconnect()
                        end

                        ColorInput =
                            RunService.RenderStepped:Connect(
                                function()
                                local ColorX =
                                    (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
                                        Color.AbsoluteSize.X)
                                local ColorY =
                                    (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
                                        Color.AbsoluteSize.Y)

                                ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
                                ColorS = ColorX
                                ColorV = 1 - ColorY

                                UpdateColorPicker(true)
                            end
                            )
                    end
                end
            )


                Color.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if ColorInput then
                                ColorInput:Disconnect()
                            end
                        end
                    end
                )

                Hue.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if RainbowColorPicker then
                                return
                            end

                            if HueInput then
                                HueInput:Disconnect()
                            end

                            HueInput =
                                RunService.RenderStepped:Connect(
                                    function()
                                    local HueY =
                                        (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
                                            Hue.AbsoluteSize.Y)
                                    local HueX =
                                        (math.clamp(Mouse.X- Hue.AbsolutePosition.X, 0, Hue.AbsoluteSize.X) /
                                            Hue.AbsoluteSize.X)

                                    HueSelection.Position = UDim2.new(HueX, 0, HueY, 0)
                                    ColorH = 1 - HueY

                                    UpdateColorPicker(true)
                                end
                                )
                        end
                    end
                )

                Hue.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if HueInput then
                                HueInput:Disconnect()
                            end
                        end
                    end
                )
                local sk = false
                TextButton_Dropdown.MouseButton1Click:Connect(function()
                    if sk == false then
                    TweenService:Create(
                        Pixker,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 213, 0, 180)}
                    ):Play()
                else
                    TweenService:Create(
                        Pixker,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 213, 0, 33)}
                    ):Play()
                end
                sk = not sk
                end
            )
                BTN_XD.MouseButton1Click:Connect(
                    function()
                        TweenService:Create(
                            Pixker,
                            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 213, 0, 33)}
                        ):Play()
                        sk = not sk
                    end
                )


            end
            function items:Label(text,image)
                if image == nil then
                    image = logo
                end
                local labaelchange = {}
                local LabelFrame = Instance.new("Frame")


                LabelFrame.Name = "Mainframenoti"
                LabelFrame.Parent = ScrollingFrame_Pageframe
                LabelFrame.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
                LabelFrame.BackgroundTransparency = 0
                LabelFrame.BorderSizePixel = 0
                LabelFrame.ClipsDescendants = false
                LabelFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                LabelFrame.Position = UDim2.new(0.498, 0, 0.5, 0)
                LabelFrame.Size = UDim2.new(0, 213, 0, 28)

                local LabelFarm2 = Instance.new("TextLabel")

                LabelFarm2.Parent = LabelFrame
                LabelFarm2.Name = "TextLabel_Tap"
                LabelFarm2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                LabelFarm2.Size =UDim2.new(0, 130, 0,24 )
                LabelFarm2.Font = Enum.Font.GothamBold
                LabelFarm2.Text = text
                LabelFarm2.TextColor3 = Color3.fromRGB(255, 255, 255)
                LabelFarm2.TextSize = 12.000
                LabelFarm2.AnchorPoint = Vector2.new(0.5, 0.5)
                LabelFarm2.Position = UDim2.new(0.5, 0, 0.5, 0)
                LabelFarm2.TextXAlignment = Enum.TextXAlignment.Center
                LabelFarm2.BackgroundTransparency = 1
                LabelFarm2.TextWrapped = true

                local ImageLabel_gx = Instance.new("ImageLabel")

                ImageLabel_gx.Parent = LabelFrame
                ImageLabel_gx.BackgroundTransparency = 1.000
                ImageLabel_gx.BorderSizePixel = 0
                ImageLabel_gx.Size = UDim2.new(0, 18, 0, 18)
                ImageLabel_gx.AnchorPoint = Vector2.new(0.5, 0.5)
                ImageLabel_gx.Position = UDim2.new(0.06, 0, 0.48, 0)
                ImageLabel_gx.Image = "http://www.roblox.com/asset/?id="..tostring(image)
                ImageLabel_gx.BackgroundTransparency = 1

                local noticore55 = Instance.new("UICorner")

                noticore55.CornerRadius = UDim.new(0, 4)
                noticore55.Name = ""
                noticore55.Parent = LabelFarm2

                local noticore2777 = Instance.new("UICorner")

                noticore2777.CornerRadius = UDim.new(0, 4)
                noticore2777.Name = ""
                noticore2777.Parent = LabelFrame

                local LabelStroke = Instance.new("UIStroke")

                LabelStroke.Thickness = 1
                LabelStroke.Name = ""
                LabelStroke.Parent = LabelFrame
                LabelStroke.LineJoinMode = Enum.LineJoinMode.Round
                LabelStroke.Color = _G.Color
                LabelStroke.Transparency = 0.7

                LabelFrame.MouseEnter:Connect(function()
                    TweenService:Create(
                        LabelStroke,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Transparency =0}
                    ):Play()
                end
            )
                LabelFrame.MouseLeave:Connect(function()
                    TweenService:Create(
                        LabelStroke,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Transparency =0.7}
                    ):Play()
                end
            )
                local funclabel = {}

                function funclabel:Refresh(newtext)
                    LabelFarm2.Text = newtext
                end
                function funclabel:Refresh_img(image)
                    ImageLabel_gx.Image = "http://www.roblox.com/asset/?id="..tostring(image)
                end
                return  funclabel
            end
            return  items
            end
        return  page
        end
    return top
    end

    getgenv().Loaded = false
    -- ====================================================================
    -- Sword Warriors Sword Warriors Sword Warriors Sword Warriors Sword Wa
    -- ====================================================================

    -- /////////////////  Setup  /////////////////
    if not isfolder("Plasma Hub Remake V2/Sword Warriors") then
        makefolder("Plasma Hub Remake V2/Sword Warriors")
    end

    local Golbal_path = "Plasma Hub Remake V2/Sword Warriors/Golbal_Setting.json"
    local Local_path = ("Plasma Hub Remake V2/Sword Warriors/%s.json"):format(LocalPlayer.Name)

    --// Set up file
    function save_local_config()
        JS.write(Local_path, G_Plasma)
    end
    function save_golbal_config()
        JS.write(Golbal_path, G_Golbal)
    end

    load_player_data(Local_path)
    load_golbal_data(Golbal_path)

    -- ////////////////////////////////////////////////////////////////////


	local CurRemotes = game:GetService("ReplicatedStorage"):WaitForChild("CurRemotes")
	local MonsterEvent = CurRemotes:WaitForChild("MonsterEvent")
	local DataChange_Points = CurRemotes:WaitForChild("DataChange_Points")
	local DataChange_Mission = CurRemotes:WaitForChild("DataChange_Mission")
	local RangeEvent = game:GetService("ReplicatedStorage"):WaitForChild("CurrentModule"):WaitForChild("RangeCheck"):WaitForChild("RangeEvent")
	local ForScript = workspace:WaitForChild("ForScript")
	local MainGui = LocalPlayer.PlayerGui.MainGui
	--RangeEvent:FireServer("dayreward")

	local LocalPlayer = game.Players.LocalPlayer

	local stage_data = {
		["Normal"] = "Monster",
		["Infinite"] = "InfiniteMap",
		["Event"] = "SkibiMap",
		["Dril"] = "DrilRaid"
	}

	function find_map()
		local stage = stage_data[G_Plasma.stage]
        
		if (G_Plasma.stage == "Normal") then
		    for _,v in pairs(ForScript[stage]:GetChildren()) do
				task.wait()
				for _,vv in pairs(v:GetChildren()) do
					task.wait()
					if (vv.Player:FindFirstChild(LocalPlayer.Name)) then
						return vv
					end
				end
            end
		elseif (G_Plasma.stage == "Infinite" or G_Plasma.stage == "Dril") then
            for _,v in pairs(ForScript[stage]:GetChildren()) do
				task.wait()
				if (v.Player:FindFirstChild(LocalPlayer.Name)) then
					return v
				end
			end
		else
			if (ForScript[stage].Player:FindFirstChild(LocalPlayer.Name)) then
					return ForScript[stage]
			end
		end
		return
	end
	
	function Body_Noclip()
    	if not LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Body Noclip") then
    		local Body_Noclip = Instance.new("BodyVelocity")
			Body_Noclip.Name = "Body Noclip"
			Body_Noclip.Velocity = Vector3.new()
			Body_Noclip.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			Body_Noclip.Parent = LocalPlayer.Character.HumanoidRootPart
			wait(1)
		end
	end
	
	function noclip()
		local Noclipping = game:GetService('RunService').Stepped:Connect(function()
			if LocalPlayer.Character ~= nil then
				for _, child in pairs(LocalPlayer.Character:GetDescendants()) do
					if child:IsA("BasePart") and child.CanCollide then
						child.CanCollide = false
					end
				end
			end
		end)
		return Noclipping
	end

	function get_mon()
		spawn(function()
			while G_Plasma.ATF do
				if not _G.MonCheck then continue end
				pcall(function()
					local max_z = -math.huge
					local focus
					for i,mon in pairs(_G.map["Monster_"]:GetChildren()) do
						task.wait()
						pcall(function()
							if mon.Hp.Value > 0 then
								local temp_z = mon.HumanoidRootPart.Position.Z
								if temp_z > max_z then
									max_z = temp_z
									focus = mon
								end
							end
						end)
					end
					_G.mon_target = focus
				end)
			end
		end)
	end
			

	function reset_stat()
		DataChange_Points:FireServer("ResetPoints")
		task.wait(.5)
		local max
		for name, val in pairs(G_Plasma.stat) do
			if val == 500 then
				max = {name,val}
				continue
			elseif (val == 0) then
				continue
			end
			DataChange_Points:FireServer(
				"ClickPoints",
				{
					["Obj"] = name,
					["Points"] = val
				}
			)
			task.wait()
		end
		if max then
			print(name,val)
			DataChange_Points:FireServer(
				"ClickPoints",
				{
					["Obj"] = max[1],
					["Points"] = max[2]
				}
			)
		end
	end

	--/////////////////  Window  /////////////////
    local Window = create:Win("Plasma",11390492777)
    local main = Window:Taps("Main")
    local main1 = main:newpage()

    local NC
    local now_stage
    local before_stage
	main1:Toggle("Auto TP Kill", G_Plasma.ATF, function(t)
		G_Plasma.ATF = t
		save_local_config()
		while (G_Plasma.ATF) do
			task.wait()
			print("loop")
			local player_map = find_map()
			_G.map = player_map
			if (not player_map) then
				before_stage = nil
				_G.MonCheck = false
				if LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Body Noclip") then
         				LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Body Noclip"):Destroy()
				end
				wait(.5)
				pcall(function()
           				NC:Disconnect()
      		   		end)
		   		pcall(function()
                    		   _G.MON_ADD:Disconnect()
                  		 end)
				continue
			end
			
            now_stage = player_map.Name
			local HRP = LocalPlayer.Character.HumanoidRootPart
			spawn(function()
                if now_stage ~= before_stage then
                    before_stage = now_stage
                    Body_Noclip()
                    NC = noclip()
			_G.MonCheck = true
			
                    
                    _G.MON_ADD = player_map["Monster_"].ChildAdded:Connect(function(mon)
                        --spawn(function()
                        repeat task.wait() until not G_Plasma.ATF or not mon.Parent or (mon:FindFirstChild("HumanoidRootPart") and mon:FindFirstChild("Hp") and mon:FindFirstChild("Hp").Value > 0)
                        if (G_Plasma.ATF) then
                            repeat task.wait()
                                pcall(function()
                                    MonsterEvent:FireServer(
                                        "DamToMonster",
                                        mon,
                                        {
                                            ["damtype"] = "normal"
                                        }
                                    )
                                end)
                            until not G_Plasma.ATF or not mon.Parent or not mon:FindFirstChild("Hp") or mon:FindFirstChild("Hp").Value <= 0 
                        end
                        --end)
                    end)
                    for _,mon in pairs(player_map["Monster_"]:GetChildren()) do
                        repeat task.wait() until not G_Plasma.ATF or not mon.Parent or (mon:FindFirstChild("HumanoidRootPart") and mon:FindFirstChild("Hp") and mon:FindFirstChild("Hp").Value > 0)
                        if (G_Plasma.ATF) then
                            repeat task.wait()
                                pcall(function()
                                    MonsterEvent:FireServer(
                                        "DamToMonster",
                                        mon,
                                        {
                                            ["damtype"] = "normal"
                                        }
                                    )
                                end)
                            until not G_Plasma.ATF or not mon.Parent or not mon:FindFirstChild("Hp") or mon:FindFirstChild("Hp").Value <= 0 
                        end
                    end
                end
            end)

		   pcall(function()
                        if player_map.Player:FindFirstChild(LocalPlayer.Name) then
                            HRP.CFrame = _G.mon_target.HumanoidRootPart.CFrame + Vector3.new(0,0,-15)
                        end
		   end)
                        
		end
        pcall(function()
            _G.MON_ADD:Disconnect()
        end)
        pcall(function()
            NC:Disconnect()
        end)
        wait(.3)
        if LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Body Noclip") then
            LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Body Noclip"):Destroy()
        end
        before_stage = nil
	end)
	
	G_Plasma.stage = G_Plasma.stage or "Normal"
	main1:Drop("Stage",  G_Plasma.stage, false, {"Normal","Infinite","Event","Dril"},function(f)
		G_Plasma.stage = f
		save_local_config()
	end)

	main1:Line()

	main1:Toggle("Auto Restat", G_Plasma.ARS, function(t)
		G_Plasma.ARS = t
		save_local_config()

		while (G_Plasma.ARS) do
			task.wait()
			-- pcall(function()
				local Health = LocalPlayer.Character.Hp.Value
				local max_h = MainGui.UpgradeFrame.main.GHealth.pluspoint.Text
				local MaxHealth = loadstring('return ' .. max_h:gsub("K", "000"))()
				print((Health * 100) / MaxHealth .. " / 100")
				if ((Health * 100) / MaxHealth <= G_Plasma.Health_Set) then
					reset_stat()
				end
			-- end)
		end
	end)

	main1:Slider("Set Health ( % )", false, false, 1, 100, G_Plasma.Health_Set, 1, false, function(t)
		G_Plasma.Health_Set = tonumber(t)
		save_local_config()
	end)
		
	

    local main2 = main:newpage()

	local name_point = {"GHealth","GDamage","GSpeed","GCriticalHit"}
	G_Plasma.stat = G_Plasma.stat or {
		["GHealth"] = 0,
		["GDamage"] = 0,
		["GSpeed"] = 0,
		["GCriticalHit"] = 0
	}

	main2:Button("Reset Status", reset_stat)
	main2:Bind("Auto Reset Status", Enum.KeyCode.U, reset_stat)

	for _,name in pairs(name_point) do
		main2:Slider(name, false, false, 0, 500, G_Plasma.stat[name], 1, false, function(t)
			G_Plasma.stat[name] = tonumber(t)
			save_local_config()
		end)
	end

    local setting = Window:Taps("Setting")
    local setting1 = setting:newpage()

    _G.ui = Ui_mobile
    setting1:Drop("Stage", G_Plasma.pos_ui or "top-left", false, {"top-left", "top-right", "bottom-left", "bottom-right"},function(f)
	G_Plasma.pos_ui = f
	if f == "top-left" then
		Ui_mobile.Position = UDim2.new(0, 25, 0, 25)
	elseif f == "top-right" then
		Ui_mobile.Position = UDim2.new(1, -25, 0, 25)
	elseif f == "bottom-left" then
		Ui_mobile.Position = UDim2.new(0, 25, 1, -25)
	else
		Ui_mobile.Position = UDim2.new(1, -25, 1, -25)
	end
    end)

    getgenv().Loaded = true

    get_mon()
end
