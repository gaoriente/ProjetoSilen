package br.com.silen.geolocation;

import java.io.IOException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.maps.GeoApiContext;
import com.google.maps.GeocodingApi;
import com.google.maps.errors.ApiException;
import com.google.maps.model.LatLng;

@Service
public class GeolocationService {
	
	@Autowired
	private GeoApiContext geoApiContext;

	public Optional<Location> retrieveLocationFrom(String address) {
		try {
			LatLng latLng = GeocodingApi.newRequest(geoApiContext)
						.address(address)
						.await()
						[0]
						.geometry
						.location;
			return Optional.of(new Location(latLng.lat, latLng.lng));
		} catch (ApiException | InterruptedException | IOException e) {
			e.printStackTrace();
			return Optional.empty();
		}
	}

}
