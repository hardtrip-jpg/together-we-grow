extends Resource
class_name CheckResource

var current_stats : Dictionary
var current_changes : Dictionary
var current_schedule : Array


func _init(p_stats := {}, p_changes := {}, p_schedule := []) -> void:
	current_stats = p_stats
	current_changes = p_changes
	current_schedule = p_schedule
