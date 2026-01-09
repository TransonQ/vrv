import js from '@eslint/js'
import reactHooks from 'eslint-plugin-react-hooks'
import reactRefresh from 'eslint-plugin-react-refresh'
import { defineConfig, globalIgnores } from 'eslint/config'
import globals from 'globals'
import tseslint from 'typescript-eslint'

export default defineConfig([
  globalIgnores(['dist']),
  js.configs.recommended,
  ...tseslint.configs.recommended,
  {
    files: ['**/*.{ts,tsx}'],
    plugins: {
      'react-hooks': reactHooks,
      'react-refresh': reactRefresh,
    },
    languageOptions: {
      ecmaVersion: 2020,
      globals: globals.browser,
    },
    rules: {
      ...reactHooks.configs.recommended.rules,
      'react-refresh/only-export-components': [
        'warn',
        { allowConstantExport: true },
      ],
      '@typescript-eslint/no-explicit-any': 'off', // 放开对 any 的限制
      '@typescript-eslint/no-unused-vars': [
        'warn',
        {
          args: 'none', // 忽略函数参数
          caughtErrors: 'none', // 忽略捕获的错误
          destructuredArrayIgnorePattern: '^_', // 忽略解构数组中以下划线开头的变量
          varsIgnorePattern: '^_', // 忽略以下划线开头的变量
        },
      ],
      '@typescript-eslint/no-unused-expressions': [
        'error',
        {
          allowShortCircuit: true, // 允许短路逻辑表达式
          allowTernary: true, // 可选：允许三元表达式
        },
      ],
    },
  },
])
