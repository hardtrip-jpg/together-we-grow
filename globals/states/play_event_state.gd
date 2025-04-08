extends State
class_name PlayNameState

@export var dialogue : DialogueManager

func start() -> void:
	dialogue.finished_dialogue.connect(dialogue_ended)

func update(delta : float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		SignalManager.pause_menu.emit("PlaySchedule")

func dialogue_ended() -> void:
	transition.emit("LoadNextEvent")
