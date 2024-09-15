//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Matvey Krasnov on 9.9.24..
//

import UIKit

class HabitDetailsViewController: UIViewController {
    
    fileprivate let data = HabitsStore.shared.dates
    
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
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editHabit))
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        self.view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    @objc func editHabit() {
        let habitViewController = UINavigationController()
        habitViewController.navigationBar.backgroundColor = .systemBackground
        habitViewController.viewControllers = [HabitViewController()]
        habitViewController.modalPresentationStyle = .fullScreen
        habitViewController.modalTransitionStyle = .coverVertical
        tabBarController?.present(habitViewController, animated: true, completion: nil)
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
        //let model = HabitsStore.shared.dates[indexPath.row]
//        let model = HabitsStore.shared.habits
        
        
        //print(model)
        cell.update(data[indexPath.row])
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

