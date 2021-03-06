// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.disid.proofs.client.web.html;

import com.disid.proofs.client.domain.Tool;
import com.disid.proofs.client.service.api.ToolService;
import com.disid.proofs.client.web.html.ToolsItemThymeleafController;
import com.disid.proofs.client.web.html.ToolsItemThymeleafLinkFactory;
import io.springlets.web.NotFoundException;
import io.springlets.web.mvc.util.ControllerMethodLinkBuilderFactory;
import io.springlets.web.mvc.util.MethodLinkBuilderFactory;
import java.util.Locale;
import javax.validation.Valid;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponents;

privileged aspect ToolsItemThymeleafController_Roo_Thymeleaf {
    
    declare @type: ToolsItemThymeleafController: @Controller;
    
    declare @type: ToolsItemThymeleafController: @RequestMapping(value = "/tools/{tool}", name = "ToolsItemThymeleafController", produces = MediaType.TEXT_HTML_VALUE);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MessageSource ToolsItemThymeleafController.messageSource;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MethodLinkBuilderFactory<ToolsItemThymeleafController> ToolsItemThymeleafController.itemLink;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param toolService
     * @param messageSource
     * @param linkBuilder
     */
    @Autowired
    public ToolsItemThymeleafController.new(ToolService toolService, MessageSource messageSource, ControllerMethodLinkBuilderFactory linkBuilder) {
        setToolService(toolService);
        setMessageSource(messageSource);
        setItemLink(linkBuilder.of(ToolsItemThymeleafController.class));
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return MessageSource
     */
    public MessageSource ToolsItemThymeleafController.getMessageSource() {
        return messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param messageSource
     */
    public void ToolsItemThymeleafController.setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return MethodLinkBuilderFactory
     */
    public MethodLinkBuilderFactory<ToolsItemThymeleafController> ToolsItemThymeleafController.getItemLink() {
        return itemLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param itemLink
     */
    public void ToolsItemThymeleafController.setItemLink(MethodLinkBuilderFactory<ToolsItemThymeleafController> itemLink) {
        this.itemLink = itemLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @param locale
     * @param method
     * @return Tool
     */
    @ModelAttribute
    public Tool ToolsItemThymeleafController.getTool(@PathVariable("tool") Long id, Locale locale, HttpMethod method) {
        Tool tool = null;
        if (HttpMethod.PUT.equals(method)) {
            tool = toolService.findOneForUpdate(id);
        } else {
            tool = toolService.findOne(id);
        }
        
        if (tool == null) {
            String message = messageSource.getMessage("error_NotFound", new Object[] {"Tool", id}, "The record couldn't be found", locale);
            throw new NotFoundException(message);
        }
        return tool;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param tool
     * @param model
     * @return ModelAndView
     */
    @GetMapping(name = "show")
    public ModelAndView ToolsItemThymeleafController.show(@ModelAttribute Tool tool, Model model) {
        model.addAttribute("tool", tool);
        return new ModelAndView("tools/show");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param tool
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/inline", name = "showInline")
    public ModelAndView ToolsItemThymeleafController.showInline(@ModelAttribute Tool tool, Model model) {
        model.addAttribute("tool", tool);
        return new ModelAndView("tools/showInline :: inline-content");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param dataBinder
     */
    @InitBinder("tool")
    public void ToolsItemThymeleafController.initToolBinder(WebDataBinder dataBinder) {
        dataBinder.setDisallowedFields("id");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void ToolsItemThymeleafController.populateFormats(Model model) {
        model.addAttribute("application_locale", LocaleContextHolder.getLocale().getLanguage());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void ToolsItemThymeleafController.populateForm(Model model) {
        populateFormats(model);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param tool
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/edit-form", name = "editForm")
    public ModelAndView ToolsItemThymeleafController.editForm(@ModelAttribute Tool tool, Model model) {
        populateForm(model);
        
        model.addAttribute("tool", tool);
        return new ModelAndView("tools/edit");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param tool
     * @param version
     * @param concurrencyControl
     * @param result
     * @param model
     * @return ModelAndView
     */
    @PutMapping(name = "update")
    public ModelAndView ToolsItemThymeleafController.update(@Valid @ModelAttribute Tool tool, @RequestParam("version") Integer version, @RequestParam(value = "concurrency", required = false, defaultValue = "") String concurrencyControl, BindingResult result, Model model) {
        // Check if provided form contain errors
        if (result.hasErrors()) {
            populateForm(model);
            
            return new ModelAndView("tools/edit");
        }
        // Concurrency control
        Tool existingTool = getToolService().findOne(tool.getId());
        if(tool.getVersion() != existingTool.getVersion() && StringUtils.isEmpty(concurrencyControl)){
            populateForm(model);
            model.addAttribute("tool", tool);
            model.addAttribute("concurrency", true);
            return new ModelAndView("tools/edit");
        } else if(tool.getVersion() != existingTool.getVersion() && "discard".equals(concurrencyControl)){
            populateForm(model);
            model.addAttribute("tool", existingTool);
            model.addAttribute("concurrency", false);
            return new ModelAndView("tools/edit");
        } else if(tool.getVersion() != existingTool.getVersion() && "apply".equals(concurrencyControl)){
            // Update the version field to be able to override the existing values
            tool.setVersion(existingTool.getVersion());
        }
        Tool savedTool = getToolService().save(tool);
        UriComponents showURI = getItemLink().to(ToolsItemThymeleafLinkFactory.SHOW).with("tool", savedTool.getId()).toUri();
        return new ModelAndView("redirect:" + showURI.toUriString());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param tool
     * @return ResponseEntity
     */
    @ResponseBody
    @DeleteMapping(name = "delete")
    public ResponseEntity<?> ToolsItemThymeleafController.delete(@ModelAttribute Tool tool) {
        getToolService().delete(tool);
        return ResponseEntity.ok().build();
    }
    
}
