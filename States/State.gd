extends Node
class_name State # base template for state machines

signal Transitioned # if leaving state, call this signal


func Enter(): # work to do when entering
    pass

func Exit(): # work to do when exiting
    pass

func Update(_delta: float): # update
    pass

func Physics_Update(_delta: float):
    pass