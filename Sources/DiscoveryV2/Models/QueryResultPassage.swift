/**
 * (C) Copyright IBM Corp. 2019, 2021.
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

/**
 A passage query result.
 */
public struct QueryResultPassage: Codable, Equatable {

    /**
     The content of the extracted passage.
     */
    public var passageText: String?

    /**
     The position of the first character of the extracted passage in the originating field.
     */
    public var startOffset: Int?

    /**
     The position after the last character of the extracted passage in the originating field.
     */
    public var endOffset: Int?

    /**
     The label of the field from which the passage has been extracted.
     */
    public var field: String?

    /**
     Estimate of the probability that the passage is relevant.
     */
    public var confidence: Double?

    /**
     An arry of extracted answers to the specified query.
     */
    public var answers: [ResultPassageAnswer]?

    // Map each property name to the key that shall be used for encoding/decoding.
    private enum CodingKeys: String, CodingKey {
        case passageText = "passage_text"
        case startOffset = "start_offset"
        case endOffset = "end_offset"
        case field = "field"
        case confidence = "confidence"
        case answers = "answers"
    }

}
