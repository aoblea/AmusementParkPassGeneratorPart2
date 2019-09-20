//
//  PassVCExtension.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Arwin Oblea on 9/19/19.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation

extension PassViewController {
  // Methods
  // Checks For Double Swipe
  func validateDoubleSwipe(_ dateSwiped: Date) throws -> Bool {
    let elapsedTime = Calendar.current.dateComponents([.second], from: dateSwiped, to: Date())
    guard let seconds = elapsedTime.second else { throw ErrorType.missingvalue } // throw error that elapsedtime value is nil
    if seconds < 5 {
      return true
    } else {
      return false
    }
  }
  
  // swipe function to check accessiblility of specific area from entrant's park pass
  func swipe(_ pass: Pass, for area: AreaType) throws {
    if pass.lastSwipedAtArea != area {
      validate(pass, for: area)
    } else {
      if let passAreaTime = pass.swipeTimeForArea {
        do {
          if try validateDoubleSwipe(passAreaTime) == true {
            print("wait 5 seconds")
          } else {
            validate(pass, for: area)
          }
        } catch {
          throw ErrorType.validation
        }
      } else {
        throw ErrorType.areaswipetime
      }
    }
  }
  
  // checks current pass if it can access the area
  func validate(_ pass: Pass, for area: AreaType) {
    // stores the current pass' timeOfSwipe and area that was last swiped
    pass.swipeTimeForArea = Date()
    pass.lastSwipedAtArea = area
    
    // validates pass
    if pass.areaAccess.contains(area) {
      soundFX.playAcceptedSound()
      resultsView.backgroundColor = .green
      resultsLabel.text = "\(area) Access Allowed"
    } else {
      soundFX.playDeniedSound()
      resultsView.backgroundColor = .red
      resultsLabel.text = "\(area) Access Not Allowed"
    }
  }
  
  func swipe(pass: Pass) {
    if pass.lastSwipedAtRide == nil {
      validateRide(pass: pass)
    } else {
      do {
        try validate(pass, swipeTime: pass)
      } catch {
        print("Unexpected error. \(error)")
      }
    }
  }
  
  func validate(_ pass: Pass, swipeTime: Pass) throws {
    do {
      guard let checkTime = swipeTime.swipeTimeForRide else { throw ErrorType.missingvalue }
      if try validateDoubleSwipe(checkTime) == true {
        print("wait 5 sec")
      } else {
        validateRide(pass: pass)
      }
    } catch {
      throw ErrorType.validation
    }
  }
  
  func validateRide(pass: Pass) {
    if pass.rideAccess.contains(.allrides) && pass.rideAccess.contains(.skipridelines) {
      pass.lastSwipedAtRide = .skipridelines
      pass.swipeTimeForRide = Date()
      soundFX.playAcceptedSound()
      resultsView.backgroundColor = .green
      resultsLabel.text = "\(pass.passType) Has Access To All Rides And Can Skip Lines"
    } else if pass.rideAccess.contains(.allrides) {
      pass.lastSwipedAtRide = .allrides
      pass.swipeTimeForRide = Date()
      soundFX.playAcceptedSound()
      resultsView.backgroundColor = .green
      resultsLabel.text = "\(pass.passType) Has Access To All Rides"
    } else if pass.rideAccess.contains(.none) {
      pass.lastSwipedAtRide = .none
      pass.swipeTimeForRide = Date()
      soundFX.playDeniedSound()
      resultsView.backgroundColor = .red
      resultsLabel.text = "\(pass.passType) Access Not Allowed"
    }
  }
  
  func swipe(pass: Pass, for discount: DiscountType) {
    if pass.lastSwipedForDiscount != discount {
      validate(pass, for: discount)
    } else {
      if let passDiscountTime = pass.swipeTimeForDiscount {
        do {
          if try validateDoubleSwipe(passDiscountTime) == true {
            print("wait 5 seconds")
          } else {
            validate(pass, for: discount)
          }
        } catch {
          print("Unexpected error. \(error)")
        }
      }
    }
  }
  
