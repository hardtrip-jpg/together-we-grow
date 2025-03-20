extends Node
class_name State

signal transition(new_state_name: StringName)

func _ready() -> void:
	start()

func start() -> void:
	pass

func enter(_previous_state : State) -> void:
	pass

func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass
