extends Node


class Child:
	var Stats : Dictionary[String,float]
	var Interests : Array[String]
	var Tags : Array[String]
	
	func _init() -> void:
		Stats = {
			"happiness": randf_range(80,100),
			"relationship": randf_range(90,100),
			"intelligence": randf_range(0,30),
			"athleticsm": randf_range(50,60),
			"socialability": randf_range(0,100),
			"selfishness": randf_range(0,100),
			"cleanliness": randf_range(0,30),
			"stress": randf_range(0,20),
			"health": randf_range(10,100),
			"age": 0.0,
			"energy": 100.0,
			}
	
	func check_tags() -> void:
		pass
	
