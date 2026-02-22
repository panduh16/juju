repeat
	task["wait"]()
until game:IsLoaded()

-- > ( luraph variables )

if not LPH_OBFUSCATED then
	LPH_JIT_MAX = function(...)
		return ...
	end
	LPH_NO_VIRTUALIZE = function(...)
		return ...
	end
	LPH_ENCSTR = function(...)
		return ...
	end
	LPH_NO_UPVALUES = function(...)
		return ...
	end
	LPH_JIT = function(...)
		return ...
	end
end

-- > ( global cheat variables )

local file_path = getgenv().custom_folder or "juju recode"
local user_input_service = cloneref(game:GetService("UserInputService"))
local get_mouse_location = user_input_service["GetMouseLocation"]
local players_service = cloneref(game:GetService("Players"))
local local_player = players_service["LocalPlayer"]
local mouse = local_player:GetMouse()
local tween_service = cloneref(game:GetService("TweenService"))
local get_value = tween_service["GetValue"]
local run_service = cloneref(game:GetService("RunService"))
local http_service = cloneref(game:GetService("HttpService"))
local workspace = workspace
local camera = cloneref(workspace["CurrentCamera"])
local hui = cloneref(gethui())

local color3_fromrgb = Color3["fromRGB"]
local color3_lerp = color3_fromrgb()["Lerp"]
local vector2_new = Vector2["new"]
local udim2_new = UDim2["new"]

local math_random = math["random"]
local clock = os["clock"]
local delay = task["delay"]
local spawn = task["spawn"]
local clamp = math["clamp"]
local floor = math["floor"]
local wait = task["wait"]
local sqrt = math["sqrt"]
local type = type

local shadow_image_data = base64_decode(
	"iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAQAAABpN6lAAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAAmJLR0QA/4ePzL8AAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAHdElNRQfiAQkTIxqKm+UhAAACvElEQVR42u2dzY7aMBhFjxPHEzJQBolRq77/27XSwBCSkD/PwinS7LpBVwrfeYLjI4Ozuy6Cw+HIyHBkOMCxTiIQmYnMzEQi0S9Hz/EUePIlxDpJB58YGRiZmJlTgIKCQMkLYYmwTtLhe2509AwM6QbkFJRUbKnYEChWHGCgp6WhpoF0AzI8gYodB/bs2BDI1aYPYqKn5cIZR7oPkyejoGTLgZ+888aOEq82fRAjHRdOlEBkZGTwODwvVOx55zdH9rxSqE0fxMCVMxXQ0dHS4TwZOYENO9448osDW4La9EH01GyAhhOfBHKy9Ar4JcGeA0d2Kw5QAu3yT+fJcB7IyJdn8JUtO36sOAB0vFISKNJz7+9fgelTKBAIlGrThxEI3z743Fpf/P/GAqgF1FgAtYAaC6AWUGMB1AJqLIBaQI0FUAuosQBqATUWQC2gxgKoBdRYALWAGgugFlBjAdQCaiyAWkCNBVALqLEAagE1FkAtoMYCqAXUWAC1gBoLoBZQYwHUAmosgFpAjQVQC6ixAGoBNRZALaDGAqgF1FgAtYAaC6AWUGMB1AJqLIBaQI0FUAuosQBqATUWQC2gxgKoBdRYALWAGgugFlBjAdQCaiyAWkCNBVALqLEAagE1FkAtoMYCqAXUWAC1gBoLoBZQYwHUAmosgFpAjQVQC6ixAGoBNRZALaDGAqgF1FgAtYAaC6AWUGMB1AJqLIBaQI0nfpsi7enp1VIPI53uPriaVmfT9ORAT8eVmhJWvDZ3oea6TK5OzOkGzIz3Lc4N0K04QM0HZy609IzMRM98nyI9UQHt6ic3/3JaEkzMnsjIjYYzJdA8xejqH8403BjTDRjoqHFAx+lJZnc/qOkYmP3yD9AAkY7PJxpe7hnTT2BiAGZG2ieb3p6ILj75+LqL4O7Dq245/HoDpAjx32cQ8QtpRORenSWX2AAAABl0RVh0U29mdHdhcmUAcGFpbnQubmV0IDQuMC4xOdTWsmQAAAAASUVORK5CYII="
)
local pixel_image_data = base64_decode(
	"iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAAAYdEVYdFNvZnR3YXJlAFBhaW50Lk5FVCA1LjEuMvu8A7YAAAC2ZVhJZklJKgAIAAAABQAaAQUAAQAAAEoAAAAbAQUAAQAAAFIAAAAoAQMAAQAAAAIAAAAxAQIAEAAAAFoAAABphwQAAQAAAGoAAAAAAAAA8nYBAOgDAADydgEA6AMAAFBhaW50Lk5FVCA1LjEuMgADAACQBwAEAAAAMDIzMAGgAwABAAAAAQAAAAWgBAABAAAAlAAAAAAAAAACAAEAAgAEAAAAUjk4AAIABwAEAAAAMDEwMAAAAACOO8FX0xe8TgAAAAxJREFUGFdj+P//PwAF/gL+pzWBhAAAAABJRU5ErkJggg=="
)
local exponential = Enum["EasingStyle"]["Exponential"]
local circular = Enum["EasingStyle"]["Circular"]
local quad = Enum["EasingStyle"]["Quad"]

local show_transparency = { Transparency = 1 }
local hide_transparency = { Transparency = 0 }
local menu_references = {}

local out = Enum["EasingDirection"]["Out"]

local connections = {}
local addon_data = {}
local heartbeat = {}
local flags = {
	["keybinds_position"] = { 15, camera["ViewportSize"]["Y"] / 2 - 10 },
	["loaded_addons"] = {},
	["favorites"] = {},
}

-- > ( global cheat functions )

