//
//  MainVCExtension.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Arwin Oblea on 8/21/19.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import UIKit

extension MainViewController {
  // MARK: - Methods
  func setupView() {
    view.backgroundColor = UIColor.Theme.gray
    
    arrayOfSubButtons = [sub1Button, sub2Button, sub3Button, sub4Button, sub5Button]
    let arrayOfLabels = [dateOfBirthLabel, ssnLabel, projectLabel, firstNameLabel, lastNameLabel, companyLabel, streetLabel, cityLabel, stateLabel, zipCodeLabel]
    let arrayOfTextFields = [dateOfBirthTextField, ssnTextField, projectTextField, firstNameTextField, lastNameTextField, companyTextField, streetTextField, cityTextField, stateTextField, zipCodeTextField]
    
    for label in arrayOfLabels.enumerated() {
      label.element?.isEnabled = false
    }
    for text in arrayOfTextFields.enumerated() {
      text.element?.isEnabled = false
      text.element?.backgroundColor = UIColor.Theme.gray
    }
    
    generatePassButton.isEnabled = false
    generatePassButton.setTitleColor(UIColor.Theme.gray, for: .disabled)
    populateDataButton.isEnabled = false
    populateDataButton.setTitleColor(UIColor.Theme.gray, for: .disabled)
    
    // To keep secondary view background color on screen
    hideButtons()
  }
  
  // setup secondary menu
  func showSecondaryMenu(sender: UIButton) {
    switch sender {
    case guestButton:
      subView.isHidden = true
      
      showButtons()
      
      sub1Button.setTitle("Child", for: .normal)
      sub2Button.setTitle("Classic", for: .normal)
      sub3Button.setTitle("Senior", for: .normal)
      sub4Button.setTitle("VIP", for: .normal)
      sub5Button.setTitle("Season Pass", for: .normal)
    case employeeButton:
      subView.isHidden = true
      
      sub1Button.isHidden = false
      sub2Button.isHidden = false
      sub3Button.isHidden = false
      sub4Button.isHidden = true
      sub5Button.isHidden = true
      
      sub1Button.setTitle("Food Services", for: .normal)
      sub2Button.setTitle("Ride Services", for: .normal)
      sub3Button.setTitle("Maintenance", for: .normal)
    case managerButton:
      hideButtons()
    case contractorButton:
      hideButtons()
    case vendorButton:
      hideButtons()
    default:
      return
    }
  }
  
  // Button Methods
  func hideButtons() {
    subView.isHidden = false
    
    for button in arrayOfSubButtons.enumerated() {
      button.element.isHidden = true
      button.element.setTitle("", for: .normal)
    }
  }
  
  func showButtons() {
    subView.isHidden = true
    
    for button in arrayOfSubButtons.enumerated() {
      button.element.isHidden = false
    }
  }
  
  func activateButtons() {
    generatePassButton.isEnabled = true
    generatePassButton.setTitleColor(UIColor.Theme.white, for: .normal)
    
    populateDataButton.isEnabled = true
    populateDataButton.setTitleColor(UIColor.Theme.green, for: .normal)
  }
  
  // TextField Methods
  func activeTextField(textField: [UITextField]) {
    for text in textField.enumerated() {
      text.element.isEnabled = true
      text.element.backgroundColor = UIColor.Theme.white
      text.element.autocorrectionType = .no
    }
  }
  
  func inactiveTextField(textField: [UITextField]) {
    for text in textField.enumerated() {
      text.element.isEnabled = false
      text.element.backgroundColor = UIColor.Theme.gray
    }
  }
  
  func resetTextFields() {
    let textFieldArray = [dateOfBirthTextField, ssnTextField, projectTextField, firstNameTextField, lastNameTextField, companyTextField, streetTextField, cityTextField, stateTextField, zipCodeTextField]
    
    for text in textFieldArray.enumerated() {
      text.element?.isEnabled = true
      text.element?.backgroundColor = UIColor.Theme.gray
      text.element?.text = ""
    }
  }
  
