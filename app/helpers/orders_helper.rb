module OrdersHelper
  require 'rqrcode'
  def generate_qr(text)
    qrcode = RQRCode::QRCode.new(text)
    qrcode.as_svg(
        offset: 0,
        color: '000',
        shape_rendering: 'crispEdges',
        module_size: 3,
        standalone: true
    ).html_safe
  end
end
