import { Application } from "@hotwired/stimulus"

const application = Application.start()

import { Alert } from "tailwindcss-stimulus-components"
import PasswordVisibility from '@stimulus-components/password-visibility'

application.register("alert", Alert)
application.register('password-visibility', PasswordVisibility)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
