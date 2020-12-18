//
//  ListViewController.swift
//  Sigor
//
//  Created by 이다영 on 2020/12/15.
//

import UIKit

class ListViewController: UIViewController {
    
    private let data: [String]
    
    init(data: [String]) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
}
