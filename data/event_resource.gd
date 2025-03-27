extends Resource
class_name EventResource

@export var required_stats : Dictionary
@export var required_changes : Dictionary
@export var required_scheduled : Array
@export var scene : String

func _init(p_stats := {}, p_changes := {}, p_sched := [], p_scene := "") -> void:
	required_stats = p_stats
	required_changes = p_changes
	required_scheduled = p_sched
	scene = p_scene

func check(p_check : CheckResource) -> bool:
	var stat_bool := false
	var change_bool := false
	var schedule_bool := false
	
	if required_stats.size() > 0:
		for stat : String in required_stats:
			if p_check.current_stats.find_key(stat):
				if p_check.current_stats[stat] == required_stats[stat]:
					stat_bool = true
	else:
		stat_bool = true
	
	if required_changes.size() > 0:
		for change : String in required_changes:
			if p_check.current_changes.find_key(change):
				if p_check.current_changes[change] == required_changes[change]:
					change_bool = true
	else:
		change_bool = true
	
	if required_scheduled.size() > 0:
		for item : String in required_scheduled:
			if p_check.current_schedule.find(item) != -1:
					schedule_bool = true
	else:
		schedule_bool = true
	
	
	return stat_bool && change_bool && schedule_bool
