//
//  Models.swift
//  Sigor
//
//  Created by 이다영 on 2020/12/17.
//

import Foundation

enum Gender {
    case male, female, other
}

struct Users {
    let username: String
    let bio: String
    let name: String
    let profilePhoto: URL
    let birthDate: Date
    let gender: Gender
    let count: UserCount
    let joinDate: Date
}

struct UserCount {
    let followers: Int
    let following: Int
    let posts: Int
}

public enum UserPostType: String {
    case photo = "Photo"
    case video = "Video"
}

public struct Posts {
    let identifier: String
    let postType: UserPostType
    let thumbnailImage: URL
    let postURL: URL
    let caption: String?
    let likeCount: [Likes]
    let comments: [Comments]
    let createdDate: Date
    let taggedUSers: [String]
    let publisher: Users
}

struct Likes {
    let username: String
    let postIdentifier: String
}

struct CommentLikes {
    let username: String
    let commentIdentifier: String
}

struct Comments {
    let identifier: String
    let username: String
    let text: String
    let createdDate: Date
    let likes : [CommentLikes]
}
