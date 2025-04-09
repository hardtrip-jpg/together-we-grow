extends Control
class_name DialogueManager

@export var name_label : RichTextLabel
@export var dialogue_label : RichTextLabel

@export var background : TextureRect
@export var character_bg : TextureRect
@export var character_face : TextureRect

var current_bg : String
var current_sprite : String
var current_emoting : String

var sprites : Dictionary = {
	"baby":{"sad": "uid://cx6di2skjmvq2", "wail": "uid://c8jnmx6ulwyg3", "happy":"uid://dqcxje5ysduee", "neutral": "uid://dcq1mygndey6u"},
	"athletic":{"main": "uid://bvgw2s6feo20p", "happy":"uid://i01dlt4swgqo", "sad":"uid://doah40yu2bpv5", "neutral":"uid://dcvx4utbedvij"},
	"nerd":{"main": "uid://bvvv4wfdgmwpc", "happy":"uid://b4ud1n5y2n5p0", "sad":"uid://dqwboy7v1x3il", "neutral":"uid://ou1n4qsd8kjw"},
	"rebel":{"rebel": "uid://xlvx5gm05yme", "happy":"uid://yr5mva7uovdn", "sad":"uid://c5ws04fsbubo1", "neutral":"uid://bu84rwxil12lj"},
	"loser":{"main": "uid://c0ww5t4amglv8", "happy":"uid://c0keiyvfrhujh", "sad":"uid://dngftoxdc3nl", "neutral":"uid://eqvlup28vwq4"},
	"basic_teen":{"main":"uid://d3jb4wqkghmr3", "neutral":"uid://csxj4llbsy4iq"},
	"nerd_teen":{"main":"uid://ctm2mr6mvvkrs", "neutral":"uid://kxiv2v0fknk0"},
	"loser_teen":{"main":"uid://ct1b3chjvk0th", "neutral":"uid://bfaf0hc6npip0"},
	"hacker_teen":{"main":"uid://r7luw2bosspo", "neutral":"uid://bqxqqc32prlxh"},
	"gang_teen":{"main":"uid://cf5vt70l4ln37", "neutral":"uid://hcqeqbkx5od4"}
}


#@export var dialogue_gdscript : GDScript = null
var dialogue_engine : DialogueEngine = null

@onready var animation_player : AnimationPlayer = find_child("LogAnimationPlayer")
@onready var name_holder : PanelContainer = find_child("NameHolder")

var is_active : bool = false
signal finished_dialogue

func _ready() -> void:
	pass

func active(dialogue : GDScript) -> void:
	dialogue_engine = dialogue.new()
	dialogue_engine.dialogue_started.connect(__on_dialogue_started)
	dialogue_engine.dialogue_continued.connect(__on_dialogue_continued)
	dialogue_engine.dialogue_finished.connect(__on_dialogue_finished)
	dialogue_engine.dialogue_canceled.connect(__on_dialogue_canceled)
	

func _input(p_input_event : InputEvent) -> void:
	if !is_active:
		return
	
	if p_input_event.is_action_pressed(&"mouse_left") && is_active:
		if not animation_player.is_playing():
			dialogue_engine.advance()
		else:
			# Player is inpatient -- auto-advance the text
			var animation_name : StringName = animation_player.get_current_animation()
			var animation : Animation = animation_player.get_animation(animation_name)
			animation_player.advance(animation.get_length()) # this will fire the animation_finished signal automatically
		accept_event() # accepting input event here to stop it from traversing into into buttons possibly added through the interaction


func __on_dialogue_started() -> void:
	show()


