name = "Coordinate"
description = "Shows your coordinates so you can navigate the world more easily."
author = "Stuart Gilbert"
version = "1.0"
priority = 3
dst_compatible = true
client_only_mod = true
all_clients_require_mod = false
server_filter_tags = {"coordinates", "coords", "coordinate"}
-- TODO
forumthread = ""

api_version = 10
dont_starve_compatible = false
reign_of_giants_compatible = false

icon_atlas = "Coordinate.xml"
icon = "Coordinate.tex"

configuration_options = {
    {
        name = "Position",
        options = {
            {description = "Top Right", data = "top_right"},
            {description = "Top Left", data = "top_left"},
            {description = "Top Center", data = "top_center"},
            {description = "Middle Left", data = "middle_left"},
            {description = "Middle Center", data = "middle_center"},
            {description = "Middle Right", data = "middle_right"},
            {description = "Bottom Left", data = "bottom_left"},
            {description = "Bottom Center", data = "bottom_center"},
            {description = "Bottom Right", data = "bottom_right"},
        },
        default = "top_right"
    },
    {
        name = "Horizontal Margin",
        options = {
            {description = "None", data = 0},
            {description = "Very Tiny", data = 5},
            {description = "Tiny", data = 12.5},
            {description = "Very Small", data = 25},
            {description = "Small", data = 50},
            {description = "Medium", data = 125},
            {description = "Large", data = 235},
            {description = "Huge", data = 350},
            {description = "Giant", data = 450},
        },
        default = 235
    },
    {
        name = "Vertical Margin",
        options = {
            {description = "None", data = 0},
            {description = "Very Tiny", data = 5},
            {description = "Tiny", data = 12.5},
            {description = "Very Small", data = 25},
            {description = "Small", data = 50},
            {description = "Medium", data = 125},
            {description = "Large", data = 235},
            {description = "Very Large", data = 300},
            {description = "Huge", data = 350},
            {description = "Giant", data = 450},
        },
        default = 25
    },
}
