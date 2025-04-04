extends State
class_name PlayScheduleState

@export var schedule : ScheduleManager

func enter(_previous_state : State) -> void:
	if _previous_state is PauseMenuState:
		return
	schedule.show()
	schedule.init_schedule(16, 5)
	schedule.init_items(2,10)
	SignalManager.set_audio.emit(1, false)

func update(_delta : float) -> void:
	done()
	
	if Input.is_action_just_pressed("ui_cancel"):
		SignalManager.pause_menu.emit("PlaySchedule")

func done() -> void:
	await schedule.schedule_set
	transition.emit("CreateEventList")

func exit() -> void:
	pass
