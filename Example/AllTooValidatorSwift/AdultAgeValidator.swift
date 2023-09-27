//
//  AdultAgeValidator.swift
//  AllTooValidatorSwift_Example
//
//  Created by Jordan Rojas Alarcon on 27/09/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import AllTooValidator

class AdultAgeValidator: AllTooValidator {
    func validate(data: String) -> AllTooValidatorResult<Int> {
        let emptyValidator = EmptyValidator(error: AllTooValidatorError.validationFailed("Enter your age"))
        let emptyValidationResult = emptyValidator.validate(data: data)
        
        if case let .failure(error) = emptyValidationResult {
            return .failure(error: error)
        }
        
        if let age = Int(data) {
            let minValueValidator = MinValueValidator(minValue: 18, error: AllTooValidatorError.validationFailed("Your age should be equal or greather than 18"))
            return minValueValidator.validate(data: age)
        } else {
            return .failure(error: AllTooValidatorError.validationFailed("Invalid age, enter again"))
        }
    }
}
