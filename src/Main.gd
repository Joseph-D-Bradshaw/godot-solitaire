class_name Main extends Node2D

@onready var deal_button: Button = get_node("DealButton")
@onready var columns_container: Node2D = get_node("Columns")
@onready var deck_spot: CardSpotController = get_node("DeckSpot")
@onready var dealt_spot = get_node("DealtSpot") as CardSpotController
@onready var collected_hearts_spot = get_node("HeartsSpot") as CardSpotController
@onready var collected_diamonds_spot = get_node("DiamondsSpot") as CardSpotController
@onready var collected_spades_spot = get_node("SpadesSpot") as CardSpotController
@onready var collected_clubs_spot = get_node("ClubsSpot") as CardSpotController

var game_deck: Array[CM.CardRef] = []
var dealer_deck: Array[CM.CardRef] = []

func _ready():
	grab_static_nodes_and_assign_to_card_manager()

func get_card_region(face_or_base: String, asset_name: String):
	assert(face_or_base == "FACE" or face_or_base == "BASE")
	var pos: Vector2 = Types.CARD_DATA[face_or_base][asset_name]["position"]
	return pos + Vector2(Types.CARD_WIDTH, Types.CARD_HEIGHT)

func set_and_move_card(card_ref: CM.CardRef, pos: Vector2, is_face_forward: bool) -> void:
	card_ref.head_node.translate(pos)
	var atlas_pos = Types.get_card_face_position(card_ref.card.card_name)
	Utils.set_card_face(card_ref.head_node, atlas_pos)
	Utils.set_card_face_hidden(card_ref.head_node, not is_face_forward)
	add_child(card_ref.head_node)

func deal_cards(deck: Deck):
	for row in CardManager.DEAL_MAP:
		for column_i in row:
			var card: Card = deck.take()
			var card_ref = CM.make_card_instance(card)
			var card_spawn_pos = CM.columns[column_i].add_card(card_ref)
			var is_face_forward = column_i == row[0]
			set_and_move_card(card_ref, card_spawn_pos, is_face_forward)
			game_deck.append(card_ref)

func dump_to_dealers_pile(deck: Deck):
	for i in range(deck.length):
		var card: Card = deck.take()
		var card_ref = CM.make_card_instance(card)
		var _deck_spot = CM.deck_spot as CardSpotController
		var card_spawn_pos = _deck_spot.add_card(card_ref)
		set_and_move_card(card_ref, card_spawn_pos, false)
		dealer_deck.append(card_ref)
	
func grab_static_nodes_and_assign_to_card_manager():
	assert(deck_spot is CardSpotController)
	assert(dealt_spot is CardSpotController)
	assert(collected_hearts_spot is CardSpotController)
	assert(collected_diamonds_spot is CardSpotController)
	assert(collected_spades_spot is CardSpotController)
	assert(collected_clubs_spot is CardSpotController)
	CM.deck_spot = deck_spot
	CM.dealt_spot = dealt_spot
	CM.collected_hearts_spot = collected_hearts_spot
	CM.collected_diamonds_spot = collected_diamonds_spot
	CM.collected_spades_spot = collected_spades_spot
	CM.collected_clubs_spot = collected_clubs_spot
	
	var columns_to_check = columns_container.get_children()
	for col in columns_to_check:
		if col is CardSpotController:
			CM.columns.append(col)

func _on_deal_button_pressed() -> void:
	deal_button.disabled = true
	var deck := Deck.new()
	deck.shuffle()
	deal_cards(deck)
	dump_to_dealers_pile(deck)
	_connect_signals_on_cards()

func _connect_signals_on_cards():
	for card in game_deck:
		card.head_node.grabbed.connect(_on_card_grabbed.bind(card))
		card.head_node.dropped.connect(_on_card_dropped.bind(card))
	for card in dealer_deck:
		print("connecting card")
		card.head_node.grabbed.connect(_on_card_grabbed.bind(card))
		card.head_node.dropped.connect(_on_card_dropped.bind(card))

func _on_card_grabbed(card: CM.CardRef):
	print("Card grabbed: ", card)

func _on_card_dropped(card: CM.CardRef):
	print("Card dropped: ", card)