  func generateEntrantPass(from: String) {
    dateOfBirth = dateOfBirthTextField.text!
    ssn = ssnTextField.text!
    project = projectTextField.text!
    firstName = firstNameTextField.text!
    lastName = lastNameTextField.text!
    company = companyTextField.text!
    street = streetTextField.text!
    city = cityTextField.text!
    state = stateTextField.text!
    zipCode = zipCodeTextField.text!
    
    switch passName {
    case "Manager":
      do {
        entrant = try Manager(firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode)
      } catch ErrorType.missingfirstname {
        showAlert(title: "Missing First Name", message: "Please enter your first name")
      } catch ErrorType.missinglastname {
        showAlert(title: "Missing Last Name", message: "Please enter your last name")
      } catch ErrorType.missingstreetaddress {
        showAlert(title: "Missing Street Address Info", message: "Please enter your street address")
      } catch ErrorType.missingcity {
        showAlert(title: "Missing City Info", message: "Please enter your city")
      } catch ErrorType.missingstate {
        showAlert(title: "Missing State Info", message: "Please enter your state")
      } catch ErrorType.missingzipcode {
        showAlert(title: "Missing Zip Code Info", message: "Please enter your zip code")
      } catch ErrorType.zipcodecount {
        showAlert(title: "Zip Code Format Error", message: "Must have 5 numbers Eg. 12345")
      } catch {
        print("Unexpected error. \(error)")
      }
    case "Contractor":
      do {
        entrant = try Contract(projectNumber: project, firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode)
      } catch ErrorType.missingprojectnumber {
        showAlert(title: "Missing Project Number Info", message: "Please enter your project number")
      } catch ErrorType.incorrectprojectnumber {
        showAlert(title: "Incorrect Project Number", message: "Please provide the correct number")
      } catch ErrorType.missingfirstname {
        showAlert(title: "Missing First Name", message: "Please enter your first name")
      } catch ErrorType.missinglastname {
        showAlert(title: "Missing Last Name", message: "Please enter your last name")
      } catch ErrorType.missingstreetaddress {
        showAlert(title: "Missing Street Address Info", message: "Please enter your street address")
      } catch ErrorType.missingcity {
        showAlert(title: "Missing City Info", message: "Please enter your city")
      } catch ErrorType.missingstate {
        showAlert(title: "Missing State Info", message: "Please enter your state")
      } catch ErrorType.missingzipcode {
        showAlert(title: "Missing Zip Code Info", message: "Please enter your zip code")
      } catch ErrorType.zipcodecount {
        showAlert(title: "Zip Code Format Error", message: "Must have 5 numbers Eg. 12345")
      } catch {
        print("Unexpected error. \(error)")
      }
    case "Vendor":
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "MM/dd/yyyy"
      let today = Date()
      let todayString = dateFormatter.string(from: today)
      
      do {
        entrant = try Vendor(firstName: firstName, lastName: lastName, companyName: company, dateOfBirth: dateOfBirth, dateOfVisit: todayString)
      } catch ErrorType.missingfirstname {
        showAlert(title: "Missing First Name", message: "Please enter your first name")
      } catch ErrorType.missinglastname {
        showAlert(title: "Missing Last Name", message: "Please enter your last name")
      } catch ErrorType.missingcompanyname {
        showAlert(title: "Missing Company Name", message: "Please enter your company name")
      } catch ErrorType.incorrectcompanyname {
        showAlert(title: "Unrecognized Company", message: "Please enter a correct company name")
      } catch ErrorType.missingdateofbirth {
        showAlert(title: "Missing Date Of Birth", message: "Please enter your date of birth")
      } catch ErrorType.incorrectformat {
        showAlert(title: "Incorrect Format", message: "Please enter the date as MM/DD/YYYY")
      } catch {
        print("Unexpected error. \(error)")
      }
    case "Free Child":
      do {
        entrant = try FreeChild(dateOfBirth: dateOfBirth, firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode)
      } catch ErrorType.missingdateofbirth {
        showAlert(title: "Missing Date Of Birth", message: "Please enter your date of birth")
      } catch ErrorType.incorrectformat {
        showAlert(title: "Incorrect Format", message: "Please enter the date as MM/DD/YYYY")
      } catch ErrorType.agerestriction {
        showAlert(title: "Age Restriction", message: "Must be under 5 years old to recieve this pass.")
      } catch {
        print("Unexpected error. \(error)")
      }
    case "Food Services":
      do {
        entrant = try FoodServices(firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode)
      } catch ErrorType.missingfirstname {
        showAlert(title: "Missing First Name", message: "Please enter your first name")
      } catch ErrorType.missinglastname {
        showAlert(title: "Missing Last Name", message: "Please enter your last name")
      } catch ErrorType.missingstreetaddress {
        showAlert(title: "Missing Street Address Info", message: "Please enter your street address")
      } catch ErrorType.missingcity {
        showAlert(title: "Missing City Info", message: "Please enter your city")
      } catch ErrorType.missingstate {
        showAlert(title: "Missing State Info", message: "Please enter your state")
      } catch ErrorType.missingzipcode {
        showAlert(title: "Missing Zip Code Info", message: "Please enter your zip code")
      } catch ErrorType.zipcodecount {
        showAlert(title: "Zip Code Format Error", message: "Must have 5 numbers Eg. 12345")
      } catch {
        print("Unexpected error. \(error)")
      }
    case "Classic Guest":
      do {
        entrant = try Classic(firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode)
      } catch {
        print("Unexpected error. \(error)")
      }
    case "Ride Services":
      do {
        entrant = try RideServices(firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode)
      } catch ErrorType.missingfirstname {
        showAlert(title: "Missing First Name", message: "Please enter your first name")
      } catch ErrorType.missinglastname {
        showAlert(title: "Missing Last Name", message: "Please enter your last name")
      } catch ErrorType.missingstreetaddress {
        showAlert(title: "Missing Street Address Info", message: "Please enter your street address")
      } catch ErrorType.missingcity {
        showAlert(title: "Missing City Info", message: "Please enter your city")
      } catch ErrorType.missingstate {
        showAlert(title: "Missing State Info", message: "Please enter your state")
      } catch ErrorType.missingzipcode {
        showAlert(title: "Missing Zip Code Info", message: "Please enter your zip code")
      } catch ErrorType.zipcodecount {
        showAlert(title: "Zip Code Format Error", message: "Must have 5 numbers Eg. 12345")
      } catch {
        print("Unexpected error. \(error)")
      }
    case "Senior Guest":
      do {
        entrant = try Senior(dateOfBirth: dateOfBirth, firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode)
      } catch ErrorType.missingdateofbirth {
        showAlert(title: "Missing Date Of Birth", message: "Please enter your date of birth")
      } catch ErrorType.missingfirstname {
        showAlert(title: "Missing First Name", message: "Please enter your first name")
      } catch ErrorType.missinglastname {
        showAlert(title: "Missing Last Name", message: "Please enter your last name")
      } catch ErrorType.incorrectformat {
        showAlert(title: "Incorrect Format", message: "Please enter the date as MM/DD/YYYY")
      } catch ErrorType.agerestriction {
        showAlert(title: "Age Restriction", message: "Must be over 60 years old to recieve this pass.")
      } catch {
        print("Unexpected error. \(error)")
      }
    case "Maintenance":
      do {
        entrant = try Maintenance(firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode)
      } catch ErrorType.missingfirstname {
        showAlert(title: "Missing First Name", message: "Please enter your first name")
      } catch ErrorType.missinglastname {
        showAlert(title: "Missing Last Name", message: "Please enter your last name")
      } catch ErrorType.missingstreetaddress {
        showAlert(title: "Missing Street Address Info", message: "Please enter your street address")
      } catch ErrorType.missingcity {
        showAlert(title: "Missing City Info", message: "Please enter your city")
      } catch ErrorType.missingstate {
        showAlert(title: "Missing State Info", message: "Please enter your state")
      } catch ErrorType.missingzipcode {
        showAlert(title: "Missing Zip Code Info", message: "Please enter your zip code")
      } catch ErrorType.zipcodecount {
        showAlert(title: "Zip Code Format Error", message: "Must have 5 numbers Eg. 12345")
      } catch {
        print("Unexpected error. \(error)")
      }
    case "VIP":
      do {
        entrant = try VIP(firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode)
      } catch {
        print("Unexpected error. \(error)")
      }
    case "Season":
      do {
        entrant = try Season(firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode)
      } catch ErrorType.missingfirstname {
        showAlert(title: "Missing First Name", message: "Please enter your first name")
      } catch ErrorType.missinglastname {
        showAlert(title: "Missing Last Name", message: "Please enter your last name")
      } catch ErrorType.missingstreetaddress {
        showAlert(title: "Missing Street Address Info", message: "Please enter your street address")
      } catch ErrorType.missingcity {
        showAlert(title: "Missing City Info", message: "Please enter your city")
      } catch ErrorType.missingstate {
        showAlert(title: "Missing State Info", message: "Please enter your state")
      } catch ErrorType.missingzipcode {
        showAlert(title: "Missing Zip Code Info", message: "Please enter your zip code")
      } catch ErrorType.zipcodecount {
        showAlert(title: "Zip Code Format Error", message: "Must have 5 numbers Eg. 12345")
      } catch {
        print("Unexpected error. \(error)")
      }
    default:
      return
    }
  }
  
