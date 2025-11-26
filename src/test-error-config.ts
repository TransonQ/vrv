// 测试error配置 - 有警告但没错误
export const unusedVariable = "这个变量未使用，ESLint只会警告"; // 警告，不是错误

export function testError(): number {
  return 123; // 正确的类型
}
