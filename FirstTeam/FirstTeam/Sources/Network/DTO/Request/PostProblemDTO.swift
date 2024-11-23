//
//  PostProblemDTO.swift
//  FirstTeam
//
//  Created by 조성민 on 11/24/24.
//

struct PostProblemDTO: Encodable {
    let title: String
    let items: [RequestItemDTO]
}

struct RequestItemDTO: Encodable {
    let content: String
}
