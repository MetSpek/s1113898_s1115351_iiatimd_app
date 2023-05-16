extends Control

@onready var day_edit = $ScrollContainer/AddWorkContainer/DetailContainer/DateContainer/DayEdit
@onready var month_edit = $ScrollContainer/AddWorkContainer/DetailContainer/DateContainer/MonthEdit
@onready var year_edit = $ScrollContainer/AddWorkContainer/DetailContainer/DateContainer/YearEdit
var time = []

@onready var scroll_container = $ScrollContainer
@onready var manage_labels = $ManageLabels

@onready var labels_container = $ScrollContainer/AddWorkContainer/LabelContainer/LabelsContainer
var label_item = preload("res://Components/LabelManagement/manage_label_item.tscn")

func _ready():
	setCurrentTime()

# Checks the current date/time from the system and sets the corrosponding line_edits to their value
func setCurrentTime():
	var unix_time = Time.get_unix_time_from_system()
	var datetime_dict = Time.get_datetime_dict_from_unix_time(unix_time)
	time = [datetime_dict["day"],datetime_dict["month"],datetime_dict["year"]]
	day_edit.text = str(time[0])
	month_edit.text = str(time[1])
	year_edit.text = str(time[2])

# Check whether the inputted value is an integer or empty
func checkIfDate(text):
	return text.is_valid_int() or text == ""

func _on_day_edit_text_changed(new_text):
	if checkIfDate(new_text):
		time[0] = new_text
	else:
		day_edit.text = time[0]

func _on_month_edit_text_changed(new_text):
	if checkIfDate(new_text):
		time[1] = new_text
	else:
		month_edit.text = time[1]

func _on_year_edit_text_changed(new_text):
	if checkIfDate(new_text):
		time[2] = new_text
	else:
		year_edit.text = time[2]

func closeLabelManagement(label_list):
	manageLabelList(label_list)
	manage_labels.visible = false
	scroll_container.visible = true

func manageLabelList(list):
	#Removes all current labels
	var children = labels_container.get_children()
	for child in children:
		labels_container.remove_child(child)
	
	for label in list:
		#Makes a new label item
		var item = label_item.instantiate()
		item.label = label
		labels_container.add_child(item)

func _on_add_label_button_pressed():
	manage_labels.visible = true
	scroll_container.visible = false

func _on_add_entry_button_button_up():
	print("CHECK ALL THE VALUES")
	print("ADD THE ENTRY TO THE SAVE")



