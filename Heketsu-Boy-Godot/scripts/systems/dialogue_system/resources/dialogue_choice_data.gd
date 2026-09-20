extends DialogueMessageData
class_name DialogueChoiceData

@export_group("Locked Settings")
## By default all options are unlocked, but in the case where you want the player to perform a specific action you set it to locked, and provide the unlock event key.
@export var unlocked: bool = true
@export var unlock_event_key: String

@export_group("Choices Settings")
@export var options: Array
