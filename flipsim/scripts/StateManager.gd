extends Node

func pause():
	pass
	
#quit game
#REFACTOR TO PAUSE GAME
	
			
func print_emoji(target, emoji):
	pass
#	emoji_delay = 1

#func is_emoji_delay()
#	if emoji_delay > 0:
#		return

enum States {IDLE, TRANSITION, BATTLE, CHOICE, WIN}
var _state = States.IDLE

onready var dialogue_1 = ["what should i do?", "1", "2", "3"]
onready var dialogue_2 = ["what should i do?", "1", "2", "3"]

onready var coachSpeech = get_parent().get_node("/Main/UI/DialogueOptions/Pergunta")
onready var dialogueOptions = get_parent().get_node("/Main/UI/DialogueOptions")
onready var optionOne = get_parent().get_node("/Main/UI/DialogueOptions/A")
onready var optionTwo = get_parent().get_node("/Main/UI/DialogueOptions/B")
onready var optionThree = get_parent().get_node("/Main/UI/DialogueOptions/C")
onready var playerOne = get_parent().get_node("/Main/PlayerOne")
onready var playerTwo = get_parent().get_node("/Main/PlayerTwo")
onready var pressToPlay = get_parent().get_node("/Main/UI/PressToPlay")
#test this 

#func _ready():

func print_options():
	pass

func _process(delta):
	if Input.is_action_just_pressed("start"):
		get_tree().quit()
#		pause()
		
#ui_accept - A?
#ui_select - B?
#ui_cancel - C?

	if _state == States.IDLE:
		play_animation_idle()
		
		if Input.is_action_just_pressed("start"):
			gameStart()	
			
	if _state == States.BATTLE:
		pass
#		if Input.is_action_just_pressed("ui_accept"):
#			print_emoji("")
#		if Input.is_action_just_pressed("ui_select"):
#			print_emoji("")
#		if Input.is_action_just_pressed("ui_cancel"):
#			print_emoji("")
#		if Input.is_action_just_pressed("ui_up"):
#			print_emoji("")
#		if Input.is_action_just_pressed("ui_down"):
#			print_emoji("")
#		if Input.is_action_just_pressed("ui_left"):
#			print_emoji("")
#		if Input.is_action_just_pressed("ui_right"):
#			print_emoji("")
#

	if _state == States.CHOICE:
		toggle_option_visibility()
		if Input.is_action_just_pressed("A"):
			pass
		if Input.is_action_just_pressed("B"):
			pass
		if Input.is_action_just_pressed("C"):
			pass
			
		
	if _state == States.WIN:
		pass

func play_animation_idle():
	pass
#	playerOne.play()
#	playerTwo.play()
#	pressToPlay.play()

func gameStart():
	_state = States.BATTLE

func gameEnd():
	_state = States.IDLE
	
func toggle_option_visibility():
	if dialogueOptions.visible:
		dialogueOptions.visible = false
	else:
		dialogueOptions.visible = true
