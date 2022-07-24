### A Pluto.jl notebook ###
# v0.18.4

using Markdown
using InteractiveUtils

# ╔═╡ 0f050e69-6774-4e76-b8eb-6ef9f22d178d
begin
    import Pkg
    Pkg.activate(temp=true)
    Pkg.add([
        Pkg.PackageSpec(name="GeoMakie", version="0.4"),
        Pkg.PackageSpec(name="CairoMakie", 
			version="0.8"),
        Pkg.PackageSpec(name="GeoJSON", version="0.5"),
    ])
    using GeoMakie, CairoMakie, GeoJSON
end

# ╔═╡ 08c9e2fc-7b4a-495f-ba5f-1271b389df70
download("https://datahub.io/core/geo-countries/r/countries.geojson", "countries.geojson")

# ╔═╡ 0486d856-4849-43bc-80f4-294eba04f422
countries = GeoJSON.read(read("countries.geojson"))

# ╔═╡ f108d637-147e-4188-bf85-f29246238a82
name_lengths = [
	length(feature.properties["ADMIN"])
	for feature in countries.features]

# ╔═╡ 219359cd-acc5-4874-800e-21c1214e3229
poly(countries, color=name_lengths)

# ╔═╡ 9b96fb1c-d54d-46b3-914d-2ebb273be5fd
begin
	fig = Figure()
	ax = GeoAxis(fig[1,1], 
		coastlines = true, 
		coastline_attributes = (color=:grey30,),
		dest = "+proj=natearth")
	poly!(ax, countries, color=name_lengths)
	cb = Colorbar(fig[1,2]; 
		colorrange = extrema(name_lengths), 
		label = "country name length",
		height = Relative(0.65))
	fig
end

# ╔═╡ b73e8bfd-e427-4c9f-af6a-afa5d7ebc8d8
begin
	earth_fig = Figure()
	earth_ax = GeoAxis(earth_fig[1,1],
		lonlims = automatic,
		dest = "+proj=ortho")
	image!(earth_ax, -180..180, -90..90, 
		rotr90(GeoMakie.earth());
		interpolate = false)
	earth_fig
end

# ╔═╡ Cell order:
# ╠═0f050e69-6774-4e76-b8eb-6ef9f22d178d
# ╠═08c9e2fc-7b4a-495f-ba5f-1271b389df70
# ╠═0486d856-4849-43bc-80f4-294eba04f422
# ╠═f108d637-147e-4188-bf85-f29246238a82
# ╠═219359cd-acc5-4874-800e-21c1214e3229
# ╠═9b96fb1c-d54d-46b3-914d-2ebb273be5fd
# ╠═b73e8bfd-e427-4c9f-af6a-afa5d7ebc8d8
