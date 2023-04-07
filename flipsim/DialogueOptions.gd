extends VBoxContainer

onready var question = $NinePatchRect/CoachSpeech
onready var optionOne = $NinePatchRect2/A
onready var optionTwo = $NinePatchRect3/B
onready var optionThree = $NinePatchRect4/C

onready var options = [0, 1, 2, 3]

func _process(delta):
	if StateManager.state == StateManager.States.CHOICE:
		visible = true
	else:
		visible = false

func toggle_option_visibility():
	if visible:
		visible = false
	else:
		visible = true

func set_options():
	question.text = options[0]
	optionOne.text = options[1]
	optionTwo.text = options[2]
	optionThree.text = options[3]
