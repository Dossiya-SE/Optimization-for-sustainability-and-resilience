using CairoMakie
using LaTeXStrings

CairoMakie.activate!(antialias = :best)

const INK        = RGBf(0.10, 0.10, 0.10)
const H_BLUE     = RGBf(0.00, 0.45, 0.70)

const S1_FILL    = RGBAf(0.82, 0.84, 0.87, 0.18)
const S2_FILL    = RGBAf(0.34, 0.71, 0.91, 0.18)

const GRID_MAJOR = RGBAf(0.45, 0.45, 0.45, 0.34)
const GRID_MINOR = RGBAf(0.65, 0.65, 0.65, 0.16)

fig = Figure(
    size = (620, 760),
    backgroundcolor = :white,
    figure_padding = 18
)

ax = Axis(
    fig[1,1];

    xlabel = L"x_1",
    ylabel = L"x_2",

    limits = (-1, 4, -1, 6),

    # One unit horizontally = one unit vertically
    aspect = DataAspect(),

    # -----------------------------------------
    # MAJOR GRADUATION = 1 unit
    # -----------------------------------------
    xticks = -1:1:4,
    yticks = -1:1:6,

    xgridvisible = true,
    ygridvisible = true,

    xgridcolor = GRID_MAJOR,
    ygridcolor = GRID_MAJOR,

    xgridwidth = 0.9,
    ygridwidth = 0.9,

    # -----------------------------------------
    # MINOR GRADUATION = 0.2 unit
    # 5 subdivisions per unit
    # -----------------------------------------
    xminorticks = IntervalsBetween(5),
    yminorticks = IntervalsBetween(5),

    xminorticksvisible = true,
    yminorticksvisible = true,

    xminorgridvisible = true,
    yminorgridvisible = true,

    xminorgridcolor = GRID_MINOR,
    yminorgridcolor = GRID_MINOR,

    xminorgridwidth = 0.35,
    yminorgridwidth = 0.35,

    # -----------------------------------------
    # AXIS STYLE
    # -----------------------------------------
    topspinevisible = false,
    rightspinevisible = false,

    leftspinecolor = INK,
    bottomspinecolor = INK,

    # Current Makie uses a common spine width.
    # Since top/right spines are hidden, this sets the visible
    # left and bottom spines to the intended 1.4 pt.
    spinewidth = 1.4,

    xticksize = 6,
    yticksize = 6,

    xminorticksize = 3,
    yminorticksize = 3,

    xticklabelsize = 11,
    yticklabelsize = 11,

    xlabelsize = 15,
    ylabelsize = 15,
)

# --------------------------------------------------
# EMPHASIZE x1=0 AND x2=0
# --------------------------------------------------

lines!(
    ax,
    [0,0],
    [-1,6];
    color = INK,
    linewidth = 1.5
)

lines!(
    ax,
    [-1,4],
    [0,0];
    color = INK,
    linewidth = 1.5
)

# --------------------------------------------------
# S2 : 2x1 + x2 <= 4
# --------------------------------------------------

poly!(
    ax,
    Point2f[
        (-1,-1),
        (2.5,-1),
        (-1,6)
    ];
    color = S2_FILL,
    strokewidth = 0
)

# --------------------------------------------------
# S1 : 2x1 + x2 >= 4
# --------------------------------------------------

poly!(
    ax,
    Point2f[
        (-1,6),
        (4,6),
        (4,-1),
        (2.5,-1)
    ];
    color = S1_FILL,
    strokewidth = 0
)

# --------------------------------------------------
# H : 2x1 + x2 = 4
# --------------------------------------------------

xs = range(-1.0, 2.5; length = 500)
ys = 4 .- 2 .* xs

lines!(
    ax,
    xs,
    ys;
    color = H_BLUE,
    linewidth = 3.2
)

# --------------------------------------------------
# REGION LABELS ONLY
# --------------------------------------------------

text!(
    ax,
    2.45,
    4.90;
    text = L"S_1",
    fontsize = 18,
    color = INK,
    align = (:center, :center)
)

text!(
    ax,
    0.75,
    0.70;
    text = L"S_2",
    fontsize = 18,
    color = H_BLUE,
    align = (:center, :center)
)

save(
    "problem2_S1_S2_graphpaper.pdf",
    fig;
    pt_per_unit = 1
)
