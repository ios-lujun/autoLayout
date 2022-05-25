//
//  ViewController.swift
//  autolayout
//
//  Created by lujun on 2022/5/24.
//

import UIKit

extension UIColor {
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}


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
    
    private let previousButton: UIButton = {
        let previousButton = UIButton(type: .system)
        previousButton.setTitle("上一页", for: .normal)
        previousButton.setTitleColor(.gray, for: .normal)
        previousButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        return previousButton
    }()
    
    private  let nextButton: UIButton = {
        let nextButton = UIButton(type: .system)
        nextButton.setTitle("下一页", for: .normal)
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        nextButton.setTitleColor(.mainPink, for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        return nextButton
    }()
    
   private let page: UIPageControl = {
        let page = UIPageControl()
        page.currentPage = 0
        page.numberOfPages = 4
        page.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        page.currentPageIndicatorTintColor = .mainPink
        page.allowsContinuousInteraction = false
        page.translatesAutoresizingMaskIntoConstraints = false
        return page
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        view.addSubview(textView)
        addConstraints()
        addComponseButtons()
    }
    private func addComponseButtons(){
        let buttonControlsStackView = UIStackView(arrangedSubviews: [previousButton,page,nextButton])
        buttonControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonControlsStackView.distribution = .fillEqually
        view.addSubview(buttonControlsStackView)
        
        NSLayoutConstraint.activate([
            buttonControlsStackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            buttonControlsStackView.rightAnchor.constraint(equalTo: view.rightAnchor),
            buttonControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonControlsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


extension ViewController{
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
