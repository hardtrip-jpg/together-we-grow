@icon("uid://btfohr4avt4e7")
extends Resource
class_name CutsceneResource

@export var dialogue : GDScript
@export var images : Dictionary[String,String]
@export var positions : Dictionary[String,String]

#Use dialogues metadata options to call images and positions
