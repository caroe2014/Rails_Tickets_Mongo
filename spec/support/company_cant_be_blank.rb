RSpec::Matchers.define :company_cant_be_blank do |constraint_name|
  supports_block_expectations
  match do |code_to_test|
    match do |code_to_test|
      begin
        code_to_test.()
        false
      rescue Mongoid::Errors::Validations => ex
        ex.message =~ /#{constraint_name}/
      end
    end
  end    