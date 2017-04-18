local Widget = require "widgets/widget"
local ImageButton = require "widgets/imagebutton"

local CoordinatesWidget = Class(Widget, function(self, mapscale)
    Widget._ctor(self, "CoordinatesWidget")
	self.owner = ThePlayer

	mapscale = mapscale or 1

	self.button = self:AddChild(ImageButton())

	local coords_w, coords_h = self.button:GetSize()
	local coords_w, coords_h = coords_w * mapscale, coords_h * mapscale

	self.coordssize = {
		w = coords_w,
		h = coords_h
	}

	self.button:SetScale(.7, .7, .7)
	self.button:SetText("Hello World")
	self.button:SetClickable(false)
	self.button:Show()
end)

return CoordinatesWidget
