//
//  GetProblemDTO.swift
//  FirstTeam
//
//  Created by 조성민 on 11/24/24.
//

struct GetProblemDTO: Decodable {
    let isEmpty: Bool
    let problem: ProblemDTO?
}
