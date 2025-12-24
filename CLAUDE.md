# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Vite + React 19 + TypeScript** template for rapid development. It features an automated incremental code quality checking system optimized for performance.

**Key Technologies:**
- Vite 7.3.0 (build tool)
- React 19.2.3 (UI library)
- TypeScript 5.9.3 (type safety)
- ESLint 9.39.2 (linting)
- pnpm 10.25.0 (package manager)
- React Compiler (via `babel-plugin-react-compiler`)

## Common Commands

### Development
```bash
pnpm dev          # Start dev server on http://localhost:5173
pnpm build        # Production build
pnpm preview      # Preview production build locally
```

### Code Quality
```bash
pnpm lint         # Run ESLint on all files
pnpm check        # Full check: TypeScript + ESLint on all files

# Incremental check (only staged files - runs automatically on commit)
./scripts/incremental-check.sh
```

### Dependencies
```bash
pnpm install      # Install dependencies
pnpm update       # Update dependencies
pnpm add [pkg]    # Add production dependency
pnpm add -D [pkg] # Add dev dependency
```

### Git
```bash
git commit -m "message"           # Runs pre-commit hook automatically
git commit -m "message" --no-verify  # Skip code quality checks (emergency only)
```

## Architecture

### Source Structure
```
src/
├── main.tsx           # React entry point (creates root and renders App)
├── app.tsx            # Main App component
├── global.css         # Global styles
├── vite-env.d.ts      # Vite type definitions
└── assets/            # Static assets
```

### Build Configuration
- **Vite**: `vite.config.ts` - React setup with `babel-plugin-react-compiler` and path alias `"@"` → `"./src"`
- **TypeScript**: Project references (`tsconfig.app.json`, `tsconfig.node.json`)
- **ESLint**: `eslint.config.js` - Modern flat config with TypeScript and React rules
- **VSCode**: Auto-organize imports and fix ESLint on save (`.vscode/settings.json`)

### Entry Point Flow
`main.tsx:1-6` → Creates React root → Renders `<App />` component from `app.tsx:1-3`

## Code Quality System

This template includes an **automated incremental checking system** designed for speed:

### How It Works
1. Pre-commit hook (`.husky/pre-commit:1`) runs `scripts/incremental-check.sh`
2. Script reads configuration from `package.json` → `codeQuality` section
3. Only checks staged files (via `git diff --cached`), not entire codebase
4. Uses caches (ESLint + TypeScript incremental compilation) for performance

### Configuration
Edit `package.json` → `codeQuality` section:

```json
{
  "codeQuality": {
    "eslint": "all",      // "all" | "error" | "off"
    "typescript": true    // Always enabled
  }
}
```

**ESLint Options:**
- `"all"` - Check errors and warnings (default, recommended)
- `"error"` - Check only errors, ignore warnings
- `"off"` - Skip ESLint entirely

**Performance:**
- Small projects (50 files): ~0.5-1s (5-10x faster than full check)
- Large projects (500+ files): ~1-3s (20-60x faster than full check)

### Custom ESLint Rules
Key rules in `eslint.config.js:22-45`:
- `@typescript-eslint/no-explicit-any: 'off'` - Allows `any` type
- `@typescript-eslint/no-unused-vars: [warn, {...}]` - Warns on unused vars (ignores function params, `_`-prefixed vars)
- `@typescript-eslint/no-unused-expressions: [error, {...}]` - Errors on useless expressions (allows short-circuit and ternary)

## Important Notes

- **TypeScript is always enabled** in code quality checks (cannot be disabled)
- **Path alias**: Use `"@"` to import from `src/` (configured in `tsconfig.json:13-16`)
- **Emergency bypass**: Use `git commit --no-verify` to skip all hooks (use sparingly)
- **Clear caches**: `rm .eslintcache` or delete `node_modules/.tmp`
- **No test framework configured** - Add Jest, Vitest, or Testing Library as needed
- **React Compiler**: Already configured via `babel-plugin-react-compiler` in `vite.config.ts`
- **Node version**: Requires >= 24.0.0 (managed via Volta, see `.node-version` and `package.json:11-12`)

## Documentation

- **README.md**: Setup, features, and usage instructions
- **README_zh.md**: Chinese version of project documentation
- **docs/CODE_QUALITY.md**: Detailed code quality system documentation (中文)
- **package.json scripts**: All available npm scripts
