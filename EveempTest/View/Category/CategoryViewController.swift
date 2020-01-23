//
//  CategoryViewController.swift
//  EveempTest
//
//  Created by Nico Prasasty S on 20/01/20.
//  Copyright © 2020 Nico Prasasty Sembiring. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let categoryMV = CategoryMV()
    let categoryCellID: String = "category"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView()
        navigationItem.title = "Category"
    }
    fileprivate func setupTableView(){
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: categoryCellID)
        tableView.delegate = self
        tableView.dataSource = self
    }
}
extension CategoryViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryMV.categoryCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: categoryCellID, for: indexPath)
        cell.textLabel?.text = categoryMV.items[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let source = SourceViewController(nibName: String(describing: SourceViewController.self), bundle: nil)
        source.navigationItem.title = categoryMV.items[indexPath.row]
        navigationController?.pushViewController(source, animated: true)
    }
    
}
