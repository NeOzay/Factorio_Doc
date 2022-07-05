---@generic K
---@param object K[]
---@param name string
---@return K
local function getObject(object, name)
	for index, value in ipairs(object) do
		if value.name == name then
			return value
		end
	end
end

local LuaBootstrap = getObject(data.classes, "LuaBootstrap")
local on_event = getObject(LuaBootstrap.methods, "on_event")

on_event.custom = [[---Register a handler to run on the specified event(s). Each mod can only register once for every event, as any additional registration will overwrite the previous one. This holds true even if different filters are used for subsequent registrations.
---
---Register for the [on_tick](on_tick) event to print the current tick to console each tick. 
---```lua
---script.on_event(defines.events.on_tick,
---function(event) game.print(event.tick) end)
---```
---\
---Register for the [on_built_entity](on_built_entity) event, limiting it to only be received when a `"fast-inserter"` is built. 
---```lua
---script.on_event(defines.events.on_built_entity,
---function(event) game.print("Gotta go fast!") end,
---{{filter = "name", name = "fast-inserter"}})
---```
---@generic K
---@param _event defines.events|defines.events[]|string|K @The event(s) or custom-input to invoke the handler on.
---@param _f fun(_arg1:K) @The handler for this event. Passing `nil` will unregister it.
---@param _filters? EventFilter[] @The filters for this event. Can only be used when registering for individual events.
function LuaBootstrap.on_event(_event, _f, _filters) end
]]

local LuaLazyLoadedValue = getObject(data.classes, "LuaLazyLoadedValue")
LuaLazyLoadedValue.custom = [[---A lazily loaded value. For performance reasons, we sometimes return a custom lazily-loaded value type instead of the native Lua value. This custom type lazily constructs the necessary value when [LuaLazyLoadedValue::get](LuaLazyLoadedValue::get) is called, therefore preventing its unnecessary construction in some cases.
---
---An instance of LuaLazyLoadedValue is only valid during the event it was created from and cannot be saved.
---@class LuaLazyLoadedValue<K>: {object_name:string; valid:boolean; get:fun():K; help:fun():string}
]]
