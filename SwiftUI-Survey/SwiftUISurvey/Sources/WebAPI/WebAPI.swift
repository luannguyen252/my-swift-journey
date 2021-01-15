//
//  WebAPI.swift
//  SwiftUISurvey
//
//  Created by Amir on 01/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//
import Foundation
import Combine

extension WebAPI: SurveyWebAPI {
    
    func getSurveys() -> AnyPublisher<[Survey], Error> {
        request(endpoint: .surveys)
    }
    
    func post(survey: Survey) -> AnyPublisher<Survey, Error> {
        request(endpoint: .surveys, method: .post, request: survey)
    }
    
    func put(survey: Survey) -> AnyPublisher<Survey, Error> {
        request(endpoint: .surveys, method: .put, request: survey)
    }
    
    func delete(surveyId: UUID) -> AnyPublisher<Empty, Error> {
        request(endpoint: .survey(id: surveyId.uuidString), method: .delete)
    }
    
    func getQuestions() -> AnyPublisher<[Question], Error> {
        request(endpoint: .questions, method: .get)
    }
    
    func post(question: Question) -> AnyPublisher<Question, Error> {
        request(endpoint: .questions, method: .post, request: question)
    }
    
    func put(question: Question) -> AnyPublisher<Question, Error> {
        request(endpoint: .questions, method: .put, request: question)
    }
    
    func delete(questionId: UUID) -> AnyPublisher<Empty, Error> {
        request(endpoint: .question(id: questionId.uuidString), method: .delete)
    }
}


class WebAPI {
    
    // MARK: Static properties
    
    static var shared = WebAPI()
    
    
    // MARK: Constants
    
    enum Constants {
        static let baseURL = URL(string: "https://swiftysurvey.herokuapp.com/mobile")!
    }
    
    
    // MARK: Properties
    
    private let session: URLSession
    private let jsonDecoder: JSONDecoder
    private let jsonEncoder: JSONEncoder
    
    // MARK: Lifecycle
    
    init(session: URLSession = .shared) {
        self.session = session
        self.jsonDecoder = JSONDecoder()
        self.jsonEncoder = JSONEncoder()
    }
    
    // MARK: Private functions
    
    private func request<ResponseType: Decodable>(endpoint: Endpoint, method: HTTPMethod = .get) -> AnyPublisher<ResponseType, Error> {
        request(endpoint: endpoint, method: method, request: Empty())
    }
    
    private func request<ResponseType: Decodable, RequestType: Encodable>(
        endpoint: Endpoint,
        method: HTTPMethod,
        request: RequestType
    ) -> AnyPublisher<ResponseType, Error> {
        let url =  endpoint.url()
        let body: Data?
        if !(request is Empty) {
            do {
                body = try jsonEncoder.encode(request)
            } catch {
                return .error(error)
            }
        } else {
            body = nil
        }
        // logging
        #if DEBUG
        print("sending request \(method.rawValue) \(url.absoluteString)")
        print(body.map { String(data: $0, encoding: .utf8) ?? "empty request body"} ?? "nil request body")
        #endif
        //
        
        return performRequest(for: url, method: method, body: body)
            .map {
                // logging
                #if DEBUG
                print("request response \(method.rawValue) \(url.absoluteString)")
                print(String(data: $0.data, encoding: .utf8) ?? "empty response body")
                #endif

                if ResponseType.self == Empty.self, $0.data.isEmpty {
                    return "{}".data(using: .utf8)!
                }
                return $0.data
            }
            .decode(type: ResponseType.self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
    }
    
    private func performRequest(for url: URL, method: HTTPMethod, body: Data?) -> URLSession.DataTaskPublisher {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        return session.dataTaskPublisher(for: request)
    }
    
}
