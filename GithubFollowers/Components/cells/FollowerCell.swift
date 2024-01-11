//
//  FollowerCell.swift
//  GithubFollowers
//
//  Created by changlin on 2024/1/11.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    static let reuseID = "FollowerCell"

    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)

    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public

    func set(follower: Follower) async {
        usernameLabel.text = follower.login
        await avatarImageView.downloadImage(from: follower.avatarUrl)
    }

    // MARK: - Private

    private func configure() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        let padding: CGFloat = 8
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),

            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: padding),
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            // usernameLabel.heightAnchor.constraint(equalToConstant: 20)
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
