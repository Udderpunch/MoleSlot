using Godot;
using System;

public partial class MolePickable : Node
{
    private const string IdleAnim = "idle";
    private const string EmptyAnim = "empty";
    private const string AppearAnim = "appear";
    private const string HideAnim = "hide";
    private const string HitAnim = "hit";
    
    
    private AnimatedSprite2D _animation;
    
    public override void _Ready()
    {
        base._Ready();
        _animation = GetNode<AnimatedSprite2D>("%Animation");
        _animation.Play(EmptyAnim);
    }

    private void OnAreaInputEventEntered(Viewport node, InputEvent @event, int shapeID )
    {
        if (@Input.IsActionJustPressed("click"))
        {
            GD.Print("click");
            _animation.Play(HitAnim);
        }
    }
    
}
