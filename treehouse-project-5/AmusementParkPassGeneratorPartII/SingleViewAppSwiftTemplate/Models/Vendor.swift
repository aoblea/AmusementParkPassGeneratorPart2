//
//  Vendor.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Arwin Oblea on 8/22/19.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation

class Vendor: Entrant {
  init(firstName: String, lastName: String, companyName: String, dateOfBirth: String, dateOfVisit: String) throws {
    
    super.init(dateOfBirth: dateOfBirth, firstName: firstName, lastName: lastName, streetAddress: nil, city: nil, state: nil, zipCode: nil, projectNumber: nil, companyName: companyName, dateOfVisit: dateOfVisit)
    
    try nameCheck()
    try companyCheck()
    
    switch companyName {
    case "Acme":
      pass = VendorPass(pass: .vendor, area: [.kitchen], ride: [.none], discount: [.food, .merchandise])
    case "Orkin":
      pass = VendorPass(pass: .vendor, area: [.amusement, .ridecontrol, .kitchen], ride: [.none], discount: [.food, .merchandise])
    case "Fedex":
      pass = VendorPass(pass: .vendor, area: [.maintenance, .office], ride: [.none], discount: [.food, .merchandise])
    case "NW Electrical":
      pass = VendorPass(pass: .vendor, area: [.amusement, .kitchen, .maintenance, .office, .ridecontrol], ride: [.none], discount: [.food, .merchandise])
    default:
      throw ErrorType.incorrectcompanyname
    }
  }
}
