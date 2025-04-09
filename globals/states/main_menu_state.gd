extends State
class_name MainMenuState

@export var menu : Control
@export var play : Button
@export var quit : Button
@export var animation : AnimationPlayer

func start() -> void:
	play.pressed.connect(func () -> void: transition_to("StartScene"))
	quit.pressed.connect(func () -> void: get_tree().quit())
	
	Console.add_command("mainto", transition_to, ["State"], 1, "Transition the main state to a new one")

func enter(_previous_state : State) -> void:
	menu.show()
	animation.play("fade_out")

func exit() -> void:
	animation.play("fade_in")
	await animation.animation_finished
	menu.hide()

func transition_to(to : String) -> void:
	transition.emit(to)
