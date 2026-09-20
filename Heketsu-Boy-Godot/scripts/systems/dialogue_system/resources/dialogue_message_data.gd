extends Resource
class_name DialogueMessageData

@export_category("Speaker")
## Reuse an existing SpeakerData resource or create a new one, this describes who is speaking this message.
@export var speaker_data: SpeakerData

@export_category("Message")
@export var message_segments: Array[TextSegmentData]
