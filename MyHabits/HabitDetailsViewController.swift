//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Matvey Krasnov on 9.9.24..
//

import UIKit

class HabitDetailsViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(
            frame: .zero,
            style: .plain
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private enum CellReuseID: String, CaseIterable {
        case habitDate = "DateTableViewCell_ReuseID"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: nil)
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        self.view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([

        ])
    }
}

extension HabitDetailsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HabitsStore.shared.dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseID.habitDate.rawValue, for: indexPath) as? HabitDetailsTableViewCell else {
                fatalError("could not dequeueReusableCell")
            }
        let model = HabitsStore.shared.dates
        print(model)
        cell.update(model[indexPath.row])
        return cell
    }
}

extension HabitDetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Did select cell at \(indexPath)")
    }
}

