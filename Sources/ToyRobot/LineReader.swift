import Foundation

// Usage:
//
// guard let reader = LineReader(path: "/Path/to/file.txt") else {
//     return; // cannot open file
// }
//
// for line in reader {
//     print(">" + line.trimmingCharacters(in: .whitespacesAndNewlines))
// }

/// Read text file line by line
public class LineReader {
    public let path: String

    fileprivate let file: UnsafeMutablePointer<FILE>!

    init?(path: String) {
        self.path = path
        file = fopen(path, "r")
        guard file != nil else { return nil }
    }

    public var nextLine: String? {
        var line:UnsafeMutablePointer<CChar>? = nil
        var linecap:Int = 0
        defer { free(line) }
        return getline(&line, &linecap, file) > 0 ? String(cString: line!) : nil
    }

    deinit {
        fclose(file)
    }
}

extension LineReader: Sequence {
    public func makeIterator() -> AnyIterator<String> {
        return AnyIterator<String> {
            return self.nextLine
        }
    }
}
