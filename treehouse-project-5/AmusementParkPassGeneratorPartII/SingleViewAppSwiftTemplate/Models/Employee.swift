//
//  Employee.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Arwin Oblea on 7/4/19.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation

class Employee: Entrant {}

class FoodServices: Employee {
  init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) throws {
    super.init(dateOfBirth: nil, firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, projectNumber: nil, companyName: nil, dateOfVisit: nil)
    
    try nameCheck()
    try addressCheck()
    
    pass = FoodServicesEmployeePass(pass: .foodServices, area: [.amusement, .kitchen], ride: [.allrides], discount: [.food, .merchandise])
  }
}

class RideServices: Employee {
  init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) throws {
    super.init(dateOfBirth: nil, firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, projectNumber: nil, companyName: nil, dateOfVisit: nil)
    
    try nameCheck()
    try addressCheck()
  
    pass = RideServicesEmployeePass(pass: .rideServices, area: [.amusement, .ridecontrol], ride: [.allrides], discount: [.food, .merchandise])
  }
}

class Maintenance: Employee {
  init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) throws {
    super.init(dateOfBirth: nil, firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, projectNumber: nil, companyName: nil, dateOfVisit: nil)
    
    try nameCheck()
    try addressCheck()
    
    pass = MaintenanceEmployeePass(pass: .maintenance, area: [.amusement, .kitchen, .ridecontrol, .maintenance], ride: [.allrides], discount: [.food, .merchandise])
  }
}

class Contract: Employee {
  init(projectNumber: String, firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) throws {
    
    super.init(dateOfBirth: nil, firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, projectNumber: projectNumber, companyName: nil, dateOfVisit: nil)
    
    try nameCheck()
    try addressCheck()
    try projectCheck()
    
    switch projectNumber {
    case "1001":
      pass = ContractEmployeePass(pass: .contractor, area: [.amusement, .ridecontrol], ride: [.none], discount: [.food, .merchandise])
    case "1002":
      pass = ContractEmployeePass(pass: .contractor, area: [.amusement, .ridecontrol, .maintenance], ride: [.none], discount: [.food, .merchandise])
    case "1003":
      pass = ContractEmployeePass(pass: .contractor, area: [.amusement, .kitchen, .maintenance, .office, .ridecontrol], ride: [.none], discount: [.food, .merchandise])
    case "2001":
      pass = ContractEmployeePass(pass: .contractor, area: [.office], ride: [.none], discount: [.food, .merchandise])
    case "2002":
      pass = ContractEmployeePass(pass: .contractor, area: [.kitchen, .maintenance], ride: [.none], discount: [.food, .merchandise])
    default:
      throw ErrorType.incorrectprojectnumber
    }
    
  }
}
