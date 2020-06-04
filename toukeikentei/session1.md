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


# 第１章練習問題
---
----
問1.1
$U$と$V$を互いに独立に区間$(0,1)$上の一様分布に従う確率変数とし、$X=\max(U,V),Y=\min(U,V)$とする。このとき以下の設問に答えよ。
[1] $X$の累積分布関数$G_1(x)=P(X\leq x)$と$Y$の累積分布関数$G_2(y)=P(Y\leq y)$をそれぞれ求めよ。また、それらの累積分布関数の概形を描け。
[2] $X$の確率密度関数$g_1(x)$と$Y$の確率密度関数$g_2(y)$をそれぞれ求めよ。またそれらの確率密度関数の概形を描け。
[3] $X$と$Y$の同時確率密度関数$g(x,y)$を求めよ。
[4] $X$と$Y$の相関係数を求めよ。

----

[1]
$$
\begin{eqnarray}
X\leq x  &\Leftrightarrow&　\max(U,V)\leq x \\
         &\Leftrightarrow& U\leq x \ \ {\rm and} \ \ V\leq x
\end{eqnarray}
$$
より
$$
\begin{eqnarray}
P(X\leq x) &=& P(U\leq x, V\leq x)\\
           &=&P(U\leq x)P(V\leq x)  \hspace{2em}(U,Vは独立)\\
           &=&x^2
\end{eqnarray}
$$
したがって$G_1(x)=x^2$
$$
\begin{eqnarray}
Y\leq y  &\Leftrightarrow&　\min(U,V)\leq y \\
         &\Leftrightarrow& U\leq y \ \ {\rm or} \ \ V\leq y\\
         &\Leftrightarrow& \lnot(U> y \ \ {\rm and} \ \ V> y)
\end{eqnarray}
$$
より
$$
\begin{eqnarray}
P(Y\leq y)&=& P(\lnot(U> y \ \ {\rm and} \ \ V> y))\\
        &=&1 - P(U> y, V> y)\\
        &=&1 - P(U> y)P(V> y)\\
        &=&1 - (1-y)^2
\end{eqnarray}
$$
したがって$G_2(y)=1 - (1-y)^2$

[2]
$$
\begin{eqnarray}
g_1(x)&=& \frac{dG_1(x)}{dx}=2x\\
g_x(y)&=& \frac{dG_2(y)}{dx}=2(1-y)
\end{eqnarray}
$$
[3]
まず累積分布関数$G(x,y)=P(X≤x,Y≤y)$を求める。[1],[2]より；
$$
\begin{eqnarray}
X\leq x \ {\rm and} \  Y\leq y
 &\Leftrightarrow& (U\leq x \ \ {\rm and} \ \ V\leq x )\ \ {\rm and} \ \ \lnot(U> y \ \ {\rm and} \ \ V> y)
\end{eqnarray}
$$
ここで$A:=(U\leq x \ \ {\rm and} \ \ V\leq x )$,$B:=\lnot(U> y \ \ {\rm and} \ \ V> y)$と置くと$G(x,y)=P(A\cap B)$となる。$B$と$\lnot B$が互いに排反であることに気をつけると、
$$
\begin{eqnarray}
P(A)&=&P(A\cap B)+P(A\cap \lnot B)\\
P(A\cap B) &=& P(A)-P(A\cap \lnot B) \hspace{2em}(式変形)\\
\end{eqnarray}
$$
となる。右辺第一項は[1]より$P(A)=x^2$となる。第二項は、
$$
P(A\cap \lnot B )=P(y<U\leq x, y<V\leq x)\\
=(y-x)^2
$$
となるから結局；
$$
G(x,y)=x^2- (y-x)^2=y(2x-y^2)
$$
となり、同時確率密度関数は
$$g(x,y)=2$$
[4]
$
E(X)=\int_0^1 2x^2dx=\left[\frac{2}{3}x^3\right]_0^1=\frac{2}{3}
$
$
E(Y)=\int_0^1 2(1-y) ydy=\left[y^2-\frac{2}{3}y^3\right]_0^1=1-\frac{2}{3}=\frac{1}{3}
$
$
E(X^2)=\int_0^1 2x^3dx=\left[\frac{1}{2}x^4\right]_0^1=\frac{1}{2}
$
$
E(Y^2)=\int_0^1 2(1-y) y^2dy=\left[\frac{2}{3}y^3-\frac{1}{2}y^4\right]_0^1=\frac{2}{3}-\frac{1}{2}=\frac{1}{6}
$
$
E(XY)=\int_0^1 dx\int_0^x dy 2xy=\int_0^1 dx\left[xy^2\right]_0^x=\left[\frac{1}{4}y^4\right]_0^1=\frac{1}{4}
$$V(X)=E(X^2)-E(X)^2=\frac{1}{2}-\frac{4}{9}=\frac{1}{18}$
$V(Y)=E(Y^2)-E(Y)^2=\frac{1}{6}-\frac{1}{9}=\frac{1}{18}$
$
{\rm Cov}(X,Y)=E(XY)-E(X)E(Y)=\frac{1}{4}-\frac{2}{3} \times \frac{1}{3}=\frac{9-8}{36}=\frac{1}{36}
$


