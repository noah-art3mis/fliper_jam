extends Node

BATTLE_WAIT_TIME = 10

func pause():
	pass
	
#quit game
func _input(event):
	if event.is_action_pressed("p"):
		get_tree().quit()
		
func print_emoji(target, emoji):
	pass
#	emoji_delay = 1

#func is_emoji_delay()
#	if emoji_delay > 0:
#		return



onready var dialogue_1 = ["what should i do?", "1", "2", "3"]
onready var dialogue_2 = ["what should i do?", "1", "2", "3"]
var encouragements = ["bora mermão!!!"]

onready var coachSpeech = $UI/DialogueOptions/Pergunta/CoachSpeech
onready var dialogueOptions = $UI/DialogueOptions
onready var optionOne = $UI/DialogueOptions/A
onready var optionTwo = $UI/DialogueOptions/B
onready var optionThree = $UI/DialogueOptions/C
onready var playerOne = $PlayerOne
onready var playerTwo = $PlayerTwo
onready var pressToPlay = $UI/PressToPlay
onready var logo = $Logo
onready var coach = $Coach
onready var battle_timer = $BattleTimer
#test this 


func print_options():
	pass

func _process(delta):
		
#ui_accept - A?
#ui_select - B?
#ui_cancel - C?

	if StateManager.state == StateManager.States.IDLE:
		if Input.is_action_just_pressed("start"):
			play_battle()
			
	if StateManager.state == StateManager.States.BATTLE:
		coach.say_random_encouragement()
		playerOne.speak_randomly()
		playerTwo.speak_randomly()
		battle_timer.start(BATTLE_WAIT_TIME)
#		 when it plays the event ...
		play_choice()
		
		if Input.is_action_just_pressed("ui_accept"):
			coach.say_emoji("A")
		if Input.is_action_just_pressed("ui_select"):
			coach.say_emoji("B")
		if Input.is_action_just_pressed("ui_cancel"):
			coach.say_emoji("C")
		if Input.is_action_just_pressed("ui_up"):
			coach.say_emoji("up")
		if Input.is_action_just_pressed("ui_down"):
			coach.say_emoji("down")
		if Input.is_action_just_pressed("ui_left"):
			coach.say_emoji("left")
		if Input.is_action_just_pressed("ui_right"):
			coach.say_emoji("right")

	if StateManager.state == StateManager.States.CHOICE:
		toggle_option_visibility()
		if Input.is_action_just_pressed("A"):
			pass
		if Input.is_action_just_pressed("B"):
			pass
		if Input.is_action_just_pressed("C"):
			pass
			
		
	if StateManager.state == StateManager.States.WIN:
		pass

func gameEnd():
	StateManager.state = StateManager.States.IDLE
	

func play_battle():
	StateManager.state = StateManager.States.BATTLE
	 
