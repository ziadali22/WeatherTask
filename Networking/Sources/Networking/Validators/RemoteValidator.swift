//
//  File.swift
//  
//
//  Created by ziad on 22/03/2023.
//

import Foundation

/// FakeStore.com Response Validator
///
struct RemoteErrorValidator {
    
    /// Returns the DotcomError contained in a given Data Instance (if any).
    ///
    static func error(from response: Data) -> Error? {
        return try? JSONDecoder().decode(RemoteError.self, from: response)
    }
}
