class_name PowerupInfoBall extends PowerupInfo


@export_enum(
	"bomb",
	"sticky",
	) var description : String


func _init(p_duration_seconds:=10, p_description:="") -> void:
	super._init(p_duration_seconds)
	description = p_description
