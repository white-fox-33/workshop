extends AnimatableBody2D

@export var animated: bool
@export var target: Vector2
var start: Vector2
var current_target: Vector2

const SPEED = 60

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_target = target
	start = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if animated:
		position = position.move_toward(current_target,delta*SPEED)
		if position == current_target:
			match current_target:
				target:
					current_target = start
				start:
					current_target = target
