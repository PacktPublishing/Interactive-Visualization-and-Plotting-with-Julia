### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 43f2b466-8c3b-40a3-8e33-5579401aaf1f
begin
	using Pkg
	Pkg.activate(temp=true)
	Pkg.add(url="https://github.com/queryverse/VegaLite.jl.git", rev="master")
	Pkg.add("RDatasets")

	using VegaLite, RDatasets
end

# ╔═╡ 94662366-dfff-499b-9aed-db167544d243
iris = dataset("datasets", "iris")

# ╔═╡ d9d15c0e-b00d-4558-a1da-183833f89215
iris |> @vlplot(:circle, 
	x="PetalWidth", y="PetalLength",
	size="SepalLength")

# ╔═╡ e45a73a4-0c0d-4e52-a623-85528bf583e5
min_sl, max_sl = extrema(iris.SepalLength)

# ╔═╡ e9df01c9-4a82-44a5-a2a0-49836a582a4f
iris |> @vlplot(:circle, 
	x="PetalWidth", y="PetalLength", 
	size={"SepalLength",
		scale={domain=[min_sl, max_sl]}})

# ╔═╡ 7351e879-fb50-40b3-81c8-4a8ae22f839f
iris |> @vlplot(:circle,
	x="PetalWidth", y="PetalLength",
	tooltip="SepalLength")

# ╔═╡ 5e613450-dd3b-48d6-87c0-c140173c5b3e
iris |> @vlplot(:circle, 
	x="PetalWidth", y="PetalLength", 
	selection={brush={type="interval"}},
	color={condition={selection="brush", 
		value="red"}, value="lightgrey"})

# ╔═╡ 30cd2d23-3a5a-4baf-aadf-de64566b4907
iris |> @vlplot(repeat={
	column=["PetalLength", "PetalWidth"], 
	row=["SepalLength", "SepalWidth"]}) + 
	@vlplot(:circle, 
		x={field={repeat="column"},
			type="quantitative"}, 
		y={field={repeat="row"},
			type="quantitative"},
		selection={brush={type="interval"}},
    	color={condition={selection="brush", 
			value="red"}, value="lightgrey"},
		width=250, height=200)

# ╔═╡ Cell order:
# ╠═43f2b466-8c3b-40a3-8e33-5579401aaf1f
# ╠═94662366-dfff-499b-9aed-db167544d243
# ╠═d9d15c0e-b00d-4558-a1da-183833f89215
# ╠═e45a73a4-0c0d-4e52-a623-85528bf583e5
# ╠═e9df01c9-4a82-44a5-a2a0-49836a582a4f
# ╠═7351e879-fb50-40b3-81c8-4a8ae22f839f
# ╠═5e613450-dd3b-48d6-87c0-c140173c5b3e
# ╠═30cd2d23-3a5a-4baf-aadf-de64566b4907
