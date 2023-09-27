//
//  EqualsLengthValidator.swift
//  AllTooValidatorSwift
//
//  Created by Jordan Rojas Alarcon on 27/09/23.
//

import Foundation

public class EqualsLengthValidator: AllTooValidator {
    private let expectedLength: Int
    private let error: Error

    public init(expectedLength: Int, error: Error) {
        self.expectedLength = expectedLength
        self.error = error
    }

    public func validate(data: String) -> AllTooValidatorResult<String> {
        if data.count == expectedLength {
            return .success(data)
        } else {
            return .failure(error: error)
        }
    }
}
