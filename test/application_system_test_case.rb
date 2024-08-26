require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # Configura el navegador que se usará para las pruebas de sistema.
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
end
