#!/usr/bin/env python3
"""Extract text from a PDF page by page (cross-platform; needs `pip install pypdf`).

Usage: python3 extract_pdf_text.py <file.pdf> [out.txt]
"""
import os
import sys


def main():
    if len(sys.argv) < 2:
        sys.exit("usage: python3 extract_pdf_text.py <file.pdf> [out.txt]")
    if not os.path.isfile(sys.argv[1]):
        sys.exit(f"file not found: {sys.argv[1]}")
    try:
        from pypdf import PdfReader
    except ImportError:
        sys.exit("pypdf is not installed. Install it with: pip install pypdf")

    reader = PdfReader(sys.argv[1])
    total = len(reader.pages)
    out = ""
    for i, page in enumerate(reader.pages, start=1):
        out += f"\n===== PAGE {i} / {total} =====\n"
        out += (page.extract_text() or "[no extractable text on this page]") + "\n"

    if len(sys.argv) >= 3:
        with open(sys.argv[2], "w", encoding="utf-8") as f:
            f.write(out)
        print(f"wrote {total} pages to {sys.argv[2]}")
    else:
        print(out)


if __name__ == "__main__":
    main()
