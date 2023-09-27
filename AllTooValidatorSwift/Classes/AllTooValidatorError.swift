//
//  AllTooValidatorError.swift
//  AllTooValidatorSwift
//
//  Created by Jordan Rojas Alarcon on 27/09/23.
//

import Foundation

public enum AllTooValidatorError: Error {
    case validationFailed(String)
    case validationFailedAndDescription(String, String?)
}

extension AllTooValidatorError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .validationFailed(let errorMessage):
            return NSLocalizedString(errorMessage, comment: errorMessage)
        case .validationFailedAndDescription(let errorMessage, let errorDescription):
            return NSLocalizedString(errorMessage, comment: errorDescription ?? errorMessage)
        }
    }
}