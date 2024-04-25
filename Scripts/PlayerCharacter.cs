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
	private int dash_speed = 3000;
	// private int dash_time = 5;
	// private int dash_length = 30000;
	// c# don't allow this 
	// private int dash_acceleration = 2 * (dash_length - dash_speed*dash_time) / (dash_time*dash_time) ;  // d = v1t + 1/2at^2
	// private int dash_acceleration = 5 * (30000 - 10000*5) / 25;
	private int dash_acceleration = -150;

	private int acceleration = 0;
	

	private Vector2 mouse_loc_from_player, mouse_loc;

	public override void _PhysicsProcess(double delta)
	{
		base._PhysicsProcess(delta);

		playerMovement();
	}

	private void getInput() {
		if (dashing) {
			// stops the dash because math!!!!!
			// TODO: Make the dash more smooth, feels unnatural at the end, like a delay before we can move
			// might be because we are still "dashing" just so slowly, the player can't see
			if (currentVelocity.DistanceTo(Vector2.Zero) < Math.Abs(dash_acceleration)) {
				dashing = false;
				currentVelocity = Vector2.Zero;
			}
			else {
				double angle = playerDirection.Angle(); 
				currentVelocity.X += (float)Math.Cos(angle) * dash_acceleration;
				currentVelocity.Y += (float)Math.Sin(angle) * dash_acceleration;
			}
		}
		else {
			playerDirection = Input.GetVector("ui_left", "ui_right", "ui_up", "ui_down");
			currentVelocity = playerDirection * speed;
			
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
