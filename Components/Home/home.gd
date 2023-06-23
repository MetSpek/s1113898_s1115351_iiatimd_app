extends Control

@onready var imageEntry = preload("res://Components/Home/imageEntry.tscn")
@onready var card_container = $ContentContainer/ScrollContainer/CardContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	for entry in GlobalHandler.diary_entries:
		var card = imageEntry.instantiate()
		card.title = entry.title
		card.date = entry.date
		
		card_container.add_child(card)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
