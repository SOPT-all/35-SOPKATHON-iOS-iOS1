//
//  ProblemListViewController.swift
//  FirstTeam
//
//  Created by 예삐 on 11/24/24.
//

import UIKit

final class ProblemListViewController: BaseViewController {
    
    private let rootView = ProblemListView()
    
    private var problemList = ProblemModel.mockProblemList
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarTitle(with: "해결된 고민 리스트")
        register()
        setupDelegate()
    }
    
    private func register() {
        rootView.tableView.register(
            ProblemTableViewCell.self,
            forCellReuseIdentifier: ProblemTableViewCell.identifier
        )
    }
    
    private func setupDelegate() {
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
    }
}

extension ProblemListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 224
    }
}

extension ProblemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return problemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ProblemTableViewCell.identifier,
            for: indexPath
        ) as? ProblemTableViewCell else {
            return UITableViewCell()
        }
        cell.dataBind(problemList[indexPath.row])
        return cell
    }
}