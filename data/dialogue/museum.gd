extends DialogueEngine

func _setup() -> void:
	SignalManager.set_audio.emit(2, false)
	var current_hightest_val : int
	var current_high : String
	for x : String in Global.loaded_save.current_stats:
		if x == "relationship" or x == "money":
			continue
		if Global.loaded_save.current_stats[x] > current_hightest_val:
			current_hightest_val = Global.loaded_save.current_stats[x]
			current_high = x
	
	if Global.loaded_save.current_stats["money"] < 1:
		Global.loaded_save.current_stats["relationship"] -= 1
		if Global.loaded_save.current_stats["relationship"] < 0:
			Global.loaded_save.current_stats["relationship"] = 0
		add_text_entry("You don't offer a parent discount?").set_metadata_data({
		"background": "uid://bv0pikkwxu1vb",
		"emotion": "neutral",
		})
		add_text_entry("It's only 1$. There's nothing too discount.").set_metadata_data({
			"author": "Ticket Salesman"
		})
		add_text_entry("So no museum..").set_metadata_data({
			"author": Global.loaded_save.name,
			"emotion": "sad"
		})
		add_text_entry("I'm sorry we'll go to the museum next time")
	else:
		Global.loaded_save.current_stats["money"] -= 1
		add_text_entry("Hey! Look at this one!").set_metadata_data({
			"background": "uid://bv0pikkwxu1vb",
			"emotion": "neutral",
		})
		match Global.loaded_save.current_age:
			1:
				add_text_entry("Eee! Look funny").set_metadata_data({
					"author": Global.loaded_save.name,
					"emotion": "happy"
				})
				add_text_entry("Yeah, really looks goofy here")
				add_text_entry("Dinosaur!").set_metadata_data({
					"author": Global.loaded_save.name,
				})
				add_text_entry("Yes! Dinosaur!")
			2:
				add_text_entry("Ew! What is that!").set_metadata_data({
					"author": Global.loaded_save.name,
					"emotion": "sad"
				})
				add_text_entry("You don't like it?!")
				add_text_entry("It looks so gross!").set_metadata_data({
					"author": Global.loaded_save.name,
					"emotion": "happy"
				})
				add_text_entry("Well that's what we call art around here")
				add_text_entry("I can do that!").set_metadata_data({
					"author": Global.loaded_save.name,
				})
				add_text_entry("Trust me it's not that easy!")
			3:
				add_text_entry("Woah").set_metadata_data({
					"author": Global.loaded_save.name,
					"emotion": "happy"
				})
				add_text_entry("Am I right?!")
				add_text_entry("How'd they even do that?").set_metadata_data({
					"author": Global.loaded_save.name,
					"emotion": "happy"
				})
				add_text_entry("Read the description")
				add_text_entry("huh.. [i]mummbling[/i]").set_metadata_data({
					"author": Global.loaded_save.name,
					"emotion": "happy"
				})
				add_text_entry("EWW They used poop!").set_metadata_data({
					"author": Global.loaded_save.name,
					"emotion": "sad"
				})
				add_text_entry("Hahaha!!")
				add_text_entry("It was the first thing I saw! Ha!")
		
		Global.loaded_save.current_stats["nerd"] += 2
		Global.loaded_save.current_stats["loser"] += 1
		Global.loaded_save.current_stats["rebel"] += 1
	
		if current_high == "nerd":
			Global.loaded_save.current_stats["relationship"] += 1
			if Global.loaded_save.current_stats["relationship"] > 5:
				Global.loaded_save.current_stats["relationship"] = 5
	Global.loaded_save.available_events.append(load("uid://cjs3icl4ecrpf"))
