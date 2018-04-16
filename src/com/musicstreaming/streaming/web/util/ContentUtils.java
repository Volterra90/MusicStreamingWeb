package com.musicstreaming.streaming.web.util;

public class ContentUtils {
		
	public static final String getPrettyDuracion (long duracion) {
		String segundos = String.valueOf(duracion % 60);
		String minutos = String.valueOf((duracion/ 60) % 60);
		String duracionString = minutos + ":" + segundos;
		return duracionString;
	}

}
