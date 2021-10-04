using Plots, Interact, Mux

app = @manipulate for angle=0:0.01:2pi
    angles = range(0, angle, length=100)
    x = cos.(angles)
    y = sin.(angles)
    plot(
        x, y,
        ratio=:equal,
        xlims=(-1.5, 1.5), ylims=(-1.5, 1.5),
        legend=:none,
        framestyle=:none)
end

WebIO.webio_serve(page("/", req -> app), 8085)
