//
//  Errors.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Arwin Oblea on 7/11/19.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation

enum ErrorType: Error {
  case missingvalue
  case missingfirstname
  case missinglastname
  case missingstreetaddress
  case missingcity
  case missingstate
  case missingzipcode
  case missingdateofbirth
  case missingcompanyname
  case missingdateofvisit
  case missingprojectnumber
  case incorrectformat
  case agerestriction
  case incorrectprojectnumber
  case incorrectcompanyname
  case validation
  case areaswipetime
  case zipcodecount
}

enum BirthdayNotification: Error {
  case happybirthday
}
