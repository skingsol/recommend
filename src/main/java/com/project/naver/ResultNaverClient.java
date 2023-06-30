package com.project.naver;

import java.net.URI;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.project.restaurants.dto.ResultImageReq;
import com.project.restaurants.dto.ResultImageRes;
import com.project.restaurants.dto.ResultLocalReq;
import com.project.restaurants.dto.ResultLocalRes;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class ResultNaverClient {
	
	//application.properties 에 있는 정보 가져오기
	@Value("${naver.client.id}")
	private String naverClientId;
	
	@Value("${naver.client.secret}")
	private String naverClientSecret;
	
	@Value("${naver.url.result.local}")
	private String naverLocalResultUrl;
	
	@Value("${naver.url.result.image}")
	private String naverImageResultUrl;
	
	public ResultLocalRes ResultLocal(ResultLocalReq resultLocalReq) {
		
		URI uri = UriComponentsBuilder.fromUriString(naverLocalResultUrl)
									  .queryParams(resultLocalReq.toMultiValueMap())
									  .encode()
									  .build()
									  .toUri();

		//헤더추가
		HttpHeaders headers = new HttpHeaders();
		headers.set("X-Naver-Client-Id", naverClientId);
		headers.set("X-Naver-Client-Secret", naverClientSecret);
		headers.setContentType(MediaType.APPLICATION_JSON);		
		HttpEntity<HttpHeaders> httpEntity = new HttpEntity<>(headers);
		
		
		
		ParameterizedTypeReference<ResultLocalRes> resReference = new ParameterizedTypeReference<ResultLocalRes>() {};
		
		ResponseEntity<ResultLocalRes> resEntity = new RestTemplate().exchange(uri, HttpMethod.GET, httpEntity, resReference);
		return resEntity.getBody(); 	// <== 바디 정보만 받아오겠단 소리
	}	
	
	
public ResultImageRes ResultImage(ResultImageReq resultImageReq) {
		
		URI uri = UriComponentsBuilder.fromUriString(naverImageResultUrl)
									  .queryParams(resultImageReq.toMultiValueMap())
									  .encode()
									  .build()
									  .toUri();

		//헤더추가
		HttpHeaders headers = new HttpHeaders();
		headers.set("X-Naver-Client-Id", naverClientId);
		headers.set("X-Naver-Client-Secret", naverClientSecret);
		headers.setContentType(MediaType.APPLICATION_JSON);		
		HttpEntity<HttpHeaders> httpEntity = new HttpEntity<>(headers);
		
		log.info("clientID,{}", naverClientId);
		log.info("ClientSecret,{}", naverClientSecret);
		
		
		ParameterizedTypeReference<ResultImageRes> resReference = new ParameterizedTypeReference<ResultImageRes>() {};
		
		ResponseEntity<ResultImageRes> resEntity = new RestTemplate().exchange(uri, HttpMethod.GET, httpEntity, resReference);
		return resEntity.getBody(); 	// <== 바디 정보만 받아오겠단 소리
	}	
}
