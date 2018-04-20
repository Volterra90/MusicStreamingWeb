package com.musicstreaming.streaming.web.controller;

public interface ParameterNames {
	
	//Acción
	public static final String ACTION ="action";
	
	//Tipos de acción
	public static final String SIGNUP = "signup";
	public static final String SIGNIN ="signin";
	public static final String CHANGE_LOCALE = "change-locale";
	public static final String PRELOAD_PLAYLISTS_USER = "preload_playlists";
	public static final String CREATE_PLAYLIST = "create_playlist";
	
	//Parámetros de rexistro
	public static final String NOME = "nome";
	public static final String APELIDOS = "apelidos";
	public static final String NICK = "nick";
	public static final String EMAIL = "email";
	public static final String PASSWORD = "password";
	public static final String FECHA = "fecha";
	public static final String XENERO = "xenero";
	
	//Parámetros no sign-in
	public static final String RECORDAR_USUARIO = "recordar_usuario";
	
	//Parámetros do formulario de búsqueda
	public static final String NOMECONTIDO = "nomecontido";
	public static final String CANCION = "cancion";
	public static final String ALBUM = "album";
	public static final String PLAYLIST = "playlist";
	public static final String ARTISTA = "artista";
	
	//Parámetros que definen o tipo de búsqueda
	public static final String BUSQUEDACONTIDO = "busquedacontido";
	public static final String BUSQUEDAALBUM = "busquedaalbum";
	
	//Parámetros necesarios para renderizar a .jsp de albumes
	public static final String IDARTISTA = "idArtista";
	public static final String IDALBUM = "idAlbum";
	
	//Parámetros de idioma
	public static final String LOCALE = "locale";
	
	//Parámetros necesarios para recoller a nota da votación dunha canción
	public static final String NOTA = "nota";
	public static final String IDCONTIDO = "idContido";
	
	public static final String VOTE_JSP = "voteJSP";
	
	//Parámetros para a búsqueda de playlists
	public static final String IDUSUARIO = "idUsuario";
	
	//Parámetros para a creación de playlists
	public static final String NOME_PLAYLIST = "nomePlaylist";
	
	//URL para redireccionar ó cambiar de locale
	public static final String URL_LOCALE = "url_locale";
}
