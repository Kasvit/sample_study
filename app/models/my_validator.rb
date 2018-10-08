# class MyValidator < ActiveModel::Validator
#   def validate(record)
#     if record.name == "John"
#       record.errors[:name] << 'cant be John'
#     end
#   end
# end