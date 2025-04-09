extends State
class_name StartSceneState

@export var dialogue : DialogueManager
@export var animation : AnimationPlayer
@export var dialogue_script : GDScript
@export var enter_name : EnterNameScene

var is_on : bool = false

func start() -> void:
	dialogue.finished_dialogue.connect(dialogue_ended)

func enter(_previous_state : State) -> void:
	is_on = true
	await animation.animation_finished
	enter_name.show()
	animation.play("fade_out")
	await enter_name.done_setting
	animation.play("fade_in")
	dialogue.active(dialogue_script)
	SignalManager.set_audio.emit(1, false)
	await animation.animation_finished
	enter_name.hide()
	dialogue.show()
	animation.play("fade_out")
	dialogue.is_active = true
	dialogue.dialogue_engine.advance()

func exit() -> void:
	is_on = false
	
func dialogue_ended() -> void:
	if is_on:
		animation.play("fade_in")
		await animation.animation_finished
		animation.play("fade_out")
		dialogue.hide()
		transition.emit("PlaySchedule")
