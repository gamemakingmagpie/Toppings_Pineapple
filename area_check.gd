extends Area2D
class_name area_check
@export var AppleGame:apple_game
var TopRight:= Vector2(0,0)
@onready var Collision := $CollisionShape2D
@onready var VisibleCollision := $Panel
signal Matched(Count)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	Collision.position = (get_global_mouse_position()-TopRight)/2.0+TopRight
	Collision.shape.size = (get_global_mouse_position()-TopRight).abs()	
	VisibleCollision.size = (get_global_mouse_position()-TopRight).abs()
	VisibleCollision.position = (get_global_mouse_position()-TopRight)/2.0+TopRight - VisibleCollision.size/2.0
	pass

func CheckArea():
	var Total = 0
	var Num:int = 0 
	var Overlaps = get_overlapping_areas()
	for each in Overlaps:
		var Apple = each.get_parent()
		if  Apple is apple:
			Total+=Apple.Number
			Num += 1
	if Total == 10:
		for each in Overlaps:
			var Apple = each.get_parent()
			if  Apple is apple:
				Apple.Remove()
		Matched.emit(Num)
	queue_free()
	pass
