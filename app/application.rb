class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path(/items/) #.split("/items/").last
      if @@items.find{|i| i.name == item_name}
        resp.write "#{item_name.price}"
      else
        resp.write "Item not found"
        resp.status = 400
      end

      resp.write "Route not found"

      resp.status = 404
    end

  end

end
