//
//  DefaultRouter.swift
//  FirstTeam
//
//  Created by 조성민 on 11/23/24.
//

import Alamofire
import Foundation

enum DefaultRouter {
    
    case fetchCurrentProblem
    case fetchSolvedProblemList
    case postProblem(dto: PostProblemDTO)
    case solveProblem(problemId: Int, dto: ProblemSolveDTO)
    
}

extension DefaultRouter: Router {
    
    var baseURL: String {
        Environment.baseURL
    }
    
    var path: String {
        switch self {
        case .fetchCurrentProblem:
            "/problems/current"
        case .fetchSolvedProblemList:
            "/problems"
        case .postProblem(let dto):
            "/problems"
        case .solveProblem(let id, let dto):
            "/problems/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchCurrentProblem:
                .get
        case .fetchSolvedProblemList:
                .get
        case .postProblem(let dto):
                .post
        case .solveProblem(_, let dto):
                .put
        }
    }
    
    var headers: [String : String] {
        switch self {
        default:
            [
                "Content-Type": "application/json"
            ]
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .fetchCurrentProblem:
            [:]
        case .fetchSolvedProblemList:
            [:]
        case .postProblem(let dto):
            dto.asDictionary()
        case .solveProblem(_, let dto):
            dto.asDictionary()
        }
    }
    
    var encoding: (any ParameterEncoding)? {
        switch self {
        case .fetchCurrentProblem:
            nil
        case .fetchSolvedProblemList:
            nil
        case .postProblem:
            JSONEncoding.default
        case .solveProblem:
            JSONEncoding.default
        }
    }
    
}
