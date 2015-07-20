class Store
  @@in_memory_store = {
      :Seller => {},
      :Product => {},
      :Listing => {},
      :Product => {},
      :User => {},
      :Cart => {},
      :Order => {},
      :Payment => {}
  }

  def self.add(klass_name, id, value)
    raise "No store defined for #{klass_name}" unless @@in_memory_store.include?(klass_name.to_sym)
    raise 'Id should not be blank' if id.nil?
    store = @@in_memory_store[klass_name.to_sym]
    store[id] = value
  end

  def self.find(klass_name, id)
    raise "No store defined for #{klass_name}" unless @@in_memory_store.include?(klass_name.to_sym)
    raise 'Id should not be blank' if id.nil?
    @@in_memory_store[klass_name.to_sym][id]
  end

end