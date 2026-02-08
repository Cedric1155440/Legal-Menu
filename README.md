# 🎮 Legal Menu - By C Studio

## ✨ Features

### General Hacks
- ⚡ **Speed Hack** - Adjust your walk speed with a custom value
- 📍 **Player Teleport** - Teleport to any player in the game with one click
- 🔄 **Live Player List** - Automatically updates when players join/leave

### First Person Hacks
- 🎯 **Aimbot** - Automatically aims at the closest player
- 👁️ **Smart Tracking** - Smooth camera tracking to nearest target
- ⚙️ **Toggle On/Off** - Easy enable/disable with visual feedback

### Use a executor and copy this link
```lua
-- Copy the raw code from:
https://raw.githubusercontent.com/Cedric1155440/Legal-Menu/main/LegalMenu.lua
```

## 🎮 How to Use

### Opening the Menu
- Press **F3** to open/close the menu
- Or click the **"MENU (F3)"** button in the top-left corner
- Click the **X** button to close the menu

### Navigation
- Click **"General Hacks"** tab for speed and teleport features
- Click **"First Person Hacks"** tab for aimbot
- The active tab will be highlighted in green

### Speed Hack
1. Open the "General Hacks" tab
2. Enter your desired speed value (default: 16, try 50-100 for fast movement)
3. Click "SET SPEED" to apply

### Teleport
1. Open the "General Hacks" tab
2. Scroll through the player list
3. Click on any player's name to teleport to them
4. The button will flash green on successful teleport

### Aimbot
1. Open the "First Person Hacks" tab
2. Click the "AIMBOT OFF" button to enable
3. Your camera will automatically aim at the closest player
4. Click again to disable

## 🎨 UI Features

- **Modern Dark Theme** - Easy on the eyes
- **Draggable Window** - Move the menu anywhere on screen
- **Tab System** - Organized features in separate categories
- **Smooth Animations** - Visual feedback for all actions
- **Responsive Design** - Works on all screen sizes

## ⚙️ Customization

You can easily customize the menu by editing these values in the code:

```lua
-- Default speed
SpeedSlider.Text = "16"  -- Change to your preferred default

-- Menu position
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -225)

-- Menu size
MainFrame.Size = UDim2.new(0, 500, 0, 450)

-- Colors
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
```

## 🛠️ Technical Details

- **Platform:** Roblox (Client-side)
- **Script Type:** LocalScript
- **Language:** Lua
- **Services Used:**
  - Players
  - UserInputService
  - RunService (for aimbot)
  - Workspace Camera

## ⚠️ Important Notes

- All features run client-side
- Speed changes may be limited by game server settings
- Aimbot only aims the camera, does not auto-shoot
- Menu persists through respawns (ResetOnSpawn = false)

## 📝 Changelog

### Version 1.0
- Initial release
- Tab-based navigation system
- Speed hack with custom values
- Player teleportation
- Aimbot with closest target tracking
- F3 hotkey support
- Draggable UI


## 📄 License

C Studio WORK DO NOT DISTRUBUTE

*Press F3 and enjoy! 🎮*
