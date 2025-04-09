extends State
class_name LoadingState

@export var animation : AnimationPlayer
@export var dialogue_screen : DialogueManager
@export var schedule : ScheduleManager
@export var label : Label

var current_index := 0

func enter(_previous_state : State) -> void:
	animation.play("fade_in")
	label.modulate = Color(1,1,1,0)
	label.hide()
	if _previous_state is PlayScheduleState:
		current_index = 0
	await animation.animation_finished
	
	
	if current_index >= Global.loaded_save.current_event_list.size() - 1:
		dialogue_screen.is_active = false
		transition.emit("EndEvents")
		return
	
	animation.play("fade_in_text")
	label.show()
	
	var current_event := Global.loaded_save.current_event_list[current_index]
	print(current_event.cutscene.dialogue)
	dialogue_screen.active(current_event.cutscene.dialogue)
	


func exit() -> void:
	current_index += 1
	animation.play("fade_out")

func update(delta : float) -> void:
	if Input.is_action_just_pressed("mouse_left") && current_index < (Global.loaded_save.current_event_list.size() - 1):
		label.hide()
		label.modulate = Color(1,1,1,0)
		transition.emit("PlayEvent")
