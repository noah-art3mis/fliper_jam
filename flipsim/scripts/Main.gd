extends Node

var BATTLE_WAIT_TIME = 6
var END_TIME = 5
var WIN_PERCENT = 10

onready var dialogue_options = $OptionsLeft
onready var playerOne = $PlayerOne
onready var playerTwo = $PlayerTwo
onready var coach = $Coach
onready var win_text = $UI/win
onready var lose_text = $UI/lose
onready var let = $UI/VBoxContainer/let
onready var them = $UI/VBoxContainer/them
onready var fight = $UI/VBoxContainer/fight

onready var bg_animation = $BackgroundLayer/ScreenAnimation
onready var p1_coach = $PlayerOne/Coach
onready var p2_coach = $PlayerTwo/Coach2

#timers
#onready var battle_timer = $BattleTimer
onready var end_timer = $EndTimer
onready var fight_timer = $UI/VBoxContainer/fight/FightTimer

#audio
onready var audio_music = $AudioContainer/Music
onready var audio_let = $AudioContainer/Let
onready var audio_them = $AudioContainer/Them
onready var audio_fight = $AudioContainer/Fight
onready var audio_start = $AudioContainer/StartAudio
onready var audio_interface_beep = $AudioContainer/Beep
onready var audio_emoji = $AudioContainer/Emoji
onready var audio_win = $AudioContainer/Win
onready var audio_lose = $AudioContainer/Lose

onready var answer_l = $OptionsLeft/Answer
onready var answer_r = $OptionsRight/Answer

var points_l = 0
var points_r = 0

func play_animations():
	playerOne.play()
	playerTwo.play()
	p1_coach.play()
	p2_coach.play()
	bg_animation.play()

func stop_animations():
	playerOne.stop()
	playerTwo.stop()
	p1_coach.stop()
	p2_coach.stop()
	bg_animation.stop()
	

#set animations
func _ready():
	play_animations()
	
#quit game
func _input(event):
	if event.is_action_pressed("p"):
		get_tree().quit()
		

func _process(_delta):
	if StateManager.state == StateManager.States.IDLE:
		if Input.is_action_just_pressed("ui_accept") || Input.is_action_just_pressed("ui_select") || Input.is_action_just_pressed("ui_cancel"):
			print("start")
			play_battle()
			audio_start.play()
			

	if StateManager.state == StateManager.States.CHOICE:
		answer_l.visible = true
#		answer_r.visible = true #TODO
		
		if Input.is_action_just_pressed("ui_accept") || Input.is_action_just_pressed("A"):
			audio_interface_beep.play()
			choose("A")
		if Input.is_action_just_pressed("ui_select") || Input.is_action_just_pressed("B"):
			audio_interface_beep.play()
			choose("B")
		if Input.is_action_just_pressed("ui_cancel") || Input.is_action_just_pressed("C"):
			audio_interface_beep.play()
			choose("C")
	else:
		answer_l.visible = false
		answer_r.visible = false
			
	if StateManager.state == StateManager.States.END:
		pass

func play_battle():
	StateManager.state = StateManager.States.BATTLE
	stop_animations()
	print("enter battle state")
	let_them_fight()

func let_them_fight():
	fight_timer.start(2.5)
	fight.visible = true
	

func _on_FightTimer_timeout():
	fight.visible = false
	$BattleTimer.start(BATTLE_WAIT_TIME)
	playerOne.speak()
#	playerTwo.speak()
	play_animations()
	
func _on_BattleTimer_timeout():
	print("try choice")
	if StateManager.first_half:
		pass
	else:
		try_to_end()
		
func choose(choice):
	print("make choice")
	var _emoji
	
	match choice:
		"A":
			_emoji = dialogue_options.a1
		"B":
			_emoji = dialogue_options.b1
		"C":
			_emoji = dialogue_options.c1
	
	match _emoji:
		dialogue_options.good_option:
			points_l += 100
		dialogue_options.medium_option:
			points_l += 50
		dialogue_options.bad_option:
			points_l += 10
	
	change_to_second_half()
	StateManager.state = StateManager.States.BATTLE
	_on_FightTimer_timeout()

func change_to_second_half():
	StateManager.first_half = false

func try_to_end():
	print("end")
	
	if !StateManager.over:
		StateManager.state = StateManager.States.END
		if points_l > randi() % WIN_PERCENT:
			play_win_animation("l")
		else:
			play_win_animation("r")
		StateManager.over = true
	else: 
		$ResetTimer.start(1)

func play_win_animation(param):
	if param == "l":
		win_text.visible = true
		audio_win.play()
		stop_animations()
		$OptionsLeft/Q/Combat/CanvasLayer/P1.emoji_name = "trophy"
		$OptionsRight/Q/Combat/CanvasLayer/P1.emoji_name = "poop"
	if param == "r":
		lose_text.visible = true
		audio_win.play()
		stop_animations()
		$OptionsLeft/Q/Combat/CanvasLayer/P1.emoji_name = "poop"
		$OptionsRight/Q/Combat/CanvasLayer/P1.emoji_name = "trophy"

#func _on_Win_finished():
#	reset()

func _on_ResetTimer_timeout():
	print("start reset")
	reset()
	
func reset():
	print("reset")
	points_l = 0
	points_r = 0
	StateManager.first_half = true
	win_text.visible = false
	lose_text.visible = false
	StateManager.over = false
	StateManager.state = StateManager.States.IDLE
	audio_win.stop()
	$OptionsLeft/Q/Question.visible = false
