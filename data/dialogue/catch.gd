extends DialogueEngine

func _setup() -> void:
	add_text_entry("Here we go! Catch!").set_metadata_data({
		"background": "uid://cip0qlaly3aga",
		"emotion": "happy",
	})
	SignalManager.set_audio.emit(2, true)
	
	match Global.loaded_save.current_age:
		1:
			add_text_entry("EEE!").set_metadata_data({
			"emotion": "sad",
			"author": Global.loaded_save.name
			})
			add_text_entry("You caught it!")
			add_text_entry("Yippi!").set_metadata_data({
			"emotion": "happy",
			"author": Global.loaded_save.name
			})
		2:
			add_text_entry("Caught it!!").set_metadata_data({
			"author": Global.loaded_save.name
			})
			add_text_entry("Awesome now throw it back!")
			add_text_entry("Huh!!").set_metadata_data({
			"author": Global.loaded_save.name
			})
			add_text_entry("You gotta throw harder then that!")
			add_text_entry("You're too far!!").set_metadata_data({
			"emotion": "sad",
			"author": Global.loaded_save.name
			})
			add_text_entry("Try again! You've got this!")
		3:
			add_text_entry("So how's school?")
			if Global.loaded_save.current_stats["nerd"] > 4:
				add_text_entry("Not bad! My lowest grade right now is 80 percent").set_metadata_data({
				"emotion": "neutral",
				"author": Global.loaded_save.name
				})
				add_text_entry("That's great to hear!")
			else:
				add_text_entry("It's been better").set_metadata_data({
				"emotion": "neutral",
				"author": Global.loaded_save.name
				})
				add_text_entry("Do you need help studying?")
				add_text_entry("No it's fine I'm passing everything").set_metadata_data({
				"emotion": "neutral",
				"author": Global.loaded_save.name
				})
			add_text_entry("School is so different then it was when I was a kid")
			add_text_entry("Yeah, you are old!").set_metadata_data({
				"emotion": "happy",
				"author": Global.loaded_save.name
				})
			add_text_entry("Hey!")
	Global.loaded_save.current_stats["athletic"] += 2
	Global.loaded_save.current_stats["relationship"] += 1
	if Global.loaded_save.current_stats["relationship"] > 5:
			Global.loaded_save.current_stats["relationship"] = 5
	Global.loaded_save.available_events.append(load("uid://brs6v5acrj7t2"))
