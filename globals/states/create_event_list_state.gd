extends State
class_name CreateEventList

@export var schedule : ScheduleManager

func enter(_previous_state: State) -> void:

	var events : Array = []
	
	Global.loaded_save.reset_currents()
	
	for x : ScheduleSlot in schedule.all_slots:
		if x.active:
			if events.find(x.event.item_name) == -1:
				events.append(x.event.item_name)
			print(x.global_position)
	
	var check := CheckResource.new({},{},events)
	var available_events := Global.loaded_save.available_events
	
	for x in available_events:
		if x.check(check):
			Global.loaded_save.current_event_list.append(x)
			var remove_at := Global.loaded_save.available_events.find(x)
			Global.loaded_save.available_events.remove_at(remove_at)
	
	SignalManager.set_audio.emit(2, true)


func update(delta : float) -> void:
	transition.emit("LoadNextEvent")
	if Input.is_action_just_pressed("ui_cancel"):
		SignalManager.pause_menu.emit("CreateEventList")
