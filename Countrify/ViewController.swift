//
//  ViewController.swift
//  Countrify
//
//  Created by Eldar Tutnjic on 04/04/2019.
//  Copyright © 2019 eldartutnjic. All rights reserved.
//

import UIKit

struct Country: Decodable {
    let name: String
    let capital: String
    let region: String
    let flag: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {



    @IBOutlet var tableView: UITableView!
    var ctryArray = [Country]()
    

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        tableView.dataSource = self
        tableView.delegate = self
    }

    func getData() {
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!) {(data, response, error) in
            
            do {
                if error == nil {
                    self.ctryArray = try JSONDecoder().decode([Country].self, from: data!)
                    
                    for mainArr in self.ctryArray{
                        print(mainArr.name,":",mainArr.capital,":", mainArr.region)
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                }
            }catch{
                print("We got an error")
            }
            
            
            }.resume()
    }
    
    

    
    //TableView
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ctryArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell

        cell.countryNameLabel.text = ctryArray[indexPath.row].name
        cell.countryCapitalLabel.text = ctryArray[indexPath.row].capital

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail: DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailViewController
       
        
        self.navigationController?.pushViewController(detail, animated: true)
        
    }
}

