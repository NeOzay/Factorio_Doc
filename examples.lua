local test1 = [[
{
	"name":"on_init",
	"order":0,
	"description":"Register a function to be run on mod initialization. This is only called when a new save game is created or when a save file is loaded that previously didn't contain the mod. During it, the mod gets the chance to set up initial values that it will use for its lifetime. It has full access to [LuaGameScript](LuaGameScript) and the [global](global) table and can change anything about them that it deems appropriate. No other events will be raised for the mod until it has finished this step.",
	"notes":[
		"For more context, refer to the [Data Lifecycle](data-lifecycle) page."
	],
	"examples":[
	"Initialize a `players` table in `global` for later use. \n```\nscript.on_init(function()\n  global.players = {}\nend)\n```"
	]
}
]]

local test2 = [[
{
	"name":"on_event",
	"order":3,
	"description":"Register a handler to run on the specified event(s). Each mod can only register once for every event, as any additional registration will overwrite the previous one. This holds true even if different filters are used for subsequent registrations.",
	"examples":[
		"Register for the [on_tick](on_tick) event to print the current tick to console each tick. \n```\nscript.on_event(defines.events.on_tick,\nfunction(event) game.print(event.tick) end)\n```",
		"Register for the [on_built_entity](on_built_entity) event, limiting it to only be received when a `\"fast-inserter\"` is built. \n```\nscript.on_event(defines.events.on_built_entity,\nfunction(event) game.print(\"Gotta go fast!\") end,\n{{filter = \"name\", name = \"fast-inserter\"}})\n```"
	]
}
]]



return {
	test1,
	test2
}
