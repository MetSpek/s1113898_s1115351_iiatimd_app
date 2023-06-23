extends Control

@onready var titleLabel = $Card/Information/Title
@onready var dateLabel = $Card/Information/DateContainer/Date

var title
var date

# Called when the node enters the scene tree for the first time.
func _ready():
	titleLabel.text = title
	dateLabel.text = date
