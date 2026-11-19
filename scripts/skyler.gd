
extends CharacterBody3D

@export var character_name = "Skyler"
@export var move_speed = 5.0
@export var jump_strength = 4.5

var gravity = 9.8

func _physics_process(delta):
    if not is_on_floor():
        velocity.y -= gravity * delta

    var input_dir = Vector2.ZERO

    if Input.is_action_pressed("move_forward"):
        input_dir.y -= 1

    if Input.is_action_pressed("move_backward"):
        input_dir.y += 1

    if Input.is_action_pressed("move_left"):
        input_dir.x -= 1

    if Input.is_action_pressed("move_right"):
        input_dir.x += 1

    input_dir = input_dir.normalized()

    velocity.x = input_dir.x * move_speed
    velocity.z = input_dir.y * move_speed

    if Input.is_action_just_pressed("jump") and is_on_floor():
        velocity.y = jump_strength

    move_and_slide()