  func validate(_ pass: Pass, for register: DiscountType) {
    pass.swipeTimeForDiscount = Date()
    pass.lastSwipedForDiscount = register
    
    if pass.discountAccess.contains(register) {
      if register == .food {
        switch pass.passType {
        case .classic:
          soundFX.playDeniedSound()
          resultsView.backgroundColor = .red
          resultsLabel.text = "\(pass.passType) has \(pass.foodPercentage)% Food Discount"
        case .vip:
          soundFX.playAcceptedSound()
          resultsView.backgroundColor = .green
          resultsLabel.text = "\(pass.passType) has \(pass.foodPercentage)% Food Discount"
        case .freeChild:
          soundFX.playDeniedSound()
          resultsView.backgroundColor = .red
          resultsLabel.text = "\(pass.passType) has \(pass.foodPercentage)% Food Discount"
        case .senior:
          soundFX.playAcceptedSound()
          resultsView.backgroundColor = .green
          resultsLabel.text = "\(pass.passType) has \(pass.foodPercentage)% Food Discount"
        case .season:
          soundFX.playAcceptedSound()
          resultsView.backgroundColor = .green
          resultsLabel.text = "\(pass.passType) has \(pass.foodPercentage)% Food Discount"
        case .foodServices:
          soundFX.playAcceptedSound()
          resultsView.backgroundColor = .green
          resultsLabel.text = "\(pass.passType) has \(pass.foodPercentage)% Food Discount"
        case .rideServices:
          soundFX.playAcceptedSound()
          resultsView.backgroundColor = .green
          resultsLabel.text = "\(pass.passType) has \(pass.foodPercentage)% Food Discount"
        case .maintenance:
          soundFX.playAcceptedSound()
          resultsView.backgroundColor = .green
          resultsLabel.text = "\(pass.passType) has \(pass.foodPercentage)% Food Discount"
        case .manager:
          soundFX.playAcceptedSound()
          resultsView.backgroundColor = .green
          resultsLabel.text = "\(pass.passType) has \(pass.foodPercentage)% Food Discount"
        case .contractor:
          soundFX.playDeniedSound()
          resultsView.backgroundColor = .red
          resultsLabel.text = "\(pass.passType) has \(pass.foodPercentage)% Food Discount"
        case .vendor:
          soundFX.playDeniedSound()
          resultsView.backgroundColor = .red
          resultsLabel.text = "\(pass.passType) has \(pass.foodPercentage)% Food Discount"
        }
      } else if register == .merchandise {
        switch pass.passType {
        case .classic:
          soundFX.playDeniedSound()
          resultsView.backgroundColor = .red
          resultsLabel.text = "\(pass.passType) has \(pass.merchandisePercentage)% Merchandise Discount"
        case .vip:
          soundFX.playAcceptedSound()
          resultsView.backgroundColor = .green
          resultsLabel.text = "\(pass.passType) has \(pass.merchandisePercentage)% Merchandise Discount"
        case .freeChild:
          soundFX.playDeniedSound()
          resultsView.backgroundColor = .red
          resultsLabel.text = "\(pass.passType) has \(pass.merchandisePercentage)% Merchandise Discount"
        case .senior:
          soundFX.playAcceptedSound()
          resultsView.backgroundColor = .green
          resultsLabel.text = "\(pass.passType) has \(pass.merchandisePercentage)% Merchandise Discount"
        case .season:
          soundFX.playAcceptedSound()
          resultsView.backgroundColor = .green
          resultsLabel.text = "\(pass.passType) has \(pass.merchandisePercentage)% Merchandise Discount"
        case .foodServices:
          soundFX.playAcceptedSound()
          resultsView.backgroundColor = .green
          resultsLabel.text = "\(pass.passType) has \(pass.merchandisePercentage)% Merchandise Discount"
        case .rideServices:
          soundFX.playAcceptedSound()
          resultsView.backgroundColor = .green
          resultsLabel.text = "\(pass.passType) has \(pass.merchandisePercentage)% Merchandise Discount"
        case .maintenance:
          soundFX.playAcceptedSound()
          resultsView.backgroundColor = .green
          resultsLabel.text = "\(pass.passType) has \(pass.merchandisePercentage)% Merchandise Discount"
        case .manager:
          soundFX.playAcceptedSound()
          resultsView.backgroundColor = .green
          resultsLabel.text = "\(pass.passType) has \(pass.merchandisePercentage)% Merchandise Discount"
        case .contractor:
          soundFX.playDeniedSound()
          resultsView.backgroundColor = .red
          resultsLabel.text = "\(pass.passType) has \(pass.merchandisePercentage)% Merchandise Discount"
        case .vendor:
          soundFX.playDeniedSound()
          resultsView.backgroundColor = .red
          resultsLabel.text = "\(pass.passType) has \(pass.merchandisePercentage)% Merchandise Discount"
        }
      }
    }
  }
}
