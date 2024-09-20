//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Matvey Krasnov on 24.8.24..
//

import UIKit

class InfoViewController: UIViewController {

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .systemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
        
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .systemBackground
        return contentView
    }()
    
    private lazy var infoTitle : UILabel = {
        let infoTitle = UILabel()
        infoTitle.translatesAutoresizingMaskIntoConstraints = false
        infoTitle.text = "Привычка за 21 день"
        infoTitle.font = UIFont.systemFont(ofSize: 20.0, weight: .semibold)
        return infoTitle
    }()
    
    private lazy var textAboutHabits : UILabel = {
        let textAboutHabits = UILabel()
        textAboutHabits.translatesAutoresizingMaskIntoConstraints = false
        textAboutHabits.text = "Прохождение этапов, за которые вырабатывается привычка, подчиняется следующему алгоритму:" +
        "\n\n1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага." +
        "\n\n2. Выдержать 2 дня в прежнем состоянии самоконтроля" +
        "\n\n3. Отметить в дневнике первую неделю изменений и подвести первые итоги - что оказалось тяжело, что - легче, с чем еще предстоит серьезно бороться." +
        "\n\n4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств." +
        "\n\n5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой" +
        "\n\n6. На 90-й день соблюдения техники все лишнее из прошлой жизни перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся." +
        "\n\n6. На 90-й день соблюдения техники все лишнее из прошлой жизни перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся."
        textAboutHabits.numberOfLines = 0
        return textAboutHabits
    }()
    
    private lazy var habitStatusCheckmark : UIImageView = {
        let habitStatusCheckmark = UIImageView(image: UIImage(named: "checkmark.circle"))
        habitStatusCheckmark.translatesAutoresizingMaskIntoConstraints = false
        habitStatusCheckmark.tintColor = .black
        habitStatusCheckmark.layer.borderColor = UIColor.black.cgColor

        return habitStatusCheckmark
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = "Информация"
        setupViews()
        setupConstraints()
        setupContentOfScrollView()
    }
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
                
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
    
    private func setupContentOfScrollView() {
        contentView.addSubview(infoTitle)
        contentView.addSubview(textAboutHabits)
        contentView.addSubview(habitStatusCheckmark)
        
        NSLayoutConstraint.activate([
            infoTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            infoTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            infoTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16.0),
            infoTitle.heightAnchor.constraint(equalToConstant: 50.0),
            
            textAboutHabits.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            textAboutHabits.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            textAboutHabits.topAnchor.constraint(equalTo: infoTitle.bottomAnchor, constant: 16.0),
            textAboutHabits.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16.0),
            
            habitStatusCheckmark.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
//            habitStatusCheckmark.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            habitStatusCheckmark.topAnchor.constraint(equalTo: textAboutHabits.bottomAnchor, constant: 16.0),
//            habitStatusCheckmark.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16.0),
            habitStatusCheckmark.heightAnchor.constraint(equalToConstant: 16.0),
            habitStatusCheckmark.widthAnchor.constraint(equalToConstant: 16.0),
        ])
        
        
    }
}
