//
//  FavTableViewController.swift
//  arabic speaker
//
//  Created by Rawan Alsaaran on 12/16/1438 AH.
//  Copyright © 1438 Rawan Alsaaran. All rights reserved.
//

import UIKit

struct cellData {
    var textlabel : String 
    
    
}
var arrayOfCellData = [cellData]()

class FavTableViewController: UITableViewController, UISearchBarDelegate {

    
    var item = 0
    
    var filterData = [cellData]()
    
    var isSearching = false
    
    @IBAction func refresh(_ sender: Any) {
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()

    }
    
    
    func reloadFavTableView(animation : Bool) {
        self.tableView.reloadData()
    }
    
    func ButtonRemoveCell(sender : UIButton)  {
        sender.setImage(#imageLiteral(resourceName: "Starg"), for: .normal)
        //arrayOfCellData.removeAtIndex(item) // dataSource being your dataSource array
        //self.tableView.deleteRowsAtIndexPaths([NSIndexPath(forItem: item, inSection: 0) as IndexPath], withRowAnimation: nil)
        //self.tableview.reloadData()
       // arrayOfCellData.remove(at: IndexCell)
        
        //self.tableView.reloadData()
       // print(IndexCell)

    }

    func ButtonShareCell(sender : UIButton ) {
        sender.setImage(#imageLiteral(resourceName: "Sharefull"), for: .normal)
        let activityVC = UIActivityViewController(activityItems: [arrayOfCellData[sender.tag].textlabel], applicationActivities: [])
        activityVC.popoverPresentationController?.sourceView = self.view

        self.present(activityVC, animated: true, completion: nil)
        sender.setImage(#imageLiteral(resourceName: "Share"), for: .normal)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayOfCellData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        
//        if indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 4 {
//            let cellfa = Bundle.main.loadNibNamed("FavTableViewCell2", owner: self, options: nil)?.first as! FavTableViewCell2
//            cellfa.outputlabelFav2.text = arrayOfCellData[indexPath.row].textlabel
//             return cellfa
//        }else{
        
            let cell = Bundle.main.loadNibNamed("favorite", owner: self, options: nil)?.first as! favorite
            cell.outputLabel.text = arrayOfCellData[indexPath.row].textlabel
       // print(indexPath.row)
                if (indexPath.row % 2 != 0) {
                    cell.backgroundColor = UIColor.white
                }else{
                    cell.backgroundColor = UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)
                }
        var IndexCell = indexPath.row
            print(IndexCell)
            cell.RemoveCellFav.tag = indexPath.row
        cell.RemoveCellFav.addTarget(self, action: #selector(self.ButtonRemoveCell(sender:)), for: .touchUpInside)
            cell.ShareCellFav.tag = indexPath.row
            cell.ShareCellFav.addTarget(self, action: #selector(self.ButtonShareCell(sender:)), for: .touchUpInside)
            return cell
//        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 109
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if (indexPath.row % 2 == 0){
//            cell.backgroundColor = UIColor.white
//        }else{
//            cell.backgroundColor = UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)
//        }
//    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
