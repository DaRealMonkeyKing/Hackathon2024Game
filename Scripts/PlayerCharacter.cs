using Godot;
using System;

public partial class PlayerCharacter : CharacterBody2D
{
	private Vector2 currentVelocity;
	[Export]
	private int speed = 1000;

    public override void _PhysicsProcess(double delta)
    {
        base._PhysicsProcess(delta);

		playerMovement();
    }

	private void getInput() {
		currentVelocity = Input.GetVector("ui_left", "ui_right", "ui_up", "ui_down");
		currentVelocity *= speed;
	}

	private void playerMovement() {
		getInput();
		Velocity = currentVelocity;
		MoveAndSlide();
    }
}
