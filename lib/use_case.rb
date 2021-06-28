# lib/use_case.rb
module UseCase
  extend ActiveSupport::Concern
  include ActiveModel::Validations

  module ClassMethods
    def perform(*args)
      # tag logs with the name of the use_case class
      Rails.logger.tagged(name) do
        new(*args).tap { |use_case| use_case.perform if use_case.valid? }
      end
    end
  end

  # implement all the steps required to complete this use case
  def perform
    fail NotImplementedError
  end
end
