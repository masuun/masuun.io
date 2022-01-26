<script>
MathJax = { 
    tex: {
    inlineMath: [            
    ['$', '$'],
    ['\\(', '\\)']
    ] }
};
</script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>


# 正規方程式と最小二乗法
$$\begin{aligned}
S&=\frac{1}{2}\sum_i^n\left\{y_i-\sum_k^p\beta_kx_{ik}\right\}^2\\
\frac{\partial S}{\partial \beta_j}&=\sum_i^n\left\{y_i-\sum_k^p\beta_kx_{ik}\right\}\left(-\frac{\partial}{\partial\beta_j}\sum_k^p\beta_kx_{ik}\right)\\
&= \sum_i^n\left\{y_i-\sum_k^p\beta_kx_{ik}\right\}\left(-x_{ij}\right)\\
&= -\left\{\sum_i^nx_{ij}y_i-\sum_i^n\sum_k^px_{ij}x_{ik}\beta_k\right\}=0
\end{aligned}$$
$$\begin{aligned}
X^{T}{\vec y}=X^{T}X{\vec {\hat\beta}}
\end{aligned}$$
