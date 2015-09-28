# encoding: utf-8
require 'isstempl_dsl'
require 'erb'
require 'uri'

module Isstempl
  # Isstempl Core
  class Core
    # rubocop:disable LineLength
    ISSTEMPL_FILE = 'Isstempl'
    ISSTEMPL_TEMPLATE = <<-EOS
# encoding: utf-8

# GitHub Account
# account is required
# account allow only String
# account's default value => ""
account ""

# GitHub Repository
# repository is required
# repository allow only String
# repository's default value => ""
repository ""

# Issue Title
# title is required
# title allow only String
# title's default value => ""
title ""

# Issue Body
# body is required
# body allow only String
# body's default value => ""
body ""

# Issue Labels
# labels is required
# labels allow only String
# labels => bug / duplicate / enhancement / help wanted / invalid / question / wontfix / or user defined Label
# labels's default value => ""
labels ""
    EOS
    URL_TEMPLATE = "https://github.com/<%= account%>/<%= repository%>/issues/new?title=<%= title%>&body=<%= body%>&labels=<%= label%>"
    # rubocop:enable LineLength

    # generate Isstemplfile to current directory.
    def init
      File.open(ISSTEMPL_FILE, 'w') do |f|
        f.puts ISSTEMPL_TEMPLATE
      end
    end

    # generate GitHub Issue template from Issuetempl.
    def generate
      src = read_dsl
      dsl = Isstempl::Dsl.new
      dsl.instance_eval(src)
      url = apply_erb(dsl.isstempl)
      URI.escape(url)
    end

    private
    def apply_erb(isstempl)
      account = isstempl.account
      repository = isstempl.repository
      title = isstempl.title
      body = isstempl.body
      label = isstempl.labels
      ERB.new(URL_TEMPLATE).result(binding)
    end

    def read_dsl
      File.open(ISSTEMPL_FILE) { |f|f.read }
    end
  end
end
