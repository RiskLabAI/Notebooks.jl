<div align="center">
  <a href="https://risklab.ai"><img src="Utils/risklab_ai.gif" width="80px"/></a>
  <h1>RiskLabAI.jl — Tutorial Notebooks</h1>
</div>

Runnable Julia tutorials for [`RiskLabAI.jl`](https://github.com/RiskLabAI/RiskLabAI.jl),
the financial-machine-learning library based on López de Prado's *Advances in
Financial Machine Learning* and *Machine Learning for Asset Managers*. Each notebook
is **exhaustive over its module**, runs **top-to-bottom against a pinned
environment**, and mirrors the matching Python tutorial in
[`Notebooks.py`](https://github.com/RiskLabAI/Notebooks.py).

## Getting started

New to this? This gets you from a fresh computer to running any tutorial. You only do
**Step 1** once.

### Step 1 — install the tools (once)

**1a. VS Code.** Download and install [Visual Studio Code](https://code.visualstudio.com/Download)
(Windows or macOS) and open it once. Then install these **extensions** (left sidebar →
Extensions icon → search → Install):
- **Julia** (publisher: julialang)
- **Jupyter** (publisher: Microsoft)

**1c. Julia.** Install Julia via the official installer
([`juliaup`](https://julialang.org/install/)):
- **Windows:** `winget install julia -s msstore` in a terminal, or use the installer on that page.
- **macOS:** paste `curl -fsSL https://install.julialang.org | sh` into Terminal, or `brew install juliaup`.

Confirm it works: open a new terminal and run `julia --version`.

### Step 2 — run a notebook

1. **Add the Julia kernel for notebooks (once).** In a terminal:
   ```bash
   julia -e "using Pkg; Pkg.add(\"IJulia\")"
   ```
   This lets VS Code / Jupyter run Julia notebooks.
2. **Get the notebooks.** Go to <https://github.com/RiskLabAI/Notebooks.jl> → green
   **Code** button → **Download ZIP** → unzip somewhere easy. (Or, with git:
   `git clone https://github.com/RiskLabAI/Notebooks.jl`.)
3. **Open the folder in VS Code:** File → Open Folder → choose the `Notebooks.jl` folder.
4. **Install the packages.** Open a terminal in VS Code (Terminal → New Terminal) and run:
   ```bash
   julia --project=. -e "using Pkg; Pkg.instantiate()"
   ```
   This installs **RiskLabAI** plus the plotting/data packages pinned for the notebooks.
   (First time compiles for several minutes — normal for Julia.)
5. **Open a notebook** (e.g. `Optimizing/01_portfolio_construction.ipynb`), click
   **Select Kernel** (top-right) → **Julia**, then click **Run All**.

### The FRED API key (two notebooks)

The **fractional differentiation** and **triple-barrier labeling** tutorials pull real
data from FRED (the Federal Reserve's free database). To run them:

1. Get a free API key (instant): <https://fredaccount.stlouisfed.org/apikey>
2. Set it as an environment variable, then **open a new terminal** so it takes effect:
   - **Windows:** `setx FRED_API_KEY "your_key_here"`
   - **macOS:** add `export FRED_API_KEY="your_key_here"` to `~/.zshrc`, then `source ~/.zshrc`
3. Verify in a new terminal: `echo %FRED_API_KEY%` (Windows) or `echo $FRED_API_KEY` (macOS).

All other tutorials run fully offline and need no key.

### Optional — the PDE notebook only

The Deep-BSDE notebook (`Pde/DeepBSDE.ipynb`) uses the `Lux`/`Zygote`/`Optimisers`
deep-learning stack. It arrives automatically with `RiskLabAI` (no extra install) — just
run the notebook top-to-bottom.

## Flagship tutorials

| # | Notebook | Topic |
|---|----------|-------|
| 1 | [`Optimizing/01_portfolio_construction.ipynb`](Optimizing/01_portfolio_construction.ipynb) | Robust portfolio construction — covariance **denoising** (Marčenko–Pastur), **HRP**, and **NCO** vs naive Markowitz |
| 2 | [`Data/Structures/FinancialDataStructures.ipynb`](Data/Structures/FinancialDataStructures.ipynb) | **Financial data structures** — time, tick, volume, dollar, imbalance & run bars (offline AAPL data) |
| 3 | [`Data/Diffrentation/FractionalDifferentiation.ipynb`](Data/Diffrentation/FractionalDifferentiation.ipynb) | **Fractional differentiation** — the minimum `d` for stationarity via an ADF sweep (FRED S&P 500) |
| 4 | [`Data/Labelling/TripleBarrierLabeling.ipynb`](Data/Labelling/TripleBarrierLabeling.ipynb) | **Triple-barrier labeling** + meta-labeling + trend scanning (FRED S&P 500) |
| 5 | [`Validation/CrossValidationAndPBO.ipynb`](Validation/CrossValidationAndPBO.ipynb) | **Cross-validation** — purged K-Fold, CPCV, walk-forward, and the Probability of Backtest Overfitting (PBO) |
| 6 | [`Features/FeatureImportance.ipynb`](Features/FeatureImportance.ipynb) | **Feature importance** — MDI, MDA, SFI, orthogonal (PCA) features, and weighted Kendall-τ |
| 7 | [`Pde/DeepBSDE.ipynb`](Pde/DeepBSDE.ipynb) | **Deep-BSDE** PDE solver (Han, Jentzen & E 2018) — four financial PDEs, checked vs Monte-Carlo / closed-form references |

## Setup

`RiskLabAI` is pulled from its public repository — no local clone of the library
needed. From this folder:

```julia
using Pkg
Pkg.activate(".")
Pkg.instantiate()      # fetches RiskLabAI + deps and precompiles the env
```

> Once `RiskLabAI.jl` is published to the General registry, the `[sources]` entry
> in `Project.toml` can be dropped and the dep becomes a plain `Pkg.add("RiskLabAI")`.

Then open any notebook with [IJulia](https://github.com/JuliaLang/IJulia.jl), or run
it headless:

```bash
jupyter nbconvert --to notebook --execute --inplace <path-to-notebook>
```

The Deep-BSDE PDE notebook (`Pde/DeepBSDE.ipynb`) uses the `Lux`/`Zygote`/`Optimisers`
deep-learning stack; it arrives transitively with `RiskLabAI`, so no extra install
step is required — only that one notebook exercises it.

Tutorials 3–4 read the S&P 500 from **FRED**; set the `FRED_API_KEY` environment
variable (a free key from <https://fred.stlouisfed.org>). All other data is either
synthetic or the committed `Data/AAPL_OHLCV_1m_Data.csv` snapshot, so the notebooks
stay reproducible and offline.
