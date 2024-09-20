//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Matvey Krasnov on 24.8.24..
//

import UIKit

class HabitViewController: UIViewController, UIColorPickerViewControllerDelegate {
    
    private lazy var habitNameLabel : UILabel = {
        let habitNameLabel = UILabel()
        habitNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        habitNameLabel.textColor = .label
        habitNameLabel.text = "Название"
        habitNameLabel.numberOfLines = 0
        habitNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return habitNameLabel
    }()
    
    private lazy var habitNameField : UITextField = {
        let habitNameField = UITextField()
        habitNameField.translatesAutoresizingMaskIntoConstraints = false
        habitNameField.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        habitNameField.autocapitalizationType = .sentences
        habitNameField.layer.borderColor = UIColor.gray.cgColor
        habitNameField.layer.borderWidth = 1
        return habitNameField
    }()
    
    private lazy var habitColorLabel : UILabel = {
        let habitColorLabel = UILabel()
        habitColorLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        habitColorLabel.textColor = .label
        habitColorLabel.text = "Цвет"
        habitColorLabel.numberOfLines = 0
        habitColorLabel.translatesAutoresizingMaskIntoConstraints = false
        return habitColorLabel
    }()
    
    private lazy var habitColorPicker : UIButton = {
        let habitColorPicker = UIButton()
        habitColorPicker.translatesAutoresizingMaskIntoConstraints = false
        habitColorPicker.layer.masksToBounds = true
        habitColorPicker.layer.cornerRadius = 15.0
        habitColorPicker.backgroundColor = .red
        habitColorPicker.addTarget(self, action: #selector(showColorPicker), for: .touchUpInside)
        return habitColorPicker
    }()
    
    private lazy var habitTimeLabel : UILabel = {
        let habitTimeLabel = UILabel()
        habitTimeLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        habitTimeLabel.textColor = .label
        habitTimeLabel.text = "Время"
        habitTimeLabel.numberOfLines = 0
        habitTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        return habitTimeLabel
    }()
    
    private lazy var habitTimeLabelDescription : UILabel = {
        let habitTimeLabelDescription = UILabel()
        habitTimeLabelDescription.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        habitTimeLabelDescription.textColor = .label
        habitTimeLabelDescription.text = "Каждый день в "
        habitTimeLabelDescription.numberOfLines = 0
        habitTimeLabelDescription.translatesAutoresizingMaskIntoConstraints = false
        return habitTimeLabelDescription
    }()
    
    private lazy var habitTimePicker : UIDatePicker = {
        let habitTimePicker = UIDatePicker()
        habitTimePicker.translatesAutoresizingMaskIntoConstraints = false
        habitTimePicker.datePickerMode = .time
        habitTimePicker.preferredDatePickerStyle = .wheels
        return habitTimePicker
    }()
    
    private lazy var habitDeleteButton : UIButton = {
        let habitDeleteButton = UIButton(type: .system)
        habitDeleteButton.setTitle("Удалить привычку", for: .normal)
        habitDeleteButton.translatesAutoresizingMaskIntoConstraints = false
//        habitColorPicker.layer.masksToBounds = true
        
//        let button = UIButton(type: .system)
//        button.setTitle("New post", for: .normal)
//        button.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
//        button.addTarget(self, action: #selector(showPost), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
        
        
        
        
        habitColorPicker.addTarget(self, action: #selector(showColorPicker), for: .touchUpInside)
        return habitColorPicker
    }()
    
    var isEditor: Bool
    
    init(isEditor: Bool) {
        self.isEditor = isEditor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isEditor == true {
            print("editor")
            self.title = "Править"
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeHabitView))
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveHabit))
            setupViews(isEditor: true)
            setupEditorConstraints()
        } else {
            print("creator")
            self.title = "Создать"
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeHabitView))
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveHabit))
            setupViews(isEditor: false)
            setupCreatorConstraints()
        }
