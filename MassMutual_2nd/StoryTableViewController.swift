//
//  StoryTableViewController.swift
//  MassMutual_2nd
//
//  Created by Tiancong Gu on 3/29/16.
//  Copyright © 2016 Tiancong Gu. All rights reserved.
//
/*************************
 realize table view, parse the JSON but don't know how to call them outside the closure

 **************************/

import UIKit
import Alamofire
import SwiftyJSON

class StoryTableViewController: UITableViewController {
    
    // MARK: Intialization
    
    // MARK: Properties
    var json: AnyObject = 0
    var stories = [Story]()
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON()
        // Load the sample data.
        loadSampleStories()

    }
    
    func downloadJSON(){
        //var json: AnyObject = 0
        Alamofire.request(.GET, "http://api.nytimes.com/svc/movies/v2/reviews/search?api-key=b05c090ae54bc65d1921373a6717f048:14:74255139").responseJSON
        {
            response in
            self.json = response.result.value!
            print("JSON: \(self.json)")
            if let value = JSON(self.json)["results"][0]["headline"].string {
                print(value)
            }
        }

        //return json
    }
    
    func loadSampleStories() {
        
        
                let photo1 = UIImage(named: "Image")!
                let story1 = Story(name: "Article1", photo: photo1, rating: 1)!
                
                let photo2 = UIImage(named: "Image")!
                let story2 = Story(name: "Article2", photo: photo2, rating: 1)!
                
                let photo3 = UIImage(named: "Image")!
                let story3 = Story(name: "Article3", photo: photo3, rating: 0)!
                
                stories += [story1, story2, story3]


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stories.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "StoryTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! StoryTableViewCell
        
        // Fetches the appropriate sory for the data source layout.
        let story = stories[indexPath.row]
        
        // Configure the cell...
        cell.nameLabel.text = story.name
        cell.photoImageView.image = story.photo
        cell.ratingControl.rating = story.rating

        return cell
    }
    
    //右侧取消按钮事件
         func searchBarCancelButtonClicked(searchBar: UISearchBar){
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
