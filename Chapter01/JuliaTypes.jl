### A Pluto.jl notebook ###
# v0.15.1

using Markdown
using InteractiveUtils

# ╔═╡ 60ccea97-08b4-417e-81e0-5110ce532d51
using PlutoUI

# ╔═╡ c9d6131c-d577-4523-9f1e-6f4543dd5f44
using Measures

# ╔═╡ 5115e0e4-0e37-4787-9b41-2a18605dc457
using LaTeXStrings

# ╔═╡ 504ac24f-5e3b-48fc-9ea7-b684274022f8
md"""
# Basic Julia types for data visualization
"""

# ╔═╡ 934c4b0c-913b-44f0-a880-50141b853165
md"""
## Functions
"""

# ╔═╡ b5c95cbd-1fe8-4796-92d0-3b4ae309c8d9
function addition(x, y)
    x + y
end

# ╔═╡ 4df5192a-c576-480f-ab1f-bbb73273a8cf
subtraction(x, y) = x - y

# ╔═╡ c27f7c14-c6bb-43f6-b231-37d66fd9dd81
md"""
### Higher-order and anonymous functions
"""

# ╔═╡ 2ed06105-6ca5-4cdb-b176-b4eedf24db43
sum(abs, [-1, 1])

# ╔═╡ 48dafa99-d4ff-4ec3-b58d-5a06ae49db26
sum(x -> abs(x), [-1, 1])

# ╔═╡ 4e4d3536-2360-4790-9962-d761ea565af6
sum([-1, 1]) do x
    abs(x)
end

# ╔═╡ ef345764-ffb7-4e59-a99a-30cbe3f383d6
md"""
## Julia types
"""

# ╔═╡ fa6157ea-49e0-4b48-b83c-fcfa334cc3a6
typeof("Hello World")

# ╔═╡ 4b5de8d6-c778-42e3-9a91-e63ff235913a
typeof(2)

# ╔═╡ c1ee4f85-b9f0-4ab3-acbc-50573c02a459
numbers = 1:5

# ╔═╡ dabf264b-93d0-492f-be5a-47cc3efb9b0a
Dump(numbers)

# ╔═╡ 8fdef782-3d8f-4560-9054-371bf49a705d
numbers.start

# ╔═╡ b99c8424-1da3-4fde-8d9a-f698c1511d03
numbers.stop

# ╔═╡ 49d1b1c3-45e4-41ef-91ed-562ee220ac5f
md"""
### Multiple dispatch
"""

# ╔═╡ 9699f41d-6f92-4528-9e38-a94c8ee72f25
concatenate(a::String, b::String) = a * b

# ╔═╡ 47b84567-81ad-4ddd-aebb-5cbaab2a1543
concatenate(a::Int, b::Int) = parse(Int, string(a) * string(b))

# ╔═╡ 67f9a128-d276-4455-827f-66cd58030517
concatenate("Hello", "World")

# ╔═╡ 0f77e7ed-1b7e-4004-b8cc-2061292ada5e
concatenate(1, 2)

# ╔═╡ a4b1caa7-bb57-49bc-bec0-6600a6d70951
methods(concatenate)

# ╔═╡ a1ac508b-9503-479f-8b16-3039c0d16c9b
concatenate(string(1), string(2))

# ╔═╡ 3a0be158-bd80-4837-a040-dc11470e3c58
convert(Float64, 1)

# ╔═╡ 9f915932-d7f3-47a9-a85c-2182531e8c46
Float64(1)

# ╔═╡ 0abeb1d5-1413-4dd4-8f20-9d95b866fa63
string(1)

# ╔═╡ 5634427a-e14d-4c37-86a4-6da6ca656c12
parse(Int, "1")

# ╔═╡ 72fc678c-06c7-43d7-9716-b91a1425aa89
md"""
### Representing numerical values
"""

# ╔═╡ 57757638-993e-4fbe-b0fc-faf0cc34e995
md"""
`Int`
"""

