# vrv

vrv = vite-react-vscode

## 🚀 Use This Template

```bash
npx degit TransonQ/vrv [my-project]
```

After creating your project, install dependencies:

```bash
pnpm install
```

Then start the development server:

```bash
pnpm dev
```

## ✨ Features

- ⚡️ [Vite](https://vitejs.dev/) - Lightning-fast build tool
- ⚛️ [React 19](https://react.dev/) - Latest version of React
- 🔷 [TypeScript](https://www.typescriptlang.org/) - Type safety
- 🎨 [Tailwind CSS](https://tailwindcss.com/) - Utility-first CSS framework (optional)
- 🔍 **Automated Code Quality Checks** - ESLint + TypeScript incremental validation

## React Compiler

[How to use react-compiler](https://react.dev/learn/react-compiler/installation#vite)

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

## Tailwind CSS Formatting

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

### How It Works

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

### Skip Checks (Emergency)

```bash
git commit -m "Emergency fix" --no-verify
```

### Manual Run

```bash
# Run incremental check
./scripts/incremental-check.sh

# Run full check
pnpm check
```

### Example Output

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Incremental Code Quality Check
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📋 Current Configuration:
  • ESLint: all
  • TypeScript: true

💡 Tip: Checking only staged files for maximum performance

📁 Files to check:
  - src/new-feature.ts

① Checking ESLint errors and warnings...
   ESLint: ✅ Passed

② Checking TypeScript types...
   TypeScript: ✅ Passed

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ All checks passed! Code quality is excellent ✨
```

For detailed documentation, see [docs/CODE_QUALITY.md](docs/CODE_QUALITY.md).
