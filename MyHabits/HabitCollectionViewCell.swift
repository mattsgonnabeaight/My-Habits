//
//  HabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Matvey Krasnov on 11.9.24..
//

import UIKit

class HabitCollectionViewCell: UICollectionViewCell {
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var habitTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var habitRepeatCounter: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cчётчик: "
        return label
    }()
    
    var delegate: HabitsViewControllerDelegate?
    
    var habitIndex: Int?
    
    lazy var habitStatusButton : UIButton = {
        let habitStatusButton = UIButton()
        habitStatusButton.translatesAutoresizingMaskIntoConstraints = false
        habitStatusButton.layer.masksToBounds = true
        habitStatusButton.layer.cornerRadius = 18.0
        habitStatusButton.layer.borderWidth = 3
        habitStatusButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
        habitStatusButton.imageView?.tintColor = .systemBackground
        habitStatusButton.addTarget(self, action: #selector(changeHabitStatus), for: .touchUpInside)
        return habitStatusButton
    }()

    override init(frame: CGRect) {
//        delegate = self.delegate
        super.init(frame: .zero)
        tuneView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
    }
    
    private func tuneView() {
        backgroundColor = .systemBackground
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(habitTimeLabel)
        contentView.addSubview(habitRepeatCounter)
        contentView.addSubview(habitStatusButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            fullNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            fullNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            fullNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16.0),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 20.0),
            
            habitTimeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            habitTimeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            habitTimeLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor),
            habitTimeLabel.heightAnchor.constraint(equalToConstant: 30.0),
            
            habitRepeatCounter.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            habitRepeatCounter.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            habitRepeatCounter.topAnchor.constraint(equalTo: habitTimeLabel.bottomAnchor, constant: 26.0),
            habitRepeatCounter.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16.0),
    
            habitStatusButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -25.0),
            habitStatusButton.heightAnchor.constraint(equalToConstant: 36.0),
            habitStatusButton.widthAnchor.constraint(equalToConstant: 36.0),
            habitStatusButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    func setup(with model: Habit, index: Int) {
        habitIndex = index
        fullNameLabel.text = model.name
        fullNameLabel.textColor = model.color
        habitTimeLabel.text = model.dateString
        habitRepeatCounter.text = "Счетчик: " + String(model.trackDates.count) + "test id -- \(String(describing: habitIndex))"
        habitStatusButton.layer.borderColor = fullNameLabel.textColor.cgColor
        if model.isAlreadyTakenToday == true {
            habitStatusButton.imageView?.tintColor = .white
            habitStatusButton.backgroundColor = UIColor(cgColor: habitStatusButton.layer.borderColor!)
        } else { habitStatusButton.backgroundColor = UIColor.systemBackground }
    }

    
    @objc 
    func changeHabitStatus(sender: UIButton) {
        if HabitsStore.shared.habits[habitStatusButton.tag].isAlreadyTakenToday == false {
            HabitsStore.shared.track(HabitsStore.shared.habits[habitStatusButton.tag])
            habitStatusButton.imageView?.tintColor = .white
            habitStatusButton.backgroundColor = UIColor(cgColor: habitStatusButton.layer.borderColor!)
            if let delegate = delegate {
                self.delegate?.updateCollection()
            } else {
                print("no delegate")
            }
        } else {
            habitStatusButton.backgroundColor = UIColor(cgColor: habitStatusButton.layer.borderColor!)
        }
    }
}


