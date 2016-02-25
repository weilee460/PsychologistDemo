//
//  ViewController.swift
//  PsychologistDemo
//
//  Created by ying on 16/2/25.
//  Copyright © 2016年 ying. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController
{

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var destination = segue.destinationViewController as? UIViewController
        
        if let navcon = destination as? UINavigationController
        {
            destination = navcon.visibleViewController
        }
        
        if let hvc = destination as? HappinessViewController
        {
            
            if let identifier = segue.identifier
            {
                switch identifier {
                    case "sad": hvc.happiness = 0
                    case "happy": hvc.happiness = 100
                    default: hvc.happiness = 50
                }
            }
        }
    }
    
}

