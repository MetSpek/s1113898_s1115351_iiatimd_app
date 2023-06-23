extends Control

@onready var prompt_new = $GeneratorContainer/PromptNew
@onready var prompt_old_1 = $GeneratorContainer/PromptOldBox/PromptOld1
@onready var prompt_old_2 = $GeneratorContainer/PromptOldBox/PromptOld2
@onready var prompt_old_3 = $GeneratorContainer/PromptOldBox/PromptOld3

var randomNumber = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	prompt_old_3.text = ''
	prompt_old_2.text = ''
	prompt_old_1.text = ''
	prompt_new.text = ''
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func generateNewPrompt():
	var randomAdj = randomNumber.randi_range(0, 9)
	var randomNoun = randomNumber.randi_range(0, 9)
	
	randomAdj = 'Adj_' + str(randomAdj)
	randomNoun = 'Noun_' + str(randomNoun)
	
	var newPrompt = tr(randomAdj) + ' ' + tr(randomNoun)
	return newPrompt

# Reacts to clicking the button.
func _on_button_button_up():
	prompt_old_3.text = prompt_old_2.text
	prompt_old_2.text = prompt_old_1.text
	prompt_old_1.text = prompt_new.text
	prompt_new.text = generateNewPrompt()

