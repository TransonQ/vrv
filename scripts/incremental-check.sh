#!/bin/bash
# 增量代码检查脚本 - 检查暂存的文件

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  增量代码质量检查"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# 读取配置
if [ -f "package.json" ]; then
  ESLINT_CONFIG=$(grep -A 2 '"codeQuality"' package.json | grep '"eslint"' | cut -d '"' -f 4)
  TS_CONFIG=$(grep -A 2 '"codeQuality"' package.json | grep '"typescript"' | cut -d ':' -f 2 | tr -d ' ,')
else
  ESLINT_CONFIG="all"
  TS_CONFIG="true"
fi

echo "📋 当前配置："
echo "  • ESLint: $ESLINT_CONFIG"
echo "  • TypeScript: $TS_CONFIG"
echo ""
echo "💡 提示：只检查暂存区的变更文件，大幅提升性能"
echo ""

# 获取暂存区中的 TypeScript/JavaScript 文件
STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep -E '\.(ts|tsx|js|jsx)$' || true)

if [ -z "$STAGED_FILES" ]; then
  echo "✅ 没有需要检查的 TypeScript/JavaScript 文件"
  exit 0
fi

echo "📁 需要检查的文件："
echo "$STAGED_FILES" | sed 's/^/  - /'
echo ""

# 设置退出码
TS_ERROR=0
ESLINT_ERROR=0

# 检查 ESLint (根据配置)
if [ "$ESLINT_CONFIG" = "off" ]; then
  echo "① ESLint 检查已跳过（配置: off）"
elif [ "$ESLINT_CONFIG" = "error" ]; then
  echo "① 检查 ESLint 错误..."
  if [ -n "$STAGED_FILES" ]; then
    echo "$STAGED_FILES" | xargs pnpm exec eslint --cache --max-warnings 0
    ESLINT_ERROR=$?
  fi
  if [ $ESLINT_ERROR -eq 0 ]; then
    echo "   ESLint: ✅ 通过"
  else
    echo "   ESLint: ❌ 失败"
  fi
else
  echo "① 检查 ESLint 错误和警告..."
  if [ -n "$STAGED_FILES" ]; then
    echo "$STAGED_FILES" | xargs pnpm exec eslint --cache
    ESLINT_ERROR=$?
  fi
  if [ $ESLINT_ERROR -eq 0 ]; then
    echo "   ESLint: ✅ 通过"
  else
    echo "   ESLint: ❌ 失败"
  fi
fi
echo ""

# 检查 TypeScript (始终开启)
echo "② 检查 TypeScript 类型..."

# 检查是否有增量构建文件
if [ -f "node_modules/.tmp/tsconfig.app.tsbuildinfo" ]; then
  echo "   💾 使用增量编译缓存..."
fi

pnpm exec tsc -b --noEmit
TS_ERROR=$?

if [ $TS_ERROR -eq 0 ]; then
  echo "   TypeScript: ✅ 通过"
else
  echo "   TypeScript: ❌ 失败"
fi
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ $ESLINT_ERROR -ne 0 ] || [ $TS_ERROR -ne 0 ]; then
  echo "❌ 代码检查失败！"
  echo ""
  echo "检查结果："
  echo "  • ESLint: $([ $ESLINT_ERROR -eq 0 ] && echo '✅' || echo '❌')"
  echo "  • TypeScript: $([ $TS_ERROR -eq 0 ] && echo '✅' || echo '❌')"
  echo ""
  echo "请修复上述错误后重新提交。"
  exit 1
else
  echo "✅ 增量检查通过！代码质量良好 ✨"
  echo ""
  echo "性能优化："
  echo "  • ESLint: 只检查暂存文件 + 缓存加速"
  echo "  • TypeScript: 使用增量编译"
  exit 0
fi
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
