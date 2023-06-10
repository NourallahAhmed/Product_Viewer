//
//  StringExtension.swift
//  Product_Viewer
//
//  Created by NourAllah on 10/06/2023.
//

import Foundation
import SwiftUI

extension String {
    func applyHTMLTags() -> Text {
        let stringArray = self.components(separatedBy: "<br />")
        
        let text = Text(stringArray[0])
        var result = text
        
        for i in 1..<stringArray.count {
            let string = stringArray[i]
            
            if string.hasPrefix("<b>") && string.hasSuffix("</b>") {
                let boldString = string.replacingOccurrences(of: "<b>", with: "").replacingOccurrences(of: "</b>", with: "")
                result = result + Text("\n" + boldString).bold()
            } else {
                result = result + Text("\n" + string)
            }
        }
        
        return result
    }
}
