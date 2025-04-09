extends DialogueEngine

func _setup() -> void:
	add_text_entry("Damn, this game IS FUCKING ASS ass").set_metadata_data({"author": Global.loaded_save.name})
	add_text_entry("Let's move on from it").set_metadata_data({"author": Global.loaded_save.name})
