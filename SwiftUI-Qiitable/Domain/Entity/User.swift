import Foundation

public struct User: Codable, Identifiable, Equatable {
    public let id: String
    public let name: String
    public let descriptionField: String?
    public let facebookId: String?
    public let followeesCount: Int?
    public let followersCount: Int?
    public let githubLoginName: String?
    public let itemsCount: Int?
    public let linkedinId: String?
    public let location: String?
    public let organization: String?
    public let permanentId: Int?
    public let profileImageUrl: String
    public let teamOnly: Bool?
    public let twitterScreenName: String?
    public let websiteUrl: String?

    public init(
        id: String,
        name: String,
        descriptionField: String?,
        facebookId: String?,
        followeesCount: Int?,
        followersCount: Int?,
        githubLoginName: String?,
        itemsCount: Int?,
        linkedinId: String?,
        location: String?,
        organization: String?,
        permanentId: Int?,
        profileImageUrl: String,
        teamOnly: Bool?,
        twitterScreenName: String?,
        websiteUrl: String?
    ) {
        self.id = id
        self.name = name
        self.descriptionField = descriptionField
        self.facebookId = facebookId
        self.followeesCount = followeesCount
        self.followersCount = followersCount
        self.githubLoginName = githubLoginName
        self.itemsCount = itemsCount
        self.linkedinId = linkedinId
        self.location = location
        self.organization = organization
        self.permanentId = permanentId
        self.profileImageUrl = profileImageUrl
        self.teamOnly = teamOnly
        self.twitterScreenName = twitterScreenName
        self.websiteUrl = websiteUrl
    }
}
