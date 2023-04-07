extends AnimatedSprite

#TODO

var KEYBOARD_RANGE_START = 1
var KEYBOARD_RANGE_END = 2

var SPEAK_RANGE_START = 1
var SPEAK_RANGE_END = 2

onready var times_spoken = 0

var combat_emoji_map = ["yum", "yum", "yum"]

onready var combat_emoji = get_node("../OptionsLeft/Combat/P1")
onready var options = get_node("../OptionsLeft") #TODO THIS IS ONLY FOR LEFT PLAYER
onready var speak_timer = $SpeakTimer
onready var audio_keyboard = $Keyboard
onready var keyboard_timer = $Keyboard/KeyboardTimer
onready var audio_emoji = $Emoji
onready var fade_timer = $FadeOutTimer

func _process(_delta):
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
		keyboard_timer.start(rand_range(KEYBOARD_RANGE_START, KEYBOARD_RANGE_END))

func _on_KeyboardTimer_timeout():
	audio_keyboard.play()
	print("keyboard_audio played")

func speak():
	speak_timer.start(rand_range(SPEAK_RANGE_START, SPEAK_RANGE_END))
	
func _on_SpeakTimer_timeout():
	if times_spoken < 4:
		times_spoken += 1
		emoji_display()
		speak() #recursion
	else:
		return

func emoji_display():
	audio_emoji.play()
	
	combat_emoji = options.p1
	combat_emoji.visible = true
	combat_emoji.emoji_name = combat_emoji_map[times_spoken]
	print("emoji displayed")
	fade_timer.start(2)
	
	pass
#	TODO


func _on_FadeOutTimer_timeout():
	pass # Replace with function body.
