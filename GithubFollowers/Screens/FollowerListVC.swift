//
//  FollowerListVC.swift
//  GithubFollowers
//
//  Created by changlin on 2024/1/2.
//

import UIKit

class FollowerListVC: UIViewController {
    var username: String!
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureViewController()
        Task {
            await getFollowers()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

extension FollowerListVC {
    private func getFollowers() async {
        let result = await NetworkManager.shared.getFollowers(for: username, page: 1)
        switch result {
            case .success(let followers):
                print("followers count: \(followers.count)")
            case .failure(let error):
                presentGFAlertOnMainThread(title: "Bad Request", message: error.localizedDescription, buttonTitle: "OK")
        }
    }

    private func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
}
