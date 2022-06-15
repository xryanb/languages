package com.languages.controllers;

import java.util.ArrayList;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.languages.models.Language;
import com.languages.services.LanguageService;




@Controller
public class LanguageController {
	@Autowired
	LanguageService languageService;
	
	//show one
		@GetMapping("/languages/{languageId}/")
		public String show(@PathVariable("languageId") Long languageId, Model model) {
			System.out.println(languageId);
			Language language=languageService.findLanguage(languageId);
			System.out.println(language);
			model.addAttribute("language",language);
			return "show.jsp";
		}
	
	//show all
		 @RequestMapping("/languages")
		    public String index(@ModelAttribute("language") Language language,Model model) {
				 ArrayList<Language> languages= (ArrayList<Language>) languageService.allLanguages();
		        model.addAttribute("languages", languages);
		        return "index.jsp";
		    }
	
		//create
			@PostMapping("/languages/create")
			public String create(@Valid @ModelAttribute("language") Language language, BindingResult result) {
		        if (result.hasErrors()) {
		            return "index.jsp";
		        } else {
		            languageService.createLanguage(language);
		            return "redirect:/languages";
		        }
		    }
			
			//update
			  @RequestMapping("/languages/{id}/edit")
			    public String edit(@PathVariable("id") Long id, Model model) {
			        Language language = languageService.findLanguage(id);
			        model.addAttribute("language", language);
			        return "edit.jsp";
			    }
			    
			    @RequestMapping(value="/language/{id}", method=RequestMethod.PUT)
			    public String update(@Valid @ModelAttribute("language") Language language, BindingResult result) {
			        if (result.hasErrors()) {
			            return "edit.jsp";
			        } else {
			            languageService.updateLanguage(language);
			            return "redirect:/languages";
			        }
			    }
			    
			    //delete
			    @DeleteMapping("/languages/{id}/delete")
			    public String destroy(@PathVariable("id") Long id) {
			        languageService.deleteLanguage(id);
			        return "redirect:/languages";
			    }
}
