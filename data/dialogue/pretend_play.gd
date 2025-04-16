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
	
	
	match current_high:
		"athletic":
			add_text_entry("Grenade incoming! Soldier get down!").set_metadata_data({
				"background": "uid://b0qaw03j1bc7f",
				"emotion" : "neutral",
				"music": [4,true]
			})
			add_text_entry("AAAAHH!").set_metadata_data({
				"author": Global.loaded_save.name,
				"emotion": "sad"
			})
			add_text_entry("...")
			add_text_entry("I'm ok!").set_metadata_data({
				"author": Global.loaded_save.name,
				"emotion": "happy"
			})
		"nerd":
			add_text_entry("The patient is going under. Doctor do something!").set_metadata_data({
				"background": "uid://b0qaw03j1bc7f",
				"emotion" : "neutral",
				"music": [4,true]
			})
			add_text_entry("Stay calm. I will save them.").set_metadata_data({
				"author": Global.loaded_save.name,
			})
			add_text_entry("...")
			add_text_entry("He's alive!").set_metadata_data({
				"author": Global.loaded_save.name,
				"emotion": "happy"
			})
		"rebel":
			add_text_entry("You've come to wrong part of town mister").set_metadata_data({
				"background": "uid://b0qaw03j1bc7f",
				"emotion" : "neutral",
				"music": [4,true]
			})
			add_text_entry("You sure bout that").set_metadata_data({
				"author": Global.loaded_save.name,
			})
			add_text_entry("...")
			add_text_entry("BANG!").set_metadata_data({
				"author": Global.loaded_save.name,
				"emotion": "happy"
			})
		"loser":
			add_text_entry("The great beast is just beyond the mountain").set_metadata_data({
				"background": "uid://b0qaw03j1bc7f",
				"emotion" : "neutral",
				"music": [4,true]
			})
			add_text_entry("Let's kill it!").set_metadata_data({
				"author": Global.loaded_save.name,
				"emotion": "happy"
			})
			add_text_entry("...").set_metadata_data({
				"emotion": "neutral"
			})
			add_text_entry("Ok!").set_metadata_data({
			})
			add_text_entry("YIPPIE!").set_metadata_data({
				"author": Global.loaded_save.name,
				"emotion": "happy"
			})
	Global.loaded_save.current_stats["relationship"] += 1
	if Global.loaded_save.current_stats["relationship"] > 5:
		Global.loaded_save.current_stats["relationship"] = 5
	
