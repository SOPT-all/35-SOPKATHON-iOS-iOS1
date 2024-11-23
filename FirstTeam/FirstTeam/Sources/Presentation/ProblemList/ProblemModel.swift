//
//  ProblemModel.swift
//  FirstTeam
//
//  Created by 예삐 on 11/24/24.
//

import Foundation

struct ProblemModel {
    let title: String
    let items: [ProblemContent]
    let startDate: String
    let endDate: String
}

struct ProblemContent {
    let content: String
    let isSelected: Bool
}

extension ProblemModel {
    static let mockProblemList: [ProblemModel] = [
        ProblemModel(
            title: "불닭먹을까말까골라주삼",
            items: [
                ProblemContent(
                    content: "먹어라",
                    isSelected: true
                ),
                ProblemContent(
                    content: "말아라",
                    isSelected: false
                )
            ],
            startDate: "2024.11.24",
            endDate: "2024.11.27"
        ),
        ProblemModel(
            title: "불닭먹을까말까골라주삼",
            items: [
                ProblemContent(
                    content: "먹어라",
                    isSelected: true
                ),
                ProblemContent(
                    content: "말아라",
                    isSelected: false
                )
            ],
            startDate: "2024.11.24",
            endDate: "2024.11.27"
        ),
        ProblemModel(
            title: "불닭먹을까말까골라주삼",
            items: [
                ProblemContent(
                    content: "먹어라",
                    isSelected: true
                ),
                ProblemContent(
                    content: "말아라",
                    isSelected: false
                )
            ],
            startDate: "2024.11.24",
            endDate: "2024.11.27"
        ),
        ProblemModel(
            title: "불닭먹을까말까골라주삼",
            items: [
                ProblemContent(
                    content: "먹어라",
                    isSelected: true
                ),
                ProblemContent(
                    content: "말아라",
                    isSelected: false
                )
            ],
            startDate: "2024.11.24",
            endDate: "2024.11.27"
        ),
        ProblemModel(
            title: "불닭먹을까말까골라주삼",
            items: [
                ProblemContent(
                    content: "먹어라",
                    isSelected: true
                ),
                ProblemContent(
                    content: "말아라",
                    isSelected: false
                )
            ],
            startDate: "2024.11.24",
            endDate: "2024.11.27"
        ),
        ProblemModel(
            title: "불닭먹을까말까골라주삼",
            items: [
                ProblemContent(
                    content: "먹어라",
                    isSelected: true
                ),
                ProblemContent(
                    content: "말아라",
                    isSelected: false
                )
            ],
            startDate: "2024.11.24",
            endDate: "2024.11.27"
        )
    ]
}
