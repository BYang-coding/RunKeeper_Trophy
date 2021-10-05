//
//  CustomNavBarVC.swift
//  RunKeeper Trophy
//
//  Created by Tinker on 2021-10-04.
//

import Foundation
import UIKit

class CustomNavBarVC : UINavigationController{
    override func viewDidLoad() {
        super.viewDidLoad()
        let colors = Colors()
        self.navigationBar.backgroundColor = colors.colorNavBG
        self.navigationBar.tintColor = colors.colorNavTitle
//        let visualEffectView   = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
//        visualEffectView.frame = (self.navigationBar.bounds.insetBy(dx: 0, dy: -40).offsetBy(dx: 0, dy: -40))
//        self.navigationBar.isTranslucent = true
//        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationBar.addSubview(visualEffectView)
//        self.navigationBar.sendSubviewToBack(visualEffectView)
    }
}
