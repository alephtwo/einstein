# Application Helper
module ApplicationHelper
  def bootstrap_flash_class(flash_type)
    {
      success: 'success',
      error:   'danger',
      alert:   'warning',
      notice:  'info'
    }[flash_type.to_sym] || flash_type.to_s
  end
end
