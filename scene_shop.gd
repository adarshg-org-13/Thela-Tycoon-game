extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Show the mouse cursor and make it visible
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_esc_pressed() -> void:
	get_tree().change_scene_to_file("res://main_shops.tscn")

func _on_esc_ms_pressed() -> void:
	get_tree().change_scene_to_file("res://main_shops.tscn")

func _on_esc_ws_pressed() -> void:
	get_tree().change_scene_to_file("res://main_shops.tscn")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Escape"):
		get_tree().change_scene_to_file("res://main_shops.tscn")
