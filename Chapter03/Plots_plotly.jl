using Plots
plotly()

x = 0:0.01:2pi
y_sin = sin.(x)
y_cos = cos.(x)

plot(x, [y_sin y_cos], labels=["sin" "cos"])

_round(number) = round(number, sigdigits=4)
_point_label(x, y, fun) = "$fun($(_round(x))) = $(_round(y))"
tooltips_sin = [_point_label(x, y, "sin") for (x, y) in zip(x, y_sin)]
tooltips_cos = [_point_label(x, y, "cos") for (x, y) in zip(x, y_cos)]

plot(x, [y_sin y_cos], labels=["sin" "cos"], hover=[tooltips_sin tooltips_cos])
