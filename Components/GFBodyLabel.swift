//
//  GFBodyLabel.swift
//  GithubFollowers
//
//  Created by changlin on 2024/1/10.
//

import UIKit

class GFBodyLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(textAlignment: NSTextAlignment) {
        self.init(frame: .zero)

        self.textAlignment = textAlignment
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false

        textColor = .secondaryLabel // secondaryLabel: 系统默认的浅灰色
        font = UIFont.preferredFont(forTextStyle: .body) // body: 系统默认的字体大小
        adjustsFontSizeToFitWidth = true // adjustsFontSizeToFitWidth: 自动调整字体大小以适应宽度
        minimumScaleFactor = 0.75 // minimumScaleFactor: 最小缩放因子
        lineBreakMode = .byWordWrapping // lineBreakMode: 自动换行
    }
}
