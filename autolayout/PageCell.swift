//
//  PageCell.swift
//  autolayout
//
//  Created by lujun on 2022/5/25.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    static let cellId = "SwipingController"
    
//    var page:: Page? {
//        didSet{
//
//        }
//    }
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "bear_first"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
       /* let mutableAttributedString = NSMutableAttributedString(string: "加入我们，游戏和乐趣", attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 18)])
        mutableAttributedString.append(.init(string: "\n\n\n你准备好迎接大量的乐趣了吗？不要再等了！我们希望很快能在我们的商店见到您.", attributes: [NSAttributedString.Key.foregroundColor:UIColor.gray,NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 12)]))
        textView.attributedText = mutableAttributedString*/
        textView.isEditable = false
        textView.isScrollEnabled = false
//        textView.textAlignment = .center
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        contentView.backgroundColor = .yellow
        
        setupView()
        
    }
    
    private func setupView(){
        contentView.addSubview(imageView)
        contentView.addSubview(textView)
    
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configuare(with pageModel: Page?){
        guard let pageModel = pageModel else {
            return
        }
        self.imageView.image = UIImage(named: pageModel.imageName)
        
        let mutableAttributedString = NSMutableAttributedString(string:pageModel.headerText, attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 18)])
        mutableAttributedString.append(.init(string: "\n\n\n\(pageModel.bodyText)", attributes: [NSAttributedString.Key.foregroundColor:UIColor.gray,NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 13)]))
        
        self.textView.attributedText = mutableAttributedString
        self.textView.textAlignment = .center
    }
    
}



extension PageCell{
    private func addConstraints(){
        let topImageViewContainer = UIView.init()
        topImageViewContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(topImageViewContainer)
        NSLayoutConstraint.activate([
            topImageViewContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            topImageViewContainer.leftAnchor.constraint(equalTo: leftAnchor),
            topImageViewContainer.rightAnchor.constraint(equalTo: rightAnchor),
            topImageViewContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
            
        ])
        
        topImageViewContainer.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: topImageViewContainer.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: topImageViewContainer.centerYAnchor),
            imageView.heightAnchor.constraint(equalTo: topImageViewContainer.heightAnchor, multiplier: 0.5)
        ])

        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: topImageViewContainer.bottomAnchor),
            textView.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 24),
            textView.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -24),
            textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
