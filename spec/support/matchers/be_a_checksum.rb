require "rspec/expectations"

RSpec::Matchers.define :be_a_checksum do
  regex = /\A[0-9a-f]{32,128}\z/i
  chars = {
      :md2  => 32,
      :md4  => 32,
      :md5  => 32,
      :sha1 => 40,
      :sha224 => 56,
      :sha256 => 64,
      :sha384 => 96,
      :sha512 => 128
  }

  match do |checksum|
    checksum = String(checksum)
    return checksum.bytesize == chars[@function] / 2 if @use_bytes # 2 hex chars = 1 byte
    matched = !!(checksum =~ regex)
    return matched unless @function && matched
    checksum.size == chars[@function]
  end

  chain :produced_by do |name|
    @function = name.to_s.downcase.to_sym
    raise ArgumentError, "unknown algorithm given to be_a_checksum.produced_by: #@function" unless chars.include?(@function)
  end

  chain :of_bytes do
    @use_bytes = true
  end
end