extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_game_controls_pressed() -> void:
	pass # Replace with function body.
	get_tree().change_scene_to_file("res://control_menu.tscn")

func _on_about_game_pressed() -> void:
	pass # Replace with function body.
	get_tree().change_scene_to_file("res://about_the_game.tscn")
	
func _on_button_pressed() -> void:
	pass # Replace with function body.
	get_tree().change_scene_to_file("res://Main_menu.tscn")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Escape"):
		get_tree().change_scene_to_file("res://Main_menu.tscn")
