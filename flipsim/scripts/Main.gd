extends Node

var BATTLE_WAIT_TIME = 10
var END_TIME = 5


onready var coachSpeech = $UI/DialogueOptions/Pergunta/CoachSpeech
onready var dialogue_options = $zIndexWrapper2/DialogueOptions
onready var optionOne = $UI/DialogueOptions/A
onready var optionTwo = $UI/DialogueOptions/B
onready var optionThree = $UI/DialogueOptions/C
onready var playerOne = $PlayerOne
onready var playerTwo = $PlayerTwo
onready var pressToPlay = $UI/PressToPlay
onready var logo = $Logo
onready var coach = $Coach
onready var win_text = $UI/win
onready var lose_text = $UI/lose
onready var let = $UI/let
onready var them = $UI/them
onready var fight = $UI/fight

#timers
onready var battle_timer = $BattleTimer
onready var end_timer = $EndTimer
onready var fight_timer = $LetThemFightTimer

#audio
onready var audio_music = $AudioContainer/Music
onready var audio_let_them_fight = $AudioContainer/Fight
onready var audio_start = $AudioContainer/StartAudio
onready var audio_interface_beep = $AudioContainer/Beep
onready var audio_emoji = $AudioContainer/Emoji
onready var audio_win = $AudioContainer/Win
onready var audio_lose = $AudioContainer/Lose

var points = 0
var first_half = true

#quit game
func _input(event):
	if event.is_action_pressed("p"):
		get_tree().quit()
		
#input
func _ready():
	StateManager.state == StateManager.States.IDLE:

func _process(_delta):
	if StateManager.state == StateManager.States.IDLE:
		if Input.is_action_just_pressed("start"):
			print("start")
			play_battle()
			audio_start.play()
			
#	if StateManager.state == StateManager.States.BATTLE:
#		if Input.is_action_just_pressed("ui_accept"):
#			coach.say_emoji("A")
#		if Input.is_action_just_pressed("ui_select"):
#			coach.say_emoji("B")
#		if Input.is_action_just_pressed("ui_cancel"):
#			coach.say_emoji("C")
#		if Input.is_action_just_pressed("ui_up"):
#			coach.say_emoji("up")
#		if Input.is_action_just_pressed("ui_down"):
#			coach.say_emoji("down")
#		if Input.is_action_just_pressed("ui_left"):
#			coach.say_emoji("left")
#		if Input.is_action_just_pressed("ui_right"):
#			coach.say_emoji("right")

	if StateManager.state == StateManager.States.CHOICE:
		if Input.is_action_just_pressed("A"):
			audio_interface_beep.play()
			choose("A")
		if Input.is_action_just_pressed("B"):
			audio_interface_beep.play()
			choose("B")
		if Input.is_action_just_pressed("C"):
			audio_interface_beep.play()
			choose("C")
			
			
		
	if StateManager.state == StateManager.States.END:
		pass

func play_battle():
	StateManager.state = StateManager.States.BATTLE
	print("enter battle state")
	coach.say_random_encouragement()
	let_them_fight()

func let_them_fight():
	fight_timer.start(3)
	if fight_timer.get_time_left() < 3:
		let.visible = true
	if fight_timer.get_time_left() < 2:
		them.visible = true
	if fight_timer.get_time_left() < 1:
		fight.visible = true
	audio_let_them_fight.play()
	
func _on_LetThemFightTimer_timeout():
	let.visible = false
	them.visible = false
	fight.visible = false
	battle_timer.start(BATTLE_WAIT_TIME)
	playerOne.speak_randomly()
	playerTwo.speak_randomly()

	
func _on_BattleTimer_timeout():
	if first_half:
		play_choice()
	else:
		try_to_end()
		
func play_choice():
	StateManager.state = StateManager.States.CHOICE
	print('enter choice state')
	dialogue_options.set_options()
	dialogue_options.toggle_option_visibility()

#TODO MECHANICS
func choose(choice):
	if choice == dialogue_options.good_option:
		points += 100
	if choice == dialogue_options.medium_option:
		points += 50
	if choice == dialogue_options.bad_option:
		points += 10
	change_to_second_half()
	play_battle()

func change_to_second_half():
	first_half = false

#TODO END
func try_to_end():
	if points > randi() % 75:
		play_win_animation()
	else:
		play_lose_animation()
	end_timer.start(END_TIME)

func play_win_animation():
	win_text.visible = true
	audio_win.play()

func play_lose_animation():
	lose_text.visible = true
	audio_lose.play()

func _on_EndTimer_timeout():
	game_end()

func game_end():
	points = 0
	first_half = true
	win_text.visible = false
	lose_text.visible = false
		
	StateManager.state = StateManager.States.IDLE
