class_name Card extends RefCounted

var suit: String
var rank: String
var card_name: String

func _init(_rank: String, _suit: String):
	assert(_rank in G.ranks)
	assert(_suit in G.suits)	
	rank = _rank
	suit = _suit
	card_name = suit + "_" + rank

func _to_string() -> String:
	return suit + " " + rank
