//
//  FeedsModel.swift
//  Feeds
//
//  Created by Nishita Shukla on 26/08/20.
//  Copyright © 2020 Nishita Shukla. All rights reserved.
//
import Foundation

// MARK: - FeedsModel
struct FeedsModel: Codable {
    let statusCode: Int?
    let body: Body?

    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case body
    }
}

// MARK: - Body
struct Body: Codable {
    let data: [Datum]?
    let defaultFeedCount, activityCount, accurateActivityCount: Int?
    let enableComposer, enableComposerPhoto: Bool?
    let maxid, minid: Int?
    let filterTabs: [FilterTab]?
    let videoSource: [String: String]?
    let feedPostMenu: FeedPostMenu?
    let reactionsEnabled, stickersEnabled, emojiEnabled, showFilterType: Int?
    let isShowGreetingAnnouncement: Int?
    let feedDecorationSetting: FeedDecorationSetting?
    let notifyItemAt: Int?

    enum CodingKeys: String, CodingKey {
        case data, defaultFeedCount, activityCount, accurateActivityCount
        case enableComposer = "enable_composer"
        case enableComposerPhoto = "enable_composer_photo"
        case maxid, minid, filterTabs
        case videoSource = "video_source"
        case feedPostMenu = "feed_post_menu"
        case reactionsEnabled, stickersEnabled, emojiEnabled, showFilterType
        case isShowGreetingAnnouncement = "is_show_greeting_announcement"
        case feedDecorationSetting, notifyItemAt
    }
}

// MARK: - Datum
struct Datum: Codable {
    let feed: Feed?
    let canComment, datumCanComment, isLike, canShare: Int?
    let isSaveFeedOption: Int?
    let feedMenus: FeedMenusUnion?
    let feedFooterMenus: FeedFooterMenus?
    let canBookmark: Int?

    enum CodingKeys: String, CodingKey {
        case feed, canComment
        case datumCanComment = "can_comment"
        case isLike = "is_like"
        case canShare = "can_share"
        case isSaveFeedOption
        case feedMenus = "feed_menus"
        case feedFooterMenus = "feed_footer_menus"
        case canBookmark = "can_bookmark"
    }
}

// MARK: - Feed
struct Feed: Codable {
    let actionID: Int?
    let type: String?
    let subjectType: SubjectTypeEnum?
    let subjectID: Int?
    let objectType: String?
    let objectID: Int?
    let body: String?
    let params: Params?
    let date, modifiedDate: String?
    let attachmentCount, commentCount, likeCount: Int?
    let privacy: ViewPrivacy?
    let commentable, shareable: Int?
    let userAgent: String?
    let publishDate: JSONNull?
    let privacyIcon: ViewPrivacy?
    let userTag, wordStyle: [JSONAny]?
    let decoration: DecorationUnion?
    let timeValue: Int?
    let subjectIformation: SubjectIformation?
    let object: FeedObject?
    let feedIcon: String?
    let attachmentContentType: String?
    let attachment: [Attachment]?
    let photoAttachmentCount: Int?
    let feedTitle, actionTypeBody: String?
    let actionTypeBodyParams: [ActionTypeBodyParam]?
    let isRequired, feedType: Int?
    let shareParamsType: String?
    let shareParamsID: Int?

    enum CodingKeys: String, CodingKey {
        case actionID = "action_id"
        case type
        case subjectType = "subject_type"
        case subjectID = "subject_id"
        case objectType = "object_type"
        case objectID = "object_id"
        case body, params, date
        case modifiedDate = "modified_date"
        case attachmentCount = "attachment_count"
        case commentCount = "comment_count"
        case likeCount = "like_count"
        case privacy, commentable, shareable
        case userAgent = "user_agent"
        case publishDate = "publish_date"
        case privacyIcon = "privacy_icon"
        case userTag, wordStyle, decoration
        case timeValue = "time_value"
        case subjectIformation, object
        case feedIcon = "feed_icon"
        case attachmentContentType = "attachment_content_type"
        case attachment
        case photoAttachmentCount = "photo_attachment_count"
        case feedTitle = "feed_title"
        case actionTypeBody = "action_type_body"
        case actionTypeBodyParams = "action_type_body_params"
        case isRequired
        case feedType = "feed_type"
        case shareParamsType = "share_params_type"
        case shareParamsID = "share_params_id"
    }
}

