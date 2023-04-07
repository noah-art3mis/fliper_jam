extends Node

enum States {IDLE, TRANSITION, BATTLE, CHOICE, WIN}
var state = States.IDLE
var previous_state = States.WIN

func change_state_to(new_state):
	state = new_state
