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
        habitDate.textColor = .label
        habitDate.numberOfLines = 0
        habitDate.text = "test"
        habitDate.translatesAutoresizingMaskIntoConstraints = false
        return habitDate
    }()
    
    private lazy var habitStatus: UIImageView = {
        let habitStatus = UIImageView(image: UIImage(systemName: "checkmark"))
        return habitStatus
    }()
    
    lazy var sraniyKostil: UIButton = {
        let sraniyKostil = UIButton()
        return sraniyKostil
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
        backgroundColor = .systemBackground
        contentView.backgroundColor = .systemBackground
        textLabel?.backgroundColor = .black
        detailTextLabel?.backgroundColor = .clear
        imageView?.backgroundColor = .black
        contentView.addSubview(habitDate)
        contentView.addSubview(sraniyKostil)
  
    
        selectionStyle = .gray
        let selectedView = UIView()
        selectedView.backgroundColor = .white
        selectedBackgroundView = selectedView
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            habitDate.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            habitDate.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            habitDate.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            habitDate.heightAnchor.constraint(equalToConstant: 40.0),
            habitDate.widthAnchor.constraint(equalToConstant: 400.0),
        ])
    }
    
    func update(_ model: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MM yyyy"
        dateFormatter.dateStyle = .long
        print("___")
        print(HabitsStore.shared.habits.count)
        print(sraniyKostil.tag)
        print("___")
//        if HabitsStore.shared.habit(HabitsStore.shared.habits[sraniyKostil.tag], isTrackedIn: model) {
//            habitDate.text = dateFormatter.string(from: model) + " --- " + String(sraniyKostil.tag) + String("___ is tracked")
//        } else {
//            habitDate.text = dateFormatter.string(from: model) + " --- " + String(sraniyKostil.tag)
//        }
        habitDate.text = dateFormatter.string(from: model) + " --- " + String(sraniyKostil.tag)
    }
}
