extends Control

@onready var imageEntry = preload("res://Components/Home/imageEntry.tscn")
@onready var listEntry = preload("res://Components/Home/listEntry.tscn")
@onready var card_container = $ContentContainer/ScrollContainer/CardContainer
@onready var line_edit = $LineEdit
@onready var option_button = $OptionButton

var entryVersion

# Called when the node enters the scene tree for the first time.
func _ready():
	# checking which entryversion should be shown
	if GlobalHandler.current_diary_view == 'normal':
		entryVersion = imageEntry
		
	else:
		entryVersion = listEntry
		
	# for each entry, make a card in home
	for entry in GlobalHandler.diary_entries:
		var card = entryVersion.instantiate()
		card.dict = entry
		card.title = entry.title
		card.date = entry.date
		
		card_container.add_child(card)

# searchbar on change update which cards are shown
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

# descending sort
func sort_descending(a, b):
	if a.id > b.id:
		return true
	return false

# ascending sort
func sort_ascending(a, b):
	if a.id < b.id:
		return true
	return false

# filter on date (descending and ascending)
func _on_option_button_item_selected(index):
	if GlobalHandler.diary_entries.size() > 0:
		match index:
			0:
				GlobalHandler.diary_entries.sort_custom(sort_descending)
			1:
				GlobalHandler.diary_entries.sort_custom(sort_ascending)
				
		for entry in card_container.get_children():
			card_container.move_child(entry, GlobalHandler.diary_entries.find(entry.dict))
