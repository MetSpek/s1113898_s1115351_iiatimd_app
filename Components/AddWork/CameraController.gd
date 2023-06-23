extends VBoxContainer

var plugin
var plugin_name = "GodotGetImage"
@onready var texture_rect = $TextureRect
@onready var title_edit = $"../DetailContainer/TitleEdit"
@onready var description_edit = $"../DetailContainer/DescriptionEdit"

func _ready():
	if Engine.has_singleton(plugin_name):
		plugin = Engine.get_singleton(plugin_name)
	else:
		print("Could not load plugin: ", plugin_name)
	if plugin:
		plugin.connect("image_request_completed", Callable(self, "_on_image_request_completed"))

func _on_image_request_completed(dict):
	for img_buffer in dict.values():
		var image = Image.new()
		
		# Use load format depending what you have set in plugin setOption()
		var error = image.load_jpg_from_buffer(img_buffer)
		#var error = image.load_png_from_buffer(img_buffer)
		
		if error != OK:
			print("Error loading png/jpg buffer, ", error)
		else:
			texture_rect.texture = ImageTexture.new().create_from_image(image)
			get_tree().call_group("AddWork", "setEntryImg", image)

func _on_camera_button_button_up():
	if plugin:
		plugin.getCameraImage()
	else:
		print(plugin_name, " plugin not loaded!")

func _on_gallery_button_button_up():
	if plugin:
		plugin.getGalleryImage()
	else:
		print(plugin_name, " plugin not loaded!")
