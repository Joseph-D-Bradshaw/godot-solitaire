class_name CardManager extends Node

const CARD_SPACING := 6.0 + Types.CARD_WIDTH / 2.0
const card_scene = preload("res://scenes/Card.tscn")

var game_deck: Array[CardRef] = []

const DEAL_MAP = [
	[0, 1, 2, 3, 4, 5, 6],
	[1, 2, 3, 4, 5, 6],
	[2, 3, 4, 5, 6],
	[3, 4, 5, 6],
	[4, 5, 6],
	[5, 6],
	[6]
]

var columns: Array[CardSpotController] = []

class CardRef:
	var card: Card
	var head_node: CardController
	
	func _init(_card: Card, _head_node: CardController):
		assert(_card is Card)
		assert(_head_node is CardController)
		card = _card
		head_node = _head_node
	
	func _to_string() -> String:
		return card.to_string()

func make_card_instance(card: Card) -> CardRef:
	var card_node = card_scene.instantiate()
	var card_ref = CardRef.new(card, card_node)
	return card_ref

func get_card_region(face_or_base: String, asset_name: String):
	assert(face_or_base == "FACE" or face_or_base == "BASE")
	var pos: Vector2 = Types.CARD_DATA[face_or_base][asset_name]["position"]
	return pos + Vector2(Types.CARD_WIDTH, Types.CARD_HEIGHT)


