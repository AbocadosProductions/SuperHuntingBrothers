extends Node2D

var a = {
	Vector2(1, 0): "a",
	Vector2(0, 1): "b"
}



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var a = Input.get_vector("keyboard_left", "keyboard_right", "keyboard_up", "keyboard_down")
	print("____________________________________")
	print("____________________________________")
	print(ceil(a[0]))
	print(a[0])
	print("____________________________________")
	print("____________________________________")
