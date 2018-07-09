package br.com.silen.configuration;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.google.maps.GeoApiContext;

@Configuration
class GeolocationConfiguration {
	
	@Value("${geoapi.key}")
	private String geoApiKey;
	
	@Bean
	GeoApiContext geoApiContext() {
		return new GeoApiContext.Builder().apiKey(geoApiKey).build();
	}
	
	
}