// MARK: - ActionTypeBodyParam
struct ActionTypeBodyParam: Codable {
    let search: Search?
    let label: String?
    let type: SubjectTypeEnum?
    let id: Int?
    let object: ActionTypeBodyParamObject?
}

// MARK: - ActionTypeBodyParamObject
struct ActionTypeBodyParamObject: Codable {
    let label, type: String?
    let id: Int?
}

enum Search: String, Codable {
    case actorsSubjectObject = "{actors:$subject:$object}"
    case bodyBody = "{body:$body}"
    case itemObject = "{item:$object}"
    case itemSubject = "{item:$subject}"
    case varType = "{var:$type}"
}

enum SubjectTypeEnum: String, Codable {
    case user = "user"
}

// MARK: - Attachment
struct Attachment: Codable {
    let title, body, attachmentType: String?
    let attachmentID: Int?
    let uri: String?
    let albumID, photoID: Int?
    let tags: [JSONAny]?
    let likesCount, commentCount, isLike: Int?
    let reactions: Reactions?
    let menu: [Menu]?
    let imageMain: ImageMain?
    let mode, id: Int?
    let imageMedium: String?

    enum CodingKeys: String, CodingKey {
        case title, body
        case attachmentType = "attachment_type"
        case attachmentID = "attachment_id"
        case uri
        case albumID = "album_id"
        case photoID = "photo_id"
        case tags
        case likesCount = "likes_count"
        case commentCount = "comment_count"
        case isLike = "is_like"
        case reactions, menu
        case imageMain = "image_main"
        case mode, id
        case imageMedium = "image_medium"
    }
}

// MARK: - ImageMain
struct ImageMain: Codable {
    let src: String?
    let size: Size?
}

// MARK: - Size
struct Size: Codable {
    let width, height: Int?
}

// MARK: - Menu
struct Menu: Codable {
    let label: MenuLabel?
    let name: MenuName?
    let url: String?
    let urlParams: MenuURLParams?
}

enum MenuLabel: String, Codable {
    case makeProfilePhoto = "Make Profile Photo"
    case report = "Report"
    case share = "Share"
}

enum MenuName: String, Codable {
    case makeProfilePhoto = "make_profile_photo"
    case report = "report"
    case share = "share"
}

// MARK: - MenuURLParams
struct MenuURLParams: Codable {
    let type: String?
    let id: Int?
    let photo: String?
}

// MARK: - Reactions
struct Reactions: Codable {
    let feedReactions: FeedReactionsUnion?

    enum CodingKeys: String, CodingKey {
        case feedReactions = "feed_reactions"
    }
}

enum FeedReactionsUnion: Codable {
    case anythingArray([JSONAny])
    case feedReactionsClass(FeedReactionsClass)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([JSONAny].self) {
            self = .anythingArray(x)
            return
        }
        if let x = try? container.decode(FeedReactionsClass.self) {
            self = .feedReactionsClass(x)
            return
        }
        throw DecodingError.typeMismatch(FeedReactionsUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for FeedReactionsUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .anythingArray(let x):
            try container.encode(x)
        case .feedReactionsClass(let x):
            try container.encode(x)
        }
    }
}

// MARK: - FeedReactionsClass
struct FeedReactionsClass: Codable {
    let the1: The1?

    enum CodingKeys: String, CodingKey {
        case the1 = "1"
    }
}

// MARK: - The1
struct The1: Codable {
    let reactionImageIcon, reactionImageLargeIcon: String?
    let caption: CaptionEnum?
    let reactioniconID, reactionCount: Int?

    enum CodingKeys: String, CodingKey {
        case reactionImageIcon = "reaction_image_icon"
        case reactionImageLargeIcon = "reaction_image_large_icon"
        case caption
        case reactioniconID = "reactionicon_id"
        case reactionCount = "reaction_count"
    }
}

enum CaptionEnum: String, Codable {
    case like = "Like"
}

