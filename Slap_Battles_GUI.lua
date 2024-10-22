if game.PlaceId == 6403373529 then
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    local Window = OrionLib:MakeWindow({
        Name = "Zorara⚡ | Slap Battles!",
        HidePremium = false,
        IntroText = "",
        SaveConfig = true,
        ConfigFolder = "SlapBattlesConfig"
    })

    -- Create the "Main" Tab
    local MainTab = Window:MakeTab({
        Name = "Main",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    MainTab:AddSection({
        Name = "Main Features"
    })

    -- Slap Aura functionality
    local slapAuraEnabled = false

    local function toggleSlapAura()
        slapAuraEnabled = not slapAuraEnabled  -- Toggle Slap Aura on/off
        if slapAuraEnabled then
            print("Slap Aura Activated!")
            while slapAuraEnabled do
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local hrp = character:FindFirstChild("HumanoidRootPart")

                if hrp then
                    -- Find nearby players
                    for _, v in pairs(game:GetService("Players"):GetPlayers()) do
                        if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                            local distance = (v.Character.HumanoidRootPart.Position - hrp.Position).magnitude
                            if distance < 15 then  -- You can adjust this distance (slap range)
                                -- Simulate a slap (e.g., move player to them or trigger slap animation)
                                print("Slapping player: " .. v.Name)
                                -- You can insert your own slap mechanics here, such as triggering an animation or dealing damage
                            end
                        end
                    end
                end
                wait(0.5)  -- Adjust this wait time to control how often the aura checks for nearby players
            end
        else
            print("Slap Aura Deactivated!")
        end
    end

    -- Add a button to toggle Slap Aura
    MainTab:AddButton({
        Name = "Toggle Slap Aura",
        Callback = function()
            toggleSlapAura()
        end
    })

    -- Create the "Anti" Tab
    local AntiTab = Window:MakeTab({
        Name = "Anti",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    AntiTab:AddSection({
        Name = "Anti Features"
    })

    -- Function for Anti Ragdoll
    local function antiRagdoll()
        local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
        
        -- Ensure that the humanoid is always active and not ragdolled
        while character and character:FindFirstChild("Humanoid") do
            character.Humanoid.PlatformStand = false  -- Disables ragdolling
            wait(0.1)  -- Check every 0.1 seconds to prevent ragdoll
        end
        print("Anti Ragdoll Activated!")
    end

    -- Add Anti Ragdoll button
    AntiTab:AddButton({
        Name = "Anti Ragdoll",
        Callback = function()
            antiRagdoll()  -- Activate Anti Ragdoll functionality
        end
    })
end

OrionLib:Init()