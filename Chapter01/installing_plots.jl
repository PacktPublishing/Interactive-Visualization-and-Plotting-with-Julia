import Pkg

Pkg.activate(temp=true)

Pkg.add(Pkg.PackageSpec(name="Plots", version="1.0.0"))

Pkg.status()

