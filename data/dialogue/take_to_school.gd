extends DialogueEngine

func _setup() -> void:
	var current_hightest_val : int
	var current_high : String
	for x : String in Global.loaded_save.current_stats:
		if x == "relationship" or x == "money":
			continue
		if Global.loaded_save.current_stats[x] > current_hightest_val:
			current_hightest_val = Global.loaded_save.current_stats[x]
			current_high = x
	
	
	if current_high == "rebel":
		add_text_entry("I told you I didn't want you to drop me off").set_metadata_data({
			"background": "uid://bxkyvvwbotjsf",
			"emotion" : "neutral",
			"music": [3,false],
			"author": Global.loaded_save.name
		})
		add_text_entry("Why is it such a BIG deal??")
		add_text_entry("BECAUSE ITS EMBARRASING!").set_metadata_data({
			"author": Global.loaded_save.name,
			"emotion": "sad"
		})
		add_text_entry("You just don't get it").set_metadata_data({
			"author": Global.loaded_save.name,
		})
		Global.loaded_save.current_stats["relationship"] -= 1
		if Global.loaded_save.current_stats["relationship"] < 1:
			Global.loaded_save.current_stats["relationship"] = 1
	else:
		add_text_entry("Thanks for the lift").set_metadata_data({
			"background": "uid://bxkyvvwbotjsf",
			"emotion" : "neutral",
			"music": [3,false],
			"author": Global.loaded_save.name
		})
		add_text_entry("No problem! You let me know whenever you need anything")
		add_text_entry("Ok, got to get to class right now so I'll see you later!").set_metadata_data({
			"author": Global.loaded_save.name
		})
		add_text_entry("Love you!")
		Global.loaded_save.current_stats["relationship"] += 1
		if Global.loaded_save.current_stats["relationship"] > 5:
			Global.loaded_save.current_stats["relationship"] = 5
		
	Global.loaded_save.available_events.append(load("uid://cmf5qtikdd4iy"))
