# encoding: utf-8
require 'active_model'

# rubocop:disable LineLength
module Isstempl
  # DslModel
  class DslModel
    include ActiveModel::Model

    # GitHub Account
    attr_accessor :account
    validates :account, presence: true

    # GitHub Repository
    attr_accessor :repository
    validates :repository, presence: true

    # Issue Title
    attr_accessor :title
    validates :title, presence: true

    # Issue Body
    attr_accessor :body
    validates :body, presence: true

    # Issue Labels
    attr_accessor :labels
    validates :labels, presence: true
  end
end
# rubocop:enable LineLength
