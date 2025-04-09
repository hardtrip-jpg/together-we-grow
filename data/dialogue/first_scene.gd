extends DialogueEngine

func _setup() -> void:
	add_text_entry("Welcome to [rainbow freq=1.0 sat=0.4 val=0.8]Together We Grow[/rainbow]! 
	Click [shake rate=20.0 level=5 connected=1]Left Mouse[/shake] to advance").set_metadata_data({
		"background": "uid://dx1hiuvhigfmx",
		"emotion": "uid://dcq1mygndey6u"
	})
	add_text_entry("In life, you must schedule. Are you ready to?")
	add_text_entry("WAHHHH WEHH WEEEHAHH").set_metadata_data(
		{
			"author": Global.loaded_save.name,
			"emotion": "uid://c8jnmx6ulwyg3"
		}
	)
	add_text_entry("Looks like you already have a lot on your hands, I'll leave you to it!")
	add_text_entry("Good luck!")
