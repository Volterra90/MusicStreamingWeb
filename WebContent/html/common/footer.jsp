	<footer>
	<audio controls>
		<source src="" type="audio/mpeg" id="reproductor">
	</audio>
	<script>
		function updateSrc(){
			document.getElementById('reproductor').src = "/MusicStreamingWeb/songs/";
			document.getElementById('reproductor').src+=this.id;
			console.log(this.id);
			console.log(document.getElementById('reproductor').src+=this.id);
		}
	</script>
	</footer>
</body>
</html>