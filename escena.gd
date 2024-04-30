extends Node2D

var semaforo = 1
var time = 0.0
var seconds: int = 0
var start = false
var reversa = false
var preventivas = false

func _ready():
	# Iniciar todos los semaforos en rojo
	get_node("Timer").visible = true
	get_node("Semaforo1/Rojo").visible = true
	get_node("Semaforo2/Rojo").visible = true
	get_node("Semaforo3/Rojo").visible = true
	get_node("Semaforo4/Rojo").visible = true

func _process(delta):
	# Contador desde 15
	if start:
		time += delta
		seconds = fmod(time,60)
		get_node("Timer").text = str(15 - seconds)
		# Contador desde 0
		if reversa:
			get_node("Timer").text = str(seconds)
	
func timer_Green():
	get_node("Semaforo"+str(semaforo)+"/Rojo").visible = true
	get_node("Semaforo"+str(semaforo+1)+"/Rojo").visible = true
	get_node("Timer").visible = false
	await get_tree().create_timer(0.5).timeout
	time = 0.0
	reversa = false
	get_node("Timer").label_settings.font_color = Color(0,255,0)
	get_node("Semaforo"+str(semaforo)+"/Verde").visible = false
	get_node("Semaforo"+str(semaforo+1)+"/Verde").visible = false
	get_node("Timer").visible = true	
	get_node("Timer").text = str(15 - seconds)	
	await get_tree().create_timer(15.5).timeout
	get_node("Semaforo"+str(semaforo)+"/Verde").visible = true
	get_node("Semaforo"+str(semaforo+1)+"/Verde").visible = true
	get_node("Timer").visible = false
	await get_tree().create_timer(0.5).timeout
	time = 1.0	
	reversa = true
	get_node("Semaforo"+str(semaforo)+"/Verde").visible = false
	get_node("Semaforo"+str(semaforo+1)+"/Verde").visible = false
	get_node("Timer").visible = true
	await get_tree().create_timer(0.5).timeout
	get_node("Semaforo"+str(semaforo)+"/Verde").visible = true
	get_node("Semaforo"+str(semaforo+1)+"/Verde").visible = true
	get_node("Timer").visible = false
	await get_tree().create_timer(0.5).timeout
	get_node("Semaforo"+str(semaforo)+"/Verde").visible = false
	get_node("Semaforo"+str(semaforo+1)+"/Verde").visible = false
	get_node("Timer").visible = true
	await get_tree().create_timer(0.5).timeout
	get_node("Semaforo"+str(semaforo)+"/Verde").visible = true
	get_node("Semaforo"+str(semaforo+1)+"/Verde").visible = true
	get_node("Timer").visible = false	
	await get_tree().create_timer(0.5).timeout
	get_node("Semaforo"+str(semaforo)+"/Verde").visible = false
	get_node("Semaforo"+str(semaforo+1)+"/Verde").visible = false
	get_node("Timer").visible = true	
	await get_tree().create_timer(0.5).timeout
	await timer_Yellow()
	

func timer_Yellow():
	get_node("Semaforo"+str(semaforo)+"/Verde").visible = true
	get_node("Semaforo"+str(semaforo+1)+"/Verde").visible = true
	get_node("Timer").visible = false
	await get_tree().create_timer(0.5).timeout
	time = 1.0	
	get_node("Timer").label_settings.font_color = Color(255,255,0)
	get_node("Semaforo"+str(semaforo)+"/Amarillo").visible = false
	get_node("Semaforo"+str(semaforo+1)+"/Amarillo").visible = false
	get_node("Timer").visible = true
	await get_tree().create_timer(2.5).timeout
	await timer_Red()
	

func timer_Red():
	get_node("Semaforo"+str(semaforo)+"/Amarillo").visible = true
	get_node("Semaforo"+str(semaforo+1)+"/Amarillo").visible = true
	get_node("Timer").visible = false
	await get_tree().create_timer(0.5).timeout
	time = 1.0	
	get_node("Timer").label_settings.font_color = Color(255,0,0)
	get_node("Semaforo"+str(semaforo)+"/Rojo").visible = false
	get_node("Semaforo"+str(semaforo+1)+"/Rojo").visible = false
	get_node("Timer").visible = true
	await get_tree().create_timer(1.5).timeout
	semaforo = semaforo + 2

func preventivasFunc():
	while preventivas:
		if not preventivas:
			break
		if start:
			break
		get_node("Semaforo2/Amarillo").visible = false
		get_node("Semaforo3/Amarillo").visible = false
		get_node("Semaforo1/Amarillo").visible = false
		get_node("Semaforo4/Amarillo").visible = false
		get_node("Timer").visible = true
		if not preventivas:
			break
		if start:
			break
		await get_tree().create_timer(0.5).timeout
		get_node("Semaforo1/Amarillo").visible = true
		get_node("Semaforo2/Amarillo").visible = true
		get_node("Semaforo3/Amarillo").visible = true
		get_node("Semaforo4/Amarillo").visible = true
		get_node("Timer").visible = false
		if not preventivas:
			break
		if start:
			break
		await get_tree().create_timer(0.5).timeout

func _on_btn_iniciar_pressed():
	start = true
	preventivas = false	
	time = 0.0
	get_node("Semaforo"+str(semaforo)+"/Rojo").visible = true
	get_node("Semaforo"+str(semaforo+1)+"/Rojo").visible = true
	while start:
		if semaforo > 4:
			semaforo = 1
		await timer_Green()
		if not start:
			break
		if preventivas:
			break
		

func _on_btn_detener_pressed():
	start = false
	preventivas = false	
	time = 0.0	
	get_node("Timer").visible = false
	get_node("Semaforo1/Rojo").visible = false
	get_node("Semaforo2/Rojo").visible = false
	get_node("Semaforo3/Rojo").visible = false
	get_node("Semaforo4/Rojo").visible = false
	
	get_node("Semaforo1/Verde").visible = true
	get_node("Semaforo2/Verde").visible = true
	get_node("Semaforo3/Verde").visible = true
	get_node("Semaforo4/Verde").visible = true
	
	get_node("Semaforo1/Amarillo").visible = true
	get_node("Semaforo2/Amarillo").visible = true
	get_node("Semaforo3/Amarillo").visible = true
	get_node("Semaforo4/Amarillo").visible = true

func _on_btn_preventivas_pressed():
	start = false
	preventivas = true
	get_node("Timer").label_settings.font_color = Color(255,255,0)
	time = 0.0
	get_node("Timer").text = "0"	
	get_node("Semaforo1/Rojo").visible = true
	get_node("Semaforo2/Rojo").visible = true
	get_node("Semaforo3/Rojo").visible = true
	get_node("Semaforo4/Rojo").visible = true
	
	get_node("Semaforo1/Verde").visible = true
	get_node("Semaforo2/Verde").visible = true
	get_node("Semaforo3/Verde").visible = true
	get_node("Semaforo4/Verde").visible = true
	
	await preventivasFunc()
