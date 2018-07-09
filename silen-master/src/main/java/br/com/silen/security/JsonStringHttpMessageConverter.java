package br.com.silen.security;
import java.io.IOException;

import org.json.JSONObject;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.StringHttpMessageConverter;

import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonStringHttpMessageConverter extends StringHttpMessageConverter {

	@Override
	protected String readInternal(Class<? extends String> clazz, HttpInputMessage inputMessage) throws IOException, HttpMessageNotReadableException {
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonString = objectMapper.readValue(inputMessage.getBody(), String.class);
//		String jsonString = StreamUtils.copyToString(inputMessage.getBody(), Charsets.UTF_8);
		JSONObject jsonObject = new JSONObject(jsonString);
		String key = jsonObject.keys().next();
		return jsonObject.getString(key);
	}

}