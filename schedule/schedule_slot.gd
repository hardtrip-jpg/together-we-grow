extends Panel
class_name ScheduleSlot

var pos : Vector2
var available : bool = true
var day : int
var tween : Tween
var active : bool = false

var event : ScheduleItemResource

var parent_func : Callable

var possibleX := [
	"uid://lmaqpu7v74yj",
	"uid://cq7x0ao4joc6o",
	"uid://dj7tf6p2f01lb",
	"uid://c4gnakjs3dbf",
	"uid://d1gt7dec630j3"
]

func _init(x : int, y : int, a_day : int) -> void:
	pos = Vector2(x,y)
	modulate = Color.WHITE
	mouse_entered.connect(mouse_enter)
	mouse_exited.connect(mouse_exit)
	day = a_day
	var margin := MarginContainer.new()
	var margin_value := 2
	margin.add_theme_constant_override("margin_top", margin_value)
	margin.add_theme_constant_override("margin_left", margin_value)
	margin.add_theme_constant_override("margin_bottom", margin_value)
	margin.add_theme_constant_override("margin_right", margin_value)
	
	margin.clip_contents
	var label := Label.new()
	label.text = str(day)
	margin.add_child(label)
	self.add_child(margin)
	custom_minimum_size = Vector2(48,41)
	set_anchors_preset(Control.PRESET_FULL_RECT)

func mouse_enter() -> void:
	parent_func.call(pos)
	#colour_switch(Color.BLUE)
	
func mouse_exit() -> void:
	parent_func.call(Vector2(-1, -1))
	#colour_switch(Color.WHITE)

func colour_switch(col : Color) -> void:
	if active:
		return
	
	if tween && tween.is_running():
		tween.kill()
	tween = get_tree().create_tween().set_ease(Tween.EASE_OUT)
	
	tween.tween_property(self, "modulate", col, 0.2)


func activate(p_event : String, col : Color) -> void:
	#if p_event.length() > 1:
		#var label := Label.new()
		#label.text = p_event
		#self.add_child(label)
	randomize()
	var x_image := load(possibleX.pick_random())
	var text_rect := TextureRect.new()
	text_rect.texture = x_image
	self.add_child(text_rect)
	
	
	active = true
	if tween && tween.is_running():
		tween.kill()
	tween = get_tree().create_tween().set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "modulate", col, 0.2)
