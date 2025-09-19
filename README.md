# vrv

## use template
```
npx degit TransonQ/vrv [my-project]
```

## tailwind format

```bash
pnpm i -D prettier-plugin-tailwindcss
```

.prettierrc
```json
{
  "plugins": ["prettier-plugin-tailwindcss"],
  "tailwindStylesheet": "./src/global.css",
  // existing code
}
```