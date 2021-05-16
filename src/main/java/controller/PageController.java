package controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("page")
public class PageController {

		@RequestMapping("intro")
			public ModelAndView intro() {
			ModelAndView mav = new ModelAndView();
			return mav;
		}
		@RequestMapping("intro2")
		public ModelAndView intro2() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
}
