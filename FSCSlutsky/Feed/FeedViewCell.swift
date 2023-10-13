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
    
    private lazy var image = WebImageView()
    
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
    }
    
    func set(viewModel: FeedCellViewModel) {
        bodyText.text = viewModel.bodyText
        dateText.text = viewModel.dateText
        if let attachment = viewModel.attachment {
            image.set(imageURL: attachment.imageURL)
            setupConstraints()
        }
    }
    
    private func setupViews() {
        contentView.backgroundColor = .tertiarySystemGroupedBackground
        contentView.addSubview(cardView)
        cardView.addSubview(image)
        cardView.addSubview(bodyText)
        cardView.addSubview(dateText)
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        //image.translatesAutoresizingMaskIntoConstraints = false
        bodyText.translatesAutoresizingMaskIntoConstraints = false
        dateText.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setupConstraints() {
        let screen = contentView.safeAreaLayoutGuide
        cardView.topAnchor.constraint(equalTo: screen.topAnchor, constant: DesignSystem.Insets.small).isActive = true
        cardView.bottomAnchor.constraint(equalTo: screen.bottomAnchor, constant: -DesignSystem.Insets.small).isActive = true
        cardView.leadingAnchor.constraint(equalTo: screen.leadingAnchor, constant: DesignSystem.Insets.large).isActive = true
        cardView.trailingAnchor.constraint(equalTo: screen.trailingAnchor, constant: -DesignSystem.Insets.large).isActive = true
        
        guard let imageWidth = image.image?.size.width else { return }
        guard let imageHeight = image.image?.size.height else { return }
        
        let ratio = imageHeight / imageWidth
        
        let imageLayerWidth = UIScreen.main.bounds.width - DesignSystem.Insets.large
        let imageLayerHeight = ceil(imageLayerWidth * ratio)

        image.frame = CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: imageLayerWidth, height: imageLayerHeight)
        )
        image.contentMode = .scaleAspectFill
        
        bodyText.topAnchor.constraint(equalTo: image.bottomAnchor, constant: DesignSystem.Insets.large).isActive = true
        bodyText.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: DesignSystem.Insets.large).isActive = true
        bodyText.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -DesignSystem.Insets.small).isActive = true
        
        dateText.topAnchor.constraint(equalTo: bodyText.bottomAnchor).isActive = true
        dateText.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: DesignSystem.Insets.large).isActive = true
        dateText.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -DesignSystem.Insets.large).isActive = true
        dateText.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -DesignSystem.Insets.large).isActive = true
    }
}
