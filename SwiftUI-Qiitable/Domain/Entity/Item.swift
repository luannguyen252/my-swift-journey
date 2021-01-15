import Foundation

public struct Item: Codable, Identifiable, Equatable {
    public let id: String
    public let title: String
    public let body: String
    public let renderedBody: String
    public let url: String
    public let commentsCount: Int?
    public let likesCount: Int?
    public let pageViewsCount: String?
    public let reactionsCount: Int?
    public let user: User
    public let tags: [Tag]
    public let privateField: Bool?
    public let group: String?
    public let coediting: Bool?
    public let createdAt: String
    public let updatedAt: String
}
