using System.Security.Principal;

namespace Godot;

public class Gun : Weapon {
    int projectileSpeed;
    public Gun(int damage, int fireRate, int projectileSpeed) : base(damage, fireRate) {
        this.projectileSpeed = projectileSpeed;
    }

    public new void Attack() {
        
    }
}