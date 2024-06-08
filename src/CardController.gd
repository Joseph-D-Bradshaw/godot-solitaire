class_name CardController extends Area2D

signal grabbed
signal dropped

var can_grab := true
var should_return_to_position = true
var on_click_type: MouseButton = MOUSE_BUTTON_LEFT
@onready var return_position = position

var grab_offset: Vector2

var is_grabbed := false:
	set(value):
		is_grabbed = value
		if is_grabbed:
			grabbed.emit()
			grab_offset = get_global_mouse_position() - self.global_position
		else:
			dropped.emit()
			if should_return_to_position:
				position = return_position

func _ready() -> void:
	input_event.connect(_on_input_event)

func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(on_click_type) and is_grabbed and can_grab:
		position = get_global_mouse_position() - grab_offset
	if not Input.is_mouse_button_pressed(on_click_type) and is_grabbed:
		is_grabbed = false

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and can_grab:
		is_grabbed = event.is_pressed()
