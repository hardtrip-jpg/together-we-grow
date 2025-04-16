extends State

@export var dialogue : DialogueManager
@export var animation : AnimationPlayer

var is_on : bool = false

func start() -> void:
	dialogue.finished_dialogue.connect(dialogue_ended)

func enter(_previous_state : State) -> void:
	is_on = true
	dialogue.is_active = true
	dialogue.dialogue_engine.advance()

func update(delta : float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		SignalManager.pause_menu.emit("ShowGifting")

func exit() -> void:
	is_on = false

func dialogue_ended() -> void:
	if is_on:
		dialogue.is_active = false
		animation.play("fade_in")
		await animation.animation_finished
		transition.emit("PlaySchedule")
		animation.play("fade_out")
