//
//  Image+Crop.swift
//  RunKeeper Trophy
//
//  Created by Tinker on 2021-10-03.
//

import Foundation
import UIKit

    extension UIImage {
        func crop(_ rect: CGRect) -> UIImage? {
            var newRect = rect
            newRect.origin.x *= scale
            newRect.origin.y *= scale
            newRect.size.width *= scale
            newRect.size.height *= scale
            guard let imageRef = self.cgImage?.cropping(to: newRect) else { return nil }
            return UIImage(cgImage: imageRef, scale: scale, orientation: imageOrientation)
        }
        
        func resize(_ size: CGSize) -> UIImage? {
            UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
            self.draw(in: CGRect(origin: .zero, size: size))
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return resizedImage
        }
        
        func scaleToFitAtCenter(size: CGSize) -> UIImage? {
            let scaleW_H = size.width / size.height
            let selfScaleW_H = self.size.width / self.size.height
            
            if selfScaleW_H > scaleW_H {
                let w = self.size.height * scaleW_H
                let h = self.size.height
                let x = (self.size.width - w) / 2.0
                let y: CGFloat = 0
                return self.crop(CGRect(x: x, y: y, width: w, height: h))?.resize(size)
            } else {
                let w = self.size.width
                let h = self.size.width / scaleW_H
                let x: CGFloat = 0
                let y = (self.size.height - h) / 2.0
                return self.crop(CGRect(x: x, y: y, width: w, height: h))?.resize(size)
            }
        }
    }
    


