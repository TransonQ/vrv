// 测试增量检查 - 故意制造不能自动修复的错误
export const UnusedVariable = "未使用的变量"; // ESLint警告：未使用变量
export function getString(): string {
  const num: number = 123; // 定义但未使用
  // 返回类型错误
  return num; // TypeScript错误：类型不匹配
}
