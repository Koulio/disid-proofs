// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.clinictests.domain;

import io.springlets.format.EntityFormat;
import javax.persistence.Entity;
import org.springframework.roo.clinictests.domain.Owner;
import org.springframework.roo.clinictests.domain.Pet;
import org.springframework.util.Assert;

privileged aspect Owner_Roo_Jpa_Entity {
    
    declare @type: Owner: @Entity;
    
    declare @type: Owner: @EntityFormat("#{lastName} (#{city})");
    
    /**
     * TODO Auto-generated attribute documentation
     */
    public static final String Owner.ITERABLE_TO_ADD_CANT_BE_NULL_MESSAGE = "The given Iterable of items to add can't be null!";
    
    /**
     * TODO Auto-generated attribute documentation
     */
    public static final String Owner.ITERABLE_TO_REMOVE_CANT_BE_NULL_MESSAGE = "The given Iterable of items to add can't be null!";
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param petsToAdd
     */
    public void Owner.addToPets(Iterable<Pet> petsToAdd) {
        Assert.notNull(petsToAdd, ITERABLE_TO_ADD_CANT_BE_NULL_MESSAGE);
        for (Pet item : petsToAdd) {
            item.setOwner(this);
            this.pets.add(item);
        }
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param petsToRemove
     */
    public void Owner.removeFromPets(Iterable<Pet> petsToRemove) {
        Assert.notNull(petsToRemove, ITERABLE_TO_REMOVE_CANT_BE_NULL_MESSAGE);
        for (Pet item : petsToRemove) {
            this.pets.remove(item);
            item.setOwner(null);
        }
    }
    
}
