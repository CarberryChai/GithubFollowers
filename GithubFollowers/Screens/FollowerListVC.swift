//
//  FollowerListVC.swift
//  GithubFollowers
//
//  Created by changlin on 2024/1/2.
//

import UIKit

class FollowerListVC: UIViewController {
    var username: String!

    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        Task {
            let result = await NetworkManager.shared.getFollowers(for: username, page: 1)
            switch result {
                case .success(let followers):
                    print("followers count: \(followers.count)")
                case .failure(let error):
                    self.presentGFAlertOnMainThread(title: "Bad Request", message: error.localizedDescription, buttonTitle: "OK")
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
