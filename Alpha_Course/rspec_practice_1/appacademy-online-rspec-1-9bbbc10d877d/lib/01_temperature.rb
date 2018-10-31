# From F to C formula: (F-32)*(5/9)
# From C to F formula: (C*9/5)+32

def ftoc (f)
  c = (f - 32.0) * (5.0 / 9.0)
  return c
end

def ctof (c)
  f = (c * (9.0 / 5)) + 32.0
  return f
end
