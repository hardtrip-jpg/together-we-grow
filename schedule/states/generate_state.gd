extends State
class_name GenerateState

@export var schedule : ScheduleManager

func enter(_previous_state : State) -> void:
	
	var max_days := randi_range(4,6)
	var days := randi_range(9, 12) + max_days
	
	schedule.init_schedule(days, max_days)
	
