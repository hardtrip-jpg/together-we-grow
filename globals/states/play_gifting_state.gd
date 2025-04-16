extends State
class_name PlayGiftingState

@export var gift_manager : GiftingManager
@export var animation : AnimationPlayer
@export var dialogue_screen : DialogueManager

func enter(_previous_state : State) -> void:
	gift_manager.init_giftshop()
	gift_manager.show()
	animation.play("fade_out")

func update(delta : float) -> void:
	done()
	
func done() -> void:
	var set_scene : String = await gift_manager.gift_selected
	animation.play("fade_in")
	await animation.animation_finished
	gift_manager.hide()
	var gifting_scene : GDScript
	match Global.loaded_save.current_age:
		1:
			gifting_scene = load("uid://bk28e3eqiks32")
		2:
			pass
		3:
			pass
	dialogue_screen.active(gifting_scene)
	dialogue_screen.dialogue_engine.advance()
	
	transition.emit("ShowGifting")
	animation.play("fade_out")
