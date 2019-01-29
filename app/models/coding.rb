class Coding < ApplicationRecord
  belongs_to :text
  belongs_to :code_1, :class_name => 'Code', optional: true
  belongs_to :code_2, :class_name => 'Code', optional: true
  belongs_to :topic, optional: true
  belongs_to :user

end
