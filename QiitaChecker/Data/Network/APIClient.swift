//
//  APIClient.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/21.
//

import UIKit
import Alamofire
import RxSwift

struct APIClient {
    private static let successRange = 200 ..< 300
    private static let contentType = ["application/json"]
    
    static func call<T, V>(_ request: T, _ disposeBag: DisposeBag, onSuccess: @escaping ([V]) -> Void, onError: @escaping (Error) -> Void) where T: BaseRequest, V: Codable, T.Response == V {
        _ = send(request: request)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onSuccess: {
                    onSuccess($0)
            },
                onError: {
                    onError($0)
            })
            .disposed(by: disposeBag)
    }

    static func send<T, V>(request: T) -> Single<[T.Response]> where T: BaseRequest, V: Codable, T.Response == V {
        return Single<[T.Response]>.create { observer in
            let calling = callForData(request) { response in
                switch response {
                case .success(let result):
                    observer(.success(result as! [V]))
                case .failure(let error):
                    observer(.error(error))
                }
            }
            return Disposables.create { calling.cancel() }
        }
    }

    private static func callForData<T, V>(_ request: T, completion: @escaping (APIResult) -> Void) -> DataRequest where T: BaseRequest, V: Codable, T.Response == V {
        return AF.request(request)
            .validate(statusCode: successRange)
            .validate(contentType: contentType)
            .responseJSON { response in
                switch response.result {
                case .success:
                    guard let data = response.data else { return }
                    guard let decodedData = try? JSONDecoder().decode([V].self, from: data) else { return }
                    completion(.success(decodedData))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
}
