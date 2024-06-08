class_name CardSpotController extends Node2D
# TODO: CardSpots will have to drop CardBase/CardFace nodes and just have their own graphics
enum CardSpotTypes { BLANK, HEARTS, DIAMONDS, SPADES, CLUBS }
const OFFSET_AMOUNT = 30

@export
var spot_type = CardSpotTypes.BLANK

var _cards: Array[CM.CardRef] = []

@onready var marker: Sprite2D = get_node("CardBase/CardFace")

func _to_string() -> String:
	return str(_cards)

func can_add_card(_card):
	return true

func make_last_card_grabbable_only():
	for card in _cards:
		card.head_node.can_grab = false
	_cards[-1].head_node.can_grab = true

func add_card(card: CM.CardRef) -> Vector2:
	if can_add_card(card):
		var offset = _cards.size() * OFFSET_AMOUNT
		_cards.append(card)
		make_last_card_grabbable_only()
		return position + Vector2(0, offset)
	return Vector2.ZERO

func _ready() -> void:
	var face_name: String
	match spot_type:
		CardSpotTypes.BLANK:
			face_name = ""
		CardSpotTypes.HEARTS:
			face_name = "HEART_ACE"
		CardSpotTypes.DIAMONDS:
			face_name = "DIAMOND_ACE"
		CardSpotTypes.SPADES:
			face_name = "SPADE_ACE"
		CardSpotTypes.CLUBS:
			face_name = "CLUB_ACE"
	if face_name:
		var atlas_pos = Types.get_card_face_position(face_name)
		Utils.set_card_face(self, atlas_pos)
	else:
		marker.visible = false
	
