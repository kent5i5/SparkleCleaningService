//
//  SettingsObject.swift
//  Sparkle
//
//  Created by ying kit ng on 3/9/21.
//

import SwiftUI
import Combine

final class SettingsObject: ObservableObject {
    private enum Keys {
        static let pro = "pro"
        static let sleepGoal = "sleep_goal"
        static let notificationEnabled = "notifications_enabled"
        static let sleepTrackingEnabled = "sleep_tracking_enabled"
        static let sleepTrackingMode = "sleep_tracking_mode"
    }

    private let cancellable: Cancellable
    private let defaults: UserDefaults

    let objectWillChange = PassthroughSubject<Void, Never>()

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults

        defaults.register(defaults: [
            Keys.sleepGoal: 8,
            Keys.sleepTrackingEnabled: true,
            ])

        cancellable = NotificationCenter.default
            .publisher(for: UserDefaults.didChangeNotification)
            .map { _ in () }
            .subscribe(objectWillChange)
    }

    var isNotificationEnabled: Bool {
        set { defaults.set(newValue, forKey: Keys.notificationEnabled) }
        get { defaults.bool(forKey: Keys.notificationEnabled) }
    }

}
//
//extension SettingsStore {
//    func unlockPro() {
//        // You can do your in-app transactions here
//        isPro = true
//    }
//
//    func restorePurchase() {
//        // You can do you in-app purchase restore here
//        isPro = true
//    }
//}
