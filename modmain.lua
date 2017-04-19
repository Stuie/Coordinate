local position_pref = GetModConfigData("Position")
local margin_size_x = GetModConfigData("Horizontal Margin")
local margin_size_y = GetModConfigData("Vertical Margin")

local dir_vert = 0
local dir_horiz = 0
local anchor_vert = 0
local anchor_horiz = 0
local margin_dir_vert = 0
local margin_dir_horiz = 0
local y_align, x_align = position_pref:match("(%a+)_(%a+)")

if x_align == "left" then
	dir_horiz = -1
	anchor_horiz = 1
	margin_dir_horiz = 1
elseif x_align == "center" then
	dir_horiz = 0
	anchor_horiz = 0
	margin_dir_horiz = 0
elseif x_align == "right" then
	dir_horiz = 1
	anchor_horiz = -1
	margin_dir_horiz = -1
end

if y_align == "top" then
	dir_vert = 0
	anchor_vert = -1
	margin_dir_vert = -1
elseif y_align == "middle" then
	dir_vert = -1
	anchor_vert = 0
	margin_dir_vert = 0
elseif y_align == "bottom" then
	dir_vert = -2
	anchor_vert = 1
	margin_dir_vert = 1
end

local require = GLOBAL.require

-- holds the coordinates widget once it's added to the controls widget
local coordinates = nil

local function PositionCoordinates(controls, screensize)
    local hudscale = controls.top_root:GetScale()
    local screenw_full, screenh_full = GLOBAL.unpack(screensize)
    local screenw = screenw_full/hudscale.x
    local screenh = screenh_full/hudscale.y

    local position_x = (anchor_horiz * controls.coordinates.coordssize.w / 2)
            + (dir_horiz * screenw / 2) + (margin_dir_horiz * margin_size_x)
    local position_y = (anchor_vert * controls.coordinates.coordssize.h / 2)
            + (dir_vert * screenh / 2) + (margin_dir_vert * margin_size_y)

    controls.coordinates:SetPosition(position_x, position_y, 0)
end

-- Create a coordinates widget as a child of the controls widget
local function AddCoordinates(controls)
    controls.inst:DoTaskInTime(0, function()
        local CoordinatesWidget = require "widgets/coordinates"

        controls.coordinates = controls.top_root:AddChild(CoordinatesWidget(1))
        local screensize = {GLOBAL.TheSim:GetScreenSize()}
        PositionCoordinates(controls, screensize)

        local OnUpdate_base = controls.OnUpdate
        controls.OnUpdate = function(self, dt)
            OnUpdate_base(self, dt)

            -- x,z,y? Seems like that's correct because the second value is 0 regardless of movement
            local x, z, y = GLOBAL.ThePlayer.Transform:GetWorldPosition()

            local coordinatesString = math.floor(x+0.5) .. "x" .. math.floor(y+0.5)
            controls.coordinates.button:SetText(coordinatesString)

            local curscreensize = {GLOBAL.TheSim:GetScreenSize()}
            if curscreensize[1] ~= screensize[1] or curscreensize[2] ~= screensize[2] then
                PositionCoordinates(controls, curscreensize)
                screensize = curscreensize
            end
        end

        coordinates = controls.coordinates
    end)
end

AddClassPostConstruct("widgets/controls", AddCoordinates)
