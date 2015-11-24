//
//  ViewController.swift
//  FriendBookPlus
//
//  Created by Wade Sellers on 10/16/15.
//  Copyright © 2015 Apps by Wade. All rights reserved.
//

import UIKit

class FriendListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var friends = [Friend]()

    override func viewDidLoad() {
        super.viewDidLoad()

        createFriends()

        self.tableView.dataSource = self
        self.tableView.delegate = self

    }

    func createFriends() {
        let elaine = Friend()
        elaine.name = "Elaine"
        elaine.phoneNumber = "503-534-7723"
        elaine.birthday = "September 4th"
        elaine.picture = UIImage(named: "elaine")!
        self.friends.append(elaine)

        let george = Friend()
        george.name = "George"
        george.phoneNumber = "457-556-5455"
        george.birthday = "March 14th"
        george.picture = UIImage(named: "george")!
        self.friends.append(george)

        let kramer = Friend()
        kramer.name = "Kramer"
        kramer.phoneNumber = "232-123-5555"
        kramer.birthday = "April 24th"
        kramer.picture = UIImage(named: "kramer")!
        self.friends.append(kramer)

        let jerry = Friend()
        jerry.name = "Jerry"
        jerry.phoneNumber = "567-876-9999"
        jerry.birthday = "October 31st"
        jerry.picture = UIImage(named: "jerry")!
        self.friends.append(jerry)

    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        let friend = self.friends[indexPath.row]
        cell.textLabel!.text = friend.name
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let friend = self.friends[indexPath.row]
        self.performSegueWithIdentifier("detailSegue", sender: friend)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailVC = segue.destinationViewController as! FriendDetailViewController
        detailVC.friend = sender as! Friend
    }
}

