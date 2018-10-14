//
//  ViewEvents.swift
//  EventByte
//
//  Created by Grace Choe on 10/13/18.
//  Copyright © 2018 Grace Choe. All rights reserved.
//


import UIKit

class ViewEvents: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeModelProtocol {
    
    
    
    var feedItems: NSArray = NSArray()
    var selectedEvent : EventModel = EventModel()
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
        // Do any additional setup after loading the view.
    }
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.listTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Retrieve cell
//        let cellIdentifier: String = "BasicCell"
       /* let myCell: UITableViewCell = (tableView.dequeueReusableCell(withIdentifier: cellIdentifier))!*/
        
//        let myCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! UITableViewCell
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "BasicCell")
//        cell.textlabel?.text = list[indexPath.row]
        let item: EventModel = feedItems[indexPath.row] as! EventModel
        cell.textLabel!.text = item.eventName! + ": " + item.eventDateTime! + " @ " + item.eventLocation!
        cell.textLabel?.numberOfLines = 2
        return (cell)
//        // Get the location to be shown
//        let item: EventModel = feedItems[indexPath.row] as! EventModel
//        // Get references to labels of cell
//        myCell.textLabel!.text = item.eventName
        
//        return myCell
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
