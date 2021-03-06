
--texture format: paintings_[name].png, must be the same as the node name (NOT the description)
--sizes are: 1X1, 1X2 (wide), 2X1 (tall), 2X2
local paintings = {
	--{"name/texture", "description", "size"}
	{"hummingbird", "Hummingbird Painting", "2X2", "D00Med"},
	{"dragon", "Dragon Painting", "2X1", "D00Med"},
	{"landscape", "Landscape Painting", "1X2", "D00Med"},
	{"forest", "Forest Painting", "1X2", "D00Med"},
	{"waterlilie", "Water Lily Painting", "1X1", "toby109tt"},
	{"cthulhu", "Cthulhu Painting", "2X2", "toby109tt"},
	{"mistiriusgirl", "Mistirius Girl Painting", "1X2", "toby109tt"},
	{"possessedwoman", "Possessed Woman Painting", "1X2", "D00Med"},
	{"rose", "Rose Painting", "1X1", "toby109tt"},
}

local small = {-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5}
local medium = {-1.5, -0.5, 0.4375, 0.5, 0.5, 0.5}
local tall = {-0.5, -0.5, 0.4375, 0.5, 1.5, 0.5}
local large = {-0.5, -0.5, 0.4375, 1.5, 1.5, 0.5}

for _, row in ipairs(paintings) do
	local name = row[1]
	local description = row[2]
	local size = row[3]
	local artist = row[4]
	local box = small
	if size == "1X2" then
	box = medium
	elseif size == "2X2" then
	box = large
	elseif size == "2X1" then
	box = tall
	end
	minetest.register_node("paintings:"..name, {
	description = description,
	drawtype = "mesh",
	mesh = size..".obj",
	tiles = {
		"paintings_"..name..".png",
	},
	visual_scale = 0.5,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy=1},
	selection_box = {
		type = "fixed",
		fixed = box
	},
	collision_box = {
		type = "fixed",
		fixed = {0,0,0,0,0,0}
	},
	on_construct = function(pos)
	local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Artist: "..artist)
	end,
	sounds = default.node_sound_wood_defaults()
})
end
--[[
minetest.register_node("paintings:easel", {
	description = "Easel",
	tiles = {"default_wood.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy=1},
	on_construct = function(pos)
	local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Painting Easel")
		meta:set_string("formspec", easel_formspec)
	end,
	on_righclick = function(pos, node, clicker, itemstack)
		
	end,
	sounds = default.node_sound_wood_defaults()
})
]]