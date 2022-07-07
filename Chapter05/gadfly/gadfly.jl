### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ c2f327e8-3ca5-11ec-023b-c9dd2baf6fc6
begin
    import Pkg
    Pkg.activate(mktempdir())
    Pkg.add([
        Pkg.PackageSpec(name="RDatasets", version="0.7.7"),
        Pkg.PackageSpec(name="Gadfly", version="1.3.4"),
    ])
    using RDatasets, Gadfly
end

# ╔═╡ 94f753ad-9d6b-451d-961f-c350b85e0e97
iris = dataset("datasets", "iris")

# ╔═╡ 19e57dd6-a043-491b-8e34-b7df4b9cb76d
plot(iris, x="PetalLength", y="PetalWidth")

# ╔═╡ 84bbfed7-43d3-4672-88cc-bb703abfc332
plot(iris, x="PetalLength", y="PetalWidth", Geom.point)

# ╔═╡ 614f2ac8-f38c-4ef9-a3f3-4cb3ff4b2aa0
categorical = plot(iris, 
	x="PetalLength", y="PetalWidth", 
	color="Species", 
	Geom.point)

# ╔═╡ 621bed20-826e-43ad-9b8a-989476684a54
ordered = plot(iris, 
	x="PetalLength", y="PetalWidth", 
	color="SepalLength", 
	Geom.point)

# ╔═╡ 1083d501-695b-4e07-8004-36feb7f97f07
hstack(categorical, ordered)

# ╔═╡ 5947d231-5b27-434e-a193-b40b60b2f989
plot(iris, 
	x="PetalLength", y="PetalWidth", color="Species",
	Geom.point, Geom.line)

# ╔═╡ 352d990d-dde4-47a4-b4d4-d6f1050f97af
plot(iris, x="PetalLength", y="PetalWidth",
	layer(color="Species", Geom.point), Geom.line)

# ╔═╡ 98ceb4c5-dbae-4371-b0ff-0fb52c871f9a
plot(iris, 
	x="PetalLength", y="PetalWidth", color="Species", 
	Stat.smooth)

# ╔═╡ a458f86d-9e55-4493-8e72-fe2de9585352
plot(iris, 
	x="PetalLength", y="PetalWidth", color="Species", 
	layer(Stat.smooth, Geom.line), Geom.point)

# ╔═╡ b00c8db5-a04c-4fd6-9931-1dad47c0420b
plot(iris, x="PetalLength", y="PetalWidth", size="SepalLength", Geom.point)

# ╔═╡ 6c36fb90-86ec-41ca-a7bc-2f2f892d333d
min_sl, max_sl = extrema(iris.SepalLength)

# ╔═╡ 653abd92-7f98-4414-a45e-3451eefffe18
sizemap(p::Float64; min=1mm, max=2.5mm) = min + p*(max-min)

# ╔═╡ 0167c092-1a2a-48c7-95db-6b3b143fdfe8
plot(iris, 
	x="PetalLength", y="PetalWidth", 
	size="SepalLength", 
	Geom.point,
	Scale.size_radius(sizemap, 
		minvalue=min_sl, maxvalue=max_sl))

# ╔═╡ b9149116-5a25-4d7c-818e-bde09c65d5b5
plot(iris, 
	x="PetalLength", y="PetalWidth", 
	ygroup="Species",
	Geom.subplot_grid(Geom.point))

# ╔═╡ Cell order:
# ╠═c2f327e8-3ca5-11ec-023b-c9dd2baf6fc6
# ╠═94f753ad-9d6b-451d-961f-c350b85e0e97
# ╠═19e57dd6-a043-491b-8e34-b7df4b9cb76d
# ╠═84bbfed7-43d3-4672-88cc-bb703abfc332
# ╠═614f2ac8-f38c-4ef9-a3f3-4cb3ff4b2aa0
# ╠═621bed20-826e-43ad-9b8a-989476684a54
# ╠═1083d501-695b-4e07-8004-36feb7f97f07
# ╠═5947d231-5b27-434e-a193-b40b60b2f989
# ╠═352d990d-dde4-47a4-b4d4-d6f1050f97af
# ╠═98ceb4c5-dbae-4371-b0ff-0fb52c871f9a
# ╠═a458f86d-9e55-4493-8e72-fe2de9585352
# ╠═b00c8db5-a04c-4fd6-9931-1dad47c0420b
# ╠═6c36fb90-86ec-41ca-a7bc-2f2f892d333d
# ╠═653abd92-7f98-4414-a45e-3451eefffe18
# ╠═0167c092-1a2a-48c7-95db-6b3b143fdfe8
# ╠═b9149116-5a25-4d7c-818e-bde09c65d5b5
