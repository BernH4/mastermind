module Computer
  def gen_code
    code = []
    6.times { code.push(rand(1..6)) }
    code
  end
end
