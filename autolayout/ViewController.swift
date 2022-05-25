//
//  ViewController.swift
//  autolayout
//
//  Created by lujun on 2022/5/24.
//

import UIKit

class ViewController: UIViewController {

    let imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "bear_first"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        let mutableAttributedString = NSMutableAttributedString(string: "加入我们，游戏和乐趣", attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 18)])
        mutableAttributedString.append(.init(string: "\n\n\n你准备好迎接大量的乐趣了吗？不要再等了！我们希望很快能在我们的商店见到您.", attributes: [NSAttributedString.Key.foregroundColor:UIColor.gray,NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 12)]))
        textView.attributedText = mutableAttributedString
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .center
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        view.addSubview(textView)
       addConstraints()
        
    }
    private func addConstraints(){
        let topImageViewContainer = UIView.init()
        topImageViewContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topImageViewContainer)
        NSLayoutConstraint.activate([
            topImageViewContainer.topAnchor.constraint(equalTo: view.topAnchor),
            topImageViewContainer.leftAnchor.constraint(equalTo: view.leftAnchor),
            topImageViewContainer.rightAnchor.constraint(equalTo: view.rightAnchor),
            topImageViewContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
            
        ])
        
        topImageViewContainer.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: topImageViewContainer.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: topImageViewContainer.centerYAnchor),
            imageView.heightAnchor.constraint(equalTo: topImageViewContainer.heightAnchor, multiplier: 0.5)
        ])

        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: topImageViewContainer.bottomAnchor),
            textView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 24),
            textView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -24),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }


}

