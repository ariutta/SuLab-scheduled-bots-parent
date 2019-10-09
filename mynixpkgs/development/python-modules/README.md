```
cd wikidataintegrator
pypi2nix -s pbr -e sparql-slurper -e ShExJSG -e PyShEx -e wikidataintegrator
nix-shell requirements.nix -A interpreter
# ctrl-d
cd ..
nix build -f python-packages.nix wikidataintegrator
```
