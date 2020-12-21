//
//  IGFeedPostActionsTableViewCell.swift
//  Sigor
//
//  Created by 이다영 on 2020/12/17.
//

import UIKit

protocol IGFeedPostActionsTableViewCellDelegate: AnyObject {
    func didTapLikeButton()
    func didTapCommentButton()
    func didTapSendButton()
}

class IGFeedPostActionsTableViewCell: UITableViewCell {
    
    weak var delegate: IGFeedPostActionsTableViewCellDelegate?
    
    static let identifier = "IGFeedPostActionsTableViewCell"
    
    private let likeButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .label
        return button
    }()
    
    private let commentButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        button.tintColor = .label
        return button
    }()
    
    private let sendButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
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
        delegate?.didTapLikeButton()
    }
    
    @objc private func didTapCommentButton() {
        delegate?.didTapCommentButton()
    }
    
    @objc private func didTapSendButton() {
        delegate?.didTapSendButton()
    }
    
    public func configure(with post: UserPost) {
        // configure the cell
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let buttonSize = contentView.height - 10
        let button = [likeButton, commentButton, sendButton]
        for x in 0..<button.count {
            let button = button[x]
            button.frame = CGRect(x: (CGFloat(x) * buttonSize) + (10 * CGFloat(x + 1)),
                                  y: 5,
                                  width: buttonSize,
                                  height: buttonSize)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
