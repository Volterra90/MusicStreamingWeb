package com.musicstreaming.streaming.web.controller;

public interface ParameterNames {
	
	//Acci�n
	public static final String ACTION ="action";
	
	//Tipos de acci�n
	public static final String SIGNUP = "signup";
	public static final String SIGNIN ="signin";
	public static final String CHANGE_LOCALE = "change-locale";
	
	//Par�metros de rexistro
	public static final String NOME = "nome";
	public static final String APELIDOS = "apelidos";
	public static final String NICK = "nick";
	public static final String EMAIL = "email";
	public static final String PASSWORD = "password";
	public static final String FECHA = "fecha";
	public static final String XENERO = "xenero";
	
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
	
}
