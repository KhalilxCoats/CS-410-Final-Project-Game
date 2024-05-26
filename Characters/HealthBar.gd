extends ProgressBar

@export var character: Character
func _ready():
	character.healthChanged.connect(update)
	update()

func update():
	value = character.Health *100/ character.maxHealth
