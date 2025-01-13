//
//  InitView+Table.swift
//  MyPokemon
//
//  Created by Mario Vargas on 11/01/25.
//

import Foundation
import UIKit

extension InitView: UITableViewDelegate, UITableViewDataSource {
    func configureTable() {
        tblPokemon.delegate = self
        tblPokemon.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return initViewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! PokemonCell
        cell.setData(data: initViewModel.getInfo(indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismissKeyboard()
        let detailView = DetailView()
        detailView.pokemonName = initViewModel.getInfo(indexPath.row).name
        detailView.delegate = self
        self.navigationController?.pushViewController(detailView, animated: true)
    }
    
    
}
