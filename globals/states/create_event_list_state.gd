extends State
class_name CreateEventList

@export var schedule : ScheduleManager
@export var animation : AnimationPlayer

func enter(_previous_state: State) -> void:
	animation.play("fade_in")
	var events : Array = []
	
	Global.loaded_save.reset_currents()
	
	for x : ScheduleSlot in schedule.all_slots:
		if x.active:
			if events.find(x.event.item_name) == -1:
				events.append(x.event.item_name)
			print(x.global_position)
	
	var check := CheckResource.new(Global.loaded_save.current_stats,{},events)
	var available_events := Global.loaded_save.available_events
	
	for x in available_events:
		if x.check(check):
			Global.loaded_save.current_event_list.append(x)
			print(x.name)
			var remove_at := Global.loaded_save.available_events.find(x)
			Global.loaded_save.available_events.remove_at(remove_at)
	
	if Global.loaded_save.current_age == 3 && Global.loaded_save.current_memory.has("grandparents"):
		var random_pos := randi_range(0, Global.loaded_save.current_event_list.size() - 1)
		Global.loaded_save.current_event_list.insert(random_pos, load("uid://dpy8gf2464kn5"))
		
	SignalManager.set_audio.emit(2, true)
	
	await animation.animation_finished
	schedule.hide()


func update(delta : float) -> void:
	transition.emit("LoadEvent")
