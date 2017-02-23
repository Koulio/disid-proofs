// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.relatedreadonly.repository;

import org.springframework.roo.relatedreadonly.domain.City;
import org.springframework.roo.relatedreadonly.repository.CityRepository;
import org.springframework.roo.relatedreadonly.repository.CityRepositoryCustom;
import org.springframework.roo.relatedreadonly.repository.ReadOnlyRepository;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CityRepository_Roo_Jpa_Repository {
    
    declare parents: CityRepository extends ReadOnlyRepository<City, Long>;
    
    declare parents: CityRepository extends CityRepositoryCustom;
    
    declare @type: CityRepository: @Transactional(readOnly = true);
    
}