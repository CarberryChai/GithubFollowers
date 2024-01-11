//
//  GFAvatarImageView.swift
//  GithubFollowers
//
//  Created by changlin on 2024/1/11.
//

import UIKit

class GFAvatarImageView: UIImageView {
    let placeholderImage = UIImage(named: "avatar-placeholder")!
    let cache = NetworkManager.shared.cache
    let padding: CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    // 为了支持storyboard
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 为了支持storyboard
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(from urlString: String)async {
        // 如果缓存中有图片，就直接从缓存中取
        if let image = cache.object(forKey: NSString(string: urlString)) {
            self.image = image
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        let data = try? await URLSession.shared.data(from: url)
        guard let imageData = data?.0 else { return }
        guard let image = UIImage(data: imageData) else { return }
        cache.setObject(image, forKey: NSString(string: urlString))
    }
}
