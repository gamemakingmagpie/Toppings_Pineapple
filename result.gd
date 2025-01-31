extends Control

var ClearTime:float = 0.0:
	set(value):
		ClearTime = value

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func Update():
	$Label.text = '%d점'%(Global.Score)
	if Global.Score == 170:
		$CleartimeLabel.visible = true
		$CleartimeLabel.text = '클리어 시간 : %.1f초'%ClearTime
		pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://start.tscn")
	pass # Replace with function body.


func _on_button_2_pressed():
	get_tree().reload_current_scene()
	pass # Replace with function body.
