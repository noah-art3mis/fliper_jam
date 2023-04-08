extends Node

enum States {IDLE, TRANSITION, BATTLE, CHOICE, END}
var state = States.IDLE
var previous_state = States.END

func change_state_to(new_state):
	state = new_state

var first_half = true
