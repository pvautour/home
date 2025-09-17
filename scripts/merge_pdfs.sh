#!/usr/bin/env bash
# merge_pdfs.sh — merge all PDFs in this folder, starting with 1.pdf then 2.pdf
# Usage: ./merge_pdfs.sh [output.pdf]
set -euo pipefail

OUT="${1:-merged.pdf}"

# Ensure we have a merger tool
if command -v qpdf >/dev/null 2>&1; then
  MERGER="qpdf"
elif command -v pdfunite >/dev/null 2>&1; then
  MERGER="pdfunite"
else
  echo "Error: need either 'qpdf' or 'pdfunite' installed." >&2
  echo "On Debian/Ubuntu: sudo apt-get install qpdf poppler-utils" >&2
  echo "On Fedora: sudo dnf install qpdf poppler-utils" >&2
  exit 1
fi

# Build the ordered list: 1.pdf, 2.pdf, then the rest (naturally sorted)
declare -a FILES=()
[[ -f "1.pdf" ]] && FILES+=("1.pdf")
[[ -f "2.pdf" ]] && FILES+=("2.pdf")

# Find all other PDFs (handle spaces, case-insensitive *.pdf), version-sort
# and exclude 1.pdf / 2.pdf if present
mapfile -d '' REST < <(
  find . -maxdepth 1 -type f \( -iname '*.pdf' \) -printf '%P\0' |
  grep -zivx -e '1.pdf' -e '2.pdf' |
  sort -z -V
)
for f in "${REST[@]:-}"; do
  # Skip empty entries (in case no matches)
  [[ -n "$f" ]] && FILES+=("$f")
done

if [[ ${#FILES[@]} -eq 0 ]]; then
  echo "No PDFs found in the current directory." >&2
  exit 1
fi

# Do the merge
if [[ "$MERGER" = "qpdf" ]]; then
  # qpdf concatenates pages without re-encoding -> preserves CMYK/quality
  # Syntax: qpdf --empty --pages in1 in2 ... -- out.pdf
  qpdf --empty --pages "${FILES[@]}" -- "$OUT"
else
  # pdfunite also merges without recompressing typical content streams
  pdfunite "${FILES[@]}" "$OUT"
fi

echo "Done: wrote '$OUT'"
