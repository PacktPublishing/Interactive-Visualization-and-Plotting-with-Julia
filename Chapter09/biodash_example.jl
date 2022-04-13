import Pkg
Pkg.activate(temp=true)
Pkg.add([
    Pkg.PackageSpec(name="MIToS", version="2.9"),
    Pkg.PackageSpec(name="Dash", version="0.1"),
    Pkg.PackageSpec(name="DashBio", version="0.7"),
])

using MIToS.PDB
using Dash, DashBio

pdbfile = downloadpdb("1SDB")
pdbres = read(pdbfile, PDBML)

to_dict(atom) = Dict(
    "symbol" => atom.element,
    "x" => atom.coordinates.x,
    "y" => atom.coordinates.y,
    "z" => atom.coordinates.z)

data = collect(Iterators.flatten([
    [to_dict(atom) for atom in res.atoms] 
    for res in pdbres]))

app = dash()
app.layout = dashbio_speck(data=data)
run_server(app, "0.0.0.0", debug=true)
