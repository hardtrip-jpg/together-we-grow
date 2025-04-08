extends State
class_name LoadingState

@export var animation : AnimationPlayer
@export var event_holder : Node
@export var dialogue_screen : DialogueManager
@export var schedule : ScheduleManager

var current_index := 0

func enter(_previous_state : State) -> void:
	animation.play("fade_in")
	if _previous_state is PlayScheduleState:
		current_index = 0
	await animation.animation_finished
	
	if current_index >= Global.all_event_resources.size():
		transition.emit("PlaySchedule")
		return
	
	var current_event := Global.all_event_resources[current_index]
	print(current_event.cutscene.dialogue)
	dialogue_screen.active(current_event.cutscene.dialogue)
	
	dialogue_screen.is_active = true
	schedule.hide()
	#transition.emit("PlaySchedule")
	current_index += 1

func exit() -> void:
	animation.play("fade_out")

func update(delta : float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		transition.emit("PlayEvent")