# ╔═╡ ec4f8362-39ca-4cf6-af8b-857e152d82b7
-1

# ╔═╡ 082a675a-d7c5-4c33-a5d7-1e83570f16fd
5

# ╔═╡ 6947633b-6896-4bc6-929c-50a68002a94d
10_000

# ╔═╡ 61371d87-acb9-448a-a875-f5745224c5df
md"`Float64`"

# ╔═╡ b5b0311e-9c16-4b9a-8091-43838b7feb8f
1.0

# ╔═╡ 588fd62f-509c-4b99-8e23-9b60e14d5602
-2e3

# ╔═╡ c2d8adc5-1ef2-4c46-bfb2-9ea30ca12e89
13.5E10

# ╔═╡ c54a18cd-eddc-4e20-bb7e-1b33e832b422
.1

# ╔═╡ c03b8c69-64e3-4223-8765-2818ea52f5a2
1.

# ╔═╡ 38e70ac5-fa8d-4ca8-9c71-c104a48b1e87
NaN

# ╔═╡ 05a088e1-60b6-47df-bf61-fddf548563e0
md"Units"

# ╔═╡ 1bcbfd07-375a-4fcb-913b-cd159fce54e7
10.5cm

# ╔═╡ 9f9573af-b65a-4246-aefa-64cc48ea9dcd
md"""
### Representing text
"""

# ╔═╡ ac0abe2d-6fe0-4a11-b212-0ca1ecc68ae2
"Single line String"

# ╔═╡ cc3a3304-c9b5-45e5-8209-9c94bfc611dd
"""
Multiline
String
"""

# ╔═╡ 0cc52da8-303d-45fd-9390-7b203cd15773
'a'

# ╔═╡ dfd31ce8-4c00-4ebe-a5f9-4d50b4c2e3cd
md"**Markdown** string"

# ╔═╡ 4f79eb5e-3cd6-42a0-b557-5a5821a9428b
html"<strong>HTML</strong> string"

# ╔═╡ c91a721d-1cb5-4839-8566-842c996e61a1
L"LaTeX string"

# ╔═╡ daf19907-5675-4430-886d-a69f3b71aed9
md"`Symbol`"

# ╔═╡ c71d8f39-4911-450d-bb97-8b93a61693a7
:var1

# ╔═╡ 3e72cf06-2247-4a71-bbaa-c1d420ed83e4
Symbol("1var")

# ╔═╡ ca7472e6-b08b-410b-a921-cccdd5fbfc31
md"""
### Collections
"""

# ╔═╡ 1d1b47c9-429c-41ec-9e09-38bddd2e3f7e
md"`Tuple`"

# ╔═╡ 8c9c54d7-403c-48a7-b63e-12c7fdd5659c
("x", 0)

# ╔═╡ 69631bb0-f279-4bf2-86d0-0f21bc6d3314
(1,)

# ╔═╡ 7e07074d-4aa3-459c-9c90-24718815d865
md"`Array`"

# ╔═╡ 86fab7a8-6d48-42dc-b963-df227162fb39
[1]

# ╔═╡ ff173169-77aa-4e6b-988d-0d1f7bd15a02
[1, 2]

# ╔═╡ 96e44dec-8ed7-4b87-b0de-c069d22e54f7
[1 2; 3 4]

# ╔═╡ 7bcf656c-e397-4544-a2c1-7c5a082a42d6
[ 1 2
  3 4 ]

# ╔═╡ bcd44701-7992-45fc-be4d-e4a13cfbcc63
zeros(4, 2)

# ╔═╡ 5a93658c-5807-46ef-8faf-108347a38bb4
zeros(10)

# ╔═╡ d66723b9-7db7-4943-9a34-b55a930fa207
collection = collect(1:5)

# ╔═╡ db71a959-3ef0-4da5-bd27-deaa4c47837b
md"Indexing"

# ╔═╡ 666df65b-3679-42ec-877e-4947b35f97a5
collection[1]

