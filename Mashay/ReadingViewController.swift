//
//  ReadingViewController.swift
//  Mashay
//
//  Created by AliMac on 10/25/17.
//  Copyright © 2017 TurathAlanbiaa. All rights reserved.
//

import UIKit

class ReadingViewController: UIViewController {

    @IBOutlet weak var paragraph: UITextView!
    
    override func viewDidAppear(_ animated: Bool)
    {
        paragraph.scrollRangeToVisible(NSRange(location:0, length:0))
    }

    @IBAction func fontDown(_ sender: Any)
    {
        if Float((paragraph.font?.pointSize)!) <= 12.0
        {
            return;
        }
        
        paragraph.font = paragraph.font?.withSize(CGFloat(Float((paragraph.font?.pointSize)!) - 2.0))
        
    }
    @IBAction func fontUp(_ sender: Any)
    {
        if Float((paragraph.font?.pointSize)!) >= 28.0
        {
            return;
        }
        
        paragraph.font = paragraph.font?.withSize(CGFloat(Float((paragraph.font?.pointSize)!) + 2.0))
    }
}
