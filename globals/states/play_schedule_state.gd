extends State
class_name PlayScheduleState

@export var schedule : ScheduleManager

func enter(_previous_state : State) -> void:
	schedule.show()
	schedule.init_schedule(16, 5)
	schedule.init_items(2,1)

func update(delta : float) -> void:
	done()

func done() -> void:
	await schedule.schedule_set
	transition.emit("CreateEventList")

func exit() -> void:
	pass
