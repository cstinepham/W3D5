class AttrAccessorObject
  def self.my_attr_accessor(*names)
    #getter
    names.each do |name|
      define_method(name) do
        instance_variable_get("@#{name}")
      end
    # setter
      define_method("#{name}=") do |value|
        instance_variable_set("@#{name}", value)
      end
    end
  end
end
