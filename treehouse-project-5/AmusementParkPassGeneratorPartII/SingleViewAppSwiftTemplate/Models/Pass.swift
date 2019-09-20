//
//  Pass.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Arwin Oblea on 7/5/19.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation

enum PassType {
  case classic
  case vip
  case freeChild
  case senior
  case season
  case foodServices
  case rideServices
  case maintenance
  case manager
  case contractor
  case vendor
}

class Pass {
  var passType: PassType
  var areaAccess: [AreaType]
  var rideAccess: [RideType]
  var discountAccess: [DiscountType]
  
  var foodPercentage: Int
  var merchandisePercentage: Int
  
  var swipeTimeForArea: Date?
  var swipeTimeForRide: Date?
  var swipeTimeForDiscount: Date?
  
  var lastSwipedAtArea: AreaType?
  var lastSwipedAtRide: RideType?
  var lastSwipedForDiscount: DiscountType?
  
  init(passType: PassType, areaAccess: [AreaType], rideAccess: [RideType], discountAccess: [DiscountType]) {
    self.passType = passType
    self.areaAccess = areaAccess
    self.rideAccess = rideAccess
    self.discountAccess = discountAccess
    self.foodPercentage = 0
    self.merchandisePercentage = 0
  }
  
  func rideSummary() -> String {
    switch self.passType {
    case .classic:
      return "Access All Rides"
    case .vip:
      return "Access All Rides / Skip All Rides"
    case .freeChild:
      return "Access All Rides"
    case .senior:
      return "Access All Rides / Skip All Rides"
    case .season:
      return "Access All Rides / Skip All Rides"
    case .foodServices:
      return "Access All Rides"
    case .rideServices:
      return "Access All Rides"
    case .maintenance:
      return "Access All Rides"
    case .manager:
      return "Access All Rides"
    case .contractor:
      return "No Access To Rides"
    case .vendor:
      return "No Access To Rides"
    }
  }
}

// Default Pass
class DefaultPass: Pass {
  init() {
    super.init(passType: .classic, areaAccess: [], rideAccess: [], discountAccess: [])
  }
}

// Guest Passes
class ClassicGuestPass: Pass {
  init(pass: PassType, area: [AreaType], ride: [RideType], discount: [DiscountType]) {
    super.init(passType: pass, areaAccess: area, rideAccess: ride, discountAccess: discount)
    foodPercentage = 0
    merchandisePercentage = 0
  }
}

class VIPGuestPass: Pass {
  init(pass: PassType, area: [AreaType], ride: [RideType], discount: [DiscountType]) {
    super.init(passType: pass, areaAccess: area, rideAccess: ride, discountAccess: discount)
    foodPercentage = 10
    merchandisePercentage = 20
  }
}

class FreeChildPass: Pass {
  init(pass: PassType, area: [AreaType], ride: [RideType], discount: [DiscountType]) {
    super.init(passType: pass, areaAccess: area, rideAccess: ride, discountAccess: discount)
    foodPercentage = 0
    merchandisePercentage = 0
  }
}

class SeniorGuestPass: Pass {
  init(pass: PassType, area: [AreaType], ride: [RideType], discount: [DiscountType]) {
    super.init(passType: pass, areaAccess: area, rideAccess: ride, discountAccess: discount)
    foodPercentage = 10
    merchandisePercentage = 10
  }
}

class SeasonGuestPass: Pass {
  init(pass: PassType, area: [AreaType], ride: [RideType], discount: [DiscountType]) {
    super.init(passType: pass, areaAccess: area, rideAccess: ride, discountAccess: discount)
    foodPercentage = 10
    merchandisePercentage = 20
  }
}

// Employee Passes
class FoodServicesEmployeePass: Pass {
  init(pass: PassType, area: [AreaType], ride: [RideType], discount: [DiscountType]) {
    super.init(passType: pass, areaAccess: area, rideAccess: ride, discountAccess: discount)
    foodPercentage = 15
    merchandisePercentage = 25
  }
}

class RideServicesEmployeePass: Pass {
  init(pass: PassType, area: [AreaType], ride: [RideType], discount: [DiscountType]) {
    super.init(passType: pass, areaAccess: area, rideAccess: ride, discountAccess: discount)
    foodPercentage = 15
    merchandisePercentage = 25
  }
}

class MaintenanceEmployeePass: Pass {
  init(pass: PassType, area: [AreaType], ride: [RideType], discount: [DiscountType]) {
    super.init(passType: pass, areaAccess: area, rideAccess: ride, discountAccess: discount)
    foodPercentage = 15
    merchandisePercentage = 25
  }
}

class ContractEmployeePass: Pass {
  init(pass: PassType, area: [AreaType], ride: [RideType], discount: [DiscountType]) {
    super.init(passType: pass, areaAccess: area, rideAccess: ride, discountAccess: discount)
    foodPercentage = 0
    merchandisePercentage = 0
  }
}

// Manager Passes
class ManagerPass: Pass {
  init(pass: PassType, area: [AreaType], ride: [RideType], discount: [DiscountType]) {
    super.init(passType: pass, areaAccess: area, rideAccess: ride, discountAccess: discount)
    foodPercentage = 25
    merchandisePercentage = 25
  }
}

// Vendor Passes
class VendorPass: Pass {
  init(pass: PassType, area: [AreaType], ride: [RideType], discount: [DiscountType]) {
    super.init(passType: pass, areaAccess: area, rideAccess: ride, discountAccess: discount)
    foodPercentage = 0
    merchandisePercentage = 0
  }
}
