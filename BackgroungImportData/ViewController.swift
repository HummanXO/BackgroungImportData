//
//  ViewController.swift
//  BackgroungImportData
//
//  Created by Alexandr on 3/12/25.
//

import UIKit

class ViewController: UIViewController {
    
    let networkManager = NetworkManager()
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.setTitle("Download", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(downloadButton)
        downloadButton.addTarget(self, action: #selector(downloadData), for: .touchUpInside)
        NSLayoutConstraint.activate([
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            downloadButton.widthAnchor.constraint(equalToConstant: 150),
            downloadButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func downloadData() {
        UserDefaults.standard.set(true, forKey: "isDownloaded")
        networkManager.fetchData { products in
            DispatchQueue.global().async {
                if products.isEmpty {
                    print("error downloading")
                } else {
                    CoreDataManager.shared.saveProducts(from: products)
                    let data = CoreDataManager.shared.fetchData()
                    DispatchQueue.main.async {
                        let secondVC = SecondViewController(data: data!)
                        self.navigationController?.pushViewController(secondVC, animated: true)
                    }
                }
            }
        }
    }


}

