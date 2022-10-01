print("Hello, World!\n")

sigma = Float64(0.1)
R = Float64(10.0)
v = Float64(2997924580.0)

mutable struct Point
    x::Float64
    y::Float64
end

function derivativef(r) 
    ans = (sigma * sech(sigma * r + sigma * R) ^ 2 / (2 * tanh(sigma * R))) - (sigma * sech(sigma * r - sigma * R) ^ 2 / (2 * tanh(sigma * R)))
    return ans
end

function energydensity(p::Point)
    r::Float64 = sqrt(p.x ^ 2 + p.y ^ 2)
    tzero = (1 / (8 * π)) * (v ^ 2 * p.y ^ 2 / (4 * r ^ 2)) * derivativef(r)
    return tzero
end

m = []

for i = -10:10, j = -10:10
    c = energydensity(Point(i, j))
    push!(m, "$i $j $c")
end

output = join(m, "\n")

io = open("results.txt", "w")

write(io, output)

close(io)

