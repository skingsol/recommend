package com.project.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.project.domain.WishListDTO;
import com.project.service.WishListService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("")
public class WishListController {
	
	@Autowired
    private WishListService wishListService;

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/wishlist")
    public String wishList(Principal principal, Model model) {
        log.info("wishlist 페이지 요청");
        String userId = principal.getName();
        List<WishListDTO> wishList = wishListService.getWishList(userId);
        model.addAttribute("wishList", wishList);
        log.info("wishList"+wishList);
        return "wishlist";
    }
    
    @GetMapping("/wish/add")
    public ResponseEntity<String> wishAdd(@RequestParam("restaurantId")int restaurantId, @RequestParam("userId")String userId) {
    	try {
    		if(wishListService.insertWishList(restaurantId, userId)==1) {
    			return new ResponseEntity<> ("success",HttpStatus.OK);
    		}
		} catch (Exception e) {
			log.info("실패");
		}  
    	return new ResponseEntity<> ("fail",HttpStatus.OK);
    }    
    
    @GetMapping("/wish/count")
    public ResponseEntity<String> wishCount(@RequestParam("restaurantId")int restaurantId) {
    	String count =  Integer.toString(wishListService.countWishList(restaurantId));
    	System.out.println(count);
    	return new ResponseEntity<> (count,HttpStatus.OK);
    }
    
    @GetMapping("/wish/delete")
    public ResponseEntity<String> wishDelete(WishListDTO dto) {
    	wishListService.deleteWishList(dto);
    	return new ResponseEntity<> ("success",HttpStatus.OK);
    }
}
