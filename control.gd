extends Control

@onready var mensagem = $VBoxContainer/Mensagem

@onready var botao_direito = $VBoxContainer/Button3
var palpite
var min_palpite = 0
var max_palpite = 1000
var acabou = false

func _ready():
	palpite = (min_palpite + max_palpite) / 2
	mensagem.text = "Seu Número é " + str(palpite) + "?"

func _tenta_palpite(type):
	if type == "Button":
		min_palpite = palpite
	else: 
		max_palpite = palpite
		
	palpite = (min_palpite + max_palpite) / 2
	
	mensagem.text = "Seu Número é " + str(palpite) + "?"

func _on_button_pressed() -> void:
	_tenta_palpite("Button")

func _on_button_2_pressed() -> void:
	_tenta_palpite("Button2")

func _on_button_3_pressed() -> void:
	if acabou:
		_restart_game()
	else:
			_end_game()

func _end_game():
	acabou = true
	mensagem.text = "Sim! Eu sabia! Que esse era seu número era: " +str(palpite) + "!"
	botao_direito.text = "Recomeçar"

func _restart_game():
	get_tree().reload_current_scene()
