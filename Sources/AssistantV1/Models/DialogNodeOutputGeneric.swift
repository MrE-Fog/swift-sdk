/**
 * (C) Copyright IBM Corp. 2022.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Foundation
import IBMSwiftSDKCore

/**
 DialogNodeOutputGeneric.
 */
public enum DialogNodeOutputGeneric: Codable, Equatable {

    case audio(DialogNodeOutputGenericDialogNodeOutputResponseTypeAudio)
    case channelTransfer(DialogNodeOutputGenericDialogNodeOutputResponseTypeChannelTransfer)
    case connectToAgent(DialogNodeOutputGenericDialogNodeOutputResponseTypeConnectToAgent)
    case iframe(DialogNodeOutputGenericDialogNodeOutputResponseTypeIframe)
    case image(DialogNodeOutputGenericDialogNodeOutputResponseTypeImage)
    case option(DialogNodeOutputGenericDialogNodeOutputResponseTypeOption)
    case pause(DialogNodeOutputGenericDialogNodeOutputResponseTypePause)
    case searchSkill(DialogNodeOutputGenericDialogNodeOutputResponseTypeSearchSkill)
    case text(DialogNodeOutputGenericDialogNodeOutputResponseTypeText)
    case userDefined(DialogNodeOutputGenericDialogNodeOutputResponseTypeUserDefined)
    case video(DialogNodeOutputGenericDialogNodeOutputResponseTypeVideo)

    private struct GenericDialogNodeOutputGeneric: Codable, Equatable {

        var responseType: String

        private enum CodingKeys: String, CodingKey {
            case responseType = "response_type"
        }

    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let genericInstance = try? container.decode(GenericDialogNodeOutputGeneric.self) {
            switch genericInstance.responseType {
            case "audio":
                if let val = try? container.decode(DialogNodeOutputGenericDialogNodeOutputResponseTypeAudio.self) {
                    self = .audio(val)
                    return
                }
            case "channel_transfer":
                if let val = try? container.decode(DialogNodeOutputGenericDialogNodeOutputResponseTypeChannelTransfer.self) {
                    self = .channelTransfer(val)
                    return
                }
            case "connect_to_agent":
                if let val = try? container.decode(DialogNodeOutputGenericDialogNodeOutputResponseTypeConnectToAgent.self) {
                    self = .connectToAgent(val)
                    return
                }
            case "iframe":
                if let val = try? container.decode(DialogNodeOutputGenericDialogNodeOutputResponseTypeIframe.self) {
                    self = .iframe(val)
                    return
                }
            case "image":
                if let val = try? container.decode(DialogNodeOutputGenericDialogNodeOutputResponseTypeImage.self) {
                    self = .image(val)
                    return
                }
            case "option":
                if let val = try? container.decode(DialogNodeOutputGenericDialogNodeOutputResponseTypeOption.self) {
                    self = .option(val)
                    return
                }
            case "pause":
                if let val = try? container.decode(DialogNodeOutputGenericDialogNodeOutputResponseTypePause.self) {
                    self = .pause(val)
                    return
                }
            case "search_skill":
                if let val = try? container.decode(DialogNodeOutputGenericDialogNodeOutputResponseTypeSearchSkill.self) {
                    self = .searchSkill(val)
                    return
                }
            case "text":
                if let val = try? container.decode(DialogNodeOutputGenericDialogNodeOutputResponseTypeText.self) {
                    self = .text(val)
                    return
                }
            case "user_defined":
                if let val = try? container.decode(DialogNodeOutputGenericDialogNodeOutputResponseTypeUserDefined.self) {
                    self = .userDefined(val)
                    return
                }
            case "video":
                if let val = try? container.decode(DialogNodeOutputGenericDialogNodeOutputResponseTypeVideo.self) {
                    self = .video(val)
                    return
                }
            default:
                // falling through to throw decoding error
                break
            }
        }

        throw DecodingError.typeMismatch(DialogNodeOutputGeneric.self,
                                         DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Decoding failed for all associated types"))
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .audio(let audio):
            try container.encode(audio)
        case .channelTransfer(let channel_transfer):
            try container.encode(channel_transfer)
        case .connectToAgent(let connect_to_agent):
            try container.encode(connect_to_agent)
        case .iframe(let iframe):
            try container.encode(iframe)
        case .image(let image):
            try container.encode(image)
        case .option(let option):
            try container.encode(option)
        case .pause(let pause):
            try container.encode(pause)
        case .searchSkill(let search_skill):
            try container.encode(search_skill)
        case .text(let text):
            try container.encode(text)
        case .userDefined(let user_defined):
            try container.encode(user_defined)
        case .video(let video):
            try container.encode(video)
        }
    }
}
