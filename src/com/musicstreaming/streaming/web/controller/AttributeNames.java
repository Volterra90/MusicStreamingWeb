package com.musicstreaming.streaming.web.controller;

public interface AttributeNames {
	
	//Atributo para renderizar os erros
	public static final String ERROR = "error";
	
	//Usuario
	public static final String USER = "user";
	
	//Resultados de b�squeda
	public static final String CANCIONS = "cancions";
	public static final String ALBUMS = "albums";
	public static final String PLAYLISTS = "playlists";
	public static final String ARTISTAS_CANCION = "artistasCancion";
	public static final String ARTISTAS_ALBUM = "artistasAlbum";
	public static final String DURACIONS = "duracions";
	
	// Codigos de error
	public static final String GENERIC_ERROR = "generic.error";
	public static final String MISSING_PARAMETER_ERROR = "missing.error";
	public static final String USER_NOT_FOUND_ERROR = "user.not.found.error";
	
	//Top contidos
	public static final String TOP_N_CANCIONS = "top.cancions";
	public static final String TOP_N_ALBUMS = "top.albums";
	public static final String TOP_N_PLAYLISTS = "top.playlists";
	public static final String BOOLEAN = "boolean";
	
	//Atributos b�squeda albums
	public static final String CANCIONS_ALBUM = "cancions.album";
	public static final String ALBUM = "album";
	public static final String ARTISTA = "artista";
	
	//Erros no sign-up
	public static final String ERROR_FIRST_NAME = "error_first_name_empty";
	public static final String ERROR_LAST_NAME = "error_last_name_empty";
	public static final String ERROR_NICK = "error_nick";
	public static final String ERROR_EMAIL = "error_email";
	public static final String ERROR_PASSWORD = "error_password";
	public static final String ERROR_DATE = "error_date";
	public static final String ERROR_GENDER = "error_gender";
	
	
}
