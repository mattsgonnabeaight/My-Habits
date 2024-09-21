//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Matvey Krasnov on 21.9.24..
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {
    
    private lazy var encourageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.text = "Вcе получится!"
        label.textColor = .label
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
       
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var progressBar: UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.progressViewStyle = .bar
        progressBar.layer.cornerRadius = 4
        progressBar.backgroundColor = .lightGray
        progressBar.progressTintColor = UIColor(named: "NavColor")
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }()

    override init(frame: CGRect) {
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
        contentView.addSubview(encourageLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(progressBar)
    }
        
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            encourageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            encourageLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            encourageLabel.heightAnchor.constraint(equalToConstant: 30.0),
            encourageLabel.widthAnchor.constraint(equalToConstant: 150.0),
            
            statusLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            statusLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            statusLabel.heightAnchor.constraint(equalToConstant: 30.0),
            statusLabel.widthAnchor.constraint(equalToConstant: 40.0),
            
            progressBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            progressBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            progressBar.topAnchor.constraint(equalTo: encourageLabel.bottomAnchor, constant: 16.0),
            progressBar.heightAnchor.constraint(equalToConstant: 5.0),
            ])
        }
    
    func setup(with model: Float) {
        let percentOfProgress = Int(model * 100)
        statusLabel.text = String(percentOfProgress) + "%"
        progressBar.progress = model
    }
}
