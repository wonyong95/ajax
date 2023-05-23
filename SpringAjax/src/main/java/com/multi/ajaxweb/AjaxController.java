package com.multi.ajaxweb;



import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class AjaxController {
   
   @GetMapping("/ajaxView")
   public String ajaxView() {
      return "ajax/ajaxView";
   }
   
   @GetMapping(value="/ajaxPizzaText",produces ="text/plain; charset=UTF-8")
   @ResponseBody // 반환하는 값(String)이 뷰네임이 아니라 데이터를 반환한다는 의미로 붙여준다.
   public String ajaxResponse(@RequestParam(defaultValue= "") String phone) {
      log.info("phone="+phone);
      if(phone.isEmpty()||phone.equals("0000")) {
    	  return "0||";
      }else if(phone.equals("1111")) {
    	  return "111|서울 마포구 서교동|김철수";
      }else {
    	  return "100|서울 마포구 상수동|홀길동";
      }
      
    }
   @GetMapping(value="/ajaxPizza", produces="application/json")
   @ResponseBody
   public Map<String,String> ajaxXml(@RequestParam(defaultValue= "") String phone){
	   log.info("phone="+phone);
	   Map<String, String> map=new HashMap<>();
	   map.put("userNo", "200");
	   map.put("name", "이영희");
	   map.put("addr", "서울 마포구 합정동");
	   
	   return map;
   }
   
   }























