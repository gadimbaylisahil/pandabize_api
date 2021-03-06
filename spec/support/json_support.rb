module JsonSupport
  def get_json(resource:, filename:)
    JSON.parse(File.read(Rails.root.join("spec",
                                         "fixtures",
                                         "json",
                                         resource.to_s,
                                         "#{filename}.json")))
  end
end
