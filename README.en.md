# eECHOo 〰️

[中文](README.md) | **English**

Call out your research and listen for what echoes back from a paper.

eECHOo is an AI agent skill. Give it a research paper (PDF) and tell it about your research, and it finds **which specific parts of the paper relate to your work and how you can use them**. The output is an "echo card" with verbatim quotes and page numbers. It is not a summarizer: anyone can write a summary. What eECHOo does is match the paper precisely against *your* research.

Example card: [eechoo/cards/2022-zhang-school-education-eyesight.md](eechoo/cards/2022-zhang-school-education-eyesight.md) (cards are written in the language you use with the agent; this one is in Chinese)

## Supported tools

| Tool | Skill folder it uses |
|---|---|
| Claude Code | `.claude/skills/eechoo/` |
| Codex (ChatGPT desktop app, Codex CLI, IDE extension) | `.agents/skills/eechoo/` |
| Gemini CLI | `.agents/skills/eechoo/` |
| Antigravity | `.agents/skills/eechoo/` |

Codex, Gemini CLI and Antigravity all read `.agents/skills/`, so they share one copy.

## Installation

### Option 1: Use it in this folder only

Download (or clone) this repository and open any of the tools above inside the repository folder. The tool discovers the skill automatically; nothing else is needed.

### Option 2: Install globally to use it in any folder

**Claude Code**

```bash
mkdir -p ~/.claude/skills && cp -R .claude/skills/eechoo ~/.claude/skills/
```

**Codex and Gemini CLI** (both read `~/.agents/skills/`, so one install covers both)

```bash
mkdir -p ~/.agents/skills && cp -R .agents/skills/eechoo ~/.agents/skills/
```

**Antigravity**: the global skill folder differs between versions (for example `~/.gemini/antigravity/skills/`). Check the official Antigravity documentation, or simply use Option 1.

> Since June 2026, Google has replaced Gemini CLI with Antigravity CLI for free-tier users. If you can't install Gemini CLI, use Antigravity instead.

## Usage

Just ask in plain language, for example:

> Is this paper relevant to my research? ~/Downloads/paper.pdf

You can also invoke it by name: type `/eechoo` in Claude Code or `$eechoo` in Codex. Gemini CLI asks for your permission to activate the skill the first time (run `/skills list` to check that it is installed).

On first use, eECHOo asks a few questions about your research (field, research question, methods, study population or data, current stage, and what does *not* count as relevant) and saves the answers as a research profile. Every paper after that is judged against this profile.

## Reading PDFs

| Tool | How it reads | Notes |
|---|---|---|
| Claude Code | Reads the PDF directly, including figures | On macOS, install poppler first: `brew install poppler`. Without it, eECHOo falls back to text extraction |
| Gemini CLI / Antigravity | Reads the PDF directly, including figures | Nothing extra to install |
| Codex | Converts the PDF to text first | Nothing to install on macOS; Windows / Linux need `pip install pypdf` |

Text extraction cannot see images, so data shown only in figures is judged from captions and the main text.

## Generated files

Everything is saved under `eechoo/` in your current working folder:

```
eechoo/
├── profile.md       # your research profile; you can edit it directly
└── cards/           # one echo card per paper
```

## Modifying the skill

The two skill copies have identical `assets/` (card and profile templates) and `scripts/extract_pdf_text.swift`. When you change one, update the other as well.

## License

This project is released under the [MIT License](LICENSE).

The quotes in the example card come from Zhang et al., 2022, *JAMA Network Open*. Copyright remains with the original authors; they are quoted under the paper's CC-BY license.
