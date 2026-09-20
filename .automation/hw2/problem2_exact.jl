using CairoMakie
using LaTeXStrings

# ============================================================
# IEE 574 — HOMEWORK 2 — PROBLEM 2
# Professional geometric visualization
#
# H  = {x ∈ R² : 2x₁ + x₂ = 4}
# S₁ = {x ∈ R² : 2x₁ + x₂ ≥ 4}
# S₂ = {x ∈ R² : 2x₁ + x₂ ≤ 4}
# x⁰ = (1,2) ∈ H
# a  = (2,1), normal to H
#
# Acute-angle illustration:
# x = (2,3) ∈ int(S₁)
# x - x⁰ = (1,1)
# aᵀ(x-x⁰) = 3 > 0  ⇒  θ < 90°
# ============================================================

CairoMakie.activate!(antialias = :best)

const x0 = (1.0, 2.0)
const a  = (2.0, 1.0)
const py = (0.0, 4.0)
const px = (2.0, 0.0)
const xS1 = (2.0, 3.0)
const d = (xS1[1] - x0[1], xS1[2] - x0[2])

hvalue(p) = 2.0 * p[1] + p[2]
@assert isapprox(hvalue(x0), 4.0)
@assert isapprox(hvalue(py), 4.0)
@assert isapprox(hvalue(px), 4.0)
@assert hvalue(xS1) > 4.0

const tH = (1.0, -2.0)
const dot_at = a[1] * tH[1] + a[2] * tH[2]
@assert isapprox(dot_at, 0.0)

const dot_ad = a[1] * d[1] + a[2] * d[2]
@assert dot_ad > 0.0
const norm_a = sqrt(a[1]^2 + a[2]^2)
const norm_d = sqrt(d[1]^2 + d[2]^2)
const theta = acos(dot_ad / (norm_a * norm_d))
const theta_deg = rad2deg(theta)
@assert theta < π / 2

println("Problem 2 mathematical verification passed.")
println("x⁰ = ", x0, " lies on H.")
println("a  = ", a, " is perpendicular to H.")
println("x  = ", xS1, " lies strictly inside S₁.")
println("aᵀ(x-x⁰) = ", dot_ad)
println("θ = ", round(theta_deg; digits = 2), "° < 90°")

const INK = RGBf(0.10, 0.10, 0.10)
const H_BLUE = RGBf(0.00, 0.40, 0.68)
const S1_FILL = RGBAf(0.55, 0.82, 0.60, 0.20)
const S1_TEXT = RGBf(0.08, 0.43, 0.18)
const S2_FILL = RGBAf(0.34, 0.71, 0.91, 0.18)
const S2_TEXT = H_BLUE
const A_ORANGE = RGBf(0.90, 0.38, 0.08)
const X_PURPLE = RGBf(0.47, 0.23, 0.64)
const ANGLE_GREEN = RGBf(0.10, 0.50, 0.30)
const GRID_MAJOR = RGBAf(0.42, 0.42, 0.42, 0.33)
const GRID_MINOR = RGBAf(0.64, 0.64, 0.64, 0.15)

const XMIN = -1.0
const XMAX = 4.0
const YMIN = -1.0
const YMAX = 6.0
const X_AT_BOTTOM = (4.0 - YMIN) / 2.0
const X_AT_TOP = (4.0 - YMAX) / 2.0
@assert XMIN ≤ X_AT_TOP ≤ XMAX
@assert XMIN ≤ X_AT_BOTTOM ≤ XMAX

function mathlabel!(ax, x, y, txt, color; fontsize=14, rotation=0.0, align=(:center,:center), halo=1.0)
    text!(ax, x, y; text=txt, color=color, fontsize=fontsize, rotation=rotation, align=align,
          strokecolor=:white, strokewidth=halo)
end

fig = Figure(size=(650,900), backgroundcolor=:white, figure_padding=26)

ax = Axis(
    fig[1,1];
    xlabel=L"x_1",
    ylabel=L"x_2",
    limits=(XMIN,XMAX,YMIN,YMAX),
    aspect=DataAspect(),
    xticks=Int(XMIN):1:Int(XMAX),
    yticks=Int(YMIN):1:Int(YMAX),
    xgridvisible=true,
    ygridvisible=true,
    xgridcolor=GRID_MAJOR,
    ygridcolor=GRID_MAJOR,
    xgridwidth=0.85,
    ygridwidth=0.85,
    xminorticks=IntervalsBetween(5),
    yminorticks=IntervalsBetween(5),
    xminorticksvisible=true,
    yminorticksvisible=true,
    xminorgridvisible=true,
    yminorgridvisible=true,
    xminorgridcolor=GRID_MINOR,
    yminorgridcolor=GRID_MINOR,
    xminorgridwidth=0.32,
    yminorgridwidth=0.32,
    topspinevisible=false,
    rightspinevisible=false,
    leftspinecolor=INK,
    bottomspinecolor=INK,
    spinewidth=1.35,
    xticksize=6,
    yticksize=6,
    xminorticksize=3,
    yminorticksize=3,
    xticklabelsize=12,
    yticklabelsize=12,
    xlabelsize=18,
    ylabelsize=18,
    xlabelpadding=8,
    ylabelpadding=8,
)

S2_polygon = Point2f[(XMIN,YMIN),(X_AT_BOTTOM,YMIN),(X_AT_TOP,YMAX)]
poly!(ax,S2_polygon;color=S2_FILL,strokewidth=0)

