class NodeInfoController < ApplicationController
  def jrd
    render json: NodeInfo.jrd(CGI.unescape(node_info_url("123.123").sub("123.123", "%{version}")))
  end

  def document
    if NodeInfo.supported_version?(params[:version])
      document = NodeInfoPresenter.new(params[:version])
      render json: document, content_type: document.content_type
    else
      head :not_found
    end
  end

  def statistics
    @statistics = NodeInfoPresenter.new("1.0")
  end
end
