extends AudioStreamPlayer
class_name BGMusicManager

var cur_song : int = 1
var desired_song : int = 3

func _ready() -> void:
	SignalManager.set_audio.connect(set_audio)
	#set_audio(3, false)

func set_audio(song : int, drums : bool) -> void:
	print("Change song to ", song)
	if cur_song != desired_song:
		stream.set_sync_stream_volume(desired_song, -60)
	
	desired_song = song
	
	if drums:
		stream.set_sync_stream_volume(0,-2)
	else:
		stream.set_sync_stream_volume(0, -60)

func _process(delta: float) -> void:
	if cur_song == desired_song:
		return
	
	if stream.get_sync_stream_volume(desired_song) > 0:
		stream.set_sync_stream_volume(cur_song, -60)
		print("maxed")
		cur_song = desired_song
		return
	
	var current_volume : float = stream.get_sync_stream_volume(desired_song)
	var desired_volume : float = lerpf(current_volume, 1, 3 * delta)
	stream.set_sync_stream_volume(desired_song, desired_volume)
	
	var cur_vol_2 : float = stream.get_sync_stream_volume(cur_song)
	var des_vol_2 : float = lerpf(cur_vol_2, -60, 0.5 * delta)
	stream.set_sync_stream_volume(cur_song,des_vol_2)
