extends State
class_name MainDebugState

func start() -> void:
	Console.add_command("mainto", transition_to, ["State"], 1, "Transition the main state to a new one")

func transition_to(to : String) -> void:
	transition.emit(to)
