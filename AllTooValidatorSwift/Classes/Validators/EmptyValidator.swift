//
//  EmptyValidator.swift
//  AllTooValidatorSwift
//
//  Created by Jordan Rojas Alarcon on 27/09/23.
//

import Foundation

public class EmptyValidator: AllTooValidator {
    private let error: Error

    public init(error: Error) {
        self.error = error
    }

    public func validate(data: String) -> AllTooValidatorResult<String> {
        let minLengthValidator = MinLengthValidator(minLength: 1, error: error)
        return minLengthValidator.validate(data: data)
    }
}
