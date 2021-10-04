using Plots
using Dash, DashHtmlComponents, DashCoreComponents

plotly()

app = dash()

app.layout = html_div() do
    dcc_slider(
        id="angle_selector",
        min=0,
        max=2pi,
        step=0.01,
        value=pi/2,
    ),
    dcc_graph(id="plot")
end

callback!(
        app, 
        Output("plot", "figure"), 
        Input("angle_selector", "value")) do angle
    angles = range(0, angle, length=100)
    x = cos.(angles)
    y = sin.(angles)
    fig = plot(
        x, y,
        size=(500, 500),
        xlims=(-1.5, 1.5), ylims=(-1.5, 1.5),
        legend=:none,
        framestyle=:none)
    Plots.plotlybase_syncplot(fig)
    Plots.backend_object(fig)
end

run_server(app)
