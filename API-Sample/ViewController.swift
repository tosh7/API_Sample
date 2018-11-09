//
//  ViewController.swift
//  API-Sample
//
//  Created by dev室 インターン4 on 2018/11/09.
//  Copyright © 2018年 dev室 インターン4. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    var parametor = API_Pram()
    var apiModel = APIModel()

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiModel.doSearch(parametor.apiPram.urlEncodedStringInSwift())
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell!.textLabel?.text = "temporary"
        
        return cell!
    }
}
