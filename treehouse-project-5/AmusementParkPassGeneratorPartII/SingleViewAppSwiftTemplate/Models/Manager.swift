//
//  Manager.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Arwin Oblea on 8/22/19.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation

class Manager: Entrant {
  init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) throws {
    super.init(dateOfBirth: nil, firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, projectNumber: nil, companyName: nil, dateOfVisit: nil)
    
    try nameCheck()
    try addressCheck()
    
    pass = ManagerPass(pass: .manager, area: [.amusement, .kitchen, .maintenance, .office, .ridecontrol], ride: [.allrides], discount: [.food, .merchandise])
  }
}
