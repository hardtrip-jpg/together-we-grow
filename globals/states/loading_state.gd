extends State
class_name LoadingState

@export var animation : AnimationPlayer
@export var event_holder : Node
@export var dialogue_screen : DialogueManager

func enter(_previous_state : State) -> void:
	
	animation.play("fade_in")
	await animation.animation_finished
	#transition.emit("PlaySchedule")


func exit() -> void:
	animation.play("fade_out")

func update(delta : float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		transition.emit("PlaySchedule")
