extends Node

var loaded_save : SaveResource

var all_event_resources : Array[EventResource] = []
var all_schedule_items : Array[ScheduleItemResource] = []

func _ready() -> void:
	loaded_save = SaveResource.new()
	loaded_save.available_events = all_event_resources
	
	#Load all event resources
	var in_dir_event := DirAccess.get_files_at("res://data/events")
	for x in in_dir_event:
		var loaded : EventResource = load("res://data/events/" + x)
		all_event_resources.append(loaded)
	
	#Load all schedule items
	var in_dir_s_item := DirAccess.get_files_at("res://data/schedule_items")
	for x in in_dir_s_item:
		var loaded : ScheduleItemResource = load("res://data/schedule_items/" + x)
		all_schedule_items.append(loaded)
	
	print(all_event_resources)
	print(all_schedule_items)
