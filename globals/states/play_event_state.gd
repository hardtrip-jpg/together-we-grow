extends State
class_name PlayNameState

@export var dialogue : DialogueManager

var is_on : bool = false

func start() -> void:
	dialogue.finished_dialogue.connect(dialogue_ended)

func enter(_previous_state : State) -> void:
	is_on = true
	dialogue.is_active = true
	dialogue.dialogue_engine.advance()

func update(delta : float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		SignalManager.pause_menu.emit("PlayEvent")

func exit() -> void:
	is_on = false

func dialogue_ended() -> void:
	if is_on:
		transition.emit("LoadEvent")