  // Alerts the user on what happened
  func showAlert(title: String, message: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(alertAction)
    
    present(alertController, animated: true, completion: nil)
  }
  
  func populateData(for passName: String) {
    let firstNames = ["George", "Billy", "Robert", "Joe", "Jill"]
    let lastNames = ["Max", "Tremp", "Daily"]
    let streetNames = ["1234 Fake Street"]
    let cityNames = ["New York"]
    let stateNames = ["NY"]
    let zipCodes = ["12345", "54321", "10120", "99999", "20202"]
    let companyNames = ["Acme", "Orkin", "Fedex", "NW Electrical"]
    let birthDates = ["01/01/2018", "12/14/1900", "01/23/45", "06/20/1999"]
    let projectNumbers = ["1001", "1002", "1003", "2001", "2002"]
    
    switch passName {
    case "Manager":
      firstNameTextField.text = firstNames.randomElement()
      lastNameTextField.text = lastNames.randomElement()
      streetTextField.text = streetNames.randomElement()
      cityTextField.text = cityNames.randomElement()
      stateTextField.text = stateNames.randomElement()
      zipCodeTextField.text = zipCodes.randomElement()
    case "Contractor":
      projectTextField.text = projectNumbers.randomElement()
      firstNameTextField.text = firstNames.randomElement()
      lastNameTextField.text = lastNames.randomElement()
      streetTextField.text = streetNames.randomElement()
      cityTextField.text = cityNames.randomElement()
      stateTextField.text = stateNames.randomElement()
      zipCodeTextField.text = zipCodes.randomElement()
    case "Vendor":
      firstNameTextField.text = firstNames.randomElement()
      lastNameTextField.text = lastNames.randomElement()
      companyTextField.text = companyNames.randomElement()
      dateOfBirthTextField.text = birthDates.randomElement()
    case "Free Child":
      dateOfBirthTextField.text = "01/11/2018" // in order to obtain free child pass
      firstNameTextField.text = firstNames.randomElement()
      lastNameTextField.text = lastNames.randomElement()
      streetTextField.text = streetNames.randomElement()
      cityTextField.text = cityNames.randomElement()
      stateTextField.text = stateNames.randomElement()
      zipCodeTextField.text = zipCodes.randomElement()
    case "Food Services":
      firstNameTextField.text = firstNames.randomElement()
      lastNameTextField.text = lastNames.randomElement()
      streetTextField.text = streetNames.randomElement()
      cityTextField.text = cityNames.randomElement()
      stateTextField.text = stateNames.randomElement()
      zipCodeTextField.text = zipCodes.randomElement()
    case "Classic Guest":
      firstNameTextField.text = firstNames.randomElement()
      lastNameTextField.text = lastNames.randomElement()
      streetTextField.text = streetNames.randomElement()
      cityTextField.text = cityNames.randomElement()
      stateTextField.text = stateNames.randomElement()
      zipCodeTextField.text = zipCodes.randomElement()
    case "Ride Services":
      firstNameTextField.text = firstNames.randomElement()
      lastNameTextField.text = lastNames.randomElement()
      streetTextField.text = streetNames.randomElement()
      cityTextField.text = cityNames.randomElement()
      stateTextField.text = stateNames.randomElement()
      zipCodeTextField.text = zipCodes.randomElement()
    case "Senior Guest":
      dateOfBirthTextField.text = "12/20/1900" // in order to fulfill senior pass requirements
      firstNameTextField.text = firstNames.randomElement()
      lastNameTextField.text = lastNames.randomElement()
      streetTextField.text = streetNames.randomElement()
      cityTextField.text = cityNames.randomElement()
      stateTextField.text = stateNames.randomElement()
      zipCodeTextField.text = zipCodes.randomElement()
    case "Maintenance":
      firstNameTextField.text = firstNames.randomElement()
      lastNameTextField.text = lastNames.randomElement()
      streetTextField.text = streetNames.randomElement()
      cityTextField.text = cityNames.randomElement()
      stateTextField.text = stateNames.randomElement()
      zipCodeTextField.text = zipCodes.randomElement()
    case "VIP":
      firstNameTextField.text = firstNames.randomElement()
      lastNameTextField.text = lastNames.randomElement()
      streetTextField.text = streetNames.randomElement()
      cityTextField.text = cityNames.randomElement()
      stateTextField.text = stateNames.randomElement()
      zipCodeTextField.text = zipCodes.randomElement()
    case "Season":
      firstNameTextField.text = firstNames.randomElement()
      lastNameTextField.text = lastNames.randomElement()
      streetTextField.text = streetNames.randomElement()
      cityTextField.text = cityNames.randomElement()
      stateTextField.text = stateNames.randomElement()
      zipCodeTextField.text = zipCodes.randomElement()
    default:
      print("unexpected error.")
    }
  }
}
