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
フーリエ級数展開の複素数表示を導く。
$$\begin{align}
f(x)&=\sum_{n=1}^\infty \left\{a_n\cos\left(2\pi \frac{x}{L}\right)+b_n\sin\left(2\pi \frac{x}{L}\right)\right\}+c_0\\
&=\sum_{n=1}^\infty \left\{\frac{a_n}{2}(e^{i2\pi n\frac{x}{L}}+e^{-i2\pi n\frac{x}{L}})+\frac{b_n}{2i}(e^{i2\pi n\frac{x}{L}}-e^{-i2\pi n\frac{x}{L}})\right\}+c_0\\
&=\sum_{n=1}^\infty \left\{\frac{a_n-ib_n}{2} e^{i2\pi n\frac{x}{L}}+\frac{a_n+ib_n}{2} e^{-i2\pi n\frac{x}{L}}\right\}+c_0\\
&=\sum_{n=1}^\infty \left\{c_n e^{i2\pi n\frac{x}{L}}+c_{-n} e^{-i2\pi n\frac{x}{L}}\right\}+c_0\\
&=\sum_{n=-\infty}^\infty c_n e^{i2\pi n\frac{x}{L} }
\end{align}$$

$$\begin{align}
c_{-n}=c_n^*
\end{align}$$

---
フーリエ成分の求め方；
$$\begin{align}
\int_{-\frac{L}{2}}^{\frac{L}{2}} dx f(x)e^{-i2\pi m\frac{x}{L} }&=\int_{-\frac{L}{2}}^{\frac{L}{2}} dx\sum_{n=-\infty}^\infty c_n e^{i2\pi (n-m)\frac{x}{L} }\\
&=\sum_{n=-\infty}^\infty c_n \int_{-\frac{L}{2}}^{\frac{L}{2}} dx e^{i2\pi (n-m)\frac{x}{L} }\\
&=\sum_{n=-\infty}^\infty c_n \delta_{nm}L\\
&= c_mL
\end{align}$$
$$\begin{align}
c_m&=\frac{1}{L}\int_{-\frac{L}{2}}^{\frac{L}{2}} dx f(x)e^{-i2\pi m\frac{x}{L} }
\end{align}$$

-----

フーリエ変換へ拡張；$L\to\infty$
$$\begin{align}
f = \sum_{n=-\infty}^\infty \left(\frac{1}{L}\int_{-\frac{L}{2}}^{\frac{L}{2}} dy f(y)e^{-i2\pi n\frac{y}{L} }\right) e^{i2\pi n\frac{x}{L} }
\end{align}$$

$k_n = \frac{2\pi n}{L}$
$\frac{1}{L} =\frac{k_{n+1}-k_n}{2\pi} =\frac{\Delta k}{2\pi}$

$$\begin{align}
f(x) &= \sum_{n=-\infty}^\infty \left(\frac{\Delta k}{2\pi}\int_{-\frac{L}{2}}^{\frac{L}{2}} dy f(y)e^{-iky }\right) e^{ikx }\\
& \to \frac{1}{\sqrt{2\pi}}\int_{-\infty}^\infty d k\tilde{f}(k) e^{ikx }
\end{align}$$
$$\begin{align}
f(x) = \frac{1}{\sqrt{2\pi}}\int_{-\infty}^\infty d k\tilde{f}(k) e^{ikx }\\
\tilde{f}(k) = \frac{1}{\sqrt{2\pi}}\int_{-\infty}^\infty d yf(y) e^{-iky }
\end{align}$$

---
デルタ関数とフーリエ変換
$$\begin{align}
\int \delta(x) f(x)dx= f(0)
\end{align}$$
$\delta(x)$のフーリエ変換を考える；
$$\begin{align}
\tilde{f}(k) &= \frac{1}{\sqrt{2\pi}}\int_{-\infty}^\infty d y\delta(y) e^{-iky }\\
            &=\frac{1}{\sqrt{2\pi}}
\end{align}$$
従って逆変換からデルタ関数は以下になる；
$$\begin{align}
\delta(x) = \frac{1}{2\pi}\int_{-\infty}^\infty d k e^{ikx }\\
\end{align}$$


---
ガウス関数とフーリエ変換
$$\begin{align}
f(x) = \frac{1}{\sqrt{2\pi}}e^{\frac{x^2}{2\sigma^2}}
\end{align}$$
$f(x)$のフーリエ変換を考える；
$$\begin{align}
\tilde{f}(k) &= \frac{1}{\sqrt{2\pi}}\frac{1}{\sqrt{2\pi}}\int_{-\infty}^\infty d ye^{\frac{y^2}{2\sigma^2}} e^{-iky }\\
            &=\frac{1}{\sqrt{2\pi}}\frac{1}{\sqrt{2\pi}}\int_{-\infty}^\infty d ye^{\frac{(y-i\sigma^2k)^2+\sigma^4k^2}{2\sigma^2}} \\
            &=\frac{\sigma}{\sqrt{2\pi}}e^{\frac{\sigma^2k^2}{2}} \\
            &=\frac{\sigma}{\sqrt{2\pi}}e^{\frac{k^2}{2/\sigma^2}} \\
\end{align}$$

