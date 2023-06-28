extends Control

@onready var imageFrame = $ScrollContainer/ContentContainer/ImageSection/ImageContainer/Image
@onready var titleLabel = $ScrollContainer/ContentContainer/ImageSection/ImageContainer/Information/Title
@onready var dateLabel = $ScrollContainer/ContentContainer/ImageSection/ImageContainer/Information/DateContainer/Date
@onready var label_container = $ScrollContainer/ContentContainer/LabelContainer
@onready var descLabel = $ScrollContainer/ContentContainer/DescriptionSection/DescriptionContainer/Description
@onready var popup = $Popup

var home = "res://Components/Home/home.tscn"

var entry
var labelText = ''

# Called when the node enters the scene tree for the first time.
func _ready():
	entry = GlobalHandler.selected_entry
	titleLabel.text = entry.title
	dateLabel.text = entry.date
	descLabel.text = entry.desc

	# Loading all labels with '#' in front of each label
	for label in entry.labels:
		labelText = labelText + '#' + label + '  '
	label_container.text = labelText

# Showing popup for deletion of entry
func _on_button_button_up():
	popup.show()

# Checking if entry exists, deletes afterwards and leads you back to Home
func _on_delete_button_up():
	for savedEntry in GlobalHandler.diary_entries:
		if savedEntry.id == entry.id:
			if GlobalHandler.diary_entries.find(savedEntry) >= 0:
				GlobalHandler.diary_entries.remove_at(GlobalHandler.diary_entries.find(savedEntry))
	GlobalHandler.saveData()
	get_tree().change_scene_to_file(home)

# Hiding popup again
func _on_cancel_button_up():
	popup.hide()
