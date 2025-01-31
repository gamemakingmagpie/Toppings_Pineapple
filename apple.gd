extends Control
class_name apple
var Velocity := Vector2(0,-1000)
var Number:int = 1:
	set(value):
		Number = value
		if NumberLabel:
			NumberLabel.text = str(Number)
const GRAVITY = 5000
@onready var NumberLabel:= $Number
# Called when the node enters the scene tree for the first time.
func _ready():
	Number = randi_range(1,9)
	set_physics_process(false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	Velocity.y += delta *GRAVITY
	position += Velocity * delta
	if position.y>10000:queue_free()
	pass

func Remove():
	var Placeholder := Control.new()
	Placeholder.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	add_sibling(Placeholder)
	reparent(get_parent().get_parent().get_parent())
	Velocity.x = (randi_range(-2,2)+0.5) * 300
	Velocity.y += (randi_range(-2,2)+0.5) * 100
	set_physics_process(true)
	#queue_free()
