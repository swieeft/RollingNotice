//
//  ViewController.swift
//  RollingNotice
//
//  Created by GilNam Park on 2021/06/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var nextRow = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let _ = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
            if self.nextRow >= 6 {
                self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
                self.nextRow = 1
            }
            
            self.tableView.scrollToRow(at: IndexPath(row: self.nextRow, section: 0), at: .top, animated: true)
            self.nextRow += 1
            
            
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Cell \(indexPath.row)"
        
        if indexPath.row == 5 {
            cell.textLabel?.text = "Cell 0"
        }
        
        return cell
    }
}
