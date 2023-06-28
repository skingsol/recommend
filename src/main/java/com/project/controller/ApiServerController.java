//package com.project.controller;
//
//import java.net.URI;
//import java.nio.ByteBuffer;
//import java.nio.charset.StandardCharsets;
//
//import org.springframework.http.RequestEntity;
//import org.springframework.http.ResponseEntity;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.client.RestTemplate;
//import org.springframework.web.util.UriComponentsBuilder;
//
//import com.project.domain.MainImageItem;
//
//import lombok.extern.slf4j.Slf4j;
//
//@Slf4j
//@RestController
//@RequestMapping("/api/server")
//public class ApiServerController {
//
//	@GetMapping("/srch")
//	public String naverMainLocal(String query, Model model) {
//		
//		ByteBuffer buffer = StandardCharsets.UTF_8.encode(query);
//		
//		String encode = StandardCharsets.UTF_8.decode(buffer).toString();
//		
//		URI uri = UriComponentsBuilder.fromUriString("https://openapi.naver.com")
//															.path("/v1/search/local.json")
//															.queryParam("query", encode)
//															.queryParam("display", 4)
//															.queryParam("start", 1)
//															.queryParam("sort", "comment")
//															.encode()
//															.build()
//															.toUri();
//		
//		RestTemplate restTemplate = new RestTemplate();
//		
//		RequestEntity<Void> req = RequestEntity.get(uri)
//																	.header("X-Naver-Client-Id", "duSq6A4xuhsQBxveH3cy")
//																	.header("X-Naver-Client-Secret", "KSpQMKvLZv")
//																	.build();
//		
//		ResponseEntity<String> result = restTemplate.exchange(req, String.class);
//		return result.getBody();
//	}
//	
//	
//	
//	
//
//}
