//
//  MainPageViewController.swift
//  arabic speaker
//
//  Created by Rawan Alsaaran on 1/15/1439 AH.
//  Copyright © 1439 Rawan Alsaaran. All rights reserved.
//

import UIKit

class MainPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    lazy var ListViewControllar : [UIViewController] = {
       let SB = UIStoryboard(name: "Main", bundle: nil)
        
        let vc1 = SB.instantiateViewController(withIdentifier: "OnePage")
        let vc2 = SB.instantiateViewController(withIdentifier: "TwoPage")
        let vc3 = SB.instantiateViewController(withIdentifier: "ThreePage")
        let vc4 = SB.instantiateViewController(withIdentifier: "FourPage")
        
        return [vc1, vc2, vc3, vc4]
    }()
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let VCIndex = ListViewControllar.index(of: viewController) else { return nil }
        
        let previousIndex = VCIndex - 1
        
        guard previousIndex >= 0 else { return nil }
        
        guard ListViewControllar.count > previousIndex else { return nil }
        
        return ListViewControllar[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let VCIndex = ListViewControllar.index(of: viewController) else { return nil }
        
        let NextIndex = VCIndex + 1
        
        guard ListViewControllar.count > NextIndex else { return nil }
        
        guard ListViewControllar.count != NextIndex else { return nil }
        
        return ListViewControllar[NextIndex]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.dataSource = self
        if let FirstViewControllar = ListViewControllar.first{
            self.setViewControllers([FirstViewControllar], direction: .forward, animated: true, completion: nil)
        }
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

}
