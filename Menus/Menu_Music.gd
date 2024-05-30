extends AudioStreamPlayer

const menu_music = preload("res://Music/2019-01-02_-_8_Bit_Menu_-_David_Renda_-_FesliyanStudios.com.mp3")
const boss_music = preload("res://Music/2021-08-30_-_Boss_Time_-_www.FesliyanStudios.com.mp3")

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
	stream = music
	volume_db = volume
	play()

func play_music_menu():
	_play_music(menu_music)
func play_boss_music():
	_play_music(boss_music)

func stop_music():
	stop()
