extends Area2D

@export_file("*.tscn") var scene_to_load: String

func _ready():
    body_entered.connect(on_body_entered)

func on_body_entered(body: Node2D) -> void:
    print("Body entered: ", body.name)
    if body.name == "PlayerController":
        get_tree().change_scene_to_file(scene_to_load)
