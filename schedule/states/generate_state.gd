extends State
class_name GenerateState

@export var schedule : ScheduleManager

func enter(previous_state : State) -> void:
	
	var max := randi_range(4,6)
	var days := randi_range(10, 13) + max
	
	schedule.init_schedule(days, max)
