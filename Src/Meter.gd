class_name Meter extends Label

@export var UpdateSpeed:float = 0.0
@export var HideOnZero:bool = true

var _currTime:float = 0;
var _valueAdd:int = 0
var _value:int = 0

var Value:int:
	get:
		return _value

# Called when the node enters the scene tree for the first time.
func _ready():
	UpdateDisplay()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _valueAdd > 0:
		if UpdateSpeed == 0:
			_value += _valueAdd
			_valueAdd = 0
			UpdateDisplay()
			return
		_currTime += delta
		if _currTime >= UpdateSpeed:
			_currTime = 0;
			_valueAdd-=1
			_value+=1
			UpdateDisplay()


func UpdateDisplay()->void:
	if _value <= 0:
		_value = 0
		if HideOnZero:
			text = ""
		else:
			text = "0"
	else:
		text = str(_value)


func Add(value:int)->void:
	_currTime = 0;
	_valueAdd += value


func Subtract(value:int)->void:
	_value -= value
	UpdateDisplay()


func Set(value:int)->void:
	if value == 0:
		_value = 0
		UpdateDisplay()
	elif value > _value:
		Add( value - _value )
	elif value < _value:
		Subtract( _value - value)
