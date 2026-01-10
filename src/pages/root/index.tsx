import { ROUTES } from '@/routes/configs'
import { useNavigate } from 'react-router'

export function RootPage() {
  const navigate = useNavigate()

  return (
    <div className='bg-cyan-200 p-4 text-2xl'>
      <h1>vite-react-vscode-template</h1>
      <p className='mt-2'>这是首页路由</p>
      <button
        className='rounded-xl border p-2 hover:ring-1'
        onClick={() => navigate(ROUTES.EXAMPLE)}
      >
        跳转 /example
      </button>
    </div>
  )
}
