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
        .init(imageName: "bear_first", headerText: "加入我们，游戏和乐趣", bodyText: "你准备好迎接大量的乐趣了吗？不要再等了！我们希望很快能在我们的商店见到您."),
        .init(imageName: "heart_second", headerText: "订阅并获得我们日常活动的优惠券", bodyText: "当我们在我们的网站上宣布节省时，立即得到通知。确保也向我们提供您的任何反馈."),
        .init(imageName: "leaf_third", headerText: "VIP会员专属服务.", bodyText: ""),
    ]
    
    private lazy var  previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("上一页", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlerPrevButton), for: .touchUpInside)
        return button
    }()
    
       private lazy var  nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("下一页", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlerNextButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func handlerPrevButton(){
        
            self.nextButton.isUserInteractionEnabled =  self.page.currentPage == (self.pages.count) ? false : true
            
            self.previousButton.isUserInteractionEnabled = self.page.currentPage == 1 ? false : true
        let index = max(self.page.currentPage - 1,0)
        let indexPath = IndexPath(item: index, section: 0)
        self.page.currentPage = index
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func handlerNextButton(){
        self.nextButton.isUserInteractionEnabled =  self.page.currentPage == (self.pages.count) ? false : true
        
        self.previousButton.isUserInteractionEnabled = self.page.currentPage == 1 ? false : true
        
        let index = min(self.page.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: index, section: 0)
        self.page.currentPage = index
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
   private lazy var page: UIPageControl = {
        let page = UIPageControl()
        page.currentPage = 0
        page.numberOfPages = pages.count
        page.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        page.currentPageIndicatorTintColor = .mainPink
        page.allowsContinuousInteraction = false
        page.translatesAutoresizingMaskIntoConstraints = false
        return page
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.backgroundColor = .systemBackground
        
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: PageCell.cellId)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        addComponseButtons()
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
    
    //MARK: - 代理
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        self.page.currentPage = Int(x / view.frame.width)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
       coordinator.animate { _ in
            self.collectionViewLayout.invalidateLayout()
            if self.page.currentPage == 0 {
                self.collectionView.contentOffset = .zero
            }else{
                let indexPath = IndexPath(item: self.page.currentPage, section: 0)
                self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        } completion: { _ in
            //123
        }
    }
}



extension SwipingController{
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
