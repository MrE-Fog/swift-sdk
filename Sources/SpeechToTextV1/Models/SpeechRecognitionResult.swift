/**
 * (C) Copyright IBM Corp. 2016, 2022.
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
 Component results for a speech recognition request.
 */
public struct SpeechRecognitionResult: Codable, Equatable {

    /**
     If the `split_transcript_at_phrase_end` parameter is `true`, describes the reason for the split:
     * `end_of_data` - The end of the input audio stream.
     * `full_stop` - A full semantic stop, such as for the conclusion of a grammatical sentence. The insertion of splits
     is influenced by the base language model and biased by custom language models and grammars.
     * `reset` - The amount of audio that is currently being processed exceeds the two-minute maximum. The service
     splits the transcript to avoid excessive memory use.
     * `silence` - A pause or silence that is at least as long as the pause interval.
     */
    public enum EndOfUtterance: String {
        case endOfData = "end_of_data"
        case fullStop = "full_stop"
        case reset = "reset"
        case silence = "silence"
    }

    /**
     An indication of whether the transcription results are final:
     * If `true`, the results for this utterance are final. They are guaranteed not to be updated further.
     * If `false`, the results are interim. They can be updated with further interim results until final results are
     eventually sent.
     **Note:** Because `final` is a reserved word in Java and Swift, the field is renamed `xFinal` in Java and is
     escaped with back quotes in Swift.
     */
    public var `final`: Bool

    /**
     An array of alternative transcripts. The `alternatives` array can include additional requested output such as word
     confidence or timestamps.
     */
    public var alternatives: [SpeechRecognitionAlternative]

    /**
     A dictionary (or associative array) whose keys are the strings specified for `keywords` if both that parameter and
     `keywords_threshold` are specified. The value for each key is an array of matches spotted in the audio for that
     keyword. Each match is described by a `KeywordResult` object. A keyword for which no matches are found is omitted
     from the dictionary. The dictionary is omitted entirely if no matches are found for any keywords.
     */
    public var keywordsResult: [String: [KeywordResult]]?

    /**
     An array of alternative hypotheses found for words of the input audio if a `word_alternatives_threshold` is
     specified.
     */
    public var wordAlternatives: [WordAlternativeResults]?

    /**
     If the `split_transcript_at_phrase_end` parameter is `true`, describes the reason for the split:
     * `end_of_data` - The end of the input audio stream.
     * `full_stop` - A full semantic stop, such as for the conclusion of a grammatical sentence. The insertion of splits
     is influenced by the base language model and biased by custom language models and grammars.
     * `reset` - The amount of audio that is currently being processed exceeds the two-minute maximum. The service
     splits the transcript to avoid excessive memory use.
     * `silence` - A pause or silence that is at least as long as the pause interval.
     */
    public var endOfUtterance: String?

    // Map each property name to the key that shall be used for encoding/decoding.
    private enum CodingKeys: String, CodingKey {
        case `final` = "final"
        case alternatives = "alternatives"
        case keywordsResult = "keywords_result"
        case wordAlternatives = "word_alternatives"
        case endOfUtterance = "end_of_utterance"
    }

}
