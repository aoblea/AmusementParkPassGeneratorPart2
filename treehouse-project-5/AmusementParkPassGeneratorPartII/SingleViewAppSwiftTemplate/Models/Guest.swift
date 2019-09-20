//
//  Guest.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Arwin Oblea on 7/4/19.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation

class Guest: Entrant {}

class Classic: Guest {
  init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?) throws {
    super.init(dateOfBirth: nil, firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, projectNumber: nil, companyName: nil, dateOfVisit: nil)
    
    pass = ClassicGuestPass(pass: .classic, area: [.amusement], ride: [.allrides], discount: [.food, .merchandise])
  }
}

class VIP: Guest {
  init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?) throws {
    super.init(dateOfBirth: nil, firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, projectNumber: nil, companyName: nil, dateOfVisit: nil)
    
    pass = VIPGuestPass(pass: .vip, area: [.amusement], ride: [.allrides, .skipridelines], discount: [.food, .merchandise])
  }
}

class FreeChild: Guest {
  init(dateOfBirth: String, firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?) throws {
    super.init(dateOfBirth: dateOfBirth, firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, projectNumber: nil, companyName: nil, dateOfVisit: nil)
    
    try ageCheck(dateOfBirth: dateOfBirth, passType: .freeChild)
    
    pass = FreeChildPass(pass: .freeChild, area: [.amusement], ride: [.allrides], discount: [.food, .merchandise])
  }
}

class Season: Guest {
  init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) throws {
    super.init(dateOfBirth: nil, firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, projectNumber: nil, companyName: nil, dateOfVisit: nil)
    
    try nameCheck()
    try addressCheck()
    
    pass = SeasonGuestPass(pass: .season, area: [.amusement], ride: [.allrides, .skipridelines], discount: [.food, .merchandise])
  }
}

class Senior: Guest {
  init(dateOfBirth: String, firstName: String, lastName: String, streetAddress: String?, city: String?, state: String?, zipCode: String?) throws {
    super.init(dateOfBirth: dateOfBirth, firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, projectNumber: nil, companyName: nil, dateOfVisit: nil)
    
    try nameCheck()
    try ageCheck(dateOfBirth: dateOfBirth, passType: .senior)
    
    pass = SeniorGuestPass(pass: .senior, area: [.amusement], ride: [.allrides, .skipridelines], discount: [.food, .merchandise])
  }
}
