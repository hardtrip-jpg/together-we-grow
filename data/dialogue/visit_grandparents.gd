extends DialogueEngine

func _setup() -> void:
	Global.loaded_save.current_memory.get_or_add("grandparents", "active")
	
	add_text_entry("Wow you've grown so much!").set_metadata_data({
		"background": "uid://3c2jvxncog5u",
		"emotion": "happy",
		"author": "Meemaw"
	})
	match Global.loaded_save.current_age:
		1:
			add_text_entry("Yeah!").set_metadata_data({
				"author": Global.loaded_save.name
			})
			add_text_entry("You're already walking around!").set_metadata_data({
				"author": "Meemaw"
			})
		2:
			add_text_entry("I'm 3 feet!").set_metadata_data({
				"author": Global.loaded_save.name
			})
			add_text_entry("By next year you'll be as tall as a skyscraper!").set_metadata_data({
				"author": "Meemaw"
			})
			
		3:
			add_text_entry("I'm not fully grown yet!").set_metadata_data({
				"author": Global.loaded_save.name
			})
			add_text_entry("I think you're already taller then your Peepaw!").set_metadata_data({
				"author": "Meemaw"
			})
	add_text_entry("Now, want to help with my cookies?").set_metadata_data({
		"author": "Meemaw"
	})
	add_text_entry("Mmhhmm!").set_metadata_data({
		"author": Global.loaded_save.name
	})
	add_text_entry("You need help with anything dad?")
	add_text_entry("Eh").set_metadata_data({
		"author": "Peepaw"
	})
	Global.loaded_save.current_stats["relationship"] += 1
	if Global.loaded_save.current_stats["relationship"] > 5:
			Global.loaded_save.current_stats["relationship"] = 5
