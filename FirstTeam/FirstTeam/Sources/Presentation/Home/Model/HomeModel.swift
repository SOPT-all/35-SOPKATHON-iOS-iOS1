//
//  HomeModel.swift
//  FirstTeam
//
//  Created by 조성민 on 11/24/24.
//

import Foundation

struct HomeModel {
    let nickname: String
    let isProblemExist: Bool
    let problem: String?
    let startDate: Date?
}

extension HomeModel {
    static let problemExistMockData: HomeModel = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = formatter.date(from: "2024-11-23 12:30:00")
        return HomeModel(
            nickname: "닉네임1",
            isProblemExist: true,
            problem: "내 고민은 이렇다 저렇다.내 고민은 이렇다 저렇다.",
            startDate: date
        )
    }()
    static let noProblemMockData = HomeModel(
        nickname: "닉네임2",
        isProblemExist: false,
        problem: nil,
        startDate: nil
    )
}
