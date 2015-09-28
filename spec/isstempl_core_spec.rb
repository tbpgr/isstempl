# encoding: utf-8
require "spec_helper"
require "isstempl_core"

describe Isstempl::Core do
  context :generate do
    ISSUETEMPL_TMP_DIR = 'tmp'
    ISSUETEMPL_CASE = <<-EOS
# encoding: utf-8
account "tbpgr"
repository "waffle_io_test"
title "test title"
body <<-EOT
## test body1
test

## test body2
test

## test body3
test

EOT
labels "bug"
    EOS

    cases = [
      {
        case_no: 1,
        case_title: "case_title",
        expected: "https://github.com/tbpgr/waffle_io_test/issues/new?title=test%20title&body=%23%23%20test%20body1%0Atest%0A%0A%23%23%20test%20body2%0Atest%0A%0A%23%23%20test%20body3%0Atest%0A%0A&labels=bug",
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          isstempl_core = Isstempl::Core.new

          # -- when --
          actual = isstempl_core.generate
print actual
          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c) # rubocop:disable UnusedMethodArgument
        Dir.mkdir(ISSUETEMPL_TMP_DIR) unless Dir.exist? ISSUETEMPL_TMP_DIR
        Dir.chdir(ISSUETEMPL_TMP_DIR)
        File.open(Isstempl::Core::ISSTEMPL_FILE, 'w') { |f|f.print ISSUETEMPL_CASE }
      end

      def case_after(c) # rubocop:disable UnusedMethodArgument
        Dir.chdir('../')
        FileUtils.rm_rf(ISSUETEMPL_TMP_DIR) if Dir.exist? ISSUETEMPL_TMP_DIR
      end
    end
  end
end
