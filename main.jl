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

x = Point(10.0, 10.0)
range = [-10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

io = open("results.txt", "w")

for i in 1:21
    for j in 1:21
        a = range[i]
        b = range[j]
        c = energydensity(Point(a, b))
        write(io, "$a $b $c\n")
        #print("i: $a, j: $b, value: $c")
    end
end

close(io)

