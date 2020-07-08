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
次を計算する；
$$
I=\int_{-\infty}^{+\infty}e^{-x^2}dx
$$


----
$$\begin{align}
I^2&=\left(\int_{-\infty}^{+\infty}e^{-x^2}dx\right)\left(\int_{-\infty}^{+\infty}e^{-y^2}dy\right)\\
&=\int_{-\infty}^{+\infty}\int_{-\infty}^{+\infty}e^{-(x^2+y^2)}dxdy\\
&=\int_{0}^{+\infty}\int_{0}^{2\pi}e^{-r^2}rd\theta dr \\
&=2\pi\left[-\frac{1}{2}e^{-r^2} \right]_0^{\infty}\\
&=\pi
\end{align}
$$
$$
I=\sqrt{\pi}
$$

---
- 鮮やかって感じ
    - 2乗して極座標にしてヤコビアンをうまく使って。賢い。
- $e$から$\pi$が出てくるのが不思議

