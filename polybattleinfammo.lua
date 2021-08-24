-- Polybattle infinite ammo
game:GetService('RunService').Stepped:Connect(function()
    pcall(function()
        game.Players.LocalPlayer.PlayerGui.ScreenGui.Right.ScaleYY.Bottom.EQ.Ammo.Ammo.Text = 'inf'
        require(game.Players.LocalPlayer.Character:FindFirstChildOfClass('Folder').config).AMMO = 2
    end)
end)