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

# Create new art prompt from csv file
func generateNewPrompt():
	var randomAdj = randomNumber.randi_range(0, 9)
	var randomNoun = randomNumber.randi_range(0, 9)
	
	randomAdj = 'Adj_' + str(randomAdj)
	randomNoun = 'Noun_' + str(randomNoun)
	
	var newPrompt = tr(randomAdj) + ' ' + tr(randomNoun)
	return newPrompt

# Adds new prompt, moves all other prompts down
func _on_button_button_up():
	prompt_old_3.text = prompt_old_2.text
	prompt_old_2.text = prompt_old_1.text
	prompt_old_1.text = prompt_new.text
	prompt_new.text = generateNewPrompt()

