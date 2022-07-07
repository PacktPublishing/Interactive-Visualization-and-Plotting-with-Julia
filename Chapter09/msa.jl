### A Pluto.jl notebook ###
# v0.19.0

using Markdown
using InteractiveUtils

# ╔═╡ 31750939-b759-4d89-9c75-2077ad672c27
begin
    import Pkg
    Pkg.activate(mktempdir())
    Pkg.add([
        Pkg.PackageSpec(name="Plots", version="1"),
        Pkg.PackageSpec(name="MIToS", version="2"),
        Pkg.PackageSpec(name="BioMakie", version="0.2.0"),
    ])
    using Plots, MIToS.Pfam, MIToS.MSA, BioMakie
end

# ╔═╡ 1af23368-b97a-11ec-0bc9-7fc81b12b406
msa_file = downloadpfam("PF00049")

# ╔═╡ a3322d43-599c-4150-a1bd-d931eb6c1fb5
msa = read(msa_file, Stockholm)

# ╔═╡ e91b428f-8e83-44fe-8003-b9a7eb389938
plotly()

# ╔═╡ 3037a857-204c-4a03-bd88-4378645c91c2
plot(msa)

# ╔═╡ fbf3ba5f-a43e-4db6-95df-ff7c72462ed6
seqs = [ (name, stringsequence(msa, name)) 
	for name in sequencenames(msa) ]

# ╔═╡ 2bbc407c-f2a6-4f73-817c-bf135aeb2a4f
fig = viewmsa(seqs)

# ╔═╡ c4ecff62-5e98-475f-bcc5-6024a6aaeba0
display(fig)

# ╔═╡ Cell order:
# ╠═31750939-b759-4d89-9c75-2077ad672c27
# ╠═1af23368-b97a-11ec-0bc9-7fc81b12b406
# ╠═a3322d43-599c-4150-a1bd-d931eb6c1fb5
# ╠═e91b428f-8e83-44fe-8003-b9a7eb389938
# ╠═3037a857-204c-4a03-bd88-4378645c91c2
# ╠═fbf3ba5f-a43e-4db6-95df-ff7c72462ed6
# ╠═2bbc407c-f2a6-4f73-817c-bf135aeb2a4f
# ╠═c4ecff62-5e98-475f-bcc5-6024a6aaeba0
