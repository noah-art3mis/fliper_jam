extends Control

onready var bubble = $SpeechBubble
onready var text = $SpeechBubble/Text
onready var encouragements = ["bora la", "porra", "etc"]
onready var timeout = $EmojiTimeout
onready var emojis = []
onready var timer = $BubbleTimeout
onready var options = $"../OptionsLeft"
func _ready():
	randomize()
	
func say_random_encouragement():
	bubble.visible = true
	timer.start(2)
	text.text = encouragements[randi() % encouragements.size()]
	

func say_emoji(param):
	if timeout.get_wait_time() > 0:
		return
	else:
		match param:
			"A":
				text.text = emojis[0]
			"B":
				text.text = emojis[1]
			"C":
				text.text = emojis[2]
			"up":
				text.text = emojis[3]
			"down":
				text.text = emojis[4]
			"left":
				text.text = emojis[5]
			"right":
				text.text = emojis[6]
			_:
				text.text = emojis[9]

	var random_number = rand_range(0.8, 1.2)
	timeout.set_wait_time(random_number)
	timeout.start()


func _on_BubbleTimeout_timeout():
	bubble.visible = false
