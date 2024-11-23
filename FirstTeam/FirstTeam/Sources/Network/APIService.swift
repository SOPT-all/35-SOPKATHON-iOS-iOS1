//
//  APIService.swift
//  FirstTeam
//
//  Created by 조성민 on 11/23/24.
//

import Alamofire
import Foundation

final class APIService {
    
    private let session: Session
    
    init() {
        let configuration = URLSessionConfiguration.af.default
        let apiLogger = APIEventLogger()
        session = Session(configuration: configuration, eventMonitors: [apiLogger])
    }
    
    func fetchCurrentProblem(
        completion: @escaping (Result<HomeModel, ExampleError>) -> Void
    ) {
        session.request(
            DefaultRouter.fetchCurrentProblem
        )
        .validate()
        .responseDecodable(of: CurrentProblemDTO.self) { [weak self] response in
            guard let self else {
                completion(.failure(.unknown))
                return
            }
            switch response.result {
            case .success(let responseDTO):
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                if let problem = responseDTO.problem,
                   let date = formatter.date(from: problem.startDate) {
                    completion(
                        .success(
                            HomeModel(
                                isProblemExist: responseDTO.isEmpty,
                                problem: Problem(
                                    id: problem.id,
                                    problem: problem.title,
                                    startDate: date
                                )
                            )
                        )
                    )
                } else {
                    print("aaaa")
                }
            case .failure(let error):
                dump(error)
                completion(.failure(.unknown))
            }
        }
    }
    
    func fetchSolvedProblemList(
        completion: @escaping (Result<[ProblemModel], ExampleError>) -> Void
    ) {
        session.request(
            DefaultRouter.fetchSolvedProblemList
        )
        .validate()
        .responseDecodable(of: ProblemsDTO.self) { [weak self] response in
            guard let self else {
                completion(.failure(.unknown))
                return
            }
            switch response.result {
            case .success(let responseDTO):
                completion(
                    .success(
                        responseDTO.problems.map(
                            { dto in
                                ProblemModel(
                                    title: dto.title,
                                    items: dto.items.map(
                                        { responseItemDTO in
                                                .init(
                                                    content: responseItemDTO.content,
                                                    isSelected: responseItemDTO.isSelected
                                                )
                                        }
                                    ),
                                    startDate: dto.startDate,
                                    endDate: dto.endDate
                                )
                            }
                        )
                    )
                )
            case .failure(let error):
                dump(error)
                completion(.failure(.unknown))
            }
        }
    }
    
    func postProblem(
        title: String,
        firstChoice: String,
        secondChoice: String,
        completion: @escaping (Result<Void, ExampleError>) -> Void
    ) {
        session.request(
            DefaultRouter.postProblem(
                dto: PostProblemDTO(
                    title: title,
                    items: [
                        .init(content: firstChoice),
                        .init(content: secondChoice)
                    ]
                )
            )
        )
        .validate()
        .response { [weak self] response in
            guard let self else {
                completion(.failure(.unknown))
                return
            }
            switch response.result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                dump(error)
                completion(.failure(ExampleError.unknown))
            }
        }
    }
    
    func putProblemSolve(
        problemID: Int,
        choiceIndex: Int,
        completion: @escaping (Result<Void, ExampleError>) -> Void
    ) {
        session.request(
            DefaultRouter.solveProblem(
                problemId: problemID,
                dto: ProblemSolveDTO(
                    itemID: choiceIndex
                )
            )
        )
        .validate()
        .response { [weak self] response in
            guard let self else {
                completion(.failure(.unknown))
                return
            }
            switch response.result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                dump(error)
                completion(.failure(ExampleError.unknown))
            }
        }
    }
}
