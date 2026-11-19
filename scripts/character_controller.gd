
extends CharacterBody3D

@export var speed: float = 5.0
@export var sprint_speed: float = 8.0
@export var jump_velocity: float = 4.5

var gravity: float = 9.8

func _physics_process(delta):
    if not is_on_floor():
        velocity.y -= gravity * delta

    var direction = Vector3.ZERO

    direction.x = Input.get_axis("move_left", "move_right")
    direction.z = Input.get_axis("move_forward", "move_backward")

    direction = direction.normalized()

    var current_speed = speed

    if Input.is_action_pressed("sprint"):
        current_speed = sprint_speed

    velocity.x = direction.x * current_speed
    velocity.z = direction.z * current_speed

    if Input.is_action_just_pressed("jump") and is_on_floor():
        velocity.y = jump_velocity

    move_and_slide()
