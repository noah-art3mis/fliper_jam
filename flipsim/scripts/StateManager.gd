extends Node

func pause_game():
	print("press A to quit")
	if event.is_action_pressed("start"):
		go_back()

func print_emoji(target, emoji)
	pass

func is_emoji_delay()
	if emoji_delay > 0:
		break

enum States {IDLE, TRANSITION, BATTLE, CHOICE, WIN}
var _state = States.IDLE

var dialogue_1 = ["what should i do?", "1", "2", "3"]
var dialogue_2 = ["what should i do?", "1", "2", "3"]

func _ready():
	var options = []

func print_options
	options = dialogue_1

func _process(delta):

	if _state = States.IDLE:
		if event.is_action_pressed():
			gameStart()	
			
	if _state = States.BATTLE:
		if event.is_action_pressed("A"):
			print_emoji("")
		if event.is_action_pressed("B"):
			print_emoji("")
		if event.is_action_pressed("C"):
			print_emoji("")
		if event.is_action_pressed("up"):
			print_emoji("")
		if event.is_action_pressed("down"):
			print_emoji("")
		if event.is_action_pressed("left"):
			print_emoji("")
		if event.is_action_pressed("right"):
			print_emoji("")
		if event.is_action_pressed("start"):
			pause_game()
			

	if _state = States.CHOICE:
		print_options
		if event.is_action_pressed("A"):
			pass
		if event.is_action_pressed("B"):
			pass
		if event.is_action_pressed("C"):
			pass
			
		
	if _state = States.WIN:
		pass

func change_state(new_state: int) -> void:
	var previous_state := _state
	_state = new_state

	# Initialize the new state.
	match _state:
		States.IN_AIR:
			_speed = air_speed
		States.ON_GROUND:
			_speed = ground_speed

	# Clean up the previous state.
	match previous_state:
		States.IN_AIR:
			#...
