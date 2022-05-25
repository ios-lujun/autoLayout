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
        textView.font = .systemFont(ofSize: 16,weight: .bold)
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.text = "加入我们，游戏和乐趣"
        textView.backgroundColor = .yellow
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
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        ])
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            textView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 0),
            textView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: 0),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }


}

