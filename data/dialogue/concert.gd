extends DialogueEngine

func _setup() -> void:
	SignalManager.set_audio.emit(5, true)
	if Global.loaded_save.current_stats["money"] < 2:
		Global.loaded_save.current_stats["relationship"] -= 1
		if Global.loaded_save.current_stats["relationship"] < 0:
			Global.loaded_save.current_stats["relationship"] = 0
		add_text_entry("Hey... I've got some bad news").set_metadata_data({
			"background": "uid://b0qaw03j1bc7f",
			"emotion": "happy"
		})
		add_text_entry("What news?...").set_metadata_data({
			"emotion": "neutral",
			"author": Global.loaded_save.name
		})
		add_text_entry("I...")
		add_text_entry("I can't afford the tickets to the concert")
		add_text_entry("What???").set_metadata_data({
			"emotion": "sad",
			"author": Global.loaded_save.name
		})
		add_text_entry("But I thought you already had them??").set_metadata_data({
			"author": Global.loaded_save.name
		})
		add_text_entry("I'm sorry, maybe theres something else we can do tonight?")
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
		add_text_entry("Damn, this rocks right?!").set_metadata_data({
			"background": "uid://clxj22iyeqkcu",
			"emotion": "happy"
		})
		match current_high:
			"rebel":
				add_text_entry("This ROCKS!").set_metadata_data({
				"author": Global.loaded_save.name
				})
				add_text_entry("AAAA").set_metadata_data({
				"author": Global.loaded_save.name
				})
				add_text_entry("I LOVE YOU CONCRETICA").set_metadata_data({
				"author": Global.loaded_save.name
				})
				add_text_entry("OH MY GOD THEY'RE GONNA PLAY SUCK IT PANTS").set_metadata_data({
				"author": Global.loaded_save.name
				})
				Global.loaded_save.current_stats["athletic"] += 1
				Global.loaded_save.current_stats["loser"] -= 2
				Global.loaded_save.current_stats["relationship"] += 1
				if Global.loaded_save.current_stats["relationship"] > 5:
					Global.loaded_save.current_stats["relationship"] = 5
			"nerd":
				add_text_entry("HOW DID YOU FIND OUT I LOVE PUB CRAWL?").set_metadata_data({
				"author": Global.loaded_save.name
				})
				add_text_entry("I THOUGHT ONLY NERDS LIKE ME KNEW ABOUT THEM?").set_metadata_data({
				"author": Global.loaded_save.name
				})
				add_text_entry("A magician never reveals his secrets!")
				add_text_entry("THIS IS THE BEST DAY EVER").set_metadata_data({
				"author": Global.loaded_save.name
				})
				Global.loaded_save.current_stats["nerd"] += 3
				Global.loaded_save.current_stats["relationship"] += 2
				if Global.loaded_save.current_stats["relationship"] > 5:
					Global.loaded_save.current_stats["relationship"] = 5
			_:
				add_text_entry("It's pretty cool!").set_metadata_data({
				"author": Global.loaded_save.name
				})
				add_text_entry("Never heard this band before but they sound cool!").set_metadata_data({
				"author": Global.loaded_save.name
				})
				add_text_entry("Hell yeah!")
				Global.loaded_save.current_stats["athletic"] += 1
				Global.loaded_save.current_stats["loser"] -= 1

	Global.loaded_save.available_events.append(load("uid://kxc6qn78q57n"))
