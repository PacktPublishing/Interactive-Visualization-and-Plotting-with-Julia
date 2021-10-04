import Pkg
Pkg.activate(temp=true)
Pkg.add("GLMakie")

using Printf
using GLMakie

# Slider

fig = Figure()
angle_selector = Slider(fig[2, 1], range = 0:0.01:2pi, startvalue = pi/2)
angles = lift(angle -> range(0, angle, length=100), angle_selector.value)
points = @lift([Point2(cos(angle), sin(angle))  for angle in $angles])
lines(fig[1,1], points, axis=(aspect=DataAspect(), limits=(-1.5, 1.5, -1.5, 1.5)))

# Slider with label

fig = Figure()
_angle_label(angle) = @sprintf "%1.2fπ" angle/pi
angle_selector = labelslider!(fig, "angle", 0:0.01:2pi, format=_angle_label)
set_close_to!(angle_selector.slider, pi/2)
fig[2, 1] = angle_selector.layout
angles = lift(angle -> range(0, angle, length=100), angle_selector.slider.value)
points = @lift([Point2(cos(angle), sin(angle))  for angle in $angles])
lines(fig[1,1], points, axis=(aspect=DataAspect(), limits=(-1.5, 1.5, -1.5, 1.5)))

# Mouse interaction

fig = Figure()
axs = Axis(fig[1,1], aspect=DataAspect(), limits=(-1.5, 1.5, -1.5, 1.5))
angle = Observable(pi/2)
points = @lift([Point2(cos(a), sin(a)) for a in range(0, $angle, length=100)])
lines!(points)

fig_events = events(axs.scene)
on(fig_events.mouseposition) do event
    x, y = mouseposition(axs.scene)
    println("$x, $y")
    angle[] = y > 0 ? atan(y, x) : 2pi + atan(y, x)
end
