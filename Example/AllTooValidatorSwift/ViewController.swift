//
//  ViewController.swift
//  AllTooValidatorSwift
//
//  Created by Jordan Rojas Alarcón on 09/27/2023.
//  Copyright (c) 2023 Jordan Rojas Alarcón. All rights reserved.
//

import UIKit
import AllTooValidator

class ViewController: UIViewController {
    
    @IBOutlet weak var identificationDocumentFT: UITextField!
    @IBOutlet weak var identificationDocumentError: UILabel!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var phoneError: UILabel!
    @IBOutlet weak var yearsOldTF: UITextField!
    @IBOutlet weak var yearsOldError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func validateTap(_ sender: Any) {
        validateInputs()
    }
    
    private func validateInputs(){
        //***** Using Validator Only ******
        // Validate identification number (8 characters)
        let identificationNumber = identificationDocumentFT.text ?? ""
        let identificationNumberValidator = EqualsLengthValidator(expectedLength: 8, error: AllTooValidatorError.validationFailed("Identification number should be 8 characters"))
        let identificationNumberResult = identificationNumberValidator.validate(data: identificationNumber)
        
        switch identificationNumberResult {
        case .success(let validatedData):
            print("Validation passed. Validated data: \(validatedData)")
            identificationDocumentError.isHidden = true
        case .failure(let error):
            print("An unknown error occurred: \(error.localizedDescription)")
            identificationDocumentError.isHidden = false
            identificationDocumentError.text = error.localizedDescription
        }
        
        // Validate phone number
        // 9-11 characters
        let phone = phoneTF.text ?? ""
        // Using a builder
        let phoneValidator = StringValidatorBuilder()
            .addValidator(EmptyValidator(error: AllTooValidatorError.validationFailed("Enter your phone")))
            .addValidator(MinLengthValidator(minLength: 9, error: AllTooValidatorError.validationFailed("Phone should be 9 to 11 characters")))
            .addValidator(MaxLengthValidator(maxLength: 11, error: AllTooValidatorError.validationFailed("Phone should be 9 to 11 characters")))
            .build()
        let phoneResult = phoneValidator.validate(data: phone)
        
        switch phoneResult {
        case .success(let validatedData):
            print("Validation passed. Validated data: \(validatedData)")
            phoneError.isHidden = true
        case .failure(let error):
            print("An unknown error occurred: \(error.localizedDescription)")
            phoneError.isHidden = false
            phoneError.text = error.localizedDescription
        }
        
        //***** using custom Validator ******
        //years old
        //should be >= 18
        let age = yearsOldTF.text ?? ""
        let ageValidator = AdultAgeValidator()
        let ageResult = ageValidator.validate(data: age)

        switch ageResult {
        case .success(let validatedData):
            print("Validation passed. Validated data as Int: \(validatedData)")
            yearsOldError.isHidden = true
        case .failure(let error):
            print("An unknown error occurred: \(error.localizedDescription)")
            yearsOldError.isHidden = false
            yearsOldError.text = error.localizedDescription
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

