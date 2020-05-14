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

# 幾何分布の極限で指数分布を導出する
(1)から(2)を導出する；
- **前提**
    1. 試行の成功とイベント発生を同一視する
    2. 試行$x$回にかかる時間を$t$とする

- **幾何分布の確率分布**
    - 確率$p$のベルヌーイ試行で$x$回目で初めて成功する確率
$$
P(X=x)=p(1-p)^{x-1}   \tag{1}
$$
- **指数分布の確率密度関数**
    - 時間$t$後に1回イベントが起こる確率。ただし$\lambda$は単位時間あたりの発生回数の期待値
$$
f(X=t)=\lambda e^{-\lambda t}   \tag{2}
$$

----
**導出**
1回の試行でかかる時間を$\Delta t$とすれば、前提2より
$$
t = x\Delta t \tag{3}
$$
さらに、$\lambda$を以下で定義する
$$\begin{align}
\lambda  :=\frac{xp}{t}\\
          =\frac{p}{\Delta t}   \tag{4}
\end{align}
$$
$\lambda$は単位時間あたりの発生回数の期待値となる。(分子の$xp$は$x$回試行したときに成功が発生する期待回数で、分母はその試行時間にかかる時間$t$となる。)

(3),(4)を(1)に代入して(2)の導出をする
$$
\begin{align}
P(X=x)&=p(1-p)^{x-1}\\
      &=\lambda\Delta t\frac{(1-\lambda\Delta t)^{\frac{t}{\Delta t}}}{1-\lambda\Delta t}\\
      &=\lambda\Delta t\frac{\{(1-\lambda\Delta t)^{\frac{1}{\Delta t}}\}^t}{1-\lambda\Delta t}\\
\end{align}
$$
ここで$\lambda$を一定として$\Delta t \rightarrow 0$を考える。そうすると左辺の分数のパートに注目すると
$$
\frac{\{(1-\lambda\Delta t)^{\frac{1}{\Delta t}}\}^t}{1-\lambda\Delta t}\rightarrow e^{-\lambda t}
$$
となるので、
$$
P(X=x)\rightarrow  \lambda e^{-\lambda t} \Delta t \tag{5}
$$
となる。(5)を$\Delta t$で割ると確率密度関数(2)が導出される
