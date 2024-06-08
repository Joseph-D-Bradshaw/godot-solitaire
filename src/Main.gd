class_name Main extends Node2D

@onready var deal_button: Button = get_node("DealButton")
@onready var columns_container: Node2D = get_node("Columns")

var game_deck: Array[CM.CardRef] = []

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
	
	for i in range(7):
		print("Col {i}: {column}".format({"i": i+1, "column": CM.columns[i]}))

func _ready():
	var columns_to_check = columns_container.get_children()
	for col in columns_to_check:
		if col is CardSpotController:
			CM.columns.append(col)

func _on_deal_button_pressed() -> void:
	deal_button.disabled = true
	var deck := Deck.new()
	deck.shuffle()
	deal_cards(deck)
	_connect_signals_on_cards()

func _connect_signals_on_cards():
	for card in game_deck:
		card.head_node.grabbed.connect(_on_card_grabbed)
		card.head_node.dropped.connect(_on_card_dropped)

func _on_card_grabbed():
	print("Card grabbed")

func _on_card_dropped():
	print("Card dropped")


