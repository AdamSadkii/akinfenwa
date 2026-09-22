extends CharacterBody2D


const SPEED = 900.0
const JUMP_VELOCITY = -1250.0

var goal_counter = 0
var spawn_position: Vector2

@onready var goal_label = %goal_label

func _ready() -> void:
	spawn_position = global_position

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	# Fell off the map -> respawn at the start.
	if global_position.y > spawn_position.y + 2500.0:
		global_position = spawn_position
		velocity = Vector2.ZERO

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("ball"):
		set_goals(goal_counter + 1)

func set_goals(new_goal_count: int) -> void:
	goal_counter = new_goal_count
	goal_label.text = "premier league goals: " + str(goal_counter)
