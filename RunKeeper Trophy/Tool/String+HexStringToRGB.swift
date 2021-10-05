//
//  UIColor+ColorHexString.swift
//  RunKeeper Trophy
//
//  Created by Tinker on 2021-10-03.
//

import Foundation
import UIKit

extension String{
    /// Convert Hex to UIColor
    /// - Returns: UIColor
    public func toUIColor() -> UIColor {
      
       var cString = self.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
       let length = (cString as NSString).length

        if (length < 6 || length > 7 || (!cString.hasPrefix("#") && length == 7)){
           return UIColor.white
        }

        if cString.hasPrefix("#"){
           cString = (cString as NSString).substring(from: 1)
        }
        
        var range = NSRange()
        range.location = 0
        range.length = 2
        
        let rString = (cString as NSString).substring(with: range)
        
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        var r:UInt32 = 0,g:UInt32 = 0,b:UInt32 = 0

        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)

        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
    }
}
