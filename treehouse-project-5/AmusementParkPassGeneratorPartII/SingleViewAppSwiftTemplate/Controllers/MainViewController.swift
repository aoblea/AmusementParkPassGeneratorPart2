//
//  MainViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Arwin Oblea on 8/5/19.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
  // UIButtons
  @IBOutlet weak var guestButton: UIButton!
  @IBOutlet weak var employeeButton: UIButton!
  @IBOutlet weak var managerButton: UIButton!
  @IBOutlet weak var contractorButton: UIButton!
  @IBOutlet weak var vendorButton: UIButton!
  
  @IBOutlet weak var subView: UIView!
  @IBOutlet weak var sub1Button: UIButton!
  @IBOutlet weak var sub2Button: UIButton!
  @IBOutlet weak var sub3Button: UIButton!
  @IBOutlet weak var sub4Button: UIButton!
  @IBOutlet weak var sub5Button: UIButton!
  
  @IBOutlet weak var generatePassButton: UIButton!
  @IBOutlet weak var populateDataButton: UIButton!
  
  // UITextFields
  @IBOutlet weak var dateOfBirthTextField: UITextField!
  @IBOutlet weak var ssnTextField: UITextField!
  @IBOutlet weak var projectTextField: UITextField!
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var companyTextField: UITextField!
  @IBOutlet weak var streetTextField: UITextField!
  @IBOutlet weak var cityTextField: UITextField!
  @IBOutlet weak var stateTextField: UITextField!
  @IBOutlet weak var zipCodeTextField: UITextField!
  
  // UILabels
  @IBOutlet weak var dateOfBirthLabel: UILabel!
  @IBOutlet weak var ssnLabel: UILabel!
  @IBOutlet weak var projectLabel: UILabel!
  @IBOutlet weak var firstNameLabel: UILabel!
  @IBOutlet weak var lastNameLabel: UILabel!
  @IBOutlet weak var companyLabel: UILabel!
  @IBOutlet weak var streetLabel: UILabel!
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var stateLabel: UILabel!
  @IBOutlet weak var zipCodeLabel: UILabel!
  
  // MARK: - Properties
  var arrayOfSubButtons: [UIButton] = []
  var arrayOfTextFields: [UITextField] = []
  
  var guestActivated: Bool = false
  var employeeActivated: Bool = false
  var managerActivated: Bool = false
  var contractorActivated: Bool = false
  var vendorActivated: Bool = false
  
  var passName = ""
  var entrant: Entrant?
  var dateOfBirth = ""
  var ssn = ""
  var project = ""
  var firstName = ""
  var lastName = ""
  var company = ""
  var street = ""
  var city = ""
  var state = ""
  var zipCode = ""

  // MARK: - ViewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    arrayOfTextFields = [dateOfBirthTextField, ssnTextField, projectTextField, firstNameTextField, lastNameTextField, companyTextField, streetTextField, cityTextField, stateTextField, zipCodeTextField]
    setupView()
  }
  
  // Methods
  @IBAction func mainMenuButtonPressed(_ sender: UIButton) {
    switch sender {
    case guestButton:
      setupView()
      resetTextFields()
      showSecondaryMenu(sender: sender)
      guestActivated = true
      employeeActivated = false
      managerActivated = false
      contractorActivated = false
      vendorActivated = false
    case employeeButton:
      setupView()
      resetTextFields()
      showSecondaryMenu(sender: sender)
      guestActivated = false
      employeeActivated = true
      managerActivated = false
      contractorActivated = false
      vendorActivated = false
    case managerButton:
      setupView()
      showSecondaryMenu(sender: sender)
      guestActivated = false
      employeeActivated = false
      managerActivated = true
      contractorActivated = false
      vendorActivated = false
      
      if managerActivated == true {
        resetTextFields()
      
        passName = "Manager"
        
        activeTextField(textField: [firstNameTextField, lastNameTextField, streetTextField, cityTextField, stateTextField, zipCodeTextField])
        inactiveTextField(textField: [dateOfBirthTextField, ssnTextField, projectTextField, companyTextField])
        
        activateButtons()
      }
    case contractorButton:
      setupView()
      showSecondaryMenu(sender: sender)
      guestActivated = false
      employeeActivated = false
      managerActivated = false
      contractorActivated = true
      vendorActivated = false
      
      if contractorActivated == true {
        resetTextFields()
        
        passName = "Contractor"
        
        activeTextField(textField: [projectTextField, firstNameTextField , lastNameTextField, streetTextField, cityTextField, stateTextField, zipCodeTextField])
        inactiveTextField(textField: [dateOfBirthTextField, companyTextField, ssnTextField])
        
        activateButtons()
      }
    case vendorButton:
      setupView()
      showSecondaryMenu(sender: sender)
      guestActivated = false
      employeeActivated = false
      managerActivated = false
      contractorActivated = false
      vendorActivated = true
      
      if vendorActivated == true {
        resetTextFields()
        
        passName = "Vendor"
        
        activeTextField(textField: [dateOfBirthTextField, firstNameTextField, lastNameTextField, companyTextField])
        inactiveTextField(textField: [ssnTextField, projectTextField, streetTextField, cityTextField, stateTextField, zipCodeTextField])
        
        activateButtons()
      }
    default:
      return
    }
  }
  
  @IBAction func secondaryMenuButtonPressed(_ sender: UIButton) {
    switch sender {
    case sub1Button:
      if guestActivated == true {
        resetTextFields()
        
        passName = "Free Child"
        
        activeTextField(textField: [dateOfBirthTextField, firstNameTextField, lastNameTextField, streetTextField, cityTextField, stateTextField, zipCodeTextField])
        inactiveTextField(textField: [ssnTextField, projectTextField, companyTextField])
        
        activateButtons()
      }
      if employeeActivated == true {
        resetTextFields()
        
        passName = "Food Services"
        
        activeTextField(textField: [firstNameTextField, lastNameTextField, streetTextField, cityTextField, stateTextField, zipCodeTextField])
        inactiveTextField(textField: [dateOfBirthTextField, ssnTextField, projectTextField, companyTextField])
        
        activateButtons()
      }
    case sub2Button:
      if guestActivated == true {
        resetTextFields()
        
        passName = "Classic Guest"
        
        activeTextField(textField: [firstNameTextField, lastNameTextField, streetTextField, cityTextField, stateTextField, zipCodeTextField])
        inactiveTextField(textField: [dateOfBirthTextField, ssnTextField, projectTextField, companyTextField])
        
        activateButtons()
      }
      if employeeActivated == true {
        resetTextFields()
        
        passName = "Ride Services"
        
        activeTextField(textField: [firstNameTextField, lastNameTextField, streetTextField, cityTextField, stateTextField, zipCodeTextField])
        inactiveTextField(textField: [dateOfBirthTextField, ssnTextField, projectTextField, companyTextField])
        
        activateButtons()
      }
    case sub3Button:
      if guestActivated == true {
        resetTextFields()
        
        passName = "Senior Guest"
        
        activeTextField(textField: [dateOfBirthTextField, firstNameTextField, lastNameTextField, streetTextField, cityTextField, stateTextField, zipCodeTextField])
        inactiveTextField(textField: [ssnTextField, projectTextField, companyTextField])
        
        activateButtons()
      }
      if employeeActivated == true {
        resetTextFields()
        
        passName = "Maintenance"
        
        activeTextField(textField: [firstNameTextField, lastNameTextField, streetTextField, cityTextField, stateTextField, zipCodeTextField])
        inactiveTextField(textField: [dateOfBirthTextField, ssnTextField, projectTextField, companyTextField])
        
        activateButtons()
      }
    case sub4Button:
      if guestActivated == true {
        resetTextFields()
        
        passName = "VIP"
        
        activeTextField(textField: [firstNameTextField, lastNameTextField, streetTextField, cityTextField, stateTextField, zipCodeTextField])
        inactiveTextField(textField: [dateOfBirthTextField, ssnTextField, projectTextField, companyTextField])
        
        activateButtons()
      }
    case sub5Button:
      if guestActivated == true {
        resetTextFields()
        
        passName = "Season"
        
        activeTextField(textField: [firstNameTextField, lastNameTextField, streetTextField, cityTextField, stateTextField, zipCodeTextField])
        inactiveTextField(textField: [dateOfBirthTextField, ssnTextField, projectTextField, companyTextField])
        
        activateButtons()
      }
    default:
      return
    }
  }
  
  @IBAction func populateDataButtonPressed(_ sender: UIButton) {
    populateData(for: passName)
  }
  
  @IBAction func generatePassButtonPressed(_ sender: UIButton) {
    generateEntrantPass(from: passName)
    performSegue(withIdentifier: "showPassVC", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let passViewController = segue.destination as? PassViewController else { return }
    guard let unwrappedEntrant = entrant else { return }
    passViewController.finalEntrant = unwrappedEntrant
  }
}
