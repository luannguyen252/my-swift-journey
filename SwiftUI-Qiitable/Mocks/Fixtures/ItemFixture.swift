import Foundation

struct TagFixture {
    static func test(
        name: String? = "test-name",
        versions: [String]? = ["test"]
    ) -> Tag {
        return .init(name: name, versions: versions)
    }
}

struct UserFixture {
    static func test(
        id: String = "test-id",
        name: String = "test-name",
        descriptionField: String? = "test-description",
        facebookId: String? = nil,
        followeesCount: Int? = 0,
        followersCount: Int? = 0,
        githubLoginName: String? = nil,
        itemsCount: Int? = 0,
        linkedinId: String? = nil,
        location: String? = nil,
        organization: String? = nil,
        permanentId: Int? = nil,
        profileImageUrl: String = "https://google.com",
        teamOnly: Bool? = nil,
        twitterScreenName: String? = nil,
        websiteUrl: String? = nil
    ) -> User {
        return .init(
            id: id,
            name: name,
            descriptionField: descriptionField,
            facebookId: facebookId,
            followeesCount: followeesCount,
            followersCount: followersCount,
            githubLoginName: githubLoginName,
            itemsCount: itemsCount,
            linkedinId: linkedinId,
            location: location,
            organization: organization,
            permanentId: permanentId,
            profileImageUrl: profileImageUrl,
            teamOnly: teamOnly,
            twitterScreenName: twitterScreenName,
            websiteUrl: websiteUrl
        )
    }
}

struct ItemFixture {
    static func test(
        id: String = "test-id",
        title: String = "test-title",
        body: String = "test-body",
        renderedBody: String = "test-renderedBody",
        url: String = "https://google.com",
        commentsCount: Int? = 0,
        likesCount: Int? = 0,
        pageViewsCount: String? = nil,
        reactionsCount: Int? = 0,
        user: User = UserFixture.test(),
        tags: [Tag] = [TagFixture.test()],
        privateField: Bool? = nil,
        group: String? = nil,
        coediting: Bool? = nil,
        createdAt: String = "",
        updatedAt: String = ""
    ) -> Item {
        return .init(
            id: id,
            title: title,
            body: body,
            renderedBody: renderedBody,
            url: url,
            commentsCount: commentsCount,
            likesCount: likesCount,
            pageViewsCount: pageViewsCount,
            reactionsCount: reactionsCount,
            user: user,
            tags: tags,
            privateField: privateField,
            group: group,
            coediting: coediting,
            createdAt: createdAt,
            updatedAt: updatedAt)
    }
}
