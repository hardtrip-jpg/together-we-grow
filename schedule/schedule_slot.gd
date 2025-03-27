extends Panel
class_name ScheduleSlot

var pos : Vector2
var available : bool = true
var day : int
var tween : Tween
var active : bool = false

var event : ScheduleItemResource

var parent_func : Callable

func _init(x : int, y : int, a_day : int) -> void:
	pos = Vector2(x,y)
	modulate = Color.WHITE
	mouse_entered.connect(mouse_enter)
	mouse_exited.connect(mouse_exit)
	day = a_day
	var label := Label.new()
	label.text = str(day)
	self.add_child(label)
	custom_minimum_size = Vector2(50,50)
	set_anchors_preset(Control.PRESET_FULL_RECT)

func mouse_enter() -> void:
	parent_func.call(pos)
	colour_switch(true)
	
func mouse_exit() -> void:
	parent_func.call(Vector2(-1, -1))
	colour_switch(false)

func colour_switch(switch : bool) -> void:
	if active:
		return
	
	if tween && tween.is_running():
		tween.kill()
	tween = get_tree().create_tween().set_ease(Tween.EASE_OUT)
	
	if switch:
		tween.tween_property(self, "modulate", Color.RED, 0.2)
	else:
		tween.tween_property(self, "modulate", Color.WHITE, 0.1)

func activate(p_event : String) -> void:
	if p_event.length() > 1:
		var label := Label.new()
		label.text = p_event
		self.add_child(label)
	
	active = true
	if tween && tween.is_running():
		tween.kill()
	tween = get_tree().create_tween().set_ease(Tween.EASE_OUT)
	
	tween.tween_property(self, "modulate", Color.BLUE, 0.2)
