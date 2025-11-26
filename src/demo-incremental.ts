// 测试增量检查 - 只检查这个文件
export const BadName = "ESLint会警告命名问题"; // 应该是camelCase

export function getNumber(): number {
  return "字符串"; // TypeScript类型错误
}
