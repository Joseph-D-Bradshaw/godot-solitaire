class_name CardSpotController extends Node2D
# TODO: CardSpots will have to drop CardBase/CardFace nodes and just have their own graphics
enum CardSpotBases { BLANK, HEARTS, DIAMONDS, SPADES, CLUBS }
enum CardSpotType { DECK, DEALT, COLLECTED, IN_PLAY }
const IN_PLAY_OFFSET_AMOUNT = 30
const DEALER_OFFSET_AMOUNT = 2
const COLLECTED_OFFSET_AMOUNT = 5
const DEALT_OFFSET_AMOUNT = 5

@export_category("Spot Settings")
@export var spot_base = CardSpotBases.BLANK
@export var spot_type: CardSpotType

var _cards: Array[CM.CardRef] = []
var card_count: int:
	get: return _cards.size()

@onready var marker: Sprite2D = get_node("CardBase/CardFace")

func _ready() -> void:
	set_spot_face()

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
		var offset = _cards.size() * _get_offset_amount()
		_cards.append(card)
		make_last_card_grabbable_only()
		if spot_type == CardSpotType.IN_PLAY:
			return position + Vector2(0, offset)
		if spot_type == CardSpotType.DECK:
			return position + Vector2(offset * -0.2, offset * 0.5)
	return Vector2.ZERO

func set_spot_face():
	var face_name: String
	match spot_base:
		CardSpotBases.BLANK:
			face_name = ""
		CardSpotBases.HEARTS:
			face_name = "HEART_ACE"
		CardSpotBases.DIAMONDS:
			face_name = "DIAMOND_ACE"
		CardSpotBases.SPADES:
			face_name = "SPADE_ACE"
		CardSpotBases.CLUBS:
			face_name = "CLUB_ACE"
	if face_name:
		var atlas_pos = Types.get_card_face_position(face_name)
		Utils.set_card_face(self, atlas_pos)
	else:
		marker.visible = false
	
func _get_offset_amount() -> int:
	match spot_type:
		CardSpotType.DECK:
			return DEALER_OFFSET_AMOUNT
		CardSpotType.DEALT:
			return DEALT_OFFSET_AMOUNT
		CardSpotType.COLLECTED:
			return COLLECTED_OFFSET_AMOUNT
		CardSpotType.IN_PLAY:
			return IN_PLAY_OFFSET_AMOUNT
	return -1
		
