package com.languages.services;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.stereotype.Service;

import com.languages.models.Language;
import com.languages.repositories.LanguageRepository;

@Service
public class LanguageService {
	private final LanguageRepository lanRepo;
	
	public LanguageService(LanguageRepository lanRepo) {
		this.lanRepo=lanRepo;
	}
		
	 
    public List<Language> allLanguages() {
        return lanRepo.findAll();
    }
    
    public Language createLanguage(Language l) {
        return lanRepo.save(l);
    }
    // retrieves one
    public Language findLanguage(Long id) {
        Optional<Language> optionalL = lanRepo.findById(id);
        if(optionalL.isPresent()) {
            return optionalL.get();
        } else {
            return null;
        }
    }


	public Language updateLanguage(Long id, String name, String creator, Integer version) {
		Language language= findLanguage(id);
		if(language != null) {
		language.setName(name);
		language.setCreator(creator);
		language.setVersion(version);
	} 
	 return lanRepo.save(language);

	}


	public void deleteLanguage(Long id) {
		lanRepo.deleteById(id);
		
	}


	public void updateLanguage(@Valid Language language) {
		lanRepo.save(language);
	}
	
}
