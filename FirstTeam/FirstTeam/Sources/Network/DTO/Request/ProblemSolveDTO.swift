//
//  ProblemSolveDTO.swift
//  FirstTeam
//
//  Created by 조성민 on 11/24/24.
//

struct ProblemSolveDTO: Encodable {
    let itemID: Int

    enum CodingKeys: String, CodingKey {
        case itemID = "itemId"
    }
}
