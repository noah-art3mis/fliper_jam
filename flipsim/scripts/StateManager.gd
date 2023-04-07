extends Node

func pause_game():
	print("press A to quit")
	if event.is_action_pressed("start"):
		go_back()

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

onready var CoachSpeech = get_node($"../UI/DialogueOptions/Pergunta")
onready var OptionOne = get_node($"../UI/DialogueOptions/A")
onready var OptionTwo = get_node($"../UI/DialogueOptions/B")
onready var OptionThree = get_node($"../UI/DialogueOptions/C")
onready var PlayerOne = get_node($"../PlayerOne")
onready var PlayerTwo = get_node($"../PlayerTwo")
#test this 

#func _ready():

func print_options():
	pass

func _process(delta):

#ui_accept - A?
#ui_select - B?
#ui_cancel - C?

	if _state == States.IDLE:
		play_animation_idle()
		if event.is_action_pressed():
			gameStart()	
			
	if _state == States.BATTLE:
		if event.is_action_pressed("ui_accept"):
			print_emoji("")
		if event.is_action_pressed("ui_select"):
			print_emoji("")
		if event.is_action_pressed("ui_cancel"):
			print_emoji("")
		if event.is_action_pressed("ui_up"):
			print_emoji("")
		if event.is_action_pressed("ui_down"):
			print_emoji("")
		if event.is_action_pressed("ui_left"):
			print_emoji("")
		if event.is_action_pressed("ui_right"):
			print_emoji("")
		if event.is_action_pressed("start"):
			pause_game()
			

	if _state == States.CHOICE:
		print_options
		if event.is_action_pressed("A"):
			pass
		if event.is_action_pressed("B"):
			pass
		if event.is_action_pressed("C"):
			pass
			
		
	if _state == States.WIN:
		pass

func play_animation_idle():
	$"../PlayerOne"
