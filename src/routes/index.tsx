import { ExamplePage } from '@/pages/example'
import { RootPage } from '@/pages/root'
import { createBrowserRouter } from 'react-router'
import { ROUTES } from './configs'

export const router = createBrowserRouter([
  {
    path: ROUTES.ROOT,
    element: <RootPage />,
  },
  {
    path: ROUTES.EXAMPLE,
    element: <ExamplePage />,
  },
])
