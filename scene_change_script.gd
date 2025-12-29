extends Area2D

# Export variable so you can set the target scene in the editor
@export_file("*.tscn") var target_scene: String

var player_in_area = false

func _ready():
	# Connect signals
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(_delta):
	# Check if player is in area and presses E
	if player_in_area and Input.is_action_just_pressed("Interact"):
		change_scene()

func _on_body_entered(body):
	# Check if the body that entered is the player
	if body.is_in_group("player"):
		player_in_area = true
		# Optional: Show a prompt to the player
		print("Press E to enter")

func _on_body_exited(body):
	# Check if the body that exited is the player
	if body.is_in_group("player"):
		player_in_area = false
		print("Left the area")

func change_scene():
	if target_scene != "":
		get_tree().change_scene_to_file(target_scene)
	else:
		print("No target scene set!")
