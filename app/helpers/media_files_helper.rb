module MediaFilesHelper
  def get_host(url)
    request.host+":"+request.port.to_s+url
  end
end
