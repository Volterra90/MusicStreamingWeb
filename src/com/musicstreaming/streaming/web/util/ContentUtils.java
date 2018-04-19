package com.musicstreaming.streaming.web.util;

public class ContentUtils {
		
	public static final String getPrettyDuracion (long duracion) {
		String segundos = String.valueOf(duracion % 60);
		if (segundos.length()==1) {
			segundos = "0" + segundos;
		}
		String minutos = String.valueOf((duracion/ 60) % 60);
		if (minutos.length()==1) {
			minutos = "0" + minutos;
		}
		String duracionString = minutos + ":" + segundos;
		return duracionString;
	}

}
