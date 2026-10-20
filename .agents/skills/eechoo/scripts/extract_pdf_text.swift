// Extract text from a PDF page by page using macOS PDFKit (no installs needed).
// Usage: swift extract_pdf_text.swift <file.pdf> [out.txt]
import Foundation
import PDFKit

func fail(_ message: String) -> Never {
    FileHandle.standardError.write((message + "\n").data(using: .utf8)!)
    exit(1)
}

let args = CommandLine.arguments
guard args.count >= 2 else { fail("usage: swift extract_pdf_text.swift <file.pdf> [out.txt]") }
guard FileManager.default.fileExists(atPath: args[1]) else { fail("file not found: \(args[1])") }
guard let doc = PDFDocument(url: URL(fileURLWithPath: args[1])) else { fail("cannot open as PDF: \(args[1])") }

var out = ""
for i in 0..<doc.pageCount {
    out += "\n===== PAGE \(i + 1) / \(doc.pageCount) =====\n"
    out += doc.page(at: i)?.string ?? "[no extractable text on this page]"
    out += "\n"
}

if args.count >= 3 {
    try out.write(toFile: args[2], atomically: true, encoding: .utf8)
    print("wrote \(doc.pageCount) pages to \(args[2])")
} else {
    print(out)
}
