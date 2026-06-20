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

## Running the notebooks

The pinned environment (`Project.toml`) dev-installs the local package from a
relative path. From this folder:

```julia
using Pkg
Pkg.activate(".")
Pkg.instantiate()      # resolves the pinned environment (RiskLabAI.jl + deps)
```

Then open any notebook with [IJulia](https://github.com/JuliaLang/IJulia.jl), or run
it headless:

```bash
jupyter nbconvert --to notebook --execute --inplace <path-to-notebook>
```

Tutorials 3–4 read the S&P 500 from **FRED**; set the `FRED_API_KEY` environment
variable (a free key from <https://fred.stlouisfed.org>). All other data is either
synthetic or the committed `Data/AAPL_OHLCV_1m_Data.csv` snapshot, so the notebooks
stay reproducible and offline.
