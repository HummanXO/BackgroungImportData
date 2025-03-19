import Foundation

class NetworkManager {
    func fetchData(complition: @escaping ([Product]) -> Void) {
        let stringURL = "https://dummyjson.com/products"
        
        guard let url = URL(string: stringURL) else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data {
                do {
                    let json = try JSONDecoder().decode(RepositoryRespone.self, from: data)
                    complition(json.products)
                } catch {
                    print("Unable to decode JSON", error.localizedDescription)
                }
            }
        }.resume()
    }
}
