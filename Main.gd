class_name CardGraphicsManager extends Node2D
const Deck = Cards.Deck
const Card = Cards.Card
const CARD_SPACING := 6.0 + Types.CARD_WIDTH / 2

@export var DEAL_SPEED = .02

@onready var deal_button: Button = get_node("DealButton")
@onready var columns_container: Node2D = get_node("Columns")

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
	var head_node: Node2D
	
	func _init(_card: Card, _head_node: Node2D):
		assert(_card is Card)
		assert(_head_node is Node2D)
		card = _card
		head_node = _head_node
	
	func _to_string() -> String:
		return card.to_string()

var game_deck: Array[CardRef] = []

const card_scene = preload("res://Card.tscn")

func get_card_region(face_or_base: String, asset_name: String):
	assert(face_or_base == "FACE" or face_or_base == "BASE")
	var pos: Vector2 = Types.CARD_DATA[face_or_base][asset_name]["position"]
	return pos + Vector2(Types.CARD_WIDTH, Types.CARD_HEIGHT)

func make_card_instance(card: Card) -> CardRef:
	var card_node = card_scene.instantiate()
	var card_ref = CardRef.new(card, card_node)
	return card_ref

func set_and_move_card(card_ref: CardRef, pos: Vector2) -> void:
	card_ref.head_node.translate(pos)
	var atlas_pos = Types.get_card_face_position(card_ref.card.card_name)
	Cards.set_card_face(card_ref.head_node, atlas_pos)
	add_child(card_ref.head_node)

func deal_cards(deck: Deck, deal_speed: float):
	for row in DEAL_MAP:
		for i in row:
			var card: Card = deck.take()
			var card_ref = make_card_instance(card)
			var card_spawn_pos = columns[i].add_card(card_ref)
			set_and_move_card(card_ref, card_spawn_pos)
			game_deck.append(card_ref)
			
	print(columns[0])
	print(columns[1])
	print(columns[2])
	print(columns[3])
	print(columns[4])
	print(columns[5])
	print(columns[6])
	

func _ready():
	var columns_to_check = columns_container.get_children()
	for col in columns_to_check:
		if col is CardSpotController:
			columns.append(col)

func _on_deal_button_pressed() -> void:
	deal_button.disabled = true
	var deck := Deck.new()
	deck.shuffle()
	deal_cards(deck, DEAL_SPEED)
