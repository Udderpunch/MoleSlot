class_name CelebrationText extends Control

var _targetPosition:Vector2
var _value:int

var text:String:
	get:
		return $Label.text
	set(value):
		$Label.text = value


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func PerformWithTween(value:int, targetPosition:Vector2)->void:
	_value = value
	text = str(value)
	_targetPosition = targetPosition
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(2,2), .2).set_trans(Tween.TRANS_CUBIC)
	tween.tween_interval(.25)
	tween.tween_property( self, "global_position", _targetPosition, .5).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "scale", Vector2.ZERO, .15)
	tween.tween_callback(onTweenComplete)


func PerformScale(value:int)->void:
	_value = value;
	text = str(value)
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(2,2), .25).set_trans(Tween.TRANS_CUBIC)
	tween.tween_interval(.25)
	tween.tween_property(self, "scale", Vector2(0,0), .15)
	tween.tween_callback(onTweenComplete)


func PerformWithHide(value:int)->void:
	if value >= 50:
		modulate = Color.RED
	_value = value;
	text = str(value)
	var tween = get_tree().create_tween()
	tween.tween_interval(1.75)
	tween.tween_property(self, "modulate", Color(1,1,1,0), .25)
	tween.tween_callback(queue_free)


func onTweenComplete()->void:
	GlobalSignals.CelebrationMoveComplete.emit(_value)
	queue_free()



