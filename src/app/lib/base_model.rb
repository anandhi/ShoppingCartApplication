require_relative '../../data_source/store'
require 'json'

class BaseModel
  attr_accessor :id

  def initialize
    self.id = Time.now.to_i
  end

  def persist
    Store.add(self.class.name, self.id, self.to_json)
  end

  def self.find(id)
    JSON.load(Store.find(self.name, id))
  end

  :private
  def to_json
    hash = {}
    self.instance_variables.each do |var|
      value = self.instance_variable_get(var)
      if !%q('String', 'Fixnum').include?(value.class.name)
        sub_hash = {}
        hash[value.class.name] = sub_hash
        value.instance_variables.each do |sub_object|
           sub_hash[sub_object.to_s.delete("@")] = value.instance_variable_get(sub_object)
        end
      else
        hash[var.to_s.delete("@")] = value
      end
    end
    hash.to_json
  end

  :private
  def from_json! string
    JSON.load(string).each do |var, val|
      self.instance_variable_set "@#{var}", val
    end
  end
end