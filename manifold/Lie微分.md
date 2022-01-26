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

## 接ベクトル
座標を前提としないな方法でベクトルを定義したい。多様体には任意の局所座標系をとれるから、ある座標系の数ベクトルとして定義すること勝手が悪い。そのため、局所座標系のとり方に無関係なものとして定義したいので、座標を前提としない方法でベクトルを定義する。
多様体上の点Pの開近傍Uで定義された任意の十分なめらかな実数値関数fと、点pを通る曲線を考える。
```math
f:M\to R \\
c:(-\epsilon<t<\epsilon)\to M
```
fとcの合成関数を考えると、曲線c上の関数として考えれる；
```math
f \circ c:R \to R,  t\mapsto f(c(t))
```
このようにしてfをtの1変数関数として考えることができる。
1変数関数の微分を考える；
```math
f \mapsto \frac{df(c(t))}{dt}
```
とくにt=0(点pに対応)での微分を考える；
```math
{\bf v}_c :f \mapsto \left.\frac{df(c(t))}{dt}\right|_{t=0}
```
$\left.\frac{d}{dt}\right|_{t=0}$のことを**cに沿う(t=0における)方向微分**と呼び、${\bf v}_c$という記号であらわす。
${\bf v}_c$は以下の性質をもつ
0. f,gが点pの開近傍で定義された$C^r$級関数で、しかも、pのある十分小さな開近傍でf=gならば、
```math
{\bf v}_c(f)={\bf v}_c(g).
```
1. 線形写像
```math
{\bf v}_c(af+bg)=a{\bf v}_c(f)+b{\bf v}_c(g).
```
2. 
```math
{\bf v}_c(fg)={\bf v}_c(f)g(p)+f(p){\bf v}_c(g).
```
## ベクトルの押し出し(push forward)
$\varphi$を微分同相写像とする；
```math
\varphi:M \to N   \tag{1}
```
このとき、
```math
 d \varphi:T_p(M) \to T_{\varphi(p)}(N)  \tag{2}
```
が$\varphi$から定義できる。$v$ $\in T_p(M)$としたとき、$M$上の局所座標系$x$の基底で表示すると、
```math
v = v^i\left.\frac{\partial }{\partial x^i}\right|_p  \tag{3}
```
となる。適当な曲線$c:t \mapsto x(t)$を選べば、
```math
v^i=\left.\frac{dx }{dt}\right|_{t=0}  \tag{4}
```
となる。
$d \varphi(v)$を$N$上の局所座標系$y$で展開すると
```math
\begin{eqnarray}
d \varphi(v) &=& w^i\left.\frac{\partial }{\partial y^i}\right|_{\varphi(p)}\\
 &=& \left. \frac{dy^i}{dt}\right|_{t=0} \left.\frac{\partial }{\partial y^i}\right|_{\varphi(p)}\\
 &=& \left. \frac{d\varphi^i(x(t))}{dt}\right|_{t=0} \left.\frac{\partial }{\partial y^i}\right|_{\varphi(p)}\\
 &=& \left.\frac{dx }{dt}\right|_{t=0}\left.\frac{\partial \varphi^i(x)}{\partial x^j}\right|_{p}\left.\frac{\partial }{\partial y^i}\right|_{\varphi(p)}\\
&=& v^j\left.\frac{\partial \varphi^i(x)}{\partial x^j}\right|_{p}\left.\frac{\partial }{\partial y^i}\right|_{\varphi(p)}  
\end{eqnarray}
```
```math
d \varphi(v) =  v^j\left.\frac{\partial \varphi^i(x)}{\partial x^j}\right|_{p}\left.\frac{\partial }{\partial y^i}\right|_{\varphi(p)}
\tag{5}
```
## リー微分
$\varphi_t$を微分同相写像とする；
```math
\varphi_{-t}:M \to M \tag{6}
```
```math
 d \varphi_{-t}:T_p(M) \to T_{\varphi_{-t}(p)}(M)  \tag{7}
```

```math
 d \varphi_{-t}(\eta(\varphi_t(x)))=\eta(\varphi_t(x))\frac{\partial \varphi_{-t}(x)}{\partial x}\frac{\partial }{\partial x}
 \tag{8}
```
![fig](fig1.jpg 's')
> この図では、tが増えると点は上へ移動していくように描いている。$t>0$の点のベクトルを$t=0$までリー移動させる。そのため、$\eta$の引数は$x(t)=\varphi_t(x)$と$t>0$となっており、$t=0$ への移動の写像$\varphi_{-t}$のインデックスは$-t<0$となっている。

$t$が微小のとき、座標系を$x$とすると
```math
\varphi_{-t}:x \mapsto x-t\xi
 \tag{9}
```
なので、
```math
\begin{eqnarray}
 d \varphi_{-t}(\eta(\varphi_t(x)))&=&\eta^j(\varphi_t(x))\frac{\partial \varphi_{-t}^i(x)}{\partial x^j}\frac{\partial }{\partial x^i}\\
 &=& \eta^j(x+t\xi)\frac{\partial (x^i-t\xi^i)}{\partial x^j}\frac{\partial }{\partial x^i}+\mathcal{O}(t^2)\\
 &=& \eta^j(x+t\xi)\frac{\partial (x^i-t\xi^i)}{\partial x^j}\frac{\partial }{\partial x^i}+\mathcal{O}(t^2)\\
 &=& \eta^j(x+t\xi)\left(\delta^i_j -t\frac{\partial \xi^i}{\partial x^j}\right)\frac{\partial }{\partial x^i} +\mathcal{O}(t^2)\\
 &=& \left(\eta^i(x+t\xi) -t\eta^j(x+t\xi)\frac{\partial \xi^i}{\partial x^j}\right)\frac{\partial }{\partial x^i} +\mathcal{O}(t^2)\\
 &=& \left(\left(\eta^i+\frac{\partial \eta^i}{\partial x^k}t\xi^k\right) -t\eta^j\frac{\partial \xi^i}{\partial x^j}\right)\frac{\partial }{\partial x^i} +\mathcal{O}(t^2)\\
 &=& \left(\eta^i+t\left(\frac{\partial \eta^i}{\partial x^k}\xi^k -\eta^j\frac{\partial \xi^i}{\partial x^j}\right)\right)\frac{\partial }{\partial x^i} +\mathcal{O}(t^2)
 \end{eqnarray}

```

```math
\lim_{t \to 0} \frac{d \varphi_{-t}(\eta(\varphi_t(x))) - \eta(x)}{t}
= \left(\xi^j\frac{\partial \eta^i}{\partial x^j} -\eta^j\frac{\partial \xi^i}{\partial x^j}\right)\frac{\partial}{\partial x^i}
 \tag{10}

```
