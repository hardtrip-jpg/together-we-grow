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
		if Global.loaded_save.current_stats["relationship"] < 0:
			Global.loaded_save.current_stats["relationship"] = 0
	else:
		add_text_entry("Thanks for taking me to school today").set_metadata_data({
			"background": "uid://bxkyvvwbotjsf",
			"emotion" : "neutral",
			"music": [3,false],
			"author": Global.loaded_save.name
		})
		add_text_entry("No problem! You let me know whenever you need anything")
		add_text_entry("Thanks! Love you!").set_metadata_data({
			"author": Global.loaded_save.name
		})
		add_text_entry("Love you too!")
		Global.loaded_save.current_stats["relationship"] += 1
		if Global.loaded_save.current_stats["relationship"] > 5:
			Global.loaded_save.current_stats["relationship"] = 5
		
