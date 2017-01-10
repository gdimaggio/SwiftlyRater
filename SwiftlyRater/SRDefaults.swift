//
//  SRDefaults.swift
//  SwiftlyRaterSample
//
//  Created by Gianluca Di Maggio on 1/5/17.
//  Copyright © 2017 dima. All rights reserved.
//

import Foundation

// MARK: - Int User Defaults

protocol IntUserDefaultable {
    associatedtype StateDefaultKey: RawRepresentable
}

extension IntUserDefaultable where StateDefaultKey.RawValue == String {
    static func set(_ value: Int, forKey key: StateDefaultKey) {
        let key = key.rawValue
        UserDefaults.standard.set(value, forKey: key)
    }

    static func int(forKey key: StateDefaultKey) -> Int {
        let key = key.rawValue
        return UserDefaults.standard.integer(forKey: key)
    }
}

// MARK: - Bool User Defaults

protocol BoolUserDefaultable {
    associatedtype StateDefaultKey: RawRepresentable
}

extension BoolUserDefaultable where StateDefaultKey.RawValue == String {
    static func set(_ value: Bool, forKey key: StateDefaultKey) {
        let key = key.rawValue
        UserDefaults.standard.set(value, forKey: key)
    }

    static func bool(forKey key: StateDefaultKey) -> Bool {
        let key = key.rawValue
        return UserDefaults.standard.bool(forKey: key)
    }
}

// MARK: - Object User Defaults

protocol ObjectUserDefaultable {
    associatedtype StateDefaultKey: RawRepresentable
}

extension ObjectUserDefaultable where StateDefaultKey.RawValue == String {
    static func set(_ value: Any?, forKey key: StateDefaultKey) {
        let key = key.rawValue
        UserDefaults.standard.set(value, forKey: key)
    }
}

// MARK: - String User Defaults

protocol StringUserDefaultable {
    associatedtype StateDefaultKey: RawRepresentable
}

extension StringUserDefaultable where StateDefaultKey.RawValue == String {
    static func set(_ value: String, forKey key: StateDefaultKey) {
        let key = key.rawValue
        UserDefaults.standard.set(value, forKey: key)
    }

    static func string(forKey key: StateDefaultKey) -> String? {
        let key = key.rawValue
        return UserDefaults.standard.string(forKey: key)
    }
}

// MARK: - Date User Defaults

protocol DateUserDefaultable {
    associatedtype StateDefaultKey: RawRepresentable
}

extension DateUserDefaultable where StateDefaultKey.RawValue == String {
    static func date(forKey key: StateDefaultKey) -> Date? {
        let key = key.rawValue

        guard let dateTimestamp = UserDefaults.standard.object(forKey: key) as? Double else {
            return nil
        }
        return Date(timeIntervalSince1970: dateTimestamp)
    }
}

extension UserDefaults {

    struct SRDefaults: IntUserDefaultable, BoolUserDefaultable, ObjectUserDefaultable, StringUserDefaultable, DateUserDefaultable {

        enum StateDefaultKey: String {
            case firstUse
            case lastReminded
            case usesCount
            case eventsCount

            case declinedToRate
            case versionRated
            case lastVersionUsed
        }

        static func synchronize() {
            UserDefaults.standard.synchronize()
        }

    }

}
