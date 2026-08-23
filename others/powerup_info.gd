class_name PowerupInfo extends Resource


@export var duration_seconds : int
@export_enum(
	"life", 
	"points",
	"length", 
	"bomb",
	"triple", 
	"sticky", 
	) var description : String


func _init(p_duration_seconds:=1, p_description:="") -> void:
	duration_seconds = p_duration_seconds
	description = p_description
