class_name PowerupInfoPlatform extends PowerupInfo


@export_enum(
	"length", 
	"sticky", 
	"laser",
	) var description : String


func _init(p_duration_seconds:=1, p_description:="") -> void:
	super._init(p_duration_seconds)
	description = p_description
