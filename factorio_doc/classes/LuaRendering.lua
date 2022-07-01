---@meta

---Allows rendering of geometric shapes, text and sprites in the game world. Each render object is identified by an id that is universally unique for the lifetime of a whole game.
---
---If an entity target of an object is destroyed or changes surface, then the object is also destroyed.
---@class LuaRendering
---@field object_name string @This object's name.`[R]`
local LuaRendering = {}

---Reorder this object so that it is drawn in front of the already existing objects.
---@param id uint64
function LuaRendering.bring_to_front(id) end

---Destroys all render objects.
---@param mod_name? string @If provided, only the render objects created by this mod are destroyed.
function LuaRendering.clear(mod_name) end

---Destroy the object with the given id.
---@param id uint64
function LuaRendering.destroy(id) end

---Create an animation.
---@param animation string @Name of an [animation prototype](https://wiki.factorio.com/Prototype/Animation).
---@param animation_offset? double @Offset of the animation in frames. Default is 0.
---@param animation_speed? double @How many frames the animation goes forward per tick. Default is 1.
---@param forces? ForceIdentification[] @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
---@param only_in_alt_mode? boolean @If this should only be rendered in alt mode. Defaults to false.
---@param orientation? RealOrientation @The orientation of the animation. Default is 0.
---@param orientation_target? MapPosition|LuaEntity @If given, the animation rotates so that it faces this target. Note that `orientation` is still applied to the animation.
---@param orientation_target_offset? Vector @Only used if `orientation_target` is a LuaEntity.
---@param oriented_offset? Vector @Offsets the center of the animation if `orientation_target` is given. This offset will rotate together with the animation.
---@param players? PlayerIdentification[] @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
---@param render_layer? RenderLayer
---@param surface SurfaceIdentification
---@param target MapPosition|LuaEntity @Center of the animation.
---@param target_offset? Vector @Only used if `target` is a LuaEntity.
---@param time_to_live? uint @In ticks. Defaults to living forever.
---@param tint? Color
---@param visible? boolean @If this is rendered to anyone at all. Defaults to true.
---@param x_scale? double @Horizontal scale of the animation. Default is 1.
---@param y_scale? double @Vertical scale of the animation. Default is 1.
---@return uint64 @Id of the render object
function LuaRendering.draw_animation(animation, animation_offset, animation_speed, forces, only_in_alt_mode, orientation, orientation_target, orientation_target_offset, oriented_offset, players, render_layer, surface, target, target_offset, time_to_live, tint, visible, x_scale, y_scale) end

---Create an arc.
---@param angle float @The angle of the arc, in radian.
---@param color Color
---@param draw_on_ground? boolean @If this should be drawn below sprites and entities.
---@param forces? ForceIdentification[] @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
---@param max_radius double @The radius of the outer edge of the arc, in tiles.
---@param min_radius double @The radius of the inner edge of the arc, in tiles.
---@param only_in_alt_mode? boolean @If this should only be rendered in alt mode. Defaults to false.
---@param players? PlayerIdentification[] @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
---@param start_angle float @Where the arc starts, in radian.
---@param surface SurfaceIdentification
---@param target MapPosition|LuaEntity
---@param target_offset? Vector @Only used if `target` is a LuaEntity.
---@param time_to_live? uint @In ticks. Defaults to living forever.
---@param visible? boolean @If this is rendered to anyone at all. Defaults to true.
---@return uint64 @Id of the render object
function LuaRendering.draw_arc(angle, color, draw_on_ground, forces, max_radius, min_radius, only_in_alt_mode, players, start_angle, surface, target, target_offset, time_to_live, visible) end

---Create a circle.
---@param color Color
---@param draw_on_ground? boolean @If this should be drawn below sprites and entities.
---@param filled boolean @If the circle should be filled.
---@param forces? ForceIdentification[] @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
---@param only_in_alt_mode? boolean @If this should only be rendered in alt mode. Defaults to false.
---@param players? PlayerIdentification[] @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
---@param radius double @In tiles.
---@param surface SurfaceIdentification
---@param target MapPosition|LuaEntity
---@param target_offset? Vector @Only used if `target` is a LuaEntity.
---@param time_to_live? uint @In ticks. Defaults to living forever.
---@param visible? boolean @If this is rendered to anyone at all. Defaults to true.
---@param width? float @Width of the outline, used only if filled = false. Value is in pixels (32 per tile).
---@return uint64 @Id of the render object
function LuaRendering.draw_circle(color, draw_on_ground, filled, forces, only_in_alt_mode, players, radius, surface, target, target_offset, time_to_live, visible, width) end

---Create a light.
---
---The base game uses the utility sprites `light_medium` and `light_small` for lights.
---@param color? Color @Defaults to white (no tint).
---@param forces? ForceIdentification[] @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
---@param intensity? float @Default is 1.
---@param minimum_darkness? float @The minimum darkness at which this light is rendered. Default is 0.
---@param only_in_alt_mode? boolean @If this should only be rendered in alt mode. Defaults to false.
---@param orientation? RealOrientation @The orientation of the light. Default is 0.
---@param oriented? boolean @If this light has the same orientation as the entity target, default is false. Note that `orientation` is still applied to the sprite.
---@param players? PlayerIdentification[] @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
---@param scale? float @Default is 1.
---@param sprite SpritePath
---@param surface SurfaceIdentification
---@param target MapPosition|LuaEntity @Center of the light.
---@param target_offset? Vector @Only used if `target` is a LuaEntity.
---@param time_to_live? uint @In ticks. Defaults to living forever.
---@param visible? boolean @If this is rendered to anyone at all. Defaults to true.
---@return uint64 @Id of the render object
function LuaRendering.draw_light(color, forces, intensity, minimum_darkness, only_in_alt_mode, orientation, oriented, players, scale, sprite, surface, target, target_offset, time_to_live, visible) end

---Create a line.
---
---Draw a white and 2 pixel wide line from {0, 0} to {2, 2}. 
---```lua
---rendering.draw_line{surface = game.player.surface, from = {0, 0}, to = {2, 2}, color = {1, 1, 1}, width = 2}
---```
---\
---Draw a red and 3 pixel wide line from {0, 0} to {0, 5}. The line has 1 tile long dashes and gaps. 
---```lua
---rendering.draw_line{surface = game.player.surface, from = {0, 0}, to = {0, 5}, color = {r = 1}, width = 3, gap_length = 1, dash_length = 1}
---```
---@param color Color
---@param dash_length? double @Length of the dashes that this line has. Used only if gap_length > 0. Default is 0.
---@param draw_on_ground? boolean @If this should be drawn below sprites and entities.
---@param forces? ForceIdentification[] @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
---@param from MapPosition|LuaEntity
---@param from_offset? Vector @Only used if `from` is a LuaEntity.
---@param gap_length? double @Length of the gaps that this line has, in tiles. Default is 0.
---@param only_in_alt_mode? boolean @If this should only be rendered in alt mode. Defaults to false.
---@param players? PlayerIdentification[] @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
---@param surface SurfaceIdentification
---@param time_to_live? uint @In ticks. Defaults to living forever.
---@param to MapPosition|LuaEntity
---@param to_offset? Vector @Only used if `to` is a LuaEntity.
---@param visible? boolean @If this is rendered to anyone at all. Defaults to true.
---@param width float @In pixels (32 per tile).
---@return uint64 @Id of the render object
function LuaRendering.draw_line(color, dash_length, draw_on_ground, forces, from, from_offset, gap_length, only_in_alt_mode, players, surface, time_to_live, to, to_offset, visible, width) end

---Create a triangle mesh defined by a triangle strip.
---@param color Color
---@param draw_on_ground? boolean @If this should be drawn below sprites and entities.
---@param forces? ForceIdentification[] @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
---@param only_in_alt_mode? boolean @If this should only be rendered in alt mode. Defaults to false.
---@param orientation? RealOrientation @The orientation applied to all vertices. Default is 0.
---@param orientation_target? MapPosition|LuaEntity @If given, the vertices (that are not set to an entity) rotate so that it faces this target. Note that `orientation` is still applied.
---@param orientation_target_offset? Vector @Only used if `orientation_target` is a LuaEntity.
---@param players? PlayerIdentification[] @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
---@param surface SurfaceIdentification
---@param target? MapPosition|LuaEntity @Acts like an offset applied to all vertices that are not set to an entity.
---@param target_offset? Vector @Only used if `target` is a LuaEntity.
---@param time_to_live? uint @In ticks. Defaults to living forever.
---@param vertices ScriptRenderVertexTarget[]
---@param visible? boolean @If this is rendered to anyone at all. Defaults to true.
---@return uint64 @Id of the render object
function LuaRendering.draw_polygon(color, draw_on_ground, forces, only_in_alt_mode, orientation, orientation_target, orientation_target_offset, players, surface, target, target_offset, time_to_live, vertices, visible) end

---Create a rectangle.
---@param color Color
---@param draw_on_ground? boolean @If this should be drawn below sprites and entities.
---@param filled boolean @If the rectangle should be filled.
---@param forces? ForceIdentification[] @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
---@param left_top MapPosition|LuaEntity
---@param left_top_offset? Vector @Only used if `left_top` is a LuaEntity.
---@param only_in_alt_mode? boolean @If this should only be rendered in alt mode. Defaults to false.
---@param players? PlayerIdentification[] @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
---@param right_bottom MapPosition|LuaEntity
---@param right_bottom_offset? Vector @Only used if `right_bottom` is a LuaEntity.
---@param surface SurfaceIdentification
---@param time_to_live? uint @In ticks. Defaults to living forever.
---@param visible? boolean @If this is rendered to anyone at all. Defaults to true.
---@param width? float @Width of the outline, used only if filled = false. Value is in pixels (32 per tile).
---@return uint64 @Id of the render object
function LuaRendering.draw_rectangle(color, draw_on_ground, filled, forces, left_top, left_top_offset, only_in_alt_mode, players, right_bottom, right_bottom_offset, surface, time_to_live, visible, width) end

---Create a sprite.
---
---This will draw an iron plate icon at the character's feet. The sprite will move together with the character. 
---```lua
---rendering.draw_sprite{sprite = "item.iron-plate", target = game.player.character, surface = game.player.surface}
---```
---\
---This will draw an iron plate icon at the character's head. The sprite will move together with the character. 
---```lua
---rendering.draw_sprite{sprite = "item.iron-plate", target = game.player.character, target_offset = {0, -2}, surface = game.player.surface}
---```
---@param forces? ForceIdentification[] @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
---@param only_in_alt_mode? boolean @If this should only be rendered in alt mode. Defaults to false.
---@param orientation? RealOrientation @The orientation of the sprite. Default is 0.
---@param orientation_target? MapPosition|LuaEntity @If given, the sprite rotates so that it faces this target. Note that `orientation` is still applied to the sprite.
---@param orientation_target_offset? Vector @Only used if `orientation_target` is a LuaEntity.
---@param oriented_offset? Vector @Offsets the center of the sprite if `orientation_target` is given. This offset will rotate together with the sprite.
---@param players? PlayerIdentification[] @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
---@param render_layer? RenderLayer
---@param sprite SpritePath
---@param surface SurfaceIdentification
---@param target MapPosition|LuaEntity @Center of the sprite.
---@param target_offset? Vector @Only used if `target` is a LuaEntity.
---@param time_to_live? uint @In ticks. Defaults to living forever.
---@param tint? Color
---@param visible? boolean @If this is rendered to anyone at all. Defaults to true.
---@param x_scale? double @Horizontal scale of the sprite. Default is 1.
---@param y_scale? double @Vertical scale of the sprite. Default is 1.
---@return uint64 @Id of the render object
function LuaRendering.draw_sprite(forces, only_in_alt_mode, orientation, orientation_target, orientation_target_offset, oriented_offset, players, render_layer, sprite, surface, target, target_offset, time_to_live, tint, visible, x_scale, y_scale) end

---Create a text.
---
---Not all fonts support scaling.
---@param alignment? string @Defaults to "left". Other options are "right" and "center".
---@param color Color
---@param draw_on_ground? boolean @If this should be drawn below sprites and entities.
---@param font? string @Name of font to use. Defaults to the same font as flying-text.
---@param forces? ForceIdentification[] @The forces that this object is rendered to. Passing `nil` or an empty table will render it to all forces.
---@param only_in_alt_mode? boolean @If this should only be rendered in alt mode. Defaults to false.
---@param orientation? RealOrientation @The orientation of the text. Default is 0.
---@param players? PlayerIdentification[] @The players that this object is rendered to. Passing `nil` or an empty table will render it to all players.
---@param scale? double
---@param scale_with_zoom? boolean @Defaults to false. If true, the text scales with player zoom, resulting in it always being the same size on screen, and the size compared to the game world changes.
---@param surface SurfaceIdentification
---@param target MapPosition|LuaEntity
---@param target_offset? Vector @Only used if `target` is a LuaEntity.
---@param text LocalisedString @The text to display.
---@param time_to_live? uint @In ticks. Defaults to living forever.
---@param vertical_alignment? string @Defaults to "top". Other options are "middle", "baseline" and "bottom".
---@param visible? boolean @If this is rendered to anyone at all. Defaults to true.
---@return uint64 @Id of the render object
function LuaRendering.draw_text(alignment, color, draw_on_ground, font, forces, only_in_alt_mode, orientation, players, scale, scale_with_zoom, surface, target, target_offset, text, time_to_live, vertical_alignment, visible) end

---Get the alignment of the text with this id.
---@param id uint64
---@return string @`nil` if the object is not a text.
function LuaRendering.get_alignment(id) end

---Gets an array of all valid object ids.
---@param mod_name? string @If provided, get only the render objects created by this mod.
---@return uint64[]
function LuaRendering.get_all_ids(mod_name) end

---Get the angle of the arc with this id.
---@param id uint64
---@return float @Angle in radian. `nil` if the object is not a arc.
function LuaRendering.get_angle(id) end

---Get the animation prototype name of the animation with this id.
---@param id uint64
---@return string @`nil` if the object is not an animation.
function LuaRendering.get_animation(id) end

---Get the animation offset of the animation with this id.
---@param id uint64
---@return double @Animation offset in frames. `nil` if the object is not an animation.
function LuaRendering.get_animation_offset(id) end

---Get the animation speed of the animation with this id.
---@param id uint64
---@return double @Animation speed in frames per tick. `nil` if the object is not an animation.
function LuaRendering.get_animation_speed(id) end

---Get the color or tint of the object with this id.
---@param id uint64
---@return Color @`nil` if the object does not support color.
function LuaRendering.get_color(id) end

---Get the dash length of the line with this id.
---@param id uint64
---@return double @`nil` if the object is not a line.
function LuaRendering.get_dash_length(id) end

---Get whether this is being drawn on the ground, under most entities and sprites.
---@param id uint64
---@return boolean
function LuaRendering.get_draw_on_ground(id) end

---Get if the circle or rectangle with this id is filled.
---@param id uint64
---@return boolean @`nil` if the object is not a circle or rectangle.
function LuaRendering.get_filled(id) end

---Get the font of the text with this id.
---@param id uint64
---@return string @`nil` if the object is not a text.
function LuaRendering.get_font(id) end

---Get the forces that the object with this id is rendered to or `nil` if visible to all forces.
---@param id uint64
---@return LuaForce[]
function LuaRendering.get_forces(id) end

---Get from where the line with this id is drawn.
---@param id uint64
---@return ScriptRenderTarget @`nil` if this object is not a line.
function LuaRendering.get_from(id) end

---Get the length of the gaps in the line with this id.
---@param id uint64
---@return double @`nil` if the object is not a line.
function LuaRendering.get_gap_length(id) end

---Get the intensity of the light with this id.
---@param id uint64
---@return float @`nil` if the object is not a light.
function LuaRendering.get_intensity(id) end

---Get where top left corner of the rectangle with this id is drawn.
---@param id uint64
---@return ScriptRenderTarget @`nil` if the object is not a rectangle.
function LuaRendering.get_left_top(id) end

---Get the radius of the outer edge of the arc with this id.
---@param id uint64
---@return double @`nil` if the object is not a arc.
function LuaRendering.get_max_radius(id) end

---Get the radius of the inner edge of the arc with this id.
---@param id uint64
---@return double @`nil` if the object is not a arc.
function LuaRendering.get_min_radius(id) end

---Get the minimum darkness at which the light with this id is rendered.
---@param id uint64
---@return float @`nil` if the object is not a light.
function LuaRendering.get_minimum_darkness(id) end

---Get whether this is only rendered in alt-mode.
---@param id uint64
---@return boolean
function LuaRendering.get_only_in_alt_mode(id) end

---Get the orientation of the object with this id.
---
---Polygon vertices that are set to an entity will ignore this.
---@param id uint64
---@return RealOrientation @`nil` if the object is not a text, polygon, sprite, light or animation.
function LuaRendering.get_orientation(id) end

---The object rotates so that it faces this target. Note that `orientation` is still applied to the object. Get the orientation_target of the object with this id.
---
---Polygon vertices that are set to an entity will ignore this.
---@param id uint64
---@return ScriptRenderTarget @`nil` if no target or if this object is not a polygon, sprite, or animation.
function LuaRendering.get_orientation_target(id) end

---Get if the light with this id is rendered has the same orientation as the target entity. Note that `orientation` is still applied to the sprite.
---@param id uint64
---@return boolean @`nil` if the object is not a light.
function LuaRendering.get_oriented(id) end

---Offsets the center of the sprite or animation if `orientation_target` is given. This offset will rotate together with the sprite or animation. Get the oriented_offset of the sprite or animation with this id.
---@param id uint64
---@return Vector @`nil` if this object is not a sprite or animation.
function LuaRendering.get_oriented_offset(id) end

---Get the players that the object with this id is rendered to or `nil` if visible to all players.
---@param id uint64
---@return LuaPlayer[]
function LuaRendering.get_players(id) end

---Get the radius of the circle with this id.
---@param id uint64
---@return double @`nil` if the object is not a circle.
function LuaRendering.get_radius(id) end

---Get the render layer of the sprite or animation with this id.
---@param id uint64
---@return RenderLayer @`nil` if the object is not a sprite or animation.
function LuaRendering.get_render_layer(id) end

---Get where bottom right corner of the rectangle with this id is drawn.
---@param id uint64
---@return ScriptRenderTarget @`nil` if the object is not a rectangle.
function LuaRendering.get_right_bottom(id) end

---Get the scale of the text or light with this id.
---@param id uint64
---@return double @`nil` if the object is not a text or light.
function LuaRendering.get_scale(id) end

---Get if the text with this id scales with player zoom.
---@param id uint64
---@return boolean @`nil` if the object is not a text.
function LuaRendering.get_scale_with_zoom(id) end

---Get the sprite of the sprite or light with this id.
---@param id uint64
---@return SpritePath @`nil` if the object is not a sprite or light.
function LuaRendering.get_sprite(id) end

---Get where the arc with this id starts.
---@param id uint64
---@return float @Angle in radian. `nil` if the object is not a arc.
function LuaRendering.get_start_angle(id) end

---The surface the object with this id is rendered on.
---@param id uint64
---@return LuaSurface
function LuaRendering.get_surface(id) end

---Get where the object with this id is drawn.
---
---Polygon vertices that are set to an entity will ignore this.
---@param id uint64
---@return ScriptRenderTarget @`nil` if the object does not support target.
function LuaRendering.get_target(id) end

---Get the text that is displayed by the text with this id.
---@param id uint64
---@return LocalisedString @`nil` if the object is not a text.
function LuaRendering.get_text(id) end

---Get the time to live of the object with this id. This will be 0 if the object does not expire.
---@param id uint64
---@return uint
function LuaRendering.get_time_to_live(id) end

---Get where the line with this id is drawn to.
---@param id uint64
---@return ScriptRenderTarget @`nil` if the object is not a line.
function LuaRendering.get_to(id) end

---Gets the type of the given object. The types are "text", "line", "circle", "rectangle", "arc", "polygon", "sprite", "light" and "animation".
---@param id uint64
---@return string
function LuaRendering.get_type(id) end

---Get the vertical alignment of the text with this id.
---@param id uint64
---@return string @`nil` if the object is not a text.
function LuaRendering.get_vertical_alignment(id) end

---Get the vertices of the polygon with this id.
---@param id uint64
---@return ScriptRenderTarget[] @`nil` if the object is not a polygon.
function LuaRendering.get_vertices(id) end

---Get whether this is rendered to anyone at all.
---@param id uint64
---@return boolean
function LuaRendering.get_visible(id) end

---Get the width of the object with this id. Value is in pixels (32 per tile).
---@param id uint64
---@return float @`nil` if the object does not support width.
function LuaRendering.get_width(id) end

---Get the horizontal scale of the sprite or animation with this id.
---@param id uint64
---@return double @`nil` if the object is not a sprite or animation.
function LuaRendering.get_x_scale(id) end

---Get the vertical scale of the sprite or animation with this id.
---@param id uint64
---@return double @`nil` if the object is not a sprite or animation.
function LuaRendering.get_y_scale(id) end

---Does a font with this name exist?
---@param font_name string
---@return boolean
function LuaRendering.is_font_valid(font_name) end

---Does a valid object with this id exist?
---@param id uint64
---@return boolean
function LuaRendering.is_valid(id) end

---Set the alignment of the text with this id. Does nothing if this object is not a text.
---@param alignment string @"left", "right" or "center".
---@param id uint64
function LuaRendering.set_alignment(alignment, id) end

---Set the angle of the arc with this id. Does nothing if this object is not a arc.
---@param angle float @angle in radian
---@param id uint64
function LuaRendering.set_angle(angle, id) end

---Set the animation prototype name of the animation with this id. Does nothing if this object is not an animation.
---@param animation string
---@param id uint64
function LuaRendering.set_animation(animation, id) end

---Set the animation offset of the animation with this id. Does nothing if this object is not an animation.
---@param animation_offset double @Animation offset in frames.
---@param id uint64
function LuaRendering.set_animation_offset(animation_offset, id) end

---Set the animation speed of the animation with this id. Does nothing if this object is not an animation.
---@param animation_speed double @Animation speed in frames per tick.
---@param id uint64
function LuaRendering.set_animation_speed(animation_speed, id) end

---Set the color or tint of the object with this id. Does nothing if this object does not support color.
---@param color Color
---@param id uint64
function LuaRendering.set_color(color, id) end

---Set the corners of the rectangle with this id. Does nothing if this object is not a rectangle.
---@param id uint64
---@param left_top MapPosition|LuaEntity
---@param left_top_offset Vector
---@param right_bottom MapPosition|LuaEntity
---@param right_bottom_offset Vector
function LuaRendering.set_corners(id, left_top, left_top_offset, right_bottom, right_bottom_offset) end

---Set the dash length of the line with this id. Does nothing if this object is not a line.
---@param dash_length double
---@param id uint64
function LuaRendering.set_dash_length(dash_length, id) end

---Set the length of the dashes and the length of the gaps in the line with this id. Does nothing if this object is not a line.
---@param dash_length double
---@param gap_length double
---@param id uint64
function LuaRendering.set_dashes(dash_length, gap_length, id) end

---Set whether this is being drawn on the ground, under most entities and sprites.
---@param draw_on_ground boolean
---@param id uint64
function LuaRendering.set_draw_on_ground(draw_on_ground, id) end

---Set if the circle or rectangle with this id is filled. Does nothing if this object is not a circle or rectangle.
---@param filled boolean
---@param id uint64
function LuaRendering.set_filled(filled, id) end

---Set the font of the text with this id. Does nothing if this object is not a text.
---@param font string
---@param id uint64
function LuaRendering.set_font(font, id) end

---Set the forces that the object with this id is rendered to.
---@param forces ForceIdentification[] @Providing an empty array will set the object to be visible to all forces.
---@param id uint64
function LuaRendering.set_forces(forces, id) end

---Set from where the line with this id is drawn. Does nothing if the object is not a line.
---@param from MapPosition|LuaEntity
---@param from_offset? Vector
---@param id uint64
function LuaRendering.set_from(from, from_offset, id) end

---Set the length of the gaps in the line with this id. Does nothing if this object is not a line.
---@param gap_length double
---@param id uint64
function LuaRendering.set_gap_length(gap_length, id) end

---Set the intensity of the light with this id. Does nothing if this object is not a light.
---@param id uint64
---@param intensity float
function LuaRendering.set_intensity(id, intensity) end

---Set where top left corner of the rectangle with this id is drawn. Does nothing if this object is not a rectangle.
---@param id uint64
---@param left_top MapPosition|LuaEntity
---@param left_top_offset? Vector
function LuaRendering.set_left_top(id, left_top, left_top_offset) end

---Set the radius of the outer edge of the arc with this id. Does nothing if this object is not a arc.
---@param id uint64
---@param max_radius double
function LuaRendering.set_max_radius(id, max_radius) end

---Set the radius of the inner edge of the arc with this id. Does nothing if this object is not a arc.
---@param id uint64
---@param min_radius double
function LuaRendering.set_min_radius(id, min_radius) end

---Set the minimum darkness at which the light with this id is rendered. Does nothing if this object is not a light.
---@param id uint64
---@param minimum_darkness float
function LuaRendering.set_minimum_darkness(id, minimum_darkness) end

---Set whether this is only rendered in alt-mode.
---@param id uint64
---@param only_in_alt_mode boolean
function LuaRendering.set_only_in_alt_mode(id, only_in_alt_mode) end

---Set the orientation of the object with this id. Does nothing if this object is not a text, polygon, sprite, light or animation.
---
---Polygon vertices that are set to an entity will ignore this.
---@param id uint64
---@param orientation RealOrientation
function LuaRendering.set_orientation(id, orientation) end

---The object rotates so that it faces this target. Note that `orientation` is still applied to the object. Set the orientation_target of the object with this id. Does nothing if this object is not a polygon, sprite, or animation. Set to `nil` if the object should not have an orientation_target.
---
---Polygon vertices that are set to an entity will ignore this.
---@param id uint64
---@param orientation_target MapPosition|LuaEntity
---@param orientation_target_offset? Vector
function LuaRendering.set_orientation_target(id, orientation_target, orientation_target_offset) end

---Set if the light with this id is rendered has the same orientation as the target entity. Does nothing if this object is not a light. Note that `orientation` is still applied to the sprite.
---@param id uint64
---@param oriented boolean
function LuaRendering.set_oriented(id, oriented) end

---Offsets the center of the sprite or animation if `orientation_target` is given. This offset will rotate together with the sprite or animation. Set the oriented_offset of the sprite or animation with this id. Does nothing if this object is not a sprite or animation.
---@param id uint64
---@param oriented_offset Vector
function LuaRendering.set_oriented_offset(id, oriented_offset) end

---Set the players that the object with this id is rendered to.
---@param id uint64
---@param players PlayerIdentification[] @Providing an empty array will set the object to be visible to all players.
function LuaRendering.set_players(id, players) end

---Set the radius of the circle with this id. Does nothing if this object is not a circle.
---@param id uint64
---@param radius double
function LuaRendering.set_radius(id, radius) end

---Set the render layer of the sprite or animation with this id. Does nothing if this object is not a sprite or animation.
---@param id uint64
---@param render_layer RenderLayer
function LuaRendering.set_render_layer(id, render_layer) end

---Set where top bottom right of the rectangle with this id is drawn. Does nothing if this object is not a rectangle.
---@param id uint64
---@param right_bottom MapPosition|LuaEntity
---@param right_bottom_offset? Vector
function LuaRendering.set_right_bottom(id, right_bottom, right_bottom_offset) end

---Set the scale of the text or light with this id. Does nothing if this object is not a text or light.
---@param id uint64
---@param scale double
function LuaRendering.set_scale(id, scale) end

---Set if the text with this id scales with player zoom, resulting in it always being the same size on screen, and the size compared to the game world changes. Does nothing if this object is not a text.
---@param id uint64
---@param scale_with_zoom boolean
function LuaRendering.set_scale_with_zoom(id, scale_with_zoom) end

---Set the sprite of the sprite or light with this id. Does nothing if this object is not a sprite or light.
---@param id uint64
---@param sprite SpritePath
function LuaRendering.set_sprite(id, sprite) end

---Set where the arc with this id starts. Does nothing if this object is not a arc.
---@param id uint64
---@param start_angle float @angle in radian
function LuaRendering.set_start_angle(id, start_angle) end

---Set where the object with this id is drawn. Does nothing if this object does not support target.
---
---Polygon vertices that are set to an entity will ignore this.
---@param id uint64
---@param target MapPosition|LuaEntity
---@param target_offset? Vector
function LuaRendering.set_target(id, target, target_offset) end

---Set the text that is displayed by the text with this id. Does nothing if this object is not a text.
---@param id uint64
---@param text LocalisedString
function LuaRendering.set_text(id, text) end

---Set the time to live of the object with this id. Set to 0 if the object should not expire.
---@param id uint64
---@param time_to_live uint
function LuaRendering.set_time_to_live(id, time_to_live) end

---Set where the line with this id is drawn to. Does nothing if this object is not a line.
---@param id uint64
---@param to MapPosition|LuaEntity
---@param to_offset? Vector
function LuaRendering.set_to(id, to, to_offset) end

---Set the vertical alignment of the text with this id. Does nothing if this object is not a text.
---@param alignment string @"top", "middle", "baseline" or "bottom"
---@param id uint64
function LuaRendering.set_vertical_alignment(alignment, id) end

---Set the vertices of the polygon with this id. Does nothing if this object is not a polygon.
---@param id uint64
---@param vertices ScriptRenderVertexTarget[]
function LuaRendering.set_vertices(id, vertices) end

---Set whether this is rendered to anyone at all.
---@param id uint64
---@param visible boolean
function LuaRendering.set_visible(id, visible) end

---Set the width of the object with this id. Does nothing if this object does not support width. Value is in pixels (32 per tile).
---@param id uint64
---@param width float
function LuaRendering.set_width(id, width) end

---Set the horizontal scale of the sprite or animation with this id. Does nothing if this object is not a sprite or animation.
---@param id uint64
---@param x_scale double
function LuaRendering.set_x_scale(id, x_scale) end

---Set the vertical scale of the sprite or animation with this id. Does nothing if this object is not a sprite or animation.
---@param id uint64
---@param y_scale double
function LuaRendering.set_y_scale(id, y_scale) end

