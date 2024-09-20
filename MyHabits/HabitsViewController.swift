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
        habitListLabel.textColor = .label
        habitListLabel.text = "Сегодня"
        habitListLabel.numberOfLines = 0
        habitListLabel.translatesAutoresizingMaskIntoConstraints = false
        return habitListLabel
    }()
    
    private lazy var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: HabitCollectionViewCell.identifier)
        return collectionView
    }()
    
    private enum CellReuseID: String, CaseIterable {
        //case status = "StatusTableViewCell_ReuseID"
        case habit = "HabitTableViewCell_ReuseID"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createHabit))
//        for i in 0...HabitsStore.shared.dates.count - 1 {
//            print(HabitsStore.shared.dates[i])
//        }
//        print(HabitsStore.shared.habits.count)
//        for i in 0...HabitsStore.shared.habits.count - 1 {
//            print(HabitsStore.shared.habits[i])
//        }
//        for i in 0...HabitsStore.shared.habits.count - 1 {
//            print(HabitsStore.shared.habits[i].isAlreadyTakenToday)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MM yyyy"
        dateFormatter.dateStyle = .long
//        habitDate.text = dateFormatter.string(from: model)
        
        print(HabitsStore.shared.habits[6].name)
        print(HabitsStore.shared.habits[6].trackDates.isEmpty)
        
        print("444")
        
        for i in 0...HabitsStore.shared.habits.count - 1 {
            print("Habbit \(i + 1) :")
            if !HabitsStore.shared.habits[i].trackDates.isEmpty {
                for j in 0...HabitsStore.shared.habits[i].trackDates.count - 1 {
                    let trackedDate = dateFormatter.string(from: HabitsStore.shared.habits[i].trackDates[j])
                    print("tracked: \(j+1). \(trackedDate)")
                    print("____")
                }
            } else {
                    print("not tracked")
                }
            }
        
        
//        }
        setupViews()
        setupConstraints()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("appeared")
        collectionView.reloadData()
    }
    
    func updateCollection() {
        print("called")
        collectionView.reloadData()
    }

    
    @objc func createHabit() {
        let habitViewController = UINavigationController()
        habitViewController.navigationBar.backgroundColor = .systemBackground
        habitViewController.viewControllers = [HabitViewController(isEditor: false)]
        habitViewController.modalPresentationStyle = .fullScreen
        habitViewController.modalTransitionStyle = .coverVertical
        tabBarController?.present(habitViewController, animated: true, completion: nil)
    }
    
    func setupViews() {
        self.view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        self.view.addSubview(habitListLabel)
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            habitListLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 16),
            habitListLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 16),
            habitListLabel.heightAnchor.constraint(equalToConstant: 40.0),
            habitListLabel.widthAnchor.constraint(equalToConstant: 160.0),
            
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: habitListLabel.bottomAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension HabitsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        HabitsStore.shared.habits.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitCollectionViewCell.identifier, for: indexPath) as! HabitCollectionViewCell
        let habit = HabitsStore.shared.habits[indexPath.row]
        cell.habitStatusButton.tag = indexPath.row
        cell.setup(with: habit)
        
        return cell
    }
}

extension HabitsViewController: UICollectionViewDelegateFlowLayout {
    
    private func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 1
        let totalSpacing: CGFloat = 30
        let finalWidth = (width - totalSpacing) / itemsInRow
        return floor(finalWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = itemWidth(for: view.frame.width, spacing: 8)
        return CGSize(width: width, height: 150)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Did select cell at \(indexPath.row)")
        let details = HabitDetailsViewController()
        navigationController?.pushViewController(details, animated: true)
    }
}

//protocol ReloadDateDelegate {
//    func updateCollection()
//}