---
---

問1.2
[1] $X$を確率密度関数$f_X(x)=\frac{1}{\pi(1+x^2)}$をもつコーシー分布に従う確率変数とする。$Y=\frac{1}{X}$の確率密度関数$f_Y(y)$をもとめよ。
[2] $X$と$Y$を互いに独立な標準正規分布に従う確率変数とする。$V=\frac{Y}{X}$の確率密度関数$f_V(v)$を求めよ。

---

[1]
ヤコビアンの絶対値は
$$\left|\frac{dx}{dy}\right|=\left|\frac{d}{dy}\frac{1}{y}\right|=\frac{1}{y^2}$$
確率密度関数は、
$$\begin{eqnarray}
f_Y(y)&=&f_X(x(y))\left|\frac{dx}{dy}\right|=\frac{1}{\pi(1+\frac{1}{y^2})}\frac{1}{y^2} \\
&=&\frac{1}{\pi(1+y^2)}
\end{eqnarray}
$$

[2]
$U=X$として$X=U, Y=VU$より$\frac{\partial x}{\partial u}=1, \frac{\partial x}{\partial v}=0,\frac{\partial y}{\partial u}=v,\frac{\partial y}{\partial v}=u$なので
ヤコビアンの絶対値は
$$
\left|\left|\frac{\partial (x,y)}{\partial (u,v)}\right|\right|=|u|
$$
確率密度関数は
$$\begin{eqnarray}
f_{UV}(u,v)&=&f_{XY}(x(u,v),y(u,v))\left|\left|\frac{\partial (x,y)}{\partial (u,v)}\right|\right|\\
&=&|u|\frac{1}{2\pi }e^{-\frac{(1+v^2)u^2}{2}}
\end{eqnarray}$$
周辺化して
$$\begin{eqnarray}
f_{V}(v)&=&\int_{-\infty}^{\infty}du|u|\frac{1}{2\pi }e^{-\frac{(1+v^2)u^2}{2}}\\
&=&2\int^{\infty}_0 duu \frac{1}{2\pi }e^{-\frac{(1+v^2)u^2}{2}}\\
&=&\frac{1}{\pi }\left[-\frac{1}{1+v^2}e^{-\frac{(1+v^2)u^2}{2}}\right]^\infty_0\\
&=&\frac{1}{\pi(1+v^2)}
\end{eqnarray}$$

---
---
問1.3
[1] 連続型確率変数$Z$の累積分布関数$F(z)=P(Z\leq z)$が狭義単調増加であるとき、$U=F(Z)$は区間$(0,1)$上の一様分布に従うことを示せ
[2] $U_1, U_2およびU_3$を互いに独立に区間$(0,1)$上の一様分布に従う確率変数とし、$X_1$をそれらのうち最も小さいもの、$X_2$を２番めに小さいもの、$X_3$を最も大きいものとする。このとき、$j=1,2,3$に対し、$X_j$の確率密度関数$g_{j}(x)$を求め、それらのグラフを描け
[3] $j=1,2,3$に対し、上問[2]の確率変数$X_j$の期待値$E[X_j]$を求める

---

[1] NULL
[2]
- $X_3$の累積分布関数$G_{X_3}(x_3)$を考える
$G_{X_3}(x_3)=P(X_3\leq x_3)=P(U_1\leq x_3,U_2\leq x_3,U_3 \leq x_3)=x^3$
$f_{X_3}(x_3)=3x^2$
- $X_1$の累積分布関数$G_{X_1}(x_1)$を考える
$$\begin{eqnarray}
G_{X_1}(x_1)&=&P(X_1\leq x_1)\\
&=&P(U_1\leq x_1 \ {\rm or} \ U_2\leq x_1 \ {\rm or} \ U_3 \leq x_1)\\
&=&P(\lnot (U_1> x_1 , U_2> x_1 , U_3 > x_1) )\\
&=&1 - P(U_1> x_1 , U_2> x_1 , U_3 > x_1) \\
&=&1 - (1-x_1)^3 
\end{eqnarray}
$$
$f_{X_{1}}=3(1-x_1)^2$
- $X_2$の累積分布関数$G_{X_2}(x_2)$を考える
$$\begin{eqnarray}
G_{X_2}(x_2)&=&P(X_2\leq x_2)\\
&=&P(U_1\leq x_2, U_2\leq x_2, U_3>x_2)
\end{eqnarray}$$