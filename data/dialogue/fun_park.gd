extends DialogueEngine

func _setup() -> void:
	SignalManager.set_audio.emit(2, true)
	if Global.loaded_save.current_stats["money"] < 2:
		Global.loaded_save.current_stats["relationship"] -= 1
		if Global.loaded_save.current_stats["relationship"] < 0:
			Global.loaded_save.current_stats["relationship"] = 0
		add_text_entry("Can't you just let my kid in free? I promise they won't cause trouble!").set_metadata_data({
		"background": "uid://bpvm00aelfauu",
		"emotion": "sad"
		})
		add_text_entry("I'm sorry man but I can't have a kid running around without supervision").set_metadata_data({
		"author": "Doorman"
		})
		add_text_entry("We can't go?").set_metadata_data({
		"author": Global.loaded_save.name
		})
		add_text_entry("Please just let my kid in")
		add_text_entry("I'm gonna have to call security if you continue").set_metadata_data({
		"author": "Doorman"
		})
		add_text_entry("Alright, we're going")
		add_text_entry("But fun park?").set_metadata_data({
		"author": Global.loaded_save.name
		})
		add_text_entry("We'll go another time")
	else:
		Global.loaded_save.current_stats["money"] -= 2
		Global.loaded_save.current_stats["athletic"] += 1
		Global.loaded_save.current_stats["loser"] -= 1
		Global.loaded_save.current_stats["rebel"] -= 1
		add_text_entry("Hey!! I'm here!").set_metadata_data({
		"author": Global.loaded_save.name,
		"background": "uid://bpvm00aelfauu",
		"emotion": "happy",
		})
		add_text_entry("You see me?!").set_metadata_data({
		"author": Global.loaded_save.name})
		add_text_entry("Yes I do! Now don't get lost!")
		add_text_entry("Fun! Fun! Fun!").set_metadata_data({
		"author": Global.loaded_save.name})
	Global.loaded_save.available_events.append(load("uid://k1h3xvsgrwjo"))