# ╔═╡ 3348ed56-0d26-407e-90b1-ba1a82e9f3d3
md"Array comprehension"

# ╔═╡ bff3d2f1-8255-4fc6-ac6f-43285d5d6989
[sqrt(x) for x in 1:5]

# ╔═╡ 5ea04cfd-7d8c-450e-9335-65f9a13887ae
[sqrt(x) for x in 1:10 if x % 2 != 0] 

# ╔═╡ d8f5d3ae-5175-43e4-8279-77024d69856f
md"Broadcasting"

# ╔═╡ e60f8bdc-b825-4a69-aec0-89ea01e590fe
sqrt.(collection) .+ 1

# ╔═╡ 86deb0c1-f291-4bd9-861d-4355fe2dff81
md"""
---
"""

# ╔═╡ 29a2068e-47f7-4327-b52c-457f521a970f
PlutoUI.TableOfContents()

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LaTeXStrings = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
Measures = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
LaTeXStrings = "~1.2.1"
Measures = "~0.3.1"
PlutoUI = "~0.7.9"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[LaTeXStrings]]
git-tree-sha1 = "c7f1c695e06c01b95a67f0cd1d34994f3e7db104"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.2.1"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[Measures]]
git-tree-sha1 = "e498ddeee6f9fdb4551ce855a46f54dbd900245f"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.1"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "438d35d2d95ae2c5e8780b330592b6de8494e779"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.0.3"

