# vrv

vrv = vite-react-vscode

## ✨ Features

- ⚡️ [Vite](https://vitejs.dev/) - 极速的构建工具
- ⚛️ [React 19](https://react.dev/) - 最新版本的 React
- 🔷 [TypeScript](https://www.typescriptlang.org/) - 类型安全
- 🎨 [Tailwind CSS](https://tailwindcss.com/) - 原子化 CSS 框架
- 🔍 **自动代码质量检查** - ESLint + TypeScript 增量校验

## 🔍 Code Quality Checks

This template includes automated code quality checks that run before every commit, ensuring code quality and consistency.

### Configuration

Edit `package.json` to configure code quality checks:

```json
{
  "codeQuality": {
    "eslint": "all",      // "all" | "error" | "off"
    "typescript": true    // Always enabled
  }
}
```

**ESLint modes:**
- `"all"` - Check both errors and warnings (default)
- `"error"` - Check only errors, ignore warnings
- `"off"` - Skip ESLint checks

**TypeScript:**
- Always enabled, cannot be disabled

### How it works

Every time you run `git commit`, it automatically:

1. ✅ Checks only staged files (incremental checking)
2. ✅ Runs ESLint with cache for performance
3. ✅ Runs TypeScript type checking
4. ❌ Blocks commit if errors are found

### Performance

Incremental checking is **5-60x faster** than full checks:

| Project Size | Full Check | Incremental Check |
|-------------|-----------|-------------------|
| Small (50 files) | ~3-5s | ~0.5-1s |
| Medium (200 files) | ~10-20s | ~1-2s |
| Large (500+ files) | ~30-60s | ~1-3s |

### Skip checks (emergency)

```bash
git commit -m "Emergency fix" --no-verify
```

### Manual run

```bash
# Run incremental check
./scripts/incremental-check.sh

# Run full check
pnpm check
```

### Example output

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

For detailed documentation, see [docs/CODE_QUALITY.md](docs/CODE_QUALITY.md).

## use this template

```
npx degit TransonQ/vrv [my-project]
```

## react compiler

[how to use react-compiler](https://react.dev/learn/react-compiler/installation#vite)

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

## tailwind format

```bash
pnpm i -D prettier-plugin-tailwindcss
```

.prettierrc

```json
{
  "plugins": ["prettier-plugin-tailwindcss"],
  "tailwindStylesheet": "./src/global.css"
  // existing code
}
```
