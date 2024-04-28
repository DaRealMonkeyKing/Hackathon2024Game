extends Node

@export var initial_state : State

var current_state : State # tracks the current state
var states : Dictionary = {}

func _ready():
    for child in get_children():
        if child is State: # if the child node extends State
            states[child.name.to_lower()] = child; # the name of that child maps to the node
            child.Transitioned.connect(on_child_transition) # call the signal

    if initial_state: # define the intial state to be in
        initial_state.Enter()
        current_state = initial_state



func _process(delta): # calls the update from the current state Node
    if current_state:
        current_state.Update(delta)



func _physics_process(delta): # calls the phsyics update from the current state 
    if current_state:
        current_state.Physics_Update(delta)



func on_child_transition(state, new_state_name):
    if state != current_state: # if the current state does not match the state of the function
        return
    
    var new_state = states.get(new_state_name.to_lower())

    if !new_state: # if the state did not change
        return

    if current_state: # do required work to exit the current state
        current_state.Exit();

    new_state.Enter() # do required work when entering new state

    current_state = new_state # set current state to new state
