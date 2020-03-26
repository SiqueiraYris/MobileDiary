//
//  BiometryAuthorization.swift
//  MobileDiary
//
//  Created by Siqueira on 25/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import LocalAuthentication

final class BiometryAuthorization {
    func authenticateUserUsingTouchId(completion: @escaping(Bool?) -> Void) {
        let context = LAContext()
        if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: String.localized(by: "Login")) { success, _ in
                if success {
                    completion(success)
                }
            }
        }
    }
}
