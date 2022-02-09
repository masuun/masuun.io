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

1. ${\rm E}[(X-a)^2]$を$a$を変数にもつ関数と見たとき、関数を最小にするのは$a={\rm E}[X]$のときである。
2. ${\rm E}[|X-a|]$をを$a$を変数にもつ関数と見たとき、関数を最小にするのは$a={\rm Mid}[X]$のときである。
----
- **1の証明**

$\begin{align}
{\rm E}[(X-a)^2]
&={\rm E}[X^2]-2a{\rm E}[X]+{\rm E}[a^2]\\
&=\sigma^2+\mu^2-2a\mu+a^2\hspace{2em}  (\mu:={\rm E}[X],\sigma^2:={\rm E}[X^2]-{\rm E}[X]^2)\\
&=(a-\mu)^2+\sigma^2 
\tag{1}
\end{align}$
(1)より、${\rm E}[(X-a)^2]$は$a=\mu$のとき最小になる

- **2の証明**

$\begin{align}
{\rm E}[|X-a|]
&=\int_{-\infty}^{\infty}|x-a|f_X(x)dx\\
&=a(2F(a)-1)+\mu-2\int_{-\infty}^axf(x)dx \hspace{2em} \left(F(a):=\int_{-\infty}^af(x)dx\right)
\tag{2}
\end{align}$
(2)の最小値を調べるために、$a$で微分をとる
$\begin{align}
\frac{d}{da}{\rm E}[|X-a|]
&=2F(a)-1+2af(a)-2af(a)\\
&=2F(a)-1
\tag{3}
\end{align}$
(3)は明らかに単調増加なので、(3)が0になるとき
(2)が最小になる。(3)が0になる必要十分条件は$F(a)=\frac{1}{2}$であり、これをみたす$a$は定義により中央値となる。