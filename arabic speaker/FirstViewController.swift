//
//  FirstViewController.swift
//  arabic speaker
//
//  Created by Rawan Alsaaran on 10/21/1438 AH.
//  Copyright © 1438 Rawan Alsaaran. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController, UITableViewDelegate , UITextFieldDelegate , UITableViewDataSource, UITextViewDelegate {

    //var to input arabic text in first page Home
    var SelectedIndexPath : NSIndexPath?
    
    @IBOutlet var InputTEXT: UITextView!
    @IBOutlet var SpeackerButton: UIButton!
    @IBOutlet var DicrizationButton: UIButton!
    @IBOutlet var FavoratButton: UIButton!
    
    @IBOutlet weak var LastInputTextHome: UITableView!
    
    var lastInputTable = [cellData]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.InputTEXT.delegate = self
        InputTEXT.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        InputTEXT.layer.borderWidth = 1.0;
        InputTEXT.layer.cornerRadius = 10;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lastInputTable.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        //         Configure the cell...
        let cell = Bundle.main.loadNibNamed("LastInputTableViewCell", owner: self, options: nil)?.first as! LastInputTableViewCell
        
        //        cell.mainLbl.text = arrayOfCellData[indexPath.row].textlabel
        cell.outputLabel.text = lastInputTable[indexPath.row].textlabel
        
        return cell
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        InputTEXT.text = lastInputTable[indexPath.row].textlabel
    }
    
    
    //Button use to cancel text from text filed in Home page
    @IBAction func cancelText(_ sender: UIButton) {
        self.InputTEXT.text = nil
        self.SpeackerButton.setImage(#imageLiteral(resourceName: "Speaker"), for: .normal)
        self.DicrizationButton.setImage(#imageLiteral(resourceName: "buttonDicHome"), for: .normal)
        self.FavoratButton.setImage(#imageLiteral(resourceName: "Starg"), for: .normal)
    }

    
    //Button use to add text filed to favorit page
    @IBAction func favorit(_ sender: UIButton) {
        let inputs = InputTEXT.text
        if inputs == nil || inputs == "" {
            alartemptytextFild(titel: "خطاء في الاضافة ", Message: "لم يتم ادخال نص في الحقل ")
        }else{
            sender.setImage(#imageLiteral(resourceName: "Stargfull"), for: .normal)
            let cellFav : cellData! = cellData(textlabel: inputs!)
            if arrayOfCellData.isEmpty {
                arrayOfCellData.append(cellFav)
                lastInputTable.append(cellFav)
                print("array is Empty")
            }else{
                let indexes = arrayOfCellData.count
                arrayOfCellData.insert(cellFav, at: indexes)
                lastInputTable.insert(cellFav, at: indexes)

                arrayOfCellData[indexes] = cellFav
                lastInputTable[indexes] = cellFav
                print("index",indexes)
            }
        }
        LastInputTextHome.reloadData()
        
    }
    
    
    
    // button to share text with friends
    @IBAction func ShareText(_ sender: UIButton) {
        let textSHARE = InputTEXT.text
        if textSHARE == nil || textSHARE == ""{
            alartemptytextFild(titel: "خطاء في المشاركة", Message: "لم يتم ادخال نص في الحقل")
            
        }else{
            sender.setImage(#imageLiteral(resourceName: "Sharefull") , for: .normal)
            let activityVC = UIActivityViewController(activityItems: [textSHARE], applicationActivities: [])
            activityVC.popoverPresentationController?.sourceView = self.view
        
            self.present(activityVC, animated: true, completion: nil)
        }
        sender.setImage(#imageLiteral(resourceName: "Share"), for: .normal)

    }
    
    
    
    //Hide keybord when user toutch outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    //press return key to Hide Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        InputTEXT.resignFirstResponder()
        return (true)
    }
    
    
    
    //Function to create Alart window
    func alartemptytextFild (titel : String , Message : String){
        
            let alert = UIAlertController(title: titel, message: Message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "الغاء", style: .default, handler: { (Action) in
                alert.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
        

}

