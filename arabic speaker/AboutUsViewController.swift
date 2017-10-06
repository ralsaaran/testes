//
//  AboutUsViewController.swift
//  arabic speaker
//
//  Created by Rawan Alsaaran on 12/15/1438 AH.
//  Copyright © 1438 Rawan Alsaaran. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)
class AboutUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func GitHupAccount(_ sender: UIButton) {
        let url = URL(string: "https://github.com/ralsaaran")
        UIApplication.shared.canOpenURL(url!)
        UIApplication.shared.open(url! , options : [:] , completionHandler : nil)
    }
  
    @IBAction func twitterAccount(_ sender: UIButton) {
        let url = URL(string: "https://twitter.com/ralsaaran")
        UIApplication.shared.canOpenURL(url!)
        UIApplication.shared.open(url! , options : [:] , completionHandler : nil)
    }
    @IBAction func EmailAdress(_ sender: UIButton) {
        let url = URL(string: "mailto:r.alsaaran@hotmail.com")
        UIApplication.shared.canOpenURL(url!)
        UIApplication.shared.open(url! , options : [:] , completionHandler : nil)

    }

}
