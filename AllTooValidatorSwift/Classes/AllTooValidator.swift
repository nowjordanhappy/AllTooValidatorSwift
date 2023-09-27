//
//  AllTooValidator.swift
//  AllTooValidatorSwift
//
//  Created by Jordan Rojas Alarcon on 27/09/23.
//

import Foundation

public protocol AllTooValidator<T, R> {
    associatedtype T
    associatedtype R

    func validate(data: T) -> AllTooValidatorResult<R>
}
