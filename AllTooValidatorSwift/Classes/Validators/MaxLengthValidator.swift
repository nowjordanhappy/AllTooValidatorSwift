//
//  MaxLengthValidator.swift
//  AllTooValidatorSwift
//
//  Created by Jordan Rojas Alarcon on 27/09/23.
//

import Foundation

public class MaxLengthValidator: AllTooValidator {
    private let maxLength: Int
    private let error: Error

    public init(maxLength: Int, error: Error) {
        self.maxLength = maxLength
        self.error = error
    }

    public func validate(data: String) -> AllTooValidatorResult<String> {
        if data.count <= maxLength {
            return .success(data)
        } else {
            return .failure(error: error)
        }
    }
}
