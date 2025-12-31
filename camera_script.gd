extends Camera2D

@export var tilemap: TileMap

func _ready() -> void:
	if tilemap:
		# Get the used rectangle of the tilemap
		var used_rect = tilemap.get_used_rect()
		
		# Get tile size from the tileset
		var tile_size = tilemap.tile_set.tile_size
		
		# Calculate total map size in pixels
		var map_width = used_rect.size.x * tile_size.x
		var map_height = used_rect.size.y * tile_size.y
		
		# Calculate starting position (if map doesn't start at 0,0)
		var start_x = used_rect.position.x * tile_size.x
		var start_y = used_rect.position.y * tile_size.y
		
		# Set camera limits
		limit_left = start_x
		limit_top = start_y
		limit_right = start_x + map_width
		limit_bottom = start_y + map_height
		
		# Print debug info
		print("TileMap Info:")
		print("- Used Rect: ", used_rect)
		print("- Tile Size: ", tile_size)
		print("- Map Size (pixels): ", map_width, "x", map_height)
		print("- Camera Limits: ", limit_left, ",", limit_top, " to ", limit_right, ",", limit_bottom)
	else:
		push_error("TileMap not assigned to Camera2D!")
	
	# Optional: Smooth camera movement
	position_smoothing_enabled = true
	position_smoothing_speed = 5.0
	limit_smoothed = true
