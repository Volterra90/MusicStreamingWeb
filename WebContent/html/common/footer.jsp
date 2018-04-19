	<footer>
	<audio controls preload="none" id="reproductor">
		<source src="" type="audio/mpeg" id="media">
	</audio>
	<script>
		function updateSrc(button){	
			var media = document.getElementById('media');
			media.src="/MusicStreamingWeb/songs/"+button.id.substring(4,button.id.length)+".mp3";
			reproductor.load();
			reproductor.play();
		}
	</script>
	</footer>
</body>
</html>