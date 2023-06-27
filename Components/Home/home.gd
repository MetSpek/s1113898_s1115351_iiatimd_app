extends Control

@onready var imageEntry = preload("res://Components/Home/imageEntry.tscn")
@onready var listEntry = preload("res://Components/Home/listEntry.tscn")
@onready var card_container = $ContentContainer/ScrollContainer/CardContainer
@onready var line_edit = $LineEdit
@onready var option_button = $OptionButton

var entryVersion

# Called when the node enters the scene tree for the first time.
func _ready():
	if GlobalHandler.current_diary_view == 'normal':
		entryVersion = imageEntry
		
	else:
		entryVersion = listEntry
		
	for entry in GlobalHandler.diary_entries:
		var card = entryVersion.instantiate()
		card.dict = entry
		card.title = entry.title
		card.date = entry.date
		
		card_container.add_child(card)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_line_edit_text_changed(new_text):
	if line_edit.text == "":
		for entry in card_container.get_children():
			entry.visible = true
	for entry in card_container.get_children():
		for letter in new_text.length():
			if entry.title[letter].to_lower() == new_text[letter].to_lower():
				entry.visible = true
			else:
				entry.visible = false
				break

func sort_recent_ascending(a, b):
	if a.id > b.id:
		return true
	return false

func sort_oldest_ascending(a, b):
	if a.id < b.id:
		return true
	return false

func _on_option_button_item_selected(index):
	if GlobalHandler.diary_entries.size() > 0:
		match index:
			0:
				GlobalHandler.diary_entries.sort_custom(sort_recent_ascending)
			1:
				GlobalHandler.diary_entries.sort_custom(sort_oldest_ascending)
				
		for entry in card_container.get_children():
			card_container.move_child(entry, GlobalHandler.diary_entries.find(entry.dict))
