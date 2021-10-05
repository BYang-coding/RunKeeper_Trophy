//
//  RecordandVirtualRaceVC.swift
//  RunKeeper Trophy
//
//  Created by Tinker on 2021-09-30.
//

import UIKit

class RecordandVirtualRaceVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
//    var collectinoView: UICollectionView!
    @IBOutlet weak var midView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let achievementValues = AchievementValues()
    let colors = Colors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // CollectionVC Delegate and DataSource
        collectionView.delegate = self;
        collectionView.dataSource = self;
        // Customize Collection View Layout
        self.CustomCollectionViewLayout()
        // Add 3 dots menu button to NavigationBar as Right Item
        self.AddRightNavItem()
        // Do any additional setup after loading the view.
//        initView()
    }
    
//*** Configure Collection View
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusableview:UICollectionReusableView!
        // Section Header
        if kind == UICollectionView.elementKindSectionHeader{
                    reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                withReuseIdentifier: "HeaderView", for: indexPath)
                    // Set Header Title
            let titleLabel = reusableview.viewWithTag(1) as! UILabel
            titleLabel.text = achievementValues.headerTitle[indexPath.section]
            titleLabel.textColor = colors.colorSectionTitle
            
            let activeCounterLabel = reusableview.viewWithTag(2) as! UILabel
            activeCounterLabel.textColor = colors.colorSectionSubTitle
            
            if (indexPath.section == 0){
                let activeNum = self.achievementValues.getActiveNum(dic_title_score: achievementValues.pR_title_score)
                let totalNum = achievementValues.pR_title_score.count
                activeCounterLabel.text = "\(activeNum) of \(totalNum)"
            }else if (indexPath.section == 1){
                let activeNum = self.achievementValues.getActiveNum(dic_title_score: achievementValues.vR_title_score)
                let totalNum = achievementValues.vR_title_score.count
                activeCounterLabel.text = "\(activeNum) of \(totalNum)"
            }
                }
                // Section Footer
        else if kind == UICollectionView.elementKindSectionFooter{
                    reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                withReuseIdentifier: "FooterView", for: indexPath)
                }
        reusableview.backgroundColor = colors.colorSectionBG
                return reusableview
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCollectionViewCell
        if (indexPath.section == 0){
                let pRTitleArray = achievementValues.getPRTitleArray()
                let image = UIImage(named: self.achievementValues.getPRIconNamefromTitle(title: pRTitleArray[indexPath.row]))
                let cropedImage = image?.crop(CGRect(x: ((image?.size.width)! - 91)/2, y: 0, width: 91, height: 95))
                cell.cellImage.contentMode = .scaleAspectFit
                cell.cellImage.image = cropedImage
                cell.titleLabel.text = pRTitleArray[indexPath.row]
                cell.scoreLabel.text = achievementValues.getPRScore(title: pRTitleArray[indexPath.row])
            if (achievementValues.getPRScore(title: pRTitleArray[indexPath.row]) == "Not Yet"){
                cell.contentView.alpha = 0.3
            }else{
                cell.contentView.alpha = 1.0
            }
                
            
        } else if (indexPath.section == 1){
            let vRTitleArray = achievementValues.getVRTitleArray()
            let image = UIImage(named: self.achievementValues.getVRIconNamefromTitle(title: vRTitleArray[indexPath.row]))
            cell.cellImage.contentMode = .scaleAspectFit
            cell.cellImage.image = image
            cell.titleLabel.text = vRTitleArray[indexPath.row]
            cell.scoreLabel.text = achievementValues.getVRScore(title: vRTitleArray[indexPath.row])
            if (achievementValues.getVRScore(title: vRTitleArray[indexPath.row]) == "Not Yet"){
                cell.contentView.alpha = 0.3
            }else{
                cell.contentView.alpha = 1.0
            }
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
            print("index is \(indexPath.row)")
    }

//*** Customize Layout of Collection View
    func CustomCollectionViewLayout(){
        let layout = UICollectionViewFlowLayout()
        let fullWidth = self.view.frame.width
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: fullWidth/4, height: 180)
        layout.headerReferenceSize = CGSize(width: fullWidth, height: 28)
        layout.sectionInset = UIEdgeInsets(top: 28, left: fullWidth*0.18, bottom: 18, right: fullWidth*0.18)
        self.collectionView.collectionViewLayout = layout
    }
    
//*** Customize NavigationBar
    func AddRightNavItem(){
        let MenuBtn = UIButton(frame:CGRect(x: 0, y: 0, width: 18, height: 18))
        MenuBtn.setImage(UIImage(named: "dot_menu_icon"), for: .normal)
        let navBarRightMenuBtn = UIBarButtonItem(customView: MenuBtn)
        self.navigationItem.rightBarButtonItem = navBarRightMenuBtn
    }

}
