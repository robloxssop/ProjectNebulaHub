local CoreGui = game:GetService("CoreGui")

local ToggleUI = Instance.new("ScreenGui")
ToggleUI.Name = "GlowToggleUI"
ToggleUI.Parent = CoreGui

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 150, 0, 50)
ToggleButton.Position = UDim2.new(0, 10, 0, 10) -- มุมซ้ายบน
ToggleButton.Text = "Toggle Glow"
ToggleButton.Parent = ToggleUI
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BorderSizePixel = 2
ToggleButton.AutoButtonColor = true
ToggleButton.Draggable = true -- ทำให้ลากได้
ToggleButton.Active = true
ToggleButton.Selectable = true

-- ฟังก์ชันเปลี่ยนค่า Glow เมื่อกดปุ่ม
ToggleButton.MouseButton1Click:Connect(function()
    local Glow = CoreGui:FindFirstChild("ScreenGui") and CoreGui.ScreenGui:FindFirstChild("Glow")
    if Glow then
        Glow.Visible = not Glow.Visible
        ToggleButton.Text = "เปิด/ปิด"
    end
end)
workspace = game:GetService("Workspace")
players = game:GetService("Players")
local enemies = workspace:FindFirstChild("Enemies")

if enemies then
    task.spawn(function()
        while true do
            for _, enemy in pairs(enemies:GetChildren()) do
                local humanoid = enemy:FindFirstChildOfClass("Humanoid")
                if humanoid and humanoid.Health / humanoid.MaxHealth <= 0.7 then
                    humanoid.Health = 0
                    
                    -- เพิ่ม SimulationRadius ถ้าใช้ exploit
                    local player = players.LocalPlayer
                    if sethiddenproperty and player then
                        sethiddenproperty(player, "SimulationRadius", math.huge)
                    end
                end
            end
            task.wait(0.1) -- ลดการใช้ทรัพยากร
        end
    end)
end
local Library = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/L3nyFromV3rm/Leny-UI/refs/heads/main/Library.lua", true))()

Library.new({
    sizeX = 700,
    sizeY = 600,
    title = "yo",
    tabWidth = 200, -- (72 for icons only)
    PrimaryBackgroundColor = Library.Theme.PrimaryBackgroundColor,
    SecondaryBackgroundColor = Library.Theme.SecondaryBackgroundColor,
    TertiaryBackgroundColor = Library.Theme.TertiaryBackgroundColor,
    TabBackgroundColor = Library.Theme.TabBackgroundColor,
    PrimaryTextColor = Library.Theme.PrimaryTextColor,
    SecondaryTextColor = Library.Theme.SecondaryTextColor,
    PrimaryColor = Library.Theme.PrimaryColor,
    ScrollingBarImageColor = Library.Theme.ScrollingBarImageColor,
    Line = Library.Theme.Line,
})

Library:notify({
    title = "Notification",
    text = "Hello world",
    maxSizeX = 300,
    scaleX = 0.165,
    sizeY = 200,
})

local Main = Library:createLabel({text = "Nebula Hub"})

local Tab = Library:createTab({
    text = "Exploits",
    icon = "124718082122263", -- 20x20 icon you want here
})

local Page1 = Tab:createSubTab({
    text = "Page 1",
    sectionStyle = "Double", -- Make the page a single section style or double, "Single", "Double"
})

local Section = Page1:createSection({
    text = "Section",
    position = "Left",
})

