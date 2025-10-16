# vrv

vrv = vite-react-vscode

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