local create_connection = LPH_NO_VIRTUALIZE(function(signal, callback)
	local connection = signal:Connect(callback)
	connections[#connections + 1] = connection

	return connection
end)

local create_instance = LPH_NO_VIRTUALIZE(function(class, properties)
	local instance = Instance["new"](class)

	for property, value in properties do
		instance[property] = value
	end

	return instance
end)

local round = LPH_NO_VIRTUALIZE(function(num, decimals)
	local mult = 10 ^ (decimals or 0)
	return floor(num * mult + 0.5 - (num < 0 and 1 or 0)) / mult
end)

local remove = LPH_NO_VIRTUALIZE(function(tbl, index)
	local length = #tbl
	for i = index, length - 1 do
		tbl[i] = tbl[i + 1]
	end
	tbl[length] = nil
end)

-- > ( signal library )

local signal = {}

do
	-- > ( connection class)

	local connection = {}

	connection["__index"] = connection

	function connection.new(signal, callback)
		local callbacks = signal["callbacks"]
		callbacks[#callbacks + 1] = callback

		return setmetatable({
			callback = callback,
			signal = signal,
		}, connection)
	end

	function connection:Disconnect()
		local callbacks = self["signal"]["callbacks"]
		local callback = self["callback"]

		for i = 1, #callbacks do
			if callbacks[i] == callback then
				remove(callbacks, i)

				break
			end
		end
	end

	-- > ( signal class )

	signal["__index"] = signal

	signal.new = LPH_JIT_MAX(function()
		return setmetatable({
			callbacks = {},
		}, signal)
	end)

	function signal:Fire(...)
		local callbacks = self["callbacks"]
		for i = 1, #callbacks do
			spawn(callbacks[i], ...)
		end
	end

	function signal:Connect(callback)
		return connection["new"](self, callback)
	end
end

-- > ( tween library )

local active_tweens = {
	Color = {},
	Color3 = {},
	Size = {},
	tween_position = {},
	Position = {},
	tween_size = {},
	Transparency = {},
	FillTransparency = {},
	OutlineTransparency = {},
	BackgroundTransparency = {},
	ImageTransparency = {},
	FillColor = {},
	OutlineColor = {},
	[11] = {},
	[15] = {},
}

local tween = nil
do
	local sqrt = math["sqrt"]

	tween = LPH_NO_VIRTUALIZE(function(object, properties, easing_style, _, tween_duration)
		local start_time = clock()

		local tween_functions = {}

		for property, value in properties do
			local tweens = active_tweens[property]
			local old_tween = tweens[object]

			if old_tween then
				for i = 1, #heartbeat do
					if heartbeat[i] == old_tween then
						remove(heartbeat, i)
						break
					end
				end
			end

			local old_value = object[property]

			if property == "Color" or property == "Color3" or property == "FillColor" or property == "OutlineColor" then
				tween_functions[property] = function()
					local t = ((clock() - start_time) / tween_duration)
					object[property] = color3_lerp(
						old_value,
						value,
						easing_style == exponential and (t == 1 and 1 or 1 - 2 ^ (-10 * t))
							or easing_style == quad and t ^ 2
							or sqrt(1 - (t - 1) ^ 2)
					) or easing_style == "sine" and t < 0.5 and 0.5 * math.sin(clamp(t, 0, 1) * 355 / 113) or 0.5 + 0.5 * (1 - math.cos(
						(clamp(t, 0, 1) - 0.5) * 355 / 113
					))
				end
			elseif property == "tween_position" or property == "tween_size" then
				tween_functions[property] = function()
					local t = ((clock() - start_time) / tween_duration)
					local tween_value = easing_style == exponential and (t == 1 and 1 or 1 - 2 ^ (-10 * t))
						or easing_style == quad and t ^ 2
						or sqrt(1 - (t - 1) ^ 2)

					local new = (value - old_value)
					new = udim2_new(
						new["X"]["Scale"] * tween_value,
						new["X"]["Offset"] * tween_value,
						new["Y"]["Scale"] * tween_value,
						new["Y"]["Offset"] * tween_value
					)

					object[property] = old_value + new
				end
			else
				tween_functions[property] = function()
					local t = ((clock() - start_time) / tween_duration)

					object[property] = old_value
						+ (value - old_value)
							* (easing_style == exponential and (t == 1 and 1 or 1 - 2 ^ (-10 * t)) or easing_style == quad and t ^ 2 or sqrt(
								1 - (t - 1) ^ 2
							))
				end
			end
		end

		for property, tween in tween_functions do
			heartbeat[#heartbeat + 1] = tween
			active_tweens[property][object] = tween
		end

		delay(tween_duration, function()
			for property, tween in tween_functions do
				for i = 1, #heartbeat do
					if heartbeat[i] == tween then
						remove(heartbeat, i)

						object[property] = properties[property]
						break
					end
				end
			end
		end)
	end)
end

-- > ( menu )

-- > ( menu )

local menu = {
	on_config_loaded = signal["new"](),
	accent = color3_fromrgb(255, 213, 253),
	colors = {
		["shadow"] = color3_fromrgb(154, 213, 222),
		["accent"] = color3_fromrgb(154, 213, 222),
		["active_text"] = color3_fromrgb(197, 197, 197),
		["keybind_text"] = color3_fromrgb(197, 197, 197),
		["border"] = color3_fromrgb(24, 25, 24),
		["inactive_text"] = color3_fromrgb(75, 72, 72),
		["highlighted"] = color3_fromrgb(51, 65, 70),
		["dark_text"] = color3_fromrgb(70, 85, 87),
		["image"] = color3_fromrgb(89, 89, 89),
		["section"] = color3_fromrgb(6, 6, 6),
		["background"] = color3_fromrgb(0, 0, 0),
		["success"] = color3_fromrgb(154, 213, 222),
		["error"] = color3_fromrgb(39, 60, 96),
		["alert"] = color3_fromrgb(30, 51, 61),
		["logo"] = color3_fromrgb(154, 213, 222),
		["juju"] = color3_fromrgb(154, 213, 222),
		["build"] = color3_fromrgb(154, 213, 222),
		["cursor"] = color3_fromrgb(154, 213, 222),
	},
	settings = {},
	notifications = {},
	groups = {},
	favorites = {},
	autoload = nil,
	initial_base_offset = 75,
	ordered_groups = {},
	theme = "",
}

local drawing
local drawing_proxy

do
	-- > ( file system )

	do
		local function safeHttp(url)
			local ok, res = pcall(function()
				return game:HttpGet(url)
			end)
			if not ok or not res then
				warn("Failed to fetch:", url)
				return nil
			end
			return res
		end

		local function debugRBXM(folder, name, url)
			local ok, data = pcall(safeHttp, url)
			if not ok or not data then
				warn("[RBXM DEBUG] Failed to download:", folder, name, url)
				return nil
			end
			return data -- always returns string, never a function
		end

		local files = {
			["assets"] = {
				["api.lua"] = safeHttp("https://raw.githubusercontent.com/panduh16/juju/main/assets/api.lua"),
				["sparkle.ogg"] = safeHttp("https://raw.githubusercontent.com/panduh16/juju/main/assets/sparkle.ogg"),
				["skeet.ogg"] = safeHttp("https://raw.githubusercontent.com/panduh16/juju/main/assets/skeet.ogg"),
				["neverlose.ogg"] = safeHttp(
					"https://raw.githubusercontent.com/panduh16/juju/main/assets/neverlose.ogg"
				),
				["break.ogg"] = safeHttp("https://raw.githubusercontent.com/panduh16/juju/main/assets/break.ogg"),
				["mc bow.ogg"] = safeHttp("https://raw.githubusercontent.com/panduh16/juju/main/assets/mc%20bow.ogg"),
				["primordial.ogg"] = safeHttp(
					"https://raw.githubusercontent.com/panduh16/juju/main/assets/primordial.ogg"
				),
				["rust.ogg"] = safeHttp("https://raw.githubusercontent.com/panduh16/juju/main/assets/rust.ogg"),
				["sexy.ogg"] = safeHttp("https://raw.githubusercontent.com/panduh16/juju/main/assets/sexy.ogg"),
				["jaydes.png"] = safeHttp("https://raw.githubusercontent.com/panduh16/juju/main/assets/jaydes.png"),
				["1.png"] = safeHttp("https://raw.githubusercontent.com/panduh16/juju/main/assets/1.png"),
				["2.png"] = safeHttp("https://raw.githubusercontent.com/panduh16/juju/main/assets/2.png"),
				["logo.png"] = safeHttp("https://raw.githubusercontent.com/panduh16/juju/main/assets/logo.png"),
				["saturation.png"] = safeHttp(
					"https://raw.githubusercontent.com/panduh16/juju/main/assets/saturation.png"
				),
			},
			["custom"] = {
				["textures.json"] = safeHttp(
					"https://raw.githubusercontent.com/panduh16/juju/main/assets/textures.json"
				),
				["character.rbxm"] = debugRBXM(
					"custom",
					"character.rbxm",
					"https://raw.githubusercontent.com/panduh16/juju/main/assets/character.rbxm"
				),
				["pinksky.rbxm"] = debugRBXM(
					"custom",
					"pinksky.rbxm",
					"https://raw.githubusercontent.com/panduh16/juju/main/assets/pinksky.rbxm"
				),
				["crunch.ogg"] = safeHttp("https://raw.githubusercontent.com/panduh16/juju/main/assets/juju.ogg"),
				["scar.ogg"] = safeHttp("https://raw.githubusercontent.com/panduh16/juju/main/assets/scar.ogg"),
				["x hit.rbxm"] = debugRBXM(
					"custom",
					"x hit.rbxm",
					"https://raw.githubusercontent.com/panduh16/juju/main/assets/x%20hit.rbxm"
				),
				["blossom aura.rbxm"] = debugRBXM(
					"custom",
					"blossom aura.rbxm",
					"https://raw.githubusercontent.com/panduh16/juju/main/assets/blossom%20aura.rbxm"
				),
				["spam.json"] = safeHttp("https://raw.githubusercontent.com/panduh16/juju/main/assets/spam.json"),
			},
			["themes"] = {
				["default.th"] = safeHttp("https://raw.githubusercontent.com/panduh16/juju/main/assets/default.th"),
			},
			["addons"] = {},
			["configs"] = {},
			["data.dat"] = [[{"notifications":true,"theme":"","favorites":[]}]],
		}
		if not isfolder(file_path) then
			makefolder(file_path)
		end

		local recursive_check

		recursive_check = function(path, array)
			for file, data in array do
				local path = path .. file
				local data_type = type(data)

				if data_type == "table" then
					if not isfolder(path) then
						makefolder(path)
					end
					recursive_check(path .. "/", data)
				elseif not isfile(path) then
					writefile(path, type(data) == "function" and data() or data)
				end
			end
		end

		recursive_check(file_path .. "/", files)
	end

	-- > ( custom drawing )

	drawing = Drawing
	LPH_NO_VIRTUALIZE(function()
		drawing = _G.FORCE_REAL_DRAWING and Drawing or loadstring(readfile(file_path .. "/assets/api.lua"))()
	end)()

	getgenv()["fake_drawing"] = drawing

	-- > ( global menu variables )

	local context_action_service = cloneref(game:GetService("ContextActionService"))
	local context_action_click = tostring({}):sub(math_random(8, 12))
	local context_action_scroll = tostring({}):sub(math_random(8, 12))
	local context_action_typing = tostring({}):sub(math_random(8, 12))
	local context_action_typing_core = tostring({}):sub(math_random(8, 12))

	local shortened_characters = {
		[Enum.KeyCode.LeftShift] = "lshift",
		[Enum.KeyCode.RightShift] = "rshift",
		[Enum.UserInputType.MouseButton1] = "m1",
		[Enum.UserInputType.MouseButton2] = "m2",
		[Enum.UserInputType.MouseButton3] = "m3",
		[Enum.KeyCode.ButtonX] = "xb",
		[Enum.KeyCode.ButtonY] = "yb",
		[Enum.KeyCode.ButtonA] = "ab",
		[Enum.KeyCode.ButtonB] = "bb",
		[Enum.KeyCode.ButtonR1] = "r1",
		[Enum.KeyCode.ButtonR2] = "r2",
		[Enum.KeyCode.ButtonR1] = "l1",
		[Enum.KeyCode.ButtonR2] = "l2",
		[Enum.KeyCode.DPadLeft] = "dpl",
		[Enum.KeyCode.DPadRight] = "dpr",
		[Enum.KeyCode.DPadUp] = "dpup",
		[Enum.KeyCode.DPadDown] = "dpdn",
		[Enum.KeyCode.Thumbstick1] = "ts1",
		[Enum.KeyCode.Thumbstick2] = "ts2",
		[Enum.KeyCode.Delete] = "delete",
		[Enum.KeyCode.Insert] = "insert",
		[Enum.KeyCode.PageUp] = "pgup",
		[Enum.KeyCode.PageDown] = "pgdw",
		[Enum.KeyCode.LeftControl] = "lctrl",
		[Enum.KeyCode.RightControl] = "rctrl",
		[Enum.KeyCode.RightAlt] = "ralt",
		[Enum.KeyCode.LeftAlt] = "lalt",
		[Enum.KeyCode.CapsLock] = "caps",
		[Enum.KeyCode.ScrollLock] = "slock",
		[Enum.KeyCode.Backspace] = "bspace",
		[Enum.KeyCode.Space] = "space",
		[Enum.KeyCode.Backquote] = "bqte",
		[Enum.KeyCode.BackSlash] = "bsls",
	}

	local on_keybind_created = signal["new"]()
	local on_keybind_deleted = signal["new"]()
	local on_keybind_updated = signal["new"]()
	local on_keybind_change = signal["new"]()
	local transparency_image_data = base64_decode(
		"iVBORw0KGgoAAAANSUhEUgAAABkAAAAMBAMAAABl3At4AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAGUExURf///8rKyoNe1IIAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAYdEVYdFNvZnR3YXJlAFBhaW50Lk5FVCA1LjEuMvu8A7YAAAC2ZVhJZklJKgAIAAAABQAaAQUAAQAAAEoAAAAbAQUAAQAAAFIAAAAoAQMAAQAAAAIAAAAxAQIAEAAAAFoAAABphwQAAQAAAGoAAAAAAAAAYAAAAAEAAABgAAAAAQAAAFBhaW50Lk5FVCA1LjEuMgADAACQBwAEAAAAMDIzMAGgAwABAAAAAQAAAAWgBAABAAAAlAAAAAAAAAACAAEAAgAEAAAAUjk4AAIABwAEAAAAMDEwMAAAAADp1fY4ytpsegAAABdJREFUGNNjYBBEgmg8ZI4AGo+u+hgEAKy7BSkQOa/KAAAAAElFTkSuQmCC"
	)
	local checkmark_image_data = base64_decode(
		"iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAYAAADED76LAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAYdEVYdFNvZnR3YXJlAFBhaW50Lk5FVCA1LjEuMvu8A7YAAAC2ZVhJZklJKgAIAAAABQAaAQUAAQAAAEoAAAAbAQUAAQAAAFIAAAAoAQMAAQAAAAIAAAAxAQIAEAAAAFoAAABphwQAAQAAAGoAAAAAAAAAYAAAAAEAAABgAAAAAQAAAFBhaW50Lk5FVCA1LjEuMgADAACQBwAEAAAAMDIzMAGgAwABAAAAAQAAAAWgBAABAAAAlAAAAAAAAAACAAEAAgAEAAAAUjk4AAIABwAEAAAAMDEwMAAAAADp1fY4ytpsegAAAEFJREFUKFOFj0EOACEIxMD//3ncTsSDYbUXDFMhpKS4MVbt4Kf+BI/Nj07YIesRPIpm1QoBIf1qQqgVls4QHmdGTFexGgt5dAJMAAAAAElFTkSuQmCC"
	)
	local config_image_data = base64_decode(
		"iVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAYAAACNMs+9AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAYdEVYdFNvZnR3YXJlAFBhaW50Lk5FVCA1LjEuMvu8A7YAAAC2ZVhJZklJKgAIAAAABQAaAQUAAQAAAEoAAAAbAQUAAQAAAFIAAAAoAQMAAQAAAAIAAAAxAQIAEAAAAFoAAABphwQAAQAAAGoAAAAAAAAAYAAAAAEAAABgAAAAAQAAAFBhaW50Lk5FVCA1LjEuMgADAACQBwAEAAAAMDIzMAGgAwABAAAAAQAAAAWgBAABAAAAlAAAAAAAAAACAAEAAgAEAAAAUjk4AAIABwAEAAAAMDEwMAAAAADp1fY4ytpsegAAAFFJREFUKFOdz8ERwCAIBEC0x6QmuzYcORlkhofuB0VEbKKmQoya4tJ0xuzNl6tC64hiNZj6n04eHvlY5YyRz4tCsE3A9FnH7TNILEy5u441kQ8rkEMeEE8J7QAAAABJRU5ErkJggg=="
	)
	local button_image_data = base64_decode(
		"iVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAMAAAC67D+PAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAGUExURf///wAAAFXC034AAAACdFJOU/8A5bcwSgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAABh0RVh0U29mdHdhcmUAUGFpbnQuTkVUIDUuMS4y+7wDtgAAALZlWElmSUkqAAgAAAAFABoBBQABAAAASgAAABsBBQABAAAAUgAAACgBAwABAAAAAgAAADEBAgAQAAAAWgAAAGmHBAABAAAAagAAAAAAAAAMdwEA6AMAAAx3AQDoAwAAUGFpbnQuTkVUIDUuMS4yAAMAAJAHAAQAAAAwMjMwAaADAAEAAAABAAAABaAEAAEAAACUAAAAAAAAAAIAAQACAAQAAABSOTgAAgAHAAQAAAAwMTAwAAAAAO7qLRjGzAACAAAAK0lEQVQYVz3KQRIAAAQCwPr/p5WiQ9YAfkDcZiph7HnUucyD3V/RWqbaCjkOewBGmBH+OgAAAABJRU5ErkJggg=="
	)
	local arrow_image_data = base64_decode(
		"iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAYAAADED76LAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAAAYdEVYdFNvZnR3YXJlAFBhaW50Lk5FVCA1LjEuMvu8A7YAAAC2ZVhJZklJKgAIAAAABQAaAQUAAQAAAEoAAAAbAQUAAQAAAFIAAAAoAQMAAQAAAAIAAAAxAQIAEAAAAFoAAABphwQAAQAAAGoAAAAAAAAA8nYBAOgDAADydgEA6AMAAFBhaW50Lk5FVCA1LjEuMgADAACQBwAEAAAAMDIzMAGgAwABAAAAAQAAAAWgBAABAAAAlAAAAAAAAAACAAEAAgAEAAAAUjk4AAIABwAEAAAAMDEwMAAAAACOO8FX0xe8TgAAABdJREFUKFNj/A8EDHgAE5QmHwwBKxgYAJzaC/5K6BlzAAAAAElFTkSuQmCC"
	)
	local cog_image_data = base64_decode(
		"iVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAMAAAC67D+PAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAGUExURf///wAAAFXC034AAAACdFJOU/8A5bcwSgAAAAlwSFlzAAAQKAAAECgBJz8A6wAAABh0RVh0U29mdHdhcmUAUGFpbnQuTkVUIDUuMS4y+7wDtgAAALZlWElmSUkqAAgAAAAFABoBBQABAAAASgAAABsBBQABAAAAUgAAACgBAwABAAAAAgAAADEBAgAQAAAAWgAAAGmHBAABAAAAagAAAAAAAAB3mgEA6AMAAHeaAQDoAwAAUGFpbnQuTkVUIDUuMS4yAAMAAJAHAAQAAAAwMjMwAaADAAEAAAABAAAABaAEAAEAAACUAAAAAAAAAAIAAQACAAQAAABSOTgAAgAHAAQAAAAwMTAwAAAAAEyPNqYn0aVIAAAALElEQVQYV2NgBAIGCAmioQhIQACQCZaGYBAJoZGYSApgUhATYAiikJGRkREACr4AMZ+SUSoAAAAASUVORK5CYII="
	)
	local menu_position =
		udim2_new(0, camera["ViewportSize"]["X"] / 2 - 575 / 2, 0, camera["ViewportSize"]["Y"] / 2 - 450 * 0.5)

	local half_transparency = { Transparency = 0.5 }
	local stop_panel_search = nil
	local do_notifications = true
	local set_active_tab = nil
	local theme_section = nil
	local close_context = nil
	local menu_open = true
	local menu_tick = clock()
	local pop_menu = nil
	local old_text = ""
	local searching = nil
	local hud_frames = {}

	local actives = {
		["colorpicker"] = nil,
		["dropdown"] = nil,
		["settings"] = nil,
		["binding"] = nil,
		["keybind"] = nil,
		["context"] = nil,
		["panel"] = nil,
		["tab"] = nil,
		["colorpicker_saturation"] = 0,
		["colorpicker_hue"] = 0,
		["colorpicker_value"] = 0,
	}

	-- > ( drawing proxy )

	drawing_proxy = {}
	local create1 = identifyexecutor() == "AWP" and Drawing["new"] or drawing["new"]

	drawing_proxy.new = identifyexecutor() == "AWP"
			and LPH_NO_VIRTUALIZE(function(class, properties)
				local object = create1(class)

				local proxy = setmetatable({
					["position"] = udim2_new(0, 0, 0, 0),
					["real_position"] = vector2_new(0, 0),
					["size"] = class == "Text" and 12 or udim2_new(0, 0, 0, 0),
					["real_size"] = class == "Text" and 12 or vector2_new(0, 0),
					["object"] = object,
					["children"] = {},
					["parent"] = false,
					["is_rendering"] = false,
					["skip"] = class == "Circle",
					["visible"] = false,
					["destroy"] = function()
						object:Destroy()
					end,
				}, drawing_proxy)

				local size = properties["Size"]
				if size and type(size) == "number" then
					properties["Size"] = size + 2
				end

				local z_index = properties["ZIndex"]
				properties["ZIndex"] = z_index and z_index + 20 or 20

				for property, value in properties do
					proxy[property] = value
				end

				return proxy
			end)
		or LPH_NO_VIRTUALIZE(function(class, properties)
			local object = create1(class)

			local proxy = setmetatable({
				["position"] = udim2_new(0, 0, 0, 0),
				["real_position"] = vector2_new(0, 0),
				["size"] = class == "Text" and 12 or udim2_new(0, 0, 0, 0),
				["real_size"] = class == "Text" and 12 or vector2_new(0, 0),
				["object"] = object,
				["children"] = {},
				["parent"] = false,
				["is_rendering"] = false,
				["skip"] = class == "Circle",
				["visible"] = false,
				["destroy"] = function()
					object:Destroy()
				end,
			}, drawing_proxy)

			local z_index = properties["ZIndex"]
			properties["ZIndex"] = z_index and z_index + 20 or 20

			for property, value in properties do
				proxy[property] = value
			end

			return proxy
		end)

	getgenv()["_PROXY"] = drawing_proxy
	menu["create_proxy_drawing"] = drawing_proxy["new"]

	do
		local rawget = rawget
		local type = type

		local update_proxy_position
		update_proxy_position = LPH_NO_VIRTUALIZE(function(proxy, position)
			local parent = rawget(proxy, "parent")
			local real_position = parent and parent["real_position"]
				or vector2_new(position["X"]["Offset"], position["Y"]["Offset"])

			if parent then
				local parent_position = parent["real_position"]
				local real_parent_size = parent["real_size"]

				real_position = vector2_new(
					(parent_position["X"] + real_parent_size["X"] * position["X"]["Scale"]) + position["X"]["Offset"],
					(parent_position["Y"] + real_parent_size["Y"] * position["Y"]["Scale"]) + position["Y"]["Offset"]
				)
			end

			proxy["object"]["Position"] = real_position
			proxy["real_position"] = real_position

			local children = proxy["children"]
			for i = 1, #children do
				local child = children[i]
				update_proxy_position(child, child["position"])
			end
		end)

		local update_proxy_visibility
		update_proxy_visibility = LPH_NO_VIRTUALIZE(function(proxy, visible)
			local children = proxy["children"]
			local parent = rawget(proxy, "parent")
			local object = proxy["object"]

			if parent and not parent["is_rendering"] then
				proxy["is_rendering"] = false
				object["Visible"] = false
			else
				object["Visible"] = visible
				proxy["is_rendering"] = visible
			end

			for i = 1, #children do
				local child = children[i]
				update_proxy_visibility(child, child["visible"])
			end
		end)

		local update_proxy_size
		update_proxy_size = LPH_NO_VIRTUALIZE(function(proxy, size)
			if type(proxy) ~= "table" or type(proxy["real_size"]) == "number" then -- ??
				return
			end

			local parent = rawget(proxy, "parent")
			local real_size = parent and parent["real_size"] or vector2_new(size["X"]["Offset"], size["Y"]["Offset"])

			if parent then
				local parent_size = parent["real_size"]

				real_size = vector2_new(
					(parent_size["X"] * size["X"]["Scale"]) + size["X"]["Offset"],
					(parent_size["Y"] * size["Y"]["Scale"]) + size["Y"]["Offset"]
				)
			end

			proxy["object"]["Size"] = real_size
			proxy["real_size"] = real_size

			local children = proxy["children"]
			for i = 1, #children do
				local child = children[i]
				local old = child["real_size"]
				update_proxy_size(child, child["size"])

				update_proxy_position(child, child["position"])
			end
		end)

		function drawing_proxy:__newindex(property, value)
			if property == "Position" or property == "tween_position" then
				self["position"] = value
				update_proxy_position(self, value)
			elseif property == "Parent" then
				if value then
					local children = value["children"]
					children[#children + 1] = self
				end

				self["parent"] = value
				update_proxy_position(self, self["position"])
				update_proxy_visibility(self, self["visible"])

				if type(self["size"]) ~= "number" and not self["skip"] then
					update_proxy_size(self, self["size"])
				end
			elseif property == "Visible" then
				self["visible"] = value
				update_proxy_visibility(self, value)
			elseif
				(property == "Size" or property == "tween_size")
				and type(value) ~= "number"
				and not self["skip"]
			then
				self["size"] = value
				update_proxy_size(self, value)
			else
				self["object"][property] = value
			end
		end

		function drawing_proxy:__index(property)
			return property == "tween_size" and self["size"]
				or property == "tween_position" and self["position"]
				or property == "Destroy" and self["destroy"]
				or self["object"][property]
		end
	end

	-- > ( menu creation )

	local cursor = drawing_proxy["new"]("Image", {
		["Position"] = menu_position,
		["Size"] = udim2_new(0, 24, 0, 24),
		["Color"] = menu["colors"]["cursor"],
		["Rounding"] = 0,
		["Data"] = base64_decode(
			"iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAACHUExURaWlpdTV1cDBwbq6uv///+Li4q6ursPDw9vc3Nna2sTExLCwsNPT09bW1tXV1bGxsdLT083OzrKyss/Pz7Ozs8jIyLS1tcbHx7W1tcnJybm5ufDw8JKSkpmZmaqrq6ipqaWmpqanp4aGhpqamszMzMLCwuLh4Xx8fL29vfHw8Hl5eY+OjgAAAAqocEsAAAAtdFJOU///////////////////////////////////////////////////////////AKXvC/0AAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAYdEVYdFNvZnR3YXJlAFBhaW50Lk5FVCA1LjEuNBLfpoMAAAC2ZVhJZklJKgAIAAAABQAaAQUAAQAAAEoAAAAbAQUAAQAAAFIAAAAoAQMAAQAAAAIAAAAxAQIAEAAAAFoAAABphwQAAQAAAGoAAAAAAAAAYAAAAAEAAABgAAAAAQAAAFBhaW50Lk5FVCA1LjEuNAADAACQBwAEAAAAMDIzMAGgAwABAAAAAQAAAAWgBAABAAAAlAAAAAAAAAACAAEAAgAEAAAAUjk4AAIABwAEAAAAMDEwMAAAAADX5rshveZftAAAALhJREFUOE/V0scWgjAQhWHUK2JX7L33vP/zmcilJRNd+6+Yme+w4BCoH2kQVKocpDSoAfWQo5sGDQCRVxCg6RMatAxA1ObGKgPoyCIHHlEA6EqiCNDrc1uoBDBwRRlgGHOfZQGMxjyk2QCTKS/MAZjNeUpyARY8JQmgLCSAJY8mCax4+5SD9WYbx+Fufyh/8AwcubBLwYmzkwbmjzr7XmDABbjeOLppcMfjyUlIA/VKHuUM+NofAKXelaSKsWMM5jMAAAAASUVORK5CYII="
		),
		["Transparency"] = 0,
		["ZIndex"] = 1011,
		["Visible"] = true,
	})

	local frame = drawing_proxy["new"]("Image", {
		["Position"] = menu_position,
		["Size"] = udim2_new(0, 575, 0, 450),
		["Color"] = menu["colors"]["background"],
		["Rounding"] = 4,
		["Data"] = pixel_image_data,
		["Transparency"] = 1,
		["Visible"] = false,
	})

	local inside = drawing_proxy["new"]("Image", {
		["Position"] = udim2_new(0, 1, 0, 1),
		["Size"] = udim2_new(1, -2, 1, -2),
		["Color"] = menu["colors"]["section"],
		["Rounding"] = 4,
		["Data"] = pixel_image_data,
		["Transparency"] = 1,
		["Parent"] = frame,
		["Visible"] = false,
	})

	local logo = drawing_proxy["new"]("Image", {
		["Color"] = menu["colors"]["accent"],
		["Data"] = readfile(file_path .. "/assets/logo.png"),
		["Position"] = udim2_new(0, 15, 0, 15),
		["Parent"] = inside,
		["Size"] = udim2_new(0, 35, 0, 35),
		["Visible"] = true,
		["Transparency"] = 1,
	})

	local juju_text = drawing_proxy["new"]("Text", {
		["Font"] = 1,
		["Color"] = color3_fromrgb(255, 255, 255),
		["Text"] = getgenv().script_name or "juju",
		["Parent"] = logo,
		["Position"] = udim2_new(1, 5, 0, 3),
		["Size"] = 14,
		["Visible"] = true,
		["Transparency"] = 1,
	})

	local build_text = drawing_proxy["new"]("Text", {
		["Font"] = 1,
		["Color"] = menu["colors"]["accent"],
		["Text"] = getgenv().script_version or "live",
		["Parent"] = logo,
		["Position"] = udim2_new(1, 5, 0, 19),
		["Size"] = 14,
		["Visible"] = true,
		["Transparency"] = 1,
	})

	local right_side = drawing_proxy["new"]("Square", {
		["Parent"] = inside,
		["Position"] = udim2_new(0, 101, 0, 0),
		["Size"] = udim2_new(1, -101, 1, 0),
		["Color"] = menu["colors"]["background"],
		["Visible"] = true,
		["Filled"] = true,
		["Transparency"] = 1,
	})

	local right_side_cover = drawing_proxy["new"]("Square", {
		["Parent"] = inside,
		["Position"] = udim2_new(0, 101, 0, 0),
		["Size"] = udim2_new(1, -101, 1, 0),
		["Color"] = menu["colors"]["background"],
		["Visible"] = true,
		["Filled"] = true,
		["ZIndex"] = 999,
		["Transparency"] = 0,
	})

	local right_side_divider = drawing_proxy["new"]("Square", {
		["Parent"] = inside,
		["Position"] = udim2_new(0, 100, 0, 0),
		["Size"] = udim2_new(0, 1, 1, 0),
		["Color"] = menu["colors"]["background"],
		["Visible"] = true,
		["Thickness"] = 1,
		["Filled"] = true,
		["Transparency"] = 1,
	})

	local search_image = drawing_proxy["new"]("Image", {
		["Color"] = menu["colors"]["image"],
		["Data"] = base64_decode(
			"iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAYdEVYdFNvZnR3YXJlAFBhaW50Lk5FVCA1LjEuMvu8A7YAAAC2ZVhJZklJKgAIAAAABQAaAQUAAQAAAEoAAAAbAQUAAQAAAFIAAAAoAQMAAQAAAAIAAAAxAQIAEAAAAFoAAABphwQAAQAAAGoAAAAAAAAAYAAAAAEAAABgAAAAAQAAAFBhaW50Lk5FVCA1LjEuMgADAACQBwAEAAAAMDIzMAGgAwABAAAAAQAAAAWgBAABAAAAlAAAAAAAAAACAAEAAgAEAAAAUjk4AAIABwAEAAAAMDEwMAAAAADp1fY4ytpsegAAAGdJREFUKFONkGEWgCAIg5GTdP9LlqPBA8Pq+yFuOvA5JHFOuDXGhNvAjPVipgtZAFAGtIuvbrSdRA4sJQQBKB/wOM6V9TevAe+cn6su8liwaieSuwuONy4/k0PdZHglsKOEWD+5QyIX+wJP/y1yP3IAAAAASUVORK5CYII="
		),
		["Position"] = udim2_new(0, 27, 1, -27),
		["Parent"] = inside,
		["Size"] = udim2_new(0, 12, 0, 12),
		["Transparency"] = 1,
		["ZIndex"] = 999,
		["Visible"] = true,
	})

	local themes_image = drawing_proxy["new"]("Image", {
		["Color"] = menu["colors"]["image"],
		["Data"] = base64_decode(
			"iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADdYAAA3WAZBveZwAAAAYdEVYdFNvZnR3YXJlAFBhaW50Lk5FVCA1LjEuMvu8A7YAAAC2ZVhJZklJKgAIAAAABQAaAQUAAQAAAEoAAAAbAQUAAQAAAFIAAAAoAQMAAQAAAAIAAAAxAQIAEAAAAFoAAABphwQAAQAAAGoAAAAAAAAAiF8BAOgDAACIXwEA6AMAAFBhaW50Lk5FVCA1LjEuMgADAACQBwAEAAAAMDIzMAGgAwABAAAAAQAAAAWgBAABAAAAlAAAAAAAAAACAAEAAgAEAAAAUjk4AAIABwAEAAAAMDEwMAAAAAC1cWHl18YwawAAAH5JREFUKFOFkAsOgCAMQwE5lIfx/qeA4Do7ZCL6ErOWtHwMb7TWinyN1pE4Owxul5uJnAp2ljGFo0B5F1Zhw0p6JVxDfIZegQymtroRTK9wj0bYjl5QtTCGPkqHLGcXpFRQGtYqwhDuDU9YKhYGaQwjAGix0S7W/z0UAO0PIZyip02b2JexIAAAAABJRU5ErkJggg=="
		),
		["Position"] = udim2_new(0, 44, 1, -27),
		["Parent"] = inside,
		["Size"] = udim2_new(0, 12, 0, 12),
		["Transparency"] = 1,
		["Visible"] = true,
	})

	local settings_image = drawing_proxy["new"]("Image", {
		["Color"] = menu["colors"]["image"],
		["Data"] = base64_decode(
			"iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAMAAABhq6zVAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAGUExURf///wAAAFXC034AAAACdFJOU/8A5bcwSgAAAAlwSFlzAAALEwAACxMBAJqcGAAAABh0RVh0U29mdHdhcmUAUGFpbnQuTkVUIDUuMS4y+7wDtgAAALZlWElmSUkqAAgAAAAFABoBBQABAAAASgAAABsBBQABAAAAUgAAACgBAwABAAAAAgAAADEBAgAQAAAAWgAAAGmHBAABAAAAagAAAAAAAABJGQEA6AMAAEkZAQDoAwAAUGFpbnQuTkVUIDUuMS4yAAMAAJAHAAQAAAAwMjMwAaADAAEAAAABAAAABaAEAAEAAACUAAAAAAAAAAIAAQACAAQAAABSOTgAAgAHAAQAAAAwMTAwAAAAAC/Sb/YZ+v7JAAAAMklEQVQYV1WLARIAQAQC9f9Pn65oNAZpFajyUHn0MtJZWkbdt+QxBwtA47X1kzDk9QY8FowASc0mZqAAAAAASUVORK5CYII="
		),
		["Position"] = udim2_new(0, 61, 1, -27),
		["Parent"] = inside,
		["Size"] = udim2_new(0, 12, 0, 12),
		["Transparency"] = 1,
		["Visible"] = true,
	})

	local tab_line = drawing_proxy["new"]("Square", {
		["Parent"] = inside,
		["Position"] = udim2_new(0, 0, 0, 0),
		["Size"] = udim2_new(0, 1, 0, 12),
		["Filled"] = true,
		["Transparency"] = 0.5,
		["Color"] = menu["colors"]["accent"],
		["Visible"] = true,
	})

	local search_border = drawing_proxy["new"]("Image", {
		["Parent"] = frame,
		["Position"] = udim2_new(0, 11, 1, -32),
		["Size"] = udim2_new(0, 78, 0, 20),
		["Color"] = menu["colors"]["border"],
		["Transparency"] = 1,
		["Rounding"] = 4,
		["Data"] = pixel_image_data,
		["Visible"] = false,
	})

	local search_inside = drawing_proxy["new"]("Image", {
		["Parent"] = search_border,
		["Position"] = udim2_new(0, 1, 0, 1),
		["Size"] = udim2_new(1, -2, 1, -2),
		["Color"] = menu["colors"]["background"],
		["Rounding"] = 4,
		["Data"] = pixel_image_data,
		["Transparency"] = 1,
		["Visible"] = true,
	})

	local search_out_border = drawing_proxy["new"]("Image", {
		["Parent"] = frame,
		["Position"] = udim2_new(0, 11, 1, -57),
		["Size"] = udim2_new(0, 78, 0, 20),
		["Color"] = menu["colors"]["border"],
		["Transparency"] = 1,
		["Rounding"] = 4,
		["Data"] = pixel_image_data,
		["ZIndex"] = 999,
		["Visible"] = false,
	})

	local search_out = drawing_proxy["new"]("Image", {
		["Parent"] = search_out_border,
		["Position"] = udim2_new(0, 1, 0, 1),
		["Size"] = udim2_new(1, -2, 1, -2),
		["Color"] = menu["colors"]["background"],
		["Rounding"] = 4,
		["Data"] = pixel_image_data,
		["Transparency"] = 1,
		["ZIndex"] = 1000,
		["Visible"] = true,
	})

	local search_text = drawing_proxy["new"]("Text", {
		["Color"] = menu["colors"]["active_text"],
		["Text"] = "",
		["Size"] = 12,
		["Font"] = 1,
		["Transparency"] = 1,
		["Visible"] = true,
		["Parent"] = search_inside,
		["Center"] = false,
		["Position"] = udim2_new(0, 18, 0, 2),
	})

	local drag_frame = drawing_proxy["new"]("Image", {
		["Position"] = menu_position,
		["Size"] = udim2_new(0, 575, 0, 450),
		["Color"] = menu["colors"]["background"],
		["Rounding"] = 4,
		["Data"] = pixel_image_data,
		["Transparency"] = 0,
		["ZIndex"] = 1000,
		["Visible"] = false,
	})

	local drag_inside = drawing_proxy["new"]("Image", {
		["Position"] = udim2_new(0, 1, 0, 1),
		["Size"] = udim2_new(1, -2, 1, -2),
		["Color"] = menu["colors"]["section"],
		["Rounding"] = 4,
		["Data"] = pixel_image_data,
		["Transparency"] = 1,
		["Parent"] = drag_frame,
		["ZIndex"] = 1001,
		["Visible"] = true,
	})

	local drag_logo = drawing_proxy["new"]("Image", {
		["Color"] = menu["colors"]["accent"],
		["Data"] = readfile(file_path .. "/assets/logo.png"),
		["Position"] = udim2_new(0.5, -40, 0.5, -40),
		["Parent"] = drag_inside,
		["Size"] = udim2_new(0, 80, 0, 80),
		["Visible"] = true,
		["ZIndex"] = 1002,
		["Transparency"] = 1,
	})

	-- > ( keybinds )

	local keybind_data = {
		[1] = {
			["key"] = Enum["KeyCode"]["Delete"],
			["value"] = true,
			["original_value"] = false,
			["set_activated"] = LPH_NO_VIRTUALIZE(function()
				pop_menu()
			end),
		},
	}

	local keybind = {}
	keybind["__index"] = keybind

	function keybind:set_activated(activated)
		local new_value = activated and self["value"] or (not activated and self["original_value"])
		local element = self["element"]
		local type = self["type"]

		if type == 1 then
			element:set_dropdown(new_value, true)
		elseif type == 2 then
			element:set_slider(new_value, true)
		elseif type == 3 then
			element:set_toggle(activated, true)
		elseif type == 4 then
			return element["on_clicked"]:Fire()
		end

		self["activated"] = activated

		on_keybind_change:Fire(self, element, activated)
	end

	-- > ( keybinds list )

	local list_frame = drawing_proxy["new"]("Image", {
		["Position"] = udim2_new(0, 15, 0, camera["ViewportSize"]["Y"] / 2 - 10),
		["Size"] = udim2_new(0, 74, 0, 20),
		["Color"] = menu["colors"]["border"],
		["Transparency"] = 0,
		["Rounding"] = 4,
		["Data"] = pixel_image_data,
		["ZIndex"] = 10,
		["Visible"] = false,
	})

	hud_frames["keybinds_position"] = list_frame

	local list_shadow = drawing_proxy["new"]("Image", {
		["Parent"] = list_frame,
		["Data"] = shadow_image_data,
		["Rounding"] = 7,
		["Color"] = menu["colors"]["shadow"],
		["Transparency"] = 0,
		["Size"] = udim2_new(1, 6, 1, 4),
		["ZIndex"] = 9,
		["Visible"] = true,
		["Position"] = udim2_new(0, -3, 0, -2),
	})

	local list_inside = drawing_proxy["new"]("Image", {
		["Position"] = udim2_new(0, 1, 0, 1),
		["Size"] = udim2_new(0, 72, 0, 18),
		["Color"] = color3_fromrgb(15, 15, 15),
		["Transparency"] = 0,
		["Rounding"] = 4,
		["Data"] = pixel_image_data,
		["Parent"] = list_frame,
		["ZIndex"] = 11,
		["Visible"] = true,
	})

	local list_icon = drawing_proxy["new"]("Image", {
		["Color"] = menu["colors"]["accent"],
		["Data"] = base64_decode(
			"iVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAMAAAC67D+PAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAGUExURf///wAAAFXC034AAAACdFJOU/8A5bcwSgAAAAlwSFlzAAAOwwAADsMBx2+oZAAAABh0RVh0U29mdHdhcmUAUGFpbnQuTkVUIDUuMS4y+7wDtgAAALZlWElmSUkqAAgAAAAFABoBBQABAAAASgAAABsBBQABAAAAUgAAACgBAwABAAAAAgAAADEBAgAQAAAAWgAAAGmHBAABAAAAagAAAAAAAABgAAAAAQAAAGAAAAABAAAAUGFpbnQuTkVUIDUuMS4yAAMAAJAHAAQAAAAwMjMwAaADAAEAAAABAAAABaAEAAEAAACUAAAAAAAAAAIAAQACAAQAAABSOTgAAgAHAAQAAAAwMTAwAAAAAOnV9jjK2mx6AAAAKklEQVQYV2NghANkJhCAKCgGUUAazIUCiBiIAVEAFoLwIQgsCgZwJiMjABBLAEmFjHpsAAAAAElFTkSuQmCC"
		),
		["Transparency"] = 0,
		["Position"] = udim2_new(0, 4, 0, 4),
		["Parent"] = list_inside,
		["Size"] = udim2_new(0, 10, 0, 10),
		["ZIndex"] = 12,
		["Visible"] = true,
	})

	local list_divider = drawing_proxy["new"]("Square", {
		["Position"] = udim2_new(0, 20, 0, 4),
		["Size"] = udim2_new(0, 1, 0, 10),
		["Color"] = menu["colors"]["accent"],
		["Transparency"] = 0,
		["Filled"] = true,
		["Parent"] = list_inside,
		["ZIndex"] = 12,
		["Visible"] = true,
	})

	local list_text = drawing_proxy["new"]("Text", {
		["Color"] = color3_fromrgb(255, 255, 255),
		["Text"] = "hotkeys",
		["Size"] = 12,
		["Font"] = 1,
		["Transparency"] = 0,
		["Visible"] = true,
		["Parent"] = list_inside,
		["Position"] = udim2_new(0, 26, 0, identifyexecutor() == "AWP" and 2 or 3),
		["ZIndex"] = 12,
	})

	local list_drawings = {}
	local active_binds = {}

	menu["show_bind"] = function(keybind, just_visual)
		local found = nil

		for i = 1, #active_binds do
			local bind = active_binds[i]
			if bind == keybind then
				found = i
				break
			end
		end

		if not just_visual then
			if not found then
				active_binds[#active_binds + 1] = keybind
				found = #active_binds
			end
		end

		local drawings = list_drawings[keybind]
		local frame = drawings["frame"]
		local y = 24 + (found - 1) * 21

		frame["Position"] = udim2_new(0, -5, 0, y)
		tween(frame, { Transparency = 0 or 0.2, tween_position = udim2_new(0, 0, 0, y) }, circular, out, 0.15)
		tween(drawings["inside"], { Transparency = 0.7 }, circular, out, 0.15)
		tween(drawings["text"], { Transparency = 0.9 }, circular, out, 0.15)
		tween(drawings["value"], { Transparency = 0.7 }, circular, out, 0.15)
		tween(drawings["shadow"], { Transparency = 0.16 }, circular, out, 0.15)
		frame["Visible"] = true
	end

	menu["get_active_binds"] = LPH_NO_VIRTUALIZE(function()
		return active_binds
	end)

	local create_hover_connection = nil

	menu["hide_bind"] = function(keybind, just_visual)
		if not just_visual then
			for i = 1, #active_binds do
				if active_binds[i] == keybind then
					remove(active_binds, i)
					break
				end
			end

			for i = 1, #active_binds do
				local frame = list_drawings[active_binds[i]]["frame"]
				local old_position = frame["tween_position"]
				local new_position = udim2_new(0, 0, 0, 24 + (i - 1) * 21)

				if old_position ~= new_position then
					tween(frame, { tween_position = new_position }, circular, out, 0.15)
				end
			end
		end

		local drawings = list_drawings[keybind]

		if drawings then
			local frame = drawings["frame"]

			tween(
				drawings["frame"],
				{ Transparency = 0, tween_position = frame["tween_position"] - udim2_new(0, 5, 0, 0) },
				circular,
				out,
				0.15
			)
			tween(drawings["inside"], hide_transparency, circular, out, 0.15)
			tween(drawings["text"], hide_transparency, circular, out, 0.15)
			tween(drawings["value"], hide_transparency, circular, out, 0.15)
			tween(drawings["shadow"], hide_transparency, circular, out, 0.15)

			delay(0.15, function()
				local found = nil

				if not just_visual then
					for i = 1, #active_binds do
						local bind = active_binds[i]
						if bind == keybind then
							found = i
							break
						end
					end
				end

				if not found then
					frame["Visible"] = false
				end
			end)
		end
	end

	function menu:show_keybinds()
		list_frame["Visible"] = true
		tween(list_frame, { Transparency = 0.7 }, circular, out, 0.15)
		tween(list_inside, show_transparency, circular, out, 0.15)
		tween(list_shadow, { Transparency = 0.16 }, circular, out, 0.15)
		local children = list_inside["children"]
		for i = 1, #children do
			local child = children[i]
			if child["Visible"] then
				tween(child, child == list_text and show_transparency or half_transparency, circular, out, 0.15)
			end
		end

		for i = 1, #active_binds do
			menu["show_bind"](active_binds[i], true)
		end

		menu["keybinds_visible"] = true
	end

	function menu:hide_keybinds()
		list_frame["Visible"] = true
		tween(list_frame, hide_transparency, circular, out, 0.15)
		tween(list_inside, hide_transparency, circular, out, 0.15)
		tween(list_shadow, hide_transparency, circular, out, 0.15)
		local children = list_inside["children"]
		for i = 1, #children do
			local child = children[i]
			if child["Visible"] then
				tween(child, hide_transparency, circular, out, 0.15)
			end
		end

		local old_tick = clock()

		for i = 1, #active_binds do
			local keybind = active_binds[i]
			menu["hide_bind"](keybind, true)
		end

		menu["keybinds_visible"] = old_tick

		delay(0.15, function()
			if old_tick == menu["keybinds_visible"] then
				menu["keybinds_visible"] = false
				list_frame["Visible"] = false
			end
		end)
	end

	function menu:load_theme(theme)
		if theme then
			local path = file_path .. "/themes/" .. theme .. ".th"
			if isfile(path) then
				local s, data = pcall(function()
					return http_service:JSONDecode(readfile(path))
				end)

				if s and data then
					local elements = theme_section["elements"]
					for i = 1, #elements do
						local element = elements[i]
						local flag = element["color_flag"]
						if flag then
							local color = data[flag]

							if color then
								element:set_colorpicker(color3_fromrgb(color[1], color[2], color[3]))
							end
						end
					end

					menu["new_notification"]("loaded theme " .. theme, 1)
					menu["did_action"] = true
					menu["theme"] = theme
					menu["saved"] = true
				else
					menu["new_notification"]("failed to load theme " .. theme, 3)
				end
			else
				menu["theme"] = ""
				menu["saved"] = true
			end
		end
	end

	local offset = identifyexecutor() == "AWP" and 1 or 2

	create_connection(on_keybind_created, function(keybind, element)
		local type = keybind["type"]

		if type == 1 then
			local keybind_frame = drawing_proxy["new"]("Image", {
				["Position"] = udim2_new(0, 0, 0, 25),
				["Size"] = udim2_new(0, 74, 0, 18),
				["Color"] = menu["colors"]["border"],
				["Transparency"] = 0,
				["Rounding"] = 4,
				["Parent"] = list_frame,
				["Data"] = pixel_image_data,
				["Visible"] = false,
			})

			local keybind_inside = drawing_proxy["new"]("Image", {
				["Position"] = udim2_new(0, 1, 0, 1),
				["Size"] = udim2_new(0, 72, 0, 18),
				["Color"] = menu["colors"]["background"],
				["Transparency"] = 0,
				["Rounding"] = 4,
				["Data"] = pixel_image_data,
				["Parent"] = keybind_frame,
				["Visible"] = true,
			})

			local value_image = drawing_proxy["new"]("Image", {
				["Color"] = menu["colors"]["accent"],
				["Size"] = udim2_new(0, 10, 0, 10),
				["Data"] = arrow_image_data,
				["Transparency"] = 0,
				["Visible"] = true,
				["Parent"] = keybind_inside,
				["Position"] = udim2_new(0, 3, 0, 3),
				["ZIndex"] = 2,
			})

			local keybind_text = drawing_proxy["new"]("Text", {
				["Color"] = menu["colors"]["keybind_text"],
				["Text"] = element["name"],
				["Size"] = 12,
				["Font"] = 1,
				["Transparency"] = 0,
				["Visible"] = true,
				["Parent"] = keybind_inside,
				["Position"] = udim2_new(0, 23, 0, offset),
				["ZIndex"] = 2,
			})

			local keybind_shadow = drawing_proxy["new"]("Image", {
				["Parent"] = keybind_frame,
				["Data"] = shadow_image_data,
				["Rounding"] = 7,
				["Color"] = menu["colors"]["shadow"],
				["Transparency"] = 0,
				["Visible"] = true,
				["Position"] = udim2_new(0, 0, 0, 0),
				["ZIndex"] = 3,
			})

			local x_size = keybind_text["TextBounds"]["X"] + 31

			keybind_frame["Size"] = udim2_new(0, x_size, 0, 18)
			keybind_inside["Size"] = udim2_new(0, x_size - 2, 0, 16)

			local shadow_size = floor(x_size / 11)
			keybind_shadow["Size"] = udim2_new(1, shadow_size - 1, 1, 4)
			keybind_shadow["Position"] = udim2_new(0, -shadow_size / 2, 0, -2)

			list_drawings[keybind] = {
				["frame"] = keybind_frame,
				["inside"] = keybind_inside,
				["text"] = keybind_text,
				["value"] = value_image,
				["shadow"] = keybind_shadow,
			}
		elseif type == 2 then
			local keybind_frame = drawing_proxy["new"]("Image", {
				["Position"] = udim2_new(0, 0, 0, 25),
				["Size"] = udim2_new(0, 74, 0, 18),
				["Color"] = menu["colors"]["border"],
				["Transparency"] = 0,
				["Rounding"] = 4,
				["Parent"] = list_frame,
				["Data"] = pixel_image_data,
				["Visible"] = false,
			})

			local keybind_inside = drawing_proxy["new"]("Image", {
				["Position"] = udim2_new(0, 1, 0, 1),
				["Size"] = udim2_new(0, 72, 0, 18),
				["Color"] = menu["colors"]["background"],
				["Transparency"] = 0,
				["Rounding"] = 4,
				["Data"] = pixel_image_data,
				["Parent"] = keybind_frame,
				["Visible"] = true,
			})

			local value_text = drawing_proxy["new"]("Text", {
				["Color"] = menu["colors"]["accent"],
				["Text"] = element["drawings"]["slider_text"]["Text"],
				["Size"] = 12,
				["Font"] = 1,
				["Transparency"] = 0,
				["Visible"] = true,
				["Parent"] = keybind_inside,
				["Position"] = udim2_new(0, 3, 0, offset),
			})

			local value = keybind["value"]

			if value == element["slider_min"] then
				value_text["Text"] = element["slider_min_text"]
					or element["slider_prefix"] .. value .. element["slider_suffix"]
			else
				value_text["Text"] = (value == element["slider_max"] and element["slider_max_text"])
					or element["slider_prefix"] .. value .. element["slider_suffix"]
			end

			local keybind_text = drawing_proxy["new"]("Text", {
				["Color"] = menu["colors"]["keybind_text"],
				["Text"] = element["name"],
				["Size"] = 12,
				["Font"] = 1,
				["Transparency"] = 0,
				["Visible"] = true,
				["Parent"] = keybind_inside,
				["Position"] = udim2_new(0, 23, 0, offset),
			})

			local keybind_shadow = drawing_proxy["new"]("Image", {
				["Parent"] = keybind_frame,
				["Data"] = shadow_image_data,
				["Rounding"] = 7,
				["Color"] = menu["colors"]["shadow"],
				["Transparency"] = 0,
				["Visible"] = true,
				["Position"] = udim2_new(0, 0, 0, 0),
				["ZIndex"] = 3,
			})

			local text_bounds = value_text["TextBounds"]["X"]
			local x_size = text_bounds + keybind_text["TextBounds"]["X"] + 18

			keybind_text["Position"] = udim2_new(0, text_bounds + 13, 0, 2)
			keybind_frame["Size"] = udim2_new(0, x_size, 0, 18)
			keybind_inside["Size"] = udim2_new(0, x_size - 2, 0, 16)

			local shadow_size = floor(x_size / 11)
			keybind_shadow["Size"] = udim2_new(1, shadow_size - 1, 1, 4)
			keybind_shadow["Position"] = udim2_new(0, -shadow_size / 2, 0, -2)

			list_drawings[keybind] = {
				["frame"] = keybind_frame,
				["inside"] = keybind_inside,
				["text"] = keybind_text,
				["value"] = value_text,
				["shadow"] = keybind_shadow,
			}
		elseif type == 3 then
			local keybind_frame = drawing_proxy["new"]("Image", {
				["Position"] = UDim2.new(0, 0, 0, 25),
				["Size"] = UDim2.new(0, 74, 0, 18),
				["Color"] = menu["colors"]["border"],
				["Transparency"] = 0,
				["Rounding"] = 4,
				["Parent"] = list_frame,
				["Data"] = pixel_image_data,
				["Visible"] = false,
			})

			local keybind_inside = drawing_proxy["new"]("Image", {
				["Position"] = UDim2.new(0, 1, 0, 1),
				["Size"] = UDim2.new(0, 72, 0, 18),
				["Color"] = menu["colors"]["background"],
				["Transparency"] = 0,
				["Rounding"] = 4,
				["Data"] = pixel_image_data,
				["Parent"] = keybind_frame,
				["Visible"] = true,
			})

			local keybind_shadow = drawing_proxy["new"]("Image", {
				["Parent"] = keybind_frame,
				["Data"] = shadow_image_data,
				["Rounding"] = 7,
				["Color"] = menu["colors"]["shadow"],
				["Transparency"] = 0,
				["Visible"] = true,
				["Position"] = udim2_new(0, 0, 0, 0),
				["ZIndex"] = 3,
			})

			local value_image = drawing_proxy["new"]("Image", {
				["Color"] = menu["colors"]["accent"],
				["Size"] = UDim2.new(0, 10, 0, 10),
				["Data"] = checkmark_image_data,
				["Transparency"] = 0,
				["Visible"] = true,
				["Parent"] = keybind_inside,
				["Position"] = UDim2.new(0, 3, 0, 3),
				["ZIndex"] = 2,
			})

			local keybind_text = drawing_proxy["new"]("Text", {
				["Color"] = menu["colors"]["keybind_text"],
				["Text"] = element["name"],
				["Size"] = 12,
				["Font"] = 1,
				["Transparency"] = 0,
				["Visible"] = true,
				["Parent"] = keybind_inside,
				["Position"] = UDim2.new(0, 23, 0, offset),
				["ZIndex"] = 2,
			})

			local x_size = keybind_text["TextBounds"]["X"] + 31

			keybind_frame["Size"] = UDim2.new(0, x_size, 0, 18)
			keybind_inside["Size"] = UDim2.new(0, x_size - 2, 0, 16)

			local shadow_size = floor(x_size / 11)
			keybind_shadow["Size"] = udim2_new(1, shadow_size - 1, 1, 4)
			keybind_shadow["Position"] = udim2_new(0, -shadow_size / 2, 0, -2)

			list_drawings[keybind] = {
				["frame"] = keybind_frame,
				["inside"] = keybind_inside,
				["text"] = keybind_text,
				["value"] = value_image,
				["shadow"] = keybind_shadow,
			}

			if keybind["value"] then
				menu["show_bind"](keybind)
			end
		end
	end)

	create_connection(on_keybind_updated, function(keybind, element)
		local type = keybind["type"]

		if type == 2 then
			local drawings = list_drawings[keybind]
			local value_text = drawings["value"]
			local value = keybind["value"]

			if value == element["slider_min"] then
				value_text["Text"] = element["slider_min_text"]
					or element["slider_prefix"] .. value .. element["slider_suffix"]
			else
				value_text["Text"] = (value == element["slider_max"] and element["slider_max_text"])
					or element["slider_prefix"] .. value .. element["slider_suffix"]
			end

			local text_bounds = value_text["TextBounds"]["X"]
			local x_size = text_bounds + drawings["text"]["TextBounds"]["X"] + 18

			drawings["text"]["Position"] = udim2_new(0, text_bounds + 13, 0, 2)
			drawings["frame"]["Size"] = udim2_new(0, x_size, 0, 18)
			drawings["inside"]["Size"] = udim2_new(0, x_size - 2, 0, 16)
		end
	end)

	create_connection(on_keybind_change, function(keybind, element, activated)
		if menu["keybinds_visible"] then
			if activated then
				menu["show_bind"](keybind)
			else
				menu["hide_bind"](keybind)
			end
		end
	end)

	create_connection(on_keybind_deleted, function(keybind, element, force)
		if menu["keybinds_visible"] or force then
			menu["hide_bind"](keybind)

			delay(0.15, function()
				local data = list_drawings[keybind]

				if data then
					for _, drawing in data do
						drawing:Destroy()
						data[_] = nil
					end
					list_drawings[keybind] = nil
				end
			end)
		else
			local data = list_drawings[keybind]

			if data then
				for _, drawing in data do
					drawing:Destroy()
					data[_] = nil
				end
				list_drawings[keybind] = nil
			end
		end
	end)

	-- > ( elements )

	local element = {}
	element["__index"] = element

	local section = {}
	section["__index"] = section

	local item = {}
	item["__index"] = item

	-- > ( inputs )

	local moving = nil

	local right_click_connections = {}
	local scroll_connections = {}
	local hover_connections = {}
	local click_connections = {}
	local hovering_objects = {}
	local active_typing = nil

	local type_line = drawing_proxy["new"]("Square", {
		["Position"] = udim2_new(0, 0, 0, 0),
		["Size"] = udim2_new(0, 1, 0, 12),
		["Filled"] = true,
		["Transparency"] = 0,
		["Color"] = menu["colors"]["inactive_text"],
		["Visible"] = true,
		["ZIndex"] = 999,
	})

	local type_function = LPH_NO_VIRTUALIZE(function()
		local position = active_typing["real_position"]
		type_line["Transparency"] = 0.5 + 0.5 * math["sin"](clock() * math["pi"] * 2.5)
		type_line["Position"] = udim2_new(0, position["X"] + active_typing["TextBounds"]["X"] + 3, 0, position["Y"] + 1)
	end)

	local create_click_connection = function(new_handle, object, callback)
		local handle = click_connections[new_handle]

		if not handle then
			click_connections[new_handle] = {}
			handle = click_connections[new_handle]
		end

		local new_handle = handle[object]
		if not new_handle then
			handle[object] = {
				callback,
			}
		else
			new_handle[#new_handle + 1] = callback
		end
	end

	local create_scroll_connection = function(new_handle, object, callback)
		local handle = scroll_connections[new_handle]

		if not handle then
			scroll_connections[new_handle] = {}
			handle = scroll_connections[new_handle]
		end

		local new_handle = handle[object]
		if not new_handle then
			handle[object] = {
				callback,
			}
		else
			new_handle[#new_handle + 1] = callback
		end
	end

	local create_right_click_connection = function(new_handle, object, callback)
		local handle = right_click_connections[new_handle]

		if not handle then
			right_click_connections[new_handle] = {}
			handle = right_click_connections[new_handle]
		end

		local new_handle = handle[object]
		if not new_handle then
			handle[object] = {
				callback,
			}
		else
			new_handle[#new_handle + 1] = callback
		end
	end

	create_hover_connection = function(new_handle, object, hover_callback, leave_callback)
		local handle = hover_connections[new_handle]

		if not handle then
			hover_connections[new_handle] = {}
			handle = hover_connections[new_handle]
		end

		local new_handle = handle[object]
		if not new_handle then
			handle[object] = {
				{
					hover_callback,
					leave_callback,
				},
			}
		else
			new_handle[#new_handle + 1] = {
				hover_callback,
				leave_callback,
			}
		end
	end

	local open_settings = function(settings)
		local border = settings["border"]
		for _, element in settings["elements"] do
			for _, drawing in element["drawings"] do
				tween(
					drawing,
					_ == "slider_fill" and half_transparency
						or _ == "slider_line" and half_transparency
						or _ == "checkmark" and (flags[element["toggle_flag"]] and half_transparency or hide_transparency)
						or _ == "colorpicker_transparency" and {
							Transparency = -flags[element["transparency_flag"]] + 1,
						}
						or show_transparency,
					exponential,
					out,
					0.18
				)
			end
		end

		local position = border["real_position"]
		local x_position = position["X"] + 30
		local screen_size = camera["ViewportSize"]
		local x_size = screen_size["X"]
		local y_size = screen_size["Y"]

		local x_overlap = (x_position + border["real_size"]["X"]) - x_size
		local y_overlap = (position["Y"] + border["real_size"]["Y"]) - y_size

		if x_overlap > 0 then
			x_position -= (x_overlap + 5)
		elseif x_overlap < -x_size then
			x_position += (-x_overlap + 5)
		else
			x_overlap = 0
		end

		if y_overlap > 0 then
			position -= vector2_new(0, y_overlap + 5)
		elseif y_overlap < -y_size then
			position += vector2_new(0, y_overlap - 5)
		else
			y_overlap = 0
		end

		tween(settings["inside"], show_transparency, circular, out, 0.15)
		tween(
			border,
			{ tween_position = udim2_new(1, 5 - x_overlap, 0, -y_overlap), Transparency = 1 },
			circular,
			out,
			0.15
		)
		border["Visible"] = true
		actives["settings"] = settings
	end

	local close_settings = function(settings)
		local border = settings["border"]
		for _, element in settings["elements"] do
			for _, drawing in element["drawings"] do
				tween(drawing, hide_transparency, circular, out, 0.15)
			end
		end
		tween(settings["inside"], hide_transparency, circular, out, 0.15)
		tween(border, { tween_position = udim2_new(1, 5, 0, -5), Transparency = 0 }, circular, out, 0.15)
		actives["settings"] = nil
		delay(0.15, function()
			if actives["settings"] ~= settings then
				border["Visible"] = false
			end
		end)

		if menu["saved"] then
			menu["saved"] = false
			writefile(
				file_path .. "/data.dat",
				http_service:JSONEncode({
					["notifications"] = do_notifications,
					["favorites"] = menu["favorites"],
					["theme"] = menu["theme"],
					["hide_on_load"] = menu["hide_on_load"],
					["autoload"] = menu["autoload"],
				})
			)
		end
	end

	local stop_typing = function()
		for i = 1, #heartbeat do
			if heartbeat[i] == type_function then
				remove(heartbeat, i)
				break
			end
		end

		if active_typing then
			active_typing["Text"] = old_text
			active_typing = false
			type_line["Visible"] = false
		end

		context_action_service:UnbindAction(context_action_typing)
	end

	local stop_search = function()
		local children = search_out["children"]
		click_connections[search_out] = nil
		hover_connections[search_out] = nil

		for _, child in children do
			children[_] = nil
			child:Destroy()
		end

		search_out_border["Visible"] = false

		searching = nil

		tween(
			search_image,
			{ tween_position = udim2_new(0, 27, 1, -27), Color = menu["colors"]["image"] },
			circular,
			out,
			0.15
		)
		tween(search_border, { Color = menu["colors"]["border"], ["Transparency"] = 0 }, circular, out, 0.15)
		tween(search_inside, hide_transparency, circular, out, 0.15)
		tween(search_text, hide_transparency, circular, out, 0.15)

		delay(0.15, function()
			if not searching then
				search_border["Visible"] = false
			end
		end)
	end

	local start_typing = LPH_JIT_MAX(
		function(label, limit, callback, numbers, allow_enter, allow_all, only_on_enter) -- > LOL dont ask im too lazy to rewrite this >->
			if active_typing then
				stop_typing()
				return
			end

			type_line["Size"] = udim2_new(0, 1, 0, label["Size"] - 1)
			active_typing = label
			type_line["Visible"] = true
			heartbeat[#heartbeat + 1] = type_function

			local current_input = ""

			old_text = label["Text"]

			local items = Enum["KeyCode"]:GetEnumItems()

			local backspace = Enum["KeyCode"]["Backspace"]
			local enter = Enum["KeyCode"]["Return"]
			local shift = Enum["KeyCode"]["LeftShift"]

			context_action_service:BindAction(context_action_typing, function(_, state, input)
				if state == Enum["UserInputState"]["Begin"] then
					local keycode = input["KeyCode"]
					local is_enter = keycode == enter
					local last_input = current_input

					if is_enter and allow_enter then
						stop_typing()

						if searching then
							stop_search()
						end

						if actives["panel"] then
							stop_panel_search()
						end

						callback(current_input, input)

						return
					elseif keycode == backspace and #current_input > 0 then
						current_input = current_input:sub(1, #current_input - 1)
					elseif
						user_input_service:IsKeyDown(Enum["KeyCode"]["LeftControl"])
						and user_input_service:IsKeyDown(Enum["KeyCode"]["V"])
					then
						local textbox = create_instance("TextBox", {
							["Name"] = "\0",
							["Parent"] = hui,
						})
						textbox:CaptureFocus()
						keypress(0xA2)
						keypress(0x56)
						wait()
						keyrelease(0xA2)
						keyrelease(0x56)
						local text = textbox["Text"]
						if text and #text > 0 then
							current_input ..= text
						end
						textbox["Parent"] = nil
						textbox:Destroy()
					elseif keycode then
						if label["TextBounds"]["X"] > limit then
							return
						end

						local letter = user_input_service:GetStringForKeyCode(keycode):lower()
						local byte = string["byte"](letter)

						if
							(allow_all and byte)
							or (
								byte
								and (
									not numbers
										and (byte == 32 or byte == 44 or byte == 46 or byte >= 97 and byte <= 122)
									or numbers and (byte == 44 or byte == 46 or byte >= 48 and byte <= 57)
								)
							)
						then
							current_input ..= (
								user_input_service:IsKeyDown(shift) and string["upper"] or string["lower"]
							)(letter)
						end

						callback(current_input)
					end

					label["Text"] = current_input

					if is_enter and only_on_enter or not only_on_enter then
						local ignore = callback(current_input, input)

						if ignore then
							current_input = last_input
						end
					end
				end
			end, false, unpack(items))

			label["Text"] = ""
		end
	)

	local do_search = LPH_JIT_MAX(function(text)
		local children = search_out["children"]
		hover_connections[search_out] = nil
		click_connections[search_out] = nil

		for _, child in children do
			children[_] = nil
			child:Destroy()
		end

		search_out_border["Visible"] = false

		if #text < 2 then
			return
		end

		local results = {}

		text = text:lower()

		for name, group in menu["groups"] do
			for name, tab in group["tabs"] do
				for _, section in tab["sections"] do
					local elements = section["elements"]
					for i = 1, #elements do
						local element = elements[i]
						local test = (element["name"] or "f"):lower():gsub(" ", "")
						if test:find(text) then
							results[#results + 1] = {
								group,
								tab,
								section,
								element,
							}
						end
					end
				end
			end
		end

		for element_settings, settings in menu["settings"] do
			local elements = settings["elements"]
			for i = 1, #elements do
				local element = elements[i]
				if (element["name"]:lower()):find(text) then
					results[#results + 1] = {
						element_settings,
						element,
						settings,
					}
				end
			end
		end

		local max_textbounds = 0

		if #results > 0 then
			search_out_border["Visible"] = true

			local size = 8 + #results * 12

			for i = 1, #results do
				local result = results[i]
				local path = nil
				local tab = nil
				local settings = nil
				local settings_element = nil
				local element = nil
				if #result == 3 then
					path = result[1]["name"] .. " > " .. result[2]["name"]
					settings = result[3]
					settings_element = result[1]
					element = result[2]
				else
					tab = result[2]
					path = result[3]["name"] .. " > " .. result[4]["name"]
					element = result[4]
				end

				local position = udim2_new(0, 3, 0, 3 + (i - 1) * 12)
				local text_click = drawing_proxy["new"]("Square", {
					["Size"] = udim2_new(1, -6, 0, 12),
					["Position"] = position,
					["Visible"] = true,
					["Filled"] = true,
					["Transparency"] = 0,
					["Parent"] = search_out,
				})
				local text = drawing_proxy["new"]("Text", {
					["Color"] = menu["colors"]["inactive_text"],
					["Text"] = path,
					["Size"] = 12,
					["Font"] = 1,
					["Transparency"] = 1,
					["Visible"] = true,
					["Parent"] = search_out,
					["Position"] = udim2_new(0, 3, 0, 3 + (i - 1) * 12),
					["ZIndex"] = 1001,
				})

				local textbounds = text["TextBounds"]
				if textbounds["X"] > max_textbounds then
					max_textbounds = textbounds["X"]
				end

				create_hover_connection(search_out, text_click, function()
					tween(text, { ["Color"] = menu["colors"]["highlighted"] }, circular, out, 0.17)
				end, function()
					tween(text, { ["Color"] = menu["colors"]["inactive_text"] }, circular, out, 0.17)
				end)

				create_click_connection(search_out, text_click, function()
					stop_search()
					stop_typing()
					if not tab then
						for name, group in menu["groups"] do
							for name, potential_tab in group["tabs"] do
								for _, section in potential_tab["sections"] do
									local elements = section["elements"]
									for i = 1, #elements do
										if elements[i] == settings_element then
											tab = potential_tab
											break
										end
									end
								end
							end
						end
					end
					if tab and actives["tab"] ~= tab then
						set_active_tab(tab)
					end
					if settings then
						if tab then
							wait(0.075)
						end
						open_settings(settings)
					end
					local drawings = element["drawings"]
					local label = drawings["button_text"] or drawings["text"]
					tween(label, hide_transparency, circular, out, 0.33)
					delay(0.33, function()
						if menu_open then
							tween(label, show_transparency, circular, out, 0.33)
							delay(0.33, function()
								if menu_open then
									tween(label, hide_transparency, circular, out, 0.33)
									delay(0.33, function()
										if menu_open then
											tween(label, show_transparency, circular, out, 0.33)
										end
									end)
								end
							end)
						end
					end)
				end)
			end

			search_out_border["Size"] = udim2_new(0, max_textbounds + 8, 0, size)
			search_out_border["Position"] = udim2_new(0, 11, 1, -42 - size)
			search_out["Size"] = udim2_new(1, -2, 1, -2)

			local children = search_out["children"]
			for i = 1, #children do
				local child = children[i]
				if child["Size"] ~= 12 then
					child["Size"] = udim2_new(1, -6, 0, 12)
				end
			end
		end
	end)

	local start_search = function()
		tween(
			search_image,
			{ tween_position = udim2_new(0, 14, 1, -27), Color = menu["colors"]["highlighted"] },
			circular,
			out,
			0.15
		)
		tween(search_border, { ["Transparency"] = 1, ["Color"] = menu["colors"]["highlighted"] }, circular, out, 0.15)
		tween(search_inside, show_transparency, circular, out, 0.15)
		tween(search_text, show_transparency, circular, out, 0.15)
		search_border["Visible"] = true

		searching = true

		start_typing(search_text, 51, do_search, false, true, true, false)
	end

	local stop_binding = function(key)
		context_action_service:UnbindCoreAction(context_action_typing_core)
		tween(
			actives["binding"]["drawings"]["keybind_text"],
			{ ["Color"] = menu["colors"]["dark_text"] },
			circular,
			out,
			0.17
		)
		actives["binding"] = nil
	end

	local start_binding = function(element)
		actives["binding"] = element

		local drawings = element["drawings"]
		local keybind_border = drawings["keybind_border"]
		local keybind_inside = drawings["keybind_inside"]
		local keybind_text = drawings["keybind_text"]

		keybind_text["Text"] = "..."

		local size = keybind_text["TextBounds"]["X"] + 8

		keybind_border["Size"] = udim2_new(0, size, 0, 12)
		keybind_border["Position"] = udim2_new(1, -size, 0, 0)
		keybind_inside["Size"] = udim2_new(0, size - 2, 0, 10)
		keybind_text["Position"] = udim2_new(0, (size - 2) / 2, 0, -2)

		local escape = Enum["KeyCode"]["Escape"]
		local tilde = Enum["KeyCode"]["Tilde"]
		local items = Enum["KeyCode"]:GetEnumItems()

		for _, a in Enum["UserInputType"]:GetEnumItems() do
			items[#items + 1] = a
		end

		context_action_service:BindCoreAction(context_action_typing_core, function(_, state, input)
			local key = shortened_characters[input["UserInputType"]] and input["UserInputType"] or input["KeyCode"]

			if state == Enum["UserInputState"]["Begin"] and key ~= Enum["KeyCode"]["Unknown"] then
				if key == escape or key == tilde then
					key = nil
				end

				element:set_key(key)

				stop_binding()
			end
		end, false, unpack(items))

		tween(keybind_text, { Color = menu["colors"]["accent"] }, circular, out, 0.17)
	end

	local dropdown_border = drawing_proxy["new"]("Image", {
		["Position"] = udim2_new(0, 0, 0, 14),
		["Size"] = udim2_new(0, 0, 0, 15),
		["Color"] = menu["colors"]["border"],
		["Transparency"] = 0,
		["Rounding"] = 4,
		["Data"] = pixel_image_data,
		["ZIndex"] = 1003,
		["Visible"] = false,
	})

	local dropdown_inside = drawing_proxy["new"]("Image", {
		["Parent"] = dropdown_border,
		["Position"] = udim2_new(0, 1, 0, 1),
		["Size"] = udim2_new(1, -2, 1, -2),
		["Color"] = menu["colors"]["background"],
		["Rounding"] = 4,
		["Data"] = pixel_image_data,
		["Transparency"] = 0,
		["ZIndex"] = 1004,
		["Visible"] = true,
	})

	local close_dropdown = function()
		local position = dropdown_border["real_position"]
		tween(
			dropdown_border,
			{ tween_position = udim2_new(0, position["X"], 0, position["Y"] - 5), Transparency = 0 },
			circular,
			out,
			0.15
		)
		tween(dropdown_inside, hide_transparency, circular, out, 0.15)
		local connections = click_connections[dropdown_border]

		if connections then
			for object, callback in connections do
				click_connections[object] = nil
			end
			click_connections[dropdown_border] = nil
		end

		local connections = hover_connections[dropdown_border]

		if connections then
			for object, callback in hover_connections[dropdown_border] do
				hover_connections[object] = nil
			end
		end

		local children = dropdown_inside["children"]
		for _, child in children do
			local children = child["children"]
			for i = 1, #children do
				tween(children[i], hide_transparency, circular, out, 0.15)
			end
		end

		local children = dropdown_inside["children"]
		for _, child in children do
			children[_] = nil

			delay(0.14, function()
				child:Destroy()
				local children = child["children"]
				for i = 1, #children do
					children[i]:Destroy()
				end
			end)
		end

		hover_connections[dropdown_border] = nil
		actives["dropdown"] = nil
	end

	local open_dropdown = function(element)
		actives["dropdown"] = element

		local border = element["drawings"]["dropdown_border"]
		local position = border["real_position"]
		local size = border["real_size"]
		dropdown_border["Position"] = udim2_new(0, position["X"], 0, position["Y"] + 15)
		dropdown_border["Visible"] = true
		tween(
			dropdown_border,
			{ tween_position = udim2_new(0, position["X"], 0, position["Y"] + 18), Transparency = 1 },
			circular,
			out,
			0.15
		)
		tween(dropdown_inside, show_transparency, circular, out, 0.15)

		local options = element["options"]
		dropdown_border["Size"] = udim2_new(0, size["X"], 0, (8 + #options * 12))
		dropdown_inside["Size"] = udim2_new(0, size["X"] - 2, 0, (8 + #options * 12) - 2)

		local selected_options = flags[element["dropdown_flag"]]

		local multi = element["multi"]

		for i = 1, #options do
			local option = options[i]
			local selected = nil
			if selected_options then
				for i = 1, #selected_options do
					if selected_options[i] == option then
						selected = true
						break
					end
				end
			end

			local option_click = drawing_proxy["new"]("Square", {
				["Parent"] = dropdown_inside,
				["Size"] = udim2_new(1, -6, 0, 12),
				["Transparency"] = 0,
				["Visible"] = true,
				["Filled"] = true,
				["Position"] = udim2_new(0, 3, 0, 3 + (i - 1) * 12),
			})
			local option_checkmark = drawing_proxy["new"]("Image", {
				["Parent"] = option_click,
				["Position"] = udim2_new(1, -8, 0, 2),
				["Size"] = udim2_new(0, 8, 0, 8),
				["Data"] = checkmark_image_data,
				["Transparency"] = 0,
				["ZIndex"] = 1005,
				["Color"] = menu["colors"]["highlighted"],
				["Visible"] = true,
			})
			local option_text = drawing_proxy["new"]("Text", {
				["Color"] = menu["colors"]["inactive_text"],
				["Text"] = option,
				["Size"] = 12,
				["Font"] = 1,
				["Transparency"] = 0,
				["Visible"] = true,
				["Parent"] = option_click,
				["ZIndex"] = 1005,
				["Position"] = udim2_new(0, 0, 0, 0),
			})

			tween(option_text, show_transparency, circular, out, 0.15)

			create_hover_connection(dropdown_border, option_click, function()
				if not selected then
					tween(option_text, { ["Color"] = menu["colors"]["highlighted"] }, circular, out, 0.17)
				end
			end, function()
				if not selected then
					tween(option_text, { Color = menu["colors"]["inactive_text"] }, circular, out, 0.17)
				end
			end)

			create_click_connection(dropdown_border, option_click, function()
				local result = element:update_dropdown_value(option)
				if result then
					selected = true
					tween(option_checkmark, show_transparency, circular, out, 0.15)
					if not multi then
						close_dropdown(actives["dropdown"])
					end
				elseif result == false then
					selected = false
					tween(option_checkmark, hide_transparency, circular, out, 0.15)
					if not multi then
						close_dropdown(actives["dropdown"])
					end
				end
			end)

			if selected then
				option_text["Color"] = menu["colors"]["highlighted"]
				tween(option_checkmark, show_transparency, circular, out, 0.15)
			end
		end
	end

	local context_border = drawing_proxy["new"]("Image", {
		["Position"] = udim2_new(0, 0, 0, 14),
		["Size"] = udim2_new(0, 100, 0, 15),
		["Color"] = menu["colors"]["border"],
		["Transparency"] = 0,
		["Rounding"] = 4,
		["Data"] = pixel_image_data,
		["ZIndex"] = 998,
		["Visible"] = false,
	})

	local context_inside = drawing_proxy["new"]("Image", {
		["Parent"] = context_border,
		["Position"] = udim2_new(0, 1, 0, 1),
		["Size"] = udim2_new(1, -2, 1, -2),
		["Color"] = menu["colors"]["background"],
		["Rounding"] = 4,
		["Data"] = pixel_image_data,
		["Transparency"] = 0,
		["ZIndex"] = 999,
		["Visible"] = true,
	})

	local keybind_border = drawing_proxy["new"]("Image", {
		["Position"] = udim2_new(0, 0, 0, 14),
		["Size"] = udim2_new(0, 170, 0, 20),
		["Color"] = menu["colors"]["border"],
		["Transparency"] = 0,
		["Rounding"] = 4,
		["Data"] = pixel_image_data,
		["ZIndex"] = 998,
		["Visible"] = false,
	})

	local keybind_inside = drawing_proxy["new"]("Image", {
		["Parent"] = keybind_border,
		["Position"] = udim2_new(0, 1, 0, 1),
		["Size"] = udim2_new(1, -2, 1, -2),
		["Color"] = menu["colors"]["background"],
		["Rounding"] = 4,
		["Data"] = pixel_image_data,
		["Transparency"] = 0,
		["ZIndex"] = 999,
		["Visible"] = true,
	})

	local keybind_holder = drawing_proxy["new"]("Square", {
		["Parent"] = keybind_inside,
		["Position"] = udim2_new(0, 10, 0, 10),
		["Size"] = udim2_new(1, -20, 1, -20),
		["Transparency"] = 0,
		["Filled"] = true,
		["Visible"] = true,
	})

	local keybind_section = nil
	local copied_transparency = nil
	local copied_color = nil

	local close_keybind = function()
		local position = keybind_border["real_position"]
		tween(
			keybind_border,
			{ tween_position = udim2_new(0, position["X"], 0, position["Y"] - 5), Transparency = 0 },
			circular,
			out,
			0.15
		)
		tween(keybind_inside, hide_transparency, circular, out, 0.15)

		local keybind_elements = keybind_section["elements"]
		for i = #keybind_elements, 1, -1 do
			keybind_elements[i]:remove()
		end

		click_connections[keybind_inside] = nil
		hover_connections[keybind_inside] = nil

		actives["keybind"] = nil

		delay(0.15, function()
			if not actives["keybind"] then
				keybind_border["Visible"] = false
			end
		end)
	end

	local star = base64_decode(
		"iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAMAAABhq6zVAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAGUExURf///wAAAFXC034AAAACdFJOU/8A5bcwSgAAAAlwSFlzAAALGAAACxgBiam1EAAAABh0RVh0U29mdHdhcmUAUGFpbnQuTkVUIDUuMS4y+7wDtgAAALZlWElmSUkqAAgAAAAFABoBBQABAAAASgAAABsBBQABAAAAUgAAACgBAwABAAAAAgAAADEBAgAQAAAAWgAAAGmHBAABAAAAagAAAAAAAADIGQEA6AMAAMgZAQDoAwAAUGFpbnQuTkVUIDUuMS4yAAMAAJAHAAQAAAAwMjMwAaADAAEAAAABAAAABaAEAAEAAACUAAAAAAAAAAIAAQACAAQAAABSOTgAAgAHAAQAAAAwMTAwAAAAACaOS8o1uPhvAAAALklEQVQYV2NgRAIQDgOUgpBIHAYggNE4AEISogfGxuBA2FBlEBrCASsAqWFgBAAZ8wBLe9n4/wAAAABJRU5ErkJggg=="
	)
	local autoload = base64_decode(
		"iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAMAAADz0U65AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAGUExURf///wAAAFXC034AAAACdFJOU/8A5bcwSgAAAAlwSFlzAAAN1gAADdYBkG95nAAAABh0RVh0U29mdHdhcmUAUGFpbnQuTkVUIDUuMS40Et+mgwAAALZlWElmSUkqAAgAAAAFABoBBQABAAAASgAAABsBBQABAAAAUgAAACgBAwABAAAAAgAAADEBAgAQAAAAWgAAAGmHBAABAAAAagAAAAAAAACIXwEA6AMAAIhfAQDoAwAAUGFpbnQuTkVUIDUuMS40AAMAAJAHAAQAAAAwMjMwAaADAAEAAAABAAAABaAEAAEAAACUAAAAAAAAAAIAAQACAAQAAABSOTgAAgAHAAQAAAAwMTAwAAAAAItCLPyg+gOlAAAAJklEQVQYV2NgBAIQAcQMQABiAEkoAyQJZ4BkIQwQBCkA80G6GBkBBlgAKnvLiKoAAAAASUVORK5CYII="
	)
	local context_buttons = {
		[1] = {
			"create keybind",
			base64_decode(
				"iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAYAAADED76LAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAFE0AABRNAZTKjS8AAAAYdEVYdFNvZnR3YXJlAFBhaW50Lk5FVCA1LjEuMvu8A7YAAAC2ZVhJZklJKgAIAAAABQAaAQUAAQAAAEoAAAAbAQUAAQAAAFIAAAAoAQMAAQAAAAIAAAAxAQIAEAAAAFoAAABphwQAAQAAAGoAAAAAAAAAvQMCAOgDAAC9AwIA6AMAAFBhaW50Lk5FVCA1LjEuMgADAACQBwAEAAAAMDIzMAGgAwABAAAAAQAAAAWgBAABAAAAlAAAAAAAAAACAAEAAgAEAAAAUjk4AAIABwAEAAAAMDEwMAAAAACZvWRFEAE3KwAAACtJREFUKFNjQAb/oQDKBQMmKI0TEFTAiG4kOiBoAgoAuxAIoFwwoNSRDAwA1K8T+Ha/C0cAAAAASUVORK5CYII="
			),
			LPH_JIT_MAX(function()
				local new_keybind_data = keybind_data[actives["context"]]
				local do_fire = false

				if not new_keybind_data then
					new_keybind_data = setmetatable({
						["key"] = nil,
						["method"] = 1,
						["value"] = nil,
						["activated"] = false,
						["original_value"] = nil,
						["type"] = nil,
						["element"] = actives["context"],
					}, keybind)

					do_fire = true
				end

				keybind_data[actives["context"]] = new_keybind_data

				local position = context_border["real_position"]
				local y_position = position["Y"] + context_border["real_size"]["Y"]
				keybind_border["Position"] = udim2_new(0, position["X"], 0, y_position)
				tween(
					keybind_border,
					{ tween_position = udim2_new(0, position["X"], 0, y_position + 5), Transparency = 1 },
					circular,
					out,
					0.15
				)
				tween(keybind_inside, show_transparency, circular, out, 0.15)
				keybind_border["Visible"] = true

				actives["keybind"] = actives["context"]

				local new_keybind = keybind_section:create_element({
					["name"] = "key",
				}, {
					["keybind"] = {
						["flag"] = tostring({}):sub(math_random(8, 12)),
					},
				}, true)

				new_keybind:set_key(new_keybind_data["key"])

				local activate_when = keybind_section:create_element({
					["name"] = "activate when",
				}, {
					["dropdown"] = {
						["flag"] = tostring({}):sub(math_random(8, 12)),
						["requires_one"] = true,
						["options"] = { "toggled", "not held", "held" },
						["default"] = { "toggled" },
					},
				}, true)

				local method = new_keybind_data["method"]

				activate_when:set_dropdown(
					method == 1 and { "toggled" } or method == 2 and { "not held" } or { "held" }
				)

				create_connection(activate_when["on_dropdown_change"], function(value)
					local value = value[1]
					new_keybind_data["method"] = value == "toggled" and 1 or value == "not held" and 2 or 3
					new_keybind_data:set_activated(value == "not held" and true or false)
				end)

				local active = actives["keybind"]

				if active["options"] then
					local was_nil = new_keybind_data["type"] == nil
					new_keybind_data["type"] = 1

					if was_nil then
						new_keybind_data["value"] = flags[active["dropdown_flag"]]
						new_keybind_data["original_value"] = new_keybind_data["value"]
					end

					local new_dropdown = keybind_section:create_element({
						["name"] = "new value",
					}, {
						["dropdown"] = {
							["default"] = new_keybind_data["value"],
							["flag"] = tostring({}):sub(math_random(8, 12)),
							["options"] = active["options"],
							["requires_one"] = active["requires_one"],
							["multi"] = active["multi"],
						},
					}, true)

					create_connection(new_dropdown["on_dropdown_change"], function(value)
						new_keybind_data["value"] = value

						if new_keybind_data["activated"] then
							actives["context"]:set_dropdown(value, true)
						end
					end)
				elseif active["slider_flag"] then
					local was_nil = new_keybind_data["type"] == nil

					new_keybind_data["type"] = 2

					if was_nil then
						new_keybind_data["value"] = flags[active["slider_flag"]]
						new_keybind_data["original_value"] = new_keybind_data["value"]
					end

					local new_slider = keybind_section:create_element({
						name = "new value",
					}, {
						["slider"] = {
							["default"] = new_keybind_data["value"],
							["flag"] = tostring({}):sub(math_random(8, 12)),
							["min"] = active["slider_min"],
							["max"] = active["slider_max"],
							["min_text"] = active["slider_min_text"],
							["prefix"] = active["slider_prefix"],
							["suffix"] = active["slider_suffix"],
							["max_text"] = active["slider_max_text"],
							["decimals"] = active["slider_decimals"],
						},
					}, true)

					create_connection(new_slider["on_slider_change"], function(value)
						new_keybind_data["value"] = value
						on_keybind_updated:Fire(new_keybind_data, actives["context"])

						if new_keybind_data["activated"] then
							actives["context"]:set_slider(value, true)
						end
					end)
				elseif active["toggle_flag"] then
					new_keybind_data["type"] = 3

					new_keybind_data["value"] = flags[active["toggle_flag"]]
					new_keybind_data["original_value"] = flags[active["toggle_flag"]]
				else
					activate_when:set_visible(false)
					new_keybind_data["type"] = 4
					new_keybind_data["method"] = 1
				end

				create_connection(new_keybind["on_key_change"], function(key)
					new_keybind_data["key"] = key
				end)

				if do_fire then
					on_keybind_created:Fire(new_keybind_data, actives["context"])
				end
			end),
		},
		[2] = {
			"delete keybind",
			base64_decode(
				"iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAYAAADED76LAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAAYdEVYdFNvZnR3YXJlAFBhaW50Lk5FVCA1LjEuMvu8A7YAAAC2ZVhJZklJKgAIAAAABQAaAQUAAQAAAEoAAAAbAQUAAQAAAFIAAAAoAQMAAQAAAAIAAAAxAQIAEAAAAFoAAABphwQAAQAAAGoAAAAAAAAADHcBAOgDAAAMdwEA6AMAAFBhaW50Lk5FVCA1LjEuMgADAACQBwAEAAAAMDIzMAGgAwABAAAAAQAAAAWgBAABAAAAlAAAAAAAAAACAAEAAgAEAAAAUjk4AAIABwAEAAAAMDEwMAAAAADu6i0YxswAAgAAAChJREFUKFNjQAb/oQDKBQNGEIEuCAOMQABl4gYETWCCsnECmitgYAAAtW8QA/NoRH8AAAAASUVORK5CYII="
			),
			function()
				local data = keybind_data[actives["context"]]

				if data then
					if data["type"] ~= 4 then
						data:set_activated(false)
					end
					keybind_data[actives["context"]] = nil
					on_keybind_deleted:Fire(data, actives["context"])
				end

				close_context()
			end,
		},
		[3] = {
			"paste color",
			base64_decode(
				"iVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAMAAAC67D+PAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAGUExURf///wAAAFXC034AAAACdFJOU/8A5bcwSgAAAAlwSFlzAAAN1gAADdYBkG95nAAAABh0RVh0U29mdHdhcmUAUGFpbnQuTkVUIDUuMS4y+7wDtgAAALZlWElmSUkqAAgAAAAFABoBBQABAAAASgAAABsBBQABAAAAUgAAACgBAwABAAAAAgAAADEBAgAQAAAAWgAAAGmHBAABAAAAagAAAAAAAACIXwEA6AMAAIhfAQDoAwAAUGFpbnQuTkVUIDUuMS4yAAMAAJAHAAQAAAAwMjMwAaADAAEAAAABAAAABaAEAAEAAACUAAAAAAAAAAIAAQACAAQAAABSOTgAAgAHAAQAAAAwMTAwAAAAALVxYeXXxjBrAAAALklEQVQYV2NgBAMGBgZGCBPEAGIIC04ASRgBkgeqBdPI4ig6wAIQFlgtmMXICAAM5AA7FWCogwAAAABJRU5ErkJggg=="
			),
			function()
				if copied_color and copied_transparency then
					actives["context"]:set_colorpicker(copied_color)
					actives["context"]:set_colorpicker_transparency(copied_transparency)
				end
				close_context()
			end,
		},
		[4] = {
			"copy color",
			base64_decode(
				"iVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAYAAACNMs+9AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAACxMAAAsTAQCanBgAAAAYdEVYdFNvZnR3YXJlAFBhaW50Lk5FVCA1LjEuMvu8A7YAAAC2ZVhJZklJKgAIAAAABQAaAQUAAQAAAEoAAAAbAQUAAQAAAFIAAAAoAQMAAQAAAAIAAAAxAQIAEAAAAFoAAABphwQAAQAAAGoAAAAAAAAASRkBAOgDAABJGQEA6AMAAFBhaW50Lk5FVCA1LjEuMgADAACQBwAEAAAAMDIzMAGgAwABAAAAAQAAAAWgBAABAAAAlAAAAAAAAAACAAEAAgAEAAAAUjk4AAIABwAEAAAAMDEwMAAAAAAv0m/2Gfr+yQAAAEFJREFUKFNjZEAC/4EAykQBjCAAZYMBLoUgwAQi8CmAASZiFIEA2ERiAPUVMiK7ET0UkAGKQmwAppkJnykIwMAAAFFQGAl6/FkNAAAAAElFTkSuQmCC"
			),
			function()
				copied_color = flags[actives["context"]["color_flag"]]
				copied_transparency = flags[actives["context"]["transparency_flag"]]
				close_context()
			end,
		},
		[5] = {
			"favorite",
			base64_decode(
				"iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAMAAADz0U65AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAGUExURf///wAAAFXC034AAAACdFJOU/8A5bcwSgAAAAlwSFlzAAALGAAACxgBiam1EAAAABh0RVh0U29mdHdhcmUAUGFpbnQuTkVUIDUuMS4y+7wDtgAAALZlWElmSUkqAAgAAAAFABoBBQABAAAASgAAABsBBQABAAAAUgAAACgBAwABAAAAAgAAADEBAgAQAAAAWgAAAGmHBAABAAAAagAAAAAAAADIGQEA6AMAAMgZAQDoAwAAUGFpbnQuTkVUIDUuMS4yAAMAAJAHAAQAAAAwMjMwAaADAAEAAAABAAAABaAEAAEAAACUAAAAAAAAAAIAAQACAAQAAABSOTgAAgAHAAQAAAAwMTAwAAAAACaOS8o1uPhvAAAAH0lEQVQYV2NghAIQgwFMwBlwAGWCpMA0MgOkkpGBEQAF1gAlfZ5svQAAAABJRU5ErkJggg=="
			),
			function()
				local active = actives["context"]
				local favorites = menu["favorites"]
				local flag = active["favorite_flag"]

				if not favorites[flag] then
					favorites[flag] = true
					menu["saved"] = true
					active["favorited"] = true
					active["parent"]:add_icon(active["drawings"]["text"]["Text"], star)

					writefile(
						file_path .. "/data.dat",
						http_service:JSONEncode({
							["notifications"] = do_notifications,
							["favorites"] = menu["favorites"],
							["theme"] = menu["theme"],
							["autoload"] = menu["autoload"],
						})
					)
				end

				close_context()
			end,
		},
		[6] = {
			"unfavorite",
			base64_decode(
				"iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAMAAADz0U65AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAGUExURf///wAAAFXC034AAAACdFJOU/8A5bcwSgAAAAlwSFlzAAALGAAACxgBiam1EAAAABh0RVh0U29mdHdhcmUAUGFpbnQuTkVUIDUuMS4y+7wDtgAAALZlWElmSUkqAAgAAAAFABoBBQABAAAASgAAABsBBQABAAAAUgAAACgBAwABAAAAAgAAADEBAgAQAAAAWgAAAGmHBAABAAAAagAAAAAAAADIGQEA6AMAAMgZAQDoAwAAUGFpbnQuTkVUIDUuMS4yAAMAAJAHAAQAAAAwMjMwAaADAAEAAAABAAAABaAEAAEAAACUAAAAAAAAAAIAAQACAAQAAABSOTgAAgAHAAQAAAAwMTAwAAAAACaOS8o1uPhvAAAAH0lEQVQYV2NghAIQgwFMwBlwAGWCpMA0MgOkkpGBEQAF1gAlfZ5svQAAAABJRU5ErkJggg=="
			),
			function()
				local active = actives["context"]

				local favorites = menu["favorites"]
				local flag = active["favorite_flag"]
				if favorites[flag] then
					favorites[flag] = nil
					active["favorited"] = false
					active["parent"]:remove_icon(active["drawings"]["text"]["Text"], star)
					menu["saved"] = true

					writefile(
						file_path .. "/data.dat",
						http_service:JSONEncode({
							["notifications"] = do_notifications,
							["favorites"] = menu["favorites"],
							["theme"] = menu["theme"],
							["autoload"] = menu["autoload"],
						})
					)
				end

				close_context()
			end,
		},
		[7] = {
			"paste clipboard",
			base64_decode(
				"iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAMAAABhq6zVAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAGUExURf///wAAAFXC034AAAACdFJOU/8A5bcwSgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAABh0RVh0U29mdHdhcmUAUGFpbnQuTkVUIDUuMS40Et+mgwAAALZlWElmSUkqAAgAAAAFABoBBQABAAAASgAAABsBBQABAAAAUgAAACgBAwABAAAAAgAAADEBAgAQAAAAWgAAAGmHBAABAAAAagAAAAAAAAAMdwEA6AMAAAx3AQDoAwAAUGFpbnQuTkVUIDUuMS40AAMAAJAHAAQAAAAwMjMwAaADAAEAAAABAAAABaAEAAEAAACUAAAAAAAAAAIAAQACAAQAAABSOTgAAgAHAAQAAAAwMTAwAAAAANDZYAGx8DPMAAAAHklEQVQYV2NgBAEGKAVhQ3hAAsyCEBBxEKAXh5ERABXWAD2lxbDCAAAAAElFTkSuQmCC"
			),
			function()
				local textbox = create_instance("TextBox", {
					["Parent"] = hui,
				})
				textbox:CaptureFocus()
				keypress(0xA2)
				keypress(0x56)
				wait()
				wait()
				keyrelease(0xA2)
				keyrelease(0x56)
				local text = textbox["Text"]
				textbox:Destroy()

				local r, g, b = 255, 255, 255
				local a = 0

				local trimmed_text = (text:match("^%s*(.-)%s*$") or ""):lower():gsub("%s+", "")

				local parsed = false

				local hex_digits = trimmed_text:match("^#?([0-9a-f]+)$")
				if hex_digits then
					local len = #hex_digits
					if len == 6 then
						local r_val = tonumber(hex_digits:sub(1, 2), 16)
						local g_val = tonumber(hex_digits:sub(3, 4), 16)
						local b_val = tonumber(hex_digits:sub(5, 6), 16)
						if r_val and g_val and b_val then
							r, g, b = r_val, g_val, b_val
							parsed = true
						end
					elseif len == 8 then
						local r_val = tonumber(hex_digits:sub(1, 2), 16)
						local g_val = tonumber(hex_digits:sub(3, 4), 16)
						local b_val = tonumber(hex_digits:sub(5, 6), 16)
						local a_val = tonumber(hex_digits:sub(7, 8), 16)
						if r_val and g_val and b_val and a_val then
							r, g, b = r_val, g_val, b_val
							a = 1 - (math["min"](math["max"](a_val, 0), 255) / 255)
							parsed = true
						end
					end
				end

				if not parsed then
					local r_str, g_str, b_str, a_str = trimmed_text:match("^(%d+),(%d+),(%d+),?(%d*)$")
					if r_str and g_str and b_str then
						local r_val = tonumber(r_str)
						local g_val = tonumber(g_str)
						local b_val = tonumber(b_str)
						if r_val and g_val and b_val then
							r, g, b = r_val, g_val, b_val
							if a_str and #a_str > 0 then
								local a_val = tonumber(a_str)
								if a_val then
									a = 1 - (math["min"](math["max"](a_val, 0), 255) / 255)
								end
							end
						end
					end
				end

				if r and g and b then
					actives["context"]:set_colorpicker(color3_fromrgb(r, g, b))
					actives["context"]:set_colorpicker_transparency(a or 0)
					close_context()
				end
			end,
		},
		[8] = {
			"autoload config",
			autoload,
			function()
				local active = actives["context"]
				local name = active["name"]

				if menu["autoload"] ~= name then
					menu["autoload"] = name
					menu["saved"] = true
					local parent = active["parent"]
					local elements = parent["elements"]

					for _, element in next, elements do
						parent:remove_icon(element["name"], autoload)
					end

					active["parent"]:add_icon(active["drawings"]["text"]["Text"], autoload)

					writefile(
						file_path .. "/data.dat",
						http_service:JSONEncode({
							["notifications"] = do_notifications,
							["favorites"] = menu["favorites"],
							["theme"] = menu["theme"],
							["autoload"] = menu["autoload"],
						})
					)
				end

				close_context()
			end,
		},
		[9] = {
			"stop autoload",
			base64_decode(
				"iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAMAAADz0U65AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAGUExURf///wAAAFXC034AAAACdFJOU/8A5bcwSgAAAAlwSFlzAAAPhwAAD4cBYAYLnAAAABh0RVh0U29mdHdhcmUAUGFpbnQuTkVUIDUuMS40Et+mgwAAALZlWElmSUkqAAgAAAAFABoBBQABAAAASgAAABsBBQABAAAAUgAAACgBAwABAAAAAgAAADEBAgAQAAAAWgAAAGmHBAABAAAAagAAAAAAAAB+igEA6AMAAH6KAQDoAwAAUGFpbnQuTkVUIDUuMS40AAMAAJAHAAQAAAAwMjMwAaADAAEAAAABAAAABaAEAAEAAACUAAAAAAAAAAIAAQACAAQAAABSOTgAAgAHAAQAAAAwMTAwAAAAANdbGZi1Ab9fAAAAJElEQVQYV2NgYGAEAiAFZoFJMBtIQbnIDBANVQERBNGMjAwMAAOoABlFkxrMAAAAAElFTkSuQmCC"
			),
			function()
				local active = actives["context"]
				local active = actives["context"]
				local name = active["name"]

				if menu["autoload"] == name then
					menu["autoload"] = nil
					menu["saved"] = true
					active["parent"]:remove_icon(active["drawings"]["text"]["Text"], autoload)

					writefile(
						file_path .. "/data.dat",
						http_service:JSONEncode({
							["notifications"] = do_notifications,
							["favorites"] = menu["favorites"],
							["theme"] = menu["theme"],
							["autoload"] = menu["autoload"],
						})
					)
				end

				close_context()
			end,
		},
	}

	for i = 1, #context_buttons do
		local button = context_buttons[i]

		local button_click = drawing_proxy["new"]("Image", {
			["Parent"] = context_inside,
			["Size"] = udim2_new(1, 0, 0, 16),
			["Transparency"] = 0,
			["Color"] = menu["colors"]["background"],
			["Visible"] = true,
			["ZIndex"] = 999,
			["Data"] = pixel_image_data,
			["Rounding"] = 4,
		})

		local button_text = drawing_proxy["new"]("Text", {
			["Color"] = menu["colors"]["inactive_text"],
			["Text"] = button[1],
			["Size"] = 12,
			["Font"] = 1,
			["Transparency"] = 0,
			["Visible"] = true,
			["Parent"] = button_click,
			["Center"] = false,
			["Position"] = udim2_new(0, 18, 0, 1),
			["ZIndex"] = 1000,
		})

		local button_icon = drawing_proxy["new"]("Image", {
			["Data"] = button[2],
			["Color"] = menu["colors"]["accent"],
			["Size"] = udim2_new(0, 8, 0, 8),
			["Transparency"] = 0,
			["Visible"] = true,
			["Parent"] = button_click,
			["Position"] = udim2_new(0, 5, 0, 4),
			["ZIndex"] = 1000,
		})

		create_hover_connection(context_border, button_click, function()
			local h, s, v = menu["colors"]["background"]:ToHSV()

			tween(button_click, { Color = Color3["fromHSV"](h, s, clamp(v * 1.5, 0.1, 1)) }, circular, out, 0.15)
		end, function()
			tween(button_click, { Color = menu["colors"]["background"] }, circular, out, 0.15)
		end)

		create_click_connection(context_border, button_click, button[3])

		context_buttons[i] = {
			["frame"] = button_click,
			["text"] = button_text,
			["icon"] = button_icon,
		}
	end

	local open_context = function(buttons, element, position)
		local x_position = position["X"] + 15
		local y_position = 0

		context_border["Visible"] = true
		context_border["Position"] = udim2_new(0, x_position, 0, position["Y"] - 5)
		tween(
			context_border,
			{ Transparency = 1, tween_position = udim2_new(0, x_position, 0, position["Y"]) },
			circular,
			out,
			0.15
		)
		tween(context_inside, show_transparency, circular, out, 0.15)

		for i = 1, #context_buttons do
			context_buttons[i]["frame"]["Visible"] = false
		end

		local textbounds = 0

		for i = 1, #buttons do
			local index = buttons[i]
			local button = context_buttons[index]
			local callback = buttons[i]

			if callback then
				local frame = button["frame"]

				frame["Visible"] = true
				tween(frame, show_transparency, circular, out, 0.15)
				tween(button["text"], show_transparency, circular, out, 0.15)
				tween(button["icon"], half_transparency, circular, out, 0.15)
				frame["Position"] = udim2_new(0, 0, 0, y_position)

				if index == 1 then
					button["text"]["Text"] = keybind_data[element] and "edit keybind" or "create keybind"
				end

				local button_textbounds = button["text"]["TextBounds"]["X"]
				if button_textbounds > textbounds then
					textbounds = button_textbounds
				end
			end

			y_position = y_position + 16
		end

		context_border["Size"] = udim2_new(0, textbounds + 25, 0, y_position + 2)
		context_inside["Size"] = udim2_new(0, textbounds + 23, 0, y_position)

		for i = 1, #buttons do
			context_buttons[buttons[i]]["frame"]["Size"] = udim2_new(1, 0, 0, 16)
		end

		actives["context"] = element
	end

	close_context = function()
		local position = context_border["real_position"]

		tween(
			context_border,
			{ Transparency = 0, tween_position = udim2_new(0, position["X"], 0, position["Y"] - 5) },
			circular,
			out,
			0.15
		)
		tween(context_inside, hide_transparency, circular, out, 0.15)

		for i = 1, #context_buttons do
			local button = context_buttons[i]
			local frame = button["frame"]

			if frame["Visible"] then
				tween(frame, hide_transparency, circular, out, 0.15)
				tween(button["text"], hide_transparency, circular, out, 0.15)
				tween(button["icon"], hide_transparency, circular, out, 0.15)
			end
		end

		delay(0.15, function()
			if actives["context"] == nil then
				context_border["Visible"] = false
			end
		end)

		actives["context"] = nil
	end

	local colorpicker_border = drawing_proxy["new"]("Image", {
		["Position"] = udim2_new(0, 0, 0, 14),
		["Size"] = udim2_new(0, 185, 0, 221),
		["Color"] = menu["colors"]["border"],
		["Transparency"] = 0,
		["Rounding"] = 4,
		["Data"] = pixel_image_data,
		["ZIndex"] = 998,
		["Visible"] = false,
	})

	local colorpicker_inside = drawing_proxy["new"]("Image", {
		["Parent"] = colorpicker_border,
		["Position"] = udim2_new(0, 1, 0, 1),
		["Size"] = udim2_new(1, -2, 1, -2),
		["Color"] = menu["colors"]["background"],
		["Rounding"] = 4,
		["Data"] = pixel_image_data,
		["Transparency"] = 0,
		["ZIndex"] = 999,
		["Visible"] = true,
	})

	local colorpicker_saturation_background = drawing_proxy["new"]("Image", {
		["Parent"] = colorpicker_inside,
		["Position"] = udim2_new(0, 10, 0, 10),
		["Size"] = udim2_new(0, 163, 0, 163),
		["Color"] = color3_fromrgb(255, 255, 255),
		["Transparency"] = 1,
		["Rounding"] = 4,
		["Data"] = pixel_image_data,
		["ZIndex"] = 1000,
		["Visible"] = true,
	})

	local colorpicker_saturation = drawing_proxy["new"]("Image", {
		["Parent"] = colorpicker_saturation_background,
		["Position"] = udim2_new(0, 0, 0, 0),
		["Size"] = udim2_new(0, 163, 0, 163),
		["Color"] = color3_fromrgb(255, 0, 0),
		["Transparency"] = 1,
		["Rounding"] = 4,
		["Data"] = readfile(file_path .. "/assets/saturation.png"),
		["ZIndex"] = 1001,
		["Visible"] = true,
	})

	local colorpicker_saturation_dragger = drawing_proxy["new"]("Circle", {
		["Radius"] = identifyexecutor() == "AWP" and 5 or 6,
		["Color"] = color3_fromrgb(255, 255, 255),
		["Position"] = udim2_new(0, 159, 0, 4),
		["Transparency"] = 0,
		["Thickness"] = identifyexecutor() == "AWP" and 2 or 4,
		["Parent"] = colorpicker_saturation,
		["Visible"] = true,
		["ZIndex"] = 1002,
	})

	local colorpicker_transparency = drawing_proxy["new"]("Image", {
		["Parent"] = colorpicker_inside,
		["Position"] = udim2_new(0, 10, 0, 183),
		["Size"] = udim2_new(0, 163, 0, 8),
		["Color"] = color3_fromrgb(255, 255, 255),
		["Transparency"] = 1,
		["Rounding"] = 4,
		["Data"] = base64_decode(
			"iVBORw0KGgoAAAANSUhEUgAAAKAAAAAICAIAAADx4mP5AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAYdEVYdFNvZnR3YXJlAFBhaW50Lk5FVCA1LjEuMvu8A7YAAAC2ZVhJZklJKgAIAAAABQAaAQUAAQAAAEoAAAAbAQUAAQAAAFIAAAAoAQMAAQAAAAIAAAAxAQIAEAAAAFoAAABphwQAAQAAAGoAAAAAAAAAYAAAAAEAAABgAAAAAQAAAFBhaW50Lk5FVCA1LjEuMgADAACQBwAEAAAAMDIzMAGgAwABAAAAAQAAAAWgBAABAAAAlAAAAAAAAAACAAEAAgAEAAAAUjk4AAIABwAEAAAAMDEwMAAAAADp1fY4ytpsegAAAEVJREFUWEftkTEKACAQw6r/f7TgrTf0EJeSTA10yyr2pUarzmekzuefOp8XdT4jdT69CqIhcDgEDofA4RA4HAKHQ+BopAN55gMK+LqL+AAAAABJRU5ErkJggg=="
		),
		["ZIndex"] = 1001,
		["Visible"] = true,
	})

	local colorpicker_transparency_dragger = drawing_proxy["new"]("Circle", {
		["Radius"] = identifyexecutor() == "AWP" and 3 or 5,
		["Color"] = color3_fromrgb(0, 0, 0),
		["Position"] = udim2_new(0, 4, 0, 4),
		["Transparency"] = 0,
		["Thickness"] = identifyexecutor() == "AWP" and 1 or 4,
		["Filled"] = true,
		["Parent"] = colorpicker_transparency,
		["Visible"] = true,
		["ZIndex"] = 1002,
	})

	local colorpicker_transparency_dragger_overlay = drawing_proxy["new"]("Circle", {
		["Radius"] = identifyexecutor() == "AWP" and 2 or 7,
		["Color"] = color3_fromrgb(255, 255, 255),
		["Transparency"] = 0,
		["Radius"] = identifyexecutor() == "AWP" and 2 or 4,
		["Parent"] = colorpicker_transparency_dragger,
		["Position"] = udim2_new(0, 0, 0, 0),
		["Visible"] = true,
		["ZIndex"] = 1003,
	})

	local colorpicker_hue = drawing_proxy["new"]("Image", {
		["Parent"] = colorpicker_inside,
		["Position"] = udim2_new(0, 10, 0, 201),
		["Size"] = udim2_new(0, 163, 0, 8),
		["Color"] = color3_fromrgb(255, 255, 255),
		["Transparency"] = 1,
		["Rounding"] = 4,
		["Data"] = base64_decode(
			"iVBORw0KGgoAAAANSUhEUgAAAKAAAAAICAIAAADx4mP5AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAYdEVYdFNvZnR3YXJlAFBhaW50Lk5FVCA1LjEuMvu8A7YAAAC2ZVhJZklJKgAIAAAABQAaAQUAAQAAAEoAAAAbAQUAAQAAAFIAAAAoAQMAAQAAAAIAAAAxAQIAEAAAAFoAAABphwQAAQAAAGoAAAAAAAAAYAAAAAEAAABgAAAAAQAAAFBhaW50Lk5FVCA1LjEuMgADAACQBwAEAAAAMDIzMAGgAwABAAAAAQAAAAWgBAABAAAAlAAAAAAAAAACAAEAAgAEAAAAUjk4AAIABwAEAAAAMDEwMAAAAADp1fY4ytpsegAAAHJJREFUWEftkW0LgCAMhM9ArP7/b60gSmlGWOILfRz3cIzbhDE54y0wieak5qZ7fjiswIKr5ubHfIOR7U3FI1ra7Wv7Y0q18iTVnenvb6Vt5enTRj/Cy/ZOxVOKGkBUw4CVw4CVw4CVw4CVw4CVw4BVAwRG9lMU6VQQuwAAAABJRU5ErkJggg=="
		),
		["ZIndex"] = 1001,
		["Visible"] = true,
	})

	local colorpicker_hue_dragger = drawing_proxy["new"]("Circle", {
		["Radius"] = identifyexecutor() == "AWP" and 3 or 5,
		["Color"] = color3_fromrgb(255, 255, 255),
		["Position"] = udim2_new(0, 4, 0, 4),
		["Transparency"] = 0,
		["Thickness"] = identifyexecutor() == "AWP" and 2 or 4,
		["Parent"] = colorpicker_hue,
		["Visible"] = true,
		["ZIndex"] = 1002,
	})

	local set_colorpicker_color = function(color, set)
		colorpicker_saturation["Color"] = Color3.fromHSV(actives["colorpicker_hue"], 1, 1)

		tween(
			colorpicker_hue_dragger,
			{ tween_position = udim2_new(0, clamp(actives["colorpicker_hue"] * 163, 6, 157), 0, 4) },
			circular,
			out,
			0.1
		)
		tween(colorpicker_saturation_dragger, {
			tween_position = udim2_new(
				0,
				clamp(actives["colorpicker_saturation"] * 163, 6, 157),
				0,
				clamp((1 - actives["colorpicker_value"]) * 163, 6, 157)
			),
		}, circular, out, 0.1)

		if set then
			actives["colorpicker"]:set_colorpicker(color)
		end
	end

	local set_colorpicker_transparency = function(transparency, set)
		tween(
			colorpicker_transparency_dragger,
			{ tween_position = udim2_new(0, clamp((1 - transparency) * 163, 6, 157), 0, 4) },
			circular,
			out,
			0.1
		)

		if set then
			actives["colorpicker"]:set_colorpicker_transparency(transparency)
		end
	end

	create_click_connection(colorpicker_border, colorpicker_saturation, function(position)
		local frame_position = colorpicker_saturation["real_position"]
		local frame_position_x = frame_position["X"]
		local frame_position_y = frame_position["Y"]

		actives["colorpicker_saturation"] = clamp((position["X"] - frame_position_x) / 163, 0, 1)
		actives["colorpicker_value"] = clamp((163 - (position["Y"] - frame_position_y)) / 163, 0, 1)

		set_colorpicker_color(
			Color3.fromHSV(actives["colorpicker_hue"], actives["colorpicker_saturation"], actives["colorpicker_value"]),
			true
		)

		moving = create_connection(mouse["Move"], function()
			local position = get_mouse_location(user_input_service)

			actives["colorpicker_saturation"] = clamp((position["X"] - frame_position_x) / 163, 0, 1)
			actives["colorpicker_value"] = clamp((163 - (position["Y"] - frame_position_y)) / 163, 0, 1)

			set_colorpicker_color(
				Color3.fromHSV(
					actives["colorpicker_hue"],
					actives["colorpicker_saturation"],
					actives["colorpicker_value"]
				),
				true
			)
		end)
	end)

	create_click_connection(colorpicker_border, colorpicker_hue, function(position)
		local frame_position_x = colorpicker_hue["real_position"]["X"]

		actives["colorpicker_hue"] = clamp((position["X"] - frame_position_x) / 163, 0, 1)

		set_colorpicker_color(
			Color3.fromHSV(actives["colorpicker_hue"], actives["colorpicker_saturation"], actives["colorpicker_value"]),
			true
		)

		moving = create_connection(mouse["Move"], function()
			actives["colorpicker_hue"] =
				clamp((get_mouse_location(user_input_service)["X"] - frame_position_x) / 158, 0, 1)
			set_colorpicker_color(
				Color3.fromHSV(
					actives["colorpicker_hue"],
					actives["colorpicker_saturation"],
					actives["colorpicker_value"]
				),
				true
			)
		end)
	end)

	create_click_connection(colorpicker_border, colorpicker_transparency, function(position)
		local frame_position_x = colorpicker_transparency["real_position"]["X"]

		set_colorpicker_transparency(clamp(1 - (position["X"] - frame_position_x) / 163, 0, 1), true)

		moving = create_connection(mouse["Move"], function()
			set_colorpicker_transparency(
				clamp(1 - (get_mouse_location(user_input_service)["X"] - frame_position_x) / 163, 0, 1),
				true
			)
		end)
	end)

	local open_colorpicker = function(element)
		local position = element["drawings"]["colorpicker_border"]["real_position"]
		local x_position = position["X"] + 30
		local screen_size = camera["ViewportSize"]
		local x_size = screen_size["X"]
		local y_size = screen_size["Y"]

		local x_overlap = (x_position + colorpicker_inside["real_size"]["X"]) - x_size
		local y_overlap = (position["Y"] + colorpicker_inside["real_size"]["Y"]) - y_size

		if x_overlap > 0 then
			x_position -= (x_overlap + 5)
		elseif x_overlap < -x_size then
			x_position += (-x_overlap + 5)
		end

		if y_overlap > 0 then
			position -= vector2_new(0, y_overlap + 5)
		elseif y_overlap < -y_size then
			position += vector2_new(0, y_overlap + 5)
		end

		colorpicker_border["Visible"] = true
		colorpicker_border["Position"] = udim2_new(0, x_position, 0, position["Y"] - 5)

		tween(
			colorpicker_border,
			{ Transparency = 1, tween_position = udim2_new(0, x_position, 0, position["Y"]) },
			circular,
			out,
			0.15
		)
		tween(colorpicker_inside, show_transparency, circular, out, 0.15)
		tween(colorpicker_saturation_background, show_transparency, circular, out, 0.15)
		tween(colorpicker_saturation, show_transparency, circular, out, 0.15)
		tween(colorpicker_transparency, show_transparency, circular, out, 0.15)
		tween(colorpicker_hue, show_transparency, circular, out, 0.15)
		tween(colorpicker_transparency_dragger, show_transparency, circular, out, 0.15)
		tween(colorpicker_transparency_dragger_overlay, show_transparency, circular, out, 0.15)
		tween(colorpicker_hue_dragger, show_transparency, circular, out, 0.15)
		tween(colorpicker_saturation_dragger, show_transparency, circular, out, 0.15)

		local color = flags[element["color_flag"]]

		actives["colorpicker_hue"], actives["colorpicker_saturation"], actives["colorpicker_value"] = color:ToHSV()

		if actives["colorpicker_saturation"] < 0.001 then
			actives["colorpicker_hue"] = 1
		end

		set_colorpicker_color(color)
		set_colorpicker_transparency(flags[element["transparency_flag"]])

		actives["colorpicker"] = element
	end

	local close_colorpicker = function()
		local position = colorpicker_border["real_position"]
		tween(
			colorpicker_border,
			{ Transparency = 0, tween_position = udim2_new(0, position["X"], 0, position["Y"] - 5) },
			circular,
			out,
			0.15
		)
		tween(colorpicker_inside, hide_transparency, circular, out, 0.15)
		tween(colorpicker_saturation_background, hide_transparency, circular, out, 0.15)
		tween(colorpicker_saturation, hide_transparency, circular, out, 0.15)
		tween(colorpicker_transparency, hide_transparency, circular, out, 0.15)
		tween(colorpicker_hue, hide_transparency, circular, out, 0.15)
		tween(colorpicker_transparency_dragger, hide_transparency, circular, out, 0.15)
		tween(colorpicker_transparency_dragger_overlay, hide_transparency, circular, out, 0.15)
		tween(colorpicker_hue_dragger, hide_transparency, circular, out, 0.15)
		tween(colorpicker_saturation_dragger, hide_transparency, circular, out, 0.15)

		actives["colorpicker"] = nil

		delay(0.15, function()
			if actives["colorpicker"] == nil then
				colorpicker_border["Visible"] = false
			end
		end)
	end

	stop_panel_search = function()
		tween(actives["panel"]["search_border"], { Color = menu["colors"]["border"] }, circular, out, 0.15)
		tween(actives["panel"]["search_image"], { Color = menu["colors"]["border"] }, circular, out, 0.15)
		tween(actives["panel"]["search_text"], { Color = menu["colors"]["inactive_text"] }, circular, out, 0.15)

		local panel = actives["panel"]
		actives["panel"] = nil
		panel:update_position()
	end

	local do_panel_search = function(search_text)
		if not actives["panel"] then
			return
		end

		actives["panel"]["scroll_index"] = 1

		local elements = actives["panel"]["elements"]
		local search_text = search_text:lower()
		local search_index = 0

		for i = 1, #elements do
			local element = elements[i]
			local drawings = element["drawings"]
			local frame = drawings["border"]
			local text = drawings["text"]
			local text2 = element["text2"]
			if
				search_index < 13
				and (text["Text"]:lower():find(search_text) or text2 and text2:lower():find(search_text))
			then
				search_index += 1
				frame["Visible"] = true
				frame["Position"] = udim2_new(0, 0, 0, 30 + (search_index - 1) * 30)
			else
				frame["Visible"] = false
			end
		end
	end

	local start_panel_search = function(element)
		actives["panel"] = element

		start_typing(actives["panel"]["search_text"], 150, do_panel_search, false, true, true, false)

		tween(actives["panel"]["search_border"], { Color = menu["colors"]["highlighted"] }, circular, out, 0.15)
		tween(actives["panel"]["search_image"], { Color = menu["colors"]["highlighted"] }, circular, out, 0.15)
		tween(actives["panel"]["search_text"], { Color = menu["colors"]["active_text"] }, circular, out, 0.15)
	end

	local handle_click = LPH_JIT_MAX(function(_, state, input)
		if moving then
			moving:Disconnect()
			moving = nil

			if drag_frame["Visible"] then
				frame["Position"] = menu_position
				frame["Visible"] = true
				tween(drag_frame, hide_transparency, circular, out, 0.12)
				tween(drag_logo, hide_transparency, circular, out, 0.12)
				tween(drag_inside, hide_transparency, circular, out, 0.12)
				delay(0.12, function()
					if not moving then
						drag_frame["Visible"] = false
					end
				end)
			end
		end

		local type = input["UserInputType"]
		if
			(type ~= Enum["UserInputType"]["MouseButton1"] and type ~= Enum["UserInputType"]["Touch"])
			or state ~= Enum["UserInputState"]["Begin"]
		then
			return
		end

		if active_typing then
			delay(0, function()
				stop_typing(active_typing)

				if searching then
					stop_search()
				end

				if actives["panel"] then
					stop_panel_search()
				end
			end)
		end

		local mouse_position = get_mouse_location(user_input_service)
		local mouse_position_x = mouse_position["X"]
		local mouse_position_y = mouse_position["Y"]

		if actives["dropdown"] then
			local border = actives["dropdown"]["drawings"]["dropdown_border"]
			local border_position = border["real_position"] + vector2_new(0, 18)

			if
				not (
					mouse_position_x > border_position["X"]
					and mouse_position_x < border_position["X"] + border["real_size"]["X"]
				)
				or not (
					mouse_position_y > border_position["Y"]
					and mouse_position_y < border_position["Y"] + dropdown_border["real_size"]["Y"]
				)
			then
				close_dropdown(actives["dropdown"])

				return
			end
		elseif actives["colorpicker"] then
			local border_position = colorpicker_border["real_position"]

			if
				not (
					mouse_position_x > border_position["X"]
					and mouse_position_x < border_position["X"] + colorpicker_border["real_size"]["X"]
				)
				or not (
					mouse_position_y > border_position["Y"]
					and mouse_position_y < border_position["Y"] + colorpicker_border["real_size"]["Y"]
				)
			then
				close_colorpicker(actives["colorpicker"])

				return
			end
		elseif actives["keybind"] then
			local border_position = keybind_border["real_position"]

			if
				not (
					mouse_position_x > border_position["X"]
					and mouse_position_x < border_position["X"] + keybind_border["real_size"]["X"]
				)
				or not (
					mouse_position_y > border_position["Y"]
					and mouse_position_y < border_position["Y"] + keybind_border["real_size"]["Y"]
				)
			then
				close_keybind(actives["keybind"])
				close_context(actives["context"])

				return
			end
		elseif actives["context"] then
			local border_position = context_border["real_position"]

			if
				not (
					mouse_position_x > border_position["X"]
					and mouse_position_x < border_position["X"] + context_border["real_size"]["X"]
				)
				or not (
					mouse_position_y > border_position["Y"]
					and mouse_position_y < border_position["Y"] + context_border["real_size"]["Y"]
				)
			then
				close_context(actives["context"])

				return
			end
		elseif actives["settings"] then
			local border = actives["settings"]["border"]
			local border_position = border["real_position"]

			if
				not (
					mouse_position_x > border_position["X"]
					and mouse_position_x < border_position["X"] + border["real_size"]["X"]
				)
				or not (
					mouse_position_y > border_position["Y"]
					and mouse_position_y < border_position["Y"] + border["real_size"]["Y"]
				)
			then
				close_settings(actives["settings"])

				return
			end
		end

		local connections = searching and click_connections[search_out]
			or actives["colorpicker"] and click_connections[colorpicker_border]
			or actives["dropdown"] and click_connections[dropdown_border]
			or actives["keybind"] and click_connections[keybind_inside]
			or actives["context"] and click_connections[context_border]
			or actives["settings"] and click_connections[actives["settings"]["inside"]]
			or nil

		if
			connections
			or (
					mouse_position_x > menu_position["X"]["Offset"]
					and mouse_position_x < menu_position["X"]["Offset"] + frame["Size"]["X"]
				)
				and (mouse_position_y > menu_position["Y"]["Offset"] and mouse_position_y < menu_position["Y"]["Offset"] + frame["Size"]["Y"])
		then
			if not connections then
				for object, connections in click_connections do
					if not object["is_rendering"] then
						continue
					end

					local object_position = object["real_position"]
					local object_size = object["real_size"]

					if
						(
							mouse_position_x > object_position["X"]
							and mouse_position_x < object_position["X"] + object_size["X"]
						)
						and (
							mouse_position_y > object_position["Y"]
							and mouse_position_y < object_position["Y"] + object_size["Y"]
						)
					then
						for object, data in connections do
							if not object["is_rendering"] then
								continue
							end

							local object_position = object["real_position"]
							local object_size = object["real_size"]

							if
								(
									mouse_position_x > object_position["X"]
									and mouse_position_x < object_position["X"] + object_size["X"]
								)
								and (
									mouse_position_y > object_position["Y"]
									and mouse_position_y < object_position["Y"] + object_size["Y"]
								)
							then
								for i = 1, #data do
									data[i](mouse_position)
								end

								return
							end
						end
					end
				end

				local fake_menu_position = frame["real_position"]
				local abs = math["abs"]

				moving = create_connection(mouse["Move"], function()
					if not drag_frame["Visible"] then
						drag_frame["Visible"] = true
						tween(drag_frame, show_transparency, circular, out, 0.05)
						tween(drag_logo, show_transparency, circular, out, 0.05)
						tween(drag_inside, show_transparency, circular, out, 0.05)

						drag_frame["Position"] = menu_position
						delay(0.02, function()
							if moving then
								frame["Visible"] = false
							end
						end)
					end

					local new_mouse_position = get_mouse_location(user_input_service)
					local new_position = udim2_new(
						0,
						fake_menu_position["X"] - (mouse_position_x - new_mouse_position["X"]),
						0,
						fake_menu_position["Y"] - (mouse_position_y - new_mouse_position["Y"])
					)

					if
						abs(menu_position["X"]["Offset"] - new_position["X"]["Offset"]) > 1.1
						or abs(menu_position["Y"]["Offset"] - new_position["Y"]["Offset"]) > 1.1
					then
						drag_frame["Position"] = new_position
						menu_position = new_position
					end
				end)
			else
				for object, data in connections do
					if not object["is_rendering"] then
						continue
					end

					local object_position = object["real_position"]
					local object_size = object["real_size"]

					if
						(
							mouse_position_x > object_position["X"]
							and mouse_position_x < object_position["X"] + object_size["X"]
						)
						and (
							mouse_position_y > object_position["Y"]
							and mouse_position_y < object_position["Y"] + object_size["Y"]
						)
					then
						for i = 1, #data do
							data[i](mouse_position)
						end

						return
					end
				end
			end
		else
			for flag, frame in hud_frames do
				if frame["is_rendering"] then
					local hud_position = frame["real_position"]
					local hud_size = frame["real_size"]

					if
						(mouse_position_x > hud_position["X"] and mouse_position_x < hud_position["X"] + hud_size["X"])
						and (
							mouse_position_y > hud_position["Y"]
							and mouse_position_y < hud_position["Y"] + hud_size["Y"]
						)
					then
						local fake_hud_position = hud_position

						moving = create_connection(mouse["Move"], function()
							local new_mouse_position = get_mouse_location(user_input_service)
							local new_position_x = fake_hud_position["X"] - (mouse_position_x - new_mouse_position["X"])
							local new_position_y = fake_hud_position["Y"] - (mouse_position_y - new_mouse_position["Y"])
							local new_position = udim2_new(0, new_position_x, 0, new_position_y)

							list_frame["Position"] = new_position
							flags[flag] = { new_position_x, new_position_y }
						end)

						break
					end
				end
			end
		end
	end)

	local handle_scroll = LPH_JIT_MAX(function(_, state, input)
		if
			state ~= Enum["UserInputState"]["Change"]
			or input["UserInputType"] ~= Enum["UserInputType"]["MouseWheel"]
		then
			return
		end

		local mouse_position = get_mouse_location(user_input_service)
		local mouse_position_x = mouse_position["X"]
		local mouse_position_y = mouse_position["Y"]

		local is_up = input["Position"]["Z"] > 0

		if
			(
				mouse_position_x > menu_position["X"]["Offset"]
				and mouse_position_x < menu_position["X"]["Offset"] + frame["Size"]["X"]
			)
			and (
				mouse_position_y > menu_position["Y"]["Offset"]
				and mouse_position_y < menu_position["Y"]["Offset"] + frame["Size"]["Y"]
			)
		then
			for object, connections in scroll_connections do
				if not object["is_rendering"] then
					continue
				end

				local object_position = object["real_position"]
				local object_size = object["real_size"]

				if
					(
						mouse_position_x > object_position["X"]
						and mouse_position_x < object_position["X"] + object_size["X"]
					)
					and (
						mouse_position_y > object_position["Y"]
						and mouse_position_y < object_position["Y"] + object_size["Y"]
					)
				then
					for object, data in connections do
						if not object["is_rendering"] then
							continue
						end

						local object_position = object["real_position"]
						local object_size = object["real_size"]

						if
							(
								mouse_position_x > object_position["X"]
								and mouse_position_x < object_position["X"] + object_size["X"]
							)
							and (
								mouse_position_y > object_position["Y"]
								and mouse_position_y < object_position["Y"] + object_size["Y"]
							)
						then
							for i = 1, #data do
								data[i](is_up)
							end

							return
						end
					end
				end
			end
		end
	end)

	local handle_hover = LPH_JIT_MAX(function()
		local mouse_position = get_mouse_location(user_input_service)
		local mouse_position_x = mouse_position["X"]
		local mouse_position_y = mouse_position["Y"]

		cursor["Position"] = udim2_new(0, mouse_position["X"], 0, mouse_position["Y"])
		user_input_service["MouseIconEnabled"] = false

		local connections = searching and hover_connections[search_out]
			or actives["colorpicker"] and hover_connections[colorpicker_border]
			or actives["dropdown"] and hover_connections[dropdown_border]
			or actives["keybind"] and hover_connections[keybind_inside]
			or actives["context"] and hover_connections[context_border]
			or actives["settings"] and hover_connections[actives["settings"]["inside"]]
			or nil

		if
			connections
			or (
					mouse_position_x > menu_position["X"]["Offset"]
					and mouse_position_x < menu_position["X"]["Offset"] + frame["Size"]["X"]
				)
				and (mouse_position_y > menu_position["Y"]["Offset"] and mouse_position_y < menu_position["Y"]["Offset"] + frame["Size"]["Y"])
		then
			if not connections then
				for object, connections in hover_connections do
					if not object["is_rendering"] then
						continue
					end

					local object_position = object["real_position"]
					local object_size = object["real_size"]

					if
						(
							mouse_position_x > object_position["X"]
							and mouse_position_x < object_position["X"] + object_size["X"]
						)
						and (
							mouse_position_y > object_position["Y"]
							and mouse_position_y < object_position["Y"] + object_size["Y"]
						)
					then
						for object, data in connections do
							if not object["is_rendering"] then
								continue
							end

							local object_position = object["real_position"]
							local object_size = object["real_size"]

							if
								(
									mouse_position_x > object_position["X"]
									and mouse_position_x < object_position["X"] + object_size["X"]
								)
								and (
									mouse_position_y > object_position["Y"]
									and mouse_position_y < object_position["Y"] + object_size["Y"]
								)
							then
								if hovering_objects[object] then
									return
								end

								for object, data in hovering_objects do
									for _, data in data do
										data[2]()
									end
									hovering_objects[object] = nil
								end

								hovering_objects[object] = data

								for _, data in data do
									data[1](mouse_position)
								end

								return
							end
						end
					end
				end
			else
				for object, data in connections do
					if not object["is_rendering"] then
						continue
					end

					local object_position = object["real_position"]
					local object_size = object["real_size"]

					if
						(
							mouse_position_x > object_position["X"]
							and mouse_position_x < object_position["X"] + object_size["X"]
						)
						and (
							mouse_position_y > object_position["Y"]
							and mouse_position_y < object_position["Y"] + object_size["Y"]
						)
					then
						if hovering_objects[object] then
							return
						end

						for object, data in hovering_objects do
							for _, data in data do
								data[2]()
							end
							hovering_objects[object] = nil
						end

						hovering_objects[object] = data

						for _, data in data do
							data[1](mouse_position)
						end

						return
					end
				end
			end

			for object, data in hovering_objects do
				for _, data in data do
					data[2]()
				end
				hovering_objects[object] = nil
			end
		else
			for flag, frame in hud_frames do
				if frame["is_rendering"] then
					local hud_position = frame["real_position"]
					local hud_size = frame["real_size"]

					if
						(mouse_position_x > hud_position["X"] and mouse_position_x < hud_position["X"] + hud_size["X"])
						and (
							mouse_position_y > hud_position["Y"]
							and mouse_position_y < hud_position["Y"] + hud_size["Y"]
						)
					then
						if hovering_objects[frame] then
							return
						end

						local data = hover_connections[frame][frame]

						if data then
							for object, data in hovering_objects do
								for _, data in data do
									data[2]()
								end
								hovering_objects[frame] = nil
							end

							hovering_objects[frame] = data

							for _, data in data do
								data[1](mouse_position)
							end

							return
						end
					end

					for object, data in hovering_objects do
						for _, data in data do
							data[2]()
						end
						hovering_objects[object] = nil
					end
				end
			end
		end
	end)

	local handle_right_click = LPH_JIT_MAX(function(_, input)
		if actives["dropdown"] then
			return
		end

		local mouse_position = get_mouse_location(user_input_service)
		local mouse_position_x = mouse_position["X"]
		local mouse_position_y = mouse_position["Y"]

		if
			(
				mouse_position_x > menu_position["X"]["Offset"]
				and mouse_position_x < menu_position["X"]["Offset"] + frame["Size"]["X"] * 1.5
			)
			and (
				mouse_position_y > menu_position["Y"]["Offset"]
				and mouse_position_y < menu_position["Y"]["Offset"] + frame["Size"]["Y"] * 1.5
			)
		then
			for object, connections in right_click_connections do
				if not object["is_rendering"] then
					continue
				end

				local object_position = object["real_position"]
				local object_size = object["real_size"]

				if
					(
						mouse_position_x > object_position["X"]
						and mouse_position_x < object_position["X"] + object_size["X"]
					)
					and (
						mouse_position_y > object_position["Y"]
						and mouse_position_y < object_position["Y"] + object_size["Y"]
					)
				then
					for object, data in connections do
						if not object["is_rendering"] then
							continue
						end

						local object_position = object["real_position"]
						local object_size = object["real_size"]

						if
							(
								mouse_position_x > object_position["X"]
								and mouse_position_x < object_position["X"] + object_size["X"]
							)
							and (
								mouse_position_y > object_position["Y"]
								and mouse_position_y < object_position["Y"] + object_size["Y"]
							)
						then
							for i = 1, #data do
								data[i](mouse_position)
							end

							return
						end
					end
				end
			end
		end
	end)

	local hovering = nil

	pop_menu = LPH_JIT_MAX(function(a)
		if moving then
			moving:Disconnect()
			moving = nil
		end

		if drag_frame["Visible"] then
			drag_frame["Visible"] = false
			frame["Visible"] = true
			frame["Position"] = menu_position
		end

		if hovering then
			hovering:Disconnect()
			hovering = nil
		end

		if actives["settings"] then
			close_settings(actives["settings"])
		end

		if searching then
			stop_search()
		end

		if actives["binding"] then
			stop_binding(actives["binding"])
		end

		if actives["dropdown"] then
			close_dropdown(actives["dropdown"])
		end

		if actives["context"] then
			close_context(actives["context"])
		end

		if actives["keybind"] then
			close_keybind(actives["keybind"])
		end

		if actives["panel"] then
			stop_panel_search(actives["panel"])
		end

		if actives["colorpicker"] then
			close_colorpicker(actives["colorpicker"])
		end

		if active_typing then
			stop_typing()
		end

		for object, data in hovering_objects do
			for _, data in data do
				data[2]()
			end
			hovering_objects[object] = nil
		end

		menu_open = not menu_open

		local half_transparency = menu_open and half_transparency or hide_transparency
		local transparency = menu_open and show_transparency or hide_transparency

		tween(cursor, transparency, exponential, out, 0.18)

		local mouse_position = get_mouse_location(user_input_service)
		user_input_service["MouseIconEnabled"] = not menu_open
		cursor["Position"] = udim2_new(0, mouse_position["X"], 0, mouse_position["Y"])

		frame["Visible"] = not a
		inside["Visible"] = not a

		tween(frame, transparency, exponential, out, 0.18)
		tween(inside, transparency, exponential, out, 0.18)
		tween(logo, transparency, exponential, out, 0.18)
		tween(juju_text, transparency, exponential, out, 0.18)
		tween(build_text, transparency, exponential, out, 0.18)
		tween(right_side, transparency, exponential, out, 0.18)
		tween(right_side_divider, transparency, exponential, out, 0.18)
		tween(search_image, transparency, exponential, out, 0.18)
		tween(themes_image, transparency, exponential, out, 0.18)

		tween(settings_image, transparency, exponential, out, 0.18)
		tween(tab_line, half_transparency, exponential, out, 0.18)
		tween(search_border, transparency, exponential, out, 0.18)
		tween(search_inside, transparency, exponential, out, 0.18)
		tween(search_text, transparency, exponential, out, 0.18)

		for name, group in menu["groups"] do
			tween(group["text"], half_transparency, exponential, out, 0.18)
			tween(group["line"], half_transparency, exponential, out, 0.18)

			for name, tab in group["tabs"] do
				tween(tab["text"], transparency, exponential, out, 0.18)

				if actives["tab"] == tab then
					for _, section in tab["sections"] do
						tween(section["border"], transparency, exponential, out, 0.18)
						tween(section["line_two"], half_transparency, exponential, out, 0.18)
						tween(section["inside"], transparency, exponential, out, 0.18)
						tween(section["label"], half_transparency, exponential, out, 0.18)
						tween(section["line"], half_transparency, exponential, out, 0.18)

						local search_border = section["search_border"]

						if search_border then
							tween(search_border, transparency, exponential, out, 0.18)
							tween(section["search_inside"], transparency, exponential, out, 0.18)
							tween(section["search_text"], transparency, exponential, out, 0.18)
							tween(section["search_image"], transparency, exponential, out, 0.18)
						end

						for _, element in section["elements"] do
							for _, drawing in element["drawings"] do
								tween(
									drawing,
									_ == "slider_fill" and half_transparency
										or _ == "slider_line" and half_transparency
										or _ == "checkmark" and (flags[element["toggle_flag"]] and half_transparency or hide_transparency)
										or _ == "colorpicker_transparency" and (menu_open and {
											Transparency = -flags[element["transparency_flag"]] + 1,
										} or transparency)
										or transparency,
									exponential,
									out,
									0.18
								)
							end
						end
					end
				end
			end
		end

		context_action_service:BindAction(
			context_action_click,
			handle_click,
			false,
			Enum["UserInputType"]["MouseButton1"],
			Enum["UserInputType"]["Touch"]
		)
		context_action_service:BindAction(
			context_action_scroll,
			handle_scroll,
			false,
			Enum["UserInputType"]["MouseWheel"]
		)

		local old_tick = clock()
		menu_tick = old_tick

		if not menu_open then
			context_action_service:UnbindAction(context_action_click)
			context_action_service:UnbindAction(context_action_scroll)

			delay(0.17, function()
				if old_tick == menu_tick then
					frame["Visible"] = false
					inside["Visible"] = false
				end
			end)
		else
			hovering = create_connection(mouse["Move"], handle_hover)
		end
	end)

	create_connection(
		user_input_service["InputBegan"],
		LPH_NO_VIRTUALIZE(function(input, gpe)
			local user_input_type = input["UserInputType"]

			if not gpe then
				for element, keybind in keybind_data do
					local key = keybind["key"]
					local is_key = user_input_type == key or input["KeyCode"] == key

					if is_key then
						local method = keybind["method"]

						if method == 1 then
							keybind:set_activated(not keybind["activated"])
						else
							keybind:set_activated(method == 3 and true or false)
						end
					end
				end

				if menu_open and user_input_type == Enum["UserInputType"]["MouseButton2"] then
					handle_right_click(nil, input)
				end
			end
		end)
	)

	create_connection(
		user_input_service["InputEnded"],
		LPH_NO_VIRTUALIZE(function(input, gpe)
			if not gpe then
				for _, keybind in keybind_data do
					local key = keybind["key"]
					local is_key = input["UserInputType"] == key or input["KeyCode"] == key

					if is_key then
						local method = keybind["method"]
						if method == 2 then
							keybind:set_activated(true)
						elseif method == 3 then
							keybind:set_activated(false)
						end
					end
				end
			end
		end)
	)

	-- > ( other )

	menu.is_menu_open = LPH_NO_VIRTUALIZE(function()
		return menu_open
	end)

	-- > ( groups )

	set_active_tab = function(tab)
		actives["old_tab"] = actives["tab"]
		local last_group = actives["old_tab"] and actives["old_tab"]["group"]

		tween(right_side_cover, show_transparency, circular, out, 0.15)

		if actives["old_tab"] then
			tween(actives["old_tab"]["frame"], { ["tween_position"] = udim2_new(0, 10, 0, 20) }, circular, out, 0.15)
			tween(
				actives["old_tab"]["text"],
				{ ["Color"] = menu["colors"]["inactive_text"], ["tween_position"] = actives["old_tab"]["position"] },
				circular,
				out,
				0.15
			)
		end

		local tab_position = tab["position"]

		if last_group == tab["group"] then
			tween(
				tab_line,
				{ ["tween_position"] = udim2_new(0, tab_position["X"]["Offset"], 0, tab_position["Y"]["Offset"] + 1) },
				circular,
				out,
				0.15
			)
		else
			tab_line["Transparency"] = 0
			tab_line["Position"] = udim2_new(0, tab_position["X"]["Offset"], 0, tab_position["Y"]["Offset"] + 1)
			tween(tab_line, half_transparency, circular, out, 0.2)
		end

		tween(tab["text"], {
			["Color"] = menu["colors"]["active_text"],
			["tween_position"] = udim2_new(0, tab_position["X"]["Offset"] + 5, 0, tab_position["Y"]["Offset"]),
		}, circular, out, 0.15)

		delay(0.14, function()
			if actives["tab"] == tab then
				if actives["old_tab"] then
					actives["old_tab"]["frame"]["Visible"] = false
				end

				tween(right_side_cover, hide_transparency, circular, out, 0.15)

				local new_frame = tab["frame"]
				new_frame["Visible"] = true
				new_frame["Position"] = udim2_new(0, 10, 0, 20)
				tween(new_frame, { ["tween_position"] = udim2_new(0, 10, 0, 10) }, circular, out, 0.15)
			elseif actives["old_tab"] and actives["tab"] ~= actives["old_tab"] then
				actives["old_tab"]["frame"]["Visible"] = false
			end
		end)
		actives["tab"] = tab
	end

	local group_header_height = 30
	local tab_vertical_step = 15

	function menu.update_layout()
		local current_y_offset = menu["initial_base_offset"]
		local ordered_groups = menu["ordered_groups"]
		local num_groups = #ordered_groups

		for i = 1, num_groups do
			local group = ordered_groups[i]
			local should_be_visible = group["is_visible"]
			local group_text = group["text"]
			local group_line = group["line"]
			local ordered_tabs = group["ordered_tabs"]
			local num_tabs = #ordered_tabs

			group["initial_offset"] = current_y_offset

			if group_text then
				group_text["Visible"] = should_be_visible
			end
			if group_line then
				group_line["Visible"] = should_be_visible
			end

			for tab_index = 1, num_tabs do
				local tab = ordered_tabs[tab_index]
				local tab_text = tab["text"]
				local tab_text_frame = tab["text_frame"]
				if tab_text then
					tab_text["Visible"] = should_be_visible
				end
				if tab_text_frame then
					tab_text_frame["Visible"] = should_be_visible
				end
			end

			if should_be_visible then
				if group_text then
					group_text["Position"] = udim2_new(0, 15, 0, current_y_offset)
				end
				if group_line then
					group_line["Position"] = udim2_new(0, 15, 0, current_y_offset + 15)
				end

				local base_tab_y = current_y_offset + 20
				for tab_index = 1, num_tabs do
					local tab = ordered_tabs[tab_index]
					local tab_text = tab["text"]
					local tab_text_frame = tab["text_frame"]
					local new_tab_y = base_tab_y + (tab_index - 1) * tab_vertical_step
					local new_tab_position = udim2_new(0, 15, 0, new_tab_y)

					tab["position"] = new_tab_position
					if tab_text then
						tab_text["Position"] = actives["tab"] == tab and udim2_new(0, 20, 0, new_tab_y)
							or new_tab_position
					end
					if tab_text_frame then
						tab_text_frame["Position"] = new_tab_position
						if tab_text then
							tab_text_frame["Size"] = udim2_new(0, 70, 0, tab_text["TextBounds"]["Y"])
						end
					end
				end
				current_y_offset = current_y_offset + group["current_height"]
			end
		end

		local size = current_y_offset > 405 and udim2_new(0, 575, 0, 450 + (current_y_offset - 405))
			or udim2_new(0, 575, 0, 450)
		drag_frame["Size"] = size
		frame["Size"] = size
	end

	local group = {}
	group["__index"] = group

	function menu.create_group(name)
		local new_tabs = {}
		local ordered_tabs = {}
		local initial_offset
		local ordered_groups = menu["ordered_groups"]
		local num_groups = #ordered_groups

		if num_groups > 0 then
			local previous_group = nil
			for i = num_groups, 1, -1 do
				local g = ordered_groups[i]
				if g["is_visible"] then
					previous_group = g
					break
				end
			end

			if previous_group then
				initial_offset = previous_group["initial_offset"] + previous_group["current_height"]
			else
				initial_offset = menu["initial_base_offset"]
			end
		else
			initial_offset = menu["initial_base_offset"]
		end

		local new_group = setmetatable({
			["tabs"] = new_tabs,
			["ordered_tabs"] = ordered_tabs,
			["initial_offset"] = initial_offset,
			["current_height"] = group_header_height,
			["is_visible"] = true,
			["name"] = name,
			["text"] = drawing_proxy["new"]("Text", {
				["Color"] = menu["colors"]["accent"],
				["Transparency"] = 0.5,
				["Text"] = name,
				["Parent"] = inside,
				["Size"] = 14,
				["Font"] = 1,
				["Position"] = udim2_new(0, 15, 0, initial_offset),
				["Visible"] = true,
			}),
			["line"] = drawing_proxy["new"]("Square", {
				["Parent"] = inside,
				["Transparency"] = 0.5,
				["Position"] = udim2_new(0, 15, 0, initial_offset + 15),
				["Size"] = udim2_new(0, 70, 0, 1),
				["Color"] = menu["colors"]["accent"],
				["Filled"] = true,
				["Visible"] = true,
			}),
		}, group)

		menu["groups"][name] = new_group
		ordered_groups[#ordered_groups + 1] = new_group

		return new_group
	end

	function group:create_tab(name)
		local group_initial_offset = self["initial_offset"]
		local ordered_tabs = self["ordered_tabs"]
		local index = #ordered_tabs + 1
		local position = udim2_new(0, 15, 0, group_initial_offset + 20 + (index - 1) * tab_vertical_step)
		local is_group_visible = self["is_visible"]

		local new_tab = {
			["text"] = drawing_proxy["new"]("Text", {
				["Color"] = menu["colors"]["inactive_text"],
				["Text"] = name:sub(1, 12),
				["Size"] = 12,
				["Font"] = 1,
				["Visible"] = is_group_visible,
				["Parent"] = inside,
				["Position"] = position,
			}),
			["frame"] = drawing_proxy["new"]("Square", {
				["Parent"] = right_side,
				["Position"] = udim2_new(0, 10, 0, 10),
				["Size"] = udim2_new(1, -20, 1, -20),
				["Filled"] = true,
				["Transparency"] = 0,
				["Visible"] = false,
			}),
			["sections"] = {},
			["position"] = position,
			["group"] = self,
			["name"] = name,
		}

		new_tab["destroy"] = function(self)
			if not self or not self["text"] then
				error("attempt to destroy nil tab")
				return
			end
			self["text"]:Destroy()
			self["frame"]:Destroy()
			for _, section in self["sections"] do
				section:destroy()
			end

			self["group"]:remove_tab(name)
		end

		local text = new_tab["text"]

		local text_frame = drawing_proxy["new"]("Square", {
			["Parent"] = inside,
			["Position"] = position,
			["Size"] = udim2_new(0, 70, 0, text["TextBounds"]["Y"]),
			["Filled"] = true,
			["Transparency"] = 0,
			["Visible"] = is_group_visible,
		})
		new_tab["text_frame"] = text_frame

		self["tabs"][name] = new_tab
		ordered_tabs[#ordered_tabs + 1] = new_tab

		self["current_height"] = group_header_height + #ordered_tabs * tab_vertical_step

		create_click_connection(text_frame, text_frame, function()
			if actives["tab"] ~= new_tab then
				set_active_tab(new_tab)
			end
		end)
		create_hover_connection(text_frame, text_frame, function()
			if actives["tab"] ~= new_tab then
				tween(text, { ["Color"] = menu["colors"]["highlighted"] }, circular, out, 0.17)
			end
		end, function()
			if actives["tab"] ~= new_tab then
				tween(text, { ["Color"] = menu["colors"]["inactive_text"] }, circular, out, 0.17)
			end
		end)

		if actives["tab"] == nil then
			set_active_tab(new_tab)
		end

		if is_group_visible then
			menu.update_layout()
		end

		return new_tab
	end

	function group:remove_tab(name)
		local tab_to_remove = self["tabs"][name]
		if not tab_to_remove then
			return
		end

		local remove_index = nil
		local ordered_tabs = self["ordered_tabs"]
		local num_tabs = #ordered_tabs
		for i = 1, num_tabs do
			local tab = ordered_tabs[i]
			if tab == tab_to_remove then
				remove_index = i
				break
			end
		end

		if not remove_index then
			return
		end

		local text_obj = tab_to_remove["text"]
		local text_frame_obj = tab_to_remove["text_frame"]
		local frame_obj = tab_to_remove["frame"]

		if text_obj then
			text_obj["Visible"] = false
			text_obj["Parent"] = nil
		end
		if text_frame_obj then
			text_frame_obj["Visible"] = false
			text_frame_obj["Parent"] = nil
		end
		if frame_obj then
			frame_obj["Visible"] = false
			frame_obj["Parent"] = nil
		end

		if actives["tab"] == tab_to_remove then
			actives["tab"] = nil
		end

		self["tabs"][name] = nil
		remove(ordered_tabs, remove_index)

		self["current_height"] = group_header_height + #ordered_tabs * tab_vertical_step

		if self["is_visible"] then
			menu.update_layout()
		end
	end

	function group:hide()
		if not self["is_visible"] then
			return
		end
		self["is_visible"] = false
		menu.update_layout()
	end

	function group:show()
		if self["is_visible"] then
			return
		end
		self["is_visible"] = true
		menu.update_layout()
	end

	local section = {}
	section["__index"] = section

	function group:create_section(tab_name, name, side, size, y_position)
		local tab = self["tabs"][tab_name]
		if not tab then
			return nil
		end

		local new_section = setmetatable({
			["tab"] = tab,
			["name"] = name,
			["side"] = side,
			["size"] = size,
			["total_y_size"] = 10,
			["elements"] = {},
		}, section)

		local tab_frame = tab["frame"]
		local y_position = y_position or 0

		local section_border = drawing_proxy["new"]("Image", {
			["Parent"] = tab_frame,
			["Position"] = udim2_new(
				side == 1 and 0 or 0.5,
				side == 1 and 0 or 5,
				y_position,
				y_position ~= 0 and 10 or 0
			),
			["Size"] = udim2_new(0.5, -5, size, y_position ~= 0 and -10 or 0),
			["Color"] = menu["colors"]["border"],
			["Transparency"] = 1,
			["Rounding"] = 4,
			["Data"] = pixel_image_data,
			["ZIndex"] = 2,
			["Visible"] = true,
		})
		local section_inside = drawing_proxy["new"]("Image", {
			["Parent"] = section_border,
			["Position"] = udim2_new(0, 1, 0, 0),
			["Size"] = udim2_new(1, -2, 1, -1),
			["Color"] = menu["colors"]["section"],
			["Transparency"] = 1,
			["Rounding"] = 4,
			["Data"] = pixel_image_data,
			["ZIndex"] = 3,
			["Visible"] = true,
		})
		local section_line = drawing_proxy["new"]("Square", {
			["Parent"] = section_inside,
			["Size"] = udim2_new(0, 9, 0, 1),
			["Position"] = udim2_new(0, 1, 0, 0),
			["Color"] = menu["colors"]["accent"],
			["Transparency"] = 0.5,
			["Filled"] = true,
			["ZIndex"] = 4,
			["Visible"] = true,
		})
		local section_label = drawing_proxy["new"]("Text", {
			["Color"] = menu["colors"]["accent"],
			["Transparency"] = 0.5,
			["Text"] = name,
			["Parent"] = section_inside,
			["Position"] = udim2_new(0, 15, 0, -8),
			["Size"] = 12,
			["Font"] = 1,
			["ZIndex"] = 4,
			["Visible"] = true,
		})
		local text_bounds = section_label["TextBounds"]["X"] + 20
		local section_line_two = drawing_proxy["new"]("Square", {
			["Parent"] = section_inside,
			["Position"] = udim2_new(0, text_bounds, 0, 0),
			["Size"] = udim2_new(1, -(text_bounds + 1), 0, 1),
			["Color"] = menu["colors"]["accent"],
			["Filled"] = true,
			["Transparency"] = 0.5,
			["ZIndex"] = 4,
			["Visible"] = true,
		})
		local element_holder = drawing_proxy["new"]("Square", {
			["Parent"] = section_inside,
			["Position"] = udim2_new(0, 10, 0, 10),
			["Size"] = udim2_new(1, -20, 1, -20),
			["Transparency"] = 0,
			["Filled"] = true,
			["Visible"] = true,
		})

		new_section["border"] = section_border
		new_section["line_two"] = section_line_two
		new_section["inside"] = section_inside
		new_section["label"] = section_label
		new_section["line"] = section_line
		new_section["holder"] = element_holder

		tab["sections"][name] = new_section

		return new_section
	end

	local panel_section = {}
	panel_section["__index"] = panel_section

	function group:create_panel_section(tab_name, name, side, favorites, configs)
		local tab = self["tabs"][tab_name]
		if not tab then
			return nil
		end

		local new_section = setmetatable({
			["tab"] = tab,
			["name"] = name,
			["total_y_size"] = 30,
			["scroll_index"] = 1,
			["elements"] = {},
			["selected"] = nil,
			["on_selection_change"] = signal["new"](),
			["favorites"] = favorites,
			["configs"] = configs,
		}, panel_section)

		local tab_frame = tab["frame"]

		local section_border = drawing_proxy["new"]("Image", {
			["Parent"] = tab_frame,
			["Position"] = udim2_new(side == 1 and 0 or 0.5, side == 1 and 0 or 5, 0, 0),
			["Size"] = udim2_new(0.5, -5, 1, 0),
			["Color"] = menu["colors"]["border"],
			["Transparency"] = 1,
			["Rounding"] = 4,
			["Data"] = pixel_image_data,
			["Visible"] = true,
		})
		local section_inside = drawing_proxy["new"]("Image", {
			["Parent"] = section_border,
			["Position"] = udim2_new(0, 1, 0, 0),
			["Size"] = udim2_new(1, -2, 1, -1),
			["Color"] = menu["colors"]["section"],
			["Transparency"] = 1,
			["Rounding"] = 4,
			["Data"] = pixel_image_data,
			["Visible"] = true,
		})
		local section_line = drawing_proxy["new"]("Square", {
			["Parent"] = section_inside,
			["Size"] = udim2_new(0, 9, 0, 1),
			["Position"] = udim2_new(0, 1, 0, 0),
			["Color"] = menu["colors"]["accent"],
			["Transparency"] = 0.5,
			["Filled"] = true,
			["Visible"] = true,
		})
		local section_label = drawing_proxy["new"]("Text", {
			["Color"] = menu["colors"]["accent"],
			["Transparency"] = 0.5,
			["Text"] = name,
			["Parent"] = section_inside,
			["Position"] = udim2_new(0, 15, 0, -8),
			["Size"] = 12,
			["Font"] = 1,
			["Visible"] = true,
		})
		local text_bounds = section_label["TextBounds"]["X"] + 20
		local section_line_two = drawing_proxy["new"]("Square", {
			["Parent"] = section_inside,
			["Position"] = udim2_new(0, text_bounds, 0, 0),
			["Size"] = udim2_new(1, -(text_bounds + 1), 0, 1),
			["Color"] = menu["colors"]["accent"],
			["Filled"] = true,
			["Transparency"] = 0.5,
			["Visible"] = true,
		})
		local element_holder = drawing_proxy["new"]("Square", {
			["Parent"] = section_inside,
			["Position"] = udim2_new(0, 10, 0, 10),
			["Size"] = udim2_new(1, -20, 1, -20),
			["Transparency"] = 0,
			["Filled"] = true,
			["Visible"] = true,
		})
		local search_border = drawing_proxy["new"]("Image", {
			["Parent"] = element_holder,
			["Position"] = udim2_new(0, 0, 0, 0),
			["Size"] = udim2_new(1, 0, 0, 20),
			["Color"] = menu["colors"]["border"],
			["Transparency"] = 1,
			["Rounding"] = 4,
			["Data"] = pixel_image_data,
			["ZIndex"] = zindex,
			["Visible"] = true,
		})
		local search_inside = drawing_proxy["new"]("Image", {
			["Parent"] = search_border,
			["Position"] = udim2_new(0, 1, 0, 1),
			["Size"] = udim2_new(1, -2, 1, -2),
			["Color"] = menu["colors"]["background"],
			["Transparency"] = 1,
			["Rounding"] = 4,
			["Data"] = pixel_image_data,
			["ZIndex"] = zindex,
			["Visible"] = true,
		})
		local search_text = drawing_proxy["new"]("Text", {
			["Color"] = menu["colors"]["inactive_text"],
			["Text"] = "search",
			["Size"] = 12,
			["Font"] = 1,
			["Transparency"] = 1,
			["Visible"] = true,
			["Parent"] = search_inside,
			["Position"] = udim2_new(0, 22, 0, 3),
		})
		local search_image = drawing_proxy["new"]("Image", {
			["Color"] = menu["colors"]["inactive_text"],
			["Data"] = base64_decode(
				"iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAYdEVYdFNvZnR3YXJlAFBhaW50Lk5FVCA1LjEuMvu8A7YAAAC2ZVhJZklJKgAIAAAABQAaAQUAAQAAAEoAAAAbAQUAAQAAAFIAAAAoAQMAAQAAAAIAAAAxAQIAEAAAAFoAAABphwQAAQAAAGoAAAAAAAAAYAAAAAEAAABgAAAAAQAAAFBhaW50Lk5FVCA1LjEuMgADAACQBwAEAAAAMDIzMAGgAwABAAAAAQAAAAWgBAABAAAAlAAAAAAAAAACAAEAAgAEAAAAUjk4AAIABwAEAAAAMDEwMAAAAADp1fY4ytpsegAAAGdJREFUKFONkGEWgCAIg5GTdP9LlqPBA8Pq+yFuOvA5JHFOuDXGhNvAjPVipgtZAFAGtIuvbrSdRA4sJQQBKB/wOM6V9TevAe+cn6su8liwaieSuwuONy4/k0PdZHglsKOEWD+5QyIX+wJP/y1yP3IAAAAASUVORK5CYII="
			),
			["Position"] = udim2_new(0, 4, 0, 4),
			["Parent"] = search_inside,
			["Size"] = udim2_new(0, 12, 0, 12),
			["Transparency"] = 1,
			["Visible"] = true,
		})

		new_section["border"] = section_border
		new_section["line_two"] = section_line_two
		new_section["inside"] = section_inside
		new_section["label"] = section_label
		new_section["line"] = section_line
		new_section["holder"] = element_holder
		new_section["search_image"] = search_image
		new_section["search_border"] = search_border
		new_section["search_inside"] = search_inside
		new_section["search_text"] = search_text
		new_section["search_image"] = search_image

		tab["sections"][name] = new_section

		create_hover_connection(element_holder, search_border, function()
			if not actives["panel"] then
				tween(search_border, { Color = menu["colors"]["highlighted"] }, circular, out, 0.15)
			end
		end, function()
			if not actives["panel"] then
				tween(search_border, { Color = menu["colors"]["border"] }, circular, out, 0.15)
			end
		end)

		create_click_connection(element_holder, search_border, function()
			start_panel_search(new_section)
		end)

		create_scroll_connection(section_border, section_border, function(is_up)
			local old_scroll_index = new_section["scroll_index"]
			new_section["scroll_index"] =
				clamp(old_scroll_index + (is_up and -1 or 1), 1, 1 + clamp(#new_section["elements"] - 13, 0, 1000))
			new_section:update_position()
		end)

		return new_section
	end

	-- > ( panel sections )

	function panel_section:add_item(info)
		local new_item = setmetatable({
			["drawings"] = {},
			["color"] = color,
			["name"] = info["text"],
			["parent"] = self["name"],
			["icons"] = {},
		}, item)

		local border = drawing_proxy["new"]("Image", {
			["Parent"] = self["holder"],
			["Position"] = udim2_new(0, 0, 0, self["total_y_size"]),
			["Size"] = udim2_new(1, 0, 0, 20),
			["Color"] = menu["colors"]["border"],
			["Transparency"] = 1,
			["Rounding"] = 4,
			["Data"] = pixel_image_data,
			["Visible"] = false,
		})
		local inside = drawing_proxy["new"]("Image", {
			["Parent"] = border,
			["Position"] = udim2_new(0, 1, 0, 1),
			["Size"] = udim2_new(1, -2, 1, -2),
			["Color"] = menu["colors"]["background"],
			["Transparency"] = 1,
			["Rounding"] = 4,
			["Data"] = pixel_image_data,
			["ZIndex"] = 2,
			["Visible"] = true,
		})
		local text = drawing_proxy["new"]("Text", {
			["Color"] = menu["colors"]["inactive_text"],
			["Text"] = info["text"],
			["Size"] = 12,
			["Font"] = 1,
			["Transparency"] = 1,
			["Visible"] = true,
			["Parent"] = inside,
			["ZIndex"] = 3,
			["Position"] = udim2_new(0, 5, 0, 3),
		})

		new_item["drawings"]["border"] = border
		new_item["drawings"]["inside"] = inside
		new_item["drawings"]["text"] = text

		self["total_y_size"] += 30
		self["elements"][#self["elements"] + 1] = new_item

		local icons = info["icons"] or {}
		for i = 1, #icons do
			local icon = icons[i]
			local name = "icon_" .. tostring(clock())

			new_item["drawings"][name] = drawing_proxy["new"]("Image", {
				["Parent"] = inside,
				["Position"] = udim2_new(0, 4 + (#icons - i) * 15, 0, 4),
				["Size"] = udim2_new(0, 10, 0, 10),
				["Color"] = menu["colors"]["accent"],
				["Visible"] = true,
				["Transparency"] = 1,
				["ZIndex"] = 4,
				["Data"] = icon,
			})

			new_item["icons"][i] = { icon, name }
		end

		self["scroll_index"] = clamp(self["scroll_index"], 1, 1 + clamp(#self["elements"] - 13, 0, 1000))

		local x = 4 + #icons * 15
		text["Position"] = udim2_new(0, x, 0, 3)
		local text2_text = info["text2"]
		if text2_text then
			local text2 = drawing_proxy["new"]("Text", {
				["Color"] = menu["colors"]["dark_text"],
				["Text"] = text2_text,
				["Size"] = 12,
				["Font"] = 1,
				["Transparency"] = 1,
				["Visible"] = true,
				["Parent"] = inside,
				["ZIndex"] = 4,
				["Position"] = udim2_new(0, x + text["TextBounds"]["X"] + 3, 0, 3),
			})

			local size = text2["Position"]["X"] + text2["TextBounds"]["X"] + 9
			local border_size = border["Position"]["X"] + border["Size"]["X"]
			if size > border_size then
				local overlap = 2 + math["ceil"]((size - border_size) / 6)
				text2["Text"] = text2["Text"]:sub(1, -overlap) .. ".."
			end
			new_item["drawings"]["text2"] = text2
			new_item["text2"] = text2_text
		end

		self:update_position()

		create_hover_connection(self["holder"], border, function()
			if self["selected"] ~= new_item then
				tween(border, { Color = menu["colors"]["highlighted"] }, circular, out, 0.17)
			end
		end, function()
			if self["selected"] ~= new_item then
				tween(border, { Color = menu["colors"]["border"] }, circular, out, 0.17)
			end
		end)

		if self["favorites"] then
			local flag = info["text"] .. self["name"]
			new_item["favorite_flag"] = flag
			new_item["parent"] = self
			local favorited = menu["favorites"][flag]
			if favorited then
				new_item["favorited"] = true
				self:add_icon(info["text"], star)
			end
			create_right_click_connection(self["holder"], border, function(position)
				open_context({ menu["favorites"][flag] and 6 or 5 }, new_item, position)
			end)
		elseif self["configs"] then
			new_item["parent"] = self
			create_right_click_connection(self["holder"], border, function(position)
				open_context({ menu["autoload"] == new_item["name"] and 9 or 8 }, new_item, position)
			end)
		end

		create_click_connection(self["holder"], border, function()
			if not self["locked"] then
				local selected = self["selected"]
				if selected ~= new_item then
					tween(border, { ["Color"] = menu["colors"]["highlighted"] }, circular, out, 0.17)
					self["selected"] = new_item
					self["on_selection_change"]:Fire(text["Text"])

					local elements = self["elements"]
					local index = nil
					for i = 1, #elements do
						if elements[i] == new_item then
							index = i
						end
					end

					local elements = self["elements"]
					local old_item = elements[1]
					elements[1] = new_item
					elements[index or #elements + 1] = old_item

					if selected then
						tween(selected["drawings"]["border"], { Color = menu["colors"]["border"] }, circular, out, 0.17)
					end

					self["scroll_index"] = 1
					self:update_position()
				else
					tween(border, { Color = menu["colors"]["border"] }, circular, out, 0.17)
					self["selected"] = nil
					self["on_selection_change"]:Fire(nil)
				end
			end
		end)

		return new_item
	end

	function panel_section:remove_item(text, delay, skip)
		local elements = self["elements"]
		local holder = self["holder"]
		local object = nil

		for i = 1, #elements do
			local element = elements[i]

			if element and element["drawings"]["text"]["Text"] == text then
				object = element
				if not delay then
					remove(elements, i)
				end
				break
			end
		end

		if not object then
			return
		end

		local drawings = object["drawings"]
		local frame = drawings["border"]

		local connections = click_connections[holder]

		if connections then
			connections[frame] = nil
		end

		local connections = hover_connections[holder]

		if connections then
			connections[frame] = nil
		end

		local connections = right_click_connections[holder]

		if connections then
			connections[frame] = nil
		end

		for _, drawing in drawings do
			drawing:Destroy()
			drawings[_] = nil
		end

		self["scroll_index"] = clamp(self["scroll_index"], 1, 1 + clamp(#self["elements"] - 13, 0, 1000))

		if not delay then
			self:update_position()
		end

		if self["selected"] == object then
			self["selected"] = nil
			if not skip then
				self["on_selection_change"]:Fire(nil)
			end
		end
	end

	function panel_section:edit_item_color(text, color)
		local elements = self["elements"]
		local object = nil

		for i = 1, #elements do
			local element = elements[i]["drawings"]["text"]

			if element["Text"] == text then
				object = element
				break
			end
		end

		if not object then
			return
		end

		object["Color"] = color
	end

	function panel_section:remove_icon(text, icon)
		local elements = self["elements"]
		local object = nil

		for i = 1, #elements do
			local element = elements[i]
			local label = elements[i]["drawings"]["text"]

			if label["Text"] == text then
				object = element
				break
			end
		end

		if not object then
			return
		end

		local drawings = object["drawings"]
		local icons = object["icons"]

		local has_icon = false

		for i = 1, #icons do
			local icon_data = icons[i]
			if icon_data[1] == icon then
				has_icon = true
				break
			end
		end

		if not has_icon then
			return
		end

		for i = 1, #icons do
			local icon_data = icons[i]
			if icon_data[1] == icon then
				local name = icon_data[2]
				remove(icons, i)
				drawings[name]:Destroy()
				drawings[name] = nil
				break
			else
				drawings[icon_data[2]]["tween_position"] -= udim2_new(0, 15, 0, 0)
			end
		end

		drawings["text"]["tween_position"] = udim2_new(0, 5 + 15 * #icons, 0, 3)

		self:update_position()
	end

	function panel_section:add_icon(text, icon)
		local elements = self["elements"]
		local object = nil

		for i = 1, #elements do
			local element = elements[i]
			local label = elements[i]["drawings"]["text"]

			if label["Text"] == text then
				object = element
				break
			end
		end

		if not object then
			return
		end

		local drawings = object["drawings"]
		local icons = object["icons"]

		for i = 1, #icons do
			drawings[icons[i][2]]["tween_position"] += udim2_new(0, 15, 0, 0)
		end

		local name = "icon_" .. clock()

		drawings[name] = drawing_proxy["new"]("Image", {
			["Parent"] = drawings["inside"],
			["Position"] = udim2_new(0, 4, 0, 4),
			["Size"] = udim2_new(0, 10, 0, 10),
			["Color"] = menu["colors"]["accent"],
			["Visible"] = true,
			["Transparency"] = 1,
			["ZIndex"] = 4,
			["Data"] = icon,
		})

		icons[#icons + 1] = { icon, name }

		drawings["text"]["tween_position"] = udim2_new(0, 5 + 15 * #icons, 0, 3)

		self:update_position()
	end

	function panel_section:update_position()
		if actives["panel"] then
			return
		end

		local scroll_index = self["scroll_index"]
		local elements = self["elements"]
		local fake_elements = {}

		for i = 1, #elements do
			local element = elements[i]
			if element["favorited"] then
				local frame = elements[i]["drawings"]["border"]
				frame["Visible"] = true
				frame["Position"] = udim2_new(0, 0, 0, 30 + (i - scroll_index) * 30)
				fake_elements[#fake_elements + 1] = element
			end
		end

		for i = 1, #elements do
			local element = elements[i]
			if not element["favorited"] then
				fake_elements[#fake_elements + 1] = element
			end
		end

		for i = 1, #fake_elements do
			local frame = fake_elements[i]["drawings"]["border"]
			if i >= scroll_index and i < scroll_index + 13 then
				frame["Visible"] = true
				frame["Position"] = udim2_new(0, 0, 0, 30 + (i - scroll_index) * 30)
			else
				frame["Visible"] = false
			end
		end
	end

	-- > ( elements )

	function element.new(info, elements)
		local position = info["position"]
		local parent = info["parent"]

		local frame = drawing_proxy["new"]("Square", {
			["Parent"] = parent,
			["Position"] = position,
			["Size"] = udim2_new(1, -20, 0, 12),
			["Transparency"] = 0,
			["Visible"] = true,
		})

		local zindex = parent["ZIndex"] + 1

		local new_element = setmetatable({
			["drawings"] = {
				["text"] = drawing_proxy["new"]("Text", {
					["Color"] = menu["colors"]["inactive_text"],
					["Text"] = info["text"],
					["Size"] = 12,
					["Font"] = 1,
					["Transparency"] = 1,
					["Visible"] = true,
					["Parent"] = frame,
					["Position"] = udim2_new(0, 0, 0, -1),
					["ZIndex"] = zindex,
				}),
			},
			["frame"] = frame,
			["visible"] = true,
			["section"] = info["section"],
			["name"] = info["text"],
			["old_visible"] = true,
		}, element)

		local text = new_element["drawings"]["text"]
		local total_y_size = 17

		for element, properties in elements do
			if element == "toggle" then
				text["tween_position"] += udim2_new(0, 17, 0, 0)

				local toggle_border = drawing_proxy["new"]("Image", {
					["Parent"] = frame,
					["Position"] = udim2_new(0, 0, 0, 0),
					["Size"] = udim2_new(0, 12, 0, 12),
					["Color"] = menu["colors"]["border"],
					["Transparency"] = 1,
					["Rounding"] = 4,
					["Data"] = pixel_image_data,
					["ZIndex"] = zindex + 1,
					["Visible"] = true,
				})
				local toggle_inside = drawing_proxy["new"]("Image", {
					["Parent"] = toggle_border,
					["Position"] = udim2_new(0, 1, 0, 1),
					["Size"] = udim2_new(1, -2, 1, -2),
					["Color"] = menu["colors"]["background"],
					["Transparency"] = 1,
					["Rounding"] = 4,
					["Data"] = pixel_image_data,
					["ZIndex"] = zindex + 2,
					["Visible"] = true,
				})
				local toggle_click = drawing_proxy["new"]("Square", {
					["Parent"] = frame,
					["Size"] = udim2_new(0, 17 + new_element["drawings"]["text"]["TextBounds"]["X"], 1, 0),
					["Transparency"] = 0,
					["Visible"] = true,
					["ZIndex"] = zindex + 3,
					["Position"] = udim2_new(0, 0, 0, 0),
				})
				local checkmark = drawing_proxy["new"]("Image", {
					["Parent"] = toggle_inside,
					["Position"] = udim2_new(0, 1, 0, 1),
					["Size"] = udim2_new(1, -2, 1, -2),
					["Data"] = checkmark_image_data,
					["Transparency"] = 0,
					["ZIndex"] = zindex + 3,
					["Color"] = menu["colors"]["accent"],
					["Visible"] = true,
				})

				new_element["drawings"]["toggle_border"] = toggle_border
				new_element["drawings"]["toggle_inside"] = toggle_inside
				new_element["drawings"]["checkmark"] = checkmark

				create_hover_connection(parent, toggle_click, function()
					tween(toggle_border, { Color = menu["colors"]["highlighted"] }, circular, out, 0.17)
				end, function()
					tween(toggle_border, { Color = menu["colors"]["border"] }, circular, out, 0.17)
				end)

				new_element["on_toggle_change"] = signal["new"]()
				new_element["toggle_flag"] = properties["flag"]

				if properties["default"] then
					new_element:set_toggle(true)
				else
					flags[properties["flag"]] = false
				end

				create_click_connection(parent, toggle_click, function()
					new_element:set_toggle(not flags[properties["flag"]])
				end)

				if not info["fake"] then
					create_right_click_connection(parent, toggle_click, function(position)
						open_context(keybind_data[new_element] and { 2, 1 } or { 1 }, new_element, position)
					end)
				end
			elseif element == "slider" then
				total_y_size += 14

				local slider_border = drawing_proxy["new"]("Image", {
					["Parent"] = frame,
					["Position"] = udim2_new(0, 0, 0, 14),
					["Size"] = udim2_new(1, 0, 0, 12),
					["Color"] = menu["colors"]["border"],
					["Transparency"] = 1,
					["Rounding"] = 4,
					["Data"] = pixel_image_data,
					["ZIndex"] = zindex + 1,
					["Visible"] = true,
				})
				local slider_inside = drawing_proxy["new"]("Image", {
					["Parent"] = slider_border,
					["Position"] = udim2_new(0, 1, 0, 1),
					["Size"] = udim2_new(1, -2, 1, -2),
					["Color"] = menu["colors"]["background"],
					["Rounding"] = 4,
					["Data"] = pixel_image_data,
					["Transparency"] = 1,
					["ZIndex"] = zindex + 2,
					["Visible"] = true,
				})
				local slider_fill = drawing_proxy["new"]("Image", {
					["Parent"] = slider_inside,
					["Position"] = udim2_new(0, 1, 0, 1),
					["Size"] = udim2_new(0, 0, 1, -2),
					["Color"] = menu["colors"]["accent"],
					["Rounding"] = 4,
					["Data"] = pixel_image_data,
					["Transparency"] = 0.5,
					["ZIndex"] = zindex + 3,
					["Visible"] = true,
				})
				local slider_line = drawing_proxy["new"]("Square", {
					["Parent"] = frame,
					["Position"] = udim2_new(0, text["TextBounds"]["X"] + (elements["toggle"] and 20 or 3), 0, 2),
					["Size"] = udim2_new(0, 1, 0, 8),
					["Color"] = menu["colors"]["dark_text"],
					["Visible"] = true,
					["Filled"] = true,
					["Transparency"] = 0.5,
					["ZIndex"] = zindex + 4,
				})
				local slider_text = drawing_proxy["new"]("Text", {
					["Color"] = menu["colors"]["dark_text"],
					["Text"] = "",
					["Size"] = 12,
					["Font"] = 1,
					["Transparency"] = 1,
					["Visible"] = true,
					["Parent"] = frame,
					["ZIndex"] = zindex + 5,
					["Position"] = udim2_new(0, text["TextBounds"]["X"] + (elements["toggle"] and 24 or 7), 0, -1),
				})
				local slider_click = drawing_proxy["new"]("Square", {
					["Parent"] = slider_line,
					["Position"] = udim2_new(0, 0, 0, -1),
					["Size"] = udim2_new(0, 50, 0, 10),
					["Transparency"] = 0,
					["Filled"] = true,
					["ZIndex"] = zindex + 5,
					["Visible"] = true,
				})

				new_element["drawings"]["slider_border"] = slider_border
				new_element["drawings"]["slider_inside"] = slider_inside
				new_element["drawings"]["slider_fill"] = slider_fill
				new_element["drawings"]["slider_line"] = slider_line
				new_element["drawings"]["slider_text"] = slider_text

				new_element["on_slider_change"] = signal["new"]()
				new_element["slider_max"] = properties["max"]
				new_element["slider_min"] = properties["min"]
				new_element["slider_min_text"] = properties["min_text"]
				new_element["slider_max_text"] = properties["max_text"]
				new_element["slider_suffix"] = properties["suffix"] or ""
				new_element["slider_decimals"] = properties["decimals"] or 0

				new_element["slider_prefix"] = properties["prefix"] or ""
				new_element["slider_flag"] = properties["flag"]

				create_hover_connection(parent, slider_border, function()
					tween(slider_border, { Color = menu["colors"]["highlighted"] }, circular, out, 0.17)
				end, function()
					tween(slider_border, { Color = menu["colors"]["border"] }, circular, out, 0.17)
				end)

				create_click_connection(parent, slider_click, function()
					start_typing(slider_text, 100, function(value)
						if tonumber(value) then
							new_element:set_slider(value)
						end
					end, true, true)
				end)

				create_click_connection(parent, slider_border, function(mouse_position)
					local min, max, decimals = properties["min"], properties["max"], properties["decimals"]
					moving = create_connection(mouse["Move"], function()
						new_element:set_slider(
							round(
								min
									+ (max - min)
										* (get_mouse_location(user_input_service)["X"] - slider_inside["real_position"]["X"])
										/ slider_inside["real_size"]["X"],
								decimals
							)
						)
					end)
					new_element:set_slider(
						round(
							min
								+ (max - min)
									* (mouse_position["X"] - slider_inside["real_position"]["X"])
									/ slider_inside["real_size"]["X"],
							decimals
						)
					)
				end)

				if not info["fake"] then
					create_right_click_connection(parent, slider_border, function(position)
						open_context(keybind_data[new_element] and { 2, 1 } or { 1 }, new_element, position)
					end)
				end

				new_element:set_slider(properties["default"] or properties["min"])
			elseif element == "textbox" then
				total_y_size += 18

				local textbox_border = drawing_proxy["new"]("Image", {
					["Parent"] = frame,
					["Position"] = udim2_new(0, 0, 0, 14),
					["Size"] = udim2_new(1, 0, 0, 16),
					["Color"] = menu["colors"]["border"],
					["Transparency"] = 1,
					["Rounding"] = 4,
					["Data"] = pixel_image_data,
					["Visible"] = true,
					["ZIndex"] = zindex + 1,
				})
				local textbox_inside = drawing_proxy["new"]("Image", {
					["Parent"] = textbox_border,
					["Position"] = udim2_new(0, 1, 0, 1),
					["Size"] = udim2_new(1, -2, 1, -2),
					["Color"] = menu["colors"]["background"],
					["Rounding"] = 4,
					["Data"] = pixel_image_data,
					["Transparency"] = 1,
					["ZIndex"] = zindex + 2,
					["Visible"] = true,
				})
				local textbox_text = drawing_proxy["new"]("Text", {
					["Color"] = menu["colors"]["dark_text"],
					["Text"] = "...",
					["Size"] = 12,
					["Font"] = 1,
					["Transparency"] = 1,
					["Visible"] = true,
					["Parent"] = textbox_inside,
					["Center"] = false,
					["ZIndex"] = zindex + 3,
					["Position"] = udim2_new(0, 2, 0, 0),
				})
				new_element["drawings"]["textbox_border"] = textbox_border
				new_element["drawings"]["textbox_inside"] = textbox_inside
				new_element["drawings"]["textbox_text"] = textbox_text

				new_element["on_textbox_change"] = signal["new"]()
				new_element["textbox_flag"] = properties["flag"]

				create_hover_connection(parent, textbox_border, function()
					tween(textbox_border, { Color = menu["colors"]["highlighted"] }, circular, out, 0.17)
				end, function()
					tween(textbox_border, { Color = menu["colors"]["border"] }, circular, out, 0.17)
				end)

				create_click_connection(parent, textbox_border, function()
					start_typing(textbox_text, textbox_border["real_size"]["X"] - 15, function(value)
						new_element:set_textbox(tostring(value))
					end, false, true, true, true)
				end)

				new_element:set_textbox(properties["default"] or nil)
			elseif element == "dropdown" then
				total_y_size += 18

				local dropdown_border = drawing_proxy["new"]("Image", {
					["Parent"] = frame,
					["Position"] = udim2_new(0, 0, 0, 14),
					["Size"] = udim2_new(1, 0, 0, 16),
					["Color"] = menu["colors"]["border"],
					["Transparency"] = 1,
					["Rounding"] = 4,
					["Data"] = pixel_image_data,
					["Visible"] = true,
					["ZIndex"] = zindex + 1,
				})
				local dropdown_inside = drawing_proxy["new"]("Image", {
					["Parent"] = dropdown_border,
					["Position"] = udim2_new(0, 1, 0, 1),
					["Size"] = udim2_new(1, -2, 1, -2),
					["Color"] = menu["colors"]["background"],
					["Rounding"] = 4,
					["Data"] = pixel_image_data,
					["Transparency"] = 1,
					["ZIndex"] = zindex + 2,
					["Visible"] = true,
				})
				local dropdown_text = drawing_proxy["new"]("Text", {
					["Color"] = menu["colors"]["dark_text"],
					["Text"] = "none",
					["Size"] = 12,
					["Font"] = 1,
					["Transparency"] = 1,
					["Visible"] = true,
					["Parent"] = dropdown_inside,
					["Center"] = false,
					["ZIndex"] = zindex + 3,
					["Position"] = udim2_new(0, 3, 0, 0),
				})
				local dropdown_arrow = drawing_proxy["new"]("Image", {
					["Color"] = menu["colors"]["dark_text"],
					["Data"] = arrow_image_data,
					["Size"] = udim2_new(0, 8, 0, 8),
					["Position"] = udim2_new(1, -11, 0.5, -4),
					["Transparency"] = 1,
					["Visible"] = true,
					["ZIndex"] = zindex + 3,
					["Parent"] = dropdown_inside,
				})

				new_element["drawings"]["dropdown_border"] = dropdown_border
				new_element["drawings"]["dropdown_inside"] = dropdown_inside
				new_element["drawings"]["dropdown_arrow"] = dropdown_arrow
				new_element["drawings"]["dropdown_text"] = dropdown_text
				new_element["on_dropdown_change"] = signal["new"]()
				new_element["dropdown_flag"] = properties["flag"]
				new_element["multi"] = properties["multi"]
				new_element["requires_one"] = properties["requires_one"]

				new_element["options"] = properties["options"]

				create_hover_connection(parent, dropdown_border, function()
					tween(dropdown_border, { Color = menu["colors"]["highlighted"] }, circular, out, 0.17)
					tween(dropdown_arrow, { Color = menu["colors"]["highlighted"] }, circular, out, 0.17)
				end, function()
					tween(dropdown_border, { Color = menu["colors"]["border"] }, circular, out, 0.17)
					tween(dropdown_arrow, { Color = menu["colors"]["dark_text"] }, circular, out, 0.17)
				end)

				local extensions = properties["use_custom_extensions"]
				if extensions then
					local original_options = properties["options"]
					local new_options = {}

					for i = 1, #original_options do
						new_options[#new_options + 1] = original_options[i]
					end

					for _, file in listfiles(file_path .. "/custom") do
						local extension = file:match("%.([^%.]+)$")

						if extension then
							for i = 1, #extensions do
								if extensions[i] == extension then
									local file_name = file:match("([^/\\]+)$")
									local found = false
									for i = 1, #original_options do
										if original_options[i] == file_name then
											found = true
											break
										end
									end
									if not found then
										new_options[#new_options + 1] = file_name
									end
									break
								end
							end
						end
					end

					new_element["options"] = new_options

					create_click_connection(parent, dropdown_border, function()
						local original_options = properties["options"]
						local new_options = {}

						for i = 1, #original_options do
							new_options[#new_options + 1] = original_options[i]
						end

						for _, file in listfiles(file_path .. "/custom") do
							local extension = file:match("%.([^%.]+)$")

							if extension then
								for i = 1, #extensions do
									if extensions[i] == extension then
										local file_name = file:match("([^/\\]+)$")
										local found = false
										for i = 1, #original_options do
											if original_options[i] == file_name then
												found = true
												break
											end
										end
										if not found then
											new_options[#new_options + 1] = file_name
										end
										break
									end
								end
							end
						end

						new_element["options"] = new_options

						open_dropdown(new_element)
					end)
				else
					create_click_connection(parent, dropdown_border, function()
						open_dropdown(new_element)
					end)
				end

				if not info["fake"] then
					create_right_click_connection(parent, dropdown_border, function(position)
						open_context(keybind_data[new_element] and { 2, 1 } or { 1 }, new_element, position)
					end)
				end

				local default = properties["default"]
				new_element["dropdown_default"] = default
				new_element["requires_one"] = properties["requires_one"]

				if default then
					new_element:set_dropdown(default)
				end
			elseif element == "keybind" then
				local keybind_border = drawing_proxy["new"]("Image", {
					["Parent"] = frame,
					["Position"] = udim2_new(1, -40, 0, 0),
					["Size"] = udim2_new(0, 40, 0, 12),
					["Color"] = menu["colors"]["border"],
					["Transparency"] = 1,
					["Rounding"] = 4,
					["Data"] = pixel_image_data,
					["ZIndex"] = zindex + 1,
					["Visible"] = true,
				})
				local keybind_inside = drawing_proxy["new"]("Image", {
					["Parent"] = keybind_border,
					["Position"] = udim2_new(0, 1, 0, 1),
					["Size"] = udim2_new(1, -2, 1, -2),
					["Color"] = menu["colors"]["background"],
					["Transparency"] = 1,
					["Rounding"] = 4,
					["Data"] = pixel_image_data,
					["ZIndex"] = zindex + 2,
					["Visible"] = true,
				})
				local keybind_text = drawing_proxy["new"]("Text", {
					["Color"] = menu["colors"]["dark_text"],
					["Text"] = "none",
					["Size"] = 12,
					["Font"] = 1,
					["Transparency"] = 1,
					["Visible"] = true,
					["Parent"] = keybind_inside,
					["Center"] = true,
					["ZIndex"] = zindex + 3,
					["Position"] = udim2_new(0.5, 0, 0, -1),
				})

				local size = keybind_text["TextBounds"]["X"] + 8

				keybind_border["Size"] = udim2_new(0, size, 0, 12)
				keybind_border["Position"] = udim2_new(1, -size, 0, 0)
				keybind_inside["Size"] = udim2_new(0, size - 2, 0, 10)

				new_element["drawings"]["keybind_border"] = keybind_border
				new_element["drawings"]["keybind_inside"] = keybind_inside
				new_element["drawings"]["keybind_text"] = keybind_text
				new_element["on_key_change"] = signal["new"]()
				new_element["on_key_press"] = signal["new"]()

				create_hover_connection(parent, frame, function()
					tween(keybind_border, { Color = menu["colors"]["highlighted"] }, circular, out, 0.17)
				end, function()
					tween(keybind_border, { Color = menu["colors"]["border"] }, circular, out, 0.17)
				end)

				create_click_connection(parent, frame, function()
					start_binding(new_element)
				end)

				if properties["flag"] then
					new_element["keybind_flag"] = properties["flag"]

					local data = math_random(9000000, 90000000)
					keybind_data[data] = {
						["key"] = properties["default"],
						["value"] = true,
						["original_value"] = false,
						["set_activated"] = function()
							new_element["on_key_press"]:Fire()
						end,
					}
					create_connection(new_element["on_key_change"], function(key)
						keybind_data[data]["key"] = key
						flags[properties["flag"]] = key
					end)
				end
			elseif element == "colorpicker" then
				local transparency = properties["default_transparency"] or 0
				local color = properties["default_color"] or color3_fromrgb(255, 0, 0)

				local colorpicker_border = drawing_proxy["new"]("Image", {
					["Parent"] = frame,
					["Position"] = udim2_new(1, -25, 0, 0),
					["Size"] = udim2_new(0, 25, 0, 12),
					["Color"] = menu["colors"]["border"],
					["Transparency"] = 1,
					["Rounding"] = 4,
					["Data"] = pixel_image_data,
					["ZIndex"] = zindex + 1,
					["Visible"] = true,
				})
				local colorpicker_inside = drawing_proxy["new"]("Image", {
					["Parent"] = colorpicker_border,
					["Position"] = udim2_new(0, 1, 0, 1),
					["Size"] = udim2_new(1, -2, 1, -2),
					["Color"] = menu["colors"]["background"],
					["Transparency"] = 1,
					["Rounding"] = 4,
					["Data"] = pixel_image_data,
					["ZIndex"] = zindex + 2,
					["Visible"] = true,
				})
				local colorpicker_transparency = drawing_proxy["new"]("Image", {
					["Parent"] = colorpicker_inside,
					["Position"] = udim2_new(0, 1, 0, 1),
					["Size"] = udim2_new(1, -2, 1, -2),
					["Color"] = color3_fromrgb(255, 255, 255),
					["Transparency"] = -transparency + 1,
					["Rounding"] = 4,
					["Data"] = transparency_image_data,
					["ZIndex"] = zindex + 3,
					["Visible"] = true,
				})
				local colorpicker_fill = drawing_proxy["new"]("Image", {
					["Parent"] = colorpicker_transparency,
					["Position"] = udim2_new(0, 0, 0, 0),
					["Size"] = udim2_new(1, 0, 1, 0),
					["Color"] = color,
					["Transparency"] = 1,
					["Rounding"] = 2,
					["Data"] = pixel_image_data,
					["ZIndex"] = zindex + 3,
					["Visible"] = true,
				})

				new_element["drawings"]["colorpicker_transparency"] = colorpicker_transparency
				new_element["drawings"]["colorpicker_border"] = colorpicker_border
				new_element["drawings"]["colorpicker_inside"] = colorpicker_inside
				new_element["drawings"]["colorpicker_fill"] = colorpicker_fill

				new_element["transparency_flag"] = properties["transparency_flag"]
				new_element["color_flag"] = properties["color_flag"]
				new_element["on_transparency_change"] = signal["new"]()
				new_element["on_color_change"] = signal["new"]()

				create_hover_connection(parent, colorpicker_border, function()
					tween(colorpicker_border, { Color = menu["colors"]["highlighted"] }, circular, out, 0.17)
				end, function()
					tween(colorpicker_border, { Color = menu["colors"]["border"] }, circular, out, 0.17)
				end)

				create_click_connection(parent, colorpicker_border, function()
					open_colorpicker(new_element)
				end)

				create_right_click_connection(parent, colorpicker_border, function(position)
					open_context({ 7, 3, 4 }, new_element, position)
				end)

				new_element:set_colorpicker(properties["default_color"] or color3_fromrgb(255, 0, 0))
				new_element:set_colorpicker_transparency(properties["default_transparency"] or 0)
			elseif element == "info" then
				new_element["drawings"]["info_text"] = drawing_proxy["new"]("Text", {
					["Color"] = menu["colors"]["inactive_text"],
					["Text"] = "",
					["Size"] = 12,
					["Font"] = 1,
					["Transparency"] = 1,
					["Visible"] = true,
					["Parent"] = frame,
					["Position"] = udim2_new(0, 0, 0, -1),
					["ZIndex"] = zindex + 1,
				})
			elseif element == "button" then
				total_y_size += 4
				local button_border = drawing_proxy["new"]("Image", {
					["Parent"] = frame,
					["Position"] = udim2_new(0, 0, 0, 0),
					["Size"] = udim2_new(1, 0, 0, 16),
					["Color"] = menu["colors"]["border"],
					["Transparency"] = 1,
					["Rounding"] = 4,
					["Data"] = pixel_image_data,
					["Visible"] = true,
					["ZIndex"] = zindex + 1,
				})
				local button_inside = drawing_proxy["new"]("Image", {
					["Parent"] = button_border,
					["Position"] = udim2_new(0, 1, 0, 1),
					["Size"] = udim2_new(1, -2, 1, -2),
					["Color"] = menu["colors"]["background"],
					["Rounding"] = 4,
					["Data"] = pixel_image_data,
					["Transparency"] = 1,
					["ZIndex"] = zindex + 2,
					["Visible"] = true,
				})
				local button_icon = drawing_proxy["new"]("Image", {
					["Parent"] = button_border,
					["Position"] = udim2_new(1, -14, 0, 3),
					["Size"] = udim2_new(0, 10, 0, 10),
					["Color"] = menu["colors"]["dark_text"],
					["Rounding"] = 4,
					["Data"] = button_image_data,
					["Transparency"] = 1,
					["ZIndex"] = zindex + 3,
					["Visible"] = true,
				})
				local button_text = drawing_proxy["new"]("Text", {
					["Color"] = menu["colors"]["dark_text"],
					["Text"] = info["text"],
					["Size"] = 12,
					["Font"] = 1,
					["Transparency"] = 1,
					["Visible"] = true,
					["Parent"] = button_inside,
					["Center"] = false,
					["ZIndex"] = zindex + 3,
					["Position"] = udim2_new(0, 3, 0, 0),
				})

				local cooldown = clock()

				new_element["on_clicked"] = signal["new"]()

				local drawings = new_element["drawings"]
				drawings["button_border"] = button_border
				drawings["button_inside"] = button_inside
				drawings["button_text"] = button_text
				drawings["button_icon"] = button_icon
				drawings["text"]["Text"] = ""

				create_hover_connection(parent, button_border, function()
					tween(button_border, { Color = menu["colors"]["highlighted"] }, circular, out, 0.17)
				end, function()
					tween(button_border, { Color = menu["colors"]["border"] }, circular, out, 0.17)
				end)

				if properties["confirmation"] then
					local in_confirmation = false

					create_click_connection(parent, button_border, function()
						if clock() - cooldown > 0.15 and not actives["typing"] then
							cooldown = clock()
							if in_confirmation then
								new_element["on_clicked"]:Fire()
								tween(button_inside, { Color = color3_fromrgb(40, 40, 40) }, circular, out, 0.075)
								delay(0.075, function()
									tween(button_inside, { Color = menu["colors"]["background"] }, circular, out, 0.075)
								end)
								tween(button_text, { ["Color"] = menu["colors"]["dark_text"] }, circular, out, 0.075)
								tween(button_text, { ["tween_position"] = udim2_new(0, 3, 0, 0) }, circular, out, 0.075)
								in_confirmation = false
							else
								tween(button_text, { Color = menu["colors"]["accent"] }, circular, out, 0.075)
								local old = cooldown
								in_confirmation = cooldown
								for i = 1, 3 do
									if in_confirmation ~= old then
										break
									end
									button_text["Text"] = "are you sure? (" .. (4 - i) .. "s left)"
									tween(
										button_text,
										{ ["tween_position"] = udim2_new(0, 3, 0, -1) },
										circular,
										out,
										0.075
									)
									wait(0.075)
									if in_confirmation ~= old then
										break
									end
									tween(
										button_text,
										{ ["tween_position"] = udim2_new(0, 3, 0, 0) },
										circular,
										out,
										0.075
									)
									wait(0.925)
								end
								button_text["Text"] = info["text"]
								tween(button_text, { ["Color"] = menu["colors"]["dark_text"] }, circular, out, 0.075)
								tween(button_text, { ["tween_position"] = udim2_new(0, 3, 0, 0) }, circular, out, 0.075)
								in_confirmation = false
							end
						end
					end)
				else
					create_click_connection(parent, button_border, function()
						if clock() - cooldown > 0.15 then
							cooldown = clock()
							new_element["on_clicked"]:Fire()
							tween(button_inside, { Color = color3_fromrgb(40, 40, 40) }, circular, out, 0.075)
							delay(0.075, function()
								tween(button_inside, { Color = menu["colors"]["background"] }, circular, out, 0.075)
							end)
						end
					end)

					if not info["fake"] then
						create_right_click_connection(parent, button_border, function(position)
							open_context(keybind_data[new_element] and { 2, 1 } or { 1 }, new_element, position)
						end)
					end
				end
			end
		end

		local tip = info["tip"]

		if tip then
			create_hover_connection(parent, button_border, function()
				show_tooltip(new_element, tip)
			end, function()
				hide_tooltip(new_element, tip)
			end)
		end

		new_element["total_y_size"] = total_y_size

		frame["Size"] = udim2_new(1, -20, 0, total_y_size)

		return new_element, total_y_size
	end

	function element:set_info(property, value)
		local text = self["drawings"]["info_text"]
		text[property] = value

		if property == "Text" then
			text["Position"] = udim2_new(1, -text["TextBounds"]["X"], 0, -1)
		end
	end

	function element:set_options(options)
		self:set_dropdown()
		self["options"] = options
	end

	function element:set_toggle(value, just_keybind)
		local keybind = keybind_data[self]
		if keybind then
			if not just_keybind then
				local is_on_not_held = keybind["method"] == 2
				keybind["value"] = value
				keybind["activated"] = is_on_not_held or value
				spawn(on_keybind_change["Fire"], on_keybind_change, keybind, self, is_on_not_held or value)

				if is_on_not_held then
					return
				end
			end
		end

		local drawings = self["drawings"]
		tween(
			drawings["text"],
			{ Color = value and menu["colors"]["active_text"] or menu["colors"]["inactive_text"] },
			exponential,
			out,
			0.2
		)
		tween(drawings["checkmark"], { Transparency = value and 0.5 or 0 }, exponential, out, 0.2)

		flags[self["toggle_flag"]] = value
		self["on_toggle_change"]:Fire(value)
	end

	function element:set_slider(value, just_keybind)
		local drawings = self["drawings"]
		local max = self["slider_max"]
		local min = self["slider_min"]
		value = clamp(value, min, max)

		tween(
			drawings["slider_fill"],
			{ tween_size = udim2_new((value - min) / (max - min), value == max and -2 or 0, 1, -2) },
			exponential,
			out,
			0.2
		)

		local text = drawings["slider_text"]
		if value == min then
			tween(drawings["slider_line"], { Color = menu["colors"]["dark_text"] }, circular, out, 0.2)
			text["Text"] = self["slider_min_text"] or self["slider_prefix"] .. value .. self["slider_suffix"]
		else
			tween(drawings["slider_line"], { Color = menu["colors"]["accent"] }, circular, out, 0.2)
			text["Text"] = (value == max and self["slider_max_text"])
				or self["slider_prefix"] .. value .. self["slider_suffix"]
		end

		local keybind = keybind_data[self]

		if keybind then
			if not just_keybind then
				keybind["original_value"] = value
			end
		end

		flags[self["slider_flag"]] = value
		self["on_slider_change"]:Fire(value)
	end

	function element:set_textbox(value)
		flags[self["textbox_flag"]] = value
		self["drawings"]["textbox_text"]["Text"] = value == nil and "..." or value == "" and "..." or value
		self["on_textbox_change"]:Fire(value)
	end

	function element:set_colorpicker(value)
		flags[self["color_flag"]] = value
		self["drawings"]["colorpicker_fill"]["Color"] = value

		self["on_color_change"]:Fire(value)
	end

	function element:set_colorpicker_transparency(value)
		flags[self["transparency_flag"]] = value
		self["drawings"]["colorpicker_fill"]["Transparency"] = -value + 1

		self["on_transparency_change"]:Fire(value)
	end

	function element:set_dropdown(value, just_keybind, no_fire)
		local drawings = self["drawings"]
		local dropdown_text = drawings["dropdown_text"]
		local max_textbounds = drawings["dropdown_inside"]["real_size"]["X"]

		local text = ""
		local last_text = ""

		value = type(value) == "table" and value or { value }

		local options = self["options"]

		for i = 1, #value do
			local option = value[i]
			local found = false
			for i = 1, #options do
				if options[i] == option then
					found = true
					break
				end
			end
			if not found then
				for i = 1, #value do
					if value[i] == option then
						remove(value, i)
						break
					end
				end
			end
		end

		if value and #value ~= 0 then
			for i = 1, #value do
				local option = value[i]
				text = i == 1 and option or text .. ", " .. option
				dropdown_text["Text"] = text

				if dropdown_text["TextBounds"]["X"] + 8 > max_textbounds then
					dropdown_text["Text"] = last_text .. "..."
					break
				end

				last_text = text
			end
		else
			dropdown_text["Text"] = "none"
		end

		local keybind = keybind_data[self]

		if keybind then
			if not just_keybind then
				keybind["original_value"] = value
			end
		end

		flags[self["dropdown_flag"]] = value

		if not no_fire then
			self["on_dropdown_change"]:Fire(value)
		end
	end

	function element:update_dropdown_value(option)
		local value = flags[self["dropdown_flag"]]
		local multi = self["multi"]
		local requires_one = self["requires_one"]

		if multi then
			local count = value and #value or 0
			for i = 1, count do
				if value[i] == option then
					if requires_one and count == 1 then
						return nil
					end

					remove(value, i)

					self:set_dropdown(value)

					return false
				end
			end

			if value then
				value[#value + 1] = option
			else
				value = { option }
				flags[self["dropdown_flag"]] = value
			end

			self:set_dropdown(value)

			return true
		else
			if value and option == value[1] then
				if requires_one then
					return nil
				end

				self:set_dropdown(nil)

				return false
			else
				self:set_dropdown({ option })

				return true
			end
		end
	end

	function element:set_key(value)
		local drawings = self["drawings"]
		local keybind_border = drawings["keybind_border"]
		local keybind_inside = drawings["keybind_inside"]
		local keybind_text = drawings["keybind_text"]

		keybind_text["Text"] = value
				and (shortened_characters[value] and shortened_characters[value] or value["Name"]:lower())
			or "none"

		local size = keybind_text["TextBounds"]["X"] + 8

		keybind_border["Size"] = udim2_new(0, size, 0, 12)
		keybind_border["Position"] = udim2_new(1, -size, 0, 0)
		keybind_inside["Size"] = udim2_new(0, size - 2, 0, 10)
		keybind_text["Position"] = udim2_new(0, (size - 2) / 2, 0, -2)

		local flag = self["keybind_flag"]

		if flag then
			flags[flag] = value
		end

		self["on_key_change"]:Fire(value)
	end

	local settings = {}
	settings["__index"] = settings

	function settings:create_element(a, b, c)
		return self["sections"][a["section"] or 1]:create_element(a, b, c)
	end

	function element:create_settings(count)
		local frame = self["frame"]
		local cog_icon = drawing_proxy["new"]("Image", {
			["Data"] = cog_image_data,
			["Visible"] = true,
			["Transparency"] = 1,
			["Color"] = menu["colors"]["inactive_text"],
			["Size"] = udim2_new(0, 10, 0, 10),
			["Position"] = udim2_new(1, -10, 0, 1),
			["ZIndex"] = frame["ZIndex"] + 4,
			["Parent"] = frame,
		})

		self["drawings"]["cog_icon"] = cog_icon

		create_hover_connection(frame, cog_icon, function()
			tween(cog_icon, { ["Color"] = menu["colors"]["highlighted"] }, circular, out, 0.17)
		end, function()
			tween(cog_icon, { Color = menu["colors"]["inactive_text"] }, circular, out, 0.17)
		end)

		local section_border = drawing_proxy["new"]("Image", {
			["Parent"] = cog_icon,
			["Position"] = udim2_new(1, 5, 0, -5),
			["Size"] = udim2_new(0, 170, 0, 10),
			["Color"] = menu["colors"]["border"],
			["Transparency"] = 1,
			["Rounding"] = 4,
			["Data"] = pixel_image_data,
			["ZIndex"] = 500,
			["Visible"] = false,
		})
		local section_inside = drawing_proxy["new"]("Image", {
			["Parent"] = section_border,
			["Position"] = udim2_new(0, 1, 0, 1),
			["Size"] = udim2_new(1, -2, 1, -2),
			["Color"] = menu["colors"]["section"],
			["Transparency"] = 1,
			["Rounding"] = 4,
			["Data"] = pixel_image_data,
			["ZIndex"] = 501,
			["Visible"] = true,
		})

		local new_settings = setmetatable({
			["sections"] = {},
			["elements"] = {},
			["border"] = section_border,
			["inside"] = section_inside,
		}, settings)

		for i = 1, type(count) == "number" and count or 1 do
			local new_section = setmetatable({
				["tab"] = self["section"]["tab"],
				["total_y_size"] = 10,
				["frame"] = self["frame"],
				["elements"] = new_settings["elements"],
			}, section)

			local element_holder = drawing_proxy["new"]("Square", {
				["Parent"] = section_inside,
				["Position"] = udim2_new(0, 10 + i * 180, 0, 10),
				["Size"] = udim2_new(1, -20, 1, -20),
				["Transparency"] = 0,
				["Filled"] = true,
				["ZIndex"] = 502,
				["Visible"] = true,
			})

			new_section["border"] = section_border
			new_section["inside"] = section_inside
			new_section["holder"] = element_holder

			new_settings["sections"][i] = new_section
		end

		create_click_connection(self["frame"], cog_icon, function()
			if actives["settings"] == new_settings then
				close_settings(new_settings)
			else
				open_settings(new_settings)
			end
		end)

		menu["settings"][self] = new_settings

		return new_settings
	end

	function element:remove()
		local parent = self["parent"]
		local object = self["frame"]

		local connections = click_connections[parent]

		if connections then
			connections[object] = nil
		end

		local connections = hover_connections[parent]

		if connections then
			connections[object] = nil
		end

		local connections = right_click_connections[parent]

		if connections then
			connections[object] = nil
		end

		local drawings = self["drawings"]

		for _, drawing in drawings do
			drawing:Destroy()
			drawings[_] = nil
		end

		local section = self["section"]
		local elements = section["elements"]

		for i = 1, #elements do
			if elements[i] == self then
				remove(elements, i)
				break
			end
		end

		section:recalculate_size()
	end

	function element:set_visible(visible, old)
		if not old then
			self["old_visible"] = visible
		end
		self["visible"] = visible
		self["frame"]["Visible"] = visible
		self["section"]:recalculate_size()
	end

	function section:create_element(info, elements, fake)
		local position = self["total_y_size"]
		local new_element, total_y_size = element["new"]({
			["text"] = info["name"],
			["parent"] = self["inside"],
			["position"] = udim2_new(0, 10, 0, position),
			["fake"] = fake,
			["old_visible"] = true,
			["section"] = self,
		}, elements)

		self["total_y_size"] += total_y_size

		self["elements"][#self["elements"] + 1] = new_element

		if not self["side"] then
			self["border"]["Size"] = udim2_new(0, 170, 0, self["total_y_size"] + 7)
			self["inside"]["Size"] = udim2_new(1, -2, 1, -2)
		end

		return new_element
	end

	function section:recalculate_size()
		local elements = self["elements"]
		local total_size = 10

		for i = 1, #elements do
			local element = elements[i]
			if element["visible"] then
				element["frame"]["Position"] = udim2_new(0, 10, 0, total_size)
				total_size += element["total_y_size"]
			end
		end

		if not self["side"] then
			self["border"]["Size"] = udim2_new(0, 170, 0, total_size + 7)
			self["inside"]["Size"] = udim2_new(1, -2, 1, -2)
		end

		self["total_y_size"] = total_size
	end

	function section:destroy()
		if not self["border"] then
			return
		end
		for _, element in self["elements"] do
			element:remove()
		end
		for _, drawing in self do
			local type = typeof(drawing)
			if (type == "Drawing" or type == "Table") and rawget(drawing, "Destroy") then
				drawing["Destroy"](drawing)
				self[_] = nil
			end
		end
	end

	-- > ( notifications )

	local notification_types = {
		[1] = {
			color3_fromrgb(174, 255, 0),
			base64_decode(
				"iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAYdEVYdFNvZnR3YXJlAFBhaW50Lk5FVCA1LjEuMvu8A7YAAAC2ZVhJZklJKgAIAAAABQAaAQUAAQAAAEoAAAAbAQUAAQAAAFIAAAAoAQMAAQAAAAIAAAAxAQIAEAAAAFoAAABphwQAAQAAAGoAAAAAAAAAYAAAAAEAAABgAAAAAQAAAFBhaW50Lk5FVCA1LjEuMgADAACQBwAEAAAAMDIzMAGgAwABAAAAAQAAAAWgBAABAAAAlAAAAAAAAAACAAEAAgAEAAAAUjk4AAIABwAEAAAAMDEwMAAAAADp1fY4ytpsegAAAFFJREFUOE/NzEsOgCAMRdGy/0UrlxSDtY90RDwD/hc7rvlccnW+rIdrhFL4ieBrKYvGzDAv40cqQlOXuwjpoyhGeA5UnEV4HcZYRSli+PY3zG4fbDP68uskQAAAAABJRU5ErkJggg=="
			),
		},
		[2] = {
			color3_fromrgb(255, 225, 0),
			base64_decode(
				"iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADdYAAA3WAZBveZwAAAAYdEVYdFNvZnR3YXJlAFBhaW50Lk5FVCA1LjEuMvu8A7YAAAC2ZVhJZklJKgAIAAAABQAaAQUAAQAAAEoAAAAbAQUAAQAAAFIAAAAoAQMAAQAAAAIAAAAxAQIAEAAAAFoAAABphwQAAQAAAGoAAAAAAAAAiF8BAOgDAACIXwEA6AMAAFBhaW50Lk5FVCA1LjEuMgADAACQBwAEAAAAMDIzMAGgAwABAAAAAQAAAAWgBAABAAAAlAAAAAAAAAACAAEAAgAEAAAAUjk4AAIABwAEAAAAMDEwMAAAAAC1cWHl18YwawAAAGdJREFUOE+dkUsOgDAIRMWd9z+sSxUyNAKZ/t5mSmBKoQfjAQgLAg1kg3zg2Dihy5Sb2PNyV9pRCxWEhWBk3ZSca8aeyfnXbC/HjDPdHK+14VeMim2tY7qgNzRAjf4VNM8SIzZnFHkB8alA8IwiGIYAAAAASUVORK5CYII="
			),
		},
		[3] = {
			color3_fromrgb(255, 60, 63),
			base64_decode(
				"iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAMAAAAolt3jAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAGUExURf///wAAAFXC034AAAACdFJOU/8A5bcwSgAAAAlwSFlzAAAPgAAAD4ABMkKt4wAAABh0RVh0U29mdHdhcmUAUGFpbnQuTkVUIDUuMS4y+7wDtgAAALZlWElmSUkqAAgAAAAFABoBBQABAAAASgAAABsBBQABAAAAUgAAACgBAwABAAAAAgAAADEBAgAQAAAAWgAAAGmHBAABAAAAagAAAAAAAADMiQEA6AMAAMyJAQDoAwAAUGFpbnQuTkVUIDUuMS4yAAMAAJAHAAQAAAAwMjMwAaADAAEAAAABAAAABaAEAAEAAACUAAAAAAAAAAIAAQACAAQAAABSOTgAAgAHAAQAAAAwMTAwAAAAAAd06aoHBh5lAAAAPElEQVQYV22LQQ4AMAjC8P+fHqg4l4yDthERQHRIUGzONd9rGTLk9SRcb38tc7mFkRpy5VTtKY1zltERByNGAFUDKq+CAAAAAElFTkSuQmCC"
			),
		},
		[4] = {
			color3_fromrgb(255, 60, 63),
			base64_decode(
				"iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAMAAAAolt3jAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAGUExURf///wAAAFXC034AAAACdFJOU/8A5bcwSgAAAAlwSFlzAAAOwgAADsIBFShKgAAAABh0RVh0U29mdHdhcmUAUGFpbnQuTkVUIDUuMS4y+7wDtgAAALZlWElmSUkqAAgAAAAFABoBBQABAAAASgAAABsBBQABAAAAUgAAACgBAwABAAAAAgAAADEBAgAQAAAAWgAAAGmHBAABAAAAagAAAAAAAADydgEA6AMAAPJ2AQDoAwAAUGFpbnQuTkVUIDUuMS4yAAMAAJAHAAQAAAAwMjMwAaADAAEAAAABAAAABaAEAAEAAACUAAAAAAAAAAIAAQACAAQAAABSOTgAAgAHAAQAAAAwMTAwAAAAAI47wVfTF7xOAAAAP0lEQVQYV22NSQoAIBDDnP9/WpNW8GBwaZyCa2TdO+choQJRgouM2vN2UFLx1V0eNQUkk9rnI4IQ21OuUj7MbDBmAHXXCP83AAAAAElFTkSuQmCC"
			),
		},
	}

	do
		local update_notifications = LPH_NO_VIRTUALIZE(function()
			local notifications = menu["notifications"]
			local size = camera["ViewportSize"]["Y"] * 0.88
			if #notifications > 6 then
				notifications[1]:dismiss()
			end
			for i = 1, #notifications do
				local notification = notifications[i]
				local inside = notification["inside"]
				local position = inside["Position"]
				local new_position = udim2_new(0, position["X"], 0, size - (i * 29))
				if position ~= new_position then
					tween(inside, { tween_position = new_position }, exponential, out, 0.14)
				end
			end
		end)

		local colors = menu["colors"]

		local notification = {}
		notification["__index"] = notification

		menu["new_notification"] = function(text, type, time, data)
			if do_notifications then
				local color = typeof(time) == "Color3" and time
					or (type == 1 and colors["success"])
					or (type == 2 and colors["alert"])
					or (type == 3 and colors["error"])
					or colors["accent"]
				local inside = drawing_proxy["new"]("Image", {
					["Data"] = pixel_image_data,
					["Rounding"] = 7,
					["Size"] = udim2_new(1, -2, 1, -2),
					["Position"] = udim2_new(0, 1, 0, 1),
					["Color"] = colors["background"],
					["Transparency"] = 0,
					["ZIndex"] = 1101,
					["Visible"] = true,
				})
				local image = drawing_proxy["new"]("Image", {
					["Parent"] = inside,
					["Position"] = udim2_new(0, 5, 0, 5),
					["Size"] = udim2_new(0, 12, 0, 12),
					["Color"] = color,
					["Transparency"] = 0,
					["Data"] = data or notification_types[type][2],
					["Rounding"] = 4,
					["ZIndex"] = 1102,
					["Visible"] = true,
				})
				local text = drawing_proxy["new"]("Text", {
					["Parent"] = inside,
					["Position"] = udim2_new(0, 26, 0, 5),
					["Color"] = colors["active_text"],
					["Text"] = text,
					["Size"] = 12,
					["Font"] = 1,
					["ZIndex"] = 1102,
					["Transparency"] = 0,
					["Visible"] = true,
				})
				local shadow = drawing_proxy["new"]("Image", {
					["Parent"] = inside,
					["Data"] = shadow_image_data,
					["Rounding"] = 8,
					["Color"] = color,
					["Transparency"] = 0,
					["ZIndex"] = 1100,
					["Visible"] = true,
					["Position"] = udim2_new(0, 0, 0, 0),
				})

				local x_size = 32 + text["TextBounds"]["X"]
				local size = udim2_new(0, x_size, 0, 24)

				inside["Size"] = size

				local shadow_size = floor(x_size / 13)
				shadow["Size"] = size + udim2_new(0, shadow_size, 0, 6)
				shadow["Position"] = udim2_new(0, -shadow_size / 2, 0, -3)

				local new_notification = setmetatable({
					["inside"] = inside,
					["image"] = image,
					["text"] = text,
					["shadow"] = shadow,
					["start"] = clock(),
					["active"] = true,
				}, notification)

				delay(clamp(time and typeof(time) == "number" and time or 2, 0.5, 7), function()
					if new_notification["active"] then
						new_notification:dismiss()
					end
				end)

				local notifications = menu["notifications"]
				local viewport_size = camera["ViewportSize"]

				inside["Position"] = udim2_new(
					0,
					(viewport_size["X"] * 0.5) - (x_size * 0.5),
					0,
					viewport_size["Y"] * 0.88 - (#notifications * 29 - 5)
				)

				tween(inside, { Transparency = 0.89 }, circular, out, 0.12)
				tween(image, show_transparency, circular, out, 0.12)
				tween(text, show_transparency, circular, out, 0.12)
				tween(shadow, { Transparency = 0.16 }, circular, out, 0.12)

				notifications[#notifications + 1] = new_notification

				spawn(update_notifications)
			end
		end

		function notification:dismiss()
			local inside = self["inside"]
			local image = self["image"]
			local text = self["text"]
			local shadow = self["shadow"]
			tween(inside, hide_transparency, circular, out, 0.12)
			tween(image, hide_transparency, circular, out, 0.12)
			tween(text, hide_transparency, circular, out, 0.12)
			tween(shadow, hide_transparency, circular, out, 0.12)
			self["active"] = false

			local notifications = menu["notifications"]
			for i = 1, #notifications do
				if notifications[i] == self then
					remove(notifications, i)
					break
				end
			end

			delay(0.12, function()
				inside:Destroy()
				image:Destroy()
				text:Destroy()
				shadow:Destroy()
				spawn(update_notifications)
			end)
		end
	end

	-- > ( finalization )

	do
		-- >> ( menu finalization )

		keybind_section = setmetatable({
			["name"] = name,
			["side"] = side,
			["size"] = size,
			["total_y_size"] = 10,
			["holder"] = keybind_holder,
			["border"] = keybind_border,
			["inside"] = keybind_inside,
			["elements"] = {},
		}, section)

		create_hover_connection(list_frame, list_frame, function()
			tween(list_frame, { Color = menu["colors"]["highlighted"], Transparency = 1 }, circular, out, 0.15)
		end, function()
			tween(list_frame, { Color = menu["colors"]["border"], Transparency = 0.2 }, circular, out, 0.15)
		end)

		menu.set_accent_color = LPH_JIT_MAX(function(color)
			menu["colors"]["accent"] = color

			tab_line["Color"] = color
			drag_logo["Color"] = color
			for name, group in menu["groups"] do
				group["text"]["Color"] = color
				group["line"]["Color"] = color

				for name, tab in group["tabs"] do
					for _, section in tab["sections"] do
						section["line_two"]["Color"] = color
						section["line"]["Color"] = color
						section["label"]["Color"] = color

						for _, element in section["elements"] do
							local drawings = element["drawings"]
							local checkmark = drawings["checkmark"]
							local slider_fill = drawings["slider_fill"]
							local slider_text = drawings["slider_text"]

							local icons = element["icons"]

							if icons then
								for i = 1, #icons do
									local icon = icons[i]
									drawings[icon[2]]["Color"] = color
								end
							end

							if slider_fill then
								slider_fill["Color"] = color

								if flags[element["slider_flag"]] > element["slider_min"] then
									drawings["slider_line"]["Color"] = color
								end
							end

							if checkmark then
								checkmark["Color"] = color
							end
						end
					end
				end
			end

			for _, settings in menu["settings"] do
				for _, element in settings["elements"] do
					local drawings = element["drawings"]
					local checkmark = drawings["checkmark"]
					local slider_fill = drawings["slider_fill"]

					if slider_fill then
						slider_fill["Color"] = color

						if flags[element["slider_flag"]] > element["slider_min"] then
							drawings["slider_line"]["Color"] = color
						end
					end

					if checkmark then
						checkmark["Color"] = color
					end
				end
			end

			for i = 1, #context_buttons do
				context_buttons[i]["icon"]["Color"] = color
			end

			list_divider["Color"] = color
			list_icon["Color"] = color

			for _, drawing in list_drawings do
				drawing["value"]["Color"] = color
			end
		end)

		-- >> ( config system )

		local function to_base64(input)
			local charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
			local encoded = ""
			local padding = 0

			while #input % 3 ~= 0 do
				input = input .. "\0"
				padding = padding + 1
			end

			for i = 1, #input, 3 do
				local a, b, c = string["byte"](input, i, i + 2)
				local n = a * 2 ^ 16 + (b or 0) * 2 ^ 8 + (c or 0)
				encoded = encoded
					.. string["sub"](charset, math.floor(n / 2 ^ 18) % 64 + 1, math.floor(n / 2 ^ 18) % 64 + 1)
				encoded = encoded
					.. string["sub"](charset, math.floor(n / 2 ^ 12) % 64 + 1, math.floor(n / 2 ^ 12) % 64 + 1)
				encoded = encoded
					.. string["sub"](charset, math.floor(n / 2 ^ 6) % 64 + 1, math.floor(n / 2 ^ 6) % 64 + 1)
				encoded = encoded .. string["sub"](charset, n % 64 + 1, n % 64 + 1)
			end

			return string["sub"](encoded, 1, #encoded - padding) .. string["rep"]("=", padding)
		end

		local function from_base64(input)
			local charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
			local decoded = ""
			input = string["gsub"](input, "=", "")

			for i = 1, #input, 4 do
				local a, b, c, d =
					string["find"](charset, string["sub"](input, i, i)) - 1,
					string["find"](charset, string["sub"](input, i + 1, i + 1)) - 1,
					string["find"](charset, string["sub"](input, i + 2, i + 2)) - 1 or 0,
					string["find"](charset, string["sub"](input, i + 3, i + 3)) - 1 or 0
				local n = a * 2 ^ 18 + b * 2 ^ 12 + c * 2 ^ 6 + d
				decoded = decoded .. string["char"](math.floor(n / 2 ^ 16) % 256)
				decoded = decoded .. string["char"](math.floor(n / 2 ^ 8) % 256)
				decoded = decoded .. string["char"](n % 256)
			end

			return string["gsub"](decoded, "%z", "")
		end

		local function xor_crypt(input, key)
			local output = {}
			for i = 1, #input do
				local key_byte = string["byte"](key, (i - 1) % #key + 1)
				local xored = bit32["bxor"](string["byte"](input, i), key_byte)
				table.insert(output, string["char"](xored))
			end
			return table.concat(output)
		end

		local function shuffle_key(key)
			local shuffled = {}
			for i = 1, #key do
				table.insert(shuffled, string["sub"](key, i, i))
			end
			for i = #shuffled, 2, -1 do
				local j = math_random(i)
				shuffled[i], shuffled[j] = shuffled[j], shuffled[i]
			end
			return table.concat(shuffled)
		end

		local function encrypt(input, key)
			local salt = tostring(math_random(1000, 9999))
			input = salt .. input .. string["reverse"](salt)
			local shuffled_key = shuffle_key(key)
			local xored = xor_crypt(input, shuffled_key)
			return to_base64(xored)
		end

		local function decrypt(input, key)
			local decoded = from_base64(input)
			local shuffled_key = shuffle_key(key)
			local xored = xor_crypt(decoded, shuffled_key)
			local salt_length = 4

			return string["sub"](xored, salt_length + 1, -salt_length - 1)
		end

		menu.get_config_list = function()
			local list = {}
			local folder = file_path .. "/configs/"
			local prefix_len = #folder

			local files = listfiles(folder)
			for _, file in ipairs(files) do
				local ext = file:match("%.([^%.]+)$")
				if ext and ext:lower() == "cfg" then
					local name = file:sub(prefix_len + 1, -5)
					if name ~= "" then
						list[#list + 1] = name
					end
				end
			end

			return list
		end
		menu.get_addon_list = function()
			local list = {}

			local files = listfiles(file_path .. "/addons/")
			for _, file in files do
				if string["match"](file, "%.(.*)") == "luau" then
					list[#list + 1] = string["sub"](file, 20, #file - 5)
				end
			end

			return list
		end

		menu.get_skins_list = function()
			local list = {}

			local files = listfiles(file_path .. "/custom/")
			for _, file in files do
				if string["match"](file, "%.(.*)") == "skin" then
					list[#list + 1] = string["sub"](file, 20, #file - 5)
				end
			end

			return list
		end

		menu.get_theme_list = function()
			local list = {}

			local files = listfiles(file_path .. "/themes/")
			for _, file in files do
				if string["match"](file, "%.(.*)") == "th" then
					list[#list + 1] = string["sub"](file, 20, #file - 3)
				end
			end

			return list
		end

		menu.save_config = LPH_JIT(function(name)
			if string["find"](name, "%/") or string["find"](name, "%.") then
				return
			end

			local keybinds = {}

			local config = {
				["keybinds"] = keybinds,
				["author"] = flags["author"] or LRM_LinkedDiscordID or "Unknown",
				["date"] = os["date"]("%x"),
			}

			for flag, data in flags do
				local data = data
				local type_of = typeof(data)
				if type_of == "Color3" then
					data = { floor(data["R"] * 255), floor(data["G"] * 255), floor(data["B"] * 255) }
				elseif type_of == "EnumItem" then
					data = data["Name"]
				end

				if flag:sub(1, 1) == "!" then
					continue
				end

				config[flag] = data
			end

			for element, data in keybind_data do
				if type(element) == "table" then
					local type = data["type"]
					local flag =
						data["element"][type == 1 and "dropdown_flag" or type == 2 and "slider_flag" or type == 3 and "toggle_flag" or type == 4 and "name"]
					local original_value = data["original_value"]

					keybinds[#keybinds + 1] = {
						["flag"] = flag,
						["og_value"] = original_value,
						["value"] = data["value"],
						["method"] = data["method"],
						["key"] = data["key"]["Name"],
						["type"] = type,
					}

					config[flag] = original_value
				end
			end

			writefile(
				file_path .. "/configs/" .. name .. ".cfg",
				encrypt(http_service:JSONEncode(config), "^^^^^^^^^^^^^^^^^^^^")
			)
		end)

		menu["get_config_data"] = LPH_JIT(function(data)
			local success, decrypted = pcall(decrypt, data, "^^^^^^^^^^^^^^^^^^^^")

			if decrypted then
				local success, json = pcall(function()
					return http_service:JSONDecode(decrypted)
				end)

				if success then
					return json
				end
			end
		end)

		menu["load_config"] = LPH_JIT_MAX(function(name)
			if string["find"](name, "%/") or string["find"](name, "%.") then
				return
			end

			local path = file_path .. "/configs/" .. name .. ".cfg"

			if isfile(path) then
				local new_flags = menu["get_config_data"](readfile(path))

				if new_flags then
					local loaded_addons = new_flags["loaded_addons"]

					if loaded_addons then
						for _, addon in addon_data do
							for i = 1, #loaded_addons do
								if addon == loaded_addons[i] then
									continue
								end
								menu["unload_addon"](loaded_addons[i])
							end
						end

						for _, addon in loaded_addons do
							if not addon_data[addon] then
								menu["load_addon"](addon)
							end
						end
					else
						for _, addon in addon_data do
							menu["unload_addon"](addon)
						end
					end

					for element, keybind in keybind_data do
						if element ~= 1 then
							on_keybind_deleted:Fire(keybind, element, true)
						end
					end

					local colors = menu["colors"]
					for color, old in colors do
						local value = new_flags[color .. "_color"]

						if value then
							colors[color] = color3_fromrgb(value[1], value[2], value[3])
						end
					end

					local keybinds = new_flags["keybinds"]

					if keybinds then
						for _, data in keybind_data do
							if type(_) == "table" then
								keybind_data[_] = nil
							end
						end

						for _, new_keybind in keybinds do
							local flag = new_keybind["flag"]
							local type = new_keybind["type"]
							local flag_name = type == 1 and "dropdown_flag"
								or type == 2 and "slider_flag"
								or type == 3 and "toggle_flag"
								or type == 4 and "name"
							local new_keybind_data = nil

							local key = new_keybind["key"]

							local s = pcall(function()
								key = Enum["UserInputType"][key]
							end)
							if not s then
								s = pcall(function()
									key = Enum["KeyCode"][key]
								end)
							end

							if s then
								for _, group in menu["groups"] do
									for name, tab in group["tabs"] do
										for _, section in tab["sections"] do
											local elements = section["elements"]
											for i = 1, #elements do
												local element = elements[i]
												if element[flag_name] == flag then
													local method = new_keybind["method"]

													new_keybind_data = setmetatable({
														["method"] = type == 2 and 1 or method,
														["original_value"] = new_keybind["og_value"],
														["value"] = (type == 4 and "")
															or (type == 3 and new_flags[element[flag_name]])
															or (type ~= 3 and new_keybind["value"]),
														["type"] = type,
														["activated"] = method == 2,
														["element"] = element,
														["key"] = key,
													}, keybind)

													break
												end
											end
										end
									end
								end

								for _, settings in menu["settings"] do
									local elements = settings["elements"]
									for i = 1, #elements do
										local element = elements[i]
										if element[flag_name] == flag then
											local method = new_keybind["method"]
											new_keybind_data = setmetatable({
												["method"] = type == 2 and 1 or method,
												["original_value"] = new_keybind["og_value"],
												["value"] = (type == 4 and "")
													or (type == 3 and new_flags[element[flag_name]])
													or (type ~= 3 and new_keybind["value"]),
												["type"] = type,
												["activated"] = method == 2,
												["element"] = element,
												["key"] = key,
											}, keybind)
											break
										end
									end
								end

								if new_keybind_data then
									local element = new_keybind_data["element"]
									keybind_data[element] = new_keybind_data

									on_keybind_created:Fire(new_keybind_data, element)
								end
							end
						end
					end

					for name, group in menu["groups"] do
						for name, tab in group["tabs"] do
							for _, section in tab["sections"] do
								local elements = section["elements"]
								for i = 1, #elements do
									local element = elements[i]
									local slider_flag = element["slider_flag"]
									local toggle_flag = element["toggle_flag"]
									local dropdown_flag = element["dropdown_flag"]
									local textbox_flag = element["textbox_flag"]
									local colorpicker_flag = element["color_flag"]
									local keybind_flag = element["keybind_flag"]

									if slider_flag then
										local value = flags[slider_flag]
										local new_value = new_flags[slider_flag]

										if new_value ~= nil and value ~= new_value then
											element:set_slider(new_value)
										end
									end

									if toggle_flag then
										local value = flags[toggle_flag]
										local new_value = new_flags[toggle_flag]

										if new_value ~= nil and value ~= new_value then
											element:set_toggle(new_value)
										end
									end

									if dropdown_flag then
										local value = flags[dropdown_flag]
										local new_value = new_flags[dropdown_flag]

										if value ~= new_value then
											if new_value then
												local options = element["options"]

												for _, value in new_value do
													local found = false
													for i = 1, #options do
														if options[i] == value then
															found = true
															break
														end
													end
													if not found then
														remove(new_value, _)
													end
												end
											end

											element:set_dropdown(
												(new_value and #new_value > 0 and new_value)
													or (element["requires_one"] and element["dropdown_default"])
											)
										end
									end

									if textbox_flag then
										local value = flags[textbox_flag]
										local new_value = new_flags[textbox_flag]

										if new_value ~= nil and value ~= new_value then
											element:set_textbox(new_value)
										end
									end

									if colorpicker_flag then
										local color_value = flags[colorpicker_flag]
										local new_color_value = new_flags[colorpicker_flag]
										new_color_value = new_color_value
												and color3_fromrgb(
													new_color_value[1],
													new_color_value[2],
													new_color_value[3]
												)
											or nil
										local transparency_flag = element["transparency_flag"]
										local transparency_value = flags[transparency_flag]
										local new_transparency_value = new_flags[transparency_flag]

										if new_color_value ~= nil and color_value ~= new_color_value then
											element:set_colorpicker(new_color_value)
										end

										if
											new_transparency_value ~= nil
											and transparency_value ~= new_transparency_value
										then
											element:set_colorpicker_transparency(new_transparency_value)
										end
									end

									if keybind_flag then
										local value = flags[keybind_flag]
										local new_value = new_flags[keybind_flag]

										if new_value ~= nil and value ~= new_value then
											local s, err = pcall(function()
												new_value = Enum["UserInputType"][new_value]
											end)
											if not s then
												new_value = Enum["KeyCode"][new_value]
											end
											element:set_key(new_value)
										end
									end
								end
							end
						end
					end

					for element_settings, settings in menu["settings"] do
						local elements = settings["elements"]
						for i = 1, #elements do
							local element = elements[i]
							local slider_flag = element["slider_flag"]
							local toggle_flag = element["toggle_flag"]
							local dropdown_flag = element["dropdown_flag"]
							local textbox_flag = element["textbox_flag"]
							local colorpicker_flag = element["color_flag"]
							local keybind_flag = element["keybind_flag"]

							if slider_flag then
								local value = flags[slider_flag]
								local new_value = new_flags[slider_flag]

								if new_value ~= nil and value ~= new_value then
									element:set_slider(new_value)
								end
							end

							if toggle_flag then
								local value = flags[toggle_flag]
								local new_value = new_flags[toggle_flag]

								if new_value ~= nil and value ~= new_value then
									element:set_toggle(new_value)
								end
							end

							if dropdown_flag then
								local value = flags[dropdown_flag]
								local new_value = new_flags[dropdown_flag]

								if value ~= new_value then
									if new_value then
										local options = element["options"]

										for _, value in new_value do
											local found = false
											for i = 1, #options do
												if options[i] == value then
													found = true
													break
												end
											end
											if not found then
												remove(new_value, _)
											end
										end
									end

									element:set_dropdown(
										(new_value and #new_value > 0 and new_value)
											or (element["requires_one"] and element["dropdown_default"])
									)
								end
							end

							if textbox_flag then
								local value = flags[textbox_flag]
								local new_value = new_flags[textbox_flag]

								if new_value ~= nil and value ~= new_value then
									element:set_textbox(new_value)
								end
							end

							if colorpicker_flag then
								local color_value = flags[colorpicker_flag]
								local new_color_value = new_flags[colorpicker_flag]

								new_color_value = new_color_value
										and color3_fromrgb(new_color_value[1], new_color_value[2], new_color_value[3])
									or nil
								local transparency_flag = element["transparency_flag"]
								local transparency_value = flags[transparency_flag]
								local new_transparency_value = new_flags[transparency_flag]

								if new_color_value ~= nil and color_value ~= new_color_value then
									element:set_colorpicker(new_color_value)
								end

								if new_transparency_value ~= nil and transparency_value ~= new_transparency_value then
									element:set_colorpicker_transparency(new_transparency_value)
								end
							end

							if keybind_flag then
								local value = flags[keybind_flag]
								local new_value = new_flags[keybind_flag]

								if new_value ~= nil and value ~= new_value then
									local s, err = pcall(function()
										new_value = Enum["UserInputType"][new_value]
									end)
									if not s then
										new_value = Enum["KeyCode"][new_value]
									end
									element:set_key(new_value)
								end
							end
						end
					end

					local keybinds_position = new_flags["keybinds_position"]

					if keybinds_position then
						list_frame["Position"] = udim2_new(0, keybinds_position[1], 0, keybinds_position[2])
					end

					local skins = new_flags["skins"]

					if skins and type(skins) == "table" then
						flags["skins"] = skins
					end

					menu["on_config_loaded"]:Fire()
				end
			end
		end)

		do
			menu["unload_addon"] = function(name)
				local data = addon_data[name]

				if data then
					local thread = data[1]
					local on_unload = data[4]
					if on_unload then
						on_unload()
					end
					if data[2]["destroy"] then
						data[2]["destroy"](data[2])
						local addons_group = menu["groups"]["addons"]

						local count = #addons_group["ordered_tabs"]
						local is_visible = addons_group["is_visible"]
						if count == 0 and is_visible then
							addons_group["hide"](addons_group)
						elseif count > 0 and not is_visible then
							addons_group["show"](addons_group)
						end
					end
					for _, connection in data[3] do
						connection:Disconnect()
					end
					local loaded_addons = flags["loaded_addons"]
					local found = nil
					for i = 1, #loaded_addons do
						if loaded_addons[i] == name then
							found = i
							break
						end
					end
					if found then
						remove(loaded_addons, found)
					end

					coroutine["close"](thread)
					addon_data[name] = nil
				end
			end

			menu["load_addon"] = function(name)
				local path = file_path .. "/addons/" .. name .. ".luau"

				if not isfile(path) then
					return "file does not exist"
				end

				local data = readfile(path)

				local s, err = pcall(function()
					data = loadstring(data)
				end)

				if not s then
					return "juju: addon " .. name .. " experienced an error while loading: " .. err
				end

				if addon_data[name] then
					menu["unload_addon"](name)
				end

				getfenv(data).__IDENTIFIER = name

				local thread = coroutine["create"](data)

				addon_data[name] = {
					thread,
					{},
					{},
					function() end,
					name,
				}
				local loaded_addons = flags["loaded_addons"]
				loaded_addons[#loaded_addons + 1] = name

				local s, err = coroutine["resume"](thread)

				if not s then
					spawn(menu["unload_addon"], name)
					error("juju: addon " .. name .. " experienced an error while loading: " .. err)
				end
			end
		end

		-- >> ( fake settings )

		local settings_section = setmetatable({
			["total_y_size"] = 10,
			["elements"] = {},
		}, section)

		settings_section["border"] = drawing_proxy["new"]("Image", {
			["Parent"] = settings_image,
			["Position"] = udim2_new(1, 5, 0, -5),
			["Size"] = udim2_new(0, 170, 0, 10),
			["Color"] = menu["colors"]["border"],
			["Transparency"] = 1,
			["Rounding"] = 4,
			["Data"] = pixel_image_data,
			["ZIndex"] = 500,
			["Visible"] = false,
		})
		settings_section["inside"] = drawing_proxy["new"]("Image", {
			["Parent"] = settings_section["border"],
			["Position"] = udim2_new(0, 1, 0, 1),
			["Size"] = udim2_new(1, -2, 1, -2),
			["Color"] = menu["colors"]["background"],
			["Transparency"] = 1,
			["Rounding"] = 4,
			["Data"] = pixel_image_data,
			["ZIndex"] = 501,
			["Visible"] = true,
		})
		settings_section["holder"] = drawing_proxy["new"]("Square", {
			["Parent"] = settings_section["inside"],
			["Position"] = udim2_new(0, 10, 0, 10),
			["Size"] = udim2_new(1, -20, 1, -20),
			["Transparency"] = 0,
			["Filled"] = true,
			["ZIndex"] = 502,
			["Visible"] = true,
		})

		menu["settings"][{ ["name"] = "settings" }] = settings_section

		-- >> ( settings )

		do
			local menu_keybind = settings_section:create_element({
				["name"] = "toggle bind",
			}, {
				["keybind"] = {
					["flag"] = "menu_key",
				},
			})

			menu_keybind:set_key(Enum["KeyCode"]["Delete"])
			create_connection(menu_keybind["on_key_change"], function(key)
				keybind_data[1]["key"] = key
			end)

			create_connection(
				settings_section:create_element({
					["name"] = "keybinds list",
				}, {
					["toggle"] = {
						["default"] = false,
						["flag"] = "keybind_list",
					},
				})["on_toggle_change"],
				function(bool)
					if bool then
						menu:show_keybinds()
					else
						menu:hide_keybinds()
					end
				end
			)

			menu_references["notifications"] = settings_section:create_element({
				["name"] = "notifications",
			}, {
				["toggle"] = {
					["default"] = do_notifications,
					["flag"] = "!notifications",
				},
			})

			menu_references["hide_on_load"] = settings_section:create_element({
				["name"] = "hide on load",
			}, {
				["toggle"] = {
					["default"] = false,
					["flag"] = "!hide_on_load",
				},
			})

			create_connection(menu_references["notifications"]["on_toggle_change"], function(bool)
				do_notifications = bool
				menu["saved"] = true
			end)

			create_connection(menu_references["hide_on_load"]["on_toggle_change"], function(bool)
				menu["hide_on_load"] = bool
				menu["saved"] = true
			end)

			settings_section:create_element({
				["name"] = "custom kick screen",
			}, {
				["toggle"] = {
					["default"] = false,
					["flag"] = "custom_kick_screen",
				},
				["textbox"] = {
					["flag"] = "custom_kick_screen_background",
					["default"] = "2.png",
				},
				["colorpicker"] = {
					["color_flag"] = "custom_kick_screen_color",
					["transparency_flag"] = "custom_kick_screen_color_transparency",
					["default_color"] = menu["colors"]["accent"],
					["default_transparency"] = 0,
				},
			})

			create_connection(
				settings_section:create_element({
					["name"] = "unload juju",
				}, {
					["button"] = {
						["confirmation"] = true,
					},
				})["on_clicked"],
				function()
					getgenv()["_JUJU"]()

					if identifyexecutor() == "AWP" then
						cleardrawcache()
					end
				end
			)
		end

		-- >> ( fake theme )

		do
			theme_section = setmetatable({
				["total_y_size"] = 10,
				["elements"] = {},
			}, section)

			theme_section["border"] = drawing_proxy["new"]("Image", {
				["Parent"] = themes_image,
				["Position"] = udim2_new(1, 5, 0, -5),
				["Size"] = udim2_new(0, 170, 0, 10),
				["Color"] = menu["colors"]["border"],
				["Transparency"] = 1,
				["Rounding"] = 4,
				["Data"] = pixel_image_data,
				["ZIndex"] = 500,
				["Visible"] = false,
			})
			theme_section["inside"] = drawing_proxy["new"]("Image", {
				["Parent"] = theme_section["border"],
				["Position"] = udim2_new(0, 1, 0, 1),
				["Size"] = udim2_new(1, -2, 1, -2),
				["Color"] = menu["colors"]["background"],
				["Transparency"] = 1,
				["Rounding"] = 4,
				["Data"] = pixel_image_data,
				["ZIndex"] = 501,
				["Visible"] = true,
			})
			theme_section["holder"] = drawing_proxy["new"]("Square", {
				["Parent"] = theme_section["inside"],
				["Position"] = udim2_new(0, 10, 0, 10),
				["Size"] = udim2_new(1, -20, 1, -20),
				["Transparency"] = 0,
				["Filled"] = true,
				["ZIndex"] = 502,
				["Visible"] = true,
			})

			menu["settings"][{ ["name"] = "theming" }] = theme_section

			-- >> ( settings )

			create_connection(
				theme_section:create_element({
					["name"] = "juju color",
				}, {
					["colorpicker"] = {
						["default_color"] = menu["colors"]["juju"],
						["default_transparency"] = 0,
						["transparency_flag"] = "!juju_transparency",
						["color_flag"] = "!juju_color",
					},
				})["on_color_change"],
				function(color)
					menu["colors"]["juju"] = color
					juju_text["Color"] = color
				end
			)

			create_connection(
				theme_section:create_element({
					["name"] = "logo color",
				}, {
					["colorpicker"] = {
						["default_color"] = menu["colors"]["logo"],
						["default_transparency"] = 0,
						["transparency_flag"] = "!logo_transparency",
						["color_flag"] = "!logo_color",
					},
				})["on_color_change"],
				function(color)
					menu["colors"]["logo"] = color
					logo["Color"] = color
				end
			)

			create_connection(
				theme_section:create_element({
					["name"] = "error color",
				}, {
					["colorpicker"] = {
						["default_color"] = menu["colors"]["error"],
						["default_transparency"] = 0,
						["transparency_flag"] = "e!rror_transparency",
						["color_flag"] = "!error_color",
					},
				})["on_color_change"],
				function(color)
					menu["colors"]["error"] = color
				end
			)

			create_connection(
				theme_section:create_element({
					["name"] = "build color",
				}, {
					["colorpicker"] = {
						["default_color"] = menu["colors"]["build"],
						["default_transparency"] = 0,
						["transparency_flag"] = "!build_transparency",
						["color_flag"] = "!build_color",
					},
				})["on_color_change"],
				function(color)
					menu["colors"]["build"] = color
					build_text["Color"] = color
				end
			)

			create_connection(
				theme_section:create_element({
					["name"] = "image color",
				}, {
					["colorpicker"] = {
						["default_color"] = menu["colors"]["image"],
						["default_transparency"] = 0,
						["transparency_flag"] = "!image_transparency",
						["color_flag"] = "!image_color",
					},
				})["on_color_change"],
				function(color)
					menu["colors"]["image"] = color
					themes_image["Color"] = color
					settings_image["Color"] = color
					search_image["Color"] = color
				end
			)

			create_connection(
				theme_section:create_element({
					["name"] = "border color",
				}, {
					["colorpicker"] = {
						["default_color"] = menu["colors"]["border"],
						["default_transparency"] = 0,
						["transparency_flag"] = "!border_transparency",
						["color_flag"] = "!border_color",
					},
				})["on_color_change"],
				function(color)
					menu["colors"]["border"] = color
					context_border["Color"] = color
					dropdown_border["Color"] = color
					list_frame["Color"] = color
					search_out_border["Color"] = color
					for _, drawings in list_drawings do
						drawings["inside"]["Color"] = color
					end

					for _, settings in menu["settings"] do
						settings["border"]["Color"] = color
					end

					for name, group in menu["groups"] do
						for name, tab in group["tabs"] do
							for _, section in tab["sections"] do
								local search_border = section["search_border"]
								if search_border then
									search_border["Color"] = color
								end
								section["border"]["Color"] = color
								for _, element in section["elements"] do
									local drawings = element["drawings"]
									local toggle_border = drawings["toggle_border"]
									local dropdown_border = drawings["dropdown_border"]
									local slider_border = drawings["slider_border"]
									local colorpicker_border = drawings["colorpicker_border"]
									local keybind_border = drawings["keybind_border"]
									local button_border = drawings["button_border"]
									local textbox_border = drawings["textbox_border"]
									local border = drawings["border"]

									if toggle_border then
										toggle_border["Color"] = color
									end

									if dropdown_border then
										dropdown_border["Color"] = color
									end

									if slider_border then
										slider_border["Color"] = color
									end

									if colorpicker_border then
										colorpicker_border["Color"] = color
									end

									if keybind_border then
										keybind_border["Color"] = color
									end

									if button_border then
										button_border["Color"] = color
									end

									if border and section["selected"] ~= element then
										border["Color"] = color
									end

									if textbox_border then
										textbox_border["Color"] = color
									end
								end
							end
						end
					end

					for _, settings in menu["settings"] do
						for _, element in settings["elements"] do
							local drawings = element["drawings"]
							local toggle_border = drawings["toggle_border"]
							local dropdown_border = drawings["dropdown_border"]
							local slider_border = drawings["slider_border"]
							local colorpicker_border = drawings["colorpicker_border"]
							local keybind_border = drawings["keybind_border"]
							local button_border = drawings["button_border"]
							local textbox_border = drawings["textbox_border"]

							if toggle_border then
								toggle_border["Color"] = color
							end

							if dropdown_border then
								dropdown_border["Color"] = color
							end

							if slider_border then
								slider_border["Color"] = color
							end

							if colorpicker_border then
								colorpicker_border["Color"] = color
							end

							if keybind_border then
								keybind_border["Color"] = color
							end

							if button_border then
								button_border["Color"] = color
							end

							if textbox_border then
								textbox_border["Color"] = color
							end
						end
					end
				end
			)

			create_connection(
				theme_section:create_element({
					["name"] = "alert color",
				}, {
					["colorpicker"] = {
						["default_color"] = menu["colors"]["alert"],
						["default_transparency"] = 0,
						["transparency_flag"] = "!alert_transparency",
						["color_flag"] = "!alert_color",
					},
				})["on_color_change"],
				function(color)
					menu["colors"]["alert"] = color
				end
			)

			create_connection(
				theme_section:create_element({
					["name"] = "cursor color",
				}, {
					["colorpicker"] = {
						["default_color"] = menu["colors"]["cursor"],
						["default_transparency"] = 0,
						["transparency_flag"] = "!cursor_transparency",
						["color_flag"] = "!cursor_color",
					},
				})["on_color_change"],
				function(color)
					menu["colors"]["cursor"] = color
					cursor["Color"] = color
				end
			)

			create_connection(
				theme_section:create_element({
					["name"] = "accent color",
				}, {
					["colorpicker"] = {
						["default_color"] = menu["colors"]["accent"],
						["default_transparency"] = 0,
						["transparency_flag"] = "!accent_transparency",
						["color_flag"] = "!accent_color",
					},
				})["on_color_change"],
				function(color)
					menu.set_accent_color(color)
				end
			)

			create_connection(
				theme_section:create_element({
					["name"] = "shadow color",
				}, {
					["colorpicker"] = {
						["default_color"] = menu["colors"]["shadow"],
						["default_transparency"] = 0,
						["transparency_flag"] = "!shadow_transparency",
						["color_flag"] = "!shadow_color",
					},
				})["on_color_change"],
				function(color)
					menu["colors"]["shadow"] = color

					list_shadow["Color"] = color

					for _, drawing in list_drawings do
						drawing["shadow"]["Color"] = color
					end
				end
			)

			create_connection(
				theme_section:create_element({
					["name"] = "success color",
				}, {
					["colorpicker"] = {
						["default_color"] = menu["colors"]["success"],
						["default_transparency"] = 0,
						["transparency_flag"] = "!success_transparency",
						["color_flag"] = "!success_color",
					},
				})["on_color_change"],
				function(color)
					menu["colors"]["success"] = color
				end
			)

			create_connection(
				theme_section:create_element({
					["name"] = "dark text color",
				}, {
					["colorpicker"] = {
						["default_color"] = menu["colors"]["dark_text"],
						["default_transparency"] = 0,
						["transparency_flag"] = "!dark_text_transparency",
						["color_flag"] = "!dark_text_color",
					},
				})["on_color_change"],
				function(color)
					menu["colors"]["dark_text"] = color

					for name, group in menu["groups"] do
						for name, tab in group["tabs"] do
							for _, section in tab["sections"] do
								for _, element in section["elements"] do
									local drawings = element["drawings"]
									local text = drawings["dropdown_text"]
									local dropdown_arrow = drawings["dropdown_arrow"]
									local button_text = drawings["button_text"]
									local button_icon = drawings["button_icon"]
									local textbox_text = drawings["textbox_text"]
									local keybind_text = drawings["keybind_text"]
									local slider_text = drawings["slider_text"]

									local text2 = drawings["text2"]

									if text then
										text["Color"] = color
									end

									if text2 then
										text2["Color"] = color
									end

									if button_text then
										button_text["Color"] = color
									end

									if textbox_text then
										textbox_text["Color"] = color
									end

									if button_icon then
										button_icon["Color"] = color
									end

									if keybind_text then
										keybind_text["Color"] = color
									end

									if dropdown_arrow then
										dropdown_arrow["Color"] = color
									end

									if slider_text then
										slider_text["Color"] = color
									end
								end
							end
						end
					end

					for _, settings in menu["settings"] do
						for _, element in settings["elements"] do
							local drawings = element["drawings"]
							local text = drawings["dropdown_text"]
							local dropdown_arrow = drawings["dropdown_arrow"]
							local slider_text = drawings["slider_text"]
							local text2 = drawings["text2"]
							local button_text = drawings["button_text"]
							local button_icon = drawings["button_icon"]
							local textbox_text = drawings["textbox_text"]
							local keybind_text = drawings["keybind_text"]

							if text then
								text["Color"] = color
							end

							if textbox_text then
								textbox_text["Color"] = color
							end

							if dropdown_arrow then
								dropdown_arrow["Color"] = color
							end

							if keybind_text then
								keybind_text["Color"] = color
							end

							if text2 then
								text2["Color"] = color
							end

							if button_text then
								button_text["Color"] = color
							end

							if button_icon then
								button_icon["Color"] = color
							end

							if slider_text then
								slider_text["Color"] = color
							end
						end
					end
				end
			)

			create_connection(
				theme_section:create_element({
					["name"] = "section color",
				}, {
					["colorpicker"] = {
						["default_color"] = menu["colors"]["section"],
						["default_transparency"] = 0,
						["transparency_flag"] = "!section_transparency",
						["color_flag"] = "!section_color",
					},
				})["on_color_change"],
				function(color)
					menu["colors"]["section"] = color
					inside["Color"] = color

					for name, group in menu["groups"] do
						for name, tab in group["tabs"] do
							for _, section in tab["sections"] do
								section["inside"]["Color"] = color
							end
						end
					end

					for _, settings in menu["settings"] do
						settings["inside"]["Color"] = color
					end
				end
			)

			create_connection(
				theme_section:create_element({
					["name"] = "active text color",
				}, {
					["colorpicker"] = {
						["default_color"] = menu["colors"]["active_text"],
						["default_transparency"] = 0,
						["transparency_flag"] = "!active_text_transparency",
						["color_flag"] = "!active_text_color",
					},
				})["on_color_change"],
				function(color)
					menu["colors"]["active_text"] = color
					search_text["Color"] = color
					list_text["Color"] = color
					actives["tab"]["text"]["Color"] = color

					for name, group in menu["groups"] do
						for name, tab in group["tabs"] do
							if actives["tab"] == tab then
								tab["text"]["Color"] = color
							end
							for _, section in tab["sections"] do
								for _, element in section["elements"] do
									local toggle_flag = element["toggle_flag"]

									if toggle_flag then
										if flags[toggle_flag] then
											element["drawings"]["text"]["Color"] = color
										end
									end
								end
							end
						end
					end

					for _, settings in menu["settings"] do
						for _, element in settings["elements"] do
							local toggle_flag = element["toggle_flag"]

							if toggle_flag then
								if flags[toggle_flag] then
									element["drawings"]["text"]["Color"] = color
								end
							end
						end
					end
				end
			)

			create_connection(
				theme_section:create_element({
					["name"] = "inactive text color",
				}, {
					["colorpicker"] = {
						["default_color"] = menu["colors"]["inactive_text"],
						["default_transparency"] = 0,
						["transparency_flag"] = "!inactive_text_transparency",
						["color_flag"] = "!inactive_text_color",
					},
				})["on_color_change"],
				function(color)
					menu["colors"]["inactive_text"] = color
					type_line["Color"] = color

					for name, group in menu["groups"] do
						for name, tab in group["tabs"] do
							if actives["tab"] ~= tab then
								tab["text"]["Color"] = color
							end
							for _, section in tab["sections"] do
								local search_image = section["search_image"]

								if search_image then
									search_image["Color"] = color
								end
								for _, element in section["elements"] do
									local drawings = element["drawings"]
									local cog_icon = drawings["cog_icon"]

									local toggle_flag = element["toggle_flag"]

									if not toggle_flag or not flags[toggle_flag] then
										element["drawings"]["text"]["Color"] = color
									end

									if cog_icon then
										cog_icon["Color"] = color
									end
								end
							end
						end
					end

					for _, settings in menu["settings"] do
						for _, element in settings["elements"] do
							local drawings = element["drawings"]
							local dropdown_arrow = drawings["dropdown_arrow"]

							if dropdown_arrow then
								dropdown_arrow["Color"] = color
							end

							local toggle_flag = element["toggle_flag"]

							if not toggle_flag or not flags[toggle_flag] then
								element["drawings"]["text"]["Color"] = color
							end
						end
					end

					for i = 1, #context_buttons do
						context_buttons[i]["text"]["Color"] = color
					end
				end
			)

			create_connection(
				theme_section:create_element({
					["name"] = "keybind text color",
				}, {
					["colorpicker"] = {
						["default_color"] = menu["colors"]["keybind_text"],
						["default_transparency"] = 0,
						["transparency_flag"] = "!keybind_text_transparency",
						["color_flag"] = "!keybind_text_color",
					},
				})["on_color_change"],
				function(color)
					menu["colors"]["keybind_text"] = color
					for _, drawings in list_drawings do
						drawings["text"]["Color"] = color
					end
				end
			)

			create_connection(
				theme_section:create_element({
					["name"] = "background color",
				}, {
					["colorpicker"] = {
						["default_color"] = menu["colors"]["background"],
						["default_transparency"] = 0,
						["transparency_flag"] = "!background_transparency",
						["color_flag"] = "!background_color",
					},
				})["on_color_change"],
				function(color)
					menu["colors"]["background"] = color
					context_inside["Color"] = color
					right_side["Color"] = color
					right_side_cover["Color"] = color
					right_side_divider["Color"] = color
					search_inside["Color"] = color
					search_out["Color"] = color
					keybind_inside["Color"] = color
					search_inside["Color"] = color
					colorpicker_inside["Color"] = color
					right_side["Color"] = color
					right_side_cover["Color"] = color
					right_side_divider["Color"] = color
					search_inside["Color"] = color
					search_out["Color"] = color
					dropdown_inside["Color"] = color
					context_inside["Color"] = color
					keybind_inside["Color"] = color
					search_inside["Color"] = color
					list_inside["Color"] = color
					search_out["Color"] = color
					drag_frame["Color"] = color

					for _, drawings in list_drawings do
						drawings["inside"]["Color"] = color
					end

					for _, button in context_buttons do
						button["frame"]["Color"] = color
					end

					for name, group in menu["groups"] do
						for name, tab in group["tabs"] do
							for _, section in tab["sections"] do
								local search_inside = section["search_inside"]
								if search_inside then
									search_inside["Color"] = color
								end
								for _, element in section["elements"] do
									local drawings = element["drawings"]
									local toggle_inside = drawings["toggle_inside"]
									local dropdown_inside = drawings["dropdown_inside"]
									local slider_inside = drawings["slider_inside"]
									local colorpicker_inside = drawings["colorpicker_inside"]
									local keybind_inside = drawings["keybind_inside"]
									local button_inside = drawings["button_inside"]
									local textbox_inside = drawings["textbox_inside"]
									local inside = drawings["inside"]

									if toggle_inside then
										toggle_inside["Color"] = color
									end

									if dropdown_inside then
										dropdown_inside["Color"] = color
									end

									if slider_inside then
										slider_inside["Color"] = color
									end

									if colorpicker_inside then
										colorpicker_inside["Color"] = color
									end

									if keybind_inside then
										keybind_inside["Color"] = color
									end

									if button_inside then
										button_inside["Color"] = color
									end

									if textbox_inside then
										textbox_inside["Color"] = color
									end

									if inside then
										inside["Color"] = color
									end
								end
							end
						end
					end

					for _, settings in menu["settings"] do
						for _, element in settings["elements"] do
							local drawings = element["drawings"]
							local toggle_inside = drawings["toggle_inside"]
							local dropdown_inside = drawings["dropdown_inside"]
							local slider_inside = drawings["slider_inside"]
							local colorpicker_inside = drawings["colorpicker_inside"]
							local keybind_inside = drawings["keybind_inside"]
							local button_inside = drawings["button_inside"]
							local textbox_inside = drawings["textbox_inside"]
							local inside = drawings["inside"]

							if toggle_inside then
								toggle_inside["Color"] = color
							end

							if dropdown_inside then
								dropdown_inside["Color"] = color
							end

							if slider_inside then
								slider_inside["Color"] = color
							end

							if colorpicker_inside then
								colorpicker_inside["Color"] = color
							end

							if keybind_inside then
								keybind_inside["Color"] = color
							end

							if button_inside then
								button_inside["Color"] = color
							end

							if textbox_inside then
								textbox_inside["Color"] = color
							end

							if inside then
								inside["Color"] = color
							end
						end
					end
				end
			)

			create_connection(
				theme_section:create_element({
					["name"] = "active border color",
				}, {
					["colorpicker"] = {
						["default_color"] = menu["colors"]["highlighted"],
						["default_transparency"] = 0,
						["transparency_flag"] = "!active_border_transparency",
						["color_flag"] = "!active_border_color",
					},
				})["on_color_change"],
				function(color)
					menu["colors"]["highlighted"] = color
				end
			)

			theme_section:create_element({
				["name"] = "themes",
				["section"] = 2,
			}, {
				["dropdown"] = {
					["options"] = menu["get_theme_list"](),
					["flag"] = "!themes",
					["default"] = menu["theme"] and { menu["theme"] } or nil,
				},
			})

			create_connection(
				theme_section:create_element({
					["name"] = "refresh themes",
					["section"] = 2,
				}, {
					["button"] = {
						["fake"] = true,
					},
				})["on_clicked"],
				function()
					local elements = theme_section["elements"]

					for i = 1, #elements do
						local element = elements[i]
						if element["dropdown_flag"] then
							element:set_options(menu["get_theme_list"]())
							break
						end
					end
				end
			)

			create_connection(
				theme_section:create_element({
					["name"] = "load theme",
					["section"] = 2,
				}, {
					["button"] = {
						["fake"] = true,
					},
				})["on_clicked"],
				function()
					menu:load_theme(flags["!themes"][1])
				end
			)

			theme_section:create_element({
				["name"] = "name",
				["section"] = 2,
			}, {
				["textbox"] = {
					["flag"] = "!name",
				},
			})

			create_connection(
				theme_section:create_element({
					["name"] = "save theme",
					["section"] = 2,
				}, {
					["button"] = {},
				})["on_clicked"],
				function()
					local file = file_path .. "/themes/" .. flags["!name"] .. ".th"
					local data = {}

					local elements = theme_section["elements"]

					for i = 1, #elements do
						local element = elements[i]
						local flag = element["color_flag"]
						if flag then
							local color = flags[flag]
							data[flag] = { floor(color["R"] * 255), floor(color["G"] * 255), floor(color["B"] * 255) }
						end
					end

					writefile(file, http_service:JSONEncode(data))

					menu["new_notification"]("successfully saved theme " .. flags["!name"], 1)

					local elements = theme_section["elements"]

					for i = 1, #elements do
						local element = elements[i]
						if element["dropdown_flag"] then
							element:set_options(menu["get_theme_list"]())
							break
						end
					end
				end
			)

			create_click_connection(frame, themes_image, function()
				if actives["settings"] == theme_section then
					close_settings(theme_section)
				else
					open_settings(theme_section)
				end
			end)

			create_hover_connection(frame, themes_image, function()
				tween(themes_image, { Color = menu["colors"]["highlighted"] }, circular, out, 0.15)
			end, function()
				tween(themes_image, { Color = menu["colors"]["image"] }, circular, out, 0.15)
			end)
		end

		-- >> ( buttons )

		create_click_connection(frame, settings_image, function()
			if actives["settings"] == theme_section then
				close_settings(settings_section)
			else
				open_settings(settings_section)
			end
		end)

		create_hover_connection(frame, settings_image, function()
			tween(settings_image, { Color = menu["colors"]["highlighted"] }, circular, out, 0.15)
		end, function()
			tween(settings_image, { Color = menu["colors"]["image"] }, circular, out, 0.15)
		end)

		create_hover_connection(frame, search_image, function()
			if not searching then
				tween(search_image, { Color = menu["colors"]["highlighted"] }, circular, out, 0.15)
			end
		end, function()
			if not searching then
				tween(search_image, { Color = menu["colors"]["image"] }, circular, out, 0.15)
			end
		end)

		create_click_connection(frame, search_image, start_search)

		-- >> ( configs )

		function menu:setup_configs(section_name)
			local config_list, config_info, config_editor = nil, nil, nil
			if type(section_name) == "string" then
				local config_tab = menu.create_group(section_name)
				config_tab:create_tab("configs")
				config_list =
					menu["groups"][section_name]:create_panel_section("configs", "config list", 1, false, true)
				config_info = menu["groups"][section_name]:create_section("configs", "config info", 2, 0.3, 0)
				config_editor = menu["groups"][section_name]:create_section("configs", "config editor", 2, 0.7, 0.3)
			else
				section_name:create_tab("configs")
				config_list = section_name:create_panel_section("configs", "config list", 1, false, true)
				config_info = section_name:create_section("configs", "config info", 2, 0.3, 0)
				config_editor = section_name:create_section("configs", "config editor", 2, 0.7, 0.3)
			end

			menu_references["config_list"] = config_list

			local config_author = config_info:create_element({
				["name"] = "creator: ",
			}, {
				["info"] = {},
			})

			local config_last_updated = config_info:create_element({
				["name"] = "last updated: ",
			}, {
				["info"] = {},
			})

			local config_name = config_editor:create_element({
				["name"] = "config name",
			}, {
				["textbox"] = {
					["flag"] = "!config_name",
				},
			})

			local create_config = config_editor:create_element({
				["name"] = "create config",
			}, {
				["button"] = {
					["fake"] = true,
				},
			})

			local delete_config = config_editor:create_element({
				["name"] = "delete config",
			}, {
				["button"] = {
					["confirmation"] = true,
					["fake"] = true,
				},
			})

			local update_config = config_editor:create_element({
				["name"] = "update config",
			}, {
				["button"] = {
					["confirmation"] = true,
					["fake"] = true,
				},
			})

			local load_config = config_editor:create_element({
				["name"] = "load config",
			}, {
				["button"] = {
					["confirmation"] = true,
					["fake"] = true,
				},
			})

			local refresh_config_list = config_editor:create_element({
				["name"] = "refresh config list",
			}, {
				["button"] = {
					["fake"] = true,
				},
			})

			create_connection(config_list["on_selection_change"], function(config)
				local config = config or "AbbbbAzbbbbA12z"
				local path = file_path .. "/configs/" .. config .. ".cfg"
				local data = nil
				if isfile(path) then
					data = menu["get_config_data"](readfile(path))
				end
				if not data then
					config_name:set_visible(true)
					create_config:set_visible(true)
					load_config:set_visible(false)
					update_config:set_visible(false)
					delete_config:set_visible(false)
					config_author:set_visible(false)

					config_last_updated:set_visible(false)
					refresh_config_list:set_visible(true)
				else
					config_name:set_visible(false)
					create_config:set_visible(false)
					load_config:set_visible(true)
					update_config:set_visible(true)
					delete_config:set_visible(true)
					refresh_config_list:set_visible(false)
					config_last_updated:set_visible(true)
					config_last_updated:set_info("Text", data["date"])

					local author = data["author"]
					local username = nil

					if author and tonumber(author) then
						local s, data = pcall(function()
							local body = request({
								["Url"] = "https://discord-lookup-api-pied.vercel.app/v1/user/" .. author,
								["Method"] = "GET",
								["Headers"] = {
									["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
									["Accept"] = "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
									["Accept-Language"] = "en-US,en;q=0.9",
									["Connection"] = "keep-alive",
									["Referer"] = "https://www.google.com/",
									["DNT"] = "1",
									["Upgrade-Insecure-Requests"] = "1",
								},
							})

							if body and body["StatusCode"] == 200 then
								return http_service:JSONDecode(body["Body"])
							end
						end)
						username = (s and data) and "@" .. data["username"] or "failed to fetch"
						config_author:set_visible(true)
						config_author:set_info("Text", username)
					else
						config_author:set_visible(false)
						config_author:set_info("Text", "")
					end
				end
			end)

			create_connection(create_config["on_clicked"], function()
				local selected_config = flags["!config_name"]

				if selected_config and tostring(selected_config) and #selected_config > 0 then
					menu["save_config"](selected_config)

					config_list:add_item({
						["text"] = selected_config,
						["icons"] = {
							config_image_data,
						},
					})

					menu["new_notification"]("successfully created config " .. selected_config, 1)
				end
			end)

			create_connection(refresh_config_list["on_clicked"], function()
				local elements = config_list["elements"]
				for _, element in elements do
					config_list:remove_item(element["name"], true)
					elements[_] = nil
				end

				local configs = menu["get_config_list"]()
				local current_autoload = menu["autoload"]

				for i = 1, #configs do
					local config = configs[i]
					config_list:add_item({
						["text"] = config,
						["icons"] = current_autoload == config and {
							autoload,
							config_image_data,
						} or {
							config_image_data,
						},
					})
				end
			end)

			create_connection(delete_config["on_clicked"], function()
				local selected_config = config_list["selected"]["name"]

				if selected_config and tostring(selected_config) and #selected_config > 0 then
					config_list:remove_item(selected_config)
					delfile(file_path .. "/configs/" .. selected_config .. ".cfg")
					menu["new_notification"]("successfully deleted config " .. selected_config, 1)
				end
			end)

			create_connection(update_config["on_clicked"], function()
				local selected_config = config_list["selected"]["name"]

				if selected_config and tostring(selected_config) and #selected_config > 0 then
					menu["save_config"](selected_config)
					menu["new_notification"]("successfully updated config " .. selected_config, 1)
				end
			end)

			create_connection(load_config["on_clicked"], function()
				local selected_config = config_list["selected"]["name"]

				if selected_config and tostring(selected_config) and #selected_config > 0 then
					menu["load_config"](selected_config)
					menu["new_notification"]("successfully loaded config " .. selected_config, 1)
				end
			end)

			for _, config in menu.get_config_list() do
				config_list:add_item({
					["text"] = config,
					["icons"] = menu["autoload"] == config and {
						autoload,
						config_image_data,
					} or {
						config_image_data,
					},
				})
			end

			config_author:set_visible(false)
			update_config:set_visible(false)
			config_last_updated:set_visible(false)
			delete_config:set_visible(false)
			load_config:set_visible(false)
		end
	end

	-- > ( loading / unloading )

	do
		local unload = getgenv()["_JUJU"]

		if unload then
			unload()
		end

		local env = getgenv()
		local old_drawing = env["fake_drawing"]

		local metatables = {}

		local real = getrawmetatable
		env["_OG"] = real
		env["getrawmetatable"] = newcclosure(function(instance)
			local mt = real(instance)
			metatables[instance] = mt

			return mt
		end)

		getrawmetatable = env["getrawmetatable"]

		env["_JUJU"] = function()
			env["_JUJU"] = nil

			for _, group in menu["groups"] do
				for _, tab in group["tabs"] do
					for _, section in tab["sections"] do
						local elements = section["elements"]
						for i = 1, #elements do
							local element = elements[i]

							if element["toggle_flag"] then
								element:set_toggle(false)
							end
						end
					end
				end
			end

			for _, settings in menu["settings"] do
				local elements = settings["elements"]
				for i = 1, #elements do
					local element = elements[i]

					if element["toggle_flag"] then
						element:set_toggle(false)
					end
				end
			end

			for i = 1, #connections do
				connections[i]:Disconnect()
			end

			context_action_service:UnbindAction(context_action_click)
			context_action_service:UnbindAction(context_action_typing)
			context_action_service:UnbindCoreAction(context_action_typing_core)
			context_action_service:UnbindAction(context_action_scroll)

			env["getrawmetatable"] = real

			for instance, mt in metatables do
				setrawmetatable(instance, mt)
			end

			old_drawing["_UNLOAD"]()
		end

		-- >> ( render / tween loop )

		create_connection(
			run_service["Heartbeat"],
			LPH_NO_VIRTUALIZE(function(dt)
				for i = 1, #heartbeat do
					spawn(heartbeat[i], dt)
				end
			end)
		)

		-- >> ( data )

		local s, data = pcall(function()
			return http_service:JSONDecode(readfile(file_path .. "/data.dat"))
		end)

		if s and data then
			local notifications = data["notifications"]
			local autoload_config = data["autoload"]
			local favorites = data["favorites"]
			local theme = data["theme"]
			local hide_on_load = data["hide_on_load"]

			menu["hide_on_load"] = hide_on_load

			pop_menu(true)

			if not hide_on_load then
				pop_menu()
			end

			menu["theme"] = theme or ""
			menu["favorites"] = favorites or {}
			menu["autoload"] = autoload_config or nil
			do_notifications = notifications or notifications == nil or false
			menu_references["notifications"]:set_toggle(do_notifications)
			menu_references["hide_on_load"]:set_toggle(hide_on_load)

			if theme then
				menu:load_theme(theme)
			end

			if autoload_config then
				menu_references["config_list"]:add_icon(autoload_config, autoload)
			end
		else
			writefile(
				file_path .. "/data.dat",
				http_service:JSONEncode({
					["notifications"] = do_notifications,
					["favorites"] = {},
					["hide_on_load"] = false,
					["theme"] = "",
				})
			)
		end
	end
end

return {
	["menu"] = menu,
	["signal"] = signal,
	["tween"] = tween,
	["drawing_proxy"] = drawing_proxy,
	["drawing"] = drawing,
	["create_connection"] = create_connection,
	["create_instance"] = create_instance,
	["round"] = round,
	["remove"] = remove,
	["flags"] = flags,
	["connections"] = connections,
	["heartbeat"] = heartbeat,
	["addon_data"] = addon_data,
	["menu_references"] = menu_references,
}