S1_polygon = Point2f[(X_AT_TOP,YMAX),(XMAX,YMAX),(XMAX,YMIN),(X_AT_BOTTOM,YMIN)]
poly!(ax,S1_polygon;color=S1_FILL,strokewidth=0)

lines!(ax,[0.0,0.0],[YMIN,YMAX];color=INK,linewidth=1.45)
lines!(ax,[XMIN,XMAX],[0.0,0.0];color=INK,linewidth=1.45)

xs = range(X_AT_TOP,X_AT_BOTTOM;length=600)
ys = 4 .- 2 .* xs
lines!(ax,xs,ys;color=H_BLUE,linewidth=3.2)

const theta_H = atan(tH[2],tH[1])
const unit_normal_H = (a[1]/norm_a,a[2]/norm_a)
const h_anchor_x = 0.55
const h_anchor_y = 4.0 - 2.0*h_anchor_x
const h_label = (h_anchor_x - 0.22*unit_normal_H[1], h_anchor_y - 0.22*unit_normal_H[2])
mathlabel!(ax,h_label[1],h_label[2],L"H:\;2x_1+x_2=4",H_BLUE;fontsize=14,rotation=theta_H,halo=1.2)

mathlabel!(ax,2.65,5.10,L"S_1:\;2x_1+x_2\geq4",S1_TEXT;fontsize=16,halo=1.2)
mathlabel!(ax,0.20,0.65,L"S_2:\;2x_1+x_2\leq4",S2_TEXT;fontsize=16,halo=1.2)

scatter!(ax,[py[1],px[1]],[py[2],px[2]];color=H_BLUE,markersize=14,strokecolor=:white,strokewidth=1.6)
mathlabel!(ax,-0.17,4.18,L"(0,4)",H_BLUE;fontsize=13,align=(:right,:bottom),halo=1.0)
mathlabel!(ax,2.15,-0.18,L"(2,0)",H_BLUE;fontsize=13,align=(:left,:center),halo=1.0)

scatter!(ax,[x0[1]],[x0[2]];color=A_ORANGE,markersize=18,strokecolor=:white,strokewidth=1.8)
const x0_label = (x0[1]-0.43*unit_normal_H[1],x0[2]-0.43*unit_normal_H[2])
mathlabel!(ax,x0_label[1],x0_label[2],L"x^0=(1,2)",A_ORANGE;fontsize=14,halo=1.1)

arrows2d!(ax,[Point2f(x0[1],x0[2])],[Vec2f(a[1],a[2])];color=A_ORANGE,markerspace=:pixel,
          shaftwidth=4.5,tipwidth=14.0,tiplength=10.0)
const theta_a = atan(a[2],a[1])
const normal_to_a = (-a[2]/norm_a,a[1]/norm_a)
const mid_a = (x0[1]+0.60*a[1],x0[2]+0.60*a[2])
const a_label = (mid_a[1]-0.20*normal_to_a[1],mid_a[2]-0.20*normal_to_a[2])
mathlabel!(ax,a_label[1],a_label[2],L"a=(2,1)",A_ORANGE;fontsize=14,rotation=theta_a,halo=1.1)

scatter!(ax,[xS1[1]],[xS1[2]];color=X_PURPLE,markersize=17,strokecolor=:white,strokewidth=1.8)
mathlabel!(ax,2.06,3.28,L"x=(2,3)",X_PURPLE;fontsize=14,align=(:left,:center),halo=1.1)

arrows2d!(ax,[Point2f(x0[1],x0[2])],[Vec2f(d[1],d[2])];color=X_PURPLE,markerspace=:pixel,
          shaftwidth=4.0,tipwidth=13.0,tiplength=9.0)
const theta_d = atan(d[2],d[1])
const normal_to_d = (-d[2]/norm_d,d[1]/norm_d)
const mid_d = (x0[1]+0.48*d[1],x0[2]+0.48*d[2])
const d_label = (mid_d[1]+0.29*normal_to_d[1],mid_d[2]+0.29*normal_to_d[2])
mathlabel!(ax,d_label[1],d_label[2],L"x-x^0=(1,1)",X_PURPLE;fontsize=13,rotation=theta_d,halo=1.1)

const angle_a = atan(a[2],a[1])
const angle_d = atan(d[2],d[1])
const arc_radius = 0.50
arc_angles = range(angle_a,angle_d;length=120)
arc_x = x0[1] .+ arc_radius .* cos.(arc_angles)
arc_y = x0[2] .+ arc_radius .* sin.(arc_angles)
lines!(ax,arc_x,arc_y;color=ANGLE_GREEN,linewidth=2.2)

const angle_mid = (angle_a+angle_d)/2
const theta_label = (x0[1]+0.80*cos(angle_mid),x0[2]+0.80*sin(angle_mid))
mathlabel!(ax,theta_label[1],theta_label[2],L"\theta<90^\circ",ANGLE_GREEN;fontsize=13,halo=1.1)

xlims!(ax,XMIN,XMAX)
ylims!(ax,YMIN,YMAX)

save("IEE574_HW2_Problem2_FINAL.pdf",fig;pt_per_unit=1)
save("IEE574_HW2_Problem2_FINAL.svg",fig;pt_per_unit=1)
save("IEE574_HW2_Problem2_FINAL.png",fig;px_per_unit=3)

println()
println("Problem 2 files created successfully:")
println("  IEE574_HW2_Problem2_FINAL.pdf")
println("  IEE574_HW2_Problem2_FINAL.svg")
println("  IEE574_HW2_Problem2_FINAL.png")
