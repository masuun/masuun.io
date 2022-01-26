# Maxwell 方程式
```math
{\rm div} {\bf E} = \frac{\rho}{\epsilon_0} \\
{\rm rot} {\bf E} = -\frac{\partial {\bf B}}{\partial t} \\
{\rm div} {\bf B} = {\bf 0} \\
{\rm rot} {\bf B} = \mu_0\epsilon_0\frac{\partial {\bf E}}{\partial t}+ \mu_0{\bf j} 
```
```math
F_{\mu\nu} := \partial_\mu A_\nu - \partial_\nu A_\mu\\
A_{0} = -\phi,  ( A_1, A_2, A_3) = {\bf A}
```
```math
F_{it} = \partial_i A_t - \partial_t A_i\\
 = -\partial_i\phi-\partial_tA_i\\
 =E_i
```
```math
F_{12} = \partial_1 A_2 - \partial_2 A_1= B_3\\
F_{23} = \partial_2 A_3 - \partial_3 A_2= B_1\\
F_{31} = \partial_3 A_1 - \partial_1 A_3= B_2
```
```math
\epsilon^{kij}F_{ij} =2(\epsilon^{k12}F_{12}+\epsilon^{k23}F_{23} +\epsilon^{k31}F_{31} )\\
=2(\delta^{k3}F_{12}+\delta^{k1}F_{23} +\delta^{k2}F_{31} )\\
=2(\delta^{k3}B_{3}+\delta^{k1}B_{1} +\delta^{k2}B_{2} )\\
=2\delta^{kj}B_{j}\\
=2B^{k}
```
```math
\epsilon_{lmk}\epsilon^{kij}F_{ij} =2\epsilon_{lmk}B^{k}\\
(\delta_l^i\delta_m^j-\delta_m^i\delta_l^j)F_{ij} =2\epsilon_{lmk}B^{k}\\
(\delta_l^i\delta_m^j-\delta_m^i\delta_l^j)F_{ij} =2\epsilon_{lmk}B^{k}\\
F_{lm} =\epsilon_{lmk}B^{k}
```

```math
\partial^\mu F_{\mu\nu}=0
```
を考える
```math
\partial^\mu F_{\mu\nu}\\
=-\partial_t F_{t\nu} +\partial_i F_{i\nu} \\
```
$\nu=t$
```math
\partial^\mu F_{\mu\nu}\\
=\partial_i F_{it} \\
={\rm div}{\bf E}
```
$\nu=j$
```math
-\partial_t F_{tj} +\partial_i F_{ij} \\
=\frac{\partial E_j}{\partial t}+\partial_i \epsilon_{ijk}B^{k}\\
=\frac{\partial E_j}{\partial t}-\epsilon_{jik}\partial_i B^{k}\\
=\left(\frac{\partial {\bf E}}{\partial t}-\nabla\times{\bf B}\right)_j
```

ビアンキ恒等式
```math
\partial_\rho F_{\mu\nu} +\partial_\nu F_{\rho\mu}+\partial_\mu F_{\nu\rho}=0
```
$\mu = i, \nu=t, \rho=k$
```math
\partial_k F_{it} +\partial_t F_{ki}+\partial_i F_{tk}=0\\
\partial_k E_{i}-\partial_i E_{k} +\partial_t F_{ki}=0\\
\epsilon^{jki}(\partial_k E_{i}-\partial_i E_{k}) +\partial_t \epsilon^{jki}F_{ki}=0\\
2\epsilon^{jki}\partial_k E_{i} +2\partial_t B^j=0\\
\left(\frac{\partial {\bf B}}{\partial t}+\nabla\times{\bf E}\right)^j=0
```
$\mu = i, \nu=j, \rho=k$
```math
\partial_k F_{ij} +\partial_j F_{ki}+\partial_i F_{jk}=0\\
\partial_k \epsilon^{kij}F_{ij} +\partial_j \epsilon^{kij}F_{ki}+\partial_i \epsilon^{kij}F_{jk}=0\\
2\partial_k B^k +2\partial_j B^j+2\partial_i B^{i}=0\\
{\rm div}{\bf B}=0
```
