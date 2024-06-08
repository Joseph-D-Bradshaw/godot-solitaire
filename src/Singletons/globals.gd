class_name Utils extends Node

# Referred to via G for "globals"
const ranks = ["ACE", "TWO", "THREE", "FOUR", "FIVE", "SIX", "SEVEN", "EIGHT", "NINE", "TEN", "JACK", "QUEEN", "KING"]
const suits = ["HEART", "DIAMOND", "SPADE", "CLUB"]

# Referred to via Utils - posing as a static class
static func set_card_face(card_node: Node2D, card_face_position: Vector2) -> void:
	var card_face = card_node.get_node("CardBase/CardFace")
	var texture = card_face.texture as AtlasTexture
	var offset = Rect2(card_face_position * Vector2(Types.CARD_WIDTH, Types.CARD_HEIGHT), texture.region.size)
	texture.region = offset
