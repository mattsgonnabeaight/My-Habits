//
//  HabitTableViewCell.swift
//  MyHabits
//
//  Created by Matvey Krasnov on 2.9.24..
//

import UIKit

class HabitTableViewCell: UITableViewCell {

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
    
    private lazy var statusCheckmark : UIView = {
        let statusCheckmark = UIView()
        statusCheckmark.translatesAutoresizingMaskIntoConstraints = false
        statusCheckmark.layer.masksToBounds = true
        statusCheckmark.layer.cornerRadius = 18.0
        statusCheckmark.layer.borderWidth = 3
        return statusCheckmark
    }()

    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: .default,
            reuseIdentifier: reuseIdentifier
            )
        tuneView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        isHidden = false
        isSelected = false
        isHighlighted = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        guard let view = selectedBackgroundView else {
            return
        }
        
        contentView.insertSubview(view, at: 0)
        selectedBackgroundView?.isHidden = !selected
    }
    
    private func tuneView() {
        backgroundColor = .tertiarySystemBackground
        contentView.backgroundColor = .tertiarySystemBackground
        textLabel?.backgroundColor = .clear
        detailTextLabel?.backgroundColor = .clear
        imageView?.backgroundColor = .black
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(habitTimeLabel)
        contentView.addSubview(habitRepeatCounter)
        contentView.addSubview(statusCheckmark)
  
    
        selectionStyle = .gray
        let selectedView = UIView()
        selectedView.backgroundColor = .white
        selectedBackgroundView = selectedView
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            fullNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            fullNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            fullNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16.0),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 30.0),
            
            habitTimeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            habitTimeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            habitTimeLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 16.0),
            habitTimeLabel.heightAnchor.constraint(equalToConstant: 30.0),
            
            habitRepeatCounter.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            habitRepeatCounter.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            habitRepeatCounter.topAnchor.constraint(equalTo: habitTimeLabel.bottomAnchor, constant: 46.0),
            habitRepeatCounter.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16.0),
    
            statusCheckmark.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -25.0),
            statusCheckmark.heightAnchor.constraint(equalToConstant: 36.0),
            statusCheckmark.widthAnchor.constraint(equalToConstant: 36.0),
            statusCheckmark.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
        ])
    }
    
    func update(_ model: Habit) {
        fullNameLabel.text = model.name
        fullNameLabel.textColor = model.color
        habitTimeLabel.text = model.dateString
        habitRepeatCounter.text = "Счетчик: " + String(model.trackDates.count)
        statusCheckmark.layer.borderColor = fullNameLabel.textColor.cgColor
    }

}



