//
//  Kiosk.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Arwin Oblea on 9/12/19.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation

protocol Kiosk {
  func validateDoubleSwipe(_ dateSwiped: Date) throws -> Bool
  
  func swipe(_ pass: Pass, for area: AreaType) throws
  func validate(_ pass: Pass, for area: AreaType)
  
  func swipe(pass: Pass)
  func validate(_ pass: Pass, swipeTime: Pass) throws
  func validateRide(pass: Pass)
  
  func swipe(pass: Pass, for discount: DiscountType)
  func validate(_ pass: Pass, for register: DiscountType)
  
  func detectBirthday(entrant: Entrant)
}
