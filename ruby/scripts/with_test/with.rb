module
  def with(resource)
    begin
      yield
    ensure
      resource.dispose
    end
  end
end
