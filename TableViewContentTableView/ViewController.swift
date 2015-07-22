//
//  ViewController.swift
//  TableViewContentTableView
//
//  Created by vichhai on 7/3/15.
//  Copyright (c) 2015 kan vichhai. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var mainTableView: UITableView!
    var rowHeight : CGFloat?
    var innerTableView : UITableView?
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        rowHeight = 60;
        mainTableView.tag = 1000
        mainTableView.backgroundColor = UIColor.grayColor()
        innerTableView = UITableView(frame: CGRectMake(0, 0, self.view.frame.width, 200), style: UITableViewStyle.Plain)
        innerTableView?.tag = 1001
        innerTableView?.delegate = self
        innerTableView?.dataSource = self
        innerTableView?.backgroundColor = UIColor.redColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell?
        
        if tableView.tag == 1000 {
            let cellIdentifier : String = "Cell"
            if cell == nil {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
                cell?.backgroundColor = UIColor.clearColor()
                cell?.textLabel?.text = "hello \(indexPath.row)"
            }
            
            if indexPath.row == 1 {
                cell?.contentView.addSubview(innerTableView!)
                rowHeight = innerTableView?.frame.size.height
            }
        }
        
        if tableView.tag == 1001 {
            let cellIdentifier : String = "CellInner"
            if cell == nil {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
                cell?.backgroundColor = UIColor.clearColor()
                cell?.textLabel?.text = "inner table view cell \(indexPath.row)"
            }
            
        }
        
        
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1000 {
            return 5
        }
        return 4
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if tableView.tag == 1000 {
            if indexPath.row == 1 {
                return rowHeight!
            }
            return 60.0
        }
        if tableView.tag == 1001 {
            return 70.0
        }
        return 60.0
    }
    
}

