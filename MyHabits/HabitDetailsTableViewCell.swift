//
//  HabitDetailsTableViewCell.swift
//  MyHabits
//
//  Created by Matvey Krasnov on 11.9.24..
//

import UIKit

class HabitDetailsTableViewCell: UITableViewCell {

    private lazy var habitDate: UILabel = {
        let habitDate = UILabel()
        habitDate.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        habitDate.textColor = .black
        habitDate.numberOfLines = 0
        habitDate.translatesAutoresizingMaskIntoConstraints = false
        return habitDate
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
        textLabel?.backgroundColor = .black
        detailTextLabel?.backgroundColor = .clear
        imageView?.backgroundColor = .black
        contentView.addSubview(habitDate)
  
    
        selectionStyle = .gray
        let selectedView = UIView()
        selectedView.backgroundColor = .white
        selectedBackgroundView = selectedView
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            habitDate.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            habitDate.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            habitDate.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 16.0),
            habitDate.heightAnchor.constraint(equalToConstant: 30.0),
            habitDate.widthAnchor.constraint(equalToConstant: 200.0),
        ])
    }
    
    func update(_ model: Date) {
        habitDate.text = model.formatted()
    }

}
