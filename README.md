# eECHOo 〰️

**中文** | [English](README.en.md)

把你的研究"喊"出去，听听一篇论文会传回哪些回声。

eECHOo 是一个 AI agent skill：给它一篇论文（PDF）和你的研究方向，它会找出论文里**哪些具体内容和你的研究有关、有什么用**，并输出带原文引用和页码的"回声卡片"。它不是摘要工具，摘要谁都能写；它做的是把论文和*你的*研究精确地对上。

卡片示例：[eechoo/cards/2022-zhang-school-education-eyesight.md](eechoo/cards/2022-zhang-school-education-eyesight.md)

## 支持的工具

| 工具 | 使用的 skill 文件夹 |
|---|---|
| Claude Code | `.claude/skills/eechoo/` |
| Codex（ChatGPT 桌面应用、Codex CLI、IDE 插件） | `.agents/skills/eechoo/` |
| Gemini CLI | `.agents/skills/eechoo/` |
| Antigravity | `.agents/skills/eechoo/` |

Codex、Gemini CLI 和 Antigravity 都会读 `.agents/skills/`，所以它们共用同一份。

## 安装

### 方式一：只在这个文件夹里用

下载（或 clone）这个仓库，在仓库文件夹里打开上面任意一个工具，它会自动发现 skill，不需要额外操作。

### 方式二：全局安装，在任何文件夹都能用

**Claude Code**

```bash
mkdir -p ~/.claude/skills && cp -R .claude/skills/eechoo ~/.claude/skills/
```

**Codex 和 Gemini CLI**（两者都读 `~/.agents/skills/`，装一次就够）

```bash
mkdir -p ~/.agents/skills && cp -R .agents/skills/eechoo ~/.agents/skills/
```

**Antigravity**：全局 skill 的存放位置因版本而异（例如 `~/.gemini/antigravity/skills/`），请以 Antigravity 官方文档为准；也可以直接用方式一。

> 2026 年 6 月起，Google 对免费用户用 Antigravity CLI 取代了 Gemini CLI。如果你装不了 Gemini CLI，改用 Antigravity 即可。

## 使用

直接用自然语言说就行，例如：

> 帮我看看这篇论文和我的研究有没有关系：~/Downloads/paper.pdf

也可以点名调用：Claude Code 输入 `/eechoo`，Codex 输入 `$eechoo`，Gemini CLI 第一次使用时会请你授权激活（可用 `/skills list` 查看是否装好）。

第一次使用时，eECHOo 会问你几个关于研究的问题（领域、研究问题、方法、研究对象、当前阶段、什么不算相关），并保存成研究档案。之后每篇论文都按这份档案判断。

## 读 PDF

| 工具 | 读法 | 建议 |
|---|---|---|
| Claude Code | 直接读，能看到图表 | macOS 需先安装 poppler：`brew install poppler`。没装时会自动改用文字提取 |
| Gemini CLI / Antigravity | 直接读，能看到图表 | 无需额外安装 |
| Codex | 先把 PDF 转成文字再读 | macOS 无需安装；Windows / Linux 需要 `pip install pypdf` |

文字提取看不到图像，图里的数据只能依靠图注和正文判断。

## 生成的文件

所有文件都保存在你当前工作文件夹的 `eechoo/` 下：

```
eechoo/
├── profile.md       # 你的研究档案，可以直接编辑
└── cards/           # 每篇论文一张回声卡片
```

## 修改 skill

两份 skill 的 `assets/`（卡片模板、档案模板）和 `scripts/extract_pdf_text.swift` 内容完全相同。修改其中一份时，记得同步改另一份。

## 许可证

本项目采用 [MIT 许可证](LICENSE)。

示例卡片中引用的论文原文（Zhang et al., 2022, *JAMA Network Open*）版权归原作者所有，按 CC-BY 许可引用。
