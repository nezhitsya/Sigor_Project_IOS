//
//  ProfileTabsCollectionReusableView.swift
//  Sigor
//
//  Created by 이다영 on 2020/12/17.
//

import UIKit

protocol ProfileTabsCollectionReusableViewDelegate: AnyObject {
    func didTapGridButtonTab()
    func didTapTaggedButtonTab()
}

class ProfileTabsCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileTabsCollectionReusableView"
    
    public weak var delegate: ProfileTabsCollectionReusableViewDelegate?
    
    struct Constants {
        static let padding: CGFloat = 10
    }
    
    private let gridButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .systemOrange
        button.setBackgroundImage(UIImage(systemName: "circle.grid.3x3.fill"), for: .normal)
        return button
    }()
    
    private let taggedButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .systemOrange
        button.setBackgroundImage(UIImage(systemName: "tag"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .secondarySystemBackground
        addSubview(taggedButton)
        addSubview(gridButton)
        
        gridButton.addTarget(self,
                             action: #selector(didTapGridButton),
                             for: .touchUpInside)
        taggedButton.addTarget(self,
                               action: #selector(didTapTaggedButton),
                               for: .touchUpInside)
    }
    
    @objc private func didTapGridButton() {
//        gridButton.tintColor = .systemOrange
//        taggedButton.tinColor = .systemOrange
        delegate?.didTapGridButtonTab()
    }
    
    @objc private func didTapTaggedButton() {
        delegate?.didTapTaggedButtonTab()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = height - (Constants.padding * 2)
        let gridButtonX = ((width/2) - size)/2
        gridButton.frame = CGRect(x: gridButtonX,
                                  y: Constants.padding,
                                  width: size,
                                  height: size)
        taggedButton.frame = CGRect(x: gridButtonX + (width/2),
                                    y: Constants.padding,
                                    width: size,
                                    height: size)
    }
}
