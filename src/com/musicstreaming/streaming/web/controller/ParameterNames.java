package com.musicstreaming.streaming.web.controller;

public interface ParameterNames {
	
	//Acción
	public static final String ACTION ="action";
	
	//Tipos de acción
	public static final String SIGNUP = "signup";
	public static final String SIGNIN ="signin";
	public static final String CHANGE_LOCALE = "change-locale";
	
	//Parámetros de rexistro
	public static final String NOME = "nome";
	public static final String APELIDOS = "apelidos";
	public static final String NICK = "nick";
	public static final String EMAIL = "email";
	public static final String PASSWORD = "password";
	public static final String FECHA = "fecha";
	public static final String XENERO = "xenero";
	
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
	
}
