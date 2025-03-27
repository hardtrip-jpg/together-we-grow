extends State
class_name LoadingState

@export var loading_screen : Control
@export var event_holder : Node

var event_instance : Node
var cur_event_path : String

func _ready() -> void:
	SignalManager.load_event.connect(load_event)
	Console.add_command("loadevent", load_event, ["Event name"], 1, "Load an event based on scene name")

func enter(_previous_state : State) -> void:
	#loading_screen.show()
	pass

func update(delta: float) -> void:
	var progress := []
	var status := ResourceLoader.load_threaded_get_status(cur_event_path, progress)
	if status == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
		Console.print_line(str(progress[0] * 100), true)
		loading_screen.progress_bar.value = progress[0] * 100
	elif status == ResourceLoader.THREAD_LOAD_LOADED:
		loading_screen.hide()
		Console.print_line("Level Loaded", true)
		change_scene(ResourceLoader.load_threaded_get(cur_event_path))
		transition.emit("IntroSequence")
	elif status == ResourceLoader.THREAD_LOAD_FAILED:
		Console.print_error("%s failed to load" % cur_event_path, true)
		transition.emit("MainMenu")


func unload_level() -> void:
	if is_instance_valid(event_instance):
		event_instance.queue_free()
	event_instance = null

func load_event(event_path : String) -> void:
	unload_level()
	
	if event_path.is_absolute_path() == false:
		Console.print_error("%s is not a valid level" % event_path, true)
		return
	
	cur_event_path = event_path
	#Global.current_level = level_name
	
	if OS.get_name() == "Web":
		change_scene(load(event_path))
		transition.emit("IntroSequence")
		return
	transition.emit("Loading")

	if(ResourceLoader.has_cached(event_path)):
		ResourceLoader.load_threaded_get(event_path)
	else:
		ResourceLoader.load_threaded_request(event_path, "", true)

func change_scene(resource : PackedScene) -> void:
	event_instance = resource.instantiate()
	event_holder.add_child(event_instance)
	
	for x in event_holder.get_children():
		if x != event_instance:
			event_holder.remove_child(x)
			x.queue_free()
