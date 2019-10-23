module Emojimmy
  module Mixin
    def self.inject_methods(model, attributes)
      attributes.each do |attribute|
        model.class_eval <<-RUBY, __FILE__, __LINE__ + 1
          

          # When calling the attribute name, convert its value
          def #{attribute}
            Emojimmy.token_to_emoji(super)
          end
        RUBY
      end
    end
  end
end
