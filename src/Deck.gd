class_name Deck extends RefCounted

var cards: Array[Card]
var length: int = 0

func _init():
	for rank in G.ranks:
		for suit in G.suits:
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
