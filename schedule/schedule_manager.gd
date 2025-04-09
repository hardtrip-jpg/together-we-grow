extends Control
class_name ScheduleManager

@export var schedule_inventory : VBoxContainer
@export var schedule_holder : MarginContainer
@export var button : Button
@export var money_label : Label

var cur_pos : Vector2
var margin_container : MarginContainer

var cur_map := []
var all_slots := []
var can_activate := []

var placed_items := {}

var selected : ScheduleItem

signal schedule_set

func _ready() -> void:
	Console.add_command("sche", command_schedule, ["Days", "Max", "Age", "Amount"], 4)
	button.pressed.connect(ready_up)

func ready_up() -> void:
	schedule_set.emit()
	button.disabled = true

func command_schedule(days: String, max_day_in_week : String, age: String, amount: String) -> void:
	init_schedule(int(days), int(max_day_in_week))
	init_items(int(age), int(amount))

func _input(event: InputEvent) -> void:
	if visible == false: return
	
	if event.is_action_pressed("mouse_left") && selected:
		place_active_item()


func init_schedule(days : int, max_day_in_week : int) -> void:
	print('Days: ', days)
	if margin_container: margin_container.queue_free()
	margin_container = MarginContainer.new()
	
	all_slots = []
	cur_map = []
	can_activate = []
	placed_items = {}
	
	money_label.text = "Money: " + str(Global.loaded_save.current_stats["money"]) + "$"
	
	var counter := 1
	var days_left := days
	var weeks := int(ceil(float(days) / float(max_day_in_week)))
	
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
	schedule_holder.add_child(margin_container)
	button.disabled = false

func init_items(age : int, amount : int) -> void:
	randomize()
	for x in schedule_inventory.get_children():
		x.queue_free()
	
	var available_items := []
	for x in Global.all_schedule_items:
		if x.match_age(age):
			available_items.append(x)
	
	for x in amount:
		var index := randi_range(0,(available_items.size() - 1))
		var new_item := ScheduleItem.new(available_items[index])
		new_item.set_item.connect(set_active_item)
		schedule_inventory.add_child(new_item)
		available_items.remove_at(index)

func set_active_pos(pos: Vector2) -> void:
	can_activate = []
	for x : ScheduleSlot in all_slots:
		x.colour_switch(Color.WHITE)
	
	cur_pos = pos
	
	if !selected or cur_pos == Vector2(-1,-1):
		return
	
	var good := true
	var checked_pos := []
	
	for x : Vector2 in selected.positions:
		var cur_check := pos + x
		if cur_map.find(cur_check) == -1:
			good = false
			continue
		checked_pos.append(cur_check)
	
	for x : ScheduleSlot in all_slots:
		if checked_pos.find(x.pos) == -1:
			continue
		if good:
			x.colour_switch(Color.GREEN)
			can_activate.append(x)
		else:
			x.colour_switch(Color.RED)

func set_active_item(item : ScheduleItem) -> void:
	selected = item
	print(selected.resource.item_name)

func place_active_item() -> void:
	if "money" in selected.resource:
		if (Global.loaded_save.current_stats["money"] + selected.resource.money) < 0:
			return

	
	var did : bool = false
	for x : ScheduleSlot in can_activate:
		var event_name := ""
		if x.pos == cur_pos:
			did = true
			event_name = selected.resource.item_name
		x.event = selected.resource
		x.activate(event_name, selected.resource.color)
		cur_map.erase(x.pos)
	if did:
		if "money" in selected.resource:
			Global.loaded_save.current_stats["money"] += selected.resource.money
			money_label.text = "Money: " + str(Global.loaded_save.current_stats["money"]) + "$"
		selected.queue_free()
		#schedule_set.emit()
