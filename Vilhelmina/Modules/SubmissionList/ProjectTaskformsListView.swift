//
//  ProjectTaskformsList.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 11/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation
import UIKit

protocol ProjectTaskformsListViewDelegate{
    func didSelect(item:ProjectTaskformItem)
}

class ProjectTaskformsListView: UIViewController{
    var delegate: SubmissionListView?
    var projectTaskforms: [ProjectTaskformItem] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "TaskformCell")
    }
}

extension ProjectTaskformsListView: UITableViewDataSource{
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("TaskformCell", forIndexPath: indexPath)
        cell.textLabel?.text = projectTaskforms[indexPath.row].title
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectTaskforms.count
    }
}

extension ProjectTaskformsListView: UITableViewDelegate{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        delegate?.didSelect(projectTaskforms[indexPath.row])
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}