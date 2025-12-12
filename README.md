# vrv

vrv = vite-react-vscode

## 🚀 Use This Template

### Create a Project

```bash
npx degit TransonQ/vrv [your-project-name]
```

For example:

```bash
npx degit TransonQ/vrv my-awesome-app
```

### Install Dependencies

Navigate to the project directory and install dependencies:

```bash
cd my-awesome-app
pnpm install
```

### Start Development Server

```bash
pnpm dev
```

Visit [http://localhost:5173](http://localhost:5173) to view the application.

## ✨ Features

- ⚡️ [Vite](https://vitejs.dev/) - Lightning-fast build tool
- ⚛️ [React 19](https://react.dev/) - Latest version of React
- 🔷 [TypeScript](https://www.typescriptlang.org/) - Type safety
- 🎨 [Tailwind CSS](https://tailwindcss.com/) - Utility-first CSS framework (optional)
- 🔍 **Automated Code Quality Checks** - ESLint + TypeScript incremental validation

## 📦 Project Commands

### Development Mode

```bash
pnpm dev
```

### Production Build

```bash
pnpm build
```

### Preview Build

```bash
pnpm preview
```

## 🔍 Code Quality Checks

This template includes automated code quality checks that run before every commit, ensuring code quality and consistency.

### Configuration

Edit the `codeQuality` section in `package.json`:

```json
{
  "codeQuality": {
    "eslint": "all", // "all" | "error" | "off"
    "typescript": true // Always enabled
  }
}
```

**ESLint Configuration Options:**

- `"all"` - Check both errors and warnings (default)
- `"error"` - Check only errors, ignore warnings
- `"off"` - Skip ESLint checks

**TypeScript Configuration:**

- Always enabled, cannot be disabled

### How It Works

Every time you run `git commit`, it automatically:

1. ✅ Checks only staged files (incremental checking)
2. ✅ Runs ESLint with cache for performance
3. ✅ Runs TypeScript type checking
4. ❌ Blocks commit if errors are found

### Performance Optimization

Incremental checking is **5-60x faster** than full checks:

| Project Size       | Full Check | Incremental Check |
| ------------------ | ---------- | ----------------- |
| Small (50 files)   | ~3-5s      | ~0.5-1s           |
| Medium (200 files) | ~10-20s    | ~1-2s             |
| Large (500+ files) | ~30-60s    | ~1-3s             |

### Skip Checks (Emergency)

The `--no-verify` flag bypasses pre-commit hooks:

```bash
git commit -m "Emergency fix" --no-verify
```

This allows you to skip code quality checks in urgent situations. **Use sparingly!**

💡 **How it works**: Git's `--no-verify` flag skips all pre-commit hooks, including our code quality check script.

### Manual Run

```bash
# Run incremental check
./scripts/incremental-check.sh

# Run full check (checks all files)
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

### Detailed Documentation

For complete configuration guide, see [docs/CODE_QUALITY.md](docs/CODE_QUALITY.md).

[React Compiler Usage Guide](https://react.dev/learn/react-compiler/installation#vite)

## 🎨 Tailwind CSS Formatting (Optional)

To enable automatic Tailwind class sorting:

### Install Dependencies

```bash
pnpm i -D prettier-plugin-tailwindcss
```

### Configure .prettierrc

```json
{
  "plugins": ["prettier-plugin-tailwindcss"],
  "tailwindStylesheet": "./src/global.css"
  // other configurations
}
```

Then install the Prettier extension in VSCode, or run formatting manually:

```bash
pnpm exec prettier --write .
```

## 📁 Project Structure

```
project-root/
├── public/                 # Static assets
├── src/                    # Source code
│   ├── main.tsx           # Entry file
│   └── app.tsx            # Main app component
├── package.json           # Project configuration
├── tsconfig.json          # TypeScript configuration
├── vite.config.ts         # Vite configuration
├── eslint.config.js       # ESLint configuration
└── scripts/
    └── incremental-check.sh  # Incremental check script
```

## 🐛 FAQ

**Q: How to update project dependencies?**
A: Run `pnpm update`

**Q: How to add new dependencies?**
A: Run `pnpm add [package-name]`, for dev dependencies use `pnpm add -D [package-name]`

**Q: How to modify code style configuration?**
A: Edit the `eslint.config.js` file

**Q: Where is TypeScript configuration?**
A: Main configurations are in `tsconfig.json`, `tsconfig.app.json`, `tsconfig.node.json`

**Q: How to clear code check cache?**
A: Run `rm .eslintcache` or delete the `node_modules/.tmp` directory
