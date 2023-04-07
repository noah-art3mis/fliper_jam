extends VBoxContainer

onready var question = $NinePatchRect/CoachSpeech
onready var optionOne = $NinePatchRect2/A
onready var optionTwo = $NinePatchRect3/B
onready var optionThree = $NinePatchRect4/C

onready var options = [0, 1, 2, 3]

onready var good_option = options[1]
onready var medium_option = options[2]
onready var bad_option = options[3]

func set_options():
	question.text = options[0]
	optionOne.text = options[1]
	optionTwo.text = options[2]
	optionThree.text = options[3]

func toggle_option_visibility():
	if visible:
		visible = false
	else:
		visible = true
