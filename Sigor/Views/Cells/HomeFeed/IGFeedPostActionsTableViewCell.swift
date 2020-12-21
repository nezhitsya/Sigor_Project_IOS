//
//  IGFeedPostActionsTableViewCell.swift
//  Sigor
//
//  Created by 이다영 on 2020/12/17.
//

import UIKit

class IGFeedPostActionsTableViewCell: UITableViewCell {
    
    static let identifier = "IGFeedPostActionsTableViewCell"
    
    private let likeButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .label
        return button
    }()
    
    private let commentButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "message"), for: .normal)
        button.tintColor = .label
        return button
    }()
    
    private let sendButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "send"), for: .normal)
        button.tintColor = .label
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(likeButton)
        contentView.addSubview(commentButton)
        contentView.addSubview(sendButton)
        
        likeButton.addTarget(self,
                             action: #selector(didTapLikeButton),
                             for: .touchUpInside)
        commentButton.addTarget(self,
                                action: #selector(didTapCommentButton),
                                for: .touchUpInside)
        sendButton.addTarget(self,
                             action: #selector(didTapSendButton),
                             for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapLikeButton() {
        
    }
    
    @objc private func didTapCommentButton() {
        
    }
    
    @objc private func didTapSendButton() {
        
    }
    
    public func configure(with post: UserPost) {
        // configure the cell
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
