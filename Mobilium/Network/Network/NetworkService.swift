//
//  NetworkService.swift
//  Mobilium
//
//  Created by GÜRHAN YUVARLAK on 16.09.2022.
//

import Foundation
import Alamofire

final class NetworkService {
    static let shared = NetworkService()
}

extension NetworkService {
    func request<T: Codable>(url: URL?, excepting: T.Type, completion: @escaping (Result<T, AFError>) -> Void) {
        guard let url = url else {
            return
        }
        AF.request(url).responseDecodable(of: excepting.self) { response in
            switch response.result {
                case .success(let model):
                    completion(.success(model))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
