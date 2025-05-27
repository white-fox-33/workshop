extends CharacterBody2D

var score = 0

const SPEED = 150.0
const JUMP_VELOCITY = -300.0

@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var label: Label = $Camera2D/Label

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if direction >0:
		sprite.flip_h = false
	if direction < 0:
		sprite.flip_h = true
	
	if is_on_floor():
		if direction == 0:
			sprite.play("idle")
		else:
			sprite.play("run")
	else:
		sprite.play("jump")

	move_and_slide()

func add_score():
	score += 1
	label.text = str(score)
