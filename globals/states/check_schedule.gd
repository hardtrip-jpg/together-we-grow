extends State
class_name CheckScheduleState

@export var schedule : ScheduleManager
var event_list := []

func enter(_previous_state: State) -> void:
	schedule.hide()
	for x : ScheduleSlot in schedule.all_slots:
		if x.active:
			print(x.day, x.position)
