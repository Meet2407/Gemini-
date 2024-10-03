// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let geminiModel = try? JSONDecoder().decode(GeminiModel.self, from: jsonData)

import Foundation

// MARK: - GeminiModel
struct GeminiModel: Codable {
    let candidates: [Candidate]
    let usageMetadata: UsageMetadata
}

// MARK: - Candidate
struct Candidate: Codable {
    let content: Content
    let finishReason: String
    let index: Int
    let safetyRatings: [SafetyRating]
}

// MARK: - Content
struct Content: Codable {
    let parts: [Part]
    let role: String
}

// MARK: - Part
struct Part: Codable {
    let text: String
}

// MARK: - SafetyRating
struct SafetyRating: Codable {
    let category, probability: String
}

// MARK: - UsageMetadata
struct UsageMetadata: Codable {
    let promptTokenCount, candidatesTokenCount, totalTokenCount: Int
}