func __on_dialogue_continued(p_dialogue_entry : DialogueEntry) -> void:
	name_holder.hide()
	if sprites[Global.loaded_save.current_sprite].get("main"):
		if current_sprite != sprites[Global.loaded_save.current_sprite]["main"]:
			current_sprite = sprites[Global.loaded_save.current_sprite]["main"]
			character_bg.texture = load(current_sprite)
	# Add the text to the log:
	var current_data := p_dialogue_entry.get_metadata_data()
	
	if current_data.has("author"):
		var author : String = p_dialogue_entry.get_metadata("author")
		name_label.set_text(author)
		name_holder.show()
	if current_data.has("background"):
		if current_data["background"] != current_bg:
			current_bg = current_data["background"]
			background.texture = load(current_bg)
	if current_data.has("emotion"):
		var emotion : String = current_data["emotion"]
		if sprites[Global.loaded_save.current_sprite].get(emotion):
			if sprites[Global.loaded_save.current_sprite][emotion] != current_emoting:
				current_emoting = sprites[Global.loaded_save.current_sprite][emotion]
				character_face.texture = load(current_emoting)
		elif sprites[Global.loaded_save.current_sprite].get("neutral"):
			current_emoting = sprites[Global.loaded_save.current_sprite]["neutral"]
			character_face.texture = load(current_emoting)
	if current_data.has("music"):
		SignalManager.set_audio.emit(current_data["music"][0],current_data["music"][1])

	dialogue_label.set_text(p_dialogue_entry.get_formatted_text())

	# Setup the animation:
	animation_player.stop(true) # internally some timers do not reset properly unless we do this
	if not animation_player.has_animation_library(&"demo"):
		var new_animation_library : AnimationLibrary = AnimationLibrary.new()
		animation_player.add_animation_library(&"demo", new_animation_library)
	var animation_library : AnimationLibrary = animation_player.get_animation_library(&"demo")
	var animation : Animation = create_visible_characters_animation_per_character(dialogue_label.get_text(), 0.045, true)
	animation_player.set_root_node(dialogue_label.get_path())
	animation_library.add_animation(&"dialogue", animation)
	animation_player.play(&"demo/dialogue")


func __on_dialogue_finished() -> void:
	is_active = false
	finished_dialogue.emit()
	#hide()


func __on_dialogue_canceled() -> void:
	print("Dialogue Canceled! Exiting...")
	hide()


func __on_animation_started(p_animation_name : StringName) -> void:
	print("Animation started:", p_animation_name)


func __on_animation_finished(p_animation_name : StringName, p_post_dialogue_callback : Callable) -> void:
	if p_animation_name == &"demo/dialogue":
		p_post_dialogue_callback.call()


# Utility function to animate the text at a constant speed
func create_visible_characters_animation_per_character(p_text : String, p_time_per_character : float, p_instant_first_character : bool = false, p_time_whitespace : bool = false)  -> Animation:
	# Do initial calculations
	var whitespace_regex : RegEx
	if not p_time_whitespace or p_instant_first_character:
		whitespace_regex = RegEx.new()
		whitespace_regex.compile("\\s")

	# Create animation and track
	var animation : Animation = Animation.new()
	var track_index : int = animation.add_track(Animation.TYPE_VALUE)
	animation.track_set_path(track_index, ".:visible_characters")
	animation.track_set_interpolation_type(track_index, Animation.INTERPOLATION_LINEAR)

	# Configure keys
	var total_time : float = 0.0
	var total_visible_characters : int = 0
	var whitespace_time_offset : float = 0.0
	animation.track_insert_key(track_index, total_time, 0)
	var total_animation_length : float = 0.0
	for character : String in p_text:
		total_time += p_time_per_character
		total_visible_characters += 1
		if not p_time_whitespace and whitespace_regex.sub(character, "", true).is_empty():
			whitespace_time_offset += p_time_per_character
			continue
		total_animation_length = total_time - whitespace_time_offset
		animation.track_insert_key(track_index, total_animation_length, total_visible_characters)
	animation.set_length(total_animation_length)

	if p_instant_first_character:
		if animation.track_get_key_count(track_index) > 0:
			# Shift all the keys back in time according to the time it took per character
			for key_index : int in animation.track_get_key_count(track_index):
				var key_time : float = animation.track_get_key_time(track_index, key_index)
				animation.track_set_key_time(track_index, key_index, key_time - p_time_per_character)
			animation.set_length(total_animation_length - p_time_per_character)
	return animation
