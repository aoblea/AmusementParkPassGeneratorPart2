//
//  PassViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Arwin Oblea on 9/2/19.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import UIKit
import AVFoundation

class PassViewController: UIViewController, Kiosk {
  // UILabels
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var passNameLabel: UILabel!
  @IBOutlet weak var dateOfVisitLabel: UILabel!
  
  @IBOutlet weak var perksLabel: UILabel!
  @IBOutlet weak var foodLabel: UILabel!
  @IBOutlet weak var merchLabel: UILabel!
  
  @IBOutlet weak var resultsLabel: UILabel!
  @IBOutlet weak var resultsView: UIView!

  var finalEntrant = Entrant(dateOfBirth: nil, firstName: nil, lastName: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil, projectNumber: nil, companyName: nil, dateOfVisit: nil)
  let soundFX = SoundPlayer()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.Theme.gray
    
    if let firstName = finalEntrant.firstName, let lastName = finalEntrant.lastName {
      let capitalizedFirstName = firstName.uppercased()
      let capitalizedLastName = lastName.uppercased()
      nameLabel.text = "\(capitalizedFirstName) \(capitalizedLastName)"
    } else {
      nameLabel.text = ""
    }
  
    let passNameString = "\(finalEntrant.pass.passType)"
    passNameLabel.text = passNameString + " pass"
    
    if let dov = finalEntrant.dateOfVisit {
       dateOfVisitLabel.text = "\(dov)"
    } else {
      dateOfVisitLabel.text = ""
    }
   
    perksLabel.text = "\(finalEntrant.pass.rideSummary())"
    foodLabel.text = "\(finalEntrant.pass.foodPercentage)% Food Discount"
    merchLabel.text = "\(finalEntrant.pass.merchandisePercentage)% Merchandise Discount"
  }
  
  // IBActions
  @IBAction func officeButtonPressed(_ sender: UIButton) {
    // test office access
    do {
      try swipe(finalEntrant.pass, for: .office)
    } catch {
      print("Unexpected error. \(error)")
    }
    
    detectBirthday(entrant: finalEntrant)
  }
  
  @IBAction func kitchenButtonPressed(_ sender: UIButton) {
    // test kitchen access
    do {
      try swipe(finalEntrant.pass, for: .kitchen)
    } catch {
      print("Unexpected error. \(error)")
    }
    
    detectBirthday(entrant: finalEntrant)
  }
  
  @IBAction func rideControlButtonPressed(_ sender: UIButton) {
    // test ride control access
    do {
      try swipe(finalEntrant.pass, for: .ridecontrol)
    } catch {
      print("Unexpected error. \(error)")
    }
    
    detectBirthday(entrant: finalEntrant)
  }
  
  @IBAction func amusementButtonPressed(_ sender: UIButton) {
    // test amusement access
    do {
      try swipe(finalEntrant.pass, for: .amusement)
    } catch {
      print("Unexpected error. \(error)")
    }
    
    detectBirthday(entrant: finalEntrant)
  }
  
  @IBAction func ridesButtonPressed(_ sender: UIButton) {
    // test rides access
    swipe(pass: finalEntrant.pass)
    detectBirthday(entrant: finalEntrant)
  }
  
  @IBAction func foodDiscountButtonPressed(_ sender: UIButton) {
    // test food discount access
    swipe(pass: finalEntrant.pass, for: .food)
    detectBirthday(entrant: finalEntrant)
  }
  
  @IBAction func merchDiscountButtonPressed(_ sender: UIButton) {
    // test merch discount access
    swipe(pass: finalEntrant.pass, for: .merchandise)
    detectBirthday(entrant: finalEntrant)
  }
  
  @IBAction func maintenanceButtonPressed(_ sender: UIButton) {
    // test maintenance access
    do {
      try swipe(finalEntrant.pass, for: .maintenance)
    } catch {
      print("Unexpected error. \(error)")
    }
    detectBirthday(entrant: finalEntrant)
  }
  
  @IBAction func createNewPassPressed(_ sender: UIButton) {
    // goes back to mainvc
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func createPassPressed(_ sender: UIButton) {
    // create current pass
    
    dismiss(animated: true, completion: nil)
  }
  
  func detectBirthday(entrant: Entrant) {
    if let dateOfBirth = entrant.dateOfBirth {
      let calendar = Calendar.current
      let today = Date()
      
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "MM/dd/yyyy"
      guard let formattedDOB = dateFormatter.date(from: dateOfBirth) else { return }
      
      let currentMonth = calendar.component(.month, from: today)
      let currentDay = calendar.component(.day, from: today)

      let dobMonth = calendar.component(.month, from: formattedDOB)
      let dobDay = calendar.component(.day, from: formattedDOB)

      if currentMonth == dobMonth && currentDay == dobDay {
        if entrant.firstName != "" {
          guard let first = entrant.firstName else { return }
          let alertController = UIAlertController(title: "Happy Birthday, \(first)!", message: nil, preferredStyle: .alert)
          let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
          alertController.addAction(alertAction)
          present(alertController, animated: true, completion: nil)
        } else {
          let alertController = UIAlertController(title: "Happy Birthday!", message: nil, preferredStyle: .alert)
          let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
          alertController.addAction(alertAction)
          present(alertController, animated: true, completion: nil)
        }
      }
    }
  }
  
}
