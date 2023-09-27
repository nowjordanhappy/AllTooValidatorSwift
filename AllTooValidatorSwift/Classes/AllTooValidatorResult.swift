//
//  AllTooValidatorResult.swift
//  AllTooValidatorSwift
//
//  Created by Jordan Rojas Alarcon on 27/09/23.
//

import Foundation

public enum AllTooValidatorResult<T> {
    case success(T)
    case failure(error: Error)
}
