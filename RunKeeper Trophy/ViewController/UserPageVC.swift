//
//  UserPageVC.swift
//  RunKeeper Trophy
//
//  Created by Tinker on 2021-09-30.
//

import Foundation
import UIKit

class UserPageVC: UIViewController{
    
    @IBOutlet weak var achievementBtn: UIButton!
    
    let colors = Colors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        achievementBtn.backgroundColor = colors.colorNavBG
        achievementBtn.tintColor = colors.colorNavTitle
    }
    
    @IBAction func achievementBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "GoToAchievementPage", sender: self)
    }
}
