import { ROUTES } from '@/routes/configs'
import { useNavigate } from 'react-router'

export function ExamplePage() {
  const navigate = useNavigate()

  return (
    <div className='bg-purple-200 p-4 text-2xl'>
      <h1>示例页面</h1>
      <p className='mt-2'>这是 /example 路由的最小案例</p>
      <button
        className='rounded-xl border p-2 hover:ring-1'
        onClick={() => navigate(ROUTES.ROOT)}
      >
        返回首页
      </button>
    </div>
  )
}
