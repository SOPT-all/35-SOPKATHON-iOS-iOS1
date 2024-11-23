//
//  ProblemDTO.swift
//  FirstTeam
//
//  Created by 조성민 on 11/24/24.
//

struct ProblemDTO: Decodable {
    let id: Int
    let title: String
    let items: [ResponseItemDTO]
    let startDate, endDate: String
}

struct ResponseItemDTO: Decodable {
    let id: Int
    let content: String
    let isSelected: Bool
}
