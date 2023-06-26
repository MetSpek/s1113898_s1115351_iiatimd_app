extends Control

@onready var imageEntry = preload("res://Components/Home/imageEntry.tscn")
@onready var listEntry = preload("res://Components/Home/listEntry.tscn")
@onready var card_container = $ContentContainer/ScrollContainer/CardContainer

var entryVersion

# Called when the node enters the scene tree for the first time.
func _ready():
	if GlobalHandler.current_diary_view == 'normal':
		entryVersion = imageEntry
		
	else:
		entryVersion = listEntry
		
	for entry in GlobalHandler.diary_entries:
		var card = entryVersion.instantiate()
		card.title = entry.title
		card.date = entry.date
		
		card_container.add_child(card)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
