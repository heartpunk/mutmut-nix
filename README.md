# mutmut-nix

Nix flake packaging [mutmut](https://github.com/boxed/mutmut) 3.5.0, a mutation testing tool for Python.

## Usage

### Run directly

```bash
nix run github:heartpunk/mutmut-nix -- mutmut --version
```

### Dev shell

```bash
nix develop github:heartpunk/mutmut-nix
mutmut run
```

### From FlakeHub

```bash
nix run "https://flakehub.com/f/heartpunk/mutmut-nix/*" -- mutmut --version
```

### As a flake input

```nix
{
  # From GitHub
  inputs.mutmut-nix.url = "github:heartpunk/mutmut-nix";

  # Or from FlakeHub (with semver)
  # inputs.mutmut-nix.url = "https://flakehub.com/f/heartpunk/mutmut-nix/*";

  outputs = { self, nixpkgs, mutmut-nix }: {
    # Use the overlay
    packages.x86_64-linux.default = let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ mutmut-nix.overlays.default ];
      };
    in pkgs.python312.withPackages (ps: [ ps.mutmut ]);
  };
}
```

## What's packaged

| Package | Version | Notes |
|---------|---------|-------|
| mutmut | 3.5.0 | Mutation testing CLI and library |

## Platforms

- `x86_64-linux` — CI tested
- `aarch64-linux` — CI tested
- `aarch64-darwin` — CI tested

## Version pins relaxed

- `uv-build`: nixpkgs 0.10.0 vs mutmut's pinned `<0.10.0,>=0.9.5`

## License

MIT
