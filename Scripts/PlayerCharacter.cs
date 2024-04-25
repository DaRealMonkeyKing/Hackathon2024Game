using Godot;
using System;
using System.Net.NetworkInformation;
using System.Numerics;
using System.Reflection.Metadata.Ecma335;

namespace Godot;

public partial class PlayerCharacter : CharacterBody2D
{
	private Vector2 currentVelocity;
	[Export]
	private Vector2 playerDirection;

	private int speed = 1000;
	private bool dashing = false;
	private int dash_acceleration = -150;
	private int dash_speed = 3000;

	private Vector2 mouse_loc_from_player, mouse_loc;

	public override void _PhysicsProcess(double delta)
	{
		base._PhysicsProcess(delta);

		playerMovement();
	}

	private void getInput() {
		if (dashing) {
			// stops the dash
			if (currentVelocity.DistanceTo(Vector2.Zero) < Math.Abs(dash_acceleration)) {
				dashing = false;
				currentVelocity = Vector2.Zero;
			}
			else {
				// adds the dash acceleration vector to the velocity vecotr
				double angle = playerDirection.Angle(); 
				currentVelocity.X += (float)Math.Cos(angle) * dash_acceleration;
				currentVelocity.Y += (float)Math.Sin(angle) * dash_acceleration;
			}
		}
		else {
			Vector2 movementInput = Input.GetVector("ui_left", "ui_right", "ui_up", "ui_down");
			// user isn't pressing any movement keys
			if (movementInput == Vector2.Zero) {
				currentVelocity = Vector2.Zero;
			}
			// user is moving, update player's direction and their velocity
			else {
				playerDirection = movementInput; 
				currentVelocity = playerDirection * speed;
			}
			
			mouse_loc = GetViewport().GetMousePosition(); // get mouse position based off viewport
			mouse_loc_from_player = mouse_loc - Position; // get mouse distance from player
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
			currentVelocity = playerDirection * dash_speed;
			dashing = true;
		}
	}
}