Section:createToggle({
    text = "Auto Farm",
    state = false,
    callback = function(state)
        local workspace = game:GetService("Workspace")
        local players = game:GetService("Players")
        local replicatedStorage = game:GetService("ReplicatedStorage")
        local localPlayer = players.LocalPlayer
        local chr = localPlayer.Character or localPlayer.CharacterAdded:Wait()
        local enemies = workspace:FindFirstChild("Enemies")

        -- เก็บ task ที่รันอยู่
        local tasks = {}

        -- ฟังก์ชันสำหรับหยุด task ทั้งหมด
        local function stopAllTasks()
            for _, t in ipairs(tasks) do
                task.cancel(t)
            end
            table.clear(tasks) -- ล้างรายการ
        end

        -- ฟังก์ชันเลือกเควสต์ตามเลเวล
        function chlv()
            local level = localPlayer:FindFirstChild("Level") and localPlayer.Level.Value or 0
            if level <= 14 then
                QName = "Thug [Level 5]"
                MonName = "Thug [Level 5]"
                NameText = "10,926XP"
            elseif level <= 19 then
                QName = "HumonUser [Level 15]"
                MonName = "HumonUser [Level 15]"
                NameText = "15,656XP"
            elseif level <= 29 then
                QName = "Gryphon [Level 30]"
                MonName = "Gryphon [Level 30]"
                NameText = "26,144XP"
            elseif level <= 39 then
                QName = "Vampire [Level 40]"
                MonName = "Vampire [Level 40]"
                NameText = "38,166XP"
            elseif level <= 54 then
                QName = "Snow Thug [Level 50]"
                MonName = "Snow Thug [Level 50]"
                NameText = "59,582XP"
            elseif level <= 69 then
                QName = "Snowman [Level 65]"
                MonName = "Snowman [Level 65]"
                NameText = "85,867XP"
            elseif level <= 169 then
                QName = "Wammu" 
                MonName = "Wammu"
                NameText = "500,000XP"
            elseif level <= 249 then
                QName = "Dio Royal Guard [Level 180]" 
                MonName = "Dio Royal Guard [Level 180]"
                NameText = "782,107XP"
            elseif level <= 274 then
                QName = "School Bully [Level 270]" 
                MonName = "School Bully [Level 270]"
                NameText = "1,603,616XP"
            elseif level <= 299 then
                QName = "City Criminal [Level 280]" 
                MonName = "City Criminal [Level 280]"
                NameText = "3,230,348XP"
            elseif level <= 349 then
                QName = "Criminal Master [Level 300]" 
                MonName = "Criminal Master [Level 300]"
                NameText = "6,451,549XP"
            elseif level <= 424 then
                QName = "" 
                MonName = ""
                NameText = ""
            end
        end

        -- ฟังก์ชันค้นหามอนสเตอร์
        local function findTargetMonster()
            if enemies then
                for _, monster in pairs(enemies:GetChildren()) do
                    if monster.Name == MonName and monster:FindFirstChild("Humanoid") then
                        local humanoid = monster.Humanoid
                        if humanoid.Health > 0 then
                            return monster
                        end
                    end
                end
            end
            return nil
        end

        -- ฟังก์ชันรับเควสต์
        local function acceptQuest()
            while true do
                task.wait(1)
                chlv()
                if QName == "" then return end
                repeat task.wait() until localPlayer and localPlayer.PlayerGui
                
                local questGui = localPlayer.PlayerGui:FindFirstChild("QuestGui")
                if questGui and questGui:FindFirstChild("QuestTag") and not questGui.QuestTag.Visible then
                    repeat task.wait() until workspace:FindFirstChild("HitboxClick") and workspace.HitboxClick:FindFirstChild(QName)
                    
                    chr.HumanoidRootPart.CFrame = workspace.HitboxClick[QName].CFrame
                    wait(1)
                    replicatedStorage.Remote.GameEvent:FireServer("Quest", QName)
                end
            end
        end

        -- ฟังก์ชันตรวจสอบเควสต์
        local function checkAndCancelQuest()
            while true do
                task.wait(1)
                repeat task.wait() until localPlayer and localPlayer.PlayerGui
                
                local questGui = localPlayer.PlayerGui:FindFirstChild("QuestGui")
                if questGui and questGui:FindFirstChild("QuestTag") and questGui.QuestTag.Visible then
                    if questGui.QuestTag.EXP.Text ~= NameText then
                        replicatedStorage.Remote.GameEvent:FireServer("QuestCancel")
                    end
                end
            end
        end

        -- ฟังก์ชันวาร์ปไปหามอนสเตอร์
        local function autoFarm()
            while true do
                task.wait(0.1)
                chr = localPlayer.Character or chr
                repeat task.wait() until chr and chr:FindFirstChild("HumanoidRootPart")

                local target = nil
                repeat
                    target = findTargetMonster()
                    task.wait(0.1)
                until target

                if target then
                    local targetPart = target:FindFirstChild("HumanoidRootPart") or target.PrimaryPart
                    if targetPart then
                        chr.HumanoidRootPart.CFrame = targetPart.CFrame * CFrame.new(0, 0, 5)
                    end
                end
            end
        end

        -- ถ้าเปิด Toggle ให้รัน
        if state then
            table.insert(tasks, task.spawn(acceptQuest))
            table.insert(tasks, task.spawn(autoFarm))
            table.insert(tasks, task.spawn(checkAndCancelQuest))
        else
            stopAllTasks() -- ถ้าปิด Toggle ให้หยุดทุก task ทันที
        end
    end
}) -- :getState(), :updateState({state = true})

