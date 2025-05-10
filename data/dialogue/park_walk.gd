extends DialogueEngine

func _setup() -> void:
	SignalManager.set_audio.emit(4, false)
	if !Global.loaded_save.current_memory.has("parkwalk"):
		Global.loaded_save.current_memory.get_or_add("parkwalk", "1")
	else:
		var current : int = int(Global.loaded_save.current_memory["parkwalk"])
		current += 1
		Global.loaded_save.current_memory["parkwalk"] = str(current)
	
	add_text_entry("Ahhh...").set_metadata_data({
			"background": "uid://cdk4rghualxn3",
			"emotion": "happy",
		})
	
	if Global.loaded_save.current_memory["parkwalk"] == "2":
		Global.loaded_save.current_stats["relationship"] += 1
		Global.loaded_save.current_stats["athletic"] += 1
		add_text_entry("Walking really is good").set_metadata_data({
			"author": Global.loaded_save.name,
		})
		add_text_entry("Yeah")
		add_text_entry("There's so many birds out here I wouldn't get to see from inside").set_metadata_data({
			"author": Global.loaded_save.name,
		})
		add_text_entry("Do you know any breeds?")
		add_text_entry("Not really").set_metadata_data({
			"author": Global.loaded_save.name,
			"emotion": "sad"
		})
		add_text_entry("But that's a raven!").set_metadata_data({
			"author": Global.loaded_save.name,
			"emotion": "happy"
		})
		add_text_entry("CAW CAW!").set_metadata_data({
			"author": "Raven",
			"emotion": "happy"
		})
	else:
		add_text_entry("Sometimes its just good to go out for a walk you know")
		add_text_entry("Yeah").set_metadata_data({
			"author": Global.loaded_save.name,
		})
		add_text_entry("The wind is just so nice as we walk")
		add_text_entry("mmmm").set_metadata_data({
			"author": Global.loaded_save.name,
		})
		add_text_entry("We should do this more often")
	
	
	Global.loaded_save.current_stats["athletic"] += 1
	Global.loaded_save.current_stats["relationship"] += 1
	if Global.loaded_save.current_stats["relationship"] > 5:
			Global.loaded_save.current_stats["relationship"] = 5
	Global.loaded_save.available_events.append(load("uid://6fxpn38rrssx"))
