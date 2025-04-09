extends Resource
class_name SaveResource

var name : String

var available_events : Array[EventResource]
var current_age : int = 1

var current_event_list : Array[EventResource]
var current_event_index : int = 0

var current_sprite := "baby"
var current_trait : String 

func reset_currents() -> void:
	current_event_list = []
	current_event_index = 0
