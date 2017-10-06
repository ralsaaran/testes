//
//  SecondViewController.swift
//  arabic speaker
//
//  Created by Rawan Alsaaran on 10/21/1438 AH.
//  Copyright © 1438 Rawan Alsaaran. All rights reserved.
//

import UIKit

class SecondViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func shareLinkApp(_ sender: Any) {
        let textSHARE = "https://itunes.apple.com/us/app/xcode/id497799835?mt=12"
        
        let activityVC = UIActivityViewController(activityItems: [textSHARE], applicationActivities: [])
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
        
    }
    

}

