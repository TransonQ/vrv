// 这个文件有真正的错误
export function test(): number {
  return "错误类型"; // 这个错误应该被检测到
}
