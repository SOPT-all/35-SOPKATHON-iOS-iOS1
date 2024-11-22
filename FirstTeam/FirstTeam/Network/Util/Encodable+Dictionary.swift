//
//  Encodable+Dictionary.swift
//  FirstTeam
//
//  Created by 조성민 on 11/23/24.
//

import Foundation

extension Encodable {
    
    func asDictionary() -> [String: Any] {
        guard
            let data = try? JSONEncoder().encode(self),
            let dictionary = try? JSONSerialization.jsonObject(
                with: data,
                options: .allowFragments
            ) as? [String: Any] else {
            return [:]
        }
        
        return dictionary
    }
    
}
