extends Control

onready var timeout = $EmojiTimeout
onready var timer = $BubbleTimeout
onready var options = $"../OptionsLeft"

func _ready():
	randomize()
	
#func say_random_encouragement():
#	bubble.visible = true
#	timer.start(2)
#	text.text = encouragements[randi() % encouragements.size()]
	
var emojis = [
	"fire",
	"skull",
	"F",
	"fire",
	"skull",
	"F",
	"fire",
	"skull",
	"F",
]

#func find_emoji(param):
#	if timeout.get_wait_time() > 0:
#		return
#	else:
#		match param:
#			"A":
#				text.text = emojis[0]
#			"B":
#				text.text = emojis[1]
#			"C":
#				text.text = emojis[2]
#			"up":
#				text.text = emojis[3]
#			"down":
#				text.text = emojis[4]
#			"left":
#				text.text = emojis[5]
#			"right":
#				text.text = emojis[6]
#			_:
#				text.text = emojis[0]
#	timeout.set_wait_time(rand_range(0.8, 1.2))
#	timeout.start()
