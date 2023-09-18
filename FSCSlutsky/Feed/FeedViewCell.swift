//
//  FeedViewCell.swift
//  FSCSlutsky
//
//  Created by Павел on 13.09.2023.
//

import UIKit

class FeedViewCell: UITableViewCell {
    
    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = DesignSystem.Colors.background
        view.layer.cornerRadius = DesignSystem.CardView.corners
        view.clipsToBounds = true
        return view
    }()
    
    private let image = WebImageView()
    
    private let bodyText: UILabel = {
        let label = UILabel()
        label.textColor = DesignSystem.Colors.text
        label.numberOfLines = 0
        return label
    }()
    
    private let dateText: UILabel = {
        let label = UILabel()
        label.textColor = DesignSystem.Colors.date
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(viewModel: FeedCellViewModel) {
        bodyText.text = viewModel.bodyText
        dateText.text = viewModel.dateText
        image.set(imageURL: viewModel.attachment?.imageURL)
        guard let imageWidth = image.image?.size.width else { return }
        guard let imageHeight = image.image?.size.height else { return }
        var ratio = imageWidth/imageHeight
        image.heightAnchor.constraint(equalToConstant: CGFloat(imageHeight/ratio)).isActive = true
        image.clipsToBounds = true
    }
    
    private func setupViews() {
        contentView.backgroundColor = .tertiarySystemGroupedBackground
        contentView.addSubview(cardView)
        cardView.addSubview(image)
        cardView.addSubview(bodyText)
        cardView.addSubview(dateText)
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        bodyText.translatesAutoresizingMaskIntoConstraints = false
        dateText.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setupConstraints() {
        let screen = contentView//.safeAreaLayoutGuide
        cardView.topAnchor.constraint(equalTo: screen.topAnchor, constant: DesignSystem.Insets.large/2).isActive = true
        cardView.bottomAnchor.constraint(equalTo: screen.bottomAnchor, constant: -DesignSystem.Insets.large/2).isActive = true
        cardView.leadingAnchor.constraint(equalTo: screen.leadingAnchor, constant: DesignSystem.Insets.large).isActive = true
        cardView.trailingAnchor.constraint(equalTo: screen.trailingAnchor, constant: -DesignSystem.Insets.large).isActive = true
        
        image.topAnchor.constraint(equalTo: cardView.topAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: cardView.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: cardView.trailingAnchor).isActive = true
        
        bodyText.topAnchor.constraint(equalTo: image.bottomAnchor, constant: DesignSystem.Insets.large).isActive = true
        bodyText.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: DesignSystem.Insets.large).isActive = true
        bodyText.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -DesignSystem.Insets.large).isActive = true
        
        dateText.topAnchor.constraint(equalTo: bodyText.bottomAnchor, constant: DesignSystem.Insets.large).isActive = true
        dateText.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: DesignSystem.Insets.large).isActive = true
        dateText.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -DesignSystem.Insets.large).isActive = true
        dateText.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -DesignSystem.Insets.large).isActive = true
    }
}