enum DecorationUnion: Codable {
    case anythingArray([JSONAny])
    case decorationClass(DecorationClass)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([JSONAny].self) {
            self = .anythingArray(x)
            return
        }
        if let x = try? container.decode(DecorationClass.self) {
            self = .decorationClass(x)
            return
        }
        throw DecodingError.typeMismatch(DecorationUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for DecorationUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .anythingArray(let x):
            try container.encode(x)
        case .decorationClass(let x):
            try container.encode(x)
        }
    }
}

// MARK: - DecorationClass
struct DecorationClass: Codable {
    let charLength, fontSize: Int?
    let fontColor, fontStyle: String?

    enum CodingKeys: String, CodingKey {
        case charLength = "char_length"
        case fontSize = "font_size"
        case fontColor = "font_color"
        case fontStyle = "font_style"
    }
}

// MARK: - FeedObject
struct FeedObject: Codable {
    let groupID, userID: Int?
    let title, objectDescription: String?
    let categoryID, search, invite, approval: Int?
    let photoID: Int?
    let coverphoto: Int?
    let creationDate, modifiedDate: String?
    let memberCount, viewCount, commentCount, likeCount: Int?
    let viewPrivacy: ViewPrivacy?
    let seaoLocationid: Int?
    let location, name: String?
    let url: String?
    let image, imageNormal, imageProfile, imageIcon: String?
    let contentURL: String?
    let ownerURL: String?
    let ownerTitle, username, displayname: String?
    let status: Status?
    let statusDate, locale, language, timezone: String?
    let showProfileviewers, levelID, invitesUsed, extraInvites: Int?
    let enabled, verified, approved: Int?
    let lastloginDate: String?
    let updateDate, coverphotoparams: JSONNull?
    let loginTimestamp: Int?
    let baseUsername: String?
    let pollID, isClosed, voteCount, closed: Int?
    let startDatetime, endDatetime: String?
    let webinarID, type, scope: Int?
    let webinarLink, webinarPasscode: String?
    let duration: Int?
    let createdAt, updatedAt: String?
    let isCancel: Int?

    enum CodingKeys: String, CodingKey {
        case groupID = "group_id"
        case userID = "user_id"
        case title
        case objectDescription = "description"
        case categoryID = "category_id"
        case search, invite, approval
        case photoID = "photo_id"
        case coverphoto
        case creationDate = "creation_date"
        case modifiedDate = "modified_date"
        case memberCount = "member_count"
        case viewCount = "view_count"
        case commentCount = "comment_count"
        case likeCount = "like_count"
        case viewPrivacy = "view_privacy"
        case seaoLocationid = "seao_locationid"
        case location, name, url, image
        case imageNormal = "image_normal"
        case imageProfile = "image_profile"
        case imageIcon = "image_icon"
        case contentURL = "content_url"
        case ownerURL = "owner_url"
        case ownerTitle = "owner_title"
        case username, displayname, status
        case statusDate = "status_date"
        case locale, language, timezone
        case showProfileviewers = "show_profileviewers"
        case levelID = "level_id"
        case invitesUsed = "invites_used"
        case extraInvites = "extra_invites"
        case enabled, verified, approved
        case lastloginDate = "lastlogin_date"
        case updateDate = "update_date"
        case coverphotoparams
        case loginTimestamp = "login_timestamp"
        case baseUsername = "base_username"
        case pollID = "poll_id"
        case isClosed = "is_closed"
        case voteCount = "vote_count"
        case closed
        case startDatetime = "start_datetime"
        case endDatetime = "end_datetime"
        case webinarID = "webinar_id"
        case type, scope
        case webinarLink = "webinar_link"
        case webinarPasscode = "webinar_passcode"
        case duration
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case isCancel = "is_cancel"
    }
}

enum Status: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Status.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Status"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

enum ViewPrivacy: String, Codable {
    case everyone = "everyone"
}

// MARK: - Params
struct Params: Codable {
    let feedBanner, type: String?

    enum CodingKeys: String, CodingKey {
        case feedBanner = "feed-banner"
        case type
    }
}

// MARK: - SubjectIformation
struct SubjectIformation: Codable {
    let image: String?
}

// MARK: - FeedFooterMenus
struct FeedFooterMenus: Codable {
    let like: Like?
    let share: Share?
}

// MARK: - Like
struct Like: Codable {
    let name: URLEnum?
    let label: CaptionEnum?
    let url: URLEnum?
    let urlParams: LikeURLParams?
}

