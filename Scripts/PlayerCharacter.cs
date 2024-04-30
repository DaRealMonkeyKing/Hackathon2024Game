using Godot;
using System;
using System.Runtime.CompilerServices;
using System.Runtime.ConstrainedExecution;

namespace Godot;

public partial class PlayerCharacter : CharacterBody2D
{
	private Vector2 currentVelocity;
	[Export]
	private Vector2 playerDirection;

	// Player movement speed
	private int speed = 1000;
	// Dash parameters
	private bool dashing = false;
	private int dashAcceleration = -150;
	private int dashSpeed = 3000;
	// private int dashCooldown = 5;

	private Vector2 mousePos;
	private Vector2 mouseDirection;
	private const int MAX_HP = 100;
	private int health = MAX_HP;
	private ProgressBar hpBar;

	public override void _PhysicsProcess(double delta)
	{
		base._PhysicsProcess(delta);

		playerMovement();
	}

    public override void _Ready()
    {
        hpBar = GetNode<ProgressBar>("HealthBar");
		hpBar.Value = MAX_HP;
    }

    private void getInput() {
		if (dashing) {
			// stops the dash
			if (currentVelocity.DistanceTo(Vector2.Zero) < Math.Abs(dashAcceleration)) {
				dashing = false;
				currentVelocity = Vector2.Zero;
			}
			else {
				// adds the dash acceleration vector to the velocity vecotr
				double angle = playerDirection.Angle(); 
				currentVelocity.X += (float)Math.Cos(angle) * dashAcceleration;
				currentVelocity.Y += (float)Math.Sin(angle) * dashAcceleration;
			}
		}
		else {
			// Get movement input
			Vector2 movementInput = Input.GetVector("ui_left", "ui_right", "ui_up", "ui_down");
			// User isn't pressing any movement keys
			if (movementInput == Vector2.Zero) {
				currentVelocity = Vector2.Zero;
			}
			// User is moving, update player's direction and their velocity
			else {
				playerDirection = movementInput; 
				currentVelocity = playerDirection * speed;
			}

			// Get the global mouse position and the direction of the mouse relative to the player
			mousePos = GetGlobalMousePosition();
			mouseDirection = (mousePos - GlobalPosition).Normalized();  

			// Set the player's rotation
			// Rotation = mouseDirection.Angle();
			// GD.Print(mouseDirection, Rotation);

			// Left mouse button pressed - main attack
			if (Input.IsMouseButtonPressed(MouseButton.Left)) {
				GD.Print("Attack");
			}

		}

	}
	private void playerMovement() {
		getInput();
		blink();
		Velocity = currentVelocity;
		MoveAndSlide();
	}

	private void blink() {
		if (Input.IsActionJustReleased("space")) {
			currentVelocity = playerDirection * dashSpeed;
			dashing = true;
		}
	}

	private void take_damage(int damage) {
		GD.Print("ouch");

		if (hpBar.Value > 0 && health > 0) {
			health -= damage;
			hpBar.Value -= damage; 
		}

		if (health == 0) {
			GD.Print("i died");
		}
	}
}
