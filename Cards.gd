class_name Cards

const ranks = ["ACE", "TWO", "THREE", "FOUR", "FIVE", "SIX", "SEVEN", "EIGHT", "NINE", "TEN", "JACK", "QUEEN", "KING"]
const suits = ["HEART", "DIAMOND", "SPADE", "CLUB"]

class Card:
	var suit: String
	var rank: String
	var card_name: String
	
	func _init(_rank: String, _suit: String):
		assert(_rank in ranks)
		assert(_suit in suits)	
		rank = _rank
		suit = _suit
		card_name = suit + "_" + rank
	
	func _to_string() -> String:
		return suit + " " + rank

class Deck:
	var cards: Array[Card]
	var length: int = 0
	
	func _init():
		for rank in ranks:
			for suit in suits:
				cards.append(Card.new(rank, suit))
		length = cards.size()
	
	func _to_string() -> String:
		return "Deck: " + str(length) + " cards."
	
	func take() -> Card:
		length -= 1
		if cards.size() > 0:
			return cards.pop_back()
		return null

	
	func shuffle() -> void:
		cards.shuffle()
		
static func set_card_face(card_node: Node2D, card_face_position: Vector2) -> void:
	var card_face = card_node.get_node("CardBase/CardFace")
	var texture = card_face.texture as AtlasTexture
	var offset = Rect2(card_face_position * Vector2(Types.CARD_WIDTH, Types.CARD_HEIGHT), texture.region.size)
	texture.region = offset
