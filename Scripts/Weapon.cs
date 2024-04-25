using System;

namespace Godot;

public class Weapon {
    private int damage;
    private int fireRate;  // number of times weapon can be fired in 1 second
    
    public Weapon(int damage, int fireRate) {
        this.damage = damage;
        this.fireRate = fireRate;
    }
    
    // is there really a point to having this?
    // public void Attack() {
    //     GD.Print("Attack");
    // }

    // public void SpecialAttack() {
    //     GD.Print("Ult");
    // }
}