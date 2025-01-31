extends Control
class_name apple_game

const Margin = Vector2(2.0,2.0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func ShowPanel(PointA:Vector2i,PointB:Vector2i,_time:float = 1.0):	
	var newPanel = Panel.new()
	newPanel.add_theme_stylebox_override('panel',load("res://FlatStylebox.tres"))
	var Size = PointB-PointA
	newPanel.size = Vector2(Size.x*size.x/18.0,Size.y*size.y/11.0)+Margin+Vector2(0,2)
	newPanel.position = Vector2(PointA.x*size.x/18.0,PointA.y*size.y/11.0)+Vector2(size.x/18.0,size.y/11.0)/2.0-Margin/2.0 - Vector2(1,2)
	add_child(newPanel)
	var tween = create_tween()
	tween.tween_interval(1.0)
	tween.tween_property(newPanel,'modulate',Color(1.0,1.0,1.0,0.0),0.2)
	tween.tween_callback(newPanel.queue_free)
	pass
