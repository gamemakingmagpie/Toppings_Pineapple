extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/HBoxContainer2/DarkmodeCheckbox.button_pressed = Global.IsDarkMode
	ApplyDarkMode()
	pass # Replace with function body.


func _on_channel_id_input_text_changed(new_text):
	print(new_text)
	Global.ChannelID = new_text
	pass # Replace with function body.


func _on_start_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
	pass # Replace with function body.


func _on_timer_time_value_changed(value):
	$VBoxContainer/HBoxContainer/TimerLabel.text = str(value)+'초'
	Global.TimerTime = value
	pass # Replace with function body.


func _on_darkmode_checkbox_pressed():
	Global.IsDarkMode = $VBoxContainer/HBoxContainer2/DarkmodeCheckbox.button_pressed
	ApplyDarkMode()
	pass # Replace with function body.

func ApplyDarkMode():
	if Global.IsDarkMode:
		$Panel.modulate = Color.BLACK
		$VBoxContainer/ChannelID.modulate = Color.WHITE
		$VBoxContainer/Label.modulate = Color.WHITE
		$VBoxContainer/HBoxContainer/TimerLabel.modulate = Color.WHITE
		$VBoxContainer/HBoxContainer2/DarkmodeLabel.modulate = Color.WHITE
	else:
		$Panel.modulate = Color.LIGHT_GREEN
		$VBoxContainer/ChannelID.modulate = Color.BLACK
		$VBoxContainer/Label.modulate = Color.BLACK
		$VBoxContainer/HBoxContainer/TimerLabel.modulate = Color.BLACK
		$VBoxContainer/HBoxContainer2/DarkmodeLabel.modulate = Color.BLACK
