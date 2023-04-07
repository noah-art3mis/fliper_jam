extends AnimatedSprite

#TODO

var RANGE_START = 0.1
var RANGE_END = 0.5

var SPEAK_RANGE_START = 1
var SPEAK_RANGE_END = 2


onready var speak_timer = $SpeakTimer
onready var audio_keyboard = $Keyboard
onready var keyboard_timer = $Keyboard/KeyboardTimer
onready var audio_emoji = $Emoji

func _process(delta):
	if StateManager.state == StateManager.States.IDLE:
		animate_player()
		play_audio_random()
		
	if StateManager.state == StateManager.States.BATTLE:
		animate_player()
		play_audio_random()
		
		
func animate_player():
	pass
#	TODO

func play_audio_random():
	if keyboard_timer.get_time_left() == 0:
		keyboard_timer.start(rand_range(RANGE_START, RANGE_END))

func _on_KeyboardTimer_timeout():
	audio_keyboard.play()
	print("keyboard_audio played")

func speak_randomly():
	if speak_timer.get_time_left() == 0:
		speak_timer.start(rand_range(RANGE_START, RANGE_END))
		audio_emoji.play()
	
func _on_SpeakTimer_timeout():
	audio_emoji.play()
	emoji_display()
	print("emoji displayed")
		

func emoji_display():
	pass
#	TODO
