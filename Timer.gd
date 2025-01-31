extends ProgressBar

signal timeout
# Called when the node enters the scene tree for the first time.
func _ready():
	max_value = Global.TimerTime
	value = Global.TimerTime
	var tween = create_tween()
	tween.tween_property(self,'value',0,max_value)
	tween.tween_callback(emit_signal.bind('timeout'))
	pass # Replace with function body.
