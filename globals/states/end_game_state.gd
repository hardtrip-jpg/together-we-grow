extends State

@export var screen : Control
@export var ending_label : Label
@export var anim : AnimationPlayer
@export var label : Label
@export var age_trans : Control
@export var age_label : Label


var end_string : String
var relationship_string : String

signal move_forward

func enter(_previous_state : State) -> void:
	SignalManager.set_audio.emit(1, false)
	print(Global.loaded_save.current_trait)
	if anim.is_playing():
		await anim.animation_finished
	age_label.text = "Adult"
	age_label.modulate = Color(1,1,1,0)
	label.modulate = Color(1,1,1,0)
	label.show()
	age_trans.show()
	var tween := get_tree().create_tween()
	tween.tween_property(age_label, "modulate", Color(1,1,1,1), 0.8).set_ease(Tween.EASE_OUT)
	tween.chain().tween_property(age_label, "modulate", Color(1,1,1,0), 1.3).set_ease(Tween.EASE_IN_OUT)
	screen.show()
	await tween.finished
	determine_ending()
	ending_label.text = end_string
	anim.play("fade_out")
	await anim.animation_finished
	anim.play("fade_in_text")
	await move_forward
	anim.play("fade_in")
	label.modulate = Color(1,1,1,0)
	await anim.animation_finished
	ending_label.text = relationship_string
	anim.play("fade_out")
	await anim.animation_finished
	anim.play("fade_in_text")
	await move_forward
	anim.play("fade_in")
	label.modulate = Color(1,1,1,0)
	await anim.animation_finished
	ending_label.text = "Thanks for playing!"
	anim.play("fade_out")
	

func update(_delta : float) -> void:
	if Input.is_action_just_pressed("mouse_left"):
		move_forward.emit()



func determine_ending() -> void:
	var traits_list : Array[String]
	for x in Global.loaded_save.current_trait:
		if traits_list.find(x) == -1:
			traits_list.append(x)
	
	match traits_list.size():
		1:
			end_string = do_one(traits_list)
		2:
			end_string = do_two(traits_list)
		3:
			end_string = do_three(traits_list)
		_:
			end_string = do_one(traits_list)
	
	
	match Global.loaded_save.current_stats["relationship"]:
		1:
			relationship_string = "You have a hard time keeping track of "+ Global.loaded_save.name +" ever since they moved out. They send you updates from time to time, often asking for money. They still come for the holidays."
		2:
			relationship_string = Global.loaded_save.name + " still calls in from time to time, but their being in another country makes it hard to visit. They still try for the holidays."
		3:
			relationship_string = Global.loaded_save.name + " calls on a bi weekly basis. You don't talk for long, but its nice to know they're doing fine. They sometimes visit randomly just say hi."
		4:
			relationship_string = Global.loaded_save.name + " doesn't live too far from you and does regular check ins. They still love spending time with you and often invite you on small excursions."
		5:
			relationship_string = Global.loaded_save.name + " visits nearly every day. They try to help with chores and makes sure you are living your fullest life as much as they are."
		_:
			relationship_string = ""
	
	print(end_string)
	print(relationship_string)

func do_one(array : Array[String]) -> String:
	match array[0]:
		"loser":
			return Global.loaded_save.name + " currently works at a small convenience store. They've worked there for a number of years and have recently been promoted as manager. They make the most of it."
		"nerd":
			return Global.loaded_save.name + ' is currently doing research work in "bionic fractionalization" or whatever that means. They might be making it up, but they still make quite a comfortable living.'
		"athletic":
			return Global.loaded_save.name + ' teaches both yoga and tennis classes. They make a habit of healthy living, apparently walking everywhere they go.'
		"rebel":
			return Global.loaded_save.name + ' has reached some amount of fame and noteriaty over the years. This mainly comes from their many works of graffiti, one of which was recently sold in auction for 20,000$.'
		_:
			return ""

func do_two(array : Array[String]) -> String:
	var return_string : String = ""
	if array.find("loser") != -1:
		if array.find("nerd") != -1:
			return_string = Global.loaded_save.name + " currently works in small video game store. They've worked long enough to rise to manager status with the hopes of reaching regional soon. They've also amased a small fortune through their trading card investments."
		elif array.find("athletic") != -1:
			return_string = Global.loaded_save.name + " works as construction worker for a family owned operation. They've recently been very interested in building their own car, having already bought many of the parts."
		elif array.find("rebel") != -1:
			return_string = Global.loaded_save.name + " currently works for a massive video game company. Though the work sounds interesting, most of their time is spent complaining about the low wages"
	elif array.find("nerd") != -1:
		if array.find("athletic") != -1:
			return_string = Global.loaded_save.name + 'currently works as a 3rd year attending doctor in an ER. The hours are apparently grueling, but "thats a small price to pay when saving lives" so they say.'
		elif array.find("rebel") != -1:
			return_string = Global.loaded_save.name + " is currently taking a small break from the art world. Ever since their art got shown at a famous museum, they've been getting non stop calls for work opportunities."
	else:
		return_string = Global.loaded_save.name + " isn't currently working. They've been auditioning for small roles here and there but nothing has stuck. However, the big film they worked on last summer is currently touring different festivals and has been getting great reception."
	return return_string

func do_three(array : Array[String]) -> String:
	var return_string : String = ""
	if array.find("loser") != -1:
		if array.find("nerd") != -1:
			if array.find("athletic") != -1:
				return_string = Global.loaded_save.name + " tried out being a chef for a while, but it didn't really stick. They now work as a diet consultant for their own firm. They've given you tips for a better diet, but its been hard to stick with it."
			else:
				return_string = Global.loaded_save.name + " is currently working in tech. You are not sure what exactly they do, even after the hundreth time they've explained it, but you know it's important. You also know it's relativly secretive."
		else:
			return_string = Global.loaded_save.name + " joined the military. The first couple of months of them gone we're the toughest, then you realized they were assigned as a traffic technician."
	else:
		return_string = Global.loaded_save.name + " applied as local governance and is currently running for a higher ranking position. They seem to really do well as a politician, even if you don't with their position on nuclear."
	
	return return_string
