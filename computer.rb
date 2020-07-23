# frozen_string_literal: true

module Computer
  def gen_code
    code = []
    6.times { code.push(rand(1..6).to_s) }
    code
    # binding.pry
    # ["1","2","3","4","6","5"]
  end
end
