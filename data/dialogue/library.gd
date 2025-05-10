extends DialogueEngine

func _setup() -> void:
	SignalManager.set_audio.emit(1, true)
	var current_hightest_val : int
	var current_high : String
	for x : String in Global.loaded_save.current_stats:
		if x == "relationship" or x == "money":
			continue
		if Global.loaded_save.current_stats[x] > current_hightest_val:
			current_hightest_val = Global.loaded_save.current_stats[x]
			current_high = x
	
	add_text_entry("So what are you gonna read?").set_metadata_data({
		"background": "uid://dgmcywdi1pw7f",
		"emotion": "neutral"
	})
	
	match Global.loaded_save.current_age:
		1:
			add_text_entry("Bear book! Bear book!").set_metadata_data({
			"author": Global.loaded_save.name
			})
			add_text_entry("Oh! The bear book, want me to read it to you?")
			add_text_entry("Yes!").set_metadata_data({
			"author": Global.loaded_save.name,
			"emotion": "happy"
			})
			add_text_entry("Alright! There once was a bear...")
		2:
			add_text_entry("I don't know yet. Too many books to pick.").set_metadata_data({
			"author": Global.loaded_save.name
			})
			add_text_entry("How about this one called Moby Dick?")
			add_text_entry("....").set_metadata_data({
			"author": Global.loaded_save.name,
			"emotion": "sad"
			})
			add_text_entry("Ha! You should see your face!")
			add_text_entry("What face?").set_metadata_data({
			"author": Global.loaded_save.name,
			"emotion": "neutral"
			})
			add_text_entry("You looked so scared by the book!")
			add_text_entry("Nuh huh! I wasn't scared!").set_metadata_data({
			"author": Global.loaded_save.name,
			"emotion": "neutral"
			})
			add_text_entry("I'm gonna read it to show you!").set_metadata_data({
			"author": Global.loaded_save.name,
			"emotion": "neutral"
			})
		3:
			add_text_entry("I was thinking of checking out this columbian book").set_metadata_data({
			"author": Global.loaded_save.name
			})
			add_text_entry("Oh 100 years of solitude! Classic!")
			add_text_entry("I heard its really wierd").set_metadata_data({
			"author": Global.loaded_save.name,
			"emotion": "happy"
			})
			add_text_entry("Kind of... You should try it I think you'll like it!")
	
	Global.loaded_save.current_stats["nerd"] += 2
	
	if current_high == "nerd":
		Global.loaded_save.current_stats["relationship"] += 1
		if Global.loaded_save.current_stats["relationship"] > 5:
			Global.loaded_save.current_stats["relationship"] = 5
	Global.loaded_save.available_events.append(load("uid://cjva2qx6xy0ba"))
