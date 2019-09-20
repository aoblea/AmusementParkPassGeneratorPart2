//
//  Entrant.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Arwin Oblea on 7/5/19.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation

class Entrant {
  // MARK: - Properties
  var dateOfBirth: String?
  var firstName: String?
  var lastName: String?
  var streetAddress: String?
  var city: String?
  var state: String?
  var zipCode: String?
  var projectNumber: String?
  var companyName: String?
  var dateOfVisit: String?
  
  var pass: Pass
  
  init(dateOfBirth: String?, firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, projectNumber: String?, companyName: String?, dateOfVisit: String?) {
    self.dateOfBirth = dateOfBirth
    self.firstName = firstName
    self.lastName = lastName
    self.streetAddress = streetAddress
    self.city = city
    self.state = state
    self.zipCode = zipCode
    self.projectNumber = projectNumber
    self.companyName = companyName
    self.dateOfVisit = dateOfVisit
    
    self.pass = DefaultPass()
  }
  
  func nameCheck() throws {
    guard let first = firstName, let last = lastName else { return }
    if first.isEmpty {
      throw ErrorType.missingfirstname
    }
    if last.isEmpty {
      throw ErrorType.missinglastname
    }
  }

  func addressCheck() throws {
    guard let unwrappedStreetAddress = streetAddress, let unwrappedCity = city, let unwrappedState = state, let unwrappedZipCode = zipCode else { return }
    if unwrappedStreetAddress.isEmpty {
      throw ErrorType.missingstreetaddress
    }

    if unwrappedCity.isEmpty {
      throw ErrorType.missingcity
    }

    if unwrappedState.isEmpty {
      throw ErrorType.missingstate
    }

    if unwrappedZipCode.isEmpty {
      throw ErrorType.missingzipcode
    }
    
    if unwrappedZipCode.count != 5 {
      throw ErrorType.zipcodecount
    }
  }
  
  func projectCheck() throws {
    guard let project = projectNumber else { return }
    if project.isEmpty {
      throw ErrorType.missingprojectnumber
    }
  }
  
  func companyCheck() throws {
    guard let company = companyName else { return }
    if company.isEmpty {
      throw ErrorType.missingcompanyname
    }
  }
  
  func ageCheck(dateOfBirth: String, passType: PassType) throws {
    if dateOfBirth.isEmpty {
      throw ErrorType.missingdateofbirth
    } else if dateOfBirth.count != 10 {
      throw ErrorType.incorrectformat
    } else if dateOfBirth.count == 10 {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "MM/dd/yyyy"
      
      guard let formattedDOB = dateFormatter.date(from: dateOfBirth) else { throw ErrorType.incorrectformat }
      let calendar = Calendar.current
      let today = Date()
      let calculatedAge = calendar.dateComponents([.year], from: formattedDOB, to: today)
      guard let age = calculatedAge.year else { throw ErrorType.missingvalue }
      
      if (age < 5 && passType == .freeChild) || (age > 60 && passType == .senior) {
        print("Congrats, get your free pass!")
      } else {
        throw ErrorType.agerestriction
      }
    }
  }  
}
