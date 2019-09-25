//
//  ViewController.swift
//  MishipayProfile
//
//  Created by nowfal@weavedin.com on 09/25/2019.
//  Copyright (c) 2019 nowfal@weavedin.com. All rights reserved.
//

import UIKit
import MishipayProfile

class ViewController: UIViewController {
    var profiles = [Profile]()
    var refreshControl = UIRefreshControl()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(doSomething), for: .valueChanged)

        tableView.addSubview(refreshControl) // not required when using UITableViewController
    }
    
    @objc func doSomething(refreshControl: UIRefreshControl) {
        // Public method for getting profile details
        profiles = MP().getUserDetails()
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addProfile(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "MishipayUserProfile", bundle: Bundle(for: MishipayProfileViewController.self) ).instantiateViewController(withIdentifier: "MishipayProfileViewController") as? MishipayProfileViewController
        vc!.delegate = self
        present(vc!, animated: true, completion: nil)
    }

}

extension ViewController : AddProfileDelegate {
    func profileAdded(profile: Profile) {
        profiles.append(profile)
        tableView.reloadData()
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell") as! ProfileTableViewCell
        cell.configure(profile: profiles[indexPath.row])
        return cell
    }
}
