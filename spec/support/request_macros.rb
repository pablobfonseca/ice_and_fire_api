module RequestMacros
  def load_json_from(path)
    file = File.read(path)

    parse_json(file)
  end

  def response_body
    parse_json(response.body)
  end

  private

  def parse_json(json)
    JSON.parse(json, symbolize_names: true)
  end
end
