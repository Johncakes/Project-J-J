extends Node2D


@onready var canvas_layer = $Player/Camera2D/CanvasLayer
@onready var canvas_modulate = $CanvasModulate
@onready var ui = $Player/Camera2D/CanvasLayer/DayNightCycleUI


func _ready() -> void:
	canvas_layer.visible = true
	canvas_modulate.time_tick.connect(ui.set_daytime)
