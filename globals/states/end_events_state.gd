extends State
class_name EndEventStates

@export var animation : AnimationPlayer
@export var color : ColorRect

var finished : bool = false

func enter(_previous_state : State) -> void:
	animation.stop()
	color.color = Color(0,0,0)
	var current_hightest_val : int
	var current_high : String
	for x : String in Global.loaded_save.current_stats:
		if x == "relationship" or x == "money":
			continue
		if Global.loaded_save.current_stats[x] > current_hightest_val:
			current_hightest_val = Global.loaded_save.current_stats[x]
			current_high = x
	
	Global.loaded_save.current_trait.append(current_high)
	
	if Global.loaded_save.current_age >= 3:
		finished = true
		do_ending()
		return
	
	Global.loaded_save.current_age += 1
	
	
	
	if Global.loaded_save.current_trait.size() >= 1:
		Global.loaded_save.current_sprite = Global.loaded_save.current_trait[0]
		if Global.loaded_save.current_trait.size() >= 2:
			var trait_1 := Global.loaded_save.current_trait[0]
			var trait_2 := Global.loaded_save.current_trait[1]
			var new_sprite : String
			match trait_1:
				"nerd":
					match trait_2:
						"nerd":
							new_sprite = "nerd_teen"
						"rebel":
							new_sprite = "hacker_teen"
				"rebel":
					match trait_2:
						"nerd":
							new_sprite = "hacker_teen"
						"loser":
							new_sprite = "gang_teen"
				"loser":
					match trait_2:
						"rebel":
							new_sprite = "gang_teen"
			if new_sprite.length() == 0:
				new_sprite = "basic_teen"
			Global.loaded_save.current_sprite = new_sprite

func do_ending() -> void:
	pass

func update(delta : float) -> void:
	if finished:
		transition.emit("EndGame")
	else:
		transition.emit("AgeTransition")
