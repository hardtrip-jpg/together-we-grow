extends DialogueEngine

func _setup() -> void:
	SignalManager.set_audio.emit(5, true)
	if Global.loaded_save.current_stats["money"] < 3:
		Global.loaded_save.current_stats["relationship"] -= 1
		if Global.loaded_save.current_stats["relationship"] < 0:
			Global.loaded_save.current_stats["relationship"] = 0
		add_text_entry("Hey... I've got some bad news").set_metadata_data({
			"background": "uid://b0qaw03j1bc7f",
			"emotion": "happy"
		})
		add_text_entry("What is it?").set_metadata_data({
			"emotion": "neutral",
			"author": Global.loaded_save.name
		})
		add_text_entry("The tickets are too expensive for todays game")
		add_text_entry("You didn't buy them?!").set_metadata_data({
			"emotion": "sad",
			"author": Global.loaded_save.name
		})
		add_text_entry("But I thought we were going!?").set_metadata_data({
			"author": Global.loaded_save.name
		})
		add_text_entry("We can watch it on TV instead?")
		add_text_entry("Forget it I'm going to my room").set_metadata_data({
			"author": Global.loaded_save.name
		})
		
	else:
		Global.loaded_save.current_stats["money"] -= 2
		var current_hightest_val : int
		var current_high : String
		for x : String in Global.loaded_save.current_stats:
			if x == "relationship" or x == "money":
				continue
			if Global.loaded_save.current_stats[x] > current_hightest_val:
				current_hightest_val = Global.loaded_save.current_stats[x]
				current_high = x
		add_text_entry("LETS GO SUNS").set_metadata_data({
			"background": "uid://orpjanviybl0",
			"emotion": "happy"
		})
		add_text_entry("Let's go!").set_metadata_data({
			"author": Global.loaded_save.name
		})
		add_text_entry("Hit the floofbol Ronchi!").set_metadata_data({
			"author": Global.loaded_save.name
		})
		add_text_entry("Ronchi! Ronchi! Ronchi!")

		
		Global.loaded_save.current_stats["athletic"] += 3
		Global.loaded_save.current_stats["rebel"] += 2
		if current_high == "athletic":
			add_text_entry("This is the best day ever!").set_metadata_data({
			"author": Global.loaded_save.name
			})
			Global.loaded_save.current_stats["relationship"] += 1
			if Global.loaded_save.current_stats["relationship"] > 5:
				Global.loaded_save.current_stats["relationship"] = 5

	Global.loaded_save.available_events.append(load("uid://kxc6qn78q57n"))