[[PlutoUI]]
deps = ["Base64", "Dates", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "Suppressor"]
git-tree-sha1 = "44e225d5837e2a2345e69a1d1e01ac2443ff9fcb"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.9"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[Suppressor]]
git-tree-sha1 = "a819d77f31f83e5792a76081eee1ea6342ab8787"
uuid = "fd094767-a336-5f1f-9728-57cf17d0bbfb"
version = "0.2.0"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
"""

# ╔═╡ Cell order:
# ╟─504ac24f-5e3b-48fc-9ea7-b684274022f8
# ╟─934c4b0c-913b-44f0-a880-50141b853165
# ╠═b5c95cbd-1fe8-4796-92d0-3b4ae309c8d9
# ╠═4df5192a-c576-480f-ab1f-bbb73273a8cf
# ╟─c27f7c14-c6bb-43f6-b231-37d66fd9dd81
# ╠═2ed06105-6ca5-4cdb-b176-b4eedf24db43
# ╠═48dafa99-d4ff-4ec3-b58d-5a06ae49db26
# ╠═4e4d3536-2360-4790-9962-d761ea565af6
# ╟─ef345764-ffb7-4e59-a99a-30cbe3f383d6
# ╠═fa6157ea-49e0-4b48-b83c-fcfa334cc3a6
# ╠═4b5de8d6-c778-42e3-9a91-e63ff235913a
# ╠═60ccea97-08b4-417e-81e0-5110ce532d51
# ╠═c1ee4f85-b9f0-4ab3-acbc-50573c02a459
# ╠═dabf264b-93d0-492f-be5a-47cc3efb9b0a
# ╠═8fdef782-3d8f-4560-9054-371bf49a705d
# ╠═b99c8424-1da3-4fde-8d9a-f698c1511d03
# ╟─49d1b1c3-45e4-41ef-91ed-562ee220ac5f
# ╠═9699f41d-6f92-4528-9e38-a94c8ee72f25
# ╠═67f9a128-d276-4455-827f-66cd58030517
# ╠═47b84567-81ad-4ddd-aebb-5cbaab2a1543
# ╠═0f77e7ed-1b7e-4004-b8cc-2061292ada5e
# ╠═a4b1caa7-bb57-49bc-bec0-6600a6d70951
# ╠═a1ac508b-9503-479f-8b16-3039c0d16c9b
# ╠═3a0be158-bd80-4837-a040-dc11470e3c58
# ╠═9f915932-d7f3-47a9-a85c-2182531e8c46
# ╠═0abeb1d5-1413-4dd4-8f20-9d95b866fa63
# ╠═5634427a-e14d-4c37-86a4-6da6ca656c12
# ╟─72fc678c-06c7-43d7-9716-b91a1425aa89
# ╟─57757638-993e-4fbe-b0fc-faf0cc34e995
# ╠═ec4f8362-39ca-4cf6-af8b-857e152d82b7
# ╠═082a675a-d7c5-4c33-a5d7-1e83570f16fd
# ╠═6947633b-6896-4bc6-929c-50a68002a94d
# ╟─61371d87-acb9-448a-a875-f5745224c5df
# ╠═b5b0311e-9c16-4b9a-8091-43838b7feb8f
# ╠═588fd62f-509c-4b99-8e23-9b60e14d5602
# ╠═c2d8adc5-1ef2-4c46-bfb2-9ea30ca12e89
# ╠═c54a18cd-eddc-4e20-bb7e-1b33e832b422
# ╠═c03b8c69-64e3-4223-8765-2818ea52f5a2
# ╠═38e70ac5-fa8d-4ca8-9c71-c104a48b1e87
# ╟─05a088e1-60b6-47df-bf61-fddf548563e0
# ╠═c9d6131c-d577-4523-9f1e-6f4543dd5f44
# ╠═1bcbfd07-375a-4fcb-913b-cd159fce54e7
# ╟─9f9573af-b65a-4246-aefa-64cc48ea9dcd
# ╠═ac0abe2d-6fe0-4a11-b212-0ca1ecc68ae2
# ╠═cc3a3304-c9b5-45e5-8209-9c94bfc611dd
# ╠═0cc52da8-303d-45fd-9390-7b203cd15773
# ╠═5115e0e4-0e37-4787-9b41-2a18605dc457
# ╠═dfd31ce8-4c00-4ebe-a5f9-4d50b4c2e3cd
# ╠═4f79eb5e-3cd6-42a0-b557-5a5821a9428b
# ╠═c91a721d-1cb5-4839-8566-842c996e61a1
# ╟─daf19907-5675-4430-886d-a69f3b71aed9
# ╠═c71d8f39-4911-450d-bb97-8b93a61693a7
# ╠═3e72cf06-2247-4a71-bbaa-c1d420ed83e4
# ╟─ca7472e6-b08b-410b-a921-cccdd5fbfc31
# ╟─1d1b47c9-429c-41ec-9e09-38bddd2e3f7e
# ╠═8c9c54d7-403c-48a7-b63e-12c7fdd5659c
# ╠═69631bb0-f279-4bf2-86d0-0f21bc6d3314
# ╟─7e07074d-4aa3-459c-9c90-24718815d865
# ╠═86fab7a8-6d48-42dc-b963-df227162fb39
# ╠═ff173169-77aa-4e6b-988d-0d1f7bd15a02
# ╠═96e44dec-8ed7-4b87-b0de-c069d22e54f7
# ╠═7bcf656c-e397-4544-a2c1-7c5a082a42d6
# ╠═bcd44701-7992-45fc-be4d-e4a13cfbcc63
# ╠═5a93658c-5807-46ef-8faf-108347a38bb4
# ╠═d66723b9-7db7-4943-9a34-b55a930fa207
# ╟─db71a959-3ef0-4da5-bd27-deaa4c47837b
# ╠═666df65b-3679-42ec-877e-4947b35f97a5
# ╟─3348ed56-0d26-407e-90b1-ba1a82e9f3d3
# ╠═bff3d2f1-8255-4fc6-ac6f-43285d5d6989
# ╠═5ea04cfd-7d8c-450e-9335-65f9a13887ae
# ╟─d8f5d3ae-5175-43e4-8279-77024d69856f
# ╠═e60f8bdc-b825-4a69-aec0-89ea01e590fe
# ╟─86deb0c1-f291-4bd9-861d-4355fe2dff81
# ╠═29a2068e-47f7-4327-b52c-457f521a970f
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
