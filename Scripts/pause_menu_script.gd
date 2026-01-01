extends Control

func _ready() -> void:
	get_tree().paused = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	hide()


func _process(delta: float) -> void:
	# This function is not necessary for the pause menu logic, so we can leave it empty
	pass
	
func resume():
	# 1. Unpause the game
	get_tree().paused = false
	
	# 2. Capture the mouse for in-game interaction
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	# 3. Hide the menu itself
	hide()
	
func pause():
	# 1. Pause the game
	get_tree().paused = true
	
	# 2. Make the mouse cursor visible for menu interaction
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	# 3. Show the menu itself
	show()

func _unhandled_input(event):
	# Check for the "Escape" key press
	if event.is_action_pressed("Escape"):
		# If the game is paused, unpause/resume
		if get_tree().paused:
			resume()
		# If the game is not paused, pause
		else:
			pause()
		# Prevents the input event from propagating further in the engine
		get_viewport().set_input_as_handled()

# --- Button Handlers ---

func _on_resume_button_pressed() -> void:
	resume()
	
func _on_restart_button_pressed() -> void:
	resume()
	get_tree().reload_current_scene()

func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false  # Unpause the game
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE  # Show cursor for main menu
	get_tree().change_scene_to_file("res://Main_menu.tscn")
