using Godot;
using System;
using System.Numerics;

namespace Godot;

public partial class PlayerCharacter : CharacterBody2D
{
	private Vector2 currentVelocity;
	[Export]
	private int speed = 1000;
	private int dash_length = 500;
	private Vector2 mouse_loc_from_player, mouse_loc;

    public override void _PhysicsProcess(double delta)
    {
        base._PhysicsProcess(delta);

		playerMovement();
    }

	private void getInput() {
		currentVelocity = Input.GetVector("ui_left", "ui_right", "ui_up", "ui_down");
		currentVelocity *= speed;
		
		mouse_loc = GetViewport().GetMousePosition(); // get mouse position based off viewport
		mouse_loc_from_player = mouse_loc - Position; // get mouse distance from player
	}

	private void playerMovement() {
		getInput();
		blink();
		Velocity = currentVelocity;
		MoveAndSlide();
    }

	private void blink() {
		if (Input.IsActionJustReleased("space")) {
			if (mouse_loc_from_player.Length() > dash_length)
				Position += mouse_loc_from_player.LimitLength(dash_length);
			else
				Position = mouse_loc;
		}
	}
}
