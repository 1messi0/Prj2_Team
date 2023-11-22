package com.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.login.UserVo;
import com.board.mapper.UserMapper;

import lombok.RequiredArgsConstructor;

@Controller
public class HomeController {
	
	@Autowired
	private UserMapper userMapper;
	
	// http://localhost
	@RequestMapping("/")
	public  ModelAndView   home( String name) {
		//String  name = "안유진";
		ModelAndView  mv = new ModelAndView();
		mv.addObject("irum", name);
		mv.setViewName("home");
		return mv;   // /WEB-INF/views/ home .jsp
	}
	
	 //chatBot Go
	 @RequestMapping("/chat") 
	 public ModelAndView chat() { 
		 ModelAndView mv = new ModelAndView(); 
		 mv.setViewName("chat"); 
		 return mv; 
}
	// 로그인
		@RequestMapping("/Login")
		public  ModelAndView login() {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/user/login");
			return mv;
		}
		
		// 로그인 처리
		@PostMapping("/userLogin")
		public String userLogin(@RequestParam("id") String id, @RequestParam("password") String password, HttpSession session, RedirectAttributes redirectAttributes) {
		    Map<String, Object> user = new HashMap<>();
		    user.put("id", id);
		    user.put("password", password);
		    UserVo userVo = userMapper.userLogin(user);

		    if (userVo != null) {
		        session.setAttribute("user", userVo);
		        return "redirect:/";
		    } else {
		    	redirectAttributes.addFlashAttribute("message", "Invalid username or password");
		        return "redirect:/Login";  // 대문자 'L'로 시작하는 "/Login"으로 변경합니다.
		    }
		}


	// 로그아웃
		@GetMapping("/Logout")
		public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		    session.invalidate();
		    response.sendRedirect(request.getContextPath() + "/");
		    return null;
		}


		// 약관 동의
		@RequestMapping("/Terms")
		public  ModelAndView terms() {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/user/terms");
			return mv;
		}
		
	    // 회원가입 페이지
	    @RequestMapping("/Join")
	    public ModelAndView join() {
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("/user/join");
	        return mv;
	    }
	    
	    // 회원가입 처리
	    @PostMapping("/userInsert")
	    public String userInsert(@ModelAttribute UserVo user) {
	        if (user.getId() == null || user.getId().isEmpty()) {
	            // id가 null이거나 빈 문자열이라면 오류 메시지를 표시하고 회원가입 페이지로 리다이렉트
	            return "redirect:/Join";
	        }
	        
	        userMapper.userInsert(user);
	        return "redirect:/Login";
	    }
	    
	    // 이메일 인증번호 처리
}





