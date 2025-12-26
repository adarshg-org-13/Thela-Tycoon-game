extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# 1. Ensure the game is unpaused when the scene starts
	get_tree().paused = false
	
	# 2. Ensure the mouse is captured for gameplay
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	# 3. Ensure the pause menu is hidden when the scene starts
	hide()


func _process(delta: float) -> void:
	# This function is not necessary for the pause menu logic, so we can leave it empty
	pass
	
# --- State Management Functions ---

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

# --- Input Handler ---

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
	# Simply calls the resume function
	resume()
	
func _on_restart_button_pressed() -> void:
	# 1. Unpause the game
	resume()
	# 2. Reload the current scene
	get_tree().reload_current_scene()

func _on_main_menu_button_pressed() -> void:
	# You might not need 'resume()' here, as changing the scene will unpause the game tree.
	# However, it doesn't hurt.
	# get_tree().paused = false 
	get_tree().change_scene_to_file("res://Main_menu.tscn")
