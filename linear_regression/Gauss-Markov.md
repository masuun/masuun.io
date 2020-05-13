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
# ガウスマルコフの定理の導出  
よく定理のステートメントと証明方法を忘れるので記録しておく

----
**ガウスマルコフの定理**
線形回帰モデル 
${\boldsymbol  Y} = X{\boldsymbol {\beta}} + {\boldsymbol \epsilon} \tag{1}$
 が下記前提を満たすとき、最小二乗推定量$\hat{\boldsymbol {\beta}}$は最良線形不偏推定量（BLUE）となる   

- 前提
    - 計画行列$X$は非確率的  
    -  $E({\boldsymbol \epsilon})={\boldsymbol 0}$  
    -  $V({\boldsymbol \epsilon})={\sigma}^2 I$    

- 定義  
    - 線形不偏推定量；${Y_i} $の線形和で表される不偏な推定量
    - 最良線形不偏推定量；線形不偏推定量のうち、もっとも分散の小さいもの
----
**証明**
まず最小二乗推定量が線形不偏推定量であることを示た後、一般の線形不偏推定量の分散の最小値が最小二乗推定量の分散になることを示す

- <b> 最小二乗推定量が線形不偏推定量であることの証明  </b>
　最小二乗推定量は正規方程式の解として次のように表せる；
  
  $\hat{\boldsymbol {\beta}}:=(X^{T}X)^{-1} X^{T}{\boldsymbol  Y} \tag{2} $ 
これは明らかに線形推定量である。また、期待値を計算すると  

 $\begin{align}
E(\ \hat{\boldsymbol {\beta}} \ ) &= E \left( (X^{T}X)^{-1} X^{T}{\boldsymbol  ( X{\boldsymbol {\beta}} + {\boldsymbol \epsilon} )}\right) \hspace{2em}(  (1), (2)代入) \\
&= E \left(  {\boldsymbol \beta}    \right)       \hspace{3em}(  期待値の線形性と前提2) \\
&=  {\boldsymbol \beta}   \tag{3} 
\end{align}$
となり不偏であることが示される
- <b> 線形不偏推定量の分散の最小値が最小二乗推定量の分散になる証明</b>
　最小二乗推定量の共分散行列を計算する

 $\begin{align}
V(\ \hat{\boldsymbol {\beta}} \ ) &= V\left(  (X^{T}X)^{-1} X^{T} ( X{\boldsymbol {\beta}} + {\boldsymbol \epsilon} )   \right)   \hspace{2em}(  (1), (2)代入)  \\
&= \{(X^{T}X)^{-1} X^{T} \} V\left(   {\boldsymbol \epsilon}    \right)\{(X^{T}X)^{-1} X^{T}  \}^{T}  {\hspace 0.1em}( 分散行列の性質;V(C{\boldsymbol e}+d) = CV({\boldsymbol e})C^{T} )  \\
&= \{(X^{T}X)^{-1} X^{T} \}   {\sigma}^2 I \{X(X^{T}X)^{-1}   \}    \hspace{1em} (前提3と(X^{T}X)^{-1} が対称行列)   \\
&=   {\sigma}^2 (X^{T}X)^{-1}   \tag{4} 
\end{align}$
この行列の対角成分が最小二乗推定量の分散の値になる。
　一般の不偏線形推定量を $\tilde{\boldsymbol {\beta}} :=(L- (X^{T}X)^{-1} X^{T} ){\boldsymbol Y} $とおく。ここで$L$は$\tilde{\boldsymbol {\beta}}{\boldsymbol Y} $が不偏推定量となる範囲で許される勝手な行列とする。
不偏推定量であるため$L$が満たす必要のある条件は、$E(\tilde{\boldsymbol {\beta}} )={\boldsymbol {\beta}}  $を任意の$\beta$で成り立つことことから

$L X={\boldsymbol 0} \tag{5}$

となる。 一般の不偏線形推定量$\tilde{\boldsymbol {\beta}}$ の分散の最小値が$\hat{\boldsymbol {\beta}}$ であることを示す
 $\begin{align}
V(\ \tilde{\boldsymbol {\beta}} \ ) &= V((L- (X^{T}X)^{-1} X^{T} ){\boldsymbol Y} )\\
&=(L- (X^{T}X)^{-1} X^{T} )V({\boldsymbol Y} )\{(L- (X^{T}X)^{-1} X^{T} )\}^{T}\\
&=\sigma^{2}LL^{T}+V(\hat{\boldsymbol {\beta}})  \hspace{2em}(  (5), (4)代入) \tag{6}
\end{align}$
式(6)の対角成分について、右辺第１項は非負となる。したがって一般の不偏線形推定量の最小値が最小二乗推定量となり、最小二乗推定量は最良線形不偏推定量（BLUE）となることが示された。

---

- 前提1は$X$が期待値や分散の関数の引数に掛け算としてあるときに関数全体の掛け算に式変形したり($E(Xy)=XE(y)$)、分散の引数で足し算で入っているときに無視する式変形($V(y+X\beta)=V(y)$)に利用
- $\tilde{\boldsymbol {\beta}} $の定義で毎回もやっとする。ちゃんと考えると一般性を失っていないことがわかる
- 式(4)は推定係数の分散がわかるので、有意性の検定に利用できる
