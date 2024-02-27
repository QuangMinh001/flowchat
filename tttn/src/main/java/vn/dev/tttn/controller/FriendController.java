package vn.dev.tttn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.dev.tttn.entity.Friend;
import vn.dev.tttn.entity.User;
import vn.dev.tttn.service.FriendService;

@Controller
public class FriendController extends BaseController{
	
	@Autowired
	private FriendService friendService;
	
	@RequestMapping(value ="/user/friend/{userId}", method=RequestMethod.GET)
	public String addFriend(final Model model,
			@PathVariable Integer userId) {
		
		User userLogined = userService.getByUsername(getUsernameLogined());
		
		friendService.saveAddFrient(userLogined, userId);
		
		model.addAttribute("isFriend", friendService.checkIsFriend(userLogined.getId(), userId));
		
		return "redirect:/user/profile/" + userId;
	}
}
