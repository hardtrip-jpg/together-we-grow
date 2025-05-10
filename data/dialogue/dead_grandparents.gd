extends DialogueEngine

func _setup() -> void:
	SignalManager.set_audio.emit(5, false)
	add_text_entry("why did meemaw and peepaw have to die").set_metadata_data({
		"background": "uid://cdk4rghualxn3x",
		"emotion": "sad",
		"author": Global.loaded_save.name
	})
	add_text_entry("It's not fair").set_metadata_data({
		"author": Global.loaded_save.name
	})
	add_text_entry("It never is " + Global.loaded_save.name +", but death is a normal part of life")
	add_text_entry("It's what brings meaning to every moment in your life")
	add_text_entry("You have to remember to cherish those moments, every day of every hour")
	add_text_entry("It just hurts though").set_metadata_data({
		"author": Global.loaded_save.name
	})
	add_text_entry("I know....")
	add_text_entry("I know")
	add_text_entry("We are gathered here to celebrate the life and death of two beings who've brought so much joy to the world").set_metadata_data({
		"author": "Priest"
	})
