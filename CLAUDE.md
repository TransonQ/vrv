# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 项目概述

这是一个**Vite + React 19 + TypeScript** 模板，专为快速开发而设计。它包含了一个专为性能优化的自动化增量代码质量检查系统。

**核心技术：**

- Vite 7（构建工具）
- React 19（UI 库）
- TypeScript 5.9.3（类型安全）
- ESLint 9.39.2（代码检查）
- Tailwind CSS 4（样式，通过 `@tailwindcss/vite`）
- Prettier 3.7.4（代码格式化，含 Tailwind 插件）
- pnpm 10.25.0（包管理器）
- React Compiler（通过 `babel-plugin-react-compiler`）

## 常用命令

### 开发

```bash
pnpm dev          # 启动开发服务器 http://localhost:5173
pnpm build        # 生产构建
pnpm preview      # 本地预览生产构建
```

### 代码质量

```bash
pnpm lint         # 对所有文件运行 ESLint
pnpm check        # 完整检查：TypeScript + ESLint

# 增量检查（仅检查暂存文件 - 提交时自动运行）
./scripts/incremental-check.sh
```

### 代码格式化

```bash
pnpm exec prettier --write .    # 格式化所有文件
```

### 依赖管理

```bash
pnpm install      # 安装依赖
pnpm update       # 更新依赖
pnpm add [pkg]    # 添加生产依赖
pnpm add -D [pkg] # 添加开发依赖
```

### Git

```bash
git commit -m "message"           # 自动运行 pre-commit hook
git commit -m "message" --no-verify  # 跳过代码质量检查（紧急情况使用）
```

## 架构设计

### 源码结构

```
src/
├── main.tsx           # React 入口（创建 root 并渲染 App）
├── app.tsx            # 主 App 组件
├── global.css         # 全局样式
├── vite-env.d.ts      # Vite 类型定义
└── assets/            # 静态资源
```

### 构建配置

- **Vite**: `vite.config.ts` - React 配置，包含 `babel-plugin-react-compiler`、`@tailwindcss/vite` 和路径别名 `"@"` → `"./src"`
- **TypeScript**: 项目引用（`tsconfig.app.json`、`tsconfig.node.json`）
- **ESLint**: `eslint.config.js` - 现代化扁平配置，包含 TypeScript 和 React 规则
- **Prettier**: `.prettierrc` - 代码格式化配置，含 Tailwind 插件（semi: false, singleQuote: true, printWidth: 81）
- **VSCode**: `.vscode/settings.json` - 保存时自动使用 Prettier 格式化、自动整理导入、自动修复 ESLint

### 入口流程

`main.tsx:1-6` → 创建 React root → 渲染 `app.tsx:1-3` 中的 `<App />` 组件

## 代码质量系统

此模板包含一个**自动化增量检查系统**，专为速度优化：

### 工作原理

1. Pre-commit hook（`.husky/pre-commit:1`）运行 `scripts/incremental-check.sh`
2. 脚本从 `package.json` → `codeQuality` 部分读取配置
3. 仅检查暂存文件（通过 `git diff --cached`），而非整个代码库
4. 使用缓存（ESLint + TypeScript 增量编译）提升性能

### 配置

编辑 `package.json` → `codeQuality` 部分：

```json
{
  "codeQuality": {
    "eslint": "all", // "all" | "error" | "off"
    "typescript": true // 始终启用
  }
}
```

**ESLint 选项：**

- `"all"` - 检查错误和警告（默认，推荐）
- `"error"` - 仅检查错误，忽略警告
- `"off"` - 完全跳过 ESLint

**性能表现：**

- 小型项目（50 个文件）：~0.5-1s（比完整检查快 5-10 倍）
- 大型项目（500+ 个文件）：~1-3s（比完整检查快 20-60 倍）

### 自定义 ESLint 规则

`eslint.config.js:22-45` 中的关键规则：

- `@typescript-eslint/no-explicit-any: 'off'` - 允许 `any` 类型
- `@typescript-eslint/no-unused-vars: [warn, {...}]` - 未使用变量警告（忽略函数参数、`_` 开头的变量）
- `@typescript-eslint/no-unused-expressions: [error, {...}]` - 无用表达式报错（允许短路和三元表达式）

## 重要说明

- **TypeScript 始终启用**代码质量检查（无法禁用）
- **路径别名**：使用 `"@"` 从 `src/` 导入（配置于 `tsconfig.json:13-16`）
- **Tailwind CSS**：使用 v4 的 Vite 插件 - 类名在格式化时由 Prettier 插件自动排序
- **紧急绕过**：使用 `git commit --no-verify` 跳过所有 hook（请谨慎使用）
- **清除缓存**：`rm .eslintcache` 或删除 `node_modules/.tmp`
- **未配置测试框架** - 按需添加 Jest、Vitest 或 Testing Library
- **React Compiler**：已在 `vite.config.ts` 中通过 `babel-plugin-react-compiler` 配置
- **Node 版本**：要求 >= 24.0.0（通过 Volta 管理，见 `.node-version` 和 `package.json:11-12`）

## 代码风格

- **无分号**（`semi: false`）
- **单引号**（`singleQuote: true`、`jsxSingleQuote: true`）
- **尾随逗号**（`trailingComma: "es5"`）
- **81 字符行宽**（`printWidth: 81`）
- **Tailwind 类名**由 `prettier-plugin-tailwindcss` 自动排序

配置位于 `.prettierrc:1-12`。VSCode 保存时自动格式化。

## 文档

- **README.md**：项目设置、功能和使用说明
- **README_zh.md**：项目文档的中文版本
- **docs/CODE_QUALITY.md**：代码质量系统详细文档（中文）
- **package.json scripts**：所有可用的 npm 脚本