local autoClickEnabled = false  -- ตัวแปรเก็บสถานะเปิด/ปิด
local vu = game:GetService("VirtualUser")

Section:createToggle({
    text = "Auto Click",
    state = false,
    callback = function(click)
        autoClickEnabled = click  -- กำหนดสถานะตาม Toggle
        
        if autoClickEnabled then
            task.spawn(function()
                while autoClickEnabled do
                    vu:Button1Down(Vector2.new(0, 0)) -- คลิกเมาส์ซ้าย
                    wait(0.1)
                    vu:Button1Up(Vector2.new(0, 0)) -- ปล่อยคลิก
                    wait(0.1) -- ป้องกันการทำงานเร็วเกินไป
                end
            end)
        end
    end
})

Section:createKeybind({
    onHeld = false,
    text = "Keybind 1",
    default = "RightBracket",
    callback = function(keyName)
        print(keyName)
    end
}) -- :getKeybind(), :updateKeybind({bind = "LeftShift"})

Section:createSlider({
    text = "Slider 1",
    min = 0,
    max = 100,
    step = 1,
    callback = function(value)
        print(value)
    end
}) -- :getValue(), :updateValue({value = 100})

Section:createPicker({
    text = "ColorPicker 1",
    default = Color3.fromRGB(255, 255, 255),
    callback = function(color)
        print(color)
    end
}) -- :getColor(), :updateColor({color = Color3.fromRGB(255, 255, 0)})

Section:createDropdown({
    text = "Dropdown 1",
    list = {"Hello", "World!"},
    default = {"Hello"},
    multiple = false, -- choose multiple from list, makes callback value return a table now
    callback = function(value)
        print(value)
    end
}) -- :getList() (returns the list you provided, not the value), :getValue(), :updateList({list = {1,2,3}, default = {1, 2}})

Section:createDropdown({
    text = "Multiselect Dropdown",
    list = {1,2,3,4,5},
    default = {1,2},
    multiple = true,
    callback = function(value)
        print(unpack(value))
    end
})

Section:createButton({
    text = "Button 1",
    callback = function()
        print("this is a button")
    end
})

Section:createTextBox({
    text = "TextBox 1",
    default = "hi",
    callback = function(text)
        print(text)
    end,
}) -- :getText(), :updateText({text = "bro"})


-- Addon example
local Toggle = Section:createToggle({
    text = "Toggle 2",
    state = false,
    callback = function(state)
        print(state)
    end
})

-- Takes in same parameters/arguments as above
Toggle:createPicker({})
Toggle:createSlider({})
Toggle:createDropdown({})
Toggle:createToggle({})

-- Flags example
print(shared.Flags.Toggle["Toggle 1"]:getState()) -- refers to the {text = "Toggle 1"} you set for the element

-- Creates the theme changer, config manager, etc
Library:createManager({
    folderName = "brah",
    icon = "124718082122263", -- 20x20 icon you want here
})

