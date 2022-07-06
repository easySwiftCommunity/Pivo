//
//  PivoViewModel.swift
//  TestRostov
//
//  Created by mac on 06.07.2022.
//

import UIKit

final class PivoViewModel {
    var arrayPivo: Pivo = []
    
    func getData(completion: @escaping () -> Void) {
        let urlString = "https://api.punkapi.com/v2/beers?page=2&per_page=80"
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        APIManager.getData(request: request, completion: { pivo in
            DispatchQueue.main.async {
                self.arrayPivo = pivo
                completion()
            }
        })
    }
    func numberOrRows() -> Int {
        return self.arrayPivo.count
    }
}
