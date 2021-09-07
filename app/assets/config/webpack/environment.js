// config/webpack/environment.js
import { environment } from '@rails/webpacker'

// Bootstrap 4 has a dependency over jQuery & Popper.js:
import { ProvidePlugin } from 'webpack'
environment.plugins.prepend(
  'Provide',
  new ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)

export default environment
