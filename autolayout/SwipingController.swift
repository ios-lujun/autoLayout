//
//  SwipingController.swift
//  autolayout
//
//  Created by lujun on 2022/5/25.
//

import UIKit

struct Page{
    var imageName,headerText,bodyText: String
}

class SwipingController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
   
    var pages: [Page] = [
        .init(imageName: "bear_first", headerText: "加入我们，游戏和乐趣", bodyText: "你准备好迎接大量的乐趣了吗？不要再等了！我们希望很快能在我们的商店见到您."),
        .init(imageName: "heart_second", headerText: "订阅并获得我们日常活动的优惠券", bodyText: "当我们在我们的网站上宣布节省时，立即得到通知。确保也向我们提供您的任何反馈."),
        .init(imageName: "leaf_third", headerText: "VIP会员专属服务.", bodyText: ""),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.backgroundColor = .systemBackground
        
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: PageCell.cellId)
        collectionView.isPagingEnabled = true
//        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat { 0 }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { pages.count }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageCell.cellId, for: indexPath) as! PageCell
        cell.configuare(with: pages[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width, height: view.frame.height)
    }
    

}


