extends State

@export var transtion_screen : Control
@export var label : Label

func enter(_previous_state : State) -> void:
	label.modulate = Color(1,1,1,0)
	label.text = "Age " + str(Global.loaded_save.current_age)
	transtion_screen.show()
	SignalManager.set_audio.emit(2, false)
	var tween := get_tree().create_tween()
	tween.tween_property(label, "modulate", Color(1,1,1,1), 0.8).set_ease(Tween.EASE_OUT)
	tween.chain().tween_property(label, "modulate", Color(1,1,1,0), 1.3).set_ease(Tween.EASE_IN_OUT)
	await tween.finished
	transtion_screen.hide()
	transition.emit("PlayGifting")
