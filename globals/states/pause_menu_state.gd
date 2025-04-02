extends State
class_name PauseMenuState

@export var pause_menu : Control
var previous_state : String

func start() -> void:
	SignalManager.pause_menu.connect(transition_to)

func enter(_previous_state : State) -> void:
	pause_menu.show()
	
func update(delta : float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		transition.emit(previous_state)

func exit() -> void:
	pause_menu.hide()

func transition_to(state_name : String) -> void:
	previous_state = state_name
	transition.emit("PauseMenu")
