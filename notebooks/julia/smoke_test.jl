# Deterministic smoke test for a generic resource-allocation model.

using LinearAlgebra

A = [2.0 1.0;
     1.0 3.0;
     3.0 2.0]

b = [100.0, 90.0, 120.0]
x = [20.0, 10.0]

usage = A * x
slack = b - usage

@assert size(A) == (3, 2)
@assert length(x) == 2
@assert length(b) == 3
@assert all(x .>= 0.0)
@assert all(slack .>= -1e-9)

println("Decision vector: ", x)
println("Resource use: ", usage)
println("Slack: ", slack)
println("Generic resource-allocation smoke test passed.")
