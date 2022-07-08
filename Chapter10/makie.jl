### A Pluto.jl notebook ###
# v0.19.2

using Markdown
using InteractiveUtils

# ╔═╡ 0257033a-fee5-11ec-01bf-97859a53d0c4
begin
    import Pkg
    Pkg.activate(temp=true)
    Pkg.add(name="CairoMakie", version="0.8.8")
    using CairoMakie
end

# ╔═╡ 9a533bc9-5af4-4e7f-a9b0-c2416b8bc151
begin
	fig = Figure(fontsize=24)
	axis = Axis(fig[1, 1])
	plt = scatter!(axis, 1:10,
		color = 1:10, 
		colorrange = (0.0, 10.0),
		label = "Legend's label")
	fig
end

# ╔═╡ 96ceaf90-161a-4dea-8f58-37d7f9d8ff9c
begin
	legend = Legend(fig[2, 1], axis, 
		"Legend's title",
		tellheight=true, tellwidth=false)
	cbar = Colorbar(fig[1, 2], plt,
		label = "Colorbar's label (title)",
		ticks = 0:1:10)
	fig
end

# ╔═╡ c3f353f5-3093-47e4-bf4e-6fc7aa39d6f1
begin
	hidespines!(axis, :t, :r)
	axis.xminorgridvisible = true
	axis.yminorgridvisible = true
	axis.xminorticksvisible = true
	axis.yminorticksvisible = true
	axis.title = "Axis' title"
	axis.xlabel = "Axis' xlabel"
	axis.ylabel = "Axis' ylabel"
	fig
end

# ╔═╡ Cell order:
# ╠═0257033a-fee5-11ec-01bf-97859a53d0c4
# ╠═9a533bc9-5af4-4e7f-a9b0-c2416b8bc151
# ╠═96ceaf90-161a-4dea-8f58-37d7f9d8ff9c
# ╠═c3f353f5-3093-47e4-bf4e-6fc7aa39d6f1
