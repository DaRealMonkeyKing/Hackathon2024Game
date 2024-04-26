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

	// Player movement speed
	private int speed = 1000;
	// Dash parameters
	private bool dashing = false;
	private int dashAcceleration = -150;
	private int dashSpeed = 3000;

	private Vector2 mouse_loc_from_player, mouse_loc;

	private int curInventoryItem = 0;
	// private int inventorySize = 2;
	// private string[] playerInventory = new string[2];   // TODO: maybe create a item class or something or maybe should only store weapons?
	// playerInventory[0] = "fists";
	public override void _PhysicsProcess(double delta)
	{
		base._PhysicsProcess(delta);

		playerMovement();
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
			// user isn't pressing any movement keys
			if (movementInput == Vector2.Zero) {
				currentVelocity = Vector2.Zero;
			}
			// user is moving, update player's direction and their velocity
			else {
				playerDirection = movementInput; 
				currentVelocity = playerDirection * speed;
			}

			// Left mouse button pressed - main attack
			if (Input.IsMouseButtonPressed(MouseButton.Left)) {
				GD.Print("Attack");
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
			currentVelocity = playerDirection * dashSpeed;
			dashing = true;
		}
	}
}
