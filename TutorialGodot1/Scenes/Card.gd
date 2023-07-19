extends Container

class_name Card

var linkChar = ""
var bgCikir = ""
var resIzq = ""
var resDer = ""

func _ready():
	changeAlphaDer(0)
	changeAlphaIzq(0)

func infoCard(resp1,resp2,bgColor, linkImg):
	changeAlphaIzq(1)
	changeAlphaDer(1)
	if(linkImg!=null):
		setImg(linkImg)
	if(bgColor!=null):
		$Front.self_modulate = Color("#"+bgColor)
	$Front/Content/RespDer/txtRespDer.text=resp1
	if(resp2!=null):
		$Front/Content/RespIzq/txtRespIzq.text=resp2
	else:
		$Front/Content/RespIzq/txtRespIzq.text=resp1

func flipFront():
	$AnimationPlayer.play("FlipFront")
	var numeroAleatorio = randf()
	var randomPich = 0.9 + numeroAleatorio * 0.2
	$AudioStreamPlayer.pitch_scale=randomPich
	$AudioStreamPlayer.stream= load("res://Audio/Card2.wav");

func changeAlphaIzq(alp):
	var color=$Front/Content/RespIzq.modulate
	color.a=alp
	$Front/Content/RespIzq.modulate=color
	
	
func changeAlphaDer(alp):
	var color=$Front/Content/RespDer.modulate
	color.a=alp
	$Front/Content/RespDer.modulate=color
	
	
func flipBack():
	$Back.visible=true
	$Front.visible=false
	
func setImg(urlImg):
	$Front/Content.texture=load("res://Sprites/"+urlImg) as Texture 

func setBgColor(colorS):
	$Front/Content.self_modulate=Color("#"+colorS)
	pass
	
func dontRotate():
	$Front/Content/RespDer.global_rotation=0
	$Front/Content/RespIzq.global_rotation=0

func SoundFlip():
	$AudioStreamPlayer.play()
