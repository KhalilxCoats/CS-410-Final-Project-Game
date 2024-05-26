extends AudioStreamPlayer

const menu_music = preload("res://Music/2019-01-02_-_8_Bit_Menu_-_David_Renda_-_FesliyanStudios.com.mp3")

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
	stream = music
	volume_db = volume
	play()

func play_music_menu():
	_play_music(menu_music)
	
func stop_music():
	stop()
