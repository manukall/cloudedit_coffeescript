class Document
  include Mongoid::Document
  include Mongoid::Timestamps

  attr_accessible :body, :title

  def as_json(options = {})
    {
      id: _id,
      title: title,
      created_at: created_at,
      body: body
    }
  end

end
