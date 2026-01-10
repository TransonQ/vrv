import { PagePage } from '@/pages/page'
import { RootPage } from '@/pages/root'
import { createBrowserRouter } from 'react-router'
import { ROUTES } from './configs'

export const router = createBrowserRouter([
  {
    path: ROUTES.ROOT,
    element: <RootPage />,
  },
  {
    path: ROUTES.PAGE,
    element: <PagePage />,
  },
])