//        self.title = "Создать"
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeHabitView))
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveHabit))
//        setupViews()
//        setupConstraints()
    }
    
    func setupViews(isEditor: Bool) {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(habitNameLabel)
        self.view.addSubview(habitNameField)
        self.view.addSubview(habitColorLabel)
        self.view.addSubview(habitColorPicker)
        self.view.addSubview(habitTimeLabel)
        self.view.addSubview(habitTimeLabelDescription)
        self.view.addSubview(habitTimePicker)
        if isEditor == true {
            //self.view.addSubview(habitDeleteButton)
        }
        print(habitTimePicker.date)
    }
    
    func setupCreatorConstraints() {
        NSLayoutConstraint.activate([
            habitNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 16),
            habitNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 16),
            habitNameLabel.heightAnchor.constraint(equalToConstant: 20.0),
            habitNameLabel.widthAnchor.constraint(equalToConstant: 120.0),
            
            habitNameField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 16),
            habitNameField.topAnchor.constraint(equalTo: habitNameLabel.bottomAnchor,constant: 16),
            habitNameField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -16),
            habitNameField.heightAnchor.constraint(equalToConstant: 30.0),

            
            habitColorLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            habitColorLabel.topAnchor.constraint(equalTo: habitNameField.bottomAnchor,constant: 10),
            habitColorLabel.heightAnchor.constraint(equalToConstant: 30.0),
            habitColorLabel.widthAnchor.constraint(equalToConstant: 120.0),
            
            habitColorPicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            habitColorPicker.topAnchor.constraint(equalTo: habitColorLabel.bottomAnchor,constant: 10),
            habitColorPicker.heightAnchor.constraint(equalToConstant: 30.0),
            habitColorPicker.widthAnchor.constraint(equalToConstant: 30.0),
            
            habitTimeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            habitTimeLabel.topAnchor.constraint(equalTo: habitColorPicker.bottomAnchor,constant: 10),
            habitTimeLabel.heightAnchor.constraint(equalToConstant: 30.0),
            habitTimeLabel.widthAnchor.constraint(equalToConstant: 120.0),
            
            habitTimeLabelDescription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            habitTimeLabelDescription.topAnchor.constraint(equalTo: habitTimeLabel.bottomAnchor,constant: 10),
            habitTimeLabelDescription.heightAnchor.constraint(equalToConstant: 30.0),
            habitTimeLabelDescription.widthAnchor.constraint(equalToConstant: 200.0),
            
            habitTimePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            habitTimePicker.topAnchor.constraint(equalTo: habitTimeLabelDescription.bottomAnchor),
            habitTimePicker.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -40)
        ])
    }
    
    func setupEditorConstraints() {
        NSLayoutConstraint.activate([
            habitNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 16),
            habitNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 16),
            habitNameLabel.heightAnchor.constraint(equalToConstant: 20.0),
            habitNameLabel.widthAnchor.constraint(equalToConstant: 120.0),
            
            habitNameField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 16),
            habitNameField.topAnchor.constraint(equalTo: habitNameLabel.bottomAnchor,constant: 16),
            habitNameField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -16),
            habitNameField.heightAnchor.constraint(equalToConstant: 30.0),

            
            habitColorLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            habitColorLabel.topAnchor.constraint(equalTo: habitNameField.bottomAnchor,constant: 10),
            habitColorLabel.heightAnchor.constraint(equalToConstant: 30.0),
            habitColorLabel.widthAnchor.constraint(equalToConstant: 120.0),
            
            habitColorPicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            habitColorPicker.topAnchor.constraint(equalTo: habitColorLabel.bottomAnchor,constant: 10),
            habitColorPicker.heightAnchor.constraint(equalToConstant: 30.0),
            habitColorPicker.widthAnchor.constraint(equalToConstant: 30.0),
            
            habitTimeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            habitTimeLabel.topAnchor.constraint(equalTo: habitColorPicker.bottomAnchor,constant: 10),
            habitTimeLabel.heightAnchor.constraint(equalToConstant: 30.0),
            habitTimeLabel.widthAnchor.constraint(equalToConstant: 120.0),
            
            habitTimeLabelDescription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            habitTimeLabelDescription.topAnchor.constraint(equalTo: habitTimeLabel.bottomAnchor,constant: 10),
            habitTimeLabelDescription.heightAnchor.constraint(equalToConstant: 30.0),
            habitTimeLabelDescription.widthAnchor.constraint(equalToConstant: 200.0),
            
            habitTimePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            habitTimePicker.topAnchor.constraint(equalTo: habitTimeLabelDescription.bottomAnchor),
            habitTimePicker.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -40),
            
//            habitDeleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            habitDeleteButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
            
        ])
    }
    
    @objc func saveHabit() {
        let habit = Habit(
            name: habitNameField.text!,
            date: habitTimePicker.date,
            color: habitColorPicker.backgroundColor ?? .red)
        HabitsStore.shared.habits.append(habit)
        print(habit.name,habit.color,habit.date)
        closeHabitView()
    }
    
    @objc func closeHabitView() {
            dismiss(animated: true)
    }
    
    @objc func showColorPicker() {
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        colorPicker.selectedColor = view.backgroundColor ?? .white
        present(colorPicker, animated: true)
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        self.habitColorPicker.backgroundColor = viewController.selectedColor
    }
}
