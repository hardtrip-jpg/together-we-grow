extends Control
class_name ScheduleManager

@export var schedule_inventory : HBoxContainer

var cur_pos : Vector2
var margin_container : MarginContainer

var cur_map := []
var all_slots := []
var can_activate := []

var test : ScheduleItem


func _ready() -> void:
	Console.add_command("sche", command_schedule, ["Days", "Max"], 2)
	test = ScheduleItem.new()
	schedule_inventory.add_child(test)

func command_schedule(days: String, max_day_in_week : String) -> void:
	init_schedule(int(days), int(max_day_in_week))

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		for x : ScheduleSlot in can_activate:
			x.activate()
			cur_map.erase(x.pos)
			

func init_schedule(days : int, max_day_in_week : int) -> void:
	print('Days: ', days)
	if margin_container: margin_container.queue_free()
	
	cur_map = []
	
	var counter := 1
	
	var days_left := days
	var weeks := int(ceil(float(days) / float(max_day_in_week)))
	
	margin_container = MarginContainer.new()
	margin_container.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	var week_holder := VBoxContainer.new()
	week_holder.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	
	for i in weeks:
		var new_week := HBoxContainer.new()
		new_week.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
		
		var days_to_draw : int
		if days_left > max_day_in_week:
			days_to_draw = max_day_in_week
		else:
			days_to_draw = days_left
		
		days_left -= days_to_draw
		
		
		for x in days_to_draw:
			var new_day := ScheduleSlot.new(x, i, counter)
			new_day.parent_func = set_active_pos
			counter += 1
			cur_map.append(new_day.pos)
			all_slots.append(new_day)
			new_week.add_child(new_day)
		week_holder.add_child(new_week)
		
		
		
	margin_container.add_child(week_holder)
	add_child(margin_container)

func set_active_pos(pos: Vector2) -> void:
	can_activate = []
	for x : ScheduleSlot in all_slots:
		x.colour_switch(false)
	
	cur_pos = pos
	print("On: ", pos)
	
	var good := true
	
	var checked_pos := []

	for x : Vector2 in test.positions:
		var cur_check := pos + x
		if cur_map.find(cur_check) == -1:
			good = false
			continue
		checked_pos.append(cur_check)
	
	for x : ScheduleSlot in all_slots:
		if checked_pos.find(x.pos) == -1:
			continue
		x.colour_switch(true)
		if good:
			can_activate.append(x)
	
	print("Result is ", good)
