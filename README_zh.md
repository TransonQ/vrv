# vrv 项目模板

vrv = vite-react-vscode

## 🚀 如何使用本模板

### 创建项目

```bash
npx degit TransonQ/vrv [你的项目名称]
```

例如：

```bash
npx degit TransonQ/vrv my-awesome-app
```

### 安装依赖

进入项目目录并安装依赖：

```bash
cd my-awesome-app
pnpm install
```

### 启动开发服务器

```bash
pnpm dev
```

## ✨ 项目特性

- ⚡️ [Vite](https://vitejs.dev/) - 极速的前端构建工具
- ⚛️ [React 19](https://react.dev/) - 最新版本的 React
- 🔷 [TypeScript](https://www.typescriptlang.org/) - 类型安全支持
- 🎨 [Tailwind CSS](https://tailwindcss.com/) - 原子化 CSS 框架（可选）
- 🔍 **自动化代码质量检查** - ESLint + TypeScript 增量校验

## 📦 项目构建

### 开发模式

```bash
pnpm dev
```

### 生产构建

```bash
pnpm build
```

### 预览构建结果

```bash
pnpm preview
```

## 🔍 代码质量检查

本模板内置了自动化代码质量检查系统，在每次 `git commit` 时自动执行，确保代码质量和一致性。

### 配置说明

编辑 `package.json` 文件中的 `codeQuality` 节：

```json
{
  "codeQuality": {
    "eslint": "all", // "all" | "error" | "off"
    "typescript": true // 始终开启
  }
}
```

**ESLint 配置选项：**

- `"all"` - 检查错误和警告（默认）
- `"error"` - 只检查错误，忽略警告
- `"off"` - 跳过 ESLint 检查

**TypeScript 配置：**

- 始终开启，无法关闭

### 工作原理

每次执行 `git commit` 时，系统会自动：

1. ✅ 只检查暂存的文件（增量检查）
2. ✅ 使用缓存加速 ESLint 检查
3. ✅ 执行 TypeScript 类型检查
4. ❌ 发现错误时阻止提交

### 性能优化

增量检查比全量检查快 **5-60 倍**：

| 项目规模                | 全量检查  | 增量检查  |
| ----------------------- | --------- | --------- |
| 小型项目（50 个文件）   | ~3-5 秒   | ~0.5-1 秒 |
| 中型项目（200 个文件）  | ~10-20 秒 | ~1-2 秒   |
| 大型项目（500+ 个文件） | ~30-60 秒 | ~1-3 秒   |

### 跳过检查（紧急情况）

`--no-verify` 参数可以跳过 pre-commit hooks：

```bash
git commit -m "紧急修复" --no-verify
```

这允许你在紧急情况下跳过代码质量检查。**请谨慎使用！**

💡 **工作机制**：Git 的 `--no-verify` 标志会跳过所有 pre-commit hooks，包括我们的代码质量检查脚本。

### 手动运行检查

```bash
# 运行增量检查
./scripts/incremental-check.sh

# 运行完整检查（检查所有文件）
pnpm check
```

### 运行示例

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  增量代码质量检查
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📋 当前配置：
  • ESLint: all
  • TypeScript: true

💡 提示：只检查暂存区的变更文件，大幅提升性能

📁 需要检查的文件：
  - src/new-feature.ts

① 检查 ESLint 错误和警告...
   ESLint: ✅ 通过

② 检查 TypeScript 类型...
   TypeScript: ✅ 通过

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ 增量检查通过！代码质量良好 ✨
```

### 详细文档

完整配置指南请查看：[docs/CODE_QUALITY.md](docs/CODE_QUALITY.md)

## 🛠️ React Compiler（可选）

如需使用 React Compiler，请按以下步骤配置：

[React Compiler 使用指南](https://react.dev/learn/react-compiler/installation#vite)

```ts
// vite.config.js
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [
    react({
      babel: {
        plugins: ['babel-plugin-react-compiler'],
      },
    }),
  ],
})
```

安装 React Compiler：

```bash
pnpm add -D babel-plugin-react-compiler
```

## 🎨 Tailwind CSS 格式化（可选）

如需启用 Tailwind CSS 类名自动排序：

### 安装依赖

```bash
pnpm i -D prettier-plugin-tailwindcss
```

### 配置 .prettierrc

```json
{
  "plugins": ["prettier-plugin-tailwindcss"],
  "tailwindStylesheet": "./src/global.css"
  // 其他配置
}
```

然后在 VSCode 中安装 Prettier 扩展，或手动运行格式化：

```bash
pnpm exec prettier --write .
```

## 📁 项目结构

```
项目根目录/
├── public/                 # 静态资源
├── src/                    # 源代码
│   ├── main.tsx           # 入口文件
│   └── app.tsx            # 主应用组件
├── package.json           # 项目配置
├── tsconfig.json          # TypeScript 配置
├── vite.config.ts         # Vite 配置
├── eslint.config.js       # ESLint 配置
└── scripts/
    └── incremental-check.sh  # 增量检查脚本
```

## 🐛 常见问题

**Q: 如何更新项目依赖？**
A: 运行 `pnpm update`

**Q: 如何添加新的依赖？**
A: 运行 `pnpm add [package-name]`，开发依赖使用 `pnpm add -D [package-name]`

**Q: 如何修改代码风格配置？**
A: 编辑 `eslint.config.js` 文件

**Q: TypeScript 配置在哪里？**
A: 主要配置在 `tsconfig.json`、`tsconfig.app.json`、`tsconfig.node.json`

**Q: 如何清除代码检查缓存？**
A: 运行 `rm .eslintcache` 或删除 `node_modules/.tmp` 目录

---

💡 **提示**：如果这个模板对你有帮助，请给项目点个 Star ⭐️
