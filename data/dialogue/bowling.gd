extends DialogueEngine

func _setup() -> void:
	SignalManager.set_audio.emit(4, true)
	add_text_entry("Bowling!").set_metadata_data({
		"background": "uid://jgntsk0ujjxd",
		"emotion": "happy",
		"author": Global.loaded_save.name
	})
	
	if Global.loaded_save.current_stats["money"] > 1:
		Global.loaded_save.current_stats["money"] -= 1
		add_text_entry("Come on through").set_metadata_data({
		"author": "Attendent"
		})
		add_text_entry("I'm gonna beat you so bad").set_metadata_data({
		"author": Global.loaded_save.name
		})
		add_text_entry("Oh yeah?")
		add_text_entry("Yeah! I'm gonna get 5 Turkeys!").set_metadata_data({
		"author": Global.loaded_save.name
		})
		add_text_entry("Just watch me!").set_metadata_data({
		"author": Global.loaded_save.name
		})
		Global.loaded_save.current_stats["athletic"] += 1
		Global.loaded_save.current_stats["loser"] += 1
		Global.loaded_save.current_stats["relationship"] += 1
		if Global.loaded_save.current_stats["relationship"] > 5:
			Global.loaded_save.current_stats["relationship"] = 5
	else:
		add_text_entry("I'm sorry but it's 1$ to bowl").set_metadata_data({
		"emotion": "neutral",
		"author": "Attendent"
		})
		add_text_entry("Oh no, I don't have that kind of money at the moment")
		add_text_entry("Can't you let us play one game?")
		add_text_entry("What's going on?").set_metadata_data({
		"emotion": "neutral",
		"author": Global.loaded_save.name
		})
		add_text_entry("Sorry rules the rules").set_metadata_data({
		"author": "Attendent"
		})
		add_text_entry("Wait..").set_metadata_data({
		"author": Global.loaded_save.name
		})
		add_text_entry("No bowling?...").set_metadata_data({
		"emotion": "sad",
		"author": Global.loaded_save.name
		})
		add_text_entry("Not today, I'm sorry")
		Global.loaded_save.current_stats["relationship"] -= 1
		if Global.loaded_save.current_stats["relationship"] < 0:
			Global.loaded_save.current_stats["relationship"] = 0
	

	
	Global.loaded_save.available_events.append(load("uid://yarjjydqbq50"))
