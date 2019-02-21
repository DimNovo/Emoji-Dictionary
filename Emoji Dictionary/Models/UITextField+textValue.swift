//
//  UITextField+textValue.swift
//  Emoji Dictionary
//
//  Created by Dmitry Novosyolov on 21/02/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import UIKit

extension UITextField {
    
    var textValue: String {
        return self.text ?? ""
    }
}
