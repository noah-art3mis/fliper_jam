extends Control

onready var audio_select = $Select

onready var q1 = $Question/Q1
onready var q2 = $Question/Q2
onready var q3 = $Question/Q3
onready var q_array = [q1, q2, q3]

onready var a1 = $Answer/A/HBoxContainer/A1
onready var a2 = $Answer/A/HBoxContainer/A2
onready var a3 = $Answer/A/HBoxContainer/A3
onready var a_array = [a1, a2, a3]

onready var b1 = $Answer/B/HBoxContainer/B1
onready var b2 = $Answer/B/HBoxContainer/B2
onready var b3 = $Answer/B/HBoxContainer/B3
onready var b_array = [b1, b2, b3]

onready var c1 = $Answer/C/HBoxContainer/C1
onready var c2 = $Answer/C/HBoxContainer/C2
onready var c3 = $Answer/C/HBoxContainer/C3
onready var c_array = [c1, c2, c3]

func set_emoji(array, emoji1, emoji2, emoji3):
	array[0].emoji_name = emoji1
	array[1].emoji_name = emoji2
	array[2].emoji_name = emoji3
	
onready var cheat_sheet = [1, 2, 3]

onready var good_option = cheat_sheet[0]
onready var medium_option = cheat_sheet[1]
onready var bad_option = cheat_sheet[2]

func toggle_option_visibility():
	if visible:
		visible = false
	else:
		visible = true
