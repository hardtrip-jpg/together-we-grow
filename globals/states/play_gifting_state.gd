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
			match set_scene:
				"good":
					gifting_scene = load("uid://b7kb3krjq0os7")
				"bad":
					gifting_scene = load("uid://ca4qlcecb4go7")
				"neutral":
					gifting_scene = load("uid://dunma0dxwag0p")
		3:
			match set_scene:
				"good":
					gifting_scene = load("uid://gj75gpffd5rr")
				"bad":
					gifting_scene = load("uid://dpgp3gmg34w15")
				"neutral":
					gifting_scene = load("uid://dofn1r5d78oqd")
	dialogue_screen.active(gifting_scene)
	dialogue_screen.dialogue_engine.advance()
	
	transition.emit("ShowGifting")
	animation.play("fade_out")
