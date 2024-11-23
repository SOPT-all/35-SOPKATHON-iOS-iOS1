//
//  HomeModel.swift
//  FirstTeam
//
//  Created by 조성민 on 11/24/24.
//

import Foundation

struct HomeModel {
    let isProblemExist: Bool
    let problem: Problem?
}

struct Problem {
    let id: Int
    let problem: String
    let startDate: Date
    let firstChoice: String
    let secondChoice: String
}
