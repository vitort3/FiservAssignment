//
//  Task+Extensions.swift
//  FiservAssignment
//
//  Created by vitoraugusto.dearaujosilva on 02/12/25.
//

extension Task where Success == Never, Failure == Never {
    static func sleep(seconds: Double = 0.5) async throws {
        try await Task.sleep(nanoseconds: UInt64(seconds * Double(1000000000)))
    }
}
