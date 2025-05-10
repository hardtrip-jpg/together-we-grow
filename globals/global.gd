extends Node

var loaded_save : SaveResource

var all_event_resources : Array[EventResource] = []
var all_schedule_items : Array[ScheduleItemResource] = []

var event_list : Array[String] = ["res://data/events/bowling.tres", "res://data/events/catch.tres", "res://data/events/concert.tres", "res://data/events/fun_park.tres", "res://data/events/game_night_event_GOOD.tres", "res://data/events/game_night_event_MID.tres", "res://data/events/game_night_event_VERY_BAD.tres", "res://data/events/grandparents_dead.tres", "res://data/events/grandparents_visit.tres", "res://data/events/help_homework_BAD.tres", "res://data/events/help_homework_GOOD.tres", "res://data/events/library.tres", "res://data/events/museum.tres", "res://data/events/park_walk.tres", "res://data/events/pretend_play.tres", "res://data/events/sports_game.tres", "res://data/events/take_to_school.tres", "res://data/events/tv_night.tres"]
var schedule_list : Array[String] = ["res://data/schedule_items/bowling_item.tres", "res://data/schedule_items/catch_item.tres", "res://data/schedule_items/concert_item.tres", "res://data/schedule_items/fun_park_item.tres", "res://data/schedule_items/game_night_item.tres", "res://data/schedule_items/grandparents_item.tres", "res://data/schedule_items/help_homework_item.tres", "res://data/schedule_items/library_item.tres", "res://data/schedule_items/museum_item.tres", "res://data/schedule_items/park_walk_item.tres", "res://data/schedule_items/play_party_item.tres", "res://data/schedule_items/pretend_play_item.tres", "res://data/schedule_items/sports_game_item.tres", "res://data/schedule_items/take_to_school_item.tres", "res://data/schedule_items/tv_night_item.tres", "res://data/schedule_items/work_1_item.tres", "res://data/schedule_items/work_2_item.tres", "res://data/schedule_items/work_3_item.tres", "res://data/schedule_items/work_4_item.tres", "res://data/schedule_items/work_5_item.tres"]

func _ready() -> void:
	loaded_save = SaveResource.new()
	
	
	#Load all event resources
	for x in event_list:
		var loaded : EventResource = load(x)
		all_event_resources.append(loaded)
	
	#Load all schedule items
	for x in schedule_list:
		var loaded : ScheduleItemResource = load(x)
		all_schedule_items.append(loaded)
	
	loaded_save.available_events = all_event_resources
	
