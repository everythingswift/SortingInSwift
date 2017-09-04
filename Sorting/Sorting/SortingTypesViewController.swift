//
//  ViewController.swift
//  Sorting
//
//  Created by SRIDHAR SANAPALA on 9/4/17.
//  Copyright © 2017 Everything Swift. All rights reserved.
//

import UIKit

class SortingTypesViewController: UITableViewController {

    let sortingTypes = ["Selection Sort", "Insertion Sort", "Bubble Sort", "Merge Sort", "Quick Sort"]
    var currentSortingType:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "Sorting"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - TableViewDataSource
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return sortingTypes.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SORTTYPE_CELL", for: indexPath)
        cell.textLabel?.text = sortingTypes[indexPath.row]
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        currentSortingType = indexPath.row
        let mainSB = UIStoryboard(name: "Main", bundle: nil)
        let sortingDetailVC = mainSB.instantiateViewController(withIdentifier: "SORTING_DETAIL_VC") as! SortingDetailViewController
        sortingDetailVC.titleString = sortingTypes[currentSortingType]
        self.navigationController?.pushViewController(sortingDetailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

