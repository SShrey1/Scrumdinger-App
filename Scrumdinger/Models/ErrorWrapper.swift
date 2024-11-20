//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by user@59 on 18/10/24.
//

import Foundation

struct ErrorWrapper : Identifiable{
    let id : UUID
    let error : Error
    let guidance : String
    
    init(id: UUID = UUID(), error: Error, guidance: String) {
            self.id = id
            self.error = error
            self.guidance = guidance
        }
}
