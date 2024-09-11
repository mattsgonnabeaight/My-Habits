//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Matvey Krasnov on 24.8.24..
//

import UIKit

class HabitsViewController: UIViewController {
    

    private lazy var habitListLabel : UILabel = {
        let habitListLabel = UILabel()
        habitListLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        habitListLabel.textColor = .black
        habitListLabel.text = "Сегодня"
        habitListLabel.numberOfLines = 0
        habitListLabel.translatesAutoresizingMaskIntoConstraints = false
        return habitListLabel
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(
            frame: .zero,
            style: .plain
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    private enum CellReuseID: String, CaseIterable {
        case status = "StatusTableViewCell_ReuseID"
        case habit = "HabitTableViewCell_ReuseID"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createHabit))
        setupViews()
        setupConstraints()
        tuneTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            print("appeared")
            tableView.reloadData()   // ...and it is also visible here.
        }
    
    
    
//    override func v
    
    @objc func createHabit() {
        let habitViewController = UINavigationController()
        habitViewController.navigationBar.backgroundColor = .systemBackground
        habitViewController.viewControllers = [HabitViewController()]
        habitViewController.modalPresentationStyle = .fullScreen
        habitViewController.modalTransitionStyle = .coverVertical
        tabBarController?.present(habitViewController, animated: true, completion: nil)
    }
    
    func setupViews() {
        self.view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        self.view.addSubview(habitListLabel)
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            habitListLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 16),
            habitListLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 16),
            habitListLabel.heightAnchor.constraint(equalToConstant: 40.0),
            habitListLabel.widthAnchor.constraint(equalToConstant: 160.0),
            
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: habitListLabel.bottomAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    
    
    private func tuneTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 174.0
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0.0
        }
 
        tableView.register(
            HabitTableViewCell.self,
            forCellReuseIdentifier: CellReuseID.habit.rawValue
        )
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension HabitsViewController: UITableViewDataSource {
    
    func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        return 1
    }

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return HabitsStore.shared.habits.count
        }
        
    
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CellReuseID.habit.rawValue,
                for: indexPath
            ) as? HabitTableViewCell else {
                fatalError("could not dequeueReusableCell")
            }
        var model = HabitsStore.shared.habits
        cell.update(model[indexPath.row])
        return cell
    }
}

extension HabitsViewController: UITableViewDelegate {
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(
        _ tableView: UITableView,
        heightForFooterInSection section: Int
    ) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        print("Did select cell at \(indexPath)")
        
        print("\(HabitsStore.shared.dates[indexPath.row])")
        let nextViewController = HabitDetailsViewController()
        navigationController?.pushViewController(
            nextViewController,
            animated: true
        )
    }
}
