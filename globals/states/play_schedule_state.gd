extends State
class_name PlayScheduleState

@export var schedule : ScheduleManager

func enter(_previous_state : State) -> void:
	schedule.show()

func update(delta : float) -> void:
	done()

func done() -> void:
	await schedule.schedule_set
	transition.emit("CheckSchedule")

func exit() -> void:
	pass
