extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$PanelContainer.hide()

func _input(event):
	if event.is_action_pressed('menu'):
		if $PanelContainer.is_visible_in_tree():
			$PanelContainer.hide()
			self.get_tree().paused = false	
		else:
			$PanelContainer.show()
			self.get_tree().paused = true


func _on_Button_pressed():
	var ev = InputEventAction.new()
	ev.action = "menu"
	ev.pressed = true
	Input.parse_input_event(ev)
