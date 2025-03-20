extends State
class_name LoadingState

@export var schedule : ScheduleManager

func enter(_previous_state : State) -> void:
	var max_days := randi_range(4,6)
	var days := randi_range(9, 12) + max_days
	
	schedule.init_schedule(days, max_days)
	schedule.selected = ScheduleItem.new()
	schedule.schedule_inventory.add_child(schedule.selected)
	transition.emit("PlaySchedule")
