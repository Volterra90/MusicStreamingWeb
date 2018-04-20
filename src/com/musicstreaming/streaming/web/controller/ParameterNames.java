package com.musicstreaming.streaming.web.controller;

public interface ParameterNames {
	
	//Acci�n
	public static final String ACTION ="action";
	
	//Tipos de acci�n
	public static final String SIGNUP = "signup";
	public static final String SIGNIN ="signin";
	public static final String CHANGE_LOCALE = "change-locale";
	public static final String PRELOAD_PLAYLISTS_USER = "preload_playlists";
	public static final String CREATE_PLAYLIST = "create_playlist";
	
	//Par�metros de rexistro
	public static final String NOME = "nome";
	public static final String APELIDOS = "apelidos";
	public static final String NICK = "nick";
	public static final String EMAIL = "email";
	public static final String PASSWORD = "password";
	public static final String FECHA = "fecha";
	public static final String XENERO = "xenero";
	
	//Par�metros no sign-in
	public static final String RECORDAR_USUARIO = "recordar_usuario";
	
	//Par�metros do formulario de b�squeda
	public static final String NOMECONTIDO = "nomecontido";
	public static final String CANCION = "cancion";
	public static final String ALBUM = "album";
	public static final String PLAYLIST = "playlist";
	public static final String ARTISTA = "artista";
	
	//Par�metros que definen o tipo de b�squeda
	public static final String BUSQUEDACONTIDO = "busquedacontido";
	public static final String BUSQUEDAALBUM = "busquedaalbum";
	
	//Par�metros necesarios para renderizar a .jsp de albumes
	public static final String IDARTISTA = "idArtista";
	public static final String IDALBUM = "idAlbum";
	
	//Par�metros de idioma
	public static final String LOCALE = "locale";
	
	//Par�metros necesarios para recoller a nota da votaci�n dunha canci�n
	public static final String NOTA = "nota";
	public static final String IDCONTIDO = "idContido";
	
	public static final String VOTE_JSP = "voteJSP";
	
	//Par�metros para a b�squeda de playlists
	public static final String IDUSUARIO = "idUsuario";
	
	//Par�metros para a creaci�n de playlists
	public static final String NOME_PLAYLIST = "nomePlaylist";
	
	//URL para redireccionar � cambiar de locale
	public static final String URL_LOCALE = "url_locale";
}
