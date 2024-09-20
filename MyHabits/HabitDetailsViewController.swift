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
        tuneTableView()
    }
    
    func setupViews() {
        self.view.backgroundColor = .systemBackground
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
        let habitEditorViewController = HabitViewController(isEditor: true)
        habitViewController.navigationBar.backgroundColor = .systemBackground
        habitViewController.viewControllers = [habitEditorViewController]
        
        habitViewController.modalPresentationStyle = .fullScreen
        habitViewController.modalTransitionStyle = .coverVertical
        tabBarController?.present(habitViewController, animated: true, completion: nil)
    }
    
    private func tuneTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0.0
        }
        
//        let headerView = ProfileHeaderView()
//        tableView.setAndLayout(headerView: headerView)
        tableView.register(
            HabitDetailsTableViewCell.self,
            forCellReuseIdentifier: CellReuseID.habitDate.rawValue
        )
//        tableView.register(
//            PostTableViewCell.self,
//            forCellReuseIdentifier: CellReuseID.base.rawValue
//        )
        tableView.dataSource = self
        tableView.delegate = self
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
//        let model = HabitsStore.shared.habits
        
        
        //print(model)
        cell.sraniyKostil.tag = indexPath.row
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

