extends AnimatedSprite

#TODO

var KEYBOARD_RANGE_START = 1
var KEYBOARD_RANGE_END = 2

var SPEAK_TIME = 2

onready var times_spoken = 0

var combat_emoji_map_l = ["mag", "sunglasses", "scream"]
var combat_emoji_map_r = ["nerd", "dash", "alien"]

var combat_emoji_map_l_2 = ["shush", "punch", "sleeping"]
var combat_emoji_map_r_2 = ["eyes", "fire", "blush"]

onready var p1_l = get_node("../OptionsLeft/Q/Combat/CanvasLayer/P1")
onready var p1_r = get_node("../OptionsRight/Q/Combat/CanvasLayer/P1")
onready var options_l = get_node("../OptionsLeft")
onready var options_r = get_node("../OptionsRight")
onready var ql = get_node("../OptionsLeft/Q")
onready var qr = get_node("../OptionsRight/Q")
onready var speak_timer = $SpeakTimer
onready var audio_keyboard = $Keyboard
onready var keyboard_timer = $Keyboard/KeyboardTimer
onready var audio_emoji = $Emoji
onready var fade_timer = $FadeTimer

func _process(_delta):
	if StateManager.state == StateManager.States.IDLE:
		p1_l.visible = false
		p1_r.visible = false
		ql.visible = false
		qr.visible = false
		
	if StateManager.state == StateManager.States.BATTLE:
		p1_l.visible = true
		p1_r.visible = true
		ql.visible = true
		qr.visible = true
			
func speak():
	p1_l.visible = true
	p1_r.visible = true
	speak_timer.start(SPEAK_TIME)
	
func _on_SpeakTimer_timeout():
#	if times_spoken < combat_emoji_map_l.size() - 1:
	if times_spoken < 4:
		emoji_display()
		times_spoken += 1
		speak() #recursion
	else:
		if StateManager.first_half:
			times_spoken = 0
			StateManager.state = StateManager.States.CHOICE
			print('enter choice state via player')
			options_l.p1.emoji_name = "question"
			options_r.p1.emoji_name = "question"
		else:
			get_parent().try_to_end()

func emoji_display():
	audio_emoji.play()
	
	if StateManager.first_half:
		options_l.p1.emoji_name = combat_emoji_map_l[times_spoken - 1]
		options_l.p1.visible = true
		options_r.p1.emoji_name = combat_emoji_map_r[times_spoken - 1]
		options_r.p1.visible = true
	else:
		options_l.p1.emoji_name = combat_emoji_map_l_2[times_spoken - 1]
		options_l.p1.visible = true
		options_r.p1.emoji_name = combat_emoji_map_r_2[times_spoken - 1]
		options_r.p1.visible = true
