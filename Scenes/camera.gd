extends Camera2D

@onready var player: Node2D = null

func _process(_delta: float) -> void:
    if player != null:
        global_position = player.global_position