enum URLEnum: String, Codable {
    case like = "like"
}

// MARK: - LikeURLParams
struct LikeURLParams: Codable {
    let actionID: Int?

    enum CodingKeys: String, CodingKey {
        case actionID = "action_id"
    }
}

// MARK: - Share
struct Share: Codable {
    let name: MenuName?
    let label: MenuLabel?
    let url: ShareURL?
    let urlParams: ShareURLParams?
}

enum ShareURL: String, Codable {
    case activityShare = "activity/share"
}

// MARK: - ShareURLParams
struct ShareURLParams: Codable {
    let type: String?
    let id: Int?
}

enum FeedMenusUnion: Codable {
    case feedMenuArray([FeedMenu])
    case feedMenusClass(FeedMenusClass)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([FeedMenu].self) {
            self = .feedMenuArray(x)
            return
        }
        if let x = try? container.decode(FeedMenusClass.self) {
            self = .feedMenusClass(x)
            return
        }
        throw DecodingError.typeMismatch(FeedMenusUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for FeedMenusUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .feedMenuArray(let x):
            try container.encode(x)
        case .feedMenusClass(let x):
            try container.encode(x)
        }
    }
}

// MARK: - FeedMenu
struct FeedMenu: Codable {
    let name, label: String?
    let url: FeedMenuURL?
    let urlParams: FeedMenuURLParams?
}

enum FeedMenuURL: String, Codable {
    case advancedactivityDelete = "advancedactivity/delete"
    case advancedactivityFeedsHideItem = "advancedactivity/feeds/hide-item"
    case advancedactivityUpdateCommentable = "advancedactivity/update-commentable"
    case advancedactivityUpdateSaveFeed = "advancedactivity/update-save-feed"
    case advancedactivityUpdateShareable = "advancedactivity/update-shareable"
}

// MARK: - FeedMenuURLParams
struct FeedMenuURLParams: Codable {
    let actionID: Int?
    let type: URLParamsType?
    let id, hideReport: Int?

    enum CodingKeys: String, CodingKey {
        case actionID = "action_id"
        case type, id
        case hideReport = "hide_report"
    }
}

enum URLParamsType: String, Codable {
    case activityAction = "activity_action"
}

// MARK: - FeedMenusClass
struct FeedMenusClass: Codable {
    let label, name, url: String?
    let urlParams: FeedMenusURLParams?
}

// MARK: - FeedMenusURLParams
struct FeedMenusURLParams: Codable {
    let source: String?
    let sourceID: Int?

    enum CodingKeys: String, CodingKey {
        case source
        case sourceID = "source_id"
    }
}

// MARK: - FeedDecorationSetting
struct FeedDecorationSetting: Codable {
    let charLength, fontSize: Int?
    let fontColor, fontStyle: String?
    let bannerFeedLength, bannerCount: Int?
    let bannerOrder: String?

    enum CodingKeys: String, CodingKey {
        case charLength = "char_length"
        case fontSize = "font_size"
        case fontColor = "font_color"
        case fontStyle = "font_style"
        case bannerFeedLength = "banner_feed_length"
        case bannerCount = "banner_count"
        case bannerOrder = "banner_order"
    }
}

// MARK: - FeedPostMenu
struct FeedPostMenu: Codable {
    let status, withtags, emotions, photo: Int?
    let checkin, video, music, link: Int?
    let userprivacy: Userprivacy?
    let allowTargetPost, allowSchedulePost, allowfeelingActivity, allowAdvertize: Int?
    let allowPin, allowGreeting, allowMemories, allowBanner: Int?
}

// MARK: - Userprivacy
struct Userprivacy: Codable {
    let everyone, onlyme, friends: String?
}

// MARK: - FilterTab
struct FilterTab: Codable {
    let tabTitle: String?
    let urlParams: FilterTabURLParams?

    enum CodingKeys: String, CodingKey {
        case tabTitle = "tab_title"
        case urlParams
    }
}

// MARK: - FilterTabURLParams
struct FilterTabURLParams: Codable {
    let filterType: String?
    let listID, isFromTab, feedOnly: Int?

    enum CodingKeys: String, CodingKey {
        case filterType = "filter_type"
        case listID = "list_id"
        case isFromTab, feedOnly
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
