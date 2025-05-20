extends Area2D

func _on_body_entered(_body: Node2D) -> void:
	await get_tree().create_timer(0.1).timeout
	get_tree().reload_current_scene()
