class Book < ApplicationRecord
  def as_json(options={})
    {
      data: {
        book: super(except: [:id, :created_at, :updated_at])
      }
    }.reverse_merge(options)
  end
end
