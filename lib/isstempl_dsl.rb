# encoding: utf-8
require 'isstempl_dsl_model'

module Isstempl
  # Dsl
  class Dsl
    attr_accessor :isstempl

    # String Define
    [:account, :repository, :title, :body, :labels].each do |f|
      define_method f do |value|
        @isstempl.send("#{f}=", value)
      end
    end

    # Array/Hash/Boolean Define
    [].each do |f|
      define_method f do |value|
        @isstempl.send("#{f}=", value)
      end
    end

    def initialize
      @isstempl = Isstempl::DslModel.new
      @isstempl.account = ''
      @isstempl.repository = ''
      @isstempl.title = ''
      @isstempl.body = ''
      @isstempl.labels = ''
    end
  end
end
