//
//  ListTableViewController.swift
//  Weather
//
//  Created by Алекс Смык on 29.07.22.
//

import UIKit


class ListTableViewController: UITableViewController {

    let emptyCity = Weather()
    
    var citiesArray = [Weather]()
    var filterCityArray = [Weather]()
    
    var nameCitiesArray = ["Владивосток", "Минск", "Челябинск", "Санкт-Петербург", "Уфа", "Екатеринбург"]
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else {
            return false
        }
        return text.isEmpty
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if citiesArray.isEmpty {
            citiesArray = Array(repeating: emptyCity, count: nameCitiesArray.count)
        }
        addCities()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    @IBAction func AddCityButtonPressed(_ sender: Any) {
        alertAddCity(name: "Город", placeholder: "Введите название города") { [self] city in
            self.nameCitiesArray.append(city)
            self.citiesArray.append(self.emptyCity)
            addCities()
        }
    }
    
    
    func addCities() {
        getCityWeather(citiesArray: self.nameCitiesArray) { index, weather in
            self.citiesArray[index] = weather
            self.citiesArray[index].name = self.nameCitiesArray[index]
            print(self.citiesArray)
            
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filterCityArray.count
        }
        return citiesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ListCell

        var weather = Weather()
        
        if isFiltering {
            weather = filterCityArray[indexPath.row]
        } else {
            weather = citiesArray[indexPath.row]
        }
        
        cell.configure(weather: weather)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { (_, _, completionHandler) in
            let deleteRow = self.nameCitiesArray[indexPath.row]
            if let index = self.nameCitiesArray.firstIndex(of: deleteRow) {
                if self.isFiltering {
                    self.filterCityArray.remove(at: index)
                    self.citiesArray.remove(at: index)
                } else {
                    self.citiesArray.remove(at: index)
                }
                
            }
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else {
                return
            }
            
            if isFiltering {
                let filterWeather = filterCityArray[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.weatherModel = filterWeather
            } else {
                let cityWeather = citiesArray[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.weatherModel = cityWeather
            }
        }
    }

}

extension ListTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filterCityArray = citiesArray.filter({
            $0.name.contains(searchText)
        })
        tableView.reloadData()
    }
}
