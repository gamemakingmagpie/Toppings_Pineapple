extends Control

@onready var Game:apple_game = $apple_game

var A = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R"]
var a = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k"]
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.Score = 0
	if Global.IsDarkMode:
		$Panel.modulate = Color.BLACK
		$Timer.modulate = Color.DIM_GRAY
	else:
		$Panel.modulate = Color.LIGHT_GREEN
		$apple_game/Grid.modulate = Color.BLACK
		$Timer.modulate = Color.DARK_GREEN
		$Score.modulate = Color.BLACK
	
	pass # Replace with function body.


func _on_reroll_pressed():
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://start.tscn")
	pass # Replace with function body.


func _on_cursor_matched(AddScore):
	Global.AddScore(AddScore)
	$Score.text = str(Global.Score)
	if Global.Score == 170:
		ShowResult()
	pass # Replace with function body.


func _on_chat_receiver_chat_received(Nickname, Msg):
	print(Msg)
	if Msg.length()!=4:return
	if not A.has(Msg[0]):return
	if not a.has(Msg[1]):return
	if not A.has(Msg[2]):return
	if not a.has(Msg[3]):return
	Game.ShowPanel(Vector2i(A.find(Msg[0]),a.find(Msg[1])),Vector2i(A.find(Msg[2]),a.find(Msg[3])))
	pass # Replace with function body.


func _on_button_pressed():
	_on_chat_receiver_chat_received('DEBUG',$LineEdit.text)
	pass # Replace with function body.

func ShowResult():
	$Cursor.queue_free()
	var Result = load("res://result.tscn").instantiate()
	add_child(Result)
	Result.ClearTime = Global.TimerTime - $Timer.value
	Result.Update()
	


func _on_timer_timeout():
	ShowResult()
	pass # Replace with function body.
