//
//  ResponseExampleDTO.swift
//  FirstTeam
//
//  Created by 조성민 on 11/23/24.
//

struct ResponseExampleDTO: Decodable {
    
    let result: ResponseExampleDataDTO
    
}

struct ResponseExampleDataDTO: Decodable {
    
    let data: String
    
}
