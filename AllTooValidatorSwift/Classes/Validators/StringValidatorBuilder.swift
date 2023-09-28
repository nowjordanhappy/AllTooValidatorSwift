//
//  StringValidatorBuilder.swift
//  AllTooValidatorSwift
//
//  Created by Jordan Rojas Alarcon on 27/09/23.
//

import Foundation

public class StringValidatorBuilder {
    private var validators = [AnyAllTooValidator<String, String>]()
    
    public init() {
    }
    
    public func build() -> CompositeValidator<String, String> {
        return CompositeValidator(validators: validators)
    }
    
    public func addValidator<V: AllTooValidator>(_ validator: V) -> StringValidatorBuilder where V.T == String, V.R == String{
        validators.append(AnyAllTooValidator(validator))
        
        return self
    }

    public func addAnyValidator(_ validatorToAdd: AnyAllTooValidator<String, String>) -> StringValidatorBuilder {
        validators.append(validatorToAdd)
        
        return self
    }
    
    public func addAnyValidators(_ validatorsToAdd: [AnyAllTooValidator<String, String>]) -> StringValidatorBuilder {
        validators.append(contentsOf: validatorsToAdd)
        
        return self
    }
}
