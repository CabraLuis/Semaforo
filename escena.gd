extends Node2D

var semaforo = 1
var time = 1.0
var seconds: int = 0
var start = false

func _ready():
	get_node("Semaforo1/Rojo").visible = false
	get_node("Semaforo2/Rojo").visible = false
	get_node("Semaforo3/Rojo").visible = false
	get_node("Semaforo4/Rojo").visible = false

func _process(delta):
	if start:
		time += delta
		seconds = fmod(time,60)
		get_node("Timer").text = str(20 - seconds)

func timer_Green():
	get_node("Semaforo"+str(semaforo)+"/Rojo").visible = true
	get_node("Semaforo"+str(semaforo+1)+"/Rojo").visible = true
	get_node("Timer").visible = false
	await get_tree().create_timer(0.5).timeout	
	time = 1.0
	get_node("Timer").label_settings.font_color = Color(0,255,0)
	get_node("Semaforo"+str(semaforo)+"/Verde").visible = false
	get_node("Semaforo"+str(semaforo+1)+"/Verde").visible = false
	get_node("Timer").visible = true	
	await get_tree().create_timer(19.5).timeout
	get_node("Semaforo"+str(semaforo)+"/Verde").visible = true
	get_node("Semaforo"+str(semaforo+1)+"/Verde").visible = true
	get_node("Timer").visible = false
	await get_tree().create_timer(0.5).timeout
	time = 1.0
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


func _on_btn_iniciar_pressed():
	start = true
	get_node("Semaforo"+str(semaforo)+"/Rojo").visible = true
	get_node("Semaforo"+str(semaforo+1)+"/Rojo").visible = true
	while start:
		if semaforo > 4:
			semaforo = 1
		await timer_Green()
		await timer_Yellow()
		await timer_Red()


func _on_btn_detener_pressed():
	start = false
	time = 0.0
	get_node("Timer").text = "20"
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
