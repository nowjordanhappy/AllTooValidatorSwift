//
//  AnyAllTooValidator.swift
//  AllTooValidatorSwift
//
//  Created by Jordan Rojas Alarcon on 27/09/23.
//

import Foundation

public struct AnyAllTooValidator<T, R> {
    private let _validate: (T) -> AllTooValidatorResult<R>
    
    public init<V: AllTooValidator>(_ validator: V) where V.T == T, V.R == R {
        _validate = validator.validate
    }
    
    public func validate(data: T) -> AllTooValidatorResult<R> {
        return _validate(data)
    }
}
