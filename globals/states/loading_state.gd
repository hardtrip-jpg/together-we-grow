extends State
class_name LoadingState

@export var animation : AnimationPlayer
@export var dialogue_screen : DialogueManager
@export var schedule : ScheduleManager
@export var label : Label
@export var event_label : Label

var current_index := 0
var enabled := true
var can_click := false

func enter(_previous_state : State) -> void:
	event_label.hide()
	dialogue_screen.is_active = false
	enabled = true
	can_click = false
	
	if _previous_state is CreateEventList:
		current_index = 0
	
	var current_event : EventResource
	
	if current_index > Global.loaded_save.current_event_list.size() - 1:
		enabled = false
	else:
		current_event = Global.loaded_save.current_event_list[current_index]
		dialogue_screen.active(current_event.cutscene)
		event_label.text = current_event.name
		event_label.show()
	
	
	
	animation.play("fade_in")
	label.modulate = Color(1,1,1,0)
	label.hide()


	await animation.animation_finished
	
	
	if enabled == false:
		dialogue_screen.is_active = false
		dialogue_screen.hide()
		transition.emit("EndEvents")
		return
	
	animation.play("fade_in_text")
	label.show()
	can_click = true


func exit() -> void:
	current_index += 1
	animation.play("fade_out")
	await animation.animation_finished
	event_label.hide()

func update(delta : float) -> void:
	if Input.is_action_just_pressed("mouse_left") && enabled && can_click:
		label.hide()
		label.modulate = Color(1,1,1,0)
		transition.emit("PlayEvent")
