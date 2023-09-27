//
//  MinValueValidator.swift
//  AllTooValidatorSwift
//
//  Created by Jordan Rojas Alarcon on 27/09/23.
//

import Foundation

public class MinValueValidator<T: Comparable>: AllTooValidator {
    private let minValue: T
    private let error: Error

    public init(minValue: T, error: Error) {
        self.minValue = minValue
        self.error = error
    }

    public func validate(data: T) -> AllTooValidatorResult<T> {
        if data >= minValue {
            return .success(data)
        } else {
            return .failure(error: self.error)
        }
    }
}
