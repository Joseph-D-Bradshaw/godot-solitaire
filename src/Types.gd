class_name Types

const CARD_WIDTH = 71
const CARD_HEIGHT = 95
const CARD_SPACE = Vector2(CARD_WIDTH, CARD_HEIGHT)

static func get_card_face_position(card_name: String) -> Vector2:
	return CARD_DATA["FACE"][card_name]["position"]

static func get_card_base_position(card_name: String) -> Vector2:
	return CARD_DATA["BASE"][card_name]["position"]

const CARD_DATA := {
	"BASE": {
		"FACE_DOWN_RED": {
			"name": "face_down_red",
			"position": Vector2(0, 0)
		},
		"FACE_BASE": {
			"name": "face_base",
			"position": Vector2(1, 0)
		},
		"GOLD_COIN": {
			"name": "gold_coin",
			"position": Vector2(2, 0)
		},
		"FACE_STARS": {
			"name": "face_stars",
			"position": Vector2(3, 0)
		},
		"FACE_LOCK": {
			"name": "face_lock",
			"position": Vector2(4, 0)
		},
		"FACE_STONE": {
			"name": "face_stone",
			"position": Vector2(5, 0)
		},
		"FACE_GOLD": {
			"name": "face_gold",
			"position": Vector2(6, 0)
		},
		"FACE_LEGENDARY": {
			"name": "face_legendary",
			"position": Vector2(0, 1)
		},
		"FACE_BONUS": {
			"name": "face_bonus",
			"position": Vector2(1, 1)
		},
		"FACE_MULT": {
			"name": "face_mult",
			"position": Vector2(2, 1)
		},
		"FACE_WILD": {
			"name": "face_wild",
			"position": Vector2(3, 1)
		},
		"FACE_LUCKY": {
			"name": "face_lucky",
			"position": Vector2(4, 1)
		},
		"FACE_GLASS": {
			"name": "face_glass",
			"position": Vector2(5, 1)
		},
		"FACE_STEEL": {
			"name": "face_steel",
			"position": Vector2(6, 1)
		},
		"FACE_DOWN_BLUE": {
			"name": "face_down_blue",
			"position": Vector2(0, 2)
		},
		"FACE_DOWN_YELLOW": {
			"name": "face_down_yellow",
			"position": Vector2(1, 2)
		},
		"FACE_DOWN_GREEN": {
			"name": "face_down_green",
			"position": Vector2(2, 2)
		},
		"FACE_DOWN_BLACK": {
			"name": "face_down_black",
			"position": Vector2(3, 2)
		},
		"FACE_WEIRD": {
			"name": "face_weird",
			"position": Vector2(4, 2)
		},
		"FACE_CHROMA": {
			"name": "face_chroma",
			"position": Vector2(5, 2)
		},
		"FACE_GLOOP1": {
			"name": "face_gloop1",
			"position": Vector2(6, 2)
		},
		"FACE_GLOOP2": {
			"name": "face_gloop2",
			"position": Vector2(0, 3)
		},
		"FACE_CLASSIC": {
			"name": "face_classic",
			"position": Vector2(1, 3)
		},
		"FACE_RETRO": {
			"name": "face_retro",
			"position": Vector2(2, 3)
		},
		"FACE_OLD": {
			"name": "face_old",
			"position": Vector2(3, 3)
		},
		"FACE_GLOOP3": {
			"name": "face_gloop3",
			"position": Vector2(4, 3)
		},
		"FACE_JOKER_QUESTION_MARK": {
			"name": "face_joker_question_mark",
			"position": Vector2(5, 3)
		},
		"FACE_CHIP_QUESTION_MARK": {
			"name": "face_chip_question_mark",
			"position": Vector2(6, 3)
		},
		"FACE_MAZE": {
			"name": "face_maze",
			"position": Vector2(0, 4)
		},
		"FACE_ROAD": {
			"name": "face_road",
			"position": Vector2(1, 4)
		},
		"FACE_CREATIVE": {
			"name": "face_creative",
			"position": Vector2(2, 4)
		},
		"FACE_COSMIC": {
			"name": "face_cosmic",
			"position": Vector2(3, 4)
		},
		"FACE_PURPLE_COIN": {
			"name": "face_purple_coin",
			"position": Vector2(4, 4)
		},
		"FACE_RED_COIN": {
			"name": "face_red_coin",
			"position": Vector2(5, 4)
		},
		"FACE_BLUE_COIN": {
			"name": "face_blue_coin",
			"position": Vector2(6, 4)
		}
	},
	"FACE": {
		"HEART_TWO": {
			"name": "heart_two",
			"position": Vector2(0, 0)
		},
		"HEART_THREE": {
			"name": "heart_three",
			"position": Vector2(1, 0)
		},
		"HEART_FOUR": {
			"name": "heart_four",
			"position": Vector2(2, 0)
		},
		"HEART_FIVE": {
			"name": "heart_five",
			"position": Vector2(3, 0)
		},
		"HEART_SIX": {
			"name": "heart_six",
			"position": Vector2(4, 0)
		},
		"HEART_SEVEN": {
			"name": "heart_seven",
			"position": Vector2(5, 0)
		},
		"HEART_EIGHT": {
			"name": "heart_eight",
			"position": Vector2(6, 0)
		},
		"HEART_NINE": {
			"name": "heart_nine",
			"position": Vector2(7, 0)
		},
		"HEART_TEN": {
			"name": "heart_ten",
			"position": Vector2(8, 0)
		},
		"HEART_JACK": {
			"name": "heart_jack",
			"position": Vector2(9, 0)
		},
		"HEART_QUEEN": {
			"name": "heart_queen",
			"position": Vector2(10, 0)
		},
		"HEART_KING": {
			"name": "heart_king",
			"position": Vector2(11, 0)
		},
		"HEART_ACE": {
			"name": "heart_ace",
			"position": Vector2(12, 0)
		},
		"CLUB_TWO": {
			"name": "club_two",
			"position": Vector2(0, 1)
		},
		"CLUB_THREE": {
			"name": "club_three",
			"position": Vector2(1, 1)
		},
		"CLUB_FOUR": {
			"name": "club_four",
			"position": Vector2(2, 1)
		},
		"CLUB_FIVE": {
			"name": "club_five",
			"position": Vector2(3, 1)
		},
		"CLUB_SIX": {
			"name": "club_six",
			"position": Vector2(4, 1)
		},
		"CLUB_SEVEN": {
			"name": "club_seven",
			"position": Vector2(5, 1)
		},
		"CLUB_EIGHT": {
			"name": "club_eight",
			"position": Vector2(6, 1)
		},
		"CLUB_NINE": {
			"name": "club_nine",
			"position": Vector2(7, 1)
		},
		"CLUB_TEN": {
			"name": "club_ten",
			"position": Vector2(8, 1)
		},
		"CLUB_JACK": {
			"name": "club_jack",
			"position": Vector2(9, 1)
		},
		"CLUB_QUEEN": {
			"name": "club_queen",
			"position": Vector2(10, 1)
		},
		"CLUB_KING": {
			"name": "club_king",
			"position": Vector2(11, 1)
		},
		"CLUB_ACE": {
			"name": "club_ace",
			"position": Vector2(12, 1)
		},
		"DIAMOND_TWO": {
			"name": "diamond_two",
			"position": Vector2(0, 2)
		},
		"DIAMOND_THREE": {
			"name": "diamond_three",
			"position": Vector2(1, 2)
		},
		"DIAMOND_FOUR": {
			"name": "diamond_four",
			"position": Vector2(2, 2)
		},
		"DIAMOND_FIVE": {
			"name": "diamond_five",
			"position": Vector2(3, 2)
		},
		"DIAMOND_SIX": {
			"name": "diamond_six",
			"position": Vector2(4, 2)
		},
		"DIAMOND_SEVEN": {
			"name": "diamond_seven",
			"position": Vector2(5, 2)
		},
		"DIAMOND_EIGHT": {
			"name": "diamond_eight",
			"position": Vector2(6, 2)
		},
		"DIAMOND_NINE": {
			"name": "diamond_nine",
			"position": Vector2(7, 2)
		},
		"DIAMOND_TEN": {
			"name": "diamond_ten",
			"position": Vector2(8, 2)
		},
		"DIAMOND_JACK": {
			"name": "diamond_jack",
			"position": Vector2(9, 2)
		},
		"DIAMOND_QUEEN": {
			"name": "diamond_queen",
			"position": Vector2(10, 2)
		},
		"DIAMOND_KING": {
			"name": "diamond_king",
			"position": Vector2(11, 2)
		},
		"DIAMOND_ACE": {
			"name": "diamond_ace",
			"position": Vector2(12, 2)
		},
		"SPADE_TWO": {
			"name": "spade_two",
			"position": Vector2(0, 3)
		},
		"SPADE_THREE": {
			"name": "spade_three",
			"position": Vector2(1, 3)
		},
		"SPADE_FOUR": {
			"name": "spade_four",
				"position": Vector2(2, 3)
		},
		"SPADE_FIVE": {
			"name": "spade_five",
			"position": Vector2(3, 3)
		},
		"SPADE_SIX": {
			"name": "spade_six",
			"position": Vector2(4, 3)
		},
		"SPADE_SEVEN": {
			"name": "spade_seven",
			"position": Vector2(5, 3)
		},
		"SPADE_EIGHT": {
			"name": "spade_eight",
			"position": Vector2(6, 3)
		},
		"SPADE_NINE": {
			"name": "spade_nine",
			"position": Vector2(7, 3)
		},
		"SPADE_TEN": {
			"name": "spade_ten",
			"position": Vector2(8, 3)
		},
		"SPADE_JACK": {
			"name": "spade_jack",
			"position": Vector2(9, 3)
		},
		"SPADE_QUEEN": {
			"name": "spade_queen",
			"position": Vector2(10, 3)
		},
		"SPADE_KING": {
			"name": "spade_king",
			"position": Vector2(11, 3)
		},
		"SPADE_ACE": {
			"name": "spade_ace",
			"position": Vector2(12, 3)
		}
	}
}
