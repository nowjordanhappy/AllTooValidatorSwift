//
//  EmptyValidator.swift
//  AllTooValidatorSwift
//
//  Created by Jordan Rojas Alarcon on 27/09/23.
//

import Foundation

public class MinLengthValidator: AllTooValidator {
    private let minLength: Int
    private let error: Error

    public init(minLength: Int, error: Error) {
        self.minLength = minLength
        self.error = error
    }

    public func validate(data: String) -> AllTooValidatorResult<String> {
        if data.count >= minLength {
            return .success(data)
        } else {
            return .failure(error: error)
        }
    }
}
