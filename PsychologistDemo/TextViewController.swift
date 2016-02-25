//
//  TextViewController.swift
//  PsychologistDemo
//
//  Created by ying on 16/2/25.
//  Copyright © 2016年 ying. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
        {
        didSet {
            textView.text = text
        }
    }
    
    var text = "" {
        didSet {
            textView?.text = text
        }
    }
    
    override var preferredContentSize: CGSize {
        get {
            if textView != nil && presentingViewController != nil {
                return textView.sizeThatFits(presentingViewController!.view.bounds.size)
            } else {
                return super.preferredContentSize
            }
        }
        set { super.preferredContentSize = newValue}
    }

}
