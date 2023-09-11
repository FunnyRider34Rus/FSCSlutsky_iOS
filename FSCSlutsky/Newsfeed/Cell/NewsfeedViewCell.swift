//
//  NewsfeedViewCell.swift
//  FSCSlutsky
//
//  Created by Павел on 10.09.2023.
//

import Foundation
import UIKit

final class NewsfeedViewCell: UITableViewCell {
    
    static let reuseID = "NewsfeedViewCell"
    
    let cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let postLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = Const.postLabelFontSize
        label.textColor = .black
        return label
    }()
    
    let postImage: WebImageView = {
        let image = WebImageView()
        //image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        //view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let iconImageView: WebImageView = {
        let image = WebImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints  = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray
        return label
    }()
    
    //bottomViews
    
    let likesView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemMint
        return view
    }()
    
    let commentsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemTeal
        return view
    }()
    
    let sharesView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemIndigo
        return view
    }()
    
    let viewsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemCyan
        return view
    }()
    
    let likesIcon = UIImageView(image: UIImage(systemName: "heart"))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemBlue
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(viewModel: FeedCellViewModel) {
        
        dateLabel.text = viewModel.date
        postLabel.text = viewModel.text
        
        postLabel.frame = viewModel.sizes.postLabelFrame
        postImage.frame = viewModel.sizes.attachmentFrame
        bottomView.frame = viewModel.sizes.bottomFrame
        
        if let photoAttachemnt = viewModel.photoAttachment {
            postImage.set(imageURL: photoAttachemnt.photoUrlString)
            postImage.isHidden = false
        } else {
            postImage.isHidden = true
        }
    }
    
    private func setupViews() {
    
        print(#function)
        addSubview(cardView)
        cardView.addSubview(topView)
        cardView.addSubview(postLabel)
        cardView.addSubview(postImage)
        cardView.addSubview(bottomView)
        
        topView.addSubview(dateLabel)
        
        likesView.addSubview(likesIcon)
        
        cardView.topAnchor.constraint(equalTo: topAnchor, constant: Const.cardViewInsets.top).isActive = true
        cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Const.cardViewInsets.bottom).isActive = true
        cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Const.cardViewInsets.left).isActive = true
        cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Const.cardViewInsets.right).isActive = true
        
        topView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8).isActive = true
        topView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8).isActive = true
        topView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8).isActive = true
        topView.heightAnchor.constraint(equalToConstant: Const.topViewHeight).isActive = true
        
        dateLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 8).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -8).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -4).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 14).isActive = true
    }
}
