tool
extends Container

##### CLASSES #####

class Cache:
	extends Reference
	
	var original_edge_color

##### SIGNALS #####

##### CONSTANTS #####

##### EXPORTS #####

export(Texture) var outer_texture = null if outer_texture else preload("res://icon.png") setget set_outer_texture
export(PackedScene) var content = null if not content else load(content).instance() setget set_content
export(float) onready var edge_margin = 0.75 setget set_edge_margin
export(Color) var edge_highlight = Color("#ffffff") setget set_edge_highlight

##### MEMBERS #####

# public

# public onready
onready var background = $Background

# private
var _cache = Cache.new()

##### NOTIFICATIONS #####

func _ready():
	set_edge_margin(edge_margin)

func _enter_tree():
	pass#call_deferred("set_edge_margin", edge_margin)

##### OVERRIDES #####

##### VIRTUALS #####

##### PUBLIC METHODS #####

##### PRIVATE METHODS #####

func _init_export_deps():
	if not background:
		background = $Background

##### CONNECTIONS #####

##### SETTERS AND GETTERS #####

func set_outer_texture(p_texture):
	outer_texture = p_texture
	if not is_inside_tree():
		return
	_init_export_deps()
	background.texture = outer_texture

func set_edge_margin(p_edge_margin):
	edge_margin = p_edge_margin
	if not is_inside_tree():
		return
	_init_export_deps()
	#inner_tex_rect.rect_position = background.rect_size * (1 - edge_margin) * 0.5
	#inner_tex_rect.rect_min_size = background.rect_size * edge_margin

func set_edge_highlight(p_edge_highlight):
	edge_highlight = p_edge_highlight

func set_content(p_content):
	content = p_content

