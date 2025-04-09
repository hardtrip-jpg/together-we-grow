extends State
class_name PlayGiftingState

@export var gift_manager : GiftingManager
@export var animation : AnimationPlayer

func enter(_previous_state : State) -> void:
	gift_manager.init_giftshop()
	gift_manager.show()
	animation.play("fade_out")

func update(delta : float) -> void:
	done()
	
func done() -> void:
	await gift_manager.gift_selected
	animation.play("fade_in")
	await animation.animation_finished
	gift_manager.hide()
	transition.emit("PlaySchedule")
	animation.play("fade_out")
