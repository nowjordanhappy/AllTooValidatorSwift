//
//  CompositeValidator.swift
//  AllTooValidatorSwift
//
//  Created by Jordan Rojas Alarcon on 27/09/23.
//

import Foundation

public class CompositeValidator<T, R>: AllTooValidator {
    private let validators: [AnyAllTooValidator<T, R>]
    
    init(validators: [AnyAllTooValidator<T, R>]) {
        self.validators = validators
    }
    
    public func validate(data: T) -> AllTooValidatorResult<R> {
        for validator in validators {
            let result = validator.validate(data: data)
            if case .failure(_) = result {
                return result
            }
        }
        return .success(data as! R)
    }
}
