extends Resource
class_name TextSegmentData

@export_group("Message")
@export var translation_key: String

@export_group("Styling")
@export_subgroup("Color")
@export var color: Color = Color.WHITE
@export var color_gradient: Gradient = null

@export_subgroup("Emphasized")
@export var emphasized: bool = false
@export_range(0.0, 1.0, 0.05) var emphasized_strength: float = 0.0

@export_subgroup("Wavy")
@export var wavy: bool = false
@export_range(0.0, 1.0, 0.05) var wavy_strength: float = 0.0

@export_subgroup("Font")
@export var override_font: Font
@export var font_size: int = 14
