class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :option, :correct, :explanation
end
