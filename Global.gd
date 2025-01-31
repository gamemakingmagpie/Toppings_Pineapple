extends Node

var TimerTime = 120
var Score = 0
var ChannelID = ''
var IsDarkMode = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func AddScore(ScoreToAdd):
	Score += ScoreToAdd
	print(Score)
	pass